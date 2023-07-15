
#include "node.h"
#include "sensor_core.h"
#include  "eprom.h"
#include <string.h>

uint8_t sid[10];

struct node_message message;
callback_t node_callbacks[9];


/**
 * Initialse the data structures for creating and sending a message
 * @return 
 */
node_status_t node_intitialise(){
     uint8_t *sid_ = eprom_read_serial_id();
     
    printf("node_initialise: sid: %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X\n", 
      sid_[0], sid_[1], sid_[2], sid_[3], sid_[4], sid_[5], sid_[6], sid_[7], sid_[8], sid_[9]);
    
    return NODE_STATE_OK;
}

/**
 * Create a node message
 * 
 * @return 
 */
struct node_message* node_create_message(Operation_t operation, uint8_t *sid) {

    message.sid = sid;
    message.operation = OPERATION_GROUP | operation;
    return &message;
}

void node_set_callback(Operation_t operation, callback_t cb){
    printf("Setting callback for the operation: %02X\n", operation);
    node_callbacks[operation] = cb;
}


void node_send_message(){
    printf("Sending the message for operation; %02X\n", message.operation);
    switch(message.operation & 0x0F){
        case READY:
            node_callbacks[READY]();
            break;
        default:
            break;
    }
}
