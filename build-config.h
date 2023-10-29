/* 
 * File:   build-config.h
 * Author: steve
 *
 * Created on October 29, 2023, 11:11 AM
 */

#ifndef BUILD_CONFIG_H
#define	BUILD_CONFIG_H

#ifdef	__cplusplus
extern "C" {
#endif
    
#define LOGGER_LEVEL_OFF 0
#define LOGGER_LEVEL_ERROR 1
#define LOGGER_LEVEL_INFO 2
#define LOGGER_LEVEL_DEBUG 4
#define LOGGER_LEVEL_ALL 7

// #define UNIT_TEST_CFG
    
#ifdef UNIT_TEST_CFG
    #ifndef LOGGER_LEVEL
        #define LOGGER_LEVEL LOGGER_LEVEL_NONE
    #endif
    #define F_CPU 1UL
#else
    #ifndef LOGGER_LEVEL
        #define LOGGER_LEVEL LOGGER_LEVEL_INFO
    #endif
    #define F_CPU 10000000UL
#endif

    
#include "logger.h"
    
#ifdef	__cplusplus
}
#endif

#endif	/* BUILD_CONFIG_H */

