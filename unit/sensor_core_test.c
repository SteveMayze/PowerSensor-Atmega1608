
#include <avr/pgmspace.h>

 uint8_t ut_pgm_read_byte(uint16_t addr, const char* file, int line);


#include "sensor_core_test.h"
#include "unity.h"
#include "../sensor_core.h"

void sensor_core_test_convert_float_to_binary() {
    uint8_t expected[2][4] = {{0x00, 0x00, 0x28, 0x41}, {0xCD, 0x0C, 0x70, 0xC3}};
    uint8_t actual[4];
    
    float sample = 10.5;
    
    sensor_core_convert_float_to_binary(sample, actual);
    printf("sensor_core_test_convert_float_to_binary: Expected Value: %02X %02X %02X %02X \n", 
            expected[0][0], expected[0][1], expected[0][2], expected[0][3]);
    printf("sensor_core_test_convert_float_to_binary: Actual Value: %02X %02X %02X %02X \n", 
            actual[0], actual[1], actual[2], actual[3]);

    TEST_ASSERT_EQUAL_HEX8_ARRAY(expected[0], actual, 4);
    
    sample = -240.05;
    sensor_core_convert_float_to_binary(sample, actual);
    printf("sensor_core_test_convert_float_to_binary: Expected Value: %02X %02X %02X %02X \n", 
            expected[1][0], expected[1][1], expected[1][2], expected[1][3]);
    printf("sensor_core_test_convert_float_to_binary: Actual Value: %02X %02X %02X %02X \n", 
            actual[0], actual[1], actual[2], actual[3]);
    TEST_ASSERT_EQUAL_HEX8_ARRAY(expected[1], actual, 4);

}


void sensor_core_test_convert_binary_to_float() {
    
    union _float_to_b expected;
    expected.f_value = 28.5;
            
    // uint8_t b_value[4] = {0x00, 0x00, 0x28, 0x41};
    // float expected = 10.5;
    float actual;
    
    sensor_core_convert_binary_to_float(expected.b_value, &actual);
    actual = (float)((int)((actual+0.005) * 100) / 100.0);
    if ( expected.f_value != actual ) {
        //TEST_ASSERT_EQUAL_FLOAT((float)25.85, f_value);
        TEST_FAIL_MESSAGE("Float value does not match");
    } else
        TEST_PASS();
    

}


int run_sensor_core_tests(void)
{
    UnityBegin("sensor_core_test.c");
    RUN_TEST(sensor_core_test_convert_float_to_binary);
    RUN_TEST(sensor_core_test_convert_binary_to_float);
    UnityEnd();
    return 0;   
}

