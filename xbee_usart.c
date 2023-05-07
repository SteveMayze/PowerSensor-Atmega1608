
#include "xbee_usart.h"



void initialise_XBee_USART() {
    
}


bool xbee_usart_IsRxReady(){
    return USART0_IsRxReady();
}

bool xbee_usart_IsTxReady(){
    return USART0_IsTxReady();
}

XBEE_USART_STATE_T xbee_usart_SendFrame(){
    return XBEE_USART_STATE_SUCCESS;
}

XBEE_USART_STATE_T xbee_usart_build_frame(){
    return XBEE_USART_STATE_SUCCESS;
}

XBEE_USART_STATE_T xbee_usart_wait_for_ack() {
    return XBEE_USART_STATE_SUCCESS;
}

