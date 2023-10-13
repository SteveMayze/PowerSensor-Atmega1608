/* 
 * File:   note_test.h
 * Author: Steven
 *
 * Created on 29 June 2023, 16:33
 */

#ifndef NODE_MODEM_SEND_TEST_H
#define	NODE_MODEM_SEND_TEST_H

#ifdef	__cplusplus
extern "C" {
#endif
#include "../node.h"

extern uint8_t actual[46];
extern uint8_t actual_idx;
extern uint8_t expected[46];
extern uint8_t payload[48];

extern Node_Message_t *modem_test_message;

int run_modem_send_tests();

void modem_test_USART0_Write_cb(const uint8_t data, int call_count);

#ifdef	__cplusplus
}
#endif

#endif	/* NODE_MODEM_SEND_TEST_H */

