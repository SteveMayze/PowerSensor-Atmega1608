/* AUTOGENERATED FILE. DO NOT EDIT. */
#ifndef _MOCKUSART0_H
#define _MOCKUSART0_H

#include "../cmock/src/unity.h"
#include "../mcc_generated_files/include/usart0.h"

/* Ignore the following warnings, since we are copying code */
#if defined(__GNUC__) && !defined(__ICC) && !defined(__TMS470__)
#if __GNUC__ > 4 || (__GNUC__ == 4 && (__GNUC_MINOR__ > 6 || (__GNUC_MINOR__ == 6 && __GNUC_PATCHLEVEL__ > 0)))
#pragma GCC diagnostic push
#endif
#if !defined(__clang__)
#pragma GCC diagnostic ignored "-Wpragmas"
#endif
#pragma GCC diagnostic ignored "-Wunknown-pragmas"
#pragma GCC diagnostic ignored "-Wduplicate-decl-specifier"
#endif

#ifdef __cplusplus
extern "C" {
#endif

void Mockusart0_Init(void);
void Mockusart0_Destroy(void);
void Mockusart0_Verify(void);




#define USART0_Initialize_Expect() USART0_Initialize_CMockExpect(__LINE__)
void USART0_Initialize_CMockExpect(UNITY_LINE_TYPE cmock_line);
#define USART0_Enable_Expect() USART0_Enable_CMockExpect(__LINE__)
void USART0_Enable_CMockExpect(UNITY_LINE_TYPE cmock_line);
#define USART0_EnableRx_Expect() USART0_EnableRx_CMockExpect(__LINE__)
void USART0_EnableRx_CMockExpect(UNITY_LINE_TYPE cmock_line);
#define USART0_EnableTx_Expect() USART0_EnableTx_CMockExpect(__LINE__)
void USART0_EnableTx_CMockExpect(UNITY_LINE_TYPE cmock_line);
#define USART0_Disable_Expect() USART0_Disable_CMockExpect(__LINE__)
void USART0_Disable_CMockExpect(UNITY_LINE_TYPE cmock_line);
#define USART0_GetData_ExpectAndReturn(cmock_retval) USART0_GetData_CMockExpectAndReturn(__LINE__, cmock_retval)
void USART0_GetData_CMockExpectAndReturn(UNITY_LINE_TYPE cmock_line, uint8_t cmock_to_return);
#define USART0_IsTxReady_ExpectAndReturn(cmock_retval) USART0_IsTxReady_CMockExpectAndReturn(__LINE__, cmock_retval)
void USART0_IsTxReady_CMockExpectAndReturn(UNITY_LINE_TYPE cmock_line, bool cmock_to_return);
#define USART0_IsRxReady_ExpectAndReturn(cmock_retval) USART0_IsRxReady_CMockExpectAndReturn(__LINE__, cmock_retval)
void USART0_IsRxReady_CMockExpectAndReturn(UNITY_LINE_TYPE cmock_line, bool cmock_to_return);
#define USART0_IsTxBusy_ExpectAndReturn(cmock_retval) USART0_IsTxBusy_CMockExpectAndReturn(__LINE__, cmock_retval)
void USART0_IsTxBusy_CMockExpectAndReturn(UNITY_LINE_TYPE cmock_line, bool cmock_to_return);
#define USART0_IsTxDone_ExpectAndReturn(cmock_retval) USART0_IsTxDone_CMockExpectAndReturn(__LINE__, cmock_retval)
void USART0_IsTxDone_CMockExpectAndReturn(UNITY_LINE_TYPE cmock_line, bool cmock_to_return);
#define USART0_Read_ExpectAndReturn(cmock_retval) USART0_Read_CMockExpectAndReturn(__LINE__, cmock_retval)
void USART0_Read_CMockExpectAndReturn(UNITY_LINE_TYPE cmock_line, uint8_t cmock_to_return);
#define USART0_Write_Expect(data) USART0_Write_CMockExpect(__LINE__, data)
void USART0_Write_CMockExpect(UNITY_LINE_TYPE cmock_line, const uint8_t data);
#define USART0_DefaultRxIsrCb_Expect() USART0_DefaultRxIsrCb_CMockExpect(__LINE__)
void USART0_DefaultRxIsrCb_CMockExpect(UNITY_LINE_TYPE cmock_line);
#define USART0_DefaultTxIsrCb_Expect() USART0_DefaultTxIsrCb_CMockExpect(__LINE__)
void USART0_DefaultTxIsrCb_CMockExpect(UNITY_LINE_TYPE cmock_line);
#define USART0_SetISRCb_Expect(cb, type) USART0_SetISRCb_CMockExpect(__LINE__, cb, type)
void USART0_SetISRCb_CMockExpect(UNITY_LINE_TYPE cmock_line, usart_callback cb, usart0_cb_t type);
#define USART0_SetRXISRCb_Expect(cb) USART0_SetRXISRCb_CMockExpect(__LINE__, cb)
void USART0_SetRXISRCb_CMockExpect(UNITY_LINE_TYPE cmock_line, usart_callback cb);
#define USART0_SetTXISRCb_Expect(cb) USART0_SetTXISRCb_CMockExpect(__LINE__, cb)
void USART0_SetTXISRCb_CMockExpect(UNITY_LINE_TYPE cmock_line, usart_callback cb);

#ifdef __cplusplus
}
#endif

#if defined(__GNUC__) && !defined(__ICC) && !defined(__TMS470__)
#if __GNUC__ > 4 || (__GNUC__ == 4 && (__GNUC_MINOR__ > 6 || (__GNUC_MINOR__ == 6 && __GNUC_PATCHLEVEL__ > 0)))
#pragma GCC diagnostic pop
#endif
#endif

#endif
