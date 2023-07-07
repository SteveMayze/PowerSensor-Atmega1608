#include "node_test.h"
#include "unity.h"
#include "../node.h"
#include <stdlib.h>

void initalise_node_test(){

    //uint8_t expected[10] = { 0x02 , 0xC0 , 0x2B , 0xE2 , 0x09 , 0xC0 , 0x2D , 0xE2 , 0x07 , 0xC0};
    //uint8_t actual[10] =   {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

    // Check the state of the modem.
    // Retrieve the Serial ID.
    // Clear out the buffers.
    node_status_t expected = NODE_STATE_OK;
    node_status_t actual = node_intitialise();

    TEST_ASSERT_EQUAL_UINT(expected, actual);
}


void create_node_message_test(){

    // For READY, the payload is empty.
    // This is where I need to refer to the Python gateway for the 
    // structure.
    struct node_message *actual = node_create_message();
    
    TEST_ASSERT_GREATER_THAN(0, sizeof(actual) );
    
    free(actual);

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


