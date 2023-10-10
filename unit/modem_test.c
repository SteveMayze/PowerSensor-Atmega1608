
#include "unity.h"
#include "modem_test.h"
#include "../modem.h"
#include "../mocks/Mockusart0.h"
#include "../libavrxbee/xbee.h"
#include "../node.h"
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
}

uint8_t actual[64] = {0};
uint8_t actual_idx = 0;

Node_Message_t *modem_test_message;


void modem_test_USART0_Write_cb(const uint8_t data, int call_count){
    printf("modem_test_USART0_Write %d, %02X \n", call_count, data);
    actual[actual_idx++] = data;
}


 void modem_send_message_test(){
     
    uint8_t *sid_ = get_test_sid();
     
    // USART0_Initialise_Ignore();
    USART0_Write_StubWithCallback(modem_test_USART0_Write_cb);
    //  ModemResponse_t modem_message;
     
    uint8_t expected[32] = {0x7E, 0x00, 0x1B, 0x10, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x06, 0x7A, 0x00, 0x00, 0x11, 0x21, 0x12, 0x02, 0xC0, 0x2B, 0xE2, 0x09, 0xC0, 0x2D, 0xE2, 0x07, 0xC0, 0xBE};
     
//     modem_message.operation = NODE_TOKEN_READY;
//     modem_message.data = 0;
//     modem_message.data_length = 0;
    modem_test_message = node_create_message(NODE_TOKEN_READY, sid_);
    uint8_t payload[50] = {0};
    modem_test_message->data_length = 0;
    
    uint8_t size = node_message_to_stream(modem_test_message, payload);

    modem_send_message(payload, size);
    
    for(uint8_t i=0; i<actual_idx;i++ ){
        printf("0x%02X, ", actual[i]);
    }
    printf("\n");

    TEST_ASSERT_EQUAL_HEX8_ARRAY(expected, actual, 10);
     
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
int run_modem_tests(){
    UnityBegin("modem_test");
    printf("run_modem_tests: begin\n");
    
    RUN_TEST(initialise_modem_test);
    
    RUN_TEST(modem_send_message_test);

    UnityEnd();
    printf("run_modem_tests: end\n\n");
    return 0;   
 
}


