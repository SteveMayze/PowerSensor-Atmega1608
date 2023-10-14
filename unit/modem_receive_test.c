
#include "unity.h"
#include "modem_receive_test.h"
#include "../modem.h"
#include "../mocks/Mockusart0.h"
#include "../libavrxbee/xbee.h"
#include "test_common.h"

uint64_t expected_coord = 0x02040810204080CC;


uint8_t receive_datareq_fixture[18] = {
    0x7E, 0x00, 0x0E, 0x90, 0x02, 0x04, 0x08, 0x10, 
    0x20, 0x40, 0x80, 0xCC, 0xFF, 0xFE, 0x01, 0x11,
    0x22, 0x46,
};

uint8_t fixture_idx;
uint8_t fixture_length = 18;

uint8_t modem_test_USART0_Read_cb(int call_count){
    printf("modem_test_USART0_Read_cb %d, %02X \n", call_count,  receive_datareq_fixture[fixture_idx]);
    return receive_datareq_fixture[fixture_idx++];
}

bool modem_test_USART0_IsRxReady_cb(int call_count){
    if (fixture_idx < fixture_length){
        return true;
    }
    printf("modem_test_USART0_Read_cb %d, EOD \n", call_count);
    return false;
}


void modem_receive_message_DATAREQ_test(){
    printf("\n modem_receive_message_DATAREQ_test: begin \n");

    fixture_idx = 0;
    
    USART0_IsRxReady_StubWithCallback(modem_test_USART0_IsRxReady_cb);
    USART0_Read_StubWithCallback(modem_test_USART0_Read_cb);
         
    ModemResponse_t* received = modem_receive_message();
    printf("\n modem_receive_message_DATAREQ_test: operation: %d, data length: %d\n", 
               received->operation, received->data_length);
       
    uint64_t coordinator = modem_get_coord_addr();
    for(uint8_t i = 0; i<4; i++){
        uint16_t actual = coordinator >> i*16;
        uint16_t expected =  expected_coord >> i*16;
        printf("modem_receive_message_DATAREQ_test: Group: %d, expected: %04X, actual: %04X \n", i, expected, actual );
        TEST_ASSERT_EQUAL_INT16(expected, actual);        
    }
    TEST_ASSERT_EQUAL_INT8(0x22, received->operation);        

    printf("\n modem_receive_message_DATAREQ_test: end \n");
}

void modem_receive_message_DATAACK_test(){
    printf("\n modem_receive_message_DATAACK_test: begin \n");
    
    printf("\n modem_receive_message_DATAACK_test: end \n");
}

void modem_receive_message_NODEINTROREQ_test(){
    printf("\n modem_receive_message_NODEINTROREQ_test: begin \n");
    
    printf("\n modem_receive_message_NODEINTROREQ_test: end \n");
}

void modem_receive_message_NODEINTROACK_test(){
    printf("\n modem_receive_message_NODEINTROACK_test: begin \n");
    
    printf("\n modem_receive_message_NODEINTROACK_test: end \n");
}


int run_modem_receive_tests(){
    UnityBegin("modem_test");
    printf("run_modem_receive_ready_tests: begin\n");
    
    RUN_TEST(modem_receive_message_DATAREQ_test);
    RUN_TEST(modem_receive_message_DATAACK_test);
    RUN_TEST(modem_receive_message_NODEINTROREQ_test);
    RUN_TEST(modem_receive_message_NODEINTROACK_test);
    

    UnityEnd();
    printf("run_modem_receive_ready_tests: end\n\n");
    return 0;   
 
}

