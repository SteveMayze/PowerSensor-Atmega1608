
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


void initialise_modem_test(){
    printf("\n initialise_modem_test: begin \n");
    
    // The broadcast address is set on the initial start up of the system
    // this enables the system to connect to the nearest available coordinator
    // and introduce itself.
    modem_open(XBEE_ADDR_BROADCAST);
    
    uint64_t coordinator = modem_get_coord_addr();
    
    printf("initialise_modem_test: Coordinator Address: %04X %04X %04X %04X\n", 
            (uint16_t)(coordinator >> 48)&0xFFFF, 
            (uint16_t)(coordinator >> 32)&0xFFFF, 
            (uint16_t)(coordinator >> 16)&0xFFFF, 
            (uint16_t)(coordinator)&0xFFFF);    
    
    for(uint8_t i = 0; i<4; i++){
        uint16_t actual = coordinator >> i*16;
        uint16_t expected = XBEE_ADDR_BROADCAST >> i*16;
        printf("initialise_modem_test: Group: %d, expected: %04X, actual: %04X \n", i, expected, actual );
        
        TEST_ASSERT_EQUAL_INT16(expected, actual);        
    }
    printf("\n initialise_modem_test: end \n");
}

uint8_t ready_fixture[31] = {   
    0x7E, 0x00, 0x1B, 0x10, 0x01, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFE, 0x00, 
    0x00, 0x11, 0x21, 0x12, 0x02, 0xC0, 0x2B, 0xE2, 
    0x09, 0xC0, 0x2D, 0xE2, 0x07, 0xC0, 0x41,
};

void modem_test_USART0_Write_cb(const uint8_t data, int call_count){
    printf("modem_test_USART0_Write %d, %02X \n", call_count, data);
    actual[actual_idx++] = data;
}


 void modem_send_message_READY_test(){
    printf("\n modem_send_message_READY_test: begin \n");
    actual_idx = 0;
     
    uint8_t *sid_ = get_test_sid();
     
    USART0_Write_StubWithCallback(modem_test_USART0_Write_cb);
     

    printf("ready_fixture=\t");
    for(uint8_t i=0; i<31;i++ ){
        printf("0x%02X, ", ready_fixture[i]);
        expected[i] = ready_fixture[i];
    }
    printf("\n");    
     
    modem_test_message = node_create_message(NODE_TOKEN_READY, sid_);
    // Operation token, operation, sid
    modem_test_message->data_length = 0;
    
    uint8_t size = node_message_to_stream(modem_test_message, payload);
    printf("payload size=\t%d \n", size);

    modem_send_message(payload, size);
    TEST_ASSERT_EQUAL(31, actual_idx); 
    printf("expected=\t");
    for(uint8_t i=0; i<31;i++ ){
        printf("0x%02X, ", expected[i]);
    }
    printf("\n");    
    printf("  actual=\t");
    for(uint8_t i=0; i<31;i++ ){
        printf("0x%02X, ", actual[i]);
    }
    printf("\n");
    
    TEST_ASSERT_EQUAL_HEX8_ARRAY(expected, actual, actual_idx);
    printf("\n modem_send_message_READY_test: end \n");
     
 }
 
 
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
 
 
  uint8_t nodeintro_fixture[41] = {
    0x7E, 0x00, 0x25, 0x10, 0x01, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFE, 0x00, 0x00, 
    NODE_TOKEN_HEADER_OPERATION, NODE_TOKEN_NODEINTRO,
    NODE_TOKEN_HEADER_SERIAL_ID, 0x02 , 0xC0 , 0x2B , 0xE2 , 0x09 , 0xC0 , 0x2D , 0xE2 , 0x07 , 0xC0,
    NODE_TOKEN_HEADER_DOMAIN, NODE_METADATA_DOMAIN_POWER,
    NODE_TOKEN_HEADER_CLASS, NODE_METADATA_CLASS_SENSOR,
    NODE_TOKEN_PROPERTY, NODE_TOKEN_PROPERTY_BUS_VOLTAGE,
    NODE_TOKEN_PROPERTY, NODE_TOKEN_PROPERTY_SHUNT_VOLTAGE,
    NODE_TOKEN_PROPERTY, NODE_TOKEN_PROPERTY_LOAD_CURRENT, 0x5B,
  };
  
  
 void modem_send_message_NODEINTRO_test(){
    printf("\n modem_send_message_NODEINTRO_test: begin \n");
    actual_idx = 0;
    uint8_t payload_length = 41;
    uint8_t *sid_ = get_test_sid();
     
    USART0_Write_StubWithCallback(modem_test_USART0_Write_cb);
     
   

    printf("nodeintro_fixture=\t");
    for(uint8_t i=0; i<payload_length;i++ ){
        printf("0x%02X, ", nodeintro_fixture[i]);
        expected[i] = nodeintro_fixture[i];
    }
    printf("\n");    
     
   
    Node_Message_t *modem_test_message = node_create_message(NODE_TOKEN_NODEINTRO, sid_);
    modem_test_message->data_length = 5;
    modem_test_message->data_token[0]=NODE_TOKEN_HEADER_DOMAIN;
    modem_test_message->data_value[0]=NODE_METADATA_DOMAIN_POWER;
    modem_test_message->data_token[1]=NODE_TOKEN_HEADER_CLASS;
    modem_test_message->data_value[1]=NODE_METADATA_CLASS_SENSOR;
    modem_test_message->data_token[2]=NODE_TOKEN_PROPERTY;
    modem_test_message->data_value[2]=NODE_TOKEN_PROPERTY_BUS_VOLTAGE;
    modem_test_message->data_token[3]=NODE_TOKEN_PROPERTY;
    modem_test_message->data_value[3]=NODE_TOKEN_PROPERTY_SHUNT_VOLTAGE;
    modem_test_message->data_token[4]=NODE_TOKEN_PROPERTY;
    modem_test_message->data_value[4]=NODE_TOKEN_PROPERTY_LOAD_CURRENT;
    

    uint8_t size = node_message_to_stream(modem_test_message, payload);

    modem_send_message(payload, size);
    TEST_ASSERT_EQUAL(payload_length, actual_idx);    
    printf("expected=\t");
    for(uint8_t i=0; i<payload_length;i++ ){
        printf("0x%02X, ", expected[i]);
    }
    printf("\n");    
    printf("  actual=\t");
    for(uint8_t i=0; i<payload_length;i++ ){
        printf("0x%02X, ", actual[i]);
    }
    printf("\n");
    TEST_ASSERT_EQUAL_HEX8_ARRAY(expected, actual, actual_idx);
    printf("\n modem_send_message_NODEINTRO_test: end \n");
     
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
int run_modem_send_tests(){
    UnityBegin("modem_test");
    printf("run_modem_send_ready_tests: begin\n");
    
    RUN_TEST(initialise_modem_test);
    
    RUN_TEST(modem_send_message_READY_test);
    RUN_TEST(modem_send_message_DATA_test);
    RUN_TEST(modem_send_message_NODEINTRO_test);

    UnityEnd();
    printf("run_modem_send_ready_tests: end\n\n");
    return 0;   
 
}

