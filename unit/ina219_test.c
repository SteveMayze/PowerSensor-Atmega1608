#include "ina219_test.h"
#include "../ina219/INA219.h"
#include "../mocks/Mocktwi0_master.h"

uint8_t buffer[64];

void ina219_initialise_test(void) {

    printf("\n\nCalling the initialize with 0x17\n\n");
    
    // Here we need to calculate the values for the buffer(s) and 
    // and set them. These need t correlate with the configuration
    // that will be used by default.
    // Therefore I need to consult the data sheet and set the correct, 
    // expected values so that this test will make sense.

    // CALIBRATION
    I2C0_Open_ExpectAndReturn(0x17, I2C0_NOERR);
    I2C0_SetBuffer_Expect(buffer, 2);
    I2C0_MasterOperation_ExpectAndReturn(false, I2C0_NOERR);
    I2C0_Close_ExpectAndReturn(I2C0_NOERR);

    // CONFIGURATION
    I2C0_Open_ExpectAndReturn(0x17, I2C0_NOERR);
    I2C0_SetBuffer_Expect(buffer, 2);
    I2C0_MasterOperation_ExpectAndReturn(false,I2C0_NOERR); // Write
    I2C0_Close_ExpectAndReturn(I2C0_NOERR); 
    
    INA219_Initialise(0x17);
    
    printf("\n\nCalled the initialize with 0x17\n\n");

}


/**
 */
int run_ina219_tests(){
    UnityBegin("run_ina219_tests");
    
    RUN_TEST(ina219_initialise_test);

    UnityEnd();
    return 0;   
 
}

