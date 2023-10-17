
#include "modem.h"
#include "mcc_generated_files/include/usart0.h"
#include <string.h>


uint64_t coord_addresss;

ModemResponse_t response;
uint8_t buffer[70];

void modem_open(uint64_t coordinator){
    coord_addresss = coordinator;
    // Reset the modem ~{RESET} pin...
    MODEM_RESET_SetLow();
    MODEM_RESET_SetHigh();    
}

uint64_t modem_get_coord_addr(){
    return coord_addresss;
}

void modem_close(void){
    
}


uint8_t rx_buffer[USART0_RX_BUFFER_SIZE];
struct xbee_rx_packet p;

ModemResponse_t* modem_receive_message(void){
    printf("modem_receive_message: BEGIN\n");
    
    // Receive XBee message
    uint8_t buffer_ptr = 0;
    while(USART0_IsRxReady()){
        rx_buffer[buffer_ptr++] = USART0_Read();
    }
    
    // uint8_t buffer_length = buffer_ptr;
    
    // Traverse the buffer since this will be an XBEE message
    // and extract the data. 
    
    // What if this message is not correct - The operation could be set to some 
    // error/unknown operation that can be dealt with like a timeout.
    
    // This data then needs to be traversed again to extract the actual
    // node message
    
    xbee_frame_to_rx_packet(rx_buffer, &p);
    
    // This should only be set on Data request
    coord_addresss = p.addr;
    response.operation = p.data[1];
    response.data_length = p.len;
    response.data = p.data;
    
    printf("modem_receive_message: END\n");
    return &response;
}
    
bool modem_message_arrived(void){
    return USART0_IsRxReady();
}    

struct xbee_tx_request r;
struct xbee_frame *f;

void modem_send_message(unsigned char* node_message, uint8_t data_length){
    printf("modem_send_message: BEGIN \n");
    
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

    f = xbee_create_tx_request_frame(0x01, &r);

    unsigned int size;
    unsigned char *bytes;
    bytes = xbee_frame_to_bytes(f, &size);
    printf("Sending: ");
    for(int idx = 0; idx<size; idx++){
        printf("%02X ", bytes[idx]);
        USART0_Write(bytes[idx]);
    }
    printf("\n");

    printf("modem_send_message: END\n");
}

