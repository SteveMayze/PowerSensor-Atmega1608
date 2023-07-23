/* AUTOGENERATED FILE. DO NOT EDIT. */
#include <string.h>
#include <stdlib.h>
#include <setjmp.h>
#include "../cmock/src/cmock.h"
#include "MockINA219.h"

static const char* CMockString_INA219_Initialise = "INA219_Initialise";
static const char* CMockString_INA219_getReadings = "INA219_getReadings";
static const char* CMockString_addr = "addr";

typedef struct _CMOCK_INA219_Initialise_CALL_INSTANCE
{
  UNITY_LINE_TYPE LineNumber;
  uint8_t Expected_addr;

} CMOCK_INA219_Initialise_CALL_INSTANCE;

typedef struct _CMOCK_INA219_getReadings_CALL_INSTANCE
{
  UNITY_LINE_TYPE LineNumber;
  INA219_Data_t* ReturnVal;

} CMOCK_INA219_getReadings_CALL_INSTANCE;

static struct MockINA219Instance
{
  CMOCK_MEM_INDEX_TYPE INA219_Initialise_CallInstance;
  CMOCK_MEM_INDEX_TYPE INA219_getReadings_CallInstance;
} Mock;

extern jmp_buf AbortFrame;

void MockINA219_Verify(void)
{
  UNITY_LINE_TYPE cmock_line = TEST_LINE_NUM;
  CMOCK_MEM_INDEX_TYPE call_instance;
  call_instance = Mock.INA219_Initialise_CallInstance;
  if (CMOCK_GUTS_NONE != call_instance)
  {
    UNITY_SET_DETAIL(CMockString_INA219_Initialise);
    UNITY_TEST_FAIL(cmock_line, CMockStringCalledLess);
  }
  call_instance = Mock.INA219_getReadings_CallInstance;
  if (CMOCK_GUTS_NONE != call_instance)
  {
    UNITY_SET_DETAIL(CMockString_INA219_getReadings);
    UNITY_TEST_FAIL(cmock_line, CMockStringCalledLess);
  }
}

void MockINA219_Init(void)
{
  MockINA219_Destroy();
}

void MockINA219_Destroy(void)
{
  CMock_Guts_MemFreeAll();
  memset(&Mock, 0, sizeof(Mock));
}

void INA219_Initialise(uint8_t addr)
{
  UNITY_LINE_TYPE cmock_line = TEST_LINE_NUM;
  CMOCK_INA219_Initialise_CALL_INSTANCE* cmock_call_instance;
  UNITY_SET_DETAIL(CMockString_INA219_Initialise);
  cmock_call_instance = (CMOCK_INA219_Initialise_CALL_INSTANCE*)CMock_Guts_GetAddressFor(Mock.INA219_Initialise_CallInstance);
  Mock.INA219_Initialise_CallInstance = CMock_Guts_MemNext(Mock.INA219_Initialise_CallInstance);
  UNITY_TEST_ASSERT_NOT_NULL(cmock_call_instance, cmock_line, CMockStringCalledMore);
  cmock_line = cmock_call_instance->LineNumber;
  {
    UNITY_SET_DETAILS(CMockString_INA219_Initialise,CMockString_addr);
    UNITY_TEST_ASSERT_EQUAL_HEX8(cmock_call_instance->Expected_addr, addr, cmock_line, CMockStringMismatch);
  }
  UNITY_CLR_DETAILS();
}

void CMockExpectParameters_INA219_Initialise(CMOCK_INA219_Initialise_CALL_INSTANCE* cmock_call_instance, uint8_t addr);
void CMockExpectParameters_INA219_Initialise(CMOCK_INA219_Initialise_CALL_INSTANCE* cmock_call_instance, uint8_t addr)
{
  cmock_call_instance->Expected_addr = addr;
}

void INA219_Initialise_CMockExpect(UNITY_LINE_TYPE cmock_line, uint8_t addr)
{
  CMOCK_MEM_INDEX_TYPE cmock_guts_index = CMock_Guts_MemNew(sizeof(CMOCK_INA219_Initialise_CALL_INSTANCE));
  CMOCK_INA219_Initialise_CALL_INSTANCE* cmock_call_instance = (CMOCK_INA219_Initialise_CALL_INSTANCE*)CMock_Guts_GetAddressFor(cmock_guts_index);
  UNITY_TEST_ASSERT_NOT_NULL(cmock_call_instance, cmock_line, CMockStringOutOfMemory);
  memset(cmock_call_instance, 0, sizeof(*cmock_call_instance));
  Mock.INA219_Initialise_CallInstance = CMock_Guts_MemChain(Mock.INA219_Initialise_CallInstance, cmock_guts_index);
  cmock_call_instance->LineNumber = cmock_line;
  CMockExpectParameters_INA219_Initialise(cmock_call_instance, addr);
}

INA219_Data_t* INA219_getReadings(void)
{
  UNITY_LINE_TYPE cmock_line = TEST_LINE_NUM;
  CMOCK_INA219_getReadings_CALL_INSTANCE* cmock_call_instance;
  UNITY_SET_DETAIL(CMockString_INA219_getReadings);
  cmock_call_instance = (CMOCK_INA219_getReadings_CALL_INSTANCE*)CMock_Guts_GetAddressFor(Mock.INA219_getReadings_CallInstance);
  Mock.INA219_getReadings_CallInstance = CMock_Guts_MemNext(Mock.INA219_getReadings_CallInstance);
  UNITY_TEST_ASSERT_NOT_NULL(cmock_call_instance, cmock_line, CMockStringCalledMore);
  cmock_line = cmock_call_instance->LineNumber;
  UNITY_CLR_DETAILS();
  return cmock_call_instance->ReturnVal;
}

void INA219_getReadings_CMockExpectAndReturn(UNITY_LINE_TYPE cmock_line, INA219_Data_t* cmock_to_return)
{
  CMOCK_MEM_INDEX_TYPE cmock_guts_index = CMock_Guts_MemNew(sizeof(CMOCK_INA219_getReadings_CALL_INSTANCE));
  CMOCK_INA219_getReadings_CALL_INSTANCE* cmock_call_instance = (CMOCK_INA219_getReadings_CALL_INSTANCE*)CMock_Guts_GetAddressFor(cmock_guts_index);
  UNITY_TEST_ASSERT_NOT_NULL(cmock_call_instance, cmock_line, CMockStringOutOfMemory);
  memset(cmock_call_instance, 0, sizeof(*cmock_call_instance));
  Mock.INA219_getReadings_CallInstance = CMock_Guts_MemChain(Mock.INA219_getReadings_CallInstance, cmock_guts_index);
  cmock_call_instance->LineNumber = cmock_line;
  cmock_call_instance->ReturnVal = cmock_to_return;
}

