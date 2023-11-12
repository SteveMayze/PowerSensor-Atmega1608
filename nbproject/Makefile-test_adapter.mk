#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-test_adapter.mk)" "nbproject/Makefile-local-test_adapter.mk"
include nbproject/Makefile-local-test_adapter.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=test_adapter
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=cmock/src/cmock.c cmock/src/unity.c ina219/INA219.c modem.c sensor_core.c node.c libavrxbee/xbee.c mcc_generated_files/examples/twi0_master_example.c mcc_generated_files/src/usart1.c mcc_generated_files/src/protected_io.S mcc_generated_files/src/rtc.c mcc_generated_files/src/pin_manager.c mcc_generated_files/src/cpuint.c mcc_generated_files/mcc.c mcc_generated_files/device_config.c mocks/Mockeprom.c mocks/Mocktwi0_master.c mocks/Mockusart0.c test_adapter_main.c unit/sensor_core_test.c unit/node_init_test.c unit/node_basic_test.c unit/node_test.c unit/test_common.c unit/ina219_test.c unit/modem_send_test.c unit/modem_receive_test.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/cmock/src/cmock.o ${OBJECTDIR}/cmock/src/unity.o ${OBJECTDIR}/ina219/INA219.o ${OBJECTDIR}/modem.o ${OBJECTDIR}/sensor_core.o ${OBJECTDIR}/node.o ${OBJECTDIR}/libavrxbee/xbee.o ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o ${OBJECTDIR}/mcc_generated_files/src/usart1.o ${OBJECTDIR}/mcc_generated_files/src/protected_io.o ${OBJECTDIR}/mcc_generated_files/src/rtc.o ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o ${OBJECTDIR}/mcc_generated_files/src/cpuint.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/device_config.o ${OBJECTDIR}/mocks/Mockeprom.o ${OBJECTDIR}/mocks/Mocktwi0_master.o ${OBJECTDIR}/mocks/Mockusart0.o ${OBJECTDIR}/test_adapter_main.o ${OBJECTDIR}/unit/sensor_core_test.o ${OBJECTDIR}/unit/node_init_test.o ${OBJECTDIR}/unit/node_basic_test.o ${OBJECTDIR}/unit/node_test.o ${OBJECTDIR}/unit/test_common.o ${OBJECTDIR}/unit/ina219_test.o ${OBJECTDIR}/unit/modem_send_test.o ${OBJECTDIR}/unit/modem_receive_test.o
POSSIBLE_DEPFILES=${OBJECTDIR}/cmock/src/cmock.o.d ${OBJECTDIR}/cmock/src/unity.o.d ${OBJECTDIR}/ina219/INA219.o.d ${OBJECTDIR}/modem.o.d ${OBJECTDIR}/sensor_core.o.d ${OBJECTDIR}/node.o.d ${OBJECTDIR}/libavrxbee/xbee.o.d ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d ${OBJECTDIR}/mcc_generated_files/src/usart1.o.d ${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d ${OBJECTDIR}/mcc_generated_files/src/rtc.o.d ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d ${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d ${OBJECTDIR}/mcc_generated_files/mcc.o.d ${OBJECTDIR}/mcc_generated_files/device_config.o.d ${OBJECTDIR}/mocks/Mockeprom.o.d ${OBJECTDIR}/mocks/Mocktwi0_master.o.d ${OBJECTDIR}/mocks/Mockusart0.o.d ${OBJECTDIR}/test_adapter_main.o.d ${OBJECTDIR}/unit/sensor_core_test.o.d ${OBJECTDIR}/unit/node_init_test.o.d ${OBJECTDIR}/unit/node_basic_test.o.d ${OBJECTDIR}/unit/node_test.o.d ${OBJECTDIR}/unit/test_common.o.d ${OBJECTDIR}/unit/ina219_test.o.d ${OBJECTDIR}/unit/modem_send_test.o.d ${OBJECTDIR}/unit/modem_receive_test.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/cmock/src/cmock.o ${OBJECTDIR}/cmock/src/unity.o ${OBJECTDIR}/ina219/INA219.o ${OBJECTDIR}/modem.o ${OBJECTDIR}/sensor_core.o ${OBJECTDIR}/node.o ${OBJECTDIR}/libavrxbee/xbee.o ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o ${OBJECTDIR}/mcc_generated_files/src/usart1.o ${OBJECTDIR}/mcc_generated_files/src/protected_io.o ${OBJECTDIR}/mcc_generated_files/src/rtc.o ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o ${OBJECTDIR}/mcc_generated_files/src/cpuint.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/device_config.o ${OBJECTDIR}/mocks/Mockeprom.o ${OBJECTDIR}/mocks/Mocktwi0_master.o ${OBJECTDIR}/mocks/Mockusart0.o ${OBJECTDIR}/test_adapter_main.o ${OBJECTDIR}/unit/sensor_core_test.o ${OBJECTDIR}/unit/node_init_test.o ${OBJECTDIR}/unit/node_basic_test.o ${OBJECTDIR}/unit/node_test.o ${OBJECTDIR}/unit/test_common.o ${OBJECTDIR}/unit/ina219_test.o ${OBJECTDIR}/unit/modem_send_test.o ${OBJECTDIR}/unit/modem_receive_test.o

# Source Files
SOURCEFILES=cmock/src/cmock.c cmock/src/unity.c ina219/INA219.c modem.c sensor_core.c node.c libavrxbee/xbee.c mcc_generated_files/examples/twi0_master_example.c mcc_generated_files/src/usart1.c mcc_generated_files/src/protected_io.S mcc_generated_files/src/rtc.c mcc_generated_files/src/pin_manager.c mcc_generated_files/src/cpuint.c mcc_generated_files/mcc.c mcc_generated_files/device_config.c mocks/Mockeprom.c mocks/Mocktwi0_master.c mocks/Mockusart0.c test_adapter_main.c unit/sensor_core_test.c unit/node_init_test.c unit/node_basic_test.c unit/node_test.c unit/test_common.c unit/ina219_test.c unit/modem_send_test.c unit/modem_receive_test.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-test_adapter.mk ${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATmega4808
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/cmock/src/cmock.o: cmock/src/cmock.c  .generated_files/flags/test_adapter/88400bcf1c176e913460703cb7129c59df6f6430 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/cmock/src" 
	@${RM} ${OBJECTDIR}/cmock/src/cmock.o.d 
	@${RM} ${OBJECTDIR}/cmock/src/cmock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/cmock/src/cmock.o.d" -MT "${OBJECTDIR}/cmock/src/cmock.o.d" -MT ${OBJECTDIR}/cmock/src/cmock.o -o ${OBJECTDIR}/cmock/src/cmock.o cmock/src/cmock.c 
	
${OBJECTDIR}/cmock/src/unity.o: cmock/src/unity.c  .generated_files/flags/test_adapter/bcc8ab459e45db67fa7aba5a67b571ed2d4700c1 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/cmock/src" 
	@${RM} ${OBJECTDIR}/cmock/src/unity.o.d 
	@${RM} ${OBJECTDIR}/cmock/src/unity.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/cmock/src/unity.o.d" -MT "${OBJECTDIR}/cmock/src/unity.o.d" -MT ${OBJECTDIR}/cmock/src/unity.o -o ${OBJECTDIR}/cmock/src/unity.o cmock/src/unity.c 
	
${OBJECTDIR}/ina219/INA219.o: ina219/INA219.c  .generated_files/flags/test_adapter/369bf4824f92b1a75ed6adda5f694ee5f91a86a5 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/ina219" 
	@${RM} ${OBJECTDIR}/ina219/INA219.o.d 
	@${RM} ${OBJECTDIR}/ina219/INA219.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/ina219/INA219.o.d" -MT "${OBJECTDIR}/ina219/INA219.o.d" -MT ${OBJECTDIR}/ina219/INA219.o -o ${OBJECTDIR}/ina219/INA219.o ina219/INA219.c 
	
${OBJECTDIR}/modem.o: modem.c  .generated_files/flags/test_adapter/56d64593d9f55287940c1547e0e9c7f533dbddb9 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/modem.o.d 
	@${RM} ${OBJECTDIR}/modem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/modem.o.d" -MT "${OBJECTDIR}/modem.o.d" -MT ${OBJECTDIR}/modem.o -o ${OBJECTDIR}/modem.o modem.c 
	
${OBJECTDIR}/sensor_core.o: sensor_core.c  .generated_files/flags/test_adapter/8890c84de7f1f59b68fff097aa46f5b191473e5 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/sensor_core.o.d 
	@${RM} ${OBJECTDIR}/sensor_core.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/sensor_core.o.d" -MT "${OBJECTDIR}/sensor_core.o.d" -MT ${OBJECTDIR}/sensor_core.o -o ${OBJECTDIR}/sensor_core.o sensor_core.c 
	
${OBJECTDIR}/node.o: node.c  .generated_files/flags/test_adapter/d92201600a5eb8047f15acecad54f81433e99478 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/node.o.d 
	@${RM} ${OBJECTDIR}/node.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/node.o.d" -MT "${OBJECTDIR}/node.o.d" -MT ${OBJECTDIR}/node.o -o ${OBJECTDIR}/node.o node.c 
	
${OBJECTDIR}/libavrxbee/xbee.o: libavrxbee/xbee.c  .generated_files/flags/test_adapter/344f15cbb11720c6177ad16b0339167d657f8500 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/libavrxbee" 
	@${RM} ${OBJECTDIR}/libavrxbee/xbee.o.d 
	@${RM} ${OBJECTDIR}/libavrxbee/xbee.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/libavrxbee/xbee.o.d" -MT "${OBJECTDIR}/libavrxbee/xbee.o.d" -MT ${OBJECTDIR}/libavrxbee/xbee.o -o ${OBJECTDIR}/libavrxbee/xbee.o libavrxbee/xbee.c 
	
${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o: mcc_generated_files/examples/twi0_master_example.c  .generated_files/flags/test_adapter/4e9d675a4263cdc2e17ec8adf9609ecae0092e93 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/examples" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d" -MT "${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d" -MT ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o -o ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o mcc_generated_files/examples/twi0_master_example.c 
	
${OBJECTDIR}/mcc_generated_files/src/usart1.o: mcc_generated_files/src/usart1.c  .generated_files/flags/test_adapter/7098c3be08a18b90c8fc972a1e0eeaf74baa69ee .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/usart1.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/usart1.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/usart1.o -o ${OBJECTDIR}/mcc_generated_files/src/usart1.o mcc_generated_files/src/usart1.c 
	
${OBJECTDIR}/mcc_generated_files/src/rtc.o: mcc_generated_files/src/rtc.c  .generated_files/flags/test_adapter/ed5a747e07be86812f6f0a6966e2e1177e8c3221 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/rtc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/rtc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/rtc.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/rtc.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/rtc.o -o ${OBJECTDIR}/mcc_generated_files/src/rtc.o mcc_generated_files/src/rtc.c 
	
${OBJECTDIR}/mcc_generated_files/src/pin_manager.o: mcc_generated_files/src/pin_manager.c  .generated_files/flags/test_adapter/75fa3c492408ba79eb45cc650c39801ce1ee7116 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o -o ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o mcc_generated_files/src/pin_manager.c 
	
${OBJECTDIR}/mcc_generated_files/src/cpuint.o: mcc_generated_files/src/cpuint.c  .generated_files/flags/test_adapter/45caf44628c5a0eef83ea868f1b01e4a275060b6 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/cpuint.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/cpuint.o -o ${OBJECTDIR}/mcc_generated_files/src/cpuint.o mcc_generated_files/src/cpuint.c 
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/test_adapter/5c2036b5f82ab832d29c36f25fdefed800b576be .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -MT "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -MT ${OBJECTDIR}/mcc_generated_files/mcc.o -o ${OBJECTDIR}/mcc_generated_files/mcc.o mcc_generated_files/mcc.c 
	
${OBJECTDIR}/mcc_generated_files/device_config.o: mcc_generated_files/device_config.c  .generated_files/flags/test_adapter/f81acecfd7b02d225f6a6419da6447c40185d589 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/device_config.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/device_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/device_config.o.d" -MT "${OBJECTDIR}/mcc_generated_files/device_config.o.d" -MT ${OBJECTDIR}/mcc_generated_files/device_config.o -o ${OBJECTDIR}/mcc_generated_files/device_config.o mcc_generated_files/device_config.c 
	
${OBJECTDIR}/mocks/Mockeprom.o: mocks/Mockeprom.c  .generated_files/flags/test_adapter/fb35d60255d9b6683f393bd9743af267c7941bba .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/mocks" 
	@${RM} ${OBJECTDIR}/mocks/Mockeprom.o.d 
	@${RM} ${OBJECTDIR}/mocks/Mockeprom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mocks/Mockeprom.o.d" -MT "${OBJECTDIR}/mocks/Mockeprom.o.d" -MT ${OBJECTDIR}/mocks/Mockeprom.o -o ${OBJECTDIR}/mocks/Mockeprom.o mocks/Mockeprom.c 
	
${OBJECTDIR}/mocks/Mocktwi0_master.o: mocks/Mocktwi0_master.c  .generated_files/flags/test_adapter/c33e2b2006f0905d4d06046067a5354bc9b2a06a .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/mocks" 
	@${RM} ${OBJECTDIR}/mocks/Mocktwi0_master.o.d 
	@${RM} ${OBJECTDIR}/mocks/Mocktwi0_master.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mocks/Mocktwi0_master.o.d" -MT "${OBJECTDIR}/mocks/Mocktwi0_master.o.d" -MT ${OBJECTDIR}/mocks/Mocktwi0_master.o -o ${OBJECTDIR}/mocks/Mocktwi0_master.o mocks/Mocktwi0_master.c 
	
${OBJECTDIR}/mocks/Mockusart0.o: mocks/Mockusart0.c  .generated_files/flags/test_adapter/514fc03ef22e1e1d35bd93f431da25a9186e297 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/mocks" 
	@${RM} ${OBJECTDIR}/mocks/Mockusart0.o.d 
	@${RM} ${OBJECTDIR}/mocks/Mockusart0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mocks/Mockusart0.o.d" -MT "${OBJECTDIR}/mocks/Mockusart0.o.d" -MT ${OBJECTDIR}/mocks/Mockusart0.o -o ${OBJECTDIR}/mocks/Mockusart0.o mocks/Mockusart0.c 
	
${OBJECTDIR}/test_adapter_main.o: test_adapter_main.c  .generated_files/flags/test_adapter/39fb2b887c50a318824cb2eaa98a02b3c4b2ebdb .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/test_adapter_main.o.d 
	@${RM} ${OBJECTDIR}/test_adapter_main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/test_adapter_main.o.d" -MT "${OBJECTDIR}/test_adapter_main.o.d" -MT ${OBJECTDIR}/test_adapter_main.o -o ${OBJECTDIR}/test_adapter_main.o test_adapter_main.c 
	
${OBJECTDIR}/unit/sensor_core_test.o: unit/sensor_core_test.c  .generated_files/flags/test_adapter/4e5e09890d22e2f3a4d011a3aa8fef8f41b8b0b1 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/sensor_core_test.o.d 
	@${RM} ${OBJECTDIR}/unit/sensor_core_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/sensor_core_test.o.d" -MT "${OBJECTDIR}/unit/sensor_core_test.o.d" -MT ${OBJECTDIR}/unit/sensor_core_test.o -o ${OBJECTDIR}/unit/sensor_core_test.o unit/sensor_core_test.c 
	
${OBJECTDIR}/unit/node_init_test.o: unit/node_init_test.c  .generated_files/flags/test_adapter/8a26e9f8f4aa0dbc191378f72281a32b4d4ca565 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/node_init_test.o.d 
	@${RM} ${OBJECTDIR}/unit/node_init_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/node_init_test.o.d" -MT "${OBJECTDIR}/unit/node_init_test.o.d" -MT ${OBJECTDIR}/unit/node_init_test.o -o ${OBJECTDIR}/unit/node_init_test.o unit/node_init_test.c 
	
${OBJECTDIR}/unit/node_basic_test.o: unit/node_basic_test.c  .generated_files/flags/test_adapter/4ae2ae4718a12d61512e910e31729ee84928de8d .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/node_basic_test.o.d 
	@${RM} ${OBJECTDIR}/unit/node_basic_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/node_basic_test.o.d" -MT "${OBJECTDIR}/unit/node_basic_test.o.d" -MT ${OBJECTDIR}/unit/node_basic_test.o -o ${OBJECTDIR}/unit/node_basic_test.o unit/node_basic_test.c 
	
${OBJECTDIR}/unit/node_test.o: unit/node_test.c  .generated_files/flags/test_adapter/7276faf1f7e6af06e1e5f81a494951bfbfd24ef5 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/node_test.o.d 
	@${RM} ${OBJECTDIR}/unit/node_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/node_test.o.d" -MT "${OBJECTDIR}/unit/node_test.o.d" -MT ${OBJECTDIR}/unit/node_test.o -o ${OBJECTDIR}/unit/node_test.o unit/node_test.c 
	
${OBJECTDIR}/unit/test_common.o: unit/test_common.c  .generated_files/flags/test_adapter/9c0057ecddc08970d647ab2546ecf15d449d1890 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/test_common.o.d 
	@${RM} ${OBJECTDIR}/unit/test_common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/test_common.o.d" -MT "${OBJECTDIR}/unit/test_common.o.d" -MT ${OBJECTDIR}/unit/test_common.o -o ${OBJECTDIR}/unit/test_common.o unit/test_common.c 
	
${OBJECTDIR}/unit/ina219_test.o: unit/ina219_test.c  .generated_files/flags/test_adapter/3c68deb73da95b7ed56244ad96086ff6f288eb6b .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/ina219_test.o.d 
	@${RM} ${OBJECTDIR}/unit/ina219_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/ina219_test.o.d" -MT "${OBJECTDIR}/unit/ina219_test.o.d" -MT ${OBJECTDIR}/unit/ina219_test.o -o ${OBJECTDIR}/unit/ina219_test.o unit/ina219_test.c 
	
${OBJECTDIR}/unit/modem_send_test.o: unit/modem_send_test.c  .generated_files/flags/test_adapter/4c721e0c22a960ff809812f0dafa14e607ed30b2 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/modem_send_test.o.d 
	@${RM} ${OBJECTDIR}/unit/modem_send_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/modem_send_test.o.d" -MT "${OBJECTDIR}/unit/modem_send_test.o.d" -MT ${OBJECTDIR}/unit/modem_send_test.o -o ${OBJECTDIR}/unit/modem_send_test.o unit/modem_send_test.c 
	
${OBJECTDIR}/unit/modem_receive_test.o: unit/modem_receive_test.c  .generated_files/flags/test_adapter/dbdcb058bcbad95b075802bffbd7aaab2ff5d7f3 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/modem_receive_test.o.d 
	@${RM} ${OBJECTDIR}/unit/modem_receive_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/modem_receive_test.o.d" -MT "${OBJECTDIR}/unit/modem_receive_test.o.d" -MT ${OBJECTDIR}/unit/modem_receive_test.o -o ${OBJECTDIR}/unit/modem_receive_test.o unit/modem_receive_test.c 
	
else
${OBJECTDIR}/cmock/src/cmock.o: cmock/src/cmock.c  .generated_files/flags/test_adapter/e916ebf066476f8573319f715281ce224dfc302f .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/cmock/src" 
	@${RM} ${OBJECTDIR}/cmock/src/cmock.o.d 
	@${RM} ${OBJECTDIR}/cmock/src/cmock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/cmock/src/cmock.o.d" -MT "${OBJECTDIR}/cmock/src/cmock.o.d" -MT ${OBJECTDIR}/cmock/src/cmock.o -o ${OBJECTDIR}/cmock/src/cmock.o cmock/src/cmock.c 
	
${OBJECTDIR}/cmock/src/unity.o: cmock/src/unity.c  .generated_files/flags/test_adapter/e8d3a71c7016e3f6632178becf995dbc07e3fb95 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/cmock/src" 
	@${RM} ${OBJECTDIR}/cmock/src/unity.o.d 
	@${RM} ${OBJECTDIR}/cmock/src/unity.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/cmock/src/unity.o.d" -MT "${OBJECTDIR}/cmock/src/unity.o.d" -MT ${OBJECTDIR}/cmock/src/unity.o -o ${OBJECTDIR}/cmock/src/unity.o cmock/src/unity.c 
	
${OBJECTDIR}/ina219/INA219.o: ina219/INA219.c  .generated_files/flags/test_adapter/64a71befea2b1e8cda5350424157a4ca07c8471e .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/ina219" 
	@${RM} ${OBJECTDIR}/ina219/INA219.o.d 
	@${RM} ${OBJECTDIR}/ina219/INA219.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/ina219/INA219.o.d" -MT "${OBJECTDIR}/ina219/INA219.o.d" -MT ${OBJECTDIR}/ina219/INA219.o -o ${OBJECTDIR}/ina219/INA219.o ina219/INA219.c 
	
${OBJECTDIR}/modem.o: modem.c  .generated_files/flags/test_adapter/93c80ea905d5fad76858f81edb68d59e6d7a1319 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/modem.o.d 
	@${RM} ${OBJECTDIR}/modem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/modem.o.d" -MT "${OBJECTDIR}/modem.o.d" -MT ${OBJECTDIR}/modem.o -o ${OBJECTDIR}/modem.o modem.c 
	
${OBJECTDIR}/sensor_core.o: sensor_core.c  .generated_files/flags/test_adapter/96f6d39208943aac3ea96d466776d3bfe25ade8f .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/sensor_core.o.d 
	@${RM} ${OBJECTDIR}/sensor_core.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/sensor_core.o.d" -MT "${OBJECTDIR}/sensor_core.o.d" -MT ${OBJECTDIR}/sensor_core.o -o ${OBJECTDIR}/sensor_core.o sensor_core.c 
	
${OBJECTDIR}/node.o: node.c  .generated_files/flags/test_adapter/23f41e633a3dcdd7192f6ea6aa4aef5f8777d368 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/node.o.d 
	@${RM} ${OBJECTDIR}/node.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/node.o.d" -MT "${OBJECTDIR}/node.o.d" -MT ${OBJECTDIR}/node.o -o ${OBJECTDIR}/node.o node.c 
	
${OBJECTDIR}/libavrxbee/xbee.o: libavrxbee/xbee.c  .generated_files/flags/test_adapter/1a3f1da194168c468dd75ffac6ac1b380404db4e .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/libavrxbee" 
	@${RM} ${OBJECTDIR}/libavrxbee/xbee.o.d 
	@${RM} ${OBJECTDIR}/libavrxbee/xbee.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/libavrxbee/xbee.o.d" -MT "${OBJECTDIR}/libavrxbee/xbee.o.d" -MT ${OBJECTDIR}/libavrxbee/xbee.o -o ${OBJECTDIR}/libavrxbee/xbee.o libavrxbee/xbee.c 
	
${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o: mcc_generated_files/examples/twi0_master_example.c  .generated_files/flags/test_adapter/5324852b5b4d1c47aa2c1b9d2b849c2c85be0795 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/examples" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d" -MT "${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d" -MT ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o -o ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o mcc_generated_files/examples/twi0_master_example.c 
	
${OBJECTDIR}/mcc_generated_files/src/usart1.o: mcc_generated_files/src/usart1.c  .generated_files/flags/test_adapter/5cf8b88ead804000d18c566b7aae149f822e469d .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/usart1.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/usart1.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/usart1.o -o ${OBJECTDIR}/mcc_generated_files/src/usart1.o mcc_generated_files/src/usart1.c 
	
${OBJECTDIR}/mcc_generated_files/src/rtc.o: mcc_generated_files/src/rtc.c  .generated_files/flags/test_adapter/e3b6bd89a3c529c573ae24edf10ce8b73b2abb0 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/rtc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/rtc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/rtc.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/rtc.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/rtc.o -o ${OBJECTDIR}/mcc_generated_files/src/rtc.o mcc_generated_files/src/rtc.c 
	
${OBJECTDIR}/mcc_generated_files/src/pin_manager.o: mcc_generated_files/src/pin_manager.c  .generated_files/flags/test_adapter/522519bf5efbc8e0e466494db3e25aee193cc7ce .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o -o ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o mcc_generated_files/src/pin_manager.c 
	
${OBJECTDIR}/mcc_generated_files/src/cpuint.o: mcc_generated_files/src/cpuint.c  .generated_files/flags/test_adapter/1226f3a089ee774f93112f9137b2b66e2a6cbeef .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/cpuint.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/cpuint.o -o ${OBJECTDIR}/mcc_generated_files/src/cpuint.o mcc_generated_files/src/cpuint.c 
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/test_adapter/33564266e9d60f47b2ec524fefb53dbe60a5034a .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -MT "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -MT ${OBJECTDIR}/mcc_generated_files/mcc.o -o ${OBJECTDIR}/mcc_generated_files/mcc.o mcc_generated_files/mcc.c 
	
${OBJECTDIR}/mcc_generated_files/device_config.o: mcc_generated_files/device_config.c  .generated_files/flags/test_adapter/f43f6c0e1f2c4b7d7b62c7ed69e82a7f98175313 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/device_config.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/device_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/device_config.o.d" -MT "${OBJECTDIR}/mcc_generated_files/device_config.o.d" -MT ${OBJECTDIR}/mcc_generated_files/device_config.o -o ${OBJECTDIR}/mcc_generated_files/device_config.o mcc_generated_files/device_config.c 
	
${OBJECTDIR}/mocks/Mockeprom.o: mocks/Mockeprom.c  .generated_files/flags/test_adapter/3191a00e64a3ca7c03abe47093df25f336fdeb48 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/mocks" 
	@${RM} ${OBJECTDIR}/mocks/Mockeprom.o.d 
	@${RM} ${OBJECTDIR}/mocks/Mockeprom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mocks/Mockeprom.o.d" -MT "${OBJECTDIR}/mocks/Mockeprom.o.d" -MT ${OBJECTDIR}/mocks/Mockeprom.o -o ${OBJECTDIR}/mocks/Mockeprom.o mocks/Mockeprom.c 
	
${OBJECTDIR}/mocks/Mocktwi0_master.o: mocks/Mocktwi0_master.c  .generated_files/flags/test_adapter/3ec63974ee626395b0652ec963f8b53de34020aa .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/mocks" 
	@${RM} ${OBJECTDIR}/mocks/Mocktwi0_master.o.d 
	@${RM} ${OBJECTDIR}/mocks/Mocktwi0_master.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mocks/Mocktwi0_master.o.d" -MT "${OBJECTDIR}/mocks/Mocktwi0_master.o.d" -MT ${OBJECTDIR}/mocks/Mocktwi0_master.o -o ${OBJECTDIR}/mocks/Mocktwi0_master.o mocks/Mocktwi0_master.c 
	
${OBJECTDIR}/mocks/Mockusart0.o: mocks/Mockusart0.c  .generated_files/flags/test_adapter/e2cb2cab02ae321282458445d273d96281d52375 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/mocks" 
	@${RM} ${OBJECTDIR}/mocks/Mockusart0.o.d 
	@${RM} ${OBJECTDIR}/mocks/Mockusart0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mocks/Mockusart0.o.d" -MT "${OBJECTDIR}/mocks/Mockusart0.o.d" -MT ${OBJECTDIR}/mocks/Mockusart0.o -o ${OBJECTDIR}/mocks/Mockusart0.o mocks/Mockusart0.c 
	
${OBJECTDIR}/test_adapter_main.o: test_adapter_main.c  .generated_files/flags/test_adapter/d6a40af4e978d70f12130f47f8d7b1926e826060 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/test_adapter_main.o.d 
	@${RM} ${OBJECTDIR}/test_adapter_main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/test_adapter_main.o.d" -MT "${OBJECTDIR}/test_adapter_main.o.d" -MT ${OBJECTDIR}/test_adapter_main.o -o ${OBJECTDIR}/test_adapter_main.o test_adapter_main.c 
	
${OBJECTDIR}/unit/sensor_core_test.o: unit/sensor_core_test.c  .generated_files/flags/test_adapter/419168becb115ef86b7ca8d00571637e320a17aa .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/sensor_core_test.o.d 
	@${RM} ${OBJECTDIR}/unit/sensor_core_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/sensor_core_test.o.d" -MT "${OBJECTDIR}/unit/sensor_core_test.o.d" -MT ${OBJECTDIR}/unit/sensor_core_test.o -o ${OBJECTDIR}/unit/sensor_core_test.o unit/sensor_core_test.c 
	
${OBJECTDIR}/unit/node_init_test.o: unit/node_init_test.c  .generated_files/flags/test_adapter/cb8bb3bfcf998015af098bcebb327094d21ee125 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/node_init_test.o.d 
	@${RM} ${OBJECTDIR}/unit/node_init_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/node_init_test.o.d" -MT "${OBJECTDIR}/unit/node_init_test.o.d" -MT ${OBJECTDIR}/unit/node_init_test.o -o ${OBJECTDIR}/unit/node_init_test.o unit/node_init_test.c 
	
${OBJECTDIR}/unit/node_basic_test.o: unit/node_basic_test.c  .generated_files/flags/test_adapter/8b4cdea48ae2bf1dbdfc40752ea8ccb779da1d55 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/node_basic_test.o.d 
	@${RM} ${OBJECTDIR}/unit/node_basic_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/node_basic_test.o.d" -MT "${OBJECTDIR}/unit/node_basic_test.o.d" -MT ${OBJECTDIR}/unit/node_basic_test.o -o ${OBJECTDIR}/unit/node_basic_test.o unit/node_basic_test.c 
	
${OBJECTDIR}/unit/node_test.o: unit/node_test.c  .generated_files/flags/test_adapter/c5117804d9088f44cf07b757687bf43dfb5b288b .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/node_test.o.d 
	@${RM} ${OBJECTDIR}/unit/node_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/node_test.o.d" -MT "${OBJECTDIR}/unit/node_test.o.d" -MT ${OBJECTDIR}/unit/node_test.o -o ${OBJECTDIR}/unit/node_test.o unit/node_test.c 
	
${OBJECTDIR}/unit/test_common.o: unit/test_common.c  .generated_files/flags/test_adapter/54d52408240f9434c7825101b2f24b8157fc53a9 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/test_common.o.d 
	@${RM} ${OBJECTDIR}/unit/test_common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/test_common.o.d" -MT "${OBJECTDIR}/unit/test_common.o.d" -MT ${OBJECTDIR}/unit/test_common.o -o ${OBJECTDIR}/unit/test_common.o unit/test_common.c 
	
${OBJECTDIR}/unit/ina219_test.o: unit/ina219_test.c  .generated_files/flags/test_adapter/44fa80f305e70c1903e62caacf48d5003de6e158 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/ina219_test.o.d 
	@${RM} ${OBJECTDIR}/unit/ina219_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/ina219_test.o.d" -MT "${OBJECTDIR}/unit/ina219_test.o.d" -MT ${OBJECTDIR}/unit/ina219_test.o -o ${OBJECTDIR}/unit/ina219_test.o unit/ina219_test.c 
	
${OBJECTDIR}/unit/modem_send_test.o: unit/modem_send_test.c  .generated_files/flags/test_adapter/66b3e04691ea8f31b0c60e915b0afb5e0893cda4 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/modem_send_test.o.d 
	@${RM} ${OBJECTDIR}/unit/modem_send_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/modem_send_test.o.d" -MT "${OBJECTDIR}/unit/modem_send_test.o.d" -MT ${OBJECTDIR}/unit/modem_send_test.o -o ${OBJECTDIR}/unit/modem_send_test.o unit/modem_send_test.c 
	
${OBJECTDIR}/unit/modem_receive_test.o: unit/modem_receive_test.c  .generated_files/flags/test_adapter/444599f59b2358e1a43ef6243843a1ce14061f9c .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/modem_receive_test.o.d 
	@${RM} ${OBJECTDIR}/unit/modem_receive_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/modem_receive_test.o.d" -MT "${OBJECTDIR}/unit/modem_receive_test.o.d" -MT ${OBJECTDIR}/unit/modem_receive_test.o -o ${OBJECTDIR}/unit/modem_receive_test.o unit/modem_receive_test.c 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/src/protected_io.o: mcc_generated_files/src/protected_io.S  .generated_files/flags/test_adapter/7e92affefe3a694ca141656bf8b614707c731395 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/protected_io.o 
	${MP_CC} -c $(MP_EXTRA_AS_PRE) -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x assembler-with-cpp -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 -gdwarf-3 -Wa,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1   -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/protected_io.o -o ${OBJECTDIR}/mcc_generated_files/src/protected_io.o  mcc_generated_files/src/protected_io.S 
	
else
${OBJECTDIR}/mcc_generated_files/src/protected_io.o: mcc_generated_files/src/protected_io.S  .generated_files/flags/test_adapter/af19c4f5a33ffc5b4071ea7ef539de959a1b4556 .generated_files/flags/test_adapter/2fc45d2427aca81d3423483bb8ea80a423da7bc7
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/protected_io.o 
	${MP_CC} -c $(MP_EXTRA_AS_PRE) -mcpu=$(MP_PROCESSOR_OPTION)  -x assembler-with-cpp -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 -gdwarf-3 -Wa,--defsym=__MPLAB_BUILD=1   -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/protected_io.o -o ${OBJECTDIR}/mcc_generated_files/src/protected_io.o  mcc_generated_files/src/protected_io.S 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_test_adapter=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2 -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -Wl,-u,sigrowl,--defsym,min_heap_size=512 -gdwarf-3     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group  -Wl,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1
	@${RM} ${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.hex 
	
else
${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.map  -DXPRJ_test_adapter=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -Wl,-u,sigrowl,--defsym,min_heap_size=512 -gdwarf-3     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	${MP_CC_DIR}/avr-objcopy -O ihex "${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.hex"
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
