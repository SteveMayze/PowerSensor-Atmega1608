
#include "node.h"
#include "sensor_core.h"

uint8_t sid_[10] =   {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};


node_status_t node_intitialise(){
    
    sensor_core_read_serial_no(sid_);
    
    return NODE_STATE_OK;
}

struct node_message *node_create_message() {
	struct node_message *message = malloc(sizeof(struct node_message));
    return message;
}
