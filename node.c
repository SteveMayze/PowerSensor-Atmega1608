
#include "node.h"
#include "sensor_core.h"
#include  "eprom.h"
#include <string.h>
#include "modem.h"

#ifndef F_CPU
#define F_CPU 1000000UL
#endif

#include <util/delay.h>

uint8_t sid[10];

struct node_message message;


typedef struct {
    uint64_t coordinator_addr;
    callback_t  callbacks[8];
    void *      callback_payload[8];
    Operation_t state;
    uint16_t timeout;
    uint16_t timeout_value;
    unsigned    busy : 1;
} Node_State_t;
Node_State_t node_state = {0};

typedef Operation_t(stateHandlerFunction)(void);

// Prototype for the state handlers.
static Operation_t NODE_SEND_READY(void);
static Operation_t NODE_RESET(void);
static Operation_t NODE_IDLE(void);
static Operation_t NODE_TIMEOUT(void);
static Operation_t NODE_VOID(void);

/*
        0   IDLE = 0,
        1   READY,
        2   DATAREQ,
        3   DATA,
        4   DATAACK,
        5   NODEINTROREQ,
        6   NODEINTRO,
        7   NODEINTROACK,
        8   RESET,
        9   TIMEOUT
 
 */

// An array to collect the state handlers
stateHandlerFunction *node_state_table[] = {
    NODE_IDLE,
    NODE_SEND_READY,
    NODE_VOID,
    NODE_VOID,
    NODE_VOID,
    NODE_VOID,
    NODE_VOID,
    NODE_VOID,
    NODE_RESET,
    NODE_TIMEOUT,
};

/**
 * Initialise the data structures for creating and sending a message
 * @return 
 */
Error_t node_intitialise(){
     uint8_t *sid_ = eprom_read_serial_id();
     
    printf("node_initialise: sid: %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X\n", 
      sid_[0], sid_[1], sid_[2], sid_[3], sid_[4], sid_[5], sid_[6], sid_[7], sid_[8], sid_[9]);
    node_state.busy = 0;
    node_state.state = RESET;
    node_state.coordinator_addr = XBEE_ADDR_BROADCAST;
    return NODE_OK;
}

/**
 * Sets the call timeout - in seconds.
 * When expired, the state machine will return to idle but will call
 * the timeout call back.
 * 
 * @param timeout
 */
void node_set_timeout(uint16_t timeout){
    node_state.timeout_value = timeout;
}


Error_t node_close(){
    if(node_state.busy)
        return NODE_BUSY;
    
    return NODE_OK;
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
    printf("node_set_callback: Setting callback for the operation: %02X\n", operation);
    node_state.callbacks[operation] = cb;
    node_state.callback_payload[operation] = payload;
}


void node_wait(){   
    // Test for any messages on the XBEE.
    _delay_ms(1000);
}

void node_fsm_execution() {
    printf("node_fsm_execution: Executing %02X\n", node_state.state);
    // Execute the current state.
    node_state.state = node_state_table[node_state.state]();
}

void node_fsm_poller(){
    printf("node_fsm_poller: BEGIN\n");
    while(node_state.busy){
        printf("node_fsm_poller: Polling...\n");
        node_wait();
        node_fsm_execution();
        if(!(node_state.timeout--))
            node_state.state = TIMEOUT;
    }
    printf("node_fsm_poller: END\n");    
}


void node_check(){
    printf("node_check: Sending the message for operation; %02X\n", message.operation);
    if( !node_state.busy){
        node_state.timeout = node_state.timeout_value;
        node_state.busy = 1;
        node_fsm_execution();
        node_fsm_poller();
    }
    modem_close();
}




Operation_t NODE_SEND_READY(void)
{
    ModemResponse_t* response;
    printf("NODE_SEND_READY: \n");

    switch(message.operation & 0x0F){
       case READY:
           // Send message
           // wait for response
           // handle the response based on a request or a timeouts
           response = modem_receive_message();
           switch(response->operation){
               case DATAACK:
                    node_state.callbacks[READY]();
                    node_state.busy = 0;
                    node_state.state =  IDLE;
                   break;
               default:
                    node_state.busy = 1;
                    node_state.state =  READY;
                   break;
           }
       default:
           break;
    }
    return IDLE;
}
    
Operation_t NODE_RESET(void){
    printf("NODE_RESET: \n");
    Operation_t ret = IDLE;
    modem_open(node_state.coordinator_addr);
    switch(message.operation & 0x0F){
        case READY:
            printf("NODE_RESET: Setting next state as READY\n");
            node_state.busy = 1;
            ret = READY;
            break;
        default:
            node_state.busy = 0;
            ret = IDLE;
            break;
    }
    return ret;
}

Operation_t NODE_IDLE(void){
    printf("NODE_IDLE: dozing...\n");
     _delay_ms(1000);
    return IDLE;
}

Operation_t NODE_TIMEOUT(void) {
    printf("NODE_TIMEOUT: \n");
    node_state.busy = 0;
    node_state.state = IDLE;
    node_state.callbacks[TIMEOUT]();
    return IDLE;
}

Operation_t NODE_VOID(void){
    printf("NODE_VOID: No implementation for %02X\n", node_state.state);
    return IDLE;
}


