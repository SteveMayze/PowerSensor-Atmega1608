
#include "modem.h"
#include "mocks/Mockusart0.h"


uint64_t coord_addresss;

ModemResponse_t response;
uint8_t buffer[70];

void modem_open(uint64_t coordinator){
    coord_addresss = coordinator;
    // Reset the modem...
    MODEM_RESET_SetLow();
    MODEM_RESET_SetHigh();    
}

uint64_t modem_get_coord_addr(){
    return coord_addresss;
}

void modem_close(void){
    
}


uint8_t rx_buffer[USART0_RX_BUFFER_SIZE];

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
    
    
    response.operation = FSM_DATAACK;
    response.data_length = 0;
    response.data = buffer;
    
    printf("modem_receive_message: END\n");
    return &response;
}
    
bool modem_message_arrived(void){
    return USART0_IsRxReady();
}    

void modem_send_message(ModemResponse_t *modem_message){
    printf("modem_send_message: BEGIN\n");
    
    // The message stream is actually a node message stream. This needs to be
    // converted to an XBee message stream and then written to the XBee using
    // the USART0_Write. This is not like the TW0 API that uses a finite state
    // machine to set a buffer and then write the content - which could be 
    // simpler
    
    printf("modem_send_message: END\n");
}

