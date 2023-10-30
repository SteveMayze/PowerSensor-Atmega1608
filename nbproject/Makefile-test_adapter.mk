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
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=test_adapter
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
	${MAKE}  -f nbproject/Makefile-test_adapter.mk ${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATmega4808
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/cmock/src/cmock.o: cmock/src/cmock.c  .generated_files/flags/test_adapter/a911f2d7cbd8acf22931a2ba0442b60f60a2e7c7 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/cmock/src" 
	@${RM} ${OBJECTDIR}/cmock/src/cmock.o.d 
	@${RM} ${OBJECTDIR}/cmock/src/cmock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/cmock/src/cmock.o.d" -MT "${OBJECTDIR}/cmock/src/cmock.o.d" -MT ${OBJECTDIR}/cmock/src/cmock.o -o ${OBJECTDIR}/cmock/src/cmock.o cmock/src/cmock.c 
	
${OBJECTDIR}/cmock/src/unity.o: cmock/src/unity.c  .generated_files/flags/test_adapter/cb6d8cf07f1fde24c11bd8eb746e65c9b7ad0354 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/cmock/src" 
	@${RM} ${OBJECTDIR}/cmock/src/unity.o.d 
	@${RM} ${OBJECTDIR}/cmock/src/unity.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/cmock/src/unity.o.d" -MT "${OBJECTDIR}/cmock/src/unity.o.d" -MT ${OBJECTDIR}/cmock/src/unity.o -o ${OBJECTDIR}/cmock/src/unity.o cmock/src/unity.c 
	
${OBJECTDIR}/ina219/INA219.o: ina219/INA219.c  .generated_files/flags/test_adapter/b8994f3430b18c7a1b27294deea20b2ecf899ecb .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/ina219" 
	@${RM} ${OBJECTDIR}/ina219/INA219.o.d 
	@${RM} ${OBJECTDIR}/ina219/INA219.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/ina219/INA219.o.d" -MT "${OBJECTDIR}/ina219/INA219.o.d" -MT ${OBJECTDIR}/ina219/INA219.o -o ${OBJECTDIR}/ina219/INA219.o ina219/INA219.c 
	
${OBJECTDIR}/modem.o: modem.c  .generated_files/flags/test_adapter/7a5117fa1b3c4b78618c131d4054d7a85f1c65a1 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/modem.o.d 
	@${RM} ${OBJECTDIR}/modem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/modem.o.d" -MT "${OBJECTDIR}/modem.o.d" -MT ${OBJECTDIR}/modem.o -o ${OBJECTDIR}/modem.o modem.c 
	
${OBJECTDIR}/sensor_core.o: sensor_core.c  .generated_files/flags/test_adapter/72f953fbec20ab8cbee84398dc15d01c16797d25 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/sensor_core.o.d 
	@${RM} ${OBJECTDIR}/sensor_core.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/sensor_core.o.d" -MT "${OBJECTDIR}/sensor_core.o.d" -MT ${OBJECTDIR}/sensor_core.o -o ${OBJECTDIR}/sensor_core.o sensor_core.c 
	
${OBJECTDIR}/node.o: node.c  .generated_files/flags/test_adapter/cd2e49b3131bc96e8ba35e59bbaeff03876a3939 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/node.o.d 
	@${RM} ${OBJECTDIR}/node.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/node.o.d" -MT "${OBJECTDIR}/node.o.d" -MT ${OBJECTDIR}/node.o -o ${OBJECTDIR}/node.o node.c 
	
${OBJECTDIR}/libavrxbee/xbee.o: libavrxbee/xbee.c  .generated_files/flags/test_adapter/bdda737652e472680db6fc0401c77888cd366072 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/libavrxbee" 
	@${RM} ${OBJECTDIR}/libavrxbee/xbee.o.d 
	@${RM} ${OBJECTDIR}/libavrxbee/xbee.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/libavrxbee/xbee.o.d" -MT "${OBJECTDIR}/libavrxbee/xbee.o.d" -MT ${OBJECTDIR}/libavrxbee/xbee.o -o ${OBJECTDIR}/libavrxbee/xbee.o libavrxbee/xbee.c 
	
${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o: mcc_generated_files/examples/twi0_master_example.c  .generated_files/flags/test_adapter/857d2266312cef4d1e9c2ea6e53d28bcc9875a47 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/examples" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d" -MT "${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d" -MT ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o -o ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o mcc_generated_files/examples/twi0_master_example.c 
	
${OBJECTDIR}/mcc_generated_files/src/usart1.o: mcc_generated_files/src/usart1.c  .generated_files/flags/test_adapter/473987626dc5160b85df0fccdab368549b4dfbed .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/usart1.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/usart1.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/usart1.o -o ${OBJECTDIR}/mcc_generated_files/src/usart1.o mcc_generated_files/src/usart1.c 
	
${OBJECTDIR}/mcc_generated_files/src/rtc.o: mcc_generated_files/src/rtc.c  .generated_files/flags/test_adapter/af20e5ea48e36d11f6ee9a76ab37059555d4a704 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/rtc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/rtc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/rtc.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/rtc.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/rtc.o -o ${OBJECTDIR}/mcc_generated_files/src/rtc.o mcc_generated_files/src/rtc.c 
	
${OBJECTDIR}/mcc_generated_files/src/pin_manager.o: mcc_generated_files/src/pin_manager.c  .generated_files/flags/test_adapter/9904cafee585df18888f759e64ffa1ff9e5a813d .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o -o ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o mcc_generated_files/src/pin_manager.c 
	
${OBJECTDIR}/mcc_generated_files/src/cpuint.o: mcc_generated_files/src/cpuint.c  .generated_files/flags/test_adapter/389cbc3094512963ee71fbe68e3c8b7faa5e4337 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/cpuint.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/cpuint.o -o ${OBJECTDIR}/mcc_generated_files/src/cpuint.o mcc_generated_files/src/cpuint.c 
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/test_adapter/8b48c97dbcfe683925618635cf5fe2e25e580b5d .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -MT "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -MT ${OBJECTDIR}/mcc_generated_files/mcc.o -o ${OBJECTDIR}/mcc_generated_files/mcc.o mcc_generated_files/mcc.c 
	
${OBJECTDIR}/mcc_generated_files/device_config.o: mcc_generated_files/device_config.c  .generated_files/flags/test_adapter/bfa5d8de9c658081b352b2952ad88a98cf83c49b .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/device_config.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/device_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/device_config.o.d" -MT "${OBJECTDIR}/mcc_generated_files/device_config.o.d" -MT ${OBJECTDIR}/mcc_generated_files/device_config.o -o ${OBJECTDIR}/mcc_generated_files/device_config.o mcc_generated_files/device_config.c 
	
${OBJECTDIR}/mocks/Mockeprom.o: mocks/Mockeprom.c  .generated_files/flags/test_adapter/f2ee06d762ee562173f7242465be3d4e327573a2 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/mocks" 
	@${RM} ${OBJECTDIR}/mocks/Mockeprom.o.d 
	@${RM} ${OBJECTDIR}/mocks/Mockeprom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mocks/Mockeprom.o.d" -MT "${OBJECTDIR}/mocks/Mockeprom.o.d" -MT ${OBJECTDIR}/mocks/Mockeprom.o -o ${OBJECTDIR}/mocks/Mockeprom.o mocks/Mockeprom.c 
	
${OBJECTDIR}/mocks/Mocktwi0_master.o: mocks/Mocktwi0_master.c  .generated_files/flags/test_adapter/3b99d6182bd8afbc581ca91637228987dd122881 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/mocks" 
	@${RM} ${OBJECTDIR}/mocks/Mocktwi0_master.o.d 
	@${RM} ${OBJECTDIR}/mocks/Mocktwi0_master.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mocks/Mocktwi0_master.o.d" -MT "${OBJECTDIR}/mocks/Mocktwi0_master.o.d" -MT ${OBJECTDIR}/mocks/Mocktwi0_master.o -o ${OBJECTDIR}/mocks/Mocktwi0_master.o mocks/Mocktwi0_master.c 
	
${OBJECTDIR}/mocks/Mockusart0.o: mocks/Mockusart0.c  .generated_files/flags/test_adapter/1ebdfd65dd357fa972a739f2b3d4a676a602871 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/mocks" 
	@${RM} ${OBJECTDIR}/mocks/Mockusart0.o.d 
	@${RM} ${OBJECTDIR}/mocks/Mockusart0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mocks/Mockusart0.o.d" -MT "${OBJECTDIR}/mocks/Mockusart0.o.d" -MT ${OBJECTDIR}/mocks/Mockusart0.o -o ${OBJECTDIR}/mocks/Mockusart0.o mocks/Mockusart0.c 
	
${OBJECTDIR}/test_adapter_main.o: test_adapter_main.c  .generated_files/flags/test_adapter/20d0e3a98f8432870892fc7ce49eb95b8d2958b9 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/test_adapter_main.o.d 
	@${RM} ${OBJECTDIR}/test_adapter_main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/test_adapter_main.o.d" -MT "${OBJECTDIR}/test_adapter_main.o.d" -MT ${OBJECTDIR}/test_adapter_main.o -o ${OBJECTDIR}/test_adapter_main.o test_adapter_main.c 
	
${OBJECTDIR}/unit/sensor_core_test.o: unit/sensor_core_test.c  .generated_files/flags/test_adapter/3ef7327bf0b96e742629cfe9b59e4d780004cbd8 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/sensor_core_test.o.d 
	@${RM} ${OBJECTDIR}/unit/sensor_core_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/sensor_core_test.o.d" -MT "${OBJECTDIR}/unit/sensor_core_test.o.d" -MT ${OBJECTDIR}/unit/sensor_core_test.o -o ${OBJECTDIR}/unit/sensor_core_test.o unit/sensor_core_test.c 
	
${OBJECTDIR}/unit/node_init_test.o: unit/node_init_test.c  .generated_files/flags/test_adapter/b899400fab927704a6e71a458a17bb0e1fc2fbef .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/node_init_test.o.d 
	@${RM} ${OBJECTDIR}/unit/node_init_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/node_init_test.o.d" -MT "${OBJECTDIR}/unit/node_init_test.o.d" -MT ${OBJECTDIR}/unit/node_init_test.o -o ${OBJECTDIR}/unit/node_init_test.o unit/node_init_test.c 
	
${OBJECTDIR}/unit/node_basic_test.o: unit/node_basic_test.c  .generated_files/flags/test_adapter/45a828bd32788937a6834bc95212001c9a192f2a .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/node_basic_test.o.d 
	@${RM} ${OBJECTDIR}/unit/node_basic_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/node_basic_test.o.d" -MT "${OBJECTDIR}/unit/node_basic_test.o.d" -MT ${OBJECTDIR}/unit/node_basic_test.o -o ${OBJECTDIR}/unit/node_basic_test.o unit/node_basic_test.c 
	
${OBJECTDIR}/unit/node_test.o: unit/node_test.c  .generated_files/flags/test_adapter/8a449377f90ff3739ddc973a3cc1a8472473dd49 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/node_test.o.d 
	@${RM} ${OBJECTDIR}/unit/node_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/node_test.o.d" -MT "${OBJECTDIR}/unit/node_test.o.d" -MT ${OBJECTDIR}/unit/node_test.o -o ${OBJECTDIR}/unit/node_test.o unit/node_test.c 
	
${OBJECTDIR}/unit/test_common.o: unit/test_common.c  .generated_files/flags/test_adapter/ef699023ea391d8223ef8063c8b93793e10cb50d .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/test_common.o.d 
	@${RM} ${OBJECTDIR}/unit/test_common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/test_common.o.d" -MT "${OBJECTDIR}/unit/test_common.o.d" -MT ${OBJECTDIR}/unit/test_common.o -o ${OBJECTDIR}/unit/test_common.o unit/test_common.c 
	
${OBJECTDIR}/unit/ina219_test.o: unit/ina219_test.c  .generated_files/flags/test_adapter/665b0def3b475f41d431130972ad7d472b79242d .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/ina219_test.o.d 
	@${RM} ${OBJECTDIR}/unit/ina219_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/ina219_test.o.d" -MT "${OBJECTDIR}/unit/ina219_test.o.d" -MT ${OBJECTDIR}/unit/ina219_test.o -o ${OBJECTDIR}/unit/ina219_test.o unit/ina219_test.c 
	
${OBJECTDIR}/unit/modem_send_test.o: unit/modem_send_test.c  .generated_files/flags/test_adapter/41a4636ea21a54a678fba7b2b090d3d85a1884ee .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/modem_send_test.o.d 
	@${RM} ${OBJECTDIR}/unit/modem_send_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/modem_send_test.o.d" -MT "${OBJECTDIR}/unit/modem_send_test.o.d" -MT ${OBJECTDIR}/unit/modem_send_test.o -o ${OBJECTDIR}/unit/modem_send_test.o unit/modem_send_test.c 
	
${OBJECTDIR}/unit/modem_receive_test.o: unit/modem_receive_test.c  .generated_files/flags/test_adapter/1889d53178160fff4892ce7e8f6b5fc662f77d4 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/modem_receive_test.o.d 
	@${RM} ${OBJECTDIR}/unit/modem_receive_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/modem_receive_test.o.d" -MT "${OBJECTDIR}/unit/modem_receive_test.o.d" -MT ${OBJECTDIR}/unit/modem_receive_test.o -o ${OBJECTDIR}/unit/modem_receive_test.o unit/modem_receive_test.c 
	
else
${OBJECTDIR}/cmock/src/cmock.o: cmock/src/cmock.c  .generated_files/flags/test_adapter/f96e608c6d720cb492a45da3bc02a081ccbe0a9 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/cmock/src" 
	@${RM} ${OBJECTDIR}/cmock/src/cmock.o.d 
	@${RM} ${OBJECTDIR}/cmock/src/cmock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/cmock/src/cmock.o.d" -MT "${OBJECTDIR}/cmock/src/cmock.o.d" -MT ${OBJECTDIR}/cmock/src/cmock.o -o ${OBJECTDIR}/cmock/src/cmock.o cmock/src/cmock.c 
	
${OBJECTDIR}/cmock/src/unity.o: cmock/src/unity.c  .generated_files/flags/test_adapter/e49e73af162ac8b6ce9a9c0093bbf6ebc312c88a .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/cmock/src" 
	@${RM} ${OBJECTDIR}/cmock/src/unity.o.d 
	@${RM} ${OBJECTDIR}/cmock/src/unity.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/cmock/src/unity.o.d" -MT "${OBJECTDIR}/cmock/src/unity.o.d" -MT ${OBJECTDIR}/cmock/src/unity.o -o ${OBJECTDIR}/cmock/src/unity.o cmock/src/unity.c 
	
${OBJECTDIR}/ina219/INA219.o: ina219/INA219.c  .generated_files/flags/test_adapter/35c39bfe512250c8863db53ed94825d407d92711 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/ina219" 
	@${RM} ${OBJECTDIR}/ina219/INA219.o.d 
	@${RM} ${OBJECTDIR}/ina219/INA219.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/ina219/INA219.o.d" -MT "${OBJECTDIR}/ina219/INA219.o.d" -MT ${OBJECTDIR}/ina219/INA219.o -o ${OBJECTDIR}/ina219/INA219.o ina219/INA219.c 
	
${OBJECTDIR}/modem.o: modem.c  .generated_files/flags/test_adapter/7ccb148b23701add3880cac5649bd3e39d5c180a .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/modem.o.d 
	@${RM} ${OBJECTDIR}/modem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/modem.o.d" -MT "${OBJECTDIR}/modem.o.d" -MT ${OBJECTDIR}/modem.o -o ${OBJECTDIR}/modem.o modem.c 
	
${OBJECTDIR}/sensor_core.o: sensor_core.c  .generated_files/flags/test_adapter/d5ffd5cfbbd43bfe718c6f005789ab0f29d64a7f .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/sensor_core.o.d 
	@${RM} ${OBJECTDIR}/sensor_core.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/sensor_core.o.d" -MT "${OBJECTDIR}/sensor_core.o.d" -MT ${OBJECTDIR}/sensor_core.o -o ${OBJECTDIR}/sensor_core.o sensor_core.c 
	
${OBJECTDIR}/node.o: node.c  .generated_files/flags/test_adapter/fc459da85d1cc387e67c7b5bc7853dda5030d463 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/node.o.d 
	@${RM} ${OBJECTDIR}/node.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/node.o.d" -MT "${OBJECTDIR}/node.o.d" -MT ${OBJECTDIR}/node.o -o ${OBJECTDIR}/node.o node.c 
	
${OBJECTDIR}/libavrxbee/xbee.o: libavrxbee/xbee.c  .generated_files/flags/test_adapter/93538e8872553324bd522a561b7aeb5c26fea1dc .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/libavrxbee" 
	@${RM} ${OBJECTDIR}/libavrxbee/xbee.o.d 
	@${RM} ${OBJECTDIR}/libavrxbee/xbee.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/libavrxbee/xbee.o.d" -MT "${OBJECTDIR}/libavrxbee/xbee.o.d" -MT ${OBJECTDIR}/libavrxbee/xbee.o -o ${OBJECTDIR}/libavrxbee/xbee.o libavrxbee/xbee.c 
	
${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o: mcc_generated_files/examples/twi0_master_example.c  .generated_files/flags/test_adapter/6b3321611e874224a26989c94e0a101772328b02 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/examples" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d" -MT "${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o.d" -MT ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o -o ${OBJECTDIR}/mcc_generated_files/examples/twi0_master_example.o mcc_generated_files/examples/twi0_master_example.c 
	
${OBJECTDIR}/mcc_generated_files/src/usart1.o: mcc_generated_files/src/usart1.c  .generated_files/flags/test_adapter/e6bc3982e7292dd5574f3212cf0e90a00ac9fcdf .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/usart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/usart1.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/usart1.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/usart1.o -o ${OBJECTDIR}/mcc_generated_files/src/usart1.o mcc_generated_files/src/usart1.c 
	
${OBJECTDIR}/mcc_generated_files/src/rtc.o: mcc_generated_files/src/rtc.c  .generated_files/flags/test_adapter/fbbbb8c7be248778ee11b5085913352abba51036 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/rtc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/rtc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/rtc.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/rtc.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/rtc.o -o ${OBJECTDIR}/mcc_generated_files/src/rtc.o mcc_generated_files/src/rtc.c 
	
${OBJECTDIR}/mcc_generated_files/src/pin_manager.o: mcc_generated_files/src/pin_manager.c  .generated_files/flags/test_adapter/89caab6cb3b9183eec1fe14aa3696267c191a39c .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/pin_manager.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o -o ${OBJECTDIR}/mcc_generated_files/src/pin_manager.o mcc_generated_files/src/pin_manager.c 
	
${OBJECTDIR}/mcc_generated_files/src/cpuint.o: mcc_generated_files/src/cpuint.c  .generated_files/flags/test_adapter/db00629b85ccf8f83040553a77420b6dde480749 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/cpuint.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/cpuint.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/cpuint.o -o ${OBJECTDIR}/mcc_generated_files/src/cpuint.o mcc_generated_files/src/cpuint.c 
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/test_adapter/b9accb9499ef326d38fd3f7edc3e53222f89bdaa .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -MT "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -MT ${OBJECTDIR}/mcc_generated_files/mcc.o -o ${OBJECTDIR}/mcc_generated_files/mcc.o mcc_generated_files/mcc.c 
	
${OBJECTDIR}/mcc_generated_files/device_config.o: mcc_generated_files/device_config.c  .generated_files/flags/test_adapter/5c9599d885f5da145565782b7bc1e82e37e4366f .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/device_config.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/device_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/device_config.o.d" -MT "${OBJECTDIR}/mcc_generated_files/device_config.o.d" -MT ${OBJECTDIR}/mcc_generated_files/device_config.o -o ${OBJECTDIR}/mcc_generated_files/device_config.o mcc_generated_files/device_config.c 
	
${OBJECTDIR}/mocks/Mockeprom.o: mocks/Mockeprom.c  .generated_files/flags/test_adapter/ec49030b974c08c70b0907058d5c844dfe5ce626 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/mocks" 
	@${RM} ${OBJECTDIR}/mocks/Mockeprom.o.d 
	@${RM} ${OBJECTDIR}/mocks/Mockeprom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mocks/Mockeprom.o.d" -MT "${OBJECTDIR}/mocks/Mockeprom.o.d" -MT ${OBJECTDIR}/mocks/Mockeprom.o -o ${OBJECTDIR}/mocks/Mockeprom.o mocks/Mockeprom.c 
	
${OBJECTDIR}/mocks/Mocktwi0_master.o: mocks/Mocktwi0_master.c  .generated_files/flags/test_adapter/9d71aa71177ac570848ef8337b45bf87382aaf11 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/mocks" 
	@${RM} ${OBJECTDIR}/mocks/Mocktwi0_master.o.d 
	@${RM} ${OBJECTDIR}/mocks/Mocktwi0_master.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mocks/Mocktwi0_master.o.d" -MT "${OBJECTDIR}/mocks/Mocktwi0_master.o.d" -MT ${OBJECTDIR}/mocks/Mocktwi0_master.o -o ${OBJECTDIR}/mocks/Mocktwi0_master.o mocks/Mocktwi0_master.c 
	
${OBJECTDIR}/mocks/Mockusart0.o: mocks/Mockusart0.c  .generated_files/flags/test_adapter/8f1c5623863a1d4ea1d68a312edbbcfab954c14f .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/mocks" 
	@${RM} ${OBJECTDIR}/mocks/Mockusart0.o.d 
	@${RM} ${OBJECTDIR}/mocks/Mockusart0.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/mocks/Mockusart0.o.d" -MT "${OBJECTDIR}/mocks/Mockusart0.o.d" -MT ${OBJECTDIR}/mocks/Mockusart0.o -o ${OBJECTDIR}/mocks/Mockusart0.o mocks/Mockusart0.c 
	
${OBJECTDIR}/test_adapter_main.o: test_adapter_main.c  .generated_files/flags/test_adapter/22b21e8c3332863a686bbaa8fa5a93e9fa539f78 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/test_adapter_main.o.d 
	@${RM} ${OBJECTDIR}/test_adapter_main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/test_adapter_main.o.d" -MT "${OBJECTDIR}/test_adapter_main.o.d" -MT ${OBJECTDIR}/test_adapter_main.o -o ${OBJECTDIR}/test_adapter_main.o test_adapter_main.c 
	
${OBJECTDIR}/unit/sensor_core_test.o: unit/sensor_core_test.c  .generated_files/flags/test_adapter/1437fe14219d7622f89cb987a7d54d99a101d74d .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/sensor_core_test.o.d 
	@${RM} ${OBJECTDIR}/unit/sensor_core_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/sensor_core_test.o.d" -MT "${OBJECTDIR}/unit/sensor_core_test.o.d" -MT ${OBJECTDIR}/unit/sensor_core_test.o -o ${OBJECTDIR}/unit/sensor_core_test.o unit/sensor_core_test.c 
	
${OBJECTDIR}/unit/node_init_test.o: unit/node_init_test.c  .generated_files/flags/test_adapter/b78c888b5f5caffdb8ab1278999dc09313bf6d95 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/node_init_test.o.d 
	@${RM} ${OBJECTDIR}/unit/node_init_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/node_init_test.o.d" -MT "${OBJECTDIR}/unit/node_init_test.o.d" -MT ${OBJECTDIR}/unit/node_init_test.o -o ${OBJECTDIR}/unit/node_init_test.o unit/node_init_test.c 
	
${OBJECTDIR}/unit/node_basic_test.o: unit/node_basic_test.c  .generated_files/flags/test_adapter/de522ac84dc89fb8f7ca9f291f69bac7b7f0f0ed .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/node_basic_test.o.d 
	@${RM} ${OBJECTDIR}/unit/node_basic_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/node_basic_test.o.d" -MT "${OBJECTDIR}/unit/node_basic_test.o.d" -MT ${OBJECTDIR}/unit/node_basic_test.o -o ${OBJECTDIR}/unit/node_basic_test.o unit/node_basic_test.c 
	
${OBJECTDIR}/unit/node_test.o: unit/node_test.c  .generated_files/flags/test_adapter/7e9978c7f7799ff489bd1fc71992028f3d83bd3b .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/node_test.o.d 
	@${RM} ${OBJECTDIR}/unit/node_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/node_test.o.d" -MT "${OBJECTDIR}/unit/node_test.o.d" -MT ${OBJECTDIR}/unit/node_test.o -o ${OBJECTDIR}/unit/node_test.o unit/node_test.c 
	
${OBJECTDIR}/unit/test_common.o: unit/test_common.c  .generated_files/flags/test_adapter/d1b472c404d6f53abec7b25aa0cd962142c41255 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/test_common.o.d 
	@${RM} ${OBJECTDIR}/unit/test_common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/test_common.o.d" -MT "${OBJECTDIR}/unit/test_common.o.d" -MT ${OBJECTDIR}/unit/test_common.o -o ${OBJECTDIR}/unit/test_common.o unit/test_common.c 
	
${OBJECTDIR}/unit/ina219_test.o: unit/ina219_test.c  .generated_files/flags/test_adapter/9aa31ac12581566235905b8ef9ed74a0f972325d .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/ina219_test.o.d 
	@${RM} ${OBJECTDIR}/unit/ina219_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/ina219_test.o.d" -MT "${OBJECTDIR}/unit/ina219_test.o.d" -MT ${OBJECTDIR}/unit/ina219_test.o -o ${OBJECTDIR}/unit/ina219_test.o unit/ina219_test.c 
	
${OBJECTDIR}/unit/modem_send_test.o: unit/modem_send_test.c  .generated_files/flags/test_adapter/e694639bb80d3547da846966f722e4f64b647892 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/unit" 
	@${RM} ${OBJECTDIR}/unit/modem_send_test.o.d 
	@${RM} ${OBJECTDIR}/unit/modem_send_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 $(COMPARISON_BUILD)  -gdwarf-3     -MD -MP -MF "${OBJECTDIR}/unit/modem_send_test.o.d" -MT "${OBJECTDIR}/unit/modem_send_test.o.d" -MT ${OBJECTDIR}/unit/modem_send_test.o -o ${OBJECTDIR}/unit/modem_send_test.o unit/modem_send_test.c 
	
${OBJECTDIR}/unit/modem_receive_test.o: unit/modem_receive_test.c  .generated_files/flags/test_adapter/20f0609eb2b5ae3cbcc8b6da912ed581e4b8fce4 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
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
${OBJECTDIR}/mcc_generated_files/src/protected_io.o: mcc_generated_files/src/protected_io.S  .generated_files/flags/test_adapter/464cf1d8062bda906ddc80534975fc4084e4b899 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/protected_io.o 
	${MP_CC} -c $(MP_EXTRA_AS_PRE) -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG=1 -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x assembler-with-cpp -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 -gdwarf-3 -Wa,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1   -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/protected_io.o -o ${OBJECTDIR}/mcc_generated_files/src/protected_io.o  mcc_generated_files/src/protected_io.S 
	
else
${OBJECTDIR}/mcc_generated_files/src/protected_io.o: mcc_generated_files/src/protected_io.S  .generated_files/flags/test_adapter/9073540ab28476a4cf270c210f51ac1141b346f7 .generated_files/flags/test_adapter/6850a920c6a76b478198a71fc158da3036849bcb
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/src/protected_io.o 
	${MP_CC} -c $(MP_EXTRA_AS_PRE) -mcpu=$(MP_PROCESSOR_OPTION)  -x assembler-with-cpp -D__$(MP_PROCESSOR_OPTION)__   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -DXPRJ_test_adapter=$(CND_CONF)  -Wl,-u,sigrowl,--defsym,min_heap_size=512 -gdwarf-3 -Wa,--defsym=__MPLAB_BUILD=1   -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d" -MT "${OBJECTDIR}/mcc_generated_files/src/protected_io.o.d" -MT ${OBJECTDIR}/mcc_generated_files/src/protected_io.o -o ${OBJECTDIR}/mcc_generated_files/src/protected_io.o  mcc_generated_files/src/protected_io.S 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_test_adapter=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2 -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -Wl,-u,sigrowl,--defsym,min_heap_size=512 -gdwarf-3     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group  -Wl,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1
	@${RM} ${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.hex 
	
else
${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.map  -DXPRJ_test_adapter=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -Wl,--gc-sections -O1 -ffunction-sections -fdata-sections -fshort-enums -fno-common -funsigned-char -funsigned-bitfields -Wall -Wl,-u,sigrowl,--defsym,min_heap_size=512 -gdwarf-3     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/PowerSensor-Atmega1608.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group 
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
