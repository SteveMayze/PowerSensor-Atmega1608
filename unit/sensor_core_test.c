
#include "sensor_core_test.h"
#include "unity.h"
#include "../sensor_core.h"


void sensor_core_test_get_serial_id(){
    // 3E 01 3C E0 63 0E 71 1C F3 01
    uint8_t expected[10] = {0x8D ,0x87, 0x9E, 0x87, 0xDA, 0x01, 0xA2, 0x70, 0xBB, 0x27};
    uint8_t actual[10] =   {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
    sensor_core_read_serial_no(actual);
    printf("sensor_core_test_get_serial_id: Expected Device signature: %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X\n", 
      expected[0], expected[1], expected[2], expected[3], expected[4], expected[5], expected[6], expected[7], expected[8], expected[9]);
    printf("sensor_core_test_get_serial_id: Actual Device signature: %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X\n", 
      actual[0], actual[1], actual[2], actual[3], actual[4], actual[5], actual[6], actual[7], actual[8], actual[9]);

    TEST_ASSERT_EQUAL_HEX8_ARRAY(expected, actual, 10);
}

int run_sensor_core_tests(void)
{
    UnityBegin("sensor_core_test.c");
    RUN_TEST(sensor_core_test_get_serial_id);
    UnityEnd();
    return 0;   
}



