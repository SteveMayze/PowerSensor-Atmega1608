#include "node_test.h"
#include "unity.h"
#include "../node.h"
#include <stdlib.h>
#include "../mocks/Mockeprom.h"
#include "../mocks/Mockmodem.h"

uint8_t test_sid[10] = {0x02 , 0xC0 , 0x2B , 0xE2 , 0x09 , 0xC0 , 0x2D , 0xE2 , 0x07 , 0xC0};

/**
 * Verify the initialisation and the setting of the Serial ID (sid).
 */
void initialise_node_test(){
    
    uint8_t *expected = test_sid;

    eprom_read_serial_id_ExpectAndReturn(expected);
    Error_t expected_status = NODE_OK;
    
    // Check the state of the modem.
    // Retrieve the Serial ID.
    // Clear out the buffers.
    Error_t actual_status = node_intitialise();

    TEST_ASSERT_EQUAL_UINT(expected_status, actual_status);

}


bool datareq_response_flag = false;
bool dataack_response_flag = false;
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

void test_handle_datareq_timeout(){
    printf("test_handle_datareq_timeout: Handle timeout\n");
    timeout_response_flag = true;
}

/**
 * Verify the creation of the message and the READY send API is called.
 */
void ready_data_message_test(){
    
    datareq_response_flag = false;
    timeout_response_flag = false;
    uint8_t *expected = test_sid;
    eprom_read_serial_id_ExpectAndReturn(expected);
    Error_t actual_status = node_intitialise();
    Error_t expected_status = NODE_OK;
    TEST_ASSERT_EQUAL_UINT(expected_status, actual_status);

    // For READY, the payload is empty.
    // This is where I need to refer to the Python gateway for the 
    // structure.
    printf("\ncreate_node_message_test: READY message test\n");
    ModemResponse_t datareq_response;
    ModemResponse_t* datareq_response_ptr = &datareq_response;
    
    ModemResponse_t dataack_response;
    ModemResponse_t* dataack_response_ptr = &dataack_response;
    
    datareq_response.operation = NODE_TOKEN_DATAREQ;  
    dataack_response.operation = NODE_TOKEN_DATAACK;
    
    modem_open_Expect(XBEE_ADDR_BROADCAST);
    modem_close_Expect();
    modem_message_arrived_ExpectAndReturn(true);
    modem_receive_message_ExpectAndReturn(datareq_response_ptr);

    modem_message_arrived_ExpectAndReturn(true);
    modem_receive_message_ExpectAndReturn(dataack_response_ptr);

    struct node_message *actual = node_create_message(NODE_TOKEN_READY, test_sid);
    
    TEST_ASSERT_GREATER_THAN(0, sizeof(actual) );
    TEST_ASSERT_EQUAL_HEX8_ARRAY(test_sid, actual->sid, 5);  
    TEST_ASSERT_EQUAL(NODE_TOKEN_READY, actual->operation);
    
    
    printf("\ncreate_node_message_test: Testing the send operation for READY\n");
    node_set_timeout(0x000F);
    fsm_set_event_callback(FSM_DATAREQ, test_handle_datareq_response, NULL);
    fsm_set_event_callback(FSM_DATAACK, test_handle_dataack_response, NULL);
    fsm_set_event_callback(FSM_TIMEOUT, test_handle_datareq_timeout, NULL);
    
    node_check();
    
    TEST_ASSERT_EQUAL(NODE_OK, node_close());
    TEST_ASSERT_EQUAL(true, datareq_response_flag);
    TEST_ASSERT_EQUAL(true, dataack_response_flag);
    TEST_ASSERT_EQUAL(false, timeout_response_flag);
    
}

/**
 * Verify the creation of the message and the READY send API is called.
 */
void node_timeout_test(){
    
    datareq_response_flag = false;
    timeout_response_flag = false;
    uint8_t *expected_sid = test_sid;
    eprom_read_serial_id_ExpectAndReturn(expected_sid);
    Error_t actual_status = node_intitialise();
    Error_t expected_status = NODE_OK;
    TEST_ASSERT_EQUAL_UINT(expected_status, actual_status);

    // For READY, the payload is empty.
    // This is where I need to refer to the Python gateway for the 
    // structure.
    printf("\ncreate_node_message_timeout_test: READY message test\n");

    modem_open_Expect(XBEE_ADDR_BROADCAST);
    modem_close_Expect();
    
    modem_message_arrived_ExpectAndReturn(false);
    modem_message_arrived_ExpectAndReturn(false);
    modem_message_arrived_ExpectAndReturn(false);

    struct node_message *actual = node_create_message(NODE_TOKEN_READY, test_sid);
    TEST_ASSERT_GREATER_THAN(0, sizeof(actual) );
    TEST_ASSERT_EQUAL_HEX8_ARRAY(test_sid, actual->sid, 10);  
    TEST_ASSERT_EQUAL(NODE_TOKEN_READY, actual->operation);
    
    printf("\ncreate_node_message_timeout_test: Testing the timeout operation\n");
    node_set_timeout(0x0002);
    fsm_set_event_callback(FSM_TIMEOUT, test_handle_datareq_timeout, NULL);
    
    node_check();
    
    TEST_ASSERT_EQUAL(NODE_OK, node_close());
    TEST_ASSERT_EQUAL(true, timeout_response_flag);
    
}

void ready_receives_datareq_request(){
    
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
    
    RUN_TEST(initialise_node_test);
    RUN_TEST(ready_data_message_test);
    RUN_TEST(node_timeout_test);
    
    // Test the timeout on DATAACK    
    // Test READY NODEINTROACK flow    
    // Test sending only once and waiting for a response.
    

    UnityEnd();
    return 0;   
 
}


