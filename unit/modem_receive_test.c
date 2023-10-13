
#include "unity.h"
#include "modem_receive_test.h"
#include "../modem.h"
#include "../mocks/Mockusart0.h"
#include "../libavrxbee/xbee.h"
#include "test_common.h"

void modem_send_message_DATAREQ_test(){
    printf("\n modem_send_message_DATAREQ_test: begin \n");
    
    printf("\n modem_send_message_DATAREQ_test: end \n");
}

void modem_send_message_DATAACK_test(){
    printf("\n modem_send_message_DATAACK_test: begin \n");
    
    printf("\n modem_send_message_DATAACK_test: end \n");
}

void modem_send_message_NODEINTROREQ_test(){
    printf("\n modem_send_message_NODEINTROREQ_test: begin \n");
    
    printf("\n modem_send_message_NODEINTROREQ_test: end \n");
}

void modem_send_message_NODEINTROACK_test(){
    printf("\n modem_send_message_NODEINTROACK_test: begin \n");
    
    printf("\n modem_send_message_NODEINTROACK_test: end \n");
}


int run_modem_receive_tests(){
    UnityBegin("modem_test");
    printf("run_modem_send_ready_tests: begin\n");
    
    RUN_TEST(modem_send_message_DATAREQ_test);
    RUN_TEST(modem_send_message_DATAACK_test);
    RUN_TEST(modem_send_message_NODEINTROREQ_test);
    RUN_TEST(modem_send_message_NODEINTROACK_test);
    

    UnityEnd();
    printf("run_modem_send_ready_tests: end\n\n");
    return 0;   
 
}

