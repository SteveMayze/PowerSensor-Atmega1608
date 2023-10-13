
#include "unity.h"
#include "modem_send_test.h"
#include "../modem.h"
#include "../mocks/Mockusart0.h"
#include "../libavrxbee/xbee.h"
#include "test_common.h"


/**
 * On wake, the node needs to toggle the reset and then
 * send a READY and then wait for a response.
 * If there is a time out, it should just go back to sleep and
 * try again later.
 * 
 * How to test that the reset pin was toggled? The problem being that the hardware
 * I/O is using virtual ports which are addressed to memory.
 * 
 */

     uint8_t data_fixture[46] = {
        0x7E, 0x00, 0x2A, 0x10, 0x01, 0x00, 0x00, 0x00, 
        0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFE, 0x00, 
        0x00, 0x11, 0x23, 0x12, 0x02, 0xC0, 0x2B, 0xE2, 
        0x09, 0xC0, 0x2D, 0xE2, 0x07, 0xC0, 0x31, 0x00, 
        0x00, 0x28, 0x41, 0x32, 0xCD, 0xCC, 0x4C, 0x3E, 
        0x33, 0x00, 0x00, 0xC0, 0x3F, 0x1E};

 void modem_send_message_DATA_test(){
    printf("\n modem_send_message_DATA_test: begin \n");
    actual_idx = 0;
     
    USART0_Write_StubWithCallback(modem_test_USART0_Write_cb);
     

    printf("data_fixture=\t");
    for(uint8_t i=0; i<46;i++ ){
        printf("0x%02X, ", data_fixture[i]);
        expected[i] = data_fixture[i];
    }
    printf("\n");    
     
    modem_test_message = node_create_message(NODE_TOKEN_DATA, get_test_sid());
    
    modem_test_message->data_length = 3;
    modem_test_message->data_token[0] = NODE_TOKEN_PROPERTY_BUS_VOLTAGE; // bus voltage
    modem_test_message->data_value[0] = (float)10.5;
    modem_test_message->data_token[1] = NODE_TOKEN_PROPERTY_SHUNT_VOLTAGE; // shunt voltage
    modem_test_message->data_value[1] = (float)0.2;
    modem_test_message->data_token[2] = NODE_TOKEN_PROPERTY_LOAD_CURRENT; // load current
    modem_test_message->data_value[2] = (float)1.5;    
       
    uint8_t size = node_message_to_stream(modem_test_message, payload);
    printf("payload size=\t%d \n", size);

    modem_send_message(payload, size);
    TEST_ASSERT_EQUAL(46, actual_idx);    
    printf("expected=\t");
    for(uint8_t i=0; i<46;i++ ){
        printf("0x%02X, ", expected[i]);
    }
    printf("\n");    
    printf("  actual=\t");
    for(uint8_t i=0; i<46;i++ ){
        printf("0x%02X, ", actual[i]);
    }
    printf("\n");
    TEST_ASSERT_EQUAL_HEX8_ARRAY(expected, actual, actual_idx);
    printf("\n modem_send_message_DATA_test: end \n");
     
 }
 
 
/**
 * A node is a generic device. It will follow the pattern of
 * 
 *  wake
 *  start the modem
 *  send a READY
 *  wait for a response
 *  On timeout, record this and go back to sleep
 * 
 *  on expected response, take the next step.
 *  on false response, record this and go back to sleep.
 * 
 * 
 * @return 
 */
int run_modem_send_data_tests(){
    UnityBegin("modem_test");
    printf("run_modem_send_data_tests: begin\n");
    
    
    RUN_TEST(modem_send_message_DATA_test);

    UnityEnd();
    printf("run_modem_send_data_tests: end\n\n");
    return 0;   
 
}


