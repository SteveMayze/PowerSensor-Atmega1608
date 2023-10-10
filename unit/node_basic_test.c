#include "node_basic_test.h"
#include "unity.h"
#include "../node.h"
#include "../mocks/Mockmodem.h"
#include "../mocks/Mockeprom.h"
#include "../mocks/MockINA219.h"
#include "test_common.h"

void send_message_callback(unsigned char* node_message, uint8_t data_length, int call_count){
    printf("send_message_callback: call_count: %d \n", call_count);
    
//    switch(message->operation){
//        case NODE_TOKEN_READY:
//            printf("send_message_callback: NODE_TOKEN_READY \n");
//            break;
//        case NODE_TOKEN_DATA:
//            printf("send_message_callback: NODE_TOKEN_DATA \n");
//            break;
//        case NODE_TOKEN_NODEINTRO:
//            printf("send_message_callback: NODE_TOKEN_NODEINTRO \n");
//            break;
//        default:
//            printf("send_message_callback: UNKNOWN \n");
//            break;
//    }
    
}

/**
 * Verify the creation of the message and the READY, DATA send API is called.
 */
void ready_datareq_dataack_test(){
    set_datareq_response_flag(false);
    set_timeout_response_flag(false);
    
    eprom_read_serial_id_ExpectAndReturn(get_test_sid());
    INA219_Initialise_Expect(0x40, INA219_CONFIG_PROFILE_DEFAULT);

    node_intitialise();


    // For READY, the payload is empty.
    // This is where I need to refer to the Python gateway for the 
    // structure.
    printf("\nready_datareq_dataack_test: READY DATAREQ DATAACK message test\n");
    ModemResponse_t* datareq_response_ptr = get_dataReq_response();    
    ModemResponse_t* dataack_response_ptr = get_dataack_response();
    
    
    modem_open_Expect(XBEE_ADDR_BROADCAST);
    modem_close_Expect();
    modem_message_arrived_ExpectAndReturn(true);
    modem_receive_message_ExpectAndReturn(datareq_response_ptr);

    modem_message_arrived_ExpectAndReturn(true);
    modem_receive_message_ExpectAndReturn(dataack_response_ptr);

    Node_Message_t *actual = node_create_message(NODE_TOKEN_READY, get_test_sid());
    
    TEST_ASSERT_GREATER_THAN(0, sizeof(actual) );
    TEST_ASSERT_EQUAL_HEX8_ARRAY(get_test_sid(), actual->sid, 5);  
    TEST_ASSERT_EQUAL(NODE_TOKEN_READY, actual->operation);
    
    printf("\nready_datareq_dataack_test: Testing the send operation for READY\n");
    node_set_timeout(0x000F);
    fsm_set_event_callback(FSM_DATAREQ, test_handle_datareq_response);
    fsm_set_event_callback(FSM_DATAACK, test_handle_dataack_response);
    fsm_set_event_callback(FSM_TIMEOUT, test_handle_timeout);
    
    modem_send_message_StubWithCallback(send_message_callback);
    
    node_check();
    
    TEST_ASSERT_EQUAL(NODE_OK, node_close());
    TEST_ASSERT_EQUAL(true, get_datareq_response_flag());
    TEST_ASSERT_EQUAL(true, get_dataack_response_flag());
    TEST_ASSERT_EQUAL(false, get_timeout_response_flag());
}

/**
 * Verify the creation of the message and the READY, NODEINFO send API is called
 */
