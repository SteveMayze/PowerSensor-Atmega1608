

#include "ina219_test.h"
#include "../ina219/INA219.h"
#include "../mocks/Mocktwi0_master.h"

void INA219_set_read_callback(twi0_callback_t callback);
void INA219_set_restartwrite_callback(twi0_callback_t callback);

void ina219_initialise_default_profile_test(void) {

    printf("\n\nINA219_Initialise default profile: start\n");
    
    uint8_t expected_cal[3] = {INA219_CAL, 0x00, 0x10};
    uint8_t expected_cfg[3] = {INA219_CFG, 0x39, 0x9F};
    
    // CALIBRATION
    I2C0_Open_ExpectAndReturn(0x40, I2C0_BUSY);
    I2C0_SetBuffer_Expect(expected_cal, 2);
    I2C0_MasterOperation_ExpectAndReturn(false, I2C0_NOERR);
    I2C0_Close_ExpectAndReturn(I2C0_NOERR);

    // CONFIGURATION
    I2C0_Open_ExpectAndReturn(0x40, I2C0_BUSY);
    I2C0_SetBuffer_Expect(expected_cfg, 2);
    I2C0_MasterOperation_ExpectAndReturn(false,I2C0_NOERR); // Write
    I2C0_Close_ExpectAndReturn(I2C0_NOERR); 
    
    INA219_Initialise(INA219_ADDR_GND_GND, INA219_CONFIG_PROFILE_DEFAULT );
    
    printf("\nINA219_Initialise default profile: end\n\n");

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

    printf("\nINA219_Initialise large profile: start\n");
    uint8_t expected_cal[3] = {INA219_CAL, 0x74, 0x91};
    uint8_t expected_cfg[3] = {INA219_CFG, 0x39, 0x9F};
    
    // CALIBRATION
    I2C0_Open_ExpectAndReturn(0x40, I2C0_BUSY);
    I2C0_SetBuffer_Expect(expected_cal, 2);
    I2C0_MasterOperation_ExpectAndReturn(false, I2C0_NOERR);
    I2C0_Close_ExpectAndReturn(I2C0_NOERR);

    // CONFIGURATION
    I2C0_Open_ExpectAndReturn(0x40, I2C0_BUSY);
    expected_cfg[0] = INA219_CFG;
    expected_cfg[1] = 0x39;
    expected_cfg[2] = 0x9F;
    I2C0_SetBuffer_Expect(expected_cfg, 2);
    I2C0_MasterOperation_ExpectAndReturn(false,I2C0_NOERR); // Write
    I2C0_Close_ExpectAndReturn(I2C0_NOERR); 
    
    INA219_Initialise(INA219_ADDR_GND_GND, INA219_CONFIG_PROFILE_20V_15A );
    
    printf("\nINA219_Initialise large profile: end\n\n");

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

    printf("\nINA219_Initialise small profile: start\n");
    uint8_t expected_cal[3] = {INA219_CAL, 0x88, 0x95};
    uint8_t expected_cfg[3] = {INA219_CFG, 0x18, 0x8F};
    
    // CALIBRATION
    I2C0_Open_ExpectAndReturn(0x40, I2C0_BUSY);
    I2C0_SetBuffer_Expect(expected_cal, 2);
    I2C0_MasterOperation_ExpectAndReturn(false, I2C0_NOERR);
    I2C0_Close_ExpectAndReturn(I2C0_NOERR);

    // CONFIGURATION
    I2C0_Open_ExpectAndReturn(0x40, I2C0_BUSY);
    I2C0_SetBuffer_Expect(expected_cfg, 2);
    I2C0_MasterOperation_ExpectAndReturn(false,I2C0_NOERR); // Write
    I2C0_Close_ExpectAndReturn(I2C0_NOERR); 
    
    INA219_Initialise(INA219_ADDR_GND_GND, INA219_CONFIG_PROFILE_12V_3A );
    
    printf("\nINA219_Initialise small profile: end\n\n");

}

static twi0_operations_t test_read_callback(void *ptr){
    uint16_t *v = 0;
    ptr = v;
    return I2C0_RESTART_READ;
}

static twi0_operations_t test_restart_callback(void *ptr){
    uint16_t *v = 0;
    ptr = v;
    return I2C0_RESTART_READ;
}

void ina219_getReadings_test(void) {
    printf("\nina219_getReadings_test: start\n");

    INA219_set_read_callback(test_read_callback);
    INA219_set_restartwrite_callback(test_restart_callback);
    
    uint16_t expected = 0;
    
    //uint8_t data[4] = {0};

    // Shunt Voltage
    // Bus Voltage
    // uint8_t expected_register[] = {INA219_BUS_VOLTAGE};
    I2C0_Open_ExpectAndReturn(0x40, I2C0_BUSY);
    I2C0_SetDataCompleteCallback_Expect(test_read_callback, &expected);
    I2C0_SetBuffer_Ignore();
    I2C0_SetAddressNackCallback_Expect(test_restart_callback, NULL);
    I2C0_MasterWrite_ExpectAndReturn(I2C0_NOERR);
    I2C0_Close_ExpectAndReturn(I2C0_NOERR);

    // expected_register[0] = INA219_SHUNT_VOLTAGE;
    I2C0_Open_ExpectAndReturn(0x40, I2C0_BUSY);
    I2C0_SetDataCompleteCallback_Expect(test_read_callback, &expected);
    I2C0_SetBuffer_Ignore();
    I2C0_SetAddressNackCallback_Expect(test_restart_callback, NULL);
    I2C0_MasterWrite_ExpectAndReturn(I2C0_NOERR);
    I2C0_Close_ExpectAndReturn(I2C0_NOERR);
    
    


//    // Current Voltage
//    expected_register[0] = INA219_CURRENT;
//    I2C0_Open_ExpectAndReturn(0x40, I2C0_NOERR);
//    I2C0_SetDataCompleteCallback_Expect(test_read_callback, &expected);
//    I2C0_SetBuffer_Expect(expected_register, 1);
//    I2C0_SetAddressNackCallback_Expect(test_restart_callback, NULL);
//    I2C0_MasterWrite_ExpectAndReturn(I2C0_NOERR);
//    I2C0_Close_ExpectAndReturn(I2C0_NOERR);
//
//    // Power Voltage
//    expected_register[0] = INA219_POWER;
//    I2C0_Open_ExpectAndReturn(0x40, I2C0_NOERR);
//    I2C0_SetDataCompleteCallback_Expect(test_read_callback, &expected);
//    I2C0_SetBuffer_Expect(expected_register, 1);
//    I2C0_SetAddressNackCallback_Expect(test_restart_callback, NULL);
//    I2C0_MasterWrite_ExpectAndReturn(I2C0_NOERR);
//    I2C0_Close_ExpectAndReturn(I2C0_NOERR);

    

    // Data Read
    
    
    INA219_Data_t* actual = INA219_getReadings();
    
    TEST_ASSERT_EQUAL(320, actual->bus_voltage);
    printf("\nina219_getReadings_test: end\n");
    
}

/**
 */
int run_ina219_tests(){
    UnityBegin("run_ina219_tests");
    printf("run_ina219_tests: begin\n");
    RUN_TEST(ina219_initialise_default_profile_test);
    RUN_TEST(ina219_initialise_large_profile_test);
    RUN_TEST(ina219_initialise_small_profile_test);
    RUN_TEST(ina219_getReadings_test);
    printf("run_ina219_tests: end\n");

    UnityEnd();
    return 0;   
 
}

