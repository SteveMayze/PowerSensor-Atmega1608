
#include "unity.h"
#include "node_test.h"


/**
 * On startup of the device i.e. node, the initialisation should be called.
 * 
 * We have the USART0 - XBee modem and the IIC port - the INA219 (or other sensor).
 * 
 * The address of the coordinator will come after the READY interaction. So perhaps,
 * this should be part of the initialisation - contact with the coordinator.
 * 
 * What to mock and what to spy? Mockusart0 is too low level i.e. at the byte layer 
 * to be simple to work with. It would be nice to deal with things at the sting or message
 * level rather than staging a bunch of isReady and Chars.
 * 
 * We also need the serial number of the device. This can be gotten once
 * 
 */
void initalise_node_test(){
    TEST_FAIL_MESSAGE("The test is not implemented.");
    
    
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

    UnityEnd();
    return 0;   
 
}


