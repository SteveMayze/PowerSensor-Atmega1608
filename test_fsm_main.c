
#include "build-config.h"

#include "mcc_generated_files/mcc.h"

#include <util/delay.h>
#include "unit/sensor_core_test.h"
#include "unit/node_init_test.h"
#include "unit/node_basic_test.h"
#include "unit/node_test.h"


int main(void)
{
    // Initialize drivers from MCC
    
    SYSTEM_Initialize();
 
    LOG_INFO("========== Test starting ==========\n\n");

    run_node_init_tests();

    LOG_INFO("===================================\n\n");

    run_sensor_core_tests();

    LOG_INFO("===================================\n\n");
    
    run_node_basic_tests();
    
    LOG_INFO("===================================\n\n");

    run_node_tests();
    
    LOG_INFO("========== Test Completed ==========\n\n");
    
}

void setUp (void) {
    
} 

void tearDown (void) {
}


