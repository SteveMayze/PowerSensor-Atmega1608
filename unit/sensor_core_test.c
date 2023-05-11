
#include "sensor_core_test.h"
#include "unity.h"
#include "../sensor_core.h"


void sensor_core_test_get_serial_id(){
    // 3E 01 3C E0 63 0E 71 1C F3 01
    // 13 97 82 17 93 07 0C F4 C9 01
    // 09 C0 AB 81 BC 81 12 96 8D 91
    // AF 81 B8 85 AE 0F BF 1F 80 E2
    // uint8_t expected[10] = {0x8D ,0x87, 0x9E, 0x87, 0xDA, 0x01, 0xA2, 0x70, 0xBB, 0x27};
    // uint8_t expected[10] = {0x13 ,0x97 ,0x82 ,0x17 ,0x93 ,0x07 ,0x0C ,0xF4 ,0xC9 ,0x01};
    // uint8_t expected[10] = {0x09, 0xC0, 0xAB, 0x81, 0xBC, 0x81, 0x12, 0x96, 0x8D, 0x91};
    uint8_t expected[10] = {0xAF, 0x81, 0xB8, 0x85, 0xAE, 0x0F, 0xBF, 0x1F, 0x80, 0xE2};
    uint8_t actual[10] =   {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
    sensor_core_read_serial_no(actual);
    printf("sensor_core_test_get_serial_id: Expected Device signature: %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X\n", 
      expected[0], expected[1], expected[2], expected[3], expected[4], expected[5], expected[6], expected[7], expected[8], expected[9]);
    printf("sensor_core_test_get_serial_id: Actual Device signature: %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X\n", 
      actual[0], actual[1], actual[2], actual[3], actual[4], actual[5], actual[6], actual[7], actual[8], actual[9]);

    TEST_ASSERT_EQUAL_HEX8_ARRAY(expected, actual, 10);
}


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
    RUN_TEST(sensor_core_test_get_serial_id);
    RUN_TEST(sensor_core_test_convert_float_to_binary);
    RUN_TEST(sensor_core_test_convert_binary_to_float);
    UnityEnd();
    return 0;   
}



