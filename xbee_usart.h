/* 
 * File:   xbee_usart.h
 * Author: steve
 *
 * Created on April 13, 2023, 8:44 PM
 */

#ifndef XBEE_USART_H
#define	XBEE_USART_H

#ifdef	__cplusplus
extern "C" {
#endif
    
#include "mcc_generated_files/mcc.h"
    
// 0xFFFF 16 bit address is the broadcast address.    

    typedef enum XBEE_USART_STATE {
        XBEE_USART_STATE_SUCCESS,
        XBEE_USART_STATE_FAIL,
        XBEE_USART_STATE_TIMEOUT
    } XBEE_USART_STATE_T;



    
    void initialise_XBee_USART();
    
    bool xbee_usart_IsRxReady();

    bool xbee_usart_IsTxReady();

    XBEE_USART_STATE_T xbee_usart_SendFrame();
    
    
    XBEE_USART_STATE_T xbee_usart_wait_for_ack();

    
#ifdef	__cplusplus
}
#endif

#endif	/* XBEE_USART_H */

