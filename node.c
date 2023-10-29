#include "build-config.h"

#include "node.h"
#include "sensor_core.h"
#include  "eprom.h"
#include <string.h>
#include "modem.h"


#include <util/delay.h>

#include "logger.h"

Node_Message_t _message;


typedef struct {
    uint64_t coordinator_addr;
    Event_Callback_t event_callbacks[6];
    FSM_States_t state;
    uint16_t timeout;
    uint16_t timeout_value;
    unsigned busy : 1;
} Node_State_t;

static Node_State_t node_state;

typedef FSM_States_t(stateHandlerFunction)(uint8_t count);


// Prototype for the state handlers.
static FSM_States_t FSM_IDLE_STATE(uint8_t count);
static FSM_States_t FSM_READY_STATE(uint8_t count);
static FSM_States_t FSM_DATA_STATE(uint8_t count);
static FSM_States_t FSM_NODEINTRO_STATE(uint8_t count);
static FSM_States_t FSM_RESET_STATE(uint8_t count);

// An array to collect the state handlers
static stateHandlerFunction *fsm_state_table[] = {
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

    MODEM_RESET_SetHigh();    

    node_state.busy = 0;
    node_state.state = FSM_RESET;
    node_state.coordinator_addr = XBEE_ADDR_BROADCAST;

    fsm_set_event_callback(FSM_DATAREQ, node_data_collection);
    fsm_set_event_callback(FSM_DATAACK, node_data_received);
    fsm_set_event_callback(FSM_NODEINTROREQ, node_intro_callback);
    fsm_set_event_callback(FSM_NODEINTROACK, node_intro_ack_callback);
    fsm_set_event_callback(FSM_TIMEOUT, node_timeout_callback);

    INA219_Initialise(NODE_INA219_IIC_ADDR, NODE_INA219_PROFILE);

    return NODE_OK;
}

void set_node_state(FSM_States_t state){
    node_state.state = state;
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
    _message.data_length = 0;
    return &_message;
}

void fsm_set_event_callback(FSM_Events_t event, Event_Callback_t cb) {
    LOG_DEBUG("node_set_callback: Setting callback for the operation: %02X\n", event);
    node_state.event_callbacks[event] = cb;
}

void node_wait() {
    // Test for any messages on the XBEE.
    LOG_DEBUG("Waiting for a response - %d ms... \n", NODE_WAIT_DELAY);
    _delay_ms(NODE_WAIT_DELAY);
}

void node_fsm_execution(uint8_t count) {
    LOG_DEBUG("node_fsm_execution: Executing for state: %02X\n", node_state.state);
    // Execute the current state.
    FSM_States_t state = fsm_state_table[node_state.state](count);
    node_state.state = state;
    LOG_DEBUG("node_fsm_execution: end - new state: %02X \n", state);
}

void node_fsm_poller() {
    LOG_DEBUG("node_fsm_poller: BEGIN\n");
    uint8_t count = 0;
    while (node_state.busy) {
        LOG_DEBUG("node_fsm_poller: Polling...\n");
        node_wait();
        node_fsm_execution(count++);
        if (!(node_state.timeout--)) {
            node_state.event_callbacks[FSM_TIMEOUT](count++);
            node_state.busy = 0;
            node_state.state = FSM_IDLE;
        }

    }
    LOG_DEBUG("node_fsm_poller: END\n");
}

void node_check() {
    LOG_DEBUG("node_check: Checking for operation: %02X, state: %02X \n", _message.operation, node_state.state);
    if(node_state.state == FSM_IDLE){
        LOG_DEBUG("node_check: Coming in from idle, initiate a reset \n");
        node_state.state = FSM_RESET;
    }
    if (!node_state.busy) {
        node_state.timeout = node_state.timeout_value;
        node_state.busy = 1;
        node_fsm_execution(0);
        node_fsm_poller();
    }
    modem_close();
}

