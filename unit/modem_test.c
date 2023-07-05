
#include "unity.h"
#include "modem_test.h"
#include "../modem.h"
#include "../libavrxbee/xbee.h"

/**
 * On wake, the node needs to toggle the reset and then
 * send a READY and then wait for a response.
 * If there is a time out, it should just go back to sleep and
 * try again later.
 * 
 * How to test that the reset pin was toggled? The problem being that the hardware
 * I/O is using virtual ports which are addressed to memory.
 * 
 */

void initalise_modem_test(){
    
    // The broadcast address is set on the initial start up of the system
    // this enables the system to connect to the nearest available coordinator
    // and introduce itself.
    modem_initialise(XBEE_ADDR_BROADCAST);
    
    uint64_t coordinator = modem_get_coord_addr();
    
    printf("Coordinator Address: %04X %04X %04X %04X\n", (uint16_t)(coordinator >> 48)&0xFFFF, (uint16_t)(coordinator >> 32)&0xFFFF, (uint16_t)(coordinator >> 16)&0xFFFF, (uint16_t)(coordinator)&0xFFFF);    
    
    for(uint8_t i = 0; i<4; i++){
        uint16_t actual = coordinator >> i*16;
        uint16_t expected = XBEE_ADDR_BROADCAST >> i*16;
        printf("Group: %d, expected: %04X, actual: %04X \n", i, expected, actual );
        
        TEST_ASSERT_EQUAL_INT16(expected, actual);        
    }
}

void send_ready_message_test(){
    
    // This is where I need to refer to the xbee library example to 
    // create a message. It is not just the XBee message, but we need to
    // create a node message - This will differ for the purpose.
    
    TEST_FAIL_MESSAGE("The test is not implemented");
    
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
int run_modem_tests(){
    UnityBegin("modem_test");
    
    RUN_TEST(initalise_modem_test);
    RUN_TEST(send_ready_message_test);

    UnityEnd();
    return 0;   
 
}


