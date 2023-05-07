
#include "../mocks/Mockxbee_usart.h"
#include "xbee_test.h"
#include "unity.h"
#include "../xbee.h"
#include <string.h>

void xbee_test_build_frame() {
    // Simple demo of working test
    // 7E 0015 10 25 0013A200415D58CB FFFE 00 00 44415441524551 55
    char data[10] = "DATAREQ";
    xbee_build_frame(XBEE_FRAME_TYPE_TX_REQUEST, 0x25, 0x0013A200415D58CB, XBEE_USART_BROADCAST_SHORT, 
            strlen(data), data);
    uint8_t checksum = xbee_get_checksum();
    TEST_ASSERT_EQUAL_HEX8(0x55, checksum);
    // TEST_ASSERT_EQUAL_INT8(0x3B, checksum);
}


int run_xbee_tests(void)
{
    UnityBegin("xbee_test.c");
    RUN_TEST(xbee_test_build_frame);
    UnityEnd();
    return 0;   
}


