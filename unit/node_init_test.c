
#include "../build-config.h"

#include "node_init_test.h"
#include "unity.h"
#include "../node.h"
#include <stdlib.h>
#include "../mocks/Mockeprom.h"
#include "../mocks/MockINA219.h"

uint8_t node_init_test_sid[10] = {0x02 , 0xC0 , 0x2B , 0xE2 , 0x09 , 0xC0 , 0x2D , 0xE2 , 0x07 , 0xC0};

/**
 * Verify the initialisation and the setting of the Serial ID (sid).
 */
void initialise_node_test(){  
    uint8_t *expected_sid = node_init_test_sid;
    eprom_read_serial_id_ExpectAndReturn(expected_sid);
    INA219_Initialise_Expect(0x40, NODE_INA219_PROFILE);
    Error_t expected_status = NODE_OK;
    // Check the state of the modem.
    // Retrieve the Serial ID.
    // Clear out the buffers.
    Error_t actual_status = node_intitialise();
    TEST_ASSERT_EQUAL_UINT(expected_status, actual_status);
}



/**
 */
int run_node_init_tests(){
    UnityBegin("run_node_initialise_tests");
    
    RUN_TEST(initialise_node_test);

    UnityEnd();
    return 0;   
 
}


