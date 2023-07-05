#include "modem.h"


uint64_t coord_addresss;

void modem_initialise(uint64_t coordinator){
    coord_addresss = coordinator;
}

uint64_t modem_get_coord_addr(){
    return coord_addresss;
}