static uint8_t payload[64];
static FSM_States_t FSM_READY_STATE(uint8_t count) {
    
    LOG_DEBUG("FSM_READY_STATE: Send the READY signal and wait for the reply. count: %d \n", count);

    if (count == 0){
        LOG_INFO("FSM_READY_STATE: Sending READY \n");
        
        // Send message
        _message.operation = NODE_TOKEN_READY;
        _message.data_length = 0;
        // uint8_t payload[1];
        uint8_t size = node_message_to_stream(&_message, payload);

       modem_send_message(payload, size);
    } else {
        LOG_INFO("FSM_READY_STATE: Waiting for a response \n");
    }
    // handle the response based on a request or a timeouts
    LOG_DEBUG("FSM_READY_STATE: Checking for a response \n");
    if (modem_message_arrived()) {
        ModemResponse_t* response;
        response = modem_receive_message();
        LOG_DEBUG("FSM_READY_STATE: A message has arrived: frame_type: %d, operation: %d ", response->frame_type, response->operation);
        LOG_BYTE_STREAM(", data: ", response->data, response->data_length);
        if(response->frame_type == 0x90){
            switch (response->operation) {
                case NODE_TOKEN_DATAREQ:
                    LOG_INFO("FSM_READY_STATE: Operation NODE_TOKEN_DATAREQ - Calling the DATAREQ callback.\n");
                    // Received DATAREQ - Move to the DATA state
                    node_state.event_callbacks[FSM_DATAREQ](); // Collect the information to send
                    LOG_DEBUG("FSM_READY_STATE: Called %02X \n", FSM_DATAREQ);                
                    node_state.state = FSM_DATA;
                    node_state.busy = 1;
                    break;
                case NODE_TOKEN_NODEINTROREQ:
                    LOG_INFO("FSM_READY_STATE: Operation NODE_TOKEN_NODEINTROREQ - Calling the NODEINTRO callback.\n");
                    // Received DATAREQ - Move to the DATA state
                    node_state.event_callbacks[FSM_NODEINTROREQ](); // Collect the information to send
                    node_state.state = FSM_NODEINTRO;
                    node_state.busy = 1;
                    break;
                default:
                    LOG_INFO("FSM_READY_STATE: Not supported operation - Staying in READY \n");
                    node_state.busy = 1;
                    node_state.state = FSM_READY;
                    break;
                }
        } else {
            LOG_DEBUG("FSM_READY_STATE: Unsupported message.\n");
        }
    }
    LOG_INFO("FSM_READY_STATE: End with state: %02X \n", node_state.state);
    return node_state.state;
}

static FSM_States_t FSM_DATA_STATE(uint8_t count) {
    ModemResponse_t* response;
    LOG_DEBUG("FSM_DATA_STATE: Waiting for ack on the transmitted data count: %d \n", count);
    
    // handle the response based on a request or a timeouts
    if (modem_message_arrived()) {
        LOG_INFO("FSM_DATA_STATE: A message has arrived \n");
        response = modem_receive_message();
        switch (response->operation) {
            case NODE_TOKEN_DATAACK:
                LOG_INFO("FSM_DATA_STATE: Operation NODE_TOKEN_DATAACK - Calling the DATAACK callback.\n");
                node_state.event_callbacks[FSM_DATAACK](); // Collect the information to send
                node_state.state = FSM_IDLE;
                node_state.busy = 0;
                break;
            default:
                LOG_INFO("FSM_DATA_STATE: Not supported operation - Staying in DATA \n");
                node_state.busy = 1;
                node_state.state = FSM_DATA;
                break;
        }
    }
    LOG_DEBUG("FSM_DATA_STATE: End with state: %02X \n", node_state.state);
    return node_state.state;    
}

static FSM_States_t FSM_RESET_STATE(uint8_t count) {
    LOG_DEBUG("NODE_RESET: count: %d \n", count);
    //FSM_States_t ret = FSM_IDLE;
    modem_open(node_state.coordinator_addr);
    LOG_DEBUG("NODE_RESET: Setting next state as READY\n");
    node_state.busy = 1;
    return FSM_READY;
}


