
#include "node.h"
#include "sensor_core.h"
#include  "eprom.h"
#include <string.h>

uint8_t sid[10];

struct node_message message;


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
struct node_message* node_create_ready_message(uint8_t *sid) {

    message.sid = sid;
    message.operation = NODE_OPERATION_READY;
    return &message;
}
