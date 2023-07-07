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
ifeq "$(wildcard nbproject/Makefile-local-Test.mk)" "nbproject/Makefile-local-Test.mk"
include nbproject/Makefile-local-Test.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=Test
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=cmock/src/cmock.c cmock/src/unity.c libavrxbee/xbee.c ina219/INA219.c power_sensor.c sensor_core.c node.c modem.c mcc_generated_files/examples/twi0_master_example.c mcc_generated_files/src/usart0.c mcc_generated_files/src/usart1.c mcc_generated_files/src/protected_io.S mcc_generated_files/src/rtc.c mcc_generated_files/src/pin_manager.c mcc_generated_files/src/cpuint.c mcc_generated_files/src/twi0_master.c mcc_generated_files/mcc.c mcc_generated_files/device_config.c test_main.c unit/sensor_core_test.c unit/modem_test.c unit/node_test.c mocks/Mockeprom.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/cmock/src/cmock.o ${OBJECTDIR}/cmock/src/unity.o ${OBJECTDIR}/libavrxbee/xbee.o ${OBJECTDIR}/ina219/INA219.o ${OBJECTDIR}/power_sensor.o ${OBJECTDIR}/sensor_core.o ${OBJECTDIR}/node.o ${OBJECTDIR}/modem.o ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o ${OBJECTDIR}/mcc_generated_files/src/usart0.o ${OBJECTDIR}/mcc_generated_files/src/usart1.o ${OBJECTDIR}/mcc_generated_files/src/protected_io.o ${OBJECTDIR}/mcc_generated_files/src/rtc.o ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o ${OBJECTDIR}/mcc_generated_files/src/cpuint.o ${OBJECTDIR}/mcc_generated_files/src/twi0_master.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/device_config.o ${OBJECTDIR}/test_main.o ${OBJECTDIR}/unit/sensor_core_test.o ${OBJECTDIR}/unit/modem_test.o ${OBJECTDIR}/unit/node_test.o ${OBJECTDIR}/mocks/Mockeprom.o
POSSIBLE_DEPFILES=${OBJECTDIR}/cmock/src/cmock.o.d ${OBJECTDIR}/cmock/src/unity.o.d ${OBJECTDIR}/libavrxbee/xbee.o.d ${OBJECTDIR}/ina219/INA219.o.d ${OBJECTDIR}/power_sensor.o.d ${OBJECTDIR}/sensor_core.o.d ${OBJECTDIR}/node.o.d ${OBJECTDIR}/modem.o.d ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d ${OBJECTDIR}/mcc_generated_files/src/usart0.o.d ${OBJECTDIR}/mcc_generated_files/src/usart1.o.d ${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d ${OBJECTDIR}/mcc_generated_files/src/rtc.o.d ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d ${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d ${OBJECTDIR}/mcc_generated_files/src/twi0_master.o.d ${OBJECTDIR}/mcc_generated_files/mcc.o.d ${OBJECTDIR}/mcc_generated_files/device_config.o.d ${OBJECTDIR}/test_main.o.d ${OBJECTDIR}/unit/sensor_core_test.o.d ${OBJECTDIR}/unit/modem_test.o.d ${OBJECTDIR}/unit/node_test.o.d ${OBJECTDIR}/mocks/Mockeprom.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/cmock/src/cmock.o ${OBJECTDIR}/cmock/src/unity.o ${OBJECTDIR}/libavrxbee/xbee.o ${OBJECTDIR}/ina219/INA219.o ${OBJECTDIR}/power_sensor.o ${OBJECTDIR}/sensor_core.o ${OBJECTDIR}/node.o ${OBJECTDIR}/modem.o ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o ${OBJECTDIR}/mcc_generated_files/src/usart0.o ${OBJECTDIR}/mcc_generated_files/src/usart1.o ${OBJECTDIR}/mcc_generated_files/src/protected_io.o ${OBJECTDIR}/mcc_generated_files/src/rtc.o ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o ${OBJECTDIR}/mcc_generated_files/src/cpuint.o ${OBJECTDIR}/mcc_generated_files/src/twi0_master.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/device_config.o ${OBJECTDIR}/test_main.o ${OBJECTDIR}/unit/sensor_core_test.o ${OBJECTDIR}/unit/modem_test.o ${OBJECTDIR}/unit/node_test.o ${OBJECTDIR}/mocks/Mockeprom.o

# Source Files
SOURCEFILES=cmock/src/cmock.c cmock/src/unity.c libavrxbee/xbee.c ina219/INA219.c power_sensor.c sensor_core.c node.c modem.c mcc_generated_files/examples/twi0_master_example.c mcc_generated_files/src/usart0.c mcc_generated_files/src/usart1.c mcc_generated_files/src/protected_io.S mcc_generated_files/src/rtc.c mcc_generated_files/src/pin_manager.c mcc_generated_files/src/cpuint.c mcc_generated_files/src/twi0_master.c mcc_generated_files/mcc.c mcc_generated_files/device_config.c test_main.c unit/sensor_core_test.c unit/modem_test.c unit/node_test.c mocks/Mockeprom.c



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
	${MAKE}  -f nbproject/Makefile-Test.mk ${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATmega4808
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/cmock/src/cmock.o: cmock/src/cmock.c  .generated_files/flags/Test/63fbe68ec8793c306599274509d84520ab64af7b .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/cmock/src" 
	@${RM} ${OBJECTDIR}/cmock/src/cmock.o.d 
	@${RM} ${OBJECTDIR}/cmock/src/cmock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/cmock/src/cmock.o.d" -MT "${OBJECTDIR}/cmock/src/cmock.o.d" -MT ${OBJECTDIR}/cmock/src/cmock.o -o ${OBJECTDIR}/cmock/src/cmock.o cmock/src/cmock.c 
	
${OBJECTDIR}/cmock/src/unity.o: cmock/src/unity.c  .generated_files/flags/Test/706ceb68fca09ff9e333f49816877c004503b408 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/cmock/src" 
	@${RM} ${OBJECTDIR}/cmock/src/unity.o.d 
	@${RM} ${OBJECTDIR}/cmock/src/unity.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/cmock/src/unity.o.d" -MT "${OBJECTDIR}/cmock/src/unity.o.d" -MT ${OBJECTDIR}/cmock/src/unity.o -o ${OBJECTDIR}/cmock/src/unity.o cmock/src/unity.c 
	
${OBJECTDIR}/libavrxbee/xbee.o: libavrxbee/xbee.c  .generated_files/flags/Test/7966965e7f3dab91ec76e9de2ea9210291b7e105 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/libavrxbee" 
	@${RM} ${OBJECTDIR}/libavrxbee/xbee.o.d 
	@${RM} ${OBJECTDIR}/libavrxbee/xbee.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/libavrxbee/xbee.o.d" -MT "${OBJECTDIR}/libavrxbee/xbee.o.d" -MT ${OBJECTDIR}/libavrxbee/xbee.o -o ${OBJECTDIR}/libavrxbee/xbee.o libavrxbee/xbee.c 
	
${OBJECTDIR}/ina219/INA219.o: ina219/INA219.c  .generated_files/flags/Test/1228b4f778ff2ef52db0610e59d45c8b0a71f460 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/ina219" 
	@${RM} ${OBJECTDIR}/ina219/INA219.o.d 
	@${RM} ${OBJECTDIR}/ina219/INA219.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/ina219/INA219.o.d" -MT "${OBJECTDIR}/ina219/INA219.o.d" -MT ${OBJECTDIR}/ina219/INA219.o -o ${OBJECTDIR}/ina219/INA219.o ina219/INA219.c 
	
${OBJECTDIR}/power_sensor.o: power_sensor.c  .generated_files/flags/Test/ba26151bc6651629baf72f6552e47814f7c4511 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/power_sensor.o.d 
	@${RM} ${OBJECTDIR}/power_sensor.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/power_sensor.o.d" -MT "${OBJECTDIR}/power_sensor.o.d" -MT ${OBJECTDIR}/power_sensor.o -o ${OBJECTDIR}/power_sensor.o power_sensor.c 
	
${OBJECTDIR}/sensor_core.o: sensor_core.c  .generated_files/flags/Test/ce7c6ac987928e17da4f293e4125cc97ef9f7fb2 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/sensor_core.o.d 
	@${RM} ${OBJECTDIR}/sensor_core.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/sensor_core.o.d" -MT "${OBJECTDIR}/sensor_core.o.d" -MT ${OBJECTDIR}/sensor_core.o -o ${OBJECTDIR}/sensor_core.o sensor_core.c 
	
${OBJECTDIR}/node.o: node.c  .generated_files/flags/Test/e3f8f82acd6b4d85dc83e1dc4988f5bf1bbd4833 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/node.o.d 
	@${RM} ${OBJECTDIR}/node.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/node.o.d" -MT "${OBJECTDIR}/node.o.d" -MT ${OBJECTDIR}/node.o -o ${OBJECTDIR}/node.o node.c 
	
${OBJECTDIR}/modem.o: modem.c  .generated_files/flags/Test/7e1347fc220f24968098f59193d0334472f285cc .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/modem.o.d 
	@${RM} ${OBJECTDIR}/modem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/modem.o.d" -MT "${OBJECTDIR}/modem.o.d" -MT ${OBJECTDIR}/modem.o -o ${OBJECTDIR}/modem.o modem.c 
	
${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o: mcc_generated_files/examples/twi0_master_example.c  .generated_files/flags/Test/4eab54bac603f67b11cb78be0f053768e3f01589 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/examples" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d" -MT "${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d" -MT ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o -o ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o mcc_generated_files/examples/twi0_master_example.c 
	
${OBJECTDIR}/mcc_generated_files/src/usart0.o: mcc_generated_files/src/usart0.c  .generated_files/flags/Test/a3935aec30e5389139ab5bf1e1fb94c2b63b0f11 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/usart0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/usart0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/usart0.o -o ${OBJECTDIR}/mcc_generated_files/src/usart0.o mcc_generated_files/src/usart0.c 
	
${OBJECTDIR}/mcc_generated_files/src/usart1.o: mcc_generated_files/src/usart1.c  .generated_files/flags/Test/48b4c8997098c385b07d4e4c30fc7ba43a660da2 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/usart1.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/usart1.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/usart1.o -o ${OBJECTDIR}/mcc_generated_files/src/usart1.o mcc_generated_files/src/usart1.c 
	
${OBJECTDIR}/mcc_generated_files/src/rtc.o: mcc_generated_files/src/rtc.c  .generated_files/flags/Test/438b39753bf4f92a5c485ca1147ae430e4ce0c01 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/rtc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/rtc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/rtc.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/rtc.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/rtc.o -o ${OBJECTDIR}/mcc_generated_files/src/rtc.o mcc_generated_files/src/rtc.c 
	
${OBJECTDIR}/mcc_generated_files/src/pin_manager.o: mcc_generated_files/src/pin_manager.c  .generated_files/flags/Test/33d5bbef0f142e420498b8e1633a407ab3c68a12 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o -o ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o mcc_generated_files/src/pin_manager.c 
	
${OBJECTDIR}/mcc_generated_files/src/cpuint.o: mcc_generated_files/src/cpuint.c  .generated_files/flags/Test/b4869cd8b47ec96ef9cabe8fef8eff70b1f4f64a .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/cpuint.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/cpuint.o -o ${OBJECTDIR}/mcc_generated_files/src/cpuint.o mcc_generated_files/src/cpuint.c 
	
${OBJECTDIR}/mcc_generated_files/src/twi0_master.o: mcc_generated_files/src/twi0_master.c  .generated_files/flags/Test/49cd2ea62dddd199b04724ef8761db5a263d6ea7 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/twi0_master.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/twi0_master.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/twi0_master.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/twi0_master.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/twi0_master.o -o ${OBJECTDIR}/mcc_generated_files/src/twi0_master.o mcc_generated_files/src/twi0_master.c 
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/Test/6c0bf04eaab763b377dd94bbe32b28b435fceb90 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -MT "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -MT ${OBJECTDIR}/mcc_generated_files/mcc.o -o ${OBJECTDIR}/mcc_generated_files/mcc.o mcc_generated_files/mcc.c 
	
${OBJECTDIR}/mcc_generated_files/device_config.o: mcc_generated_files/device_config.c  .generated_files/flags/Test/2fb02d1d5e93260025ecd9468bf34bc75c8a575e .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/device_config.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/device_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/device_config.o.d" -MT "${OBJECTDIR}/mcc_generated_files/device_config.o.d" -MT ${OBJECTDIR}/mcc_generated_files/device_config.o -o ${OBJECTDIR}/mcc_generated_files/device_config.o mcc_generated_files/device_config.c 
	
${OBJECTDIR}/test_main.o: test_main.c  .generated_files/flags/Test/3f65df784b838debeee51b5bffa1fdec11112ac8 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/test_main.o.d 
	@${RM} ${OBJECTDIR}/test_main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/test_main.o.d" -MT "${OBJECTDIR}/test_main.o.d" -MT ${OBJECTDIR}/test_main.o -o ${OBJECTDIR}/test_main.o test_main.c 
	
${OBJECTDIR}/unit/sensor_core_test.o: unit/sensor_core_test.c  .generated_files/flags/Test/984ff04372dc05cdf3b3dc01414d11da60a8f991 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/sensor_core_test.o.d 
	@${RM} ${OBJECTDIR}/unit/sensor_core_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/sensor_core_test.o.d" -MT "${OBJECTDIR}/unit/sensor_core_test.o.d" -MT ${OBJECTDIR}/unit/sensor_core_test.o -o ${OBJECTDIR}/unit/sensor_core_test.o unit/sensor_core_test.c 
	
${OBJECTDIR}/unit/modem_test.o: unit/modem_test.c  .generated_files/flags/Test/9e7f917aa20fb0829840acfc82f30ca22b6d494f .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/modem_test.o.d 
	@${RM} ${OBJECTDIR}/unit/modem_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/modem_test.o.d" -MT "${OBJECTDIR}/unit/modem_test.o.d" -MT ${OBJECTDIR}/unit/modem_test.o -o ${OBJECTDIR}/unit/modem_test.o unit/modem_test.c 
	
${OBJECTDIR}/unit/node_test.o: unit/node_test.c  .generated_files/flags/Test/1dbb3042fa53833538630857e0adb5f22ae5aed .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/node_test.o.d 
	@${RM} ${OBJECTDIR}/unit/node_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/node_test.o.d" -MT "${OBJECTDIR}/unit/node_test.o.d" -MT ${OBJECTDIR}/unit/node_test.o -o ${OBJECTDIR}/unit/node_test.o unit/node_test.c 
	
${OBJECTDIR}/mocks/Mockeprom.o: mocks/Mockeprom.c  .generated_files/flags/Test/22819ddcb74688da6178317d4e2f2c36e1b9cf00 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/mocks" 
	@${RM} ${OBJECTDIR}/mocks/Mockeprom.o.d 
	@${RM} ${OBJECTDIR}/mocks/Mockeprom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mocks/Mockeprom.o.d" -MT "${OBJECTDIR}/mocks/Mockeprom.o.d" -MT ${OBJECTDIR}/mocks/Mockeprom.o -o ${OBJECTDIR}/mocks/Mockeprom.o mocks/Mockeprom.c 
	
else
${OBJECTDIR}/cmock/src/cmock.o: cmock/src/cmock.c  .generated_files/flags/Test/2bed080618de8578fae8765725b9528baeb9909c .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/cmock/src" 
	@${RM} ${OBJECTDIR}/cmock/src/cmock.o.d 
	@${RM} ${OBJECTDIR}/cmock/src/cmock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/cmock/src/cmock.o.d" -MT "${OBJECTDIR}/cmock/src/cmock.o.d" -MT ${OBJECTDIR}/cmock/src/cmock.o -o ${OBJECTDIR}/cmock/src/cmock.o cmock/src/cmock.c 
	
${OBJECTDIR}/cmock/src/unity.o: cmock/src/unity.c  .generated_files/flags/Test/6c8ab32a0d701546b7967c04965f1f865326438c .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/cmock/src" 
	@${RM} ${OBJECTDIR}/cmock/src/unity.o.d 
	@${RM} ${OBJECTDIR}/cmock/src/unity.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/cmock/src/unity.o.d" -MT "${OBJECTDIR}/cmock/src/unity.o.d" -MT ${OBJECTDIR}/cmock/src/unity.o -o ${OBJECTDIR}/cmock/src/unity.o cmock/src/unity.c 
	
${OBJECTDIR}/libavrxbee/xbee.o: libavrxbee/xbee.c  .generated_files/flags/Test/17a8a49e33be56d6402f42d9b10031fce3f129c2 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/libavrxbee" 
	@${RM} ${OBJECTDIR}/libavrxbee/xbee.o.d 
	@${RM} ${OBJECTDIR}/libavrxbee/xbee.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/libavrxbee/xbee.o.d" -MT "${OBJECTDIR}/libavrxbee/xbee.o.d" -MT ${OBJECTDIR}/libavrxbee/xbee.o -o ${OBJECTDIR}/libavrxbee/xbee.o libavrxbee/xbee.c 
	
${OBJECTDIR}/ina219/INA219.o: ina219/INA219.c  .generated_files/flags/Test/a1ddf288babf8481d5d4bd5db5bbe9c9715dc446 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/ina219" 
	@${RM} ${OBJECTDIR}/ina219/INA219.o.d 
	@${RM} ${OBJECTDIR}/ina219/INA219.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/ina219/INA219.o.d" -MT "${OBJECTDIR}/ina219/INA219.o.d" -MT ${OBJECTDIR}/ina219/INA219.o -o ${OBJECTDIR}/ina219/INA219.o ina219/INA219.c 
	
${OBJECTDIR}/power_sensor.o: power_sensor.c  .generated_files/flags/Test/8e749e9fdccb1bf16e27cff8f7a1eef7bc3bc7fb .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/power_sensor.o.d 
	@${RM} ${OBJECTDIR}/power_sensor.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/power_sensor.o.d" -MT "${OBJECTDIR}/power_sensor.o.d" -MT ${OBJECTDIR}/power_sensor.o -o ${OBJECTDIR}/power_sensor.o power_sensor.c 
	
${OBJECTDIR}/sensor_core.o: sensor_core.c  .generated_files/flags/Test/577a6bf9c6f85c4a96f01b52906120840bc3d99a .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/sensor_core.o.d 
	@${RM} ${OBJECTDIR}/sensor_core.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/sensor_core.o.d" -MT "${OBJECTDIR}/sensor_core.o.d" -MT ${OBJECTDIR}/sensor_core.o -o ${OBJECTDIR}/sensor_core.o sensor_core.c 
	
${OBJECTDIR}/node.o: node.c  .generated_files/flags/Test/9c401c873a7b3ded10a378a55d42639811cdd82f .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/node.o.d 
	@${RM} ${OBJECTDIR}/node.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/node.o.d" -MT "${OBJECTDIR}/node.o.d" -MT ${OBJECTDIR}/node.o -o ${OBJECTDIR}/node.o node.c 
	
${OBJECTDIR}/modem.o: modem.c  .generated_files/flags/Test/afb0abc3ce296a7a23ff9c5eed26a9d61fa8ca45 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/modem.o.d 
	@${RM} ${OBJECTDIR}/modem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/modem.o.d" -MT "${OBJECTDIR}/modem.o.d" -MT ${OBJECTDIR}/modem.o -o ${OBJECTDIR}/modem.o modem.c 
	
${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o: mcc_generated_files/examples/twi0_master_example.c  .generated_files/flags/Test/2b2b509dbf54454e290d8f4ddb789f3005cf63b1 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/examples" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d" -MT "${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d" -MT ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o -o ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o mcc_generated_files/examples/twi0_master_example.c 
	
${OBJECTDIR}/mcc_generated_files/src/usart0.o: mcc_generated_files/src/usart0.c  .generated_files/flags/Test/c8da818bbe14f2d16aa6c48c66d72fe5f5dc4761 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/usart0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/usart0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/usart0.o -o ${OBJECTDIR}/mcc_generated_files/src/usart0.o mcc_generated_files/src/usart0.c 
	
${OBJECTDIR}/mcc_generated_files/src/usart1.o: mcc_generated_files/src/usart1.c  .generated_files/flags/Test/de3424baa9f0658fd842968a9c8e19c5be462016 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/usart1.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/usart1.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/usart1.o -o ${OBJECTDIR}/mcc_generated_files/src/usart1.o mcc_generated_files/src/usart1.c 
	
${OBJECTDIR}/mcc_generated_files/src/rtc.o: mcc_generated_files/src/rtc.c  .generated_files/flags/Test/d54fdb102b5594816b4ddc3c13539744a6179e5d .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/rtc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/rtc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/rtc.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/rtc.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/rtc.o -o ${OBJECTDIR}/mcc_generated_files/src/rtc.o mcc_generated_files/src/rtc.c 
	
${OBJECTDIR}/mcc_generated_files/src/pin_manager.o: mcc_generated_files/src/pin_manager.c  .generated_files/flags/Test/7824d9331ec48fa004cff778d72d0a1a81dbc113 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o -o ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o mcc_generated_files/src/pin_manager.c 
	
${OBJECTDIR}/mcc_generated_files/src/cpuint.o: mcc_generated_files/src/cpuint.c  .generated_files/flags/Test/dedb0d811e4e836d4a51ebc15e1e5e35e450a0e4 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/cpuint.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/cpuint.o -o ${OBJECTDIR}/mcc_generated_files/src/cpuint.o mcc_generated_files/src/cpuint.c 
	
${OBJECTDIR}/mcc_generated_files/src/twi0_master.o: mcc_generated_files/src/twi0_master.c  .generated_files/flags/Test/2e872bcb8966584b74efd2cb832496984c95bbae .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/twi0_master.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/twi0_master.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/twi0_master.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/twi0_master.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/twi0_master.o -o ${OBJECTDIR}/mcc_generated_files/src/twi0_master.o mcc_generated_files/src/twi0_master.c 
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/Test/e65b6182c1903a7a741c3176c1a5fec1779dcf08 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -MT "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -MT ${OBJECTDIR}/mcc_generated_files/mcc.o -o ${OBJECTDIR}/mcc_generated_files/mcc.o mcc_generated_files/mcc.c 
	
${OBJECTDIR}/mcc_generated_files/device_config.o: mcc_generated_files/device_config.c  .generated_files/flags/Test/c40c3c732cb44a65be71c1829c331400ada351a4 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/device_config.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/device_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/device_config.o.d" -MT "${OBJECTDIR}/mcc_generated_files/device_config.o.d" -MT ${OBJECTDIR}/mcc_generated_files/device_config.o -o ${OBJECTDIR}/mcc_generated_files/device_config.o mcc_generated_files/device_config.c 
	
${OBJECTDIR}/test_main.o: test_main.c  .generated_files/flags/Test/de53a730ec32668de579ce55181444a3d090d072 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/test_main.o.d 
	@${RM} ${OBJECTDIR}/test_main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/test_main.o.d" -MT "${OBJECTDIR}/test_main.o.d" -MT ${OBJECTDIR}/test_main.o -o ${OBJECTDIR}/test_main.o test_main.c 
	
${OBJECTDIR}/unit/sensor_core_test.o: unit/sensor_core_test.c  .generated_files/flags/Test/30b7023e395eb385988303a1e561c5836f4adab4 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/sensor_core_test.o.d 
	@${RM} ${OBJECTDIR}/unit/sensor_core_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/sensor_core_test.o.d" -MT "${OBJECTDIR}/unit/sensor_core_test.o.d" -MT ${OBJECTDIR}/unit/sensor_core_test.o -o ${OBJECTDIR}/unit/sensor_core_test.o unit/sensor_core_test.c 
	
${OBJECTDIR}/unit/modem_test.o: unit/modem_test.c  .generated_files/flags/Test/1b1468e853db89b819b908e184238103a40343fb .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/modem_test.o.d 
	@${RM} ${OBJECTDIR}/unit/modem_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/modem_test.o.d" -MT "${OBJECTDIR}/unit/modem_test.o.d" -MT ${OBJECTDIR}/unit/modem_test.o -o ${OBJECTDIR}/unit/modem_test.o unit/modem_test.c 
	
${OBJECTDIR}/unit/node_test.o: unit/node_test.c  .generated_files/flags/Test/9ff0c54606527c570361762e37d2c08969007cf1 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/node_test.o.d 
	@${RM} ${OBJECTDIR}/unit/node_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/node_test.o.d" -MT "${OBJECTDIR}/unit/node_test.o.d" -MT ${OBJECTDIR}/unit/node_test.o -o ${OBJECTDIR}/unit/node_test.o unit/node_test.c 
	
${OBJECTDIR}/mocks/Mockeprom.o: mocks/Mockeprom.c  .generated_files/flags/Test/6ef3a656b91aad28d49f4eea695ab8e9486c1f82 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/mocks" 
	@${RM} ${OBJECTDIR}/mocks/Mockeprom.o.d 
	@${RM} ${OBJECTDIR}/mocks/Mockeprom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mocks/Mockeprom.o.d" -MT "${OBJECTDIR}/mocks/Mockeprom.o.d" -MT ${OBJECTDIR}/mocks/Mockeprom.o -o ${OBJECTDIR}/mocks/Mockeprom.o mocks/Mockeprom.c 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/src/protected_io.o: mcc_generated_files/src/protected_io.S  .generated_files/flags/Test/59f785326b9fff8e30646709bce0e47963d9a88b .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/protected_io.o 
	${MP_CC} -c $(MP_EXTRA_AS_PRE) -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x assembler-with-cpp -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 -gdwarf-3 -Wa,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1   -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/protected_io.o -o ${OBJECTDIR}/mcc_generated_files/src/protected_io.o  mcc_generated_files/src/protected_io.S 
	
else
${OBJECTDIR}/mcc_generated_files/src/protected_io.o: mcc_generated_files/src/protected_io.S  .generated_files/flags/Test/97921483eb22d345f04460ca1f3c05db88b9f1c9 .generated_files/flags/Test/5717a5af8f161f1e5844b4a12294c82144b7f27
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/protected_io.o 
	${MP_CC} -c $(MP_EXTRA_AS_PRE) -mcpu=$(MP_PROCESSOR_OPTION)  -x assembler-with-cpp -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_Test=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 -gdwarf-3 -Wa,--defsym=__MPLAB_BUILD=1   -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/protected_io.o -o ${OBJECTDIR}/mcc_generated_files/src/protected_io.o  mcc_generated_files/src/protected_io.S 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_Test=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2 -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -Wl,-u,sigrowl,--defsym,min_heap_size=512 -gdwarf-3     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group  -Wl,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1
	@${RM} ${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.hex 
	
else
${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.map  -DXPRJ_Test=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -Wl,-u,sigrowl,--defsym,min_heap_size=512 -gdwarf-3     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	${MP_CC_DIR}\\avr-objcopy -O ihex "${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.hex"
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

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
