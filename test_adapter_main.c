
#define F_CPU 1000000UL

#include "mocks/Mocktwi0_master.h"

#include "mcc_generated_files/mcc.h"
#include <util/delay.h>
#include "unit/ina219_test.h"

int main(void) {
    
    // Initialize drivers from MCC
    // Need to specify the intialisation mock during the SYSTEM_Initialize.
    I2C0_Initialize_ExpectAndReturn(0);

    SYSTEM_Initialize();
    _delay_ms(1000);



    printf("\n\n========== Test starting ==========\n\n");

    run_ina219_tests();

    printf("\n\n========== Test Completed ==========\n\n");

}

void setUp(void) {

}

void tearDown(void) {
}



