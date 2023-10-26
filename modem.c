
#include "modem.h"
#include "mcc_generated_files/include/usart0.h"
#include <string.h>
#include <util/delay.h>

//#define LOGGER_INFO
//#define LOGGER_DEBUG

#include "logger.h"

uint64_t coord_addresss;

ModemResponse_t response;
struct xbee_tx_status s;

void modem_open(uint64_t coordinator){
    coord_addresss = coordinator;
    // Reset the modem ~{RESET} pin...
    MODEM_RESET_SetLow();
    MODEM_RESET_SetHigh();  
    _delay_ms(1000);
}

uint64_t modem_get_coord_addr(){
    return coord_addresss;
}

void modem_close(void){
    
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
//    if(USART0_IsRxReady()){
//        uint8_t byte=USART0_Read();
//        while(byte!= 0x7E){
//            LOG_DEBUG(". ");
//            byte=USART0_Read();
//        }
//        LOG_DEBUG("\n ");
//        rx_buffer[buffer_ptr++] = byte;
//        rx_buffer[buffer_ptr++] = USART0_Read();
//        rx_buffer[buffer_ptr++] = USART0_Read();
//        uint16_t len;
//        memcpy(&len, &rx_buffer[4], sizeof(len));
//        len = endian_swap_64(len);   
//        
//        for(uint8_t i=0;i<len;i++){
//            rx_buffer[buffer_ptr++] = USART0_Read();
//        }
//        rx_buffer[buffer_ptr++] = USART0_Read();
//    }

    
    // uint8_t buffer_length = buffer_ptr;
    
    // Traverse the buffer since this will be an XBEE message
    // and extract the data. 
    
    // What if this message is not correct - The operation could be set to some 
    // error/unknown operation that can be dealt with like a timeout.
    
    // This data then needs to be traversed again to extract the actual
    // node message
    LOG_DEBUG("Received: size: %d, data: ", buffer_ptr);
    for(int idx = 0; idx<buffer_ptr; idx++){
        LOG_DEBUG("%02X ", rx_buffer[idx]);
    }
    LOG_DEBUG("\n");
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
            coord_addresss = p.addr;
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
    coord_addresss = p.addr;
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
    
    r.addr = coord_addresss;
    r.network = 0xFFFE;
    r.radius = 0;
    r.opts = 0;
    r.data = node_message;
    r.len =  data_length;

    f = xbee_create_tx_request_frame(0x00, &r);

    unsigned int size;
    unsigned char *bytes;
    bytes = xbee_frame_to_bytes(f, &size);
    LOG_DEBUG("Sending: ");
    for(int idx = 0; idx<size; idx++){
        LOG_DEBUG("%02X ", bytes[idx]);
    }
    LOG_DEBUG("\n");
    for(int idx = 0; idx<size; idx++){
        USART0_Write(bytes[idx]);
    }

    LOG_DEBUG("modem_send_message: END\n");
}

