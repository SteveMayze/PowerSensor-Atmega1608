
#include "sensor_core_test.h"
#include "unity.h"
#include "../sensor_core.h"


void sensor_core_test_get_serial_id(){
    // 3E 01 3C E0 63 0E 71 1C F3 01
    // 13 97 82 17 93 07 0C F4 C9 01
    // uint8_t expected[10] = {0x8D ,0x87, 0x9E, 0x87, 0xDA, 0x01, 0xA2, 0x70, 0xBB, 0x27};

    uint8_t expected[10] = {0x13 ,0x97 ,0x82 ,0x17 ,0x93 ,0x07 ,0x0C ,0xF4 ,0xC9 ,0x01};
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
    
    float_t sample = 10.5;
    
    sensor_core_convert(sample, actual);
    printf("sensor_core_test_convert_float_to_binary: Expected Value: %02X %02X %02X %02X \n", 
            expected[0][0], expected[0][1], expected[0][2], expected[0][3]);
    printf("sensor_core_test_convert_float_to_binary: Actual Value: %02X %02X %02X %02X \n", 
            actual[0], actual[1], actual[2], actual[3]);

    TEST_ASSERT_EQUAL_HEX8_ARRAY(expected[0], actual, 4);
    
    sample = -240.05;
    sensor_core_convert(sample, actual);
    printf("sensor_core_test_convert_float_to_binary: Expected Value: %02X %02X %02X %02X \n", 
            expected[1][0], expected[1][1], expected[1][2], expected[1][3]);
    printf("sensor_core_test_convert_float_to_binary: Actual Value: %02X %02X %02X %02X \n", 
            actual[0], actual[1], actual[2], actual[3]);
    TEST_ASSERT_EQUAL_HEX8_ARRAY(expected[1], actual, 4);

}

int run_sensor_core_tests(void)
{
    UnityBegin("sensor_core_test.c");
    RUN_TEST(sensor_core_test_get_serial_id);
    RUN_TEST(sensor_core_test_convert_float_to_binary);
    UnityEnd();
    return 0;   
}



