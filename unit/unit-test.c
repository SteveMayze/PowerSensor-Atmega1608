
#include "unit-test.h"
#include "unity.h"
#include "../mocks/Mockusart0.h"
#include "../mcc_generated_files/mcc.h"
#include <util/delay.h>
#include <stdbool.h>


void test_function1() {
    // Simple demo of working test
    TEST_ASSERT_TRUE(1);
}

void write_usart0() {
    // Write a message to the USART0
    USART0_IsTxReady_ExpectAndReturn(true);
    USART0_Write_Expect(0x7E);
    
    if(!USART0_IsTxReady())
        TEST_ASSERT_TRUE(0);
    USART0_Write(0x7E);
}

void read_usart0() {
    // Read a message from the USART0
    USART0_IsRxReady_ExpectAndReturn(true);
    USART0_IsRxReady_ExpectAndReturn(true);
    USART0_IsRxReady_ExpectAndReturn(true);
    USART0_IsRxReady_ExpectAndReturn(false);
    USART0_Read_ExpectAndReturn(0xFE);

    _delay_ms(10);
    printf("Starting read_usart0 isRxRead: {%2X }\n", USART0_IsRxReady());
    
    // uint8_t timeout = 0;
    if(USART0_IsRxReady()) {
        printf("Reading from USART0\n");
        uint8_t header = 0x00;
        while( USART0_IsRxReady() )
            header = USART0_Read();
        printf("Read %2X from USART0\n", header);
        TEST_ASSERT_EQUAL_INT8(0xFE, header);
    }
    else {
        printf("Failing the test - the USART is not ready\n");
        TEST_ASSERT_TRUE(0);
    }
    printf("Ending read_usart0\n");
    
}

int run_unit_tests(void)
{
    UnityBegin("unit-test.c");
    RUN_TEST(test_function1);
    RUN_TEST(write_usart0);
    RUN_TEST(read_usart0);
    UnityEnd();
    return 0;   
}


