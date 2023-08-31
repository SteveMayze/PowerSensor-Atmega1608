/* AUTOGENERATED FILE. DO NOT EDIT. */
#ifndef _MOCKTWI0_MASTER_H
#define _MOCKTWI0_MASTER_H

#include "../unit/unity.h"
#include "../mcc_generated_files/include/twi0_master.h"

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

void Mocktwi0_master_Init(void);
void Mocktwi0_master_Destroy(void);
void Mocktwi0_master_Verify(void);




#define I2C0_SetReturnStopCallback_IgnoreAndReturn(cmock_retval) I2C0_SetReturnStopCallback_CMockIgnoreAndReturn(__LINE__, cmock_retval)
void I2C0_SetReturnStopCallback_CMockIgnoreAndReturn(UNITY_LINE_TYPE cmock_line, twi0_operations_t cmock_to_return);
#define I2C0_SetReturnStopCallback_StopIgnore() I2C0_SetReturnStopCallback_CMockStopIgnore()
void I2C0_SetReturnStopCallback_CMockStopIgnore(void);
#define I2C0_SetReturnStopCallback_ExpectAndReturn(funPtr, cmock_retval) I2C0_SetReturnStopCallback_CMockExpectAndReturn(__LINE__, funPtr, cmock_retval)
void I2C0_SetReturnStopCallback_CMockExpectAndReturn(UNITY_LINE_TYPE cmock_line, void* funPtr, twi0_operations_t cmock_to_return);
#define I2C0_SetReturnResetCallback_IgnoreAndReturn(cmock_retval) I2C0_SetReturnResetCallback_CMockIgnoreAndReturn(__LINE__, cmock_retval)
void I2C0_SetReturnResetCallback_CMockIgnoreAndReturn(UNITY_LINE_TYPE cmock_line, twi0_operations_t cmock_to_return);
#define I2C0_SetReturnResetCallback_StopIgnore() I2C0_SetReturnResetCallback_CMockStopIgnore()
void I2C0_SetReturnResetCallback_CMockStopIgnore(void);
#define I2C0_SetReturnResetCallback_ExpectAndReturn(funPtr, cmock_retval) I2C0_SetReturnResetCallback_CMockExpectAndReturn(__LINE__, funPtr, cmock_retval)
void I2C0_SetReturnResetCallback_CMockExpectAndReturn(UNITY_LINE_TYPE cmock_line, void* funPtr, twi0_operations_t cmock_to_return);
#define I2C0_SetRestartWriteCallback_IgnoreAndReturn(cmock_retval) I2C0_SetRestartWriteCallback_CMockIgnoreAndReturn(__LINE__, cmock_retval)
void I2C0_SetRestartWriteCallback_CMockIgnoreAndReturn(UNITY_LINE_TYPE cmock_line, twi0_operations_t cmock_to_return);
#define I2C0_SetRestartWriteCallback_StopIgnore() I2C0_SetRestartWriteCallback_CMockStopIgnore()
void I2C0_SetRestartWriteCallback_CMockStopIgnore(void);
#define I2C0_SetRestartWriteCallback_ExpectAndReturn(funPtr, cmock_retval) I2C0_SetRestartWriteCallback_CMockExpectAndReturn(__LINE__, funPtr, cmock_retval)
void I2C0_SetRestartWriteCallback_CMockExpectAndReturn(UNITY_LINE_TYPE cmock_line, void* funPtr, twi0_operations_t cmock_to_return);
#define I2C0_SetRestartReadCallback_IgnoreAndReturn(cmock_retval) I2C0_SetRestartReadCallback_CMockIgnoreAndReturn(__LINE__, cmock_retval)
void I2C0_SetRestartReadCallback_CMockIgnoreAndReturn(UNITY_LINE_TYPE cmock_line, twi0_operations_t cmock_to_return);
#define I2C0_SetRestartReadCallback_StopIgnore() I2C0_SetRestartReadCallback_CMockStopIgnore()
void I2C0_SetRestartReadCallback_CMockStopIgnore(void);
#define I2C0_SetRestartReadCallback_ExpectAndReturn(funPtr, cmock_retval) I2C0_SetRestartReadCallback_CMockExpectAndReturn(__LINE__, funPtr, cmock_retval)
void I2C0_SetRestartReadCallback_CMockExpectAndReturn(UNITY_LINE_TYPE cmock_line, void* funPtr, twi0_operations_t cmock_to_return);
#define I2C0_Initialize_IgnoreAndReturn(cmock_retval) I2C0_Initialize_CMockIgnoreAndReturn(__LINE__, cmock_retval)
void I2C0_Initialize_CMockIgnoreAndReturn(UNITY_LINE_TYPE cmock_line, uint8_t cmock_to_return);
#define I2C0_Initialize_StopIgnore() I2C0_Initialize_CMockStopIgnore()
void I2C0_Initialize_CMockStopIgnore(void);
#define I2C0_Initialize_ExpectAndReturn(cmock_retval) I2C0_Initialize_CMockExpectAndReturn(__LINE__, cmock_retval)
void I2C0_Initialize_CMockExpectAndReturn(UNITY_LINE_TYPE cmock_line, uint8_t cmock_to_return);
#define I2C0_Open_IgnoreAndReturn(cmock_retval) I2C0_Open_CMockIgnoreAndReturn(__LINE__, cmock_retval)
void I2C0_Open_CMockIgnoreAndReturn(UNITY_LINE_TYPE cmock_line, twi0_error_t cmock_to_return);
#define I2C0_Open_StopIgnore() I2C0_Open_CMockStopIgnore()
void I2C0_Open_CMockStopIgnore(void);
#define I2C0_Open_ExpectAndReturn(address, cmock_retval) I2C0_Open_CMockExpectAndReturn(__LINE__, address, cmock_retval)
void I2C0_Open_CMockExpectAndReturn(UNITY_LINE_TYPE cmock_line, twi0_address_t address, twi0_error_t cmock_to_return);
#define I2C0_Close_IgnoreAndReturn(cmock_retval) I2C0_Close_CMockIgnoreAndReturn(__LINE__, cmock_retval)
void I2C0_Close_CMockIgnoreAndReturn(UNITY_LINE_TYPE cmock_line, twi0_error_t cmock_to_return);
#define I2C0_Close_StopIgnore() I2C0_Close_CMockStopIgnore()
void I2C0_Close_CMockStopIgnore(void);
#define I2C0_Close_ExpectAndReturn(cmock_retval) I2C0_Close_CMockExpectAndReturn(__LINE__, cmock_retval)
void I2C0_Close_CMockExpectAndReturn(UNITY_LINE_TYPE cmock_line, twi0_error_t cmock_to_return);
#define I2C0_MasterOperation_IgnoreAndReturn(cmock_retval) I2C0_MasterOperation_CMockIgnoreAndReturn(__LINE__, cmock_retval)
void I2C0_MasterOperation_CMockIgnoreAndReturn(UNITY_LINE_TYPE cmock_line, twi0_error_t cmock_to_return);
#define I2C0_MasterOperation_StopIgnore() I2C0_MasterOperation_CMockStopIgnore()
void I2C0_MasterOperation_CMockStopIgnore(void);
#define I2C0_MasterOperation_ExpectAndReturn(read, cmock_retval) I2C0_MasterOperation_CMockExpectAndReturn(__LINE__, read, cmock_retval)
void I2C0_MasterOperation_CMockExpectAndReturn(UNITY_LINE_TYPE cmock_line, bool read, twi0_error_t cmock_to_return);
#define I2C0_MasterWrite_IgnoreAndReturn(cmock_retval) I2C0_MasterWrite_CMockIgnoreAndReturn(__LINE__, cmock_retval)
void I2C0_MasterWrite_CMockIgnoreAndReturn(UNITY_LINE_TYPE cmock_line, twi0_error_t cmock_to_return);
#define I2C0_MasterWrite_StopIgnore() I2C0_MasterWrite_CMockStopIgnore()
void I2C0_MasterWrite_CMockStopIgnore(void);
#define I2C0_MasterWrite_ExpectAndReturn(cmock_retval) I2C0_MasterWrite_CMockExpectAndReturn(__LINE__, cmock_retval)
void I2C0_MasterWrite_CMockExpectAndReturn(UNITY_LINE_TYPE cmock_line, twi0_error_t cmock_to_return);
#define I2C0_MasterRead_IgnoreAndReturn(cmock_retval) I2C0_MasterRead_CMockIgnoreAndReturn(__LINE__, cmock_retval)
void I2C0_MasterRead_CMockIgnoreAndReturn(UNITY_LINE_TYPE cmock_line, twi0_error_t cmock_to_return);
#define I2C0_MasterRead_StopIgnore() I2C0_MasterRead_CMockStopIgnore()
void I2C0_MasterRead_CMockStopIgnore(void);
#define I2C0_MasterRead_ExpectAndReturn(cmock_retval) I2C0_MasterRead_CMockExpectAndReturn(__LINE__, cmock_retval)
void I2C0_MasterRead_CMockExpectAndReturn(UNITY_LINE_TYPE cmock_line, twi0_error_t cmock_to_return);
#define I2C0_SetTimeout_Ignore() I2C0_SetTimeout_CMockIgnore()
void I2C0_SetTimeout_CMockIgnore(void);
#define I2C0_SetTimeout_StopIgnore() I2C0_SetTimeout_CMockStopIgnore()
void I2C0_SetTimeout_CMockStopIgnore(void);
#define I2C0_SetTimeout_Expect(to) I2C0_SetTimeout_CMockExpect(__LINE__, to)
void I2C0_SetTimeout_CMockExpect(UNITY_LINE_TYPE cmock_line, uint8_t to);
#define I2C0_SetBuffer_Ignore() I2C0_SetBuffer_CMockIgnore()
void I2C0_SetBuffer_CMockIgnore(void);
#define I2C0_SetBuffer_StopIgnore() I2C0_SetBuffer_CMockStopIgnore()
void I2C0_SetBuffer_CMockStopIgnore(void);
#define I2C0_SetBuffer_Expect(buffer, bufferSize) I2C0_SetBuffer_CMockExpect(__LINE__, buffer, bufferSize)
void I2C0_SetBuffer_CMockExpect(UNITY_LINE_TYPE cmock_line, void* buffer, size_t bufferSize);
#define I2C0_SetDataCompleteCallback_Ignore() I2C0_SetDataCompleteCallback_CMockIgnore()
void I2C0_SetDataCompleteCallback_CMockIgnore(void);
#define I2C0_SetDataCompleteCallback_StopIgnore() I2C0_SetDataCompleteCallback_CMockStopIgnore()
void I2C0_SetDataCompleteCallback_CMockStopIgnore(void);
#define I2C0_SetDataCompleteCallback_Expect(cb, funPtr) I2C0_SetDataCompleteCallback_CMockExpect(__LINE__, cb, funPtr)
void I2C0_SetDataCompleteCallback_CMockExpect(UNITY_LINE_TYPE cmock_line, twi0_callback_t cb, void* funPtr);
#define I2C0_SetWriteCollisionCallback_Ignore() I2C0_SetWriteCollisionCallback_CMockIgnore()
void I2C0_SetWriteCollisionCallback_CMockIgnore(void);
#define I2C0_SetWriteCollisionCallback_StopIgnore() I2C0_SetWriteCollisionCallback_CMockStopIgnore()
void I2C0_SetWriteCollisionCallback_CMockStopIgnore(void);
#define I2C0_SetWriteCollisionCallback_Expect(cb, funPtr) I2C0_SetWriteCollisionCallback_CMockExpect(__LINE__, cb, funPtr)
void I2C0_SetWriteCollisionCallback_CMockExpect(UNITY_LINE_TYPE cmock_line, twi0_callback_t cb, void* funPtr);
#define I2C0_SetAddressNackCallback_Ignore() I2C0_SetAddressNackCallback_CMockIgnore()
void I2C0_SetAddressNackCallback_CMockIgnore(void);
#define I2C0_SetAddressNackCallback_StopIgnore() I2C0_SetAddressNackCallback_CMockStopIgnore()
void I2C0_SetAddressNackCallback_CMockStopIgnore(void);
#define I2C0_SetAddressNackCallback_Expect(cb, funPtr) I2C0_SetAddressNackCallback_CMockExpect(__LINE__, cb, funPtr)
void I2C0_SetAddressNackCallback_CMockExpect(UNITY_LINE_TYPE cmock_line, twi0_callback_t cb, void* funPtr);
#define I2C0_SetDataNackCallback_Ignore() I2C0_SetDataNackCallback_CMockIgnore()
void I2C0_SetDataNackCallback_CMockIgnore(void);
#define I2C0_SetDataNackCallback_StopIgnore() I2C0_SetDataNackCallback_CMockStopIgnore()
void I2C0_SetDataNackCallback_CMockStopIgnore(void);
#define I2C0_SetDataNackCallback_Expect(cb, funPtr) I2C0_SetDataNackCallback_CMockExpect(__LINE__, cb, funPtr)
void I2C0_SetDataNackCallback_CMockExpect(UNITY_LINE_TYPE cmock_line, twi0_callback_t cb, void* funPtr);
#define I2C0_SetTimeoutCallback_Ignore() I2C0_SetTimeoutCallback_CMockIgnore()
void I2C0_SetTimeoutCallback_CMockIgnore(void);
#define I2C0_SetTimeoutCallback_StopIgnore() I2C0_SetTimeoutCallback_CMockStopIgnore()
void I2C0_SetTimeoutCallback_CMockStopIgnore(void);
#define I2C0_SetTimeoutCallback_Expect(cb, funPtr) I2C0_SetTimeoutCallback_CMockExpect(__LINE__, cb, funPtr)
void I2C0_SetTimeoutCallback_CMockExpect(UNITY_LINE_TYPE cmock_line, twi0_callback_t cb, void* funPtr);
#define I2C0_Poller_Ignore() I2C0_Poller_CMockIgnore()
void I2C0_Poller_CMockIgnore(void);
#define I2C0_Poller_StopIgnore() I2C0_Poller_CMockStopIgnore()
void I2C0_Poller_CMockStopIgnore(void);
#define I2C0_Poller_Expect() I2C0_Poller_CMockExpect(__LINE__)
void I2C0_Poller_CMockExpect(UNITY_LINE_TYPE cmock_line);
#define I2C0_SetAddress_Ignore() I2C0_SetAddress_CMockIgnore()
void I2C0_SetAddress_CMockIgnore(void);
#define I2C0_SetAddress_StopIgnore() I2C0_SetAddress_CMockStopIgnore()
void I2C0_SetAddress_CMockStopIgnore(void);
#define I2C0_SetAddress_Expect(address) I2C0_SetAddress_CMockExpect(__LINE__, address)
void I2C0_SetAddress_CMockExpect(UNITY_LINE_TYPE cmock_line, twi0_address_t address);

#ifdef __cplusplus
}
#endif

#if defined(__GNUC__) && !defined(__ICC) && !defined(__TMS470__)
#if __GNUC__ > 4 || (__GNUC__ == 4 && (__GNUC_MINOR__ > 6 || (__GNUC_MINOR__ == 6 && __GNUC_PATCHLEVEL__ > 0)))
#pragma GCC diagnostic pop
#endif
#endif

#endif
