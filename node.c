
#include "node.h"
#include "sensor_core.h"
#include  "eprom.h"
#include <string.h>

uint8_t sid[10];

struct node_message message;


typedef struct {
    callback_t callbacks[8];
    void * callback_payload[8];
    Operation_t state;
} Node_Status_t;
Node_Status_t node_status = {0};

typedef Operation_t(stateHandlerFunction)(void);

// Prototype for the state handlers.
static Operation_t NODE_SEND_READY(void);

// An array to collect the state handlers
stateHandlerFunction *node_state_table[] = {
    NODE_SEND_READY,
};

/**
 * Initialise the data structures for creating and sending a message
 * @return 
 */
node_error_t node_intitialise(){
     uint8_t *sid_ = eprom_read_serial_id();
     
    printf("node_initialise: sid: %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X\n", 
      sid_[0], sid_[1], sid_[2], sid_[3], sid_[4], sid_[5], sid_[6], sid_[7], sid_[8], sid_[9]);
    
    return NODE_NOERR;
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

void node_set_callback(Operation_t operation, callback_t cb, void *payload){
    printf("Setting callback for the operation: %02X\n", operation);
    node_status.callbacks[operation] = cb;
    node_status.callback_payload[operation] = payload;
}


void node_send_message(){
    printf("Sending the message for operation; %02X\n", message.operation);
}

void node_isr() {
    
    node_status.state = node_state_table[node_status.state]();
    
}

Operation_t NODE_SEND_READY(void)
{
    switch(message.operation & 0x0F){
       case READY:
           // Send message
           // wait for response
           // handle the response based on a request or a timeout.
           node_status.callbacks[READY]();
           break;
       default:
           break;
    }
    return IDLE;
}
    
