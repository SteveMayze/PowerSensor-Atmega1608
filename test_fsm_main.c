
#define F_CPU 1000000UL

#include "mcc_generated_files/mcc.h"
#include <util/delay.h>
//#include "unit/modem_send_test.h"
#include "unit/sensor_core_test.h"
#include "unit/node_init_test.h"
#include "unit/node_basic_test.h"
#include "unit/node_test.h"


int main(void)
{
    // Initialize drivers from MCC
    
    SYSTEM_Initialize();
    _delay_ms(1000);
    
    

    printf("\n\n========== Test starting ==========\n\n");

    run_node_init_tests();

    printf("\n\n===================================\n\n");

    run_sensor_core_tests();

    printf("\n\n===================================\n\n");

    run_node_basic_tests();
    
    printf("\n\n===================================\n\n");

    run_node_tests();
    
    printf("\n\n========== Test Completed ==========\n\n");
    
}

void setUp (void) {
    
} 

void tearDown (void) {
}


