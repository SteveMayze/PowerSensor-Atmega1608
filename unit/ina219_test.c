

#include "ina219_test.h"
#include "../ina219/INA219.h"
#include "../mocks/Mocktwi0_master.h"


void ina219_initialise_default_profile_test(void) {

    printf("\n\nINA219_Initialise\n");
    uint8_t expected_cal[3];
    uint8_t expected_cfg[3];
    
    // CALIBRATION
    I2C0_Open_ExpectAndReturn(0x40, I2C0_NOERR);
    expected_cal[0] = INA219_CAL;
    expected_cal[1] = 0x00;
    expected_cal[2] = 0x10;
    I2C0_SetBuffer_Expect(expected_cal, 2);
    I2C0_MasterOperation_ExpectAndReturn(false, I2C0_NOERR);
    I2C0_Close_ExpectAndReturn(I2C0_NOERR);

    // CONFIGURATION
    I2C0_Open_ExpectAndReturn(0x40, I2C0_NOERR);
    expected_cfg[0] = INA219_CFG;
    expected_cfg[1] = 0x39;
    expected_cfg[2] = 0x9F;
    I2C0_SetBuffer_Expect(expected_cfg, 2);
    I2C0_MasterOperation_ExpectAndReturn(false,I2C0_NOERR); // Write
    I2C0_Close_ExpectAndReturn(I2C0_NOERR); 
    
    INA219_Initialise(INA219_ADDR_GND_GND, INA219_CONFIG_PROFILE_DEFAULT );
    
    printf("\nINA219_Initialise\n\n");

}

/*
    System Voltage [20]: 
    Load [15]: 
    Full scale value [0.32]: 
    system voltage: 20, load: 15, full scale voltage: 0.32

    ======================================

    r_shunt: 0.022?, max current: 15A, power: 4.8W
    min current_lsb: 458µA, max current_lsb: 3663µA
    current_lsb: 500.0µA
    Calibration: 37236

    ====================================== 

 */
void ina219_initialise_large_profile_test(void) {

    printf("\n\nINA219_Initialise\n");
    uint8_t expected_cal[3];
    uint8_t expected_cfg[3];
    
    // CALIBRATION
    I2C0_Open_ExpectAndReturn(0x40, I2C0_NOERR);
    expected_cal[0] = INA219_CAL;
    expected_cal[1] = 0x74;
    expected_cal[2] = 0x91;
    I2C0_SetBuffer_Expect(expected_cal, 2);
    I2C0_MasterOperation_ExpectAndReturn(false, I2C0_NOERR);
    I2C0_Close_ExpectAndReturn(I2C0_NOERR);

    // CONFIGURATION
    I2C0_Open_ExpectAndReturn(0x40, I2C0_NOERR);
    expected_cfg[0] = INA219_CFG;
    expected_cfg[1] = 0x39;
    expected_cfg[2] = 0x9F;
    I2C0_SetBuffer_Expect(expected_cfg, 2);
    I2C0_MasterOperation_ExpectAndReturn(false,I2C0_NOERR); // Write
    I2C0_Close_ExpectAndReturn(I2C0_NOERR); 
    
    INA219_Initialise(INA219_ADDR_GND_GND, INA219_CONFIG_PROFILE_20V_15A );
    
    printf("\nINA219_Initialise\n\n");

}

/*
    System Voltage [20]: 12
    Load [15]: 3
    Full scale value [0.32]: 
    system voltage: 12, load: 3, full scale voltage: 0.32

    ======================================

    r_shunt: 0.107?, max current: 3A, power: 0.96W
    min current_lsb: 92µA, max current_lsb: 733µA
    current_lsb: 100.0µA
    Calibration: 38280 ? 0x9588

    ======================================*/
void ina219_initialise_small_profile_test(void) {

    printf("\n\nINA219_Initialise\n");
    uint8_t expected_cal[3];
    uint8_t expected_cfg[3];
    
    // CALIBRATION
    I2C0_Open_ExpectAndReturn(0x40, I2C0_NOERR);
    expected_cal[0] = INA219_CAL;
    expected_cal[1] = 0x88;
    expected_cal[2] = 0x95;
    I2C0_SetBuffer_Expect(expected_cal, 2);
    I2C0_MasterOperation_ExpectAndReturn(false, I2C0_NOERR);
    I2C0_Close_ExpectAndReturn(I2C0_NOERR);

    // CONFIGURATION
    I2C0_Open_ExpectAndReturn(0x40, I2C0_NOERR);
    expected_cfg[0] = INA219_CFG;
    expected_cfg[1] = 0x39;
    expected_cfg[2] = 0x9F;
    I2C0_SetBuffer_Expect(expected_cfg, 2);
    I2C0_MasterOperation_ExpectAndReturn(false,I2C0_NOERR); // Write
    I2C0_Close_ExpectAndReturn(I2C0_NOERR); 
    
    INA219_Initialise(INA219_ADDR_GND_GND, INA219_CONFIG_PROFILE_12V_3A );
    
    printf("\nINA219_Initialise\n\n");

}



/**
 */
int run_ina219_tests(){
    UnityBegin("run_ina219_tests");
    
    RUN_TEST(ina219_initialise_default_profile_test);
    RUN_TEST(ina219_initialise_large_profile_test);
    RUN_TEST(ina219_initialise_small_profile_test);

    UnityEnd();
    return 0;   
 
}

