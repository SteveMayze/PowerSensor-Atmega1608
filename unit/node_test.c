#include "node_test.h"
#include "unity.h"
#include "../node.h"
#include <stdlib.h>
#include "../mocks/Mockmodem.h"
#include "../mocks/Mockeprom.h"
#include "../mocks/MockINA219.h"


uint8_t node_test_sid[10] = {0x02 , 0xC0 , 0x2B , 0xE2 , 0x09 , 0xC0 , 0x2D , 0xE2 , 0x07 , 0xC0};



ModemResponse_t datareq_response;
ModemResponse_t dataack_response;

ModemResponse_t nodeintroreq_response;
ModemResponse_t nodeintroack_response;

INA219_Data_t ina219_data;

ModemResponse_t *get_dataReq_response(){
    return &datareq_response;
}

ModemResponse_t *get_dataack_response(){
    return &dataack_response;
}

ModemResponse_t *get_nodeintroreq_response(){
    return &datareq_response;
}

ModemResponse_t *get_nodeintroack_response(){
    return &dataack_response;
}

uint8_t message_stream[128] = { 0 }; 


bool datareq_response_flag = false;
bool dataack_response_flag = false;
bool nodeintroreq_response_flag = false;
bool nodeintroack_response_flag = false;
bool timeout_response_flag = false;

void test_handle_datareq_response(){
    printf("test_handle_datareq_response: Handle DATAREQ - Collect information\n");
    // Collect the data from the INA219
    datareq_response_flag = true;
}

void test_handle_dataack_response(){
    printf("test_handle_dataack_response: Handle DATAACK - Success. Go back to sleep\n");
    dataack_response_flag = true;
}

void test_handle_nodeintroreq_response(){
    printf("test_handle_nodeintroreq_response: Handle NODEINTROREQ - Collect the details of the node\n");
    nodeintroreq_response_flag = true;
}

void test_handle_nodeintroack_response(){
    printf("test_handle_nodeintroack_response: Handle NODEINTROACK - Success. Go back to sleep\n");
    nodeintroack_response_flag = true;
}

void test_handle_timeout(){
    printf("test_handle_timeout: Handle timeout\n");
    timeout_response_flag = true;
}

/**
 * Verify the creation of the message and the READY, DATA send API is called.
 */
void ready_datareq_dataack_test(){
    datareq_response_flag = false;
    timeout_response_flag = false;
    
    eprom_read_serial_id_ExpectAndReturn(node_test_sid);
    node_intitialise();


    // For READY, the payload is empty.
    // This is where I need to refer to the Python gateway for the 
    // structure.
    printf("\nready_datareq_dataack_test: READY DATAREQ DATAACK message test\n");
    ModemResponse_t* datareq_response_ptr = get_dataReq_response();    
    ModemResponse_t* dataack_response_ptr = get_dataack_response();
    
    datareq_response.operation = NODE_TOKEN_DATAREQ;  
    dataack_response.operation = NODE_TOKEN_DATAACK;
    
    modem_open_Expect(XBEE_ADDR_BROADCAST);
    modem_close_Expect();
    modem_message_arrived_ExpectAndReturn(true);
    modem_receive_message_ExpectAndReturn(datareq_response_ptr);

    modem_message_arrived_ExpectAndReturn(true);
    modem_receive_message_ExpectAndReturn(dataack_response_ptr);

    Node_Message_t *actual = node_create_message(NODE_TOKEN_READY, node_test_sid);
    
    TEST_ASSERT_GREATER_THAN(0, sizeof(actual) );
    TEST_ASSERT_EQUAL_HEX8_ARRAY(node_test_sid, actual->sid, 5);  
    TEST_ASSERT_EQUAL(NODE_TOKEN_READY, actual->operation);
    
    printf("\nready_datareq_dataack_test: Testing the send operation for READY\n");
    node_set_timeout(0x000F);
    fsm_set_event_callback(FSM_DATAREQ, test_handle_datareq_response);
    fsm_set_event_callback(FSM_DATAACK, test_handle_dataack_response);
    fsm_set_event_callback(FSM_TIMEOUT, test_handle_timeout);
    
    node_check();
    
    TEST_ASSERT_EQUAL(NODE_OK, node_close());
    TEST_ASSERT_EQUAL(true, datareq_response_flag);
    TEST_ASSERT_EQUAL(true, dataack_response_flag);
    TEST_ASSERT_EQUAL(false, timeout_response_flag);
}

/**
 * Verify the creation of the message and the READY, NODEINFO send API is called
 */
