

#include <string.h>

#include "ina219_test.h"
#include "../ina219/INA219.h"
#include "../mocks/Mocktwi0_master.h"

void INA219_set_read_callback(twi0_callback_t callback);
void INA219_set_restartwrite_callback(twi0_callback_t callback);

void ina219_initialise_default_profile_test(void) {

    printf("\n\n ina219_initialise_default_profile_test default profile: start\n");
    
    uint8_t expected_cal[3] = {INA219_CAL, 0x00, 0x10};
    uint8_t expected_cfg[3] = {INA219_CFG, 0x39, 0x9F};
    
    // CALIBRATION
    I2C0_Open_ExpectAndReturn(0x40, I2C0_BUSY);
    I2C0_SetBuffer_Expect(expected_cal, 2);
    I2C0_MasterWrite_ExpectAndReturn(I2C0_NOERR); // Write
    I2C0_Close_IgnoreAndReturn(I2C0_NOERR);

    // CONFIGURATION
    I2C0_Open_ExpectAndReturn(0x40, I2C0_BUSY);
    I2C0_SetBuffer_Expect(expected_cfg, 2);
    I2C0_MasterWrite_ExpectAndReturn(I2C0_NOERR); // Write
    // I2C0_Close_ExpectAndReturn(I2C0_NOERR); 
    
    INA219_Initialise(INA219_ADDR_GND_GND, INA219_CONFIG_PROFILE_DEFAULT );
    
    printf("\n ina219_initialise_default_profile_test default profile: end\n\n");

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

    printf("\n ina219_initialise_large_profile_test large profile: start\n");
    uint8_t expected_cal[3] = {INA219_CAL, 0x74, 0x91};
    uint8_t expected_cfg[3] = {INA219_CFG, 0x39, 0x9F};
    
    // CALIBRATION
    I2C0_Open_ExpectAndReturn(0x40, I2C0_BUSY);
    I2C0_SetBuffer_Expect(expected_cal, 2);
    I2C0_MasterWrite_ExpectAndReturn(I2C0_NOERR); // Write
    I2C0_Close_ExpectAndReturn(I2C0_NOERR);

    // CONFIGURATION
    I2C0_Open_ExpectAndReturn(0x40, I2C0_BUSY);
    expected_cfg[0] = INA219_CFG;
    expected_cfg[1] = 0x39;
    expected_cfg[2] = 0x9F;
    I2C0_SetBuffer_Expect(expected_cfg, 2);
    I2C0_MasterWrite_ExpectAndReturn(I2C0_NOERR); // Write
    I2C0_Close_ExpectAndReturn(I2C0_NOERR); 
    
    INA219_Initialise(INA219_ADDR_GND_GND, INA219_CONFIG_PROFILE_20V_15A );
    
    printf("\n ina219_initialise_large_profile_test large profile: end\n\n");

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
    Calibration: 3828 ? 0x9588

    ======================================*/
void ina219_initialise_small_profile_test(void) {

    printf("\n ina219_initialise_small_profile_test small profile: start\n");
    uint8_t expected_cal[3] = {INA219_CAL, 0xF4, 0x0E};
    uint8_t expected_cfg[3] = {INA219_CFG, 0x18, 0x8F};
    
    // CALIBRATION
    I2C0_Open_ExpectAndReturn(0x40, I2C0_BUSY);
    I2C0_SetBuffer_Expect(expected_cal, 2);
    I2C0_MasterWrite_ExpectAndReturn(I2C0_NOERR); // Write
    I2C0_Close_ExpectAndReturn(I2C0_NOERR);

    // CONFIGURATION
    I2C0_Open_ExpectAndReturn(0x40, I2C0_BUSY);
    I2C0_SetBuffer_Expect(expected_cfg, 2);
    I2C0_MasterWrite_ExpectAndReturn(I2C0_NOERR); // Write
    I2C0_Close_ExpectAndReturn(I2C0_NOERR); 
    
    INA219_Initialise(INA219_ADDR_GND_GND, INA219_CONFIG_PROFILE_12V_3A );
    
    printf("\n ina219_initialise_small_profile_test small profile: end\n\n");

}

static twi0_operations_t test_read_callback(void *ptr){
    printf("test_read_callback: called\n");
    uint16_t v = 320;
    ptr = &v;
    return I2C0_RESTART_READ;
}

static twi0_operations_t test_restart_callback(void *ptr){
    printf("test_restart_callback: called\n");
    uint16_t v = 320;
    ptr = &v;
    return I2C0_RESTART_READ;
}

union read_buffer_t {
    float bitFloat;
    uint16_t bit16;
    uint8_t bit8[2];

};


float fixture[] = {
    0x4f88, // Bus - Vin- = Vin+ - Vrs 10.5 - 0.321 = 10.179 => 10.18
    0x4f88, // Bus      
    0x7D00, // Shunt Full scale
    2990, // Current Vs * calibration : 4096
    1521, // Power Current * Vbus : 5000
};

void TEST_I2C0_SetDataCompleteCallback(twi0_callback_t cb, void* funPtr, int call_count) {
    printf("TEST_I2C0_SetDataCompleteCallback: Callback being called: %d times\n", call_count);
    union read_buffer_t input, output;  
//    float calibration = 3828;
    switch(call_count){
        case 1: // BUS Voltage
            input.bit16 = fixture[call_count];
            printf("TEST_I2C0_SetDataCompleteCallback: setting BUS Voltage fixture[%d] %04X to input.bit16 %04X \n",
                    call_count, (uint16_t)fixture[call_count], input.bit16);
            break;
        case 2: // SHUNT Voltage 
            input.bit16 = fixture[call_count];
            printf("TEST_I2C0_SetDataCompleteCallback: setting SHUNT Voltage fixture[%d] %04X to input.bit16 %04X \n",
                    call_count, (uint16_t)fixture[call_count], input.bit16);
            break;
        case 3: // CURRENT  
            input.bit16 = fixture[call_count];
            printf("TEST_I2C0_SetDataCompleteCallback: setting CURRENT input.bit16 %04X \n",
                   input.bit16);
            break;
        case 4: // POWER  
            input.bit16 = fixture[call_count];
            printf("TEST_I2C0_SetDataCompleteCallback: setting POWER input.bit16 %04X \n",
                    input.bit16);

            break;
        default: // BUS Voltage 
            input.bit16 = fixture[call_count];
            printf("TEST_I2C0_SetDataCompleteCallback: setting BUS Voltage fixture[%d] %0f to input.bit16 %04X \n",
                    call_count, fixture[call_count], input.bit16);
            break;
    }
    
    output.bit8[0] = input.bit8[1];
    output.bit8[1] = input.bit8[0];
        
    memcpy(funPtr, output.bit8, 2);
    printf("TEST_I2C0_SetDataCompleteCallback: setting sample data[%d] %04X -> %04X \n", 
            call_count, input.bit16, output.bit16);
}

void ina219_busReadings_test(void) {
    printf("\n ina219_busReadings_test: start \n");

    INA219_set_read_callback(test_read_callback);
    INA219_set_restartwrite_callback(test_restart_callback);
    
    union read_buffer_t expected;
    expected.bit16 = fixture[0];
    printf("ina219_busReadings_test: Set up the expected as %04X \n", expected.bit16);
    
    // Bus Voltage
    uint8_t expected_register[] = {INA219_BUS_VOLTAGE};
    
    I2C0_Open_IgnoreAndReturn(I2C0_BUSY);
    I2C0_SetDataCompleteCallback_StubWithCallback(TEST_I2C0_SetDataCompleteCallback);
    I2C0_SetBuffer_Expect(expected_register, 1);
    I2C0_SetAddressNackCallback_Expect(test_restart_callback, NULL);
    I2C0_MasterWrite_IgnoreAndReturn(I2C0_NOERR);

    I2C0_Close_IgnoreAndReturn(I2C0_NOERR);

    uint16_t actual = INA219_get_raw_reading(INA219_READING_BUS_VOLTAGE);
    
    TEST_ASSERT_EQUAL_HEX16(expected.bit16, actual);
    printf("\n ina219_busReadings_test: end\n");
    
}

/*
System Voltage [20]: 16
Load [15]: 3
Full scale value [0.32]: 
system voltage: 16, load: 3, full scale voltage: 0.32

======================================

r_shunt: 0.107Ohms, max current: 3A, power: 0.96W
min current_lsb: 92µA, max current_lsb: 733µA
current_lsb: 100.0µA
Calibration: 3828 -> 0x0EF4
*/
void ina219_get_all_readings_test(void) {
    printf("\n ina219_get_all_readings_test: start\n");

    INA219_set_read_callback(test_read_callback);
    INA219_set_restartwrite_callback(test_restart_callback);
    
    union read_buffer_t expected;
    expected.bit16 = fixture[0];
    printf("ina219_busReadings_test: Set up the expected as %04X \n", expected.bit16);

    I2C0_Open_IgnoreAndReturn(I2C0_BUSY);
    I2C0_SetDataCompleteCallback_StubWithCallback(TEST_I2C0_SetDataCompleteCallback);
    I2C0_SetBuffer_Ignore();
    I2C0_SetAddressNackCallback_Expect(test_restart_callback, NULL);
    I2C0_SetAddressNackCallback_Expect(test_restart_callback, NULL);
    I2C0_SetAddressNackCallback_Expect(test_restart_callback, NULL);
    I2C0_SetAddressNackCallback_Expect(test_restart_callback, NULL);
    I2C0_MasterWrite_IgnoreAndReturn(I2C0_NOERR);
    I2C0_Close_IgnoreAndReturn(I2C0_NOERR);

    INA219_Data_t* actual = INA219_get_all_readings();
    
    TEST_ASSERT_EQUAL_HEX16(expected.bit16, actual->raw_bus_voltage);

    TEST_ASSERT_EQUAL_FLOAT(10.18, actual->bus_voltage);    // V
    TEST_ASSERT_EQUAL_FLOAT(0.32, actual->shunt_voltage);   // mV
    TEST_ASSERT_EQUAL_FLOAT(2.99, actual->current);         // A
    TEST_ASSERT_EQUAL_FLOAT(30.42, actual->power);          // W

    printf("\n ina219_get_all_readings_test: end\n");
    
}

/**
 */
int run_ina219_tests(){
    UnityBegin("run_ina219_tests");
    printf("run_ina219_tests: begin\n");
    RUN_TEST(ina219_initialise_default_profile_test);
    RUN_TEST(ina219_initialise_large_profile_test);
    RUN_TEST(ina219_initialise_small_profile_test);
    RUN_TEST(ina219_busReadings_test);
    RUN_TEST(ina219_get_all_readings_test);
    printf("run_ina219_tests: end\n");

    UnityEnd();
    return 0;   
 
}

