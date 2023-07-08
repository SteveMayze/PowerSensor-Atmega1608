#include "node_test.h"
#include "unity.h"
#include "../node.h"
#include <stdlib.h>
#include "../mocks/Mockeprom.h"

//void sensor_core_test_get_serial_id(){
//    uint8_t expected[10] = { 0x02 , 0xC0 , 0x2B , 0xE2 , 0x09 , 0xC0 , 0x2D , 0xE2 , 0x07 , 0xC0};
//    uint8_t actual[10] =   {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
//    eprom_read_serial_no(actual);
//    printf("sensor_core_test_get_serial_id: Expected Device signature: %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X\n", 
//      expected[0], expected[1], expected[2], expected[3], expected[4], expected[5], expected[6], expected[7], expected[8], expected[9]);
//    printf("sensor_core_test_get_serial_id: Actual Device signature: %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X\n", 
//      actual[0], actual[1], actual[2], actual[3], actual[4], actual[5], actual[6], actual[7], actual[8], actual[9]);
//
//    TEST_ASSERT_EQUAL_HEX8_ARRAY(expected, actual, 10);
//}

uint8_t test_sid[10] = {0x02 , 0xC0 , 0x2B , 0xE2 , 0x09 , 0xC0 , 0x2D , 0xE2 , 0x07 , 0xC0};

void initalise_node_test(){
    
    uint8_t *expected = test_sid;

    eprom_read_serial_id_ExpectAndReturn(expected);
    node_status_t expected_status = NODE_STATE_OK;
    
    // Check the state of the modem.
    // Retrieve the Serial ID.
    // Clear out the buffers.
    node_status_t actual_status = node_intitialise();

    TEST_ASSERT_EQUAL_UINT(expected_status, actual_status);

}


void create_node_message_test(){

    // For READY, the payload is empty.
    // This is where I need to refer to the Python gateway for the 
    // structure.
    struct node_message *actual = node_create_ready_message(test_sid);
    
    TEST_ASSERT_GREATER_THAN(0, sizeof(actual) );
    TEST_ASSERT_EQUAL_HEX8_ARRAY(test_sid, actual->sid, 10);  
    TEST_ASSERT_EQUAL(NODE_OPERATION_READY, actual->operation);
    
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
    
    RUN_TEST(initalise_node_test);
    RUN_TEST(create_node_message_test);

    UnityEnd();
    return 0;   
 
}