void ready_nodeintroreq_nodeintroack_test(){
    
    nodeintroreq_response_flag = false;
    timeout_response_flag = false;
    eprom_read_serial_id_ExpectAndReturn(node_test_sid);
    node_intitialise();
    
    // For READY, the payload is empty.
    // This is where I need to refer to the Python gateway for the 
    // structure.
    printf("\nready_nodeintroreq_nodeintroack_test: READY NODEINTROREQ NODEINTROACK message test\n");
    ModemResponse_t* nodeintroreq_response_ptr = get_nodeintroreq_response();    
    ModemResponse_t* nodeintroack_response_ptr = get_nodeintroack_response();
    
    datareq_response.operation = NODE_TOKEN_NODEINTROREQ;  
    dataack_response.operation = NODE_TOKEN_NODEINTROACK;
    
    modem_open_Expect(XBEE_ADDR_BROADCAST);
    modem_close_Expect();
    modem_message_arrived_ExpectAndReturn(true);
    modem_receive_message_ExpectAndReturn(nodeintroreq_response_ptr);

    modem_message_arrived_ExpectAndReturn(true);
    modem_receive_message_ExpectAndReturn(nodeintroack_response_ptr);

    Node_Message_t *actual = node_create_message(NODE_TOKEN_READY, node_test_sid);
    
    TEST_ASSERT_GREATER_THAN(0, sizeof(actual) );
    TEST_ASSERT_EQUAL_HEX8_ARRAY(node_test_sid, actual->sid, 5);  
    TEST_ASSERT_EQUAL(NODE_TOKEN_READY, actual->operation);
    
    printf("\nready_nodeintroreq_nodeintroack_test: Testing the send operation for READY\n");
    node_set_timeout(0x000F);
    fsm_set_event_callback(FSM_NODEINTROREQ, test_handle_nodeintroreq_response);
    fsm_set_event_callback(FSM_NODEINTROACK, test_handle_nodeintroack_response);
    fsm_set_event_callback(FSM_TIMEOUT, test_handle_timeout);
    
    node_check();
    
    TEST_ASSERT_EQUAL(NODE_OK, node_close());
    TEST_ASSERT_EQUAL(true, nodeintroreq_response_flag);
    TEST_ASSERT_EQUAL(true, nodeintroack_response_flag);
    TEST_ASSERT_EQUAL(false, timeout_response_flag);
}




/**
 * Verify the creation of the message and the READY send API is called.
 */
void node_timeout_test(){
    
    datareq_response_flag = false;
    timeout_response_flag = false;

    // For READY, the payload is empty.
    // This is where I need to refer to the Python gateway for the 
    // structure.
    printf("\nnode_timeout_test: TIMEOUT message test\n");

    modem_open_Expect(XBEE_ADDR_BROADCAST);
    modem_close_Expect();
    
    modem_message_arrived_ExpectAndReturn(false);
    modem_message_arrived_ExpectAndReturn(false);
    modem_message_arrived_ExpectAndReturn(false);

    Node_Message_t *actual = node_create_message(NODE_TOKEN_READY, node_test_sid);
    TEST_ASSERT_GREATER_THAN(0, sizeof(actual) );
    TEST_ASSERT_EQUAL_HEX8_ARRAY(node_test_sid, actual->sid, 10);  
    TEST_ASSERT_EQUAL(NODE_TOKEN_READY, actual->operation);
    
    printf("\nnode_timeout_test: Testing the timeout operation\n");
    node_set_timeout(0x0002);
    fsm_set_event_callback(FSM_TIMEOUT, test_handle_timeout);
    
    node_check();
    
    TEST_ASSERT_EQUAL(NODE_OK, node_close());
    TEST_ASSERT_EQUAL(true, timeout_response_flag);
    
}


/**
 * Tests the interaction with the INA210 domain module.
 */