static FSM_States_t FSM_NODEINTRO_STATE(uint8_t count) {

    ModemResponse_t* response;
    LOG_DEBUG("FSM_NODEINTRO_STATE: Transmit the node information count: %d \n", count);

    // handle the response based on a request or a timeouts
    if (modem_message_arrived()) {
        LOG_INFO("FSM_NODEINTRO_STATE: A message has arrived \n");
        response = modem_receive_message();
        switch (response->operation) {
            case NODE_TOKEN_NODEINTROACK:
                LOG_DEBUG("Operation NODE_TOKEN_NODEINTROACK - Calling the NODEINTROACK callback.\n");
                node_state.event_callbacks[FSM_NODEINTROACK](); 
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


static FSM_States_t FSM_IDLE_STATE(uint8_t count) {
    LOG_DEBUG("NODE_IDLE: dozing... count: %d \n", count);
    // _delay_ms(1000);
    return FSM_IDLE;
}


void node_data_collection(){
    LOG_DEBUG("node_data_collection: BEGIN\n");
    INA219_Data_t* data = INA219_get_all_readings();
    // Move the data into the struct node_message message
    _message.operation = NODE_TOKEN_DATA;
    _message.data_length = 3;
    _message.data_token[0] = NODE_TOKEN_PROPERTY_BUS_VOLTAGE; // bus voltage
    _message.data_value[0] = data->bus_voltage;
    _message.data_token[1] = NODE_TOKEN_PROPERTY_SHUNT_VOLTAGE; // shunt voltage
    _message.data_value[1] = data->shunt_voltage;
    _message.data_token[2] = NODE_TOKEN_PROPERTY_LOAD_CURRENT; // load current
    _message.data_value[2] = data->current;
    
    LOG_INFO("node_data_collection: transmitting the collected data \n");
    // Send message
    uint8_t payload[50] = {0};
    uint8_t size = node_message_to_stream(&_message, payload);
    modem_send_message(payload, size);

    LOG_DEBUG("node_data_collection: END\n");
}


void node_data_received(void){
    LOG_DEBUG("node_data_received: BEGIN\n");
    LOG_DEBUG("node_data_received: END\n");
}


void node_intro_callback(void){
    _message.operation = NODE_TOKEN_NODEINTRO;
    _message.data_length = 5;
    _message.data_token[0] = NODE_TOKEN_HEADER_DOMAIN;
    _message.data_value[0] = NODE_METADATA_DOMAIN_POWER;
    _message.data_token[1] = NODE_TOKEN_HEADER_CLASS;
    _message.data_value[1] = NODE_METADATA_CLASS_SENSOR;
    _message.data_token[2] = NODE_TOKEN_PROPERTY;
    _message.data_value[2] = NODE_TOKEN_PROPERTY_BUS_VOLTAGE;
    _message.data_token[3] = NODE_TOKEN_PROPERTY;
    _message.data_value[3] = NODE_TOKEN_PROPERTY_SHUNT_VOLTAGE;
    _message.data_token[4] = NODE_TOKEN_PROPERTY;
    _message.data_value[4] = NODE_TOKEN_PROPERTY_LOAD_CURRENT;

    LOG_INFO("node_intro_callback: transmitting the node information \n");
    uint8_t payload[50] = {0};
    uint8_t size = node_message_to_stream(&_message, payload);
    modem_send_message(payload, size);

}

void node_intro_ack_callback(void){
    
}


uint8_t node_message_to_stream(Node_Message_t *message, uint8_t *message_stream){
    LOG_DEBUG("node_message_to_stream: BEGIN for operation %02X \n", message->operation);
    
    uint8_t message_length = 0;
    message_stream[message_length++] = NODE_TOKEN_HEADER_OPERATION;
    message_stream[message_length++] = message->operation;
    message_stream[message_length++] = NODE_TOKEN_HEADER_SERIAL_ID;
    for(uint8_t i = 0; i<10; i++){
        message_stream[message_length++] = message->sid[i];
    }
    if( NODE_TOKEN_DATA == message->operation){
        LOG_INFO("Parsing the data for NODE_TOKEN_DATA \n");
        uint8_t buffer[4];
        for(uint8_t i=0; i<message->data_length; i++){
            message_stream[message_length++] = message->data_token[i];
            float fValue = message->data_value[i];
            sensor_core_convert_float_to_binary(&fValue, buffer);
            for(uint8_t j = 0; j<4; j++){
                message_stream[message_length++] = buffer[j];
            }
        }
    }
    if( NODE_TOKEN_NODEINTRO == message->operation){
        LOG_INFO("Parsing the data for NODE_TOKEN_NODEINTRO \n");
        for(uint8_t i=0; i<message->data_length; i++){
            message_stream[message_length++] = message->data_token[i];
            message_stream[message_length++] = message->data_value[i];
        }
    }

    LOG_DEBUG("node_message_to_stream: END message_length: %d\n", message_length);
    return message_length;
}

void node_timeout_callback(void){
    LOG_DEBUG("test_handle_timeout: Handle timeout \n");
}
   