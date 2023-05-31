
#include "../mocks/Mockxbee_usart.h"
#include "xbee_test.h"
#include "unity.h"
#include "../sensor_telemetry.h"
#include "../sensor_core.h"
#include <string.h>


xbee_frame_t xbee_frame;

xbee_node_frame_t xbee_node_frame;

void xbee_test_build_frame() {
    // Simple demo of working test
    // 7E 0015 10 25 0013A200415D58CB FFFE 00 00 44415441524551 55
    char data[10] = "DATAREQ";
    xbee_build_frame(&xbee_frame, XBEE_FRAME_TYPE_TX_REQUEST, 0x25, 0x0013A200415D58CB, XBEE_USART_BROADCAST_SHORT, 
            strlen(data), data);
    uint8_t checksum = xbee_frame.checksum;
    TEST_ASSERT_EQUAL_HEX8(0x55, checksum);
    // TEST_ASSERT_EQUAL_INT8(0x3B, checksum);
}



void xbee_test_build_data_frame(){
    
    uint8_t serial_id[10];
    uint8_t payload[20];
    uint8_t b_value[4];
    
    sensor_core_read_serial_no(serial_id);
    
    float f_value = 10.5;
    sensor_core_convert_float_to_binary(f_value, b_value);
    
    uint8_t idx = 0;
    
    idx = xbee_add_value_to_payload( payload, idx, XBEE_TOKEN_BUS_VOLTAGE, f_value);
        
    xbee_build_node_data_frame(&xbee_node_frame, serial_id, idx, payload);
    
    TEST_ASSERT_EQUAL_HEX8(xbee_node_frame.operation, XBEE_TOKEN_DATA);
    TEST_ASSERT_EQUAL_HEX8(xbee_node_frame.payload[0], XBEE_TOKEN_BUS_VOLTAGE);
}

void xbee_core_test_add_float_test(){
    uint8_t idx = 0;
    uint8_t payload[16];
    
    float f_value = 25.85;
    
    idx = xbee_add_value_to_payload( payload, idx, XBEE_TOKEN_BUS_VOLTAGE, f_value);

    TEST_ASSERT_EQUAL_HEX8(0x05, idx);
    
    uint8_t b_value[4];
    
    for(uint8_t i = 1; i < 5; i++){
        b_value[i-1] = payload[i];
    }
    
    sensor_core_convert_binary_to_float(b_value, &f_value);
    f_value = (float)((int)((f_value+0.005) * 100) / 100.0);
    if ( 25.85 != f_value ) {
        //TEST_ASSERT_EQUAL_FLOAT((float)25.85, f_value);
        TEST_FAIL_MESSAGE("Binary to float conversion did not work. The values does not match");
    } else
        TEST_PASS();

}


int run_xbee_tests(void)
{
    UnityBegin("xbee_test.c");
    RUN_TEST(xbee_test_build_frame);
    RUN_TEST(xbee_test_build_data_frame);
    RUN_TEST(xbee_core_test_add_float_test);
    UnityEnd();
    return 0;   
}