void ready_data_collection_test(){
    eprom_read_serial_id_ExpectAndReturn(node_test_sid);
    node_intitialise();

    printf("\nready_data_collection_test: READY DATAREQ - Data Collection Data Send and then DATAREQ\n");
    
    INA219_Data_t* ina219Data_ptr = &ina219_data;
    INA219_getReadings_ExpectAndReturn(ina219Data_ptr);
    ina219_data.bus_voltage = 10.5;
    ina219_data.shunt_voltage = 1.0;
    ina219_data.current = 2.5;
    
    ModemResponse_t* datareq_response_ptr = get_dataReq_response();    
    ModemResponse_t* dataack_response_ptr = get_dataack_response();
    
    datareq_response.operation = NODE_TOKEN_DATAREQ;  
    dataack_response.operation = NODE_TOKEN_DATAACK;
    
    modem_open_Expect(XBEE_ADDR_BROADCAST);
    modem_close_Expect();
    modem_message_arrived_ExpectAndReturn(true);
    modem_receive_message_ExpectAndReturn(datareq_response_ptr);

    modem_message_arrived_ExpectAndReturn(true);
    modem_receive_message_ExpectAndReturn(dataack_response_ptr);

    Node_Message_t *actual = node_create_message(NODE_TOKEN_READY, node_test_sid);
    
    TEST_ASSERT_GREATER_THAN(0, sizeof(actual) );
    TEST_ASSERT_EQUAL_HEX8_ARRAY(node_test_sid, actual->sid, 5);  
    TEST_ASSERT_EQUAL(NODE_TOKEN_READY, actual->operation);
    
    printf("\nready_data_collection_test: Testing the send operation for DATAREQ\n");
    node_set_timeout(0x000F);
    // This time, set up the real call-backs to go through the motions.
    fsm_set_event_callback(FSM_DATAREQ, node_data_collection);
    fsm_set_event_callback(FSM_DATAACK, node_data_received);
    
    fsm_set_event_callback(FSM_TIMEOUT, test_handle_timeout);

    
    uint8_t message_length = node_message_to_stream(actual, message_stream);
    uint8_t expected_message_length = 20;
    TEST_ASSERT_EQUAL(expected_message_length, message_length);
    
    modem_send_message_Expect(message_stream, message_length);
    uint8_t expected_message[128] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    TEST_ASSERT_EQUAL_INT8_ARRAY(expected_message, message_stream, message_length);
    
    
    node_check();
    
    // The MockINA219 should be checked to ensure that the data was read.
    // The Mock-modem should be checked to ensure the correct message was sent.
    
    TEST_ASSERT_EQUAL(10.5, ina219_data.bus_voltage);
    
    TEST_ASSERT_EQUAL(NODE_TOKEN_BUS_VOLTAGE, actual->data_token[0]);
    TEST_ASSERT_EQUAL(10.5, actual->data_value[0]);
    
    TEST_ASSERT_EQUAL(NODE_TOKEN_SHUNT_VOLTAGE, actual->data_token[1]);
    TEST_ASSERT_EQUAL(1.0, actual->data_value[1]);
    
    TEST_ASSERT_EQUAL(NODE_TOKEN_LOAD_CURRENT, actual->data_token[2]);
    TEST_ASSERT_EQUAL(2.5, actual->data_value[2]);
    
    
    TEST_ASSERT_EQUAL(NODE_OK, node_close());

}

void ready_node_intro_test(){
    
    nodeintroreq_response_flag = false;
    timeout_response_flag = false;
    eprom_read_serial_id_ExpectAndReturn(node_test_sid);
    node_intitialise();
    
    // For READY, the payload is empty.
    // This is where I need to refer to the Python gateway for the 
    // structure.
    printf("\nready_node_intro_test: Testing the send intro information for NODEINTROREQ\n");
    ModemResponse_t* nodeintroreq_response_ptr = get_nodeintroreq_response();    
    ModemResponse_t* nodeintroack_response_ptr = get_nodeintroack_response();
    
    datareq_response.operation = NODE_TOKEN_NODEINTROREQ;  
    dataack_response.operation = NODE_TOKEN_NODEINTROACK;
    
    modem_open_Expect(XBEE_ADDR_BROADCAST);
    modem_close_Expect();
    modem_message_arrived_ExpectAndReturn(true);
    modem_receive_message_ExpectAndReturn(nodeintroreq_response_ptr);

    modem_message_arrived_ExpectAndReturn(true);
    modem_receive_message_ExpectAndReturn(nodeintroack_response_ptr);

    Node_Message_t *actual = node_create_message(NODE_TOKEN_READY, node_test_sid);
    
    TEST_ASSERT_GREATER_THAN(0, sizeof(actual) );
    TEST_ASSERT_EQUAL_HEX8_ARRAY(node_test_sid, actual->sid, 5);  
    TEST_ASSERT_EQUAL(NODE_TOKEN_READY, actual->operation);
    
    printf("\nready_node_intro_test: Testing the send operation for READY\n");
    node_set_timeout(0x000F);
//    fsm_set_event_callback(FSM_NODEINTROREQ, node_intro_callback);
//    fsm_set_event_callback(FSM_NODEINTROACK, node_intro_ack_callback);
    fsm_set_event_callback(FSM_TIMEOUT, test_handle_timeout);
    
    node_check();

}


/**
 * A node is a generic device. It will follow the pattern of
 * 
 *  wake
 *  start the modem
 *  send a READY
 *  wait for a response
 *  On timeout, record this and go back to sleep
 * 
 *  on expected response, take the next step.
 *  on false response, record this and go back to sleep.
 * 
 * 
 * @return 
 */
int run_node_tests(){
    UnityBegin("node_test");
    
    RUN_TEST(ready_datareq_dataack_test);
    RUN_TEST(ready_nodeintroreq_nodeintroack_test);
    RUN_TEST(node_timeout_test);
    
    RUN_TEST(ready_data_collection_test);
    // RUN_TEST(ready_node_intro_test);

    UnityEnd();
    return 0;   
 
}


