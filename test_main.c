
#define F_CPU 1000000UL
#include "mcc_generated_files/mcc.h"
#include <util/delay.h>
#include "unit/telemetry_test.h"
#include "unit/sensor_core_test.h"


int main(void)
{
    // Initialize drivers from MCC
    SYSTEM_Initialize();
    _delay_ms(1000);
 
    // run_xbee_tests();
    run_telemetry_tests();
    run_sensor_core_tests();
    
}

void setUp (void) {
    
} 

void tearDown (void) {
}


