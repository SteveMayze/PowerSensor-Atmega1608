
#include "../build-config.h"

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
    NODE_TOKEN_DATAREQ, 0x46,
};
// 7E 00 0E 90 02 04 08 10 20 40 80 CC FF FE 01 11 23 73
uint8_t receive_dataack_fixture[18] = {
    0x7E, 0x00, 0x0E, 0x90, 0x02, 0x04, 0x08, 0x10, 
    0x20, 0x40, 0x80, 0xCC, 0xFF, 0xFE, 0x01, 0x11,
    NODE_TOKEN_DATAACK, 0x73,
};

// 7E 00 0E 90 02 04 08 10 20 40 80 CC FF FE 01 11 25 71
uint8_t receive_nodeintroreq_fixture[18] = {
    0x7E, 0x00, 0x0E, 0x90, 0x02, 0x04, 0x08, 0x10, 
    0x20, 0x40, 0x80, 0xCC, 0xFF, 0xFE, 0x01, 0x11,
    NODE_TOKEN_NODEINTROREQ, 0x71,
};

// 7E 00 0E 90 02 04 08 10 20 40 80 CC FF FE 01 11 27 6F
uint8_t receive_nodeintroack_fixture[18] = {
    0x7E, 0x00, 0x0E, 0x90, 0x02, 0x04, 0x08, 0x10, 
    0x20, 0x40, 0x80, 0xCC, 0xFF, 0xFE, 0x01, 0x11,
    NODE_TOKEN_NODEINTROACK, 0x6F,
};

uint8_t fixture_idx;
uint8_t fixture_length = 18;
Token_t fixture_type;

uint8_t modem_test_USART0_Read_cb(int call_count){
    uint8_t *fixture;
    switch(fixture_type){
        case(NODE_TOKEN_DATAREQ):
            fixture = receive_datareq_fixture;
            break;
        case(NODE_TOKEN_DATAACK):
            fixture = receive_dataack_fixture;
            break;
        case(NODE_TOKEN_NODEINTROREQ):
            fixture = receive_nodeintroreq_fixture;
            break;
        case(NODE_TOKEN_NODEINTROACK):
            fixture = receive_nodeintroack_fixture;
            break;
        default:
            TEST_FAIL_MESSAGE("The fixture type is not supported.");
            break;
    }
    LOG_INFO("modem_test_USART0_Read_cb %d, %02X \n", call_count,  fixture[fixture_idx]);
    return fixture[fixture_idx++];
}

bool modem_test_USART0_IsRxReady_cb(int call_count){
    if (fixture_idx < fixture_length){
        return true;
    }
    LOG_INFO("modem_test_USART0_Read_cb %d, EOD \n", call_count);
    return false;
}


void modem_receive_message_DATAREQ_test(){
    LOG_INFO("\n modem_receive_message_DATAREQ_test: begin \n");

    fixture_type = NODE_TOKEN_DATAREQ;
    fixture_idx = 0;
    
    USART0_IsRxReady_StubWithCallback(modem_test_USART0_IsRxReady_cb);
    USART0_Read_StubWithCallback(modem_test_USART0_Read_cb);
         
    ModemResponse_t* received = modem_receive_message();
    LOG_INFO("\n modem_receive_message_DATAREQ_test: operation: %d, data length: %d\n", 
               received->operation, received->data_length);
       
    uint64_t coordinator = modem_get_coord_addr();
    for(uint8_t i = 0; i<4; i++){
        uint16_t actual = coordinator >> i*16;
        uint16_t expected =  expected_coord >> i*16;
        LOG_INFO("modem_receive_message_DATAREQ_test: Group: %d, expected: %04X, actual: %04X \n", i, expected, actual );
        TEST_ASSERT_EQUAL_INT16(expected, actual);        
    }
    TEST_ASSERT_EQUAL_INT8(NODE_TOKEN_DATAREQ, received->operation);        

    LOG_INFO("\n modem_receive_message_DATAREQ_test: end \n");
}

