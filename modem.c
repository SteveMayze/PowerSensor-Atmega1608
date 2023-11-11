
#include "build-config.h"
#include "modem.h"
#include "mcc_generated_files/include/usart0.h"
#include <string.h>
#include <util/delay.h>
#include "eprom.h"

uint64_t coord_addresss;

ModemResponse_t response;
struct xbee_tx_status s;


void modem_initialise(){
    LOG_DEBUG("modem_initialise \n");
    
    MODEM_RESET_SetHigh();   
    MODEM_SLEEP_SetLow();
}

uint64_t modem_get_coord_addr(){
    uint64_t addr = 0;
    eprom_read_addr(&addr);
    if(addr != 0xFFFFFFFFFFFFFFFF && addr != coord_addresss){
        coord_addresss = addr;
        LOG_INFO("modem_get_coord_addr: Getting addr EEPROM: %04X %04X %04X %04X\n", 
                (uint16_t)(coord_addresss >> 48)&0xFFFF, 
                (uint16_t)(coord_addresss >> 32)&0xFFFF, 
                (uint16_t)(coord_addresss >> 16)&0xFFFF, 
                (uint16_t)(coord_addresss)&0xFFFF);    
    } else {
        LOG_INFO("modem_get_coord_addr: Getting addr cache: %04X %04X %04X %04X\n", 
                (uint16_t)(coord_addresss >> 48)&0xFFFF, 
                (uint16_t)(coord_addresss >> 32)&0xFFFF, 
                (uint16_t)(coord_addresss >> 16)&0xFFFF, 
                (uint16_t)(coord_addresss)&0xFFFF);    
    }
    return coord_addresss;
}

void modem_set_coord_addr(uint64_t addr){
    coord_addresss = addr;
    LOG_INFO("modem_set_coord_addr: Writing the addr to EEPROM: %04X %04X %04X %04X\n", 
            (uint16_t)(coord_addresss >> 48)&0xFFFF, 
            (uint16_t)(coord_addresss >> 32)&0xFFFF, 
            (uint16_t)(coord_addresss >> 16)&0xFFFF, 
            (uint16_t)(coord_addresss)&0xFFFF);    
    eprom_write_addr(&coord_addresss);
}


void modem_open(uint64_t coordinator){
    LOG_DEBUG("modem_open \n");
    coord_addresss = coordinator;
    // Reset the modem ~{RESET} pin...
    MODEM_SLEEP_SetLow();
    _delay_ms(500);
    MODEM_RESET_SetLow();
    MODEM_RESET_SetHigh();  
    _delay_ms(1000);
}

void modem_close(void){
    LOG_DEBUG("modem_close \n");
    MODEM_SLEEP_SetHigh();    
}


uint8_t rx_buffer[USART0_RX_BUFFER_SIZE];
struct xbee_rx_packet p;
uint8_t rx_pkt_data[90];

ModemResponse_t* modem_receive_message(void){
    LOG_DEBUG("modem_receive_message: BEGIN\n");
    
    // Receive XBee message
    uint8_t buffer_ptr = 0;
    bool inSync = false;
    while(USART0_IsRxReady()){
        uint8_t byte = USART0_Read();
        if(byte == 0x7E)
            inSync = true;
        if(inSync){
            rx_buffer[buffer_ptr++] = byte;
        }
    }
    LOG_BYTE_STREAM("Received Data: ", rx_buffer, buffer_ptr);

    response.frame_type = rx_buffer[3];
    LOG_DEBUG("Frame type: %02X \n", response.frame_type);
    switch (response.frame_type) {
        case XBEE_FT_TX_RESPONSE:
            LOG_DEBUG("Modem Status \n");
            xbee_frame_to_tx_status(rx_buffer, &s);
            response.operation = NODE_TOKEN_VOID;
            break;
        case XBEE_FT_RX_RECIEVED:
            LOG_DEBUG("Modem Rx Request \n");
            p.data = rx_pkt_data;
            xbee_frame_to_rx_packet(rx_buffer, &p);
            if(modem_get_coord_addr() == XBEE_ADDR_BROADCAST){
                modem_set_coord_addr(p.addr);
            }
            response.operation = p.data[1];
            response.data_length = p.len;
            response.data = p.data;
            LOG_DEBUG("Received  length: %d \n", p.len);
            break;
        default:
            response.operation = NODE_TOKEN_VOID;
            break;
    }
    
    // This should only be set on Data request
    response.operation = p.data[1];
    response.data_length = p.len;
    response.data = p.data;
    
    LOG_DEBUG("modem_receive_message: END\n");
    return &response;
}
    
bool modem_message_arrived(void){
    return USART0_IsRxReady();
}    

struct xbee_tx_request r;
struct xbee_frame *f;

void modem_send_message(unsigned char* node_message, uint8_t data_length){
    LOG_DEBUG("modem_send_message: BEGIN \n");
    
    // The message stream is actually a node message stream. This needs to be
    // converted to an XBee message stream and then written to the XBee using
    // the USART0_Write. This is not like the TW0 API that uses a finite state
    // machine to set a buffer and then write the content - which could be 
    // simpler
    
    r.addr = modem_get_coord_addr();
    r.network = 0xFFFE;
    r.radius = 0;
    r.opts = 0;
    r.data = node_message;
    r.len =  data_length;

    f = xbee_create_tx_request_frame(0x00, &r);

    unsigned int size;
    unsigned char *bytes;
    bytes = xbee_frame_to_bytes(f, &size);
    LOG_BYTE_STREAM("Sending: ", bytes, size);
    for(int idx = 0; idx<size; idx++){
        USART0_Write(bytes[idx]);
    }

    LOG_DEBUG("modem_send_message: END\n");
}

