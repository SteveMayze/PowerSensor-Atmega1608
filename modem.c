#include "modem.h"


uint64_t coord_addresss;

ModemResponse_t response;
uint8_t buffer[70];

void modem_open(uint64_t coordinator){
    coord_addresss = coordinator;
}

uint64_t modem_get_coord_addr(){
    return coord_addresss;
}

void modem_close(void){
    
}

ModemResponse_t* modem_receive_message(void){
    printf("modem_receive_message: BEGIN\n");
    response.operation = DATAACK;
    response.data_length = 0;
    printf("modem_receive_message: END\n");
    return &response;
}
    
    