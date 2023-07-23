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
ifeq "$(wildcard nbproject/Makefile-local-test_fsm.mk)" "nbproject/Makefile-local-test_fsm.mk"
include nbproject/Makefile-local-test_fsm.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=test_fsm
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
COMPARISON_BUILD=
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
SOURCEFILES_QUOTED_IF_SPACED=cmock/src/cmock.c cmock/src/unity.c libavrxbee/xbee.c power_sensor.c sensor_core.c node.c mcc_generated_files/examples/twi0_master_example.c mcc_generated_files/src/usart0.c mcc_generated_files/src/usart1.c mcc_generated_files/src/protected_io.S mcc_generated_files/src/rtc.c mcc_generated_files/src/pin_manager.c mcc_generated_files/src/cpuint.c mcc_generated_files/src/twi0_master.c mcc_generated_files/mcc.c mcc_generated_files/device_config.c mocks/Mockeprom.c mocks/Mockmodem.c mocks/MockINA219.c test_main.c unit/sensor_core_test.c unit/modem_test.c unit/node_test.c unit/node_init_test.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/cmock/src/cmock.o ${OBJECTDIR}/cmock/src/unity.o ${OBJECTDIR}/libavrxbee/xbee.o ${OBJECTDIR}/power_sensor.o ${OBJECTDIR}/sensor_core.o ${OBJECTDIR}/node.o ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o ${OBJECTDIR}/mcc_generated_files/src/usart0.o ${OBJECTDIR}/mcc_generated_files/src/usart1.o ${OBJECTDIR}/mcc_generated_files/src/protected_io.o ${OBJECTDIR}/mcc_generated_files/src/rtc.o ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o ${OBJECTDIR}/mcc_generated_files/src/cpuint.o ${OBJECTDIR}/mcc_generated_files/src/twi0_master.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/device_config.o ${OBJECTDIR}/mocks/Mockeprom.o ${OBJECTDIR}/mocks/Mockmodem.o ${OBJECTDIR}/mocks/MockINA219.o ${OBJECTDIR}/test_main.o ${OBJECTDIR}/unit/sensor_core_test.o ${OBJECTDIR}/unit/modem_test.o ${OBJECTDIR}/unit/node_test.o ${OBJECTDIR}/unit/node_init_test.o
POSSIBLE_DEPFILES=${OBJECTDIR}/cmock/src/cmock.o.d ${OBJECTDIR}/cmock/src/unity.o.d ${OBJECTDIR}/libavrxbee/xbee.o.d ${OBJECTDIR}/power_sensor.o.d ${OBJECTDIR}/sensor_core.o.d ${OBJECTDIR}/node.o.d ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d ${OBJECTDIR}/mcc_generated_files/src/usart0.o.d ${OBJECTDIR}/mcc_generated_files/src/usart1.o.d ${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d ${OBJECTDIR}/mcc_generated_files/src/rtc.o.d ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d ${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d ${OBJECTDIR}/mcc_generated_files/src/twi0_master.o.d ${OBJECTDIR}/mcc_generated_files/mcc.o.d ${OBJECTDIR}/mcc_generated_files/device_config.o.d ${OBJECTDIR}/mocks/Mockeprom.o.d ${OBJECTDIR}/mocks/Mockmodem.o.d ${OBJECTDIR}/mocks/MockINA219.o.d ${OBJECTDIR}/test_main.o.d ${OBJECTDIR}/unit/sensor_core_test.o.d ${OBJECTDIR}/unit/modem_test.o.d ${OBJECTDIR}/unit/node_test.o.d ${OBJECTDIR}/unit/node_init_test.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/cmock/src/cmock.o ${OBJECTDIR}/cmock/src/unity.o ${OBJECTDIR}/libavrxbee/xbee.o ${OBJECTDIR}/power_sensor.o ${OBJECTDIR}/sensor_core.o ${OBJECTDIR}/node.o ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o ${OBJECTDIR}/mcc_generated_files/src/usart0.o ${OBJECTDIR}/mcc_generated_files/src/usart1.o ${OBJECTDIR}/mcc_generated_files/src/protected_io.o ${OBJECTDIR}/mcc_generated_files/src/rtc.o ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o ${OBJECTDIR}/mcc_generated_files/src/cpuint.o ${OBJECTDIR}/mcc_generated_files/src/twi0_master.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/device_config.o ${OBJECTDIR}/mocks/Mockeprom.o ${OBJECTDIR}/mocks/Mockmodem.o ${OBJECTDIR}/mocks/MockINA219.o ${OBJECTDIR}/test_main.o ${OBJECTDIR}/unit/sensor_core_test.o ${OBJECTDIR}/unit/modem_test.o ${OBJECTDIR}/unit/node_test.o ${OBJECTDIR}/unit/node_init_test.o

# Source Files
SOURCEFILES=cmock/src/cmock.c cmock/src/unity.c libavrxbee/xbee.c power_sensor.c sensor_core.c node.c mcc_generated_files/examples/twi0_master_example.c mcc_generated_files/src/usart0.c mcc_generated_files/src/usart1.c mcc_generated_files/src/protected_io.S mcc_generated_files/src/rtc.c mcc_generated_files/src/pin_manager.c mcc_generated_files/src/cpuint.c mcc_generated_files/src/twi0_master.c mcc_generated_files/mcc.c mcc_generated_files/device_config.c mocks/Mockeprom.c mocks/Mockmodem.c mocks/MockINA219.c test_main.c unit/sensor_core_test.c unit/modem_test.c unit/node_test.c unit/node_init_test.c



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
	${MAKE}  -f nbproject/Makefile-test_fsm.mk ${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATmega4808
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/cmock/src/cmock.o: cmock/src/cmock.c  .generated_files/flags/test_fsm/849eb6b7b2a39d139a853781462aa5fde4600e2 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/cmock/src" 
	@${RM} ${OBJECTDIR}/cmock/src/cmock.o.d 
	@${RM} ${OBJECTDIR}/cmock/src/cmock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/cmock/src/cmock.o.d" -MT "${OBJECTDIR}/cmock/src/cmock.o.d" -MT ${OBJECTDIR}/cmock/src/cmock.o -o ${OBJECTDIR}/cmock/src/cmock.o cmock/src/cmock.c 
	
${OBJECTDIR}/cmock/src/unity.o: cmock/src/unity.c  .generated_files/flags/test_fsm/4038e52aa7e9a322ee8a7acb6800effe60b78f1a .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/cmock/src" 
	@${RM} ${OBJECTDIR}/cmock/src/unity.o.d 
	@${RM} ${OBJECTDIR}/cmock/src/unity.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/cmock/src/unity.o.d" -MT "${OBJECTDIR}/cmock/src/unity.o.d" -MT ${OBJECTDIR}/cmock/src/unity.o -o ${OBJECTDIR}/cmock/src/unity.o cmock/src/unity.c 
	
${OBJECTDIR}/libavrxbee/xbee.o: libavrxbee/xbee.c  .generated_files/flags/test_fsm/98f8da99df926b3869fa7922f7c42152071e4348 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/libavrxbee" 
	@${RM} ${OBJECTDIR}/libavrxbee/xbee.o.d 
	@${RM} ${OBJECTDIR}/libavrxbee/xbee.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/libavrxbee/xbee.o.d" -MT "${OBJECTDIR}/libavrxbee/xbee.o.d" -MT ${OBJECTDIR}/libavrxbee/xbee.o -o ${OBJECTDIR}/libavrxbee/xbee.o libavrxbee/xbee.c 
	
${OBJECTDIR}/power_sensor.o: power_sensor.c  .generated_files/flags/test_fsm/254c06fecf990acb54859f2797982086ee155378 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/power_sensor.o.d 
	@${RM} ${OBJECTDIR}/power_sensor.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/power_sensor.o.d" -MT "${OBJECTDIR}/power_sensor.o.d" -MT ${OBJECTDIR}/power_sensor.o -o ${OBJECTDIR}/power_sensor.o power_sensor.c 
	
${OBJECTDIR}/sensor_core.o: sensor_core.c  .generated_files/flags/test_fsm/4f0f4d5cdbadc552253d3fea9f0513c173dc15c3 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/sensor_core.o.d 
	@${RM} ${OBJECTDIR}/sensor_core.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/sensor_core.o.d" -MT "${OBJECTDIR}/sensor_core.o.d" -MT ${OBJECTDIR}/sensor_core.o -o ${OBJECTDIR}/sensor_core.o sensor_core.c 
	
${OBJECTDIR}/node.o: node.c  .generated_files/flags/test_fsm/cbe0d55cb3c28217f73a805b1e42deb776a17449 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/node.o.d 
	@${RM} ${OBJECTDIR}/node.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/node.o.d" -MT "${OBJECTDIR}/node.o.d" -MT ${OBJECTDIR}/node.o -o ${OBJECTDIR}/node.o node.c 
	
${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o: mcc_generated_files/examples/twi0_master_example.c  .generated_files/flags/test_fsm/12544b74122162cf7260f2cded0a976ec24dfb6d .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/examples" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d" -MT "${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d" -MT ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o -o ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o mcc_generated_files/examples/twi0_master_example.c 
	
${OBJECTDIR}/mcc_generated_files/src/usart0.o: mcc_generated_files/src/usart0.c  .generated_files/flags/test_fsm/e11a0f6b3a8f7a74b998b2d93ea276e739cc490c .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/usart0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/usart0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/usart0.o -o ${OBJECTDIR}/mcc_generated_files/src/usart0.o mcc_generated_files/src/usart0.c 
	
${OBJECTDIR}/mcc_generated_files/src/usart1.o: mcc_generated_files/src/usart1.c  .generated_files/flags/test_fsm/e2288b2b258078c8e6fcc4b0345f6295b8b277fc .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/usart1.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/usart1.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/usart1.o -o ${OBJECTDIR}/mcc_generated_files/src/usart1.o mcc_generated_files/src/usart1.c 
	
${OBJECTDIR}/mcc_generated_files/src/rtc.o: mcc_generated_files/src/rtc.c  .generated_files/flags/test_fsm/5f9a0efb72f0cbaf3589e57c02067a774c24df31 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/rtc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/rtc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/rtc.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/rtc.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/rtc.o -o ${OBJECTDIR}/mcc_generated_files/src/rtc.o mcc_generated_files/src/rtc.c 
	
${OBJECTDIR}/mcc_generated_files/src/pin_manager.o: mcc_generated_files/src/pin_manager.c  .generated_files/flags/test_fsm/5d852693ddc3b7d45304a128b9f16b68fce0341b .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o -o ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o mcc_generated_files/src/pin_manager.c 
	
${OBJECTDIR}/mcc_generated_files/src/cpuint.o: mcc_generated_files/src/cpuint.c  .generated_files/flags/test_fsm/86f6dd7417dac22d52168ee1e3b6c2c6988495aa .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/cpuint.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/cpuint.o -o ${OBJECTDIR}/mcc_generated_files/src/cpuint.o mcc_generated_files/src/cpuint.c 
	
${OBJECTDIR}/mcc_generated_files/src/twi0_master.o: mcc_generated_files/src/twi0_master.c  .generated_files/flags/test_fsm/fadfd3320b878ad87bbf6f15ba13a2fd0448e26f .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/twi0_master.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/twi0_master.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/twi0_master.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/twi0_master.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/twi0_master.o -o ${OBJECTDIR}/mcc_generated_files/src/twi0_master.o mcc_generated_files/src/twi0_master.c 
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/test_fsm/4483bb2448dd4a79c777b5286fd2f61d4b4875a9 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -MT "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -MT ${OBJECTDIR}/mcc_generated_files/mcc.o -o ${OBJECTDIR}/mcc_generated_files/mcc.o mcc_generated_files/mcc.c 
	
${OBJECTDIR}/mcc_generated_files/device_config.o: mcc_generated_files/device_config.c  .generated_files/flags/test_fsm/bfce332ed257cfe9e028eb69d65447322290eb4f .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/device_config.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/device_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/device_config.o.d" -MT "${OBJECTDIR}/mcc_generated_files/device_config.o.d" -MT ${OBJECTDIR}/mcc_generated_files/device_config.o -o ${OBJECTDIR}/mcc_generated_files/device_config.o mcc_generated_files/device_config.c 
	
${OBJECTDIR}/mocks/Mockeprom.o: mocks/Mockeprom.c  .generated_files/flags/test_fsm/ef4116f01019e086b8965dc08441379220253264 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mocks" 
	@${RM} ${OBJECTDIR}/mocks/Mockeprom.o.d 
	@${RM} ${OBJECTDIR}/mocks/Mockeprom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mocks/Mockeprom.o.d" -MT "${OBJECTDIR}/mocks/Mockeprom.o.d" -MT ${OBJECTDIR}/mocks/Mockeprom.o -o ${OBJECTDIR}/mocks/Mockeprom.o mocks/Mockeprom.c 
	
${OBJECTDIR}/mocks/Mockmodem.o: mocks/Mockmodem.c  .generated_files/flags/test_fsm/4af96921d77c42190787b2950fa051fcdddfaae7 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mocks" 
	@${RM} ${OBJECTDIR}/mocks/Mockmodem.o.d 
	@${RM} ${OBJECTDIR}/mocks/Mockmodem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mocks/Mockmodem.o.d" -MT "${OBJECTDIR}/mocks/Mockmodem.o.d" -MT ${OBJECTDIR}/mocks/Mockmodem.o -o ${OBJECTDIR}/mocks/Mockmodem.o mocks/Mockmodem.c 
	
${OBJECTDIR}/mocks/MockINA219.o: mocks/MockINA219.c  .generated_files/flags/test_fsm/bf0c28d611b0ab2f4318e285a5a908d0cc7fb18c .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mocks" 
	@${RM} ${OBJECTDIR}/mocks/MockINA219.o.d 
	@${RM} ${OBJECTDIR}/mocks/MockINA219.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mocks/MockINA219.o.d" -MT "${OBJECTDIR}/mocks/MockINA219.o.d" -MT ${OBJECTDIR}/mocks/MockINA219.o -o ${OBJECTDIR}/mocks/MockINA219.o mocks/MockINA219.c 
	
${OBJECTDIR}/test_main.o: test_main.c  .generated_files/flags/test_fsm/b7d319415fff67f3bcac069b81ae6e1a11740d95 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/test_main.o.d 
	@${RM} ${OBJECTDIR}/test_main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/test_main.o.d" -MT "${OBJECTDIR}/test_main.o.d" -MT ${OBJECTDIR}/test_main.o -o ${OBJECTDIR}/test_main.o test_main.c 
	
${OBJECTDIR}/unit/sensor_core_test.o: unit/sensor_core_test.c  .generated_files/flags/test_fsm/77c358d3f889d04a080fe252e5ba155543d55a06 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/sensor_core_test.o.d 
	@${RM} ${OBJECTDIR}/unit/sensor_core_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/sensor_core_test.o.d" -MT "${OBJECTDIR}/unit/sensor_core_test.o.d" -MT ${OBJECTDIR}/unit/sensor_core_test.o -o ${OBJECTDIR}/unit/sensor_core_test.o unit/sensor_core_test.c 
	
${OBJECTDIR}/unit/modem_test.o: unit/modem_test.c  .generated_files/flags/test_fsm/f6c1729cd55f2e9a73d72600e91194a698b858b1 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/modem_test.o.d 
	@${RM} ${OBJECTDIR}/unit/modem_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/modem_test.o.d" -MT "${OBJECTDIR}/unit/modem_test.o.d" -MT ${OBJECTDIR}/unit/modem_test.o -o ${OBJECTDIR}/unit/modem_test.o unit/modem_test.c 
	
${OBJECTDIR}/unit/node_test.o: unit/node_test.c  .generated_files/flags/test_fsm/12496a15ce3e3bc80dfa26aad1895e803615ef17 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/node_test.o.d 
	@${RM} ${OBJECTDIR}/unit/node_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/node_test.o.d" -MT "${OBJECTDIR}/unit/node_test.o.d" -MT ${OBJECTDIR}/unit/node_test.o -o ${OBJECTDIR}/unit/node_test.o unit/node_test.c 
	
${OBJECTDIR}/unit/node_init_test.o: unit/node_init_test.c  .generated_files/flags/test_fsm/14e43c3a144790e3d918275a26644a023f4da226 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/node_init_test.o.d 
	@${RM} ${OBJECTDIR}/unit/node_init_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/node_init_test.o.d" -MT "${OBJECTDIR}/unit/node_init_test.o.d" -MT ${OBJECTDIR}/unit/node_init_test.o -o ${OBJECTDIR}/unit/node_init_test.o unit/node_init_test.c 
	
else
${OBJECTDIR}/cmock/src/cmock.o: cmock/src/cmock.c  .generated_files/flags/test_fsm/40fddc963945a5e6ff26977dab3e4c8dba7e33d4 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/cmock/src" 
	@${RM} ${OBJECTDIR}/cmock/src/cmock.o.d 
	@${RM} ${OBJECTDIR}/cmock/src/cmock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/cmock/src/cmock.o.d" -MT "${OBJECTDIR}/cmock/src/cmock.o.d" -MT ${OBJECTDIR}/cmock/src/cmock.o -o ${OBJECTDIR}/cmock/src/cmock.o cmock/src/cmock.c 
	
${OBJECTDIR}/cmock/src/unity.o: cmock/src/unity.c  .generated_files/flags/test_fsm/b939c54321f8a0556c6c316ea0754424ac95f4ab .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/cmock/src" 
	@${RM} ${OBJECTDIR}/cmock/src/unity.o.d 
	@${RM} ${OBJECTDIR}/cmock/src/unity.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/cmock/src/unity.o.d" -MT "${OBJECTDIR}/cmock/src/unity.o.d" -MT ${OBJECTDIR}/cmock/src/unity.o -o ${OBJECTDIR}/cmock/src/unity.o cmock/src/unity.c 
	
${OBJECTDIR}/libavrxbee/xbee.o: libavrxbee/xbee.c  .generated_files/flags/test_fsm/409b8c6bbcd581db3a2b41cad8eb28b4da738008 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/libavrxbee" 
	@${RM} ${OBJECTDIR}/libavrxbee/xbee.o.d 
	@${RM} ${OBJECTDIR}/libavrxbee/xbee.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/libavrxbee/xbee.o.d" -MT "${OBJECTDIR}/libavrxbee/xbee.o.d" -MT ${OBJECTDIR}/libavrxbee/xbee.o -o ${OBJECTDIR}/libavrxbee/xbee.o libavrxbee/xbee.c 
	
${OBJECTDIR}/power_sensor.o: power_sensor.c  .generated_files/flags/test_fsm/7f7d2b40007e0becca956427c4b8ae25ce5a73a6 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/power_sensor.o.d 
	@${RM} ${OBJECTDIR}/power_sensor.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/power_sensor.o.d" -MT "${OBJECTDIR}/power_sensor.o.d" -MT ${OBJECTDIR}/power_sensor.o -o ${OBJECTDIR}/power_sensor.o power_sensor.c 
	
${OBJECTDIR}/sensor_core.o: sensor_core.c  .generated_files/flags/test_fsm/101c09a0ad5dde9451ba9ddc8c34f6a6cdc745ef .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/sensor_core.o.d 
	@${RM} ${OBJECTDIR}/sensor_core.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/sensor_core.o.d" -MT "${OBJECTDIR}/sensor_core.o.d" -MT ${OBJECTDIR}/sensor_core.o -o ${OBJECTDIR}/sensor_core.o sensor_core.c 
	
${OBJECTDIR}/node.o: node.c  .generated_files/flags/test_fsm/5cd49e34e00ebd9f4b3e87d9678aac846f28e721 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/node.o.d 
	@${RM} ${OBJECTDIR}/node.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/node.o.d" -MT "${OBJECTDIR}/node.o.d" -MT ${OBJECTDIR}/node.o -o ${OBJECTDIR}/node.o node.c 
	
${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o: mcc_generated_files/examples/twi0_master_example.c  .generated_files/flags/test_fsm/44bf281be115729019d96bbc0ae388914fd46c75 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/examples" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d" -MT "${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d" -MT ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o -o ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o mcc_generated_files/examples/twi0_master_example.c 
	
${OBJECTDIR}/mcc_generated_files/src/usart0.o: mcc_generated_files/src/usart0.c  .generated_files/flags/test_fsm/2807ffeb35ceacecea1d9d485436c71ff03bbd40 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/usart0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/usart0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/usart0.o -o ${OBJECTDIR}/mcc_generated_files/src/usart0.o mcc_generated_files/src/usart0.c 
	
${OBJECTDIR}/mcc_generated_files/src/usart1.o: mcc_generated_files/src/usart1.c  .generated_files/flags/test_fsm/3a8af66070a357afbd7034b987f911620e69af40 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/usart1.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/usart1.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/usart1.o -o ${OBJECTDIR}/mcc_generated_files/src/usart1.o mcc_generated_files/src/usart1.c 
	
${OBJECTDIR}/mcc_generated_files/src/rtc.o: mcc_generated_files/src/rtc.c  .generated_files/flags/test_fsm/f43e3743145568583273d72b24d581d59f5277aa .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/rtc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/rtc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/rtc.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/rtc.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/rtc.o -o ${OBJECTDIR}/mcc_generated_files/src/rtc.o mcc_generated_files/src/rtc.c 
	
${OBJECTDIR}/mcc_generated_files/src/pin_manager.o: mcc_generated_files/src/pin_manager.c  .generated_files/flags/test_fsm/bb58fad5d8bb2c808b45478f31bce8c0cc8285a4 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o -o ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o mcc_generated_files/src/pin_manager.c 
	
${OBJECTDIR}/mcc_generated_files/src/cpuint.o: mcc_generated_files/src/cpuint.c  .generated_files/flags/test_fsm/38f5a6c7697e50c9e0c67910c794ac6278fe066 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/cpuint.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/cpuint.o -o ${OBJECTDIR}/mcc_generated_files/src/cpuint.o mcc_generated_files/src/cpuint.c 
	
${OBJECTDIR}/mcc_generated_files/src/twi0_master.o: mcc_generated_files/src/twi0_master.c  .generated_files/flags/test_fsm/6270491d7fff046025b25d64645993f7b364ac55 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/twi0_master.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/twi0_master.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/twi0_master.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/twi0_master.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/twi0_master.o -o ${OBJECTDIR}/mcc_generated_files/src/twi0_master.o mcc_generated_files/src/twi0_master.c 
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/test_fsm/8b8f0095502ad6da86e4f06ef9076c4f14d518e0 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -MT "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -MT ${OBJECTDIR}/mcc_generated_files/mcc.o -o ${OBJECTDIR}/mcc_generated_files/mcc.o mcc_generated_files/mcc.c 
	
${OBJECTDIR}/mcc_generated_files/device_config.o: mcc_generated_files/device_config.c  .generated_files/flags/test_fsm/346d551853b05c9be0518bec15c337edc2d275a4 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/device_config.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/device_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/device_config.o.d" -MT "${OBJECTDIR}/mcc_generated_files/device_config.o.d" -MT ${OBJECTDIR}/mcc_generated_files/device_config.o -o ${OBJECTDIR}/mcc_generated_files/device_config.o mcc_generated_files/device_config.c 
	
${OBJECTDIR}/mocks/Mockeprom.o: mocks/Mockeprom.c  .generated_files/flags/test_fsm/8eccf29392a61fc687adf0829aaadd9c89ae6674 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mocks" 
	@${RM} ${OBJECTDIR}/mocks/Mockeprom.o.d 
	@${RM} ${OBJECTDIR}/mocks/Mockeprom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mocks/Mockeprom.o.d" -MT "${OBJECTDIR}/mocks/Mockeprom.o.d" -MT ${OBJECTDIR}/mocks/Mockeprom.o -o ${OBJECTDIR}/mocks/Mockeprom.o mocks/Mockeprom.c 
	
${OBJECTDIR}/mocks/Mockmodem.o: mocks/Mockmodem.c  .generated_files/flags/test_fsm/3705ea1f9a5a1e048533e34f91281a5350174c07 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mocks" 
	@${RM} ${OBJECTDIR}/mocks/Mockmodem.o.d 
	@${RM} ${OBJECTDIR}/mocks/Mockmodem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mocks/Mockmodem.o.d" -MT "${OBJECTDIR}/mocks/Mockmodem.o.d" -MT ${OBJECTDIR}/mocks/Mockmodem.o -o ${OBJECTDIR}/mocks/Mockmodem.o mocks/Mockmodem.c 
	
${OBJECTDIR}/mocks/MockINA219.o: mocks/MockINA219.c  .generated_files/flags/test_fsm/b5299a688fe46edfbf19919ea0ec1866c5c4a70b .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mocks" 
	@${RM} ${OBJECTDIR}/mocks/MockINA219.o.d 
	@${RM} ${OBJECTDIR}/mocks/MockINA219.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mocks/MockINA219.o.d" -MT "${OBJECTDIR}/mocks/MockINA219.o.d" -MT ${OBJECTDIR}/mocks/MockINA219.o -o ${OBJECTDIR}/mocks/MockINA219.o mocks/MockINA219.c 
	
${OBJECTDIR}/test_main.o: test_main.c  .generated_files/flags/test_fsm/435a76044ba929a6a63a00daa36121819174c77d .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/test_main.o.d 
	@${RM} ${OBJECTDIR}/test_main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/test_main.o.d" -MT "${OBJECTDIR}/test_main.o.d" -MT ${OBJECTDIR}/test_main.o -o ${OBJECTDIR}/test_main.o test_main.c 
	
${OBJECTDIR}/unit/sensor_core_test.o: unit/sensor_core_test.c  .generated_files/flags/test_fsm/8e98698b3e5e3a7611406c51fbe767d51fa7ebcd .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/sensor_core_test.o.d 
	@${RM} ${OBJECTDIR}/unit/sensor_core_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/sensor_core_test.o.d" -MT "${OBJECTDIR}/unit/sensor_core_test.o.d" -MT ${OBJECTDIR}/unit/sensor_core_test.o -o ${OBJECTDIR}/unit/sensor_core_test.o unit/sensor_core_test.c 
	
${OBJECTDIR}/unit/modem_test.o: unit/modem_test.c  .generated_files/flags/test_fsm/bbebb38a24c957dc1304e2ae98d509d57f4ab3e3 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/modem_test.o.d 
	@${RM} ${OBJECTDIR}/unit/modem_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/modem_test.o.d" -MT "${OBJECTDIR}/unit/modem_test.o.d" -MT ${OBJECTDIR}/unit/modem_test.o -o ${OBJECTDIR}/unit/modem_test.o unit/modem_test.c 
	
${OBJECTDIR}/unit/node_test.o: unit/node_test.c  .generated_files/flags/test_fsm/90215fc2d12fe31ddcf47a264eb82f5318a926fa .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/node_test.o.d 
	@${RM} ${OBJECTDIR}/unit/node_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/node_test.o.d" -MT "${OBJECTDIR}/unit/node_test.o.d" -MT ${OBJECTDIR}/unit/node_test.o -o ${OBJECTDIR}/unit/node_test.o unit/node_test.c 
	
${OBJECTDIR}/unit/node_init_test.o: unit/node_init_test.c  .generated_files/flags/test_fsm/b1a8f97f15b104b9586e0288eeee81f3947d4ca3 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/node_init_test.o.d 
	@${RM} ${OBJECTDIR}/unit/node_init_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/node_init_test.o.d" -MT "${OBJECTDIR}/unit/node_init_test.o.d" -MT ${OBJECTDIR}/unit/node_init_test.o -o ${OBJECTDIR}/unit/node_init_test.o unit/node_init_test.c 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/src/protected_io.o: mcc_generated_files/src/protected_io.S  .generated_files/flags/test_fsm/97c885cacc04a4b5e51197c941e21dcc49116989 .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/protected_io.o 
	${MP_CC} -c $(MP_EXTRA_AS_PRE) -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x assembler-with-cpp -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 -gdwarf-3 -Wa,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1   -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/protected_io.o -o ${OBJECTDIR}/mcc_generated_files/src/protected_io.o  mcc_generated_files/src/protected_io.S 
	
else
${OBJECTDIR}/mcc_generated_files/src/protected_io.o: mcc_generated_files/src/protected_io.S  .generated_files/flags/test_fsm/71a84f870f16fbcccde4595ce6fe0db433fd715d .generated_files/flags/test_fsm/1300d012931cb66396aec37cb3eb72dc7f908852
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/protected_io.o 
	${MP_CC} -c $(MP_EXTRA_AS_PRE) -mcpu=$(MP_PROCESSOR_OPTION)  -x assembler-with-cpp -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_fsm=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 -gdwarf-3 -Wa,--defsym=__MPLAB_BUILD=1   -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/protected_io.o -o ${OBJECTDIR}/mcc_generated_files/src/protected_io.o  mcc_generated_files/src/protected_io.S 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_test_fsm=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1    -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2 -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -Wl,-u,sigrowl,--defsym,min_heap_size=512 -gdwarf-3     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group  -Wl,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1
	@${RM} ${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.hex 
	
else
${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.map  -DXPRJ_test_fsm=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1    -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -Wl,-u,sigrowl,--defsym,min_heap_size=512 -gdwarf-3     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/PowerSensor-ATMEGA1608.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group 
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
