/* AUTOGENERATED FILE. DO NOT EDIT. */
#include <string.h>
#include <stdlib.h>
#include <setjmp.h>
#include "cmock.h"
#include "Mockmodem.h"

static const char* CMockString_coordinator = "coordinator";
static const char* CMockString_modem_get_coord_addr = "modem_get_coord_addr";
static const char* CMockString_modem_initialise = "modem_initialise";

typedef struct _CMOCK_modem_initialise_CALL_INSTANCE
{
  UNITY_LINE_TYPE LineNumber;
  uint64_t Expected_coordinator;

} CMOCK_modem_initialise_CALL_INSTANCE;

typedef struct _CMOCK_modem_get_coord_addr_CALL_INSTANCE
{
  UNITY_LINE_TYPE LineNumber;
  uint64_t ReturnVal;

} CMOCK_modem_get_coord_addr_CALL_INSTANCE;

static struct MockmodemInstance
{
  CMOCK_MEM_INDEX_TYPE modem_initialise_CallInstance;
  CMOCK_MEM_INDEX_TYPE modem_get_coord_addr_CallInstance;
} Mock;

extern jmp_buf AbortFrame;

void Mockmodem_Verify(void)
{
  UNITY_LINE_TYPE cmock_line = TEST_LINE_NUM;
  CMOCK_MEM_INDEX_TYPE call_instance;
  call_instance = Mock.modem_initialise_CallInstance;
  if (CMOCK_GUTS_NONE != call_instance)
  {
    UNITY_SET_DETAIL(CMockString_modem_initialise);
    UNITY_TEST_FAIL(cmock_line, CMockStringCalledLess);
  }
  call_instance = Mock.modem_get_coord_addr_CallInstance;
  if (CMOCK_GUTS_NONE != call_instance)
  {
    UNITY_SET_DETAIL(CMockString_modem_get_coord_addr);
    UNITY_TEST_FAIL(cmock_line, CMockStringCalledLess);
  }
}

void Mockmodem_Init(void)
{
  Mockmodem_Destroy();
}

void Mockmodem_Destroy(void)
{
  CMock_Guts_MemFreeAll();
  memset(&Mock, 0, sizeof(Mock));
}

void modem_initialise(uint64_t coordinator)
{
  UNITY_LINE_TYPE cmock_line = TEST_LINE_NUM;
  CMOCK_modem_initialise_CALL_INSTANCE* cmock_call_instance;
  UNITY_SET_DETAIL(CMockString_modem_initialise);
  cmock_call_instance = (CMOCK_modem_initialise_CALL_INSTANCE*)CMock_Guts_GetAddressFor(Mock.modem_initialise_CallInstance);
  Mock.modem_initialise_CallInstance = CMock_Guts_MemNext(Mock.modem_initialise_CallInstance);
  UNITY_TEST_ASSERT_NOT_NULL(cmock_call_instance, cmock_line, CMockStringCalledMore);
  cmock_line = cmock_call_instance->LineNumber;
  {
    UNITY_SET_DETAILS(CMockString_modem_initialise,CMockString_coordinator);
    UNITY_TEST_ASSERT_EQUAL_MEMORY((void*)(&cmock_call_instance->Expected_coordinator), (void*)(&coordinator), sizeof(uint64_t), cmock_line, CMockStringMismatch);
  }
  UNITY_CLR_DETAILS();
}

void CMockExpectParameters_modem_initialise(CMOCK_modem_initialise_CALL_INSTANCE* cmock_call_instance, uint64_t coordinator);
void CMockExpectParameters_modem_initialise(CMOCK_modem_initialise_CALL_INSTANCE* cmock_call_instance, uint64_t coordinator)
{
  memcpy((void*)(&cmock_call_instance->Expected_coordinator), (void*)(&coordinator),
         sizeof(uint64_t[sizeof(coordinator) == sizeof(uint64_t) ? 1 : -1])); /* add uint64_t to :treat_as_array if this causes an error */
}

void modem_initialise_CMockExpect(UNITY_LINE_TYPE cmock_line, uint64_t coordinator)
{
  CMOCK_MEM_INDEX_TYPE cmock_guts_index = CMock_Guts_MemNew(sizeof(CMOCK_modem_initialise_CALL_INSTANCE));
  CMOCK_modem_initialise_CALL_INSTANCE* cmock_call_instance = (CMOCK_modem_initialise_CALL_INSTANCE*)CMock_Guts_GetAddressFor(cmock_guts_index);
  UNITY_TEST_ASSERT_NOT_NULL(cmock_call_instance, cmock_line, CMockStringOutOfMemory);
  memset(cmock_call_instance, 0, sizeof(*cmock_call_instance));
  Mock.modem_initialise_CallInstance = CMock_Guts_MemChain(Mock.modem_initialise_CallInstance, cmock_guts_index);
  cmock_call_instance->LineNumber = cmock_line;
  CMockExpectParameters_modem_initialise(cmock_call_instance, coordinator);
}

uint64_t modem_get_coord_addr(void)
{
  UNITY_LINE_TYPE cmock_line = TEST_LINE_NUM;
  CMOCK_modem_get_coord_addr_CALL_INSTANCE* cmock_call_instance;
  UNITY_SET_DETAIL(CMockString_modem_get_coord_addr);
  cmock_call_instance = (CMOCK_modem_get_coord_addr_CALL_INSTANCE*)CMock_Guts_GetAddressFor(Mock.modem_get_coord_addr_CallInstance);
  Mock.modem_get_coord_addr_CallInstance = CMock_Guts_MemNext(Mock.modem_get_coord_addr_CallInstance);
  UNITY_TEST_ASSERT_NOT_NULL(cmock_call_instance, cmock_line, CMockStringCalledMore);
  cmock_line = cmock_call_instance->LineNumber;
  UNITY_CLR_DETAILS();
  return cmock_call_instance->ReturnVal;
}

void modem_get_coord_addr_CMockExpectAndReturn(UNITY_LINE_TYPE cmock_line, uint64_t cmock_to_return)
{
  CMOCK_MEM_INDEX_TYPE cmock_guts_index = CMock_Guts_MemNew(sizeof(CMOCK_modem_get_coord_addr_CALL_INSTANCE));
  CMOCK_modem_get_coord_addr_CALL_INSTANCE* cmock_call_instance = (CMOCK_modem_get_coord_addr_CALL_INSTANCE*)CMock_Guts_GetAddressFor(cmock_guts_index);
  UNITY_TEST_ASSERT_NOT_NULL(cmock_call_instance, cmock_line, CMockStringOutOfMemory);
  memset(cmock_call_instance, 0, sizeof(*cmock_call_instance));
  Mock.modem_get_coord_addr_CallInstance = CMock_Guts_MemChain(Mock.modem_get_coord_addr_CallInstance, cmock_guts_index);
  cmock_call_instance->LineNumber = cmock_line;
  memcpy((void*)(&cmock_call_instance->ReturnVal), (void*)(&cmock_to_return),
         sizeof(uint64_t[sizeof(cmock_to_return) == sizeof(uint64_t) ? 1 : -1])); /* add uint64_t to :treat_as_array if this causes an error */
}
