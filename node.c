
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

Node_Message_t _message;

typedef struct {
    uint64_t coordinator_addr;
    Event_Callback_t event_callbacks[6];
    FSM_States_t state;
    uint16_t timeout;
    uint16_t timeout_value;
    unsigned busy : 1;
} Node_State_t;
Node_State_t node_state = {0};

typedef FSM_States_t(stateHandlerFunction)(void);


// Prototype for the state handlers.
static FSM_States_t FSM_IDLE_STATE(void);
static FSM_States_t FSM_READY_STATE(void);
static FSM_States_t FSM_DATA_STATE(void);
static FSM_States_t FSM_RESET_STATE(void);
static FSM_States_t FSM_NODEINTRO_STATE(void);

// An array to collect the state handlers
stateHandlerFunction *fsm_state_table[] = {
    FSM_IDLE_STATE,
    FSM_READY_STATE,
    FSM_DATA_STATE,
    FSM_NODEINTRO_STATE,
    FSM_RESET_STATE,    
};

/**
 * Initialise the data structures for creating and sending a message
 * @return 
 */
Error_t node_intitialise() {
    uint8_t *sid_ = eprom_read_serial_id();

    printf("node_initialise: sid: %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X\n",
            sid_[0], sid_[1], sid_[2], sid_[3], sid_[4], sid_[5], sid_[6], sid_[7], sid_[8], sid_[9]);
    node_state.busy = 0;
    node_state.state = FSM_RESET;
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
void node_set_timeout(uint16_t timeout) {
    node_state.timeout_value = timeout;
}

Error_t node_close() {
    if (node_state.busy)
        return NODE_BUSY;

    return NODE_OK;
}

/**
 * Create a node message
 * 
 * @return 
 */
Node_Message_t* node_create_message(Token_t token, uint8_t *sid) {

    _message.sid = sid;
    _message.operation = token;
    return &_message;
}

void fsm_set_event_callback(FSM_Events_t event, Event_Callback_t cb) {
    printf("node_set_callback: Setting callback for the operation: %02X\n", event);
    node_state.event_callbacks[event] = cb;
}

void node_wait() {
    // Test for any messages on the XBEE.
    //_delay_ms(1000);
}

void node_fsm_execution() {
    printf("node_fsm_execution: Executing %02X\n", node_state.state);
    // Execute the current state.
    node_state.state = fsm_state_table[node_state.state]();
}

void node_fsm_poller() {
    printf("node_fsm_poller: BEGIN\n");
    while (node_state.busy) {
        printf("node_fsm_poller: Polling...\n");
        node_wait();
        node_fsm_execution();
        if (!(node_state.timeout--)) {
            node_state.event_callbacks[FSM_TIMEOUT]();
            node_state.busy = 0;
            node_state.state = FSM_IDLE;
        }

    }
    printf("node_fsm_poller: END\n");
}

void node_check() {
    printf("node_check: Sending the message for operation; %02X\n", _message.operation);
    if (!node_state.busy) {
        node_state.timeout = node_state.timeout_value;
        node_state.busy = 1;
        node_fsm_execution();
        node_fsm_poller();
    }
    modem_close();
}

FSM_States_t FSM_READY_STATE(void) {
    ModemResponse_t* response;
    printf("FSM_READY_STATE: Send the READY signal and wait for the reply.\n");

    // Send message
    // ...
    // handle the response based on a request or a timeouts
    if (modem_message_arrived()) {
        printf("A message has arrived \n");
        response = modem_receive_message();
        switch (response->operation) {
            case NODE_TOKEN_DATAREQ:
                printf("Operation NODE_TOKEN_DATAREQ - Calling the DATAREQ callback.\n");
                // Received DATAREQ - Move to the DATA state
                node_state.event_callbacks[FSM_DATAREQ](); // Collect the information to send
                node_state.state = FSM_DATA;
                node_state.busy = 1;
                break;
            case NODE_TOKEN_NODEINTROREQ:
                printf("Operation NODE_TOKEN_NODEINTROREQ - Calling the NODEINTRO callback.\n");
                // Received DATAREQ - Move to the DATA state
                node_state.event_callbacks[FSM_NODEINTROREQ](); // Collect the information to send
                node_state.state = FSM_NODEINTRO;
                node_state.busy = 1;
                break;
            default:
                node_state.busy = 1;
                node_state.state = FSM_READY;
                break;
        }
    }
    return node_state.state;
}

static FSM_States_t FSM_DATA_STATE(void) {
    ModemResponse_t* response;
    printf("FSM_DATA_STATE: transmitting the collected data\n");
    // Transmit the data collected in the FMS_DATAREQ callback.
    // ...
    // handle the response based on a request or a timeouts
    if (modem_message_arrived()) {
        printf("A message has arrived \n");
        response = modem_receive_message();
        switch (response->operation) {
            case NODE_TOKEN_DATAACK:
                printf("Operation NODE_TOKEN_DATAACK - Calling the DATAREQ callback.\n");
                node_state.event_callbacks[FSM_DATAACK](); // Collect the information to send
                node_state.state = FSM_IDLE;
                node_state.busy = 0;
                break;
            default:
                node_state.busy = 1;
                node_state.state = FSM_DATA;
                break;
        }
    }
    return node_state.state;    
}

FSM_States_t FSM_RESET_STATE(void) {
    printf("NODE_RESET: \n");
    FSM_States_t ret = FSM_IDLE;
    modem_open(node_state.coordinator_addr);
    switch (_message.operation ) {
        case NODE_TOKEN_READY:
            printf("NODE_RESET: Setting next state as READY\n");
            node_state.busy = 1;
            ret = FSM_READY;
            break;
        default:
            node_state.busy = 0;
            ret = FSM_IDLE;
            break;
    }
    return ret;
}


FSM_States_t FSM_NODEINTRO_STATE(void) {

    ModemResponse_t* response;
    printf("FSM_NODEINTRO_STATE: Transmit the node information\n");
    // Transmit the data collected in the FMS_DATAREQ callback.
    // ...
    // handle the response based on a request or a timeouts
    if (modem_message_arrived()) {
        printf("A message has arrived \n");
        response = modem_receive_message();
        switch (response->operation) {
            case NODE_TOKEN_NODEINTROACK:
                printf("Operation NODE_TOKEN_NODEINTROACK - Calling the NODEINTROACK callback.\n");
                node_state.event_callbacks[FSM_NODEINTROACK](); // Collect the information to send
                node_state.state = FSM_IDLE;
                node_state.busy = 0;
                break;
            default:
                node_state.busy = 1;
                node_state.state = FSM_NODEINTRO;
                break;
        }
    }
    return node_state.state;    


    return FSM_IDLE;
}


FSM_States_t FSM_IDLE_STATE(void) {
    printf("NODE_IDLE: dozing...\n");
    // _delay_ms(1000);
    return FSM_IDLE;
}


void node_data_collection(){
    printf("node_data_collection: BEGIN\n");
    INA219_Data_t* data = INA219_getReadings();
    // Move the data into the struct node_message message
    _message.data_length = 3;
    _message.data_token[0] = NODE_TOKEN_BUS_VOLTAGE; // bus voltage
    _message.data_value[0] = data->bus_voltage;
    _message.data_token[1] = NODE_TOKEN_SHUNT_VOLTAGE; // shunt voltage
    _message.data_value[1] = data->shunt_voltage;
    _message.data_token[2] = NODE_TOKEN_LOAD_CURRENT; // load current
    _message.data_value[2] = data->current;
    printf("node_data_collection: END\n");
}


void node_data_received(void){
    printf("node_data_received: BEGIN\n");
    printf("node_data_received: END\n");
}

uint8_t node_message_to_stream(Node_Message_t *message, uint8_t *message_stream){
    printf("node_message_to_stream: BEGIN\n");
    
    uint8_t message_length = 0;
    message_stream[message_length++] = NODE_TOKEN_HEADER_OPERATION;
    message_stream[message_length++] = message->operation;
    message_stream[message_length++] = NODE_TOKEN_HEADER_SERIAL_ID;
    for(uint8_t i = 0; i<10; i++){
        message_stream[message_length++] = message->sid[i];
    }
    uint8_t buffer[4];
    for(uint8_t i=0; i<message->data_length; i++){
        message_stream[message_length++] = message->data_token[i];
        float fValue = message->data_value[i];
        sensor_core_convert_float_to_binary(&fValue, buffer);
        for(uint8_t j = 0; j<4; j++){
            message_stream[message_length++] = buffer[j];
        }
    }

    printf("node_message_to_stream: END message_length: %d\n", message_length);
    return message_length;
}

   