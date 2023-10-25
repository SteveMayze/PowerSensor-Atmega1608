/* 
 * File:   logger.h
 * Author: Steven
 *
 * Created on 25 October 2023, 10:04
 */

#ifndef LOGGER_H
#define	LOGGER_H

#ifdef	__cplusplus
extern "C" {
#endif


#ifdef LOGGER_DEBUG
    #define LOG_DEBUG(args...) printf(args)
#else
 #define LOG_DEBUG(args...) 
#endif

#if defined(LOGGER_INFO)
    #define LOG_INFO(args...) printf(args)
#else
 #define LOG_INFO(args...) 
#endif



#ifdef	__cplusplus
}
#endif

#endif	/* LOGGER_H */

