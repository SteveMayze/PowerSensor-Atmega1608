
#include "unity.h"
#include "modem_receive_test.h"
#include "../modem.h"
#include "../mocks/Mockusart0.h"
#include "../libavrxbee/xbee.h"
#include "test_common.h"


uint8_t receive_fixture[64] = {0};
uint8_t fixture_idx;
uint8_t fixture_length;

uint8_t modem_test_USART0_Read_cb(int call_count){
    printf("modem_test_USART0_Read_cb %d, %02X \n", call_count,  receive_fixture[fixture_idx]);
    return receive_fixture[fixture_idx++];
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
    fixture_length = 10;
    
    // uint8_t *sid_ = get_test_sid();
    USART0_IsRxReady_StubWithCallback(modem_test_USART0_IsRxReady_cb);
    USART0_Read_StubWithCallback(modem_test_USART0_Read_cb);
     

//    printf("ready_fixture=\t");
//    for(uint8_t i=0; i<31;i++ ){
//        printf("0x%02X, ", ready_fixture[i]);
//        expected[i] = ready_fixture[i];
//    }
//    printf("\n");    
     
    
//    uint8_t size = node_message_to_stream(modem_test_message, payload);
//    printf("payload size=\t%d \n", size);

    ModemResponse_t* received = modem_receive_message();
    printf("\n modem_receive_message_DATAREQ_test: operation: %d, data length: %d\n", 
               received->operation, received->data_length);
       
    uint64_t coordinator = modem_get_coord_addr();

    for(uint8_t i = 0; i<4; i++){
        uint16_t actual = coordinator >> i*16;
        uint16_t expected = XBEE_ADDR_BROADCAST >> i*16;
        printf("modem_receive_message_DATAREQ_test: Group: %d, expected: %04X, actual: %04X \n", i, expected, actual );
        TEST_ASSERT_EQUAL_INT16(expected, actual);        
    }
    
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