void modem_receive_message_DATAACK_test(){
    LOG_INFO("\n modem_receive_message_DATAACK_test: begin \n");
    
    fixture_type = NODE_TOKEN_DATAACK;
    fixture_idx = 0;
    
    USART0_IsRxReady_StubWithCallback(modem_test_USART0_IsRxReady_cb);
    USART0_Read_StubWithCallback(modem_test_USART0_Read_cb);
         
    ModemResponse_t* received = modem_receive_message();
    LOG_INFO("\n modem_receive_message_DATAACK_test: operation: %d, data length: %d\n", 
               received->operation, received->data_length);
       
    uint64_t coordinator = modem_get_coord_addr();
    for(uint8_t i = 0; i<4; i++){
        uint16_t actual = coordinator >> i*16;
        uint16_t expected =  expected_coord >> i*16;
        LOG_INFO("modem_receive_message_DATAACK_test: Group: %d, expected: %04X, actual: %04X \n", i, expected, actual );
        TEST_ASSERT_EQUAL_INT16(expected, actual);        
    }
    TEST_ASSERT_EQUAL_INT8(NODE_TOKEN_DATAACK, received->operation);        
    
    LOG_INFO("\n modem_receive_message_DATAACK_test: end \n");
}

void modem_receive_message_NODEINTROREQ_test(){
    LOG_INFO("\n modem_receive_message_NODEINTROREQ_test: begin \n");

    fixture_type = NODE_TOKEN_NODEINTROREQ;
    fixture_idx = 0;
    
    USART0_IsRxReady_StubWithCallback(modem_test_USART0_IsRxReady_cb);
    USART0_Read_StubWithCallback(modem_test_USART0_Read_cb);
         
    ModemResponse_t* received = modem_receive_message();
    LOG_INFO("\n modem_receive_message_NODEINTROREQ_test: operation: %d, data length: %d\n", 
               received->operation, received->data_length);
       
    uint64_t coordinator = modem_get_coord_addr();
    for(uint8_t i = 0; i<4; i++){
        uint16_t actual = coordinator >> i*16;
        uint16_t expected =  expected_coord >> i*16;
        LOG_INFO("modem_receive_message_NODEINTROREQ_test: Group: %d, expected: %04X, actual: %04X \n", i, expected, actual );
        TEST_ASSERT_EQUAL_INT16(expected, actual);        
    }
    TEST_ASSERT_EQUAL_INT8(NODE_TOKEN_NODEINTROREQ, received->operation);            
    
    LOG_INFO("\n modem_receive_message_NODEINTROREQ_test: end \n");
}

void modem_receive_message_NODEINTROACK_test(){
    LOG_INFO("\n modem_receive_message_NODEINTROACK_test: begin \n");

    fixture_type = NODE_TOKEN_NODEINTROACK;
    fixture_idx = 0;
    
    USART0_IsRxReady_StubWithCallback(modem_test_USART0_IsRxReady_cb);
    USART0_Read_StubWithCallback(modem_test_USART0_Read_cb);
         
    ModemResponse_t* received = modem_receive_message();
    LOG_INFO("\n modem_receive_message_NODEINTROACK_test: operation: %d, data length: %d\n", 
               received->operation, received->data_length);
       
    uint64_t coordinator = modem_get_coord_addr();
    for(uint8_t i = 0; i<4; i++){
        uint16_t actual = coordinator >> i*16;
        uint16_t expected =  expected_coord >> i*16;
        LOG_INFO("modem_receive_message_NODEINTROACK_test: Group: %d, expected: %04X, actual: %04X \n", i, expected, actual );
        TEST_ASSERT_EQUAL_INT16(expected, actual);        
    }
    TEST_ASSERT_EQUAL_INT8(NODE_TOKEN_NODEINTROACK, received->operation);            

    
    LOG_INFO("\n modem_receive_message_NODEINTROACK_test: end \n");
}


int run_modem_receive_tests(){
    UnityBegin("modem_test");
    LOG_INFO("run_modem_receive_ready_tests: begin\n");
    
    RUN_TEST(modem_receive_message_DATAREQ_test);
    RUN_TEST(modem_receive_message_DATAACK_test);
    RUN_TEST(modem_receive_message_NODEINTROREQ_test);
    RUN_TEST(modem_receive_message_NODEINTROACK_test);
    

    UnityEnd();
    LOG_INFO("run_modem_receive_ready_tests: end\n\n");
    return 0;   
 
}

