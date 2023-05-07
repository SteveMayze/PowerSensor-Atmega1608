/* 
 * File:   xbee.h
 * Author: steve
 *
 * Created on April 16, 2023, 5:50 PM
 */

#ifndef XBEE_H
#define	XBEE_H

#ifdef	__cplusplus
extern "C" {
#endif
    
#include "mcc_generated_files/mcc.h"
    
#define HEADER_GROUP 0x10
#define OPERATION_GROUP 0x20
#define PROPERTY_GROUP 0x30
#define METADATA_GROUP 0x40
    
    typedef enum XBEE_TOKEN {
        XBEE_TOKEN_OPERATION = HEADER_GROUP | 0x01,        
        XBEE_TOKEN_SERIAL_ID = HEADER_GROUP | 0x02,        
        XBEE_TOKEN_DOMAIN = HEADER_GROUP | 0x03,        
        XBEE_TOKEN_CLASS = HEADER_GROUP | 0x04,        
                
        XBEE_TOKEN_P = PROPERTY_GROUP | 0x00,        
        XBEE_TOKEN_BUS_VOLTAGE = PROPERTY_GROUP | 0x01,
        XBEE_TOKEN_SUNT_VOLTAGE = PROPERTY_GROUP | 0x02,        
        XBEE_TOKEN_LOAD_CURRENT = PROPERTY_GROUP | 0x03, 
                
        XBEE_TOKEN_READY = OPERATION_GROUP | 0x01,        
        XBEE_TOKEN_DATAREQ = OPERATION_GROUP | 0x02,        
        XBEE_TOKEN_DATA = OPERATION_GROUP | 0x03,        
        XBEE_TOKEN_DATAACK = OPERATION_GROUP | 0x04,        
        XBEE_TOKEN_NODEINTROREQ = OPERATION_GROUP | 0x05,        
        XBEE_TOKEN_NODEINTRO = OPERATION_GROUP | 0x06,        
        XBEE_TOKEN_NODEINTROACK = OPERATION_GROUP | 0x07,
                
        XBEE_TOKEN_POWER = METADATA_GROUP | 0x01,        
        XBEE_TOKEN_CAPACTITY = METADATA_GROUP | 0x04,        
        XBEE_TOKEN_SENSOR = METADATA_GROUP | 0x03,

    } XBEE_TOKEN_T;
    
typedef enum XBEE_STATE {
    XBEE_STATE_SUCCESS,
    XBEE_STATE_FAIL,
    XBEE_STATE_TIMEOUT
} XBEE_STATE_T;


typedef enum XBEE_FRAME_TYPE {
    XBEE_FRAME_TYPE_TX_REQUEST = 0x10
} XBEE_FRAME_TYPE_T;

#define XBEE_USART_BROADCAST_SHORT 0xFFFE
#define XBEE_START_DELIMITER 0x7E

/*
 * DATA Message
 *      operation
 *      serial_id - Device serial #
 *      addr64bit
 *      payload
 *          OPERATION: operation
 *          SERIAL_ID: serialID
 *          PROPERTTY_1: property_1_value // Packed integer value 4 bytes (Python struct.pack)
 *          PROPERTTY_2: property_2_value
 *          ...         
 *          PROPERTTY_n: property_n_value
 */

    typedef struct _xbee_frame {
        uint8_t start_delimiter;
        uint16_t data_length;
        XBEE_FRAME_TYPE_T frame_type;
        uint8_t frame_id;
        // uint64_t dest_addr_long;
        union {
           uint64_t b64;
           unsigned char bytes[8];
         } dest_addr_long;
        // uint16_t dest_addr_short;
        union {
           uint32_t b32;
           unsigned char bytes[8];
         } dest_addr_short;
        uint8_t broadcast_radius;
        uint8_t options;
        uint8_t rf_data_length;
        char *rf_data;
        uint8_t checksum;
        
    } xbee_frame_t;

    
    uint8_t xbee_get_checksum(void);
    
    XBEE_STATE_T xbee_build_frame(XBEE_FRAME_TYPE_T frame_type, uint8_t frame_id, 
        uint64_t dest_addr_long, uint16_t dest_addr_short, 
        uint8_t rf_data_length, char *rf_data);
    

#ifdef	__cplusplus
}
#endif

#endif	/* XBEE_H */

