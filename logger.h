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

#define LOG_ERROR(args...) printf(args)
    
#if defined(LOGGER_DEBUG) || defined(LOGGER_INFO)    
#define LOG_BYTE_STREAM(prefix, byte_stream, stream_size) { \
    LOG_INFO(prefix);                                      \
    for(int idx = 0; idx<stream_size; idx++) {              \
        LOG_INFO("%02X ", byte_stream[idx]);               \
    }                                                       \
    LOG_INFO("\n");                                        \
} 
#else
#define LOG_BYTE_STREAM(prefix, byte_stream, stream_size)
#endif
    

#ifdef	__cplusplus
}
#endif

#endif	/* LOGGER_H */