void ready_nodeintroreq_nodeintroack_test(){
    
    set_nodeintroreq_response_flag(false);
    set_timeout_response_flag(false);
    eprom_read_serial_id_ExpectAndReturn(get_test_sid());
    INA219_Initialise_Expect(0x40, INA219_CONFIG_PROFILE_DEFAULT);

    node_intitialise();
    
    // For READY, the payload is empty.
    // This is where I need to refer to the Python gateway for the 
    // structure.
    printf("\nready_nodeintroreq_nodeintroack_test: READY NODEINTROREQ NODEINTROACK message test\n");
    ModemResponse_t* nodeintroreq_response_ptr = get_nodeintroreq_response();    
    ModemResponse_t* nodeintroack_response_ptr = get_nodeintroack_response();
    
    nodeintroreq_response_ptr->operation = NODE_TOKEN_NODEINTROREQ;  
    nodeintroack_response_ptr->operation = NODE_TOKEN_NODEINTROACK;
    
    modem_open_Expect(XBEE_ADDR_BROADCAST);
    modem_close_Expect();
    modem_message_arrived_ExpectAndReturn(true);
    modem_receive_message_ExpectAndReturn(nodeintroreq_response_ptr);

    modem_message_arrived_ExpectAndReturn(true);
    modem_receive_message_ExpectAndReturn(nodeintroack_response_ptr);

    Node_Message_t *actual = node_create_message(NODE_TOKEN_READY, get_test_sid());
    
    TEST_ASSERT_GREATER_THAN(0, sizeof(actual) );
    TEST_ASSERT_EQUAL_HEX8_ARRAY(get_test_sid(), actual->sid, 5);  
    TEST_ASSERT_EQUAL(NODE_TOKEN_READY, actual->operation);
    
    printf("\nready_nodeintroreq_nodeintroack_test: Testing the send operation for READY\n");
    node_set_timeout(0x000F);
    
    // fsm_set_event_callback(FSM_DATAREQ, node_data_collection);
    // fsm_set_event_callback(FSM_DATAACK, node_data_received);

    fsm_set_event_callback(FSM_NODEINTROREQ, test_handle_nodeintroreq_response);
    fsm_set_event_callback(FSM_NODEINTROACK, test_handle_nodeintroack_response);
    fsm_set_event_callback(FSM_TIMEOUT, test_handle_timeout);

    modem_send_message_StubWithCallback(send_message_callback);
    
    node_check();
    
    TEST_ASSERT_EQUAL(NODE_OK, node_close());
    TEST_ASSERT_EQUAL(true, get_nodeintroreq_response_flag());
    TEST_ASSERT_EQUAL(true, get_nodeintroack_response_flag());
    TEST_ASSERT_EQUAL(false, get_timeout_response_flag());
}




/**
 * Verify the creation of the message and the READY send API is called.
 */
void node_timeout_test(){
    
    set_datareq_response_flag(false);
    set_timeout_response_flag(false);

    // For READY, the payload is empty.
    // This is where I need to refer to the Python gateway for the 
    // structure.
    printf("\nnode_timeout_test: TIMEOUT message test\n");

    modem_open_Expect(XBEE_ADDR_BROADCAST);
    modem_close_Expect();
    
    modem_message_arrived_ExpectAndReturn(false);
    modem_message_arrived_ExpectAndReturn(false);
    modem_message_arrived_ExpectAndReturn(false);

    Node_Message_t *actual = node_create_message(NODE_TOKEN_READY, get_test_sid());
    TEST_ASSERT_GREATER_THAN(0, sizeof(actual) );
    TEST_ASSERT_EQUAL_HEX8_ARRAY(get_test_sid(), actual->sid, 10);  
    TEST_ASSERT_EQUAL(NODE_TOKEN_READY, actual->operation);
    
    printf("\nnode_timeout_test: Testing the timeout operation\n");
    node_set_timeout(0x0002);
    fsm_set_event_callback(FSM_TIMEOUT, test_handle_timeout);

    modem_send_message_StubWithCallback(send_message_callback);
        
    node_check();
    
    TEST_ASSERT_EQUAL(NODE_OK, node_close());
    TEST_ASSERT_EQUAL(true, get_timeout_response_flag());
    
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
int run_node_basic_tests(){
    UnityBegin("run_node_basic_tests");
    
    printf("\n\n================ ready_datareq_dataack_test ===================\n\n");
    
    RUN_TEST(ready_datareq_dataack_test);
    
    printf("\n\n================ready_nodeintroreq_nodeintroack_test ===================\n\n");

    RUN_TEST(ready_nodeintroreq_nodeintroack_test);

    printf("\n\n=============== ready_nodeintroreq_nodeintroack_test ====================\n\n");

    RUN_TEST(node_timeout_test);
    
    UnityEnd();
    return 0;   
 
}


