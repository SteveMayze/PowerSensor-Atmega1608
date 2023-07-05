
#define F_CPU 1000000UL

#include "mcc_generated_files/mcc.h"
#include <util/delay.h>
#include "unit/modem_test.h"
#include "unit/sensor_core_test.h"
#include "unit/node_test.h"


int main(void)
{
    // Initialise drivers from MCC
    
    SYSTEM_Initialize();
    _delay_ms(1000);
 
    run_sensor_core_tests();
    run_node_tests();
    
}

void setUp (void) {
    
} 

void tearDown (void) {
}


