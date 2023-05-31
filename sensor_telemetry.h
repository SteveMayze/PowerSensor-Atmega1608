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
        XBEE_TOKEN_NULL = HEADER_GROUP | 0x00,        
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

/*!
 * Each data message is based on a name value pair. Due to the constraints
 * of an xbee message, the name is tokenised to a one byte value.
 * 
 * The structure of the message follows the following pattern.
 * 
 * DATA Message
 *      operation - XBEE_TOKEN_OPERATION + Operation code
 *         
 *         READY        SEND
 *         DATAREQ      RECEIVE
 *         DATA         SEND
 *         DATAACK      RECEIVE
 *         NODEINTROREQ RECEIVE
 *         NODEINTRO    SEND
 *         NODEINTROACK RECEIVE
 * 
 *      serial_id - XBEE_TOKEN_SERIAL_ID + 8 byte serial ID
 *      payload - token value pair depending on the operation. The basic case
 *                will be the DATA case.
 */
    typedef struct _xbee_node_frame {
        XBEE_TOKEN_T operation;
        uint8_t *serial_id; // (!) The hub is only expecting 8 bytes
        XBEE_TOKEN_T domain; // The domain and class are only used for the NODEINTRO.
        XBEE_TOKEN_T class;
        uint8_t payload_length;
        uint8_t *payload;

    } xbee_node_frame_t;
    

    /*!
     * \brief The structure that represents a message to be passed to the 
     *        XBEE modem.
     * 
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

    
    XBEE_STATE_T xbee_build_frame(xbee_frame_t *xbee_frame, XBEE_FRAME_TYPE_T frame_type, uint8_t frame_id, 
        uint64_t dest_addr_long, uint16_t dest_addr_short, 
        uint8_t rf_data_length, char *rf_data);
    
//    XBEE_STATE_T xbee_build_node_frame(xbee_node_frame_t *xbee_node_frame, XBEE_TOKEN_T operation, uint8_t *serial_id, 
//            XBEE_TOKEN_T class, XBEE_TOKEN_T domain, uint8_t payload_length, uint8_t *payload );

    XBEE_STATE_T xbee_build_node_data_frame(xbee_node_frame_t *xbee_node_frame, 
            uint8_t *serial_id, uint8_t payload_length, uint8_t *payload );


    XBEE_STATE_T xbee_build_node_intro_frame(xbee_node_frame_t *xbee_node_frame, uint8_t *serial_id, 
            XBEE_TOKEN_T domain, XBEE_TOKEN_T class, uint8_t payload_length, uint8_t *payload );

    /*!
     * \brief tokenize and adds a float value to the payload as a byte array.
     * 
     * This will return the new index + length of the value added.
     */
    uint8_t xbee_add_value_to_payload(uint8_t *payload, uint8_t idx, XBEE_TOKEN_T parameter, float f_value);

        
#ifdef	__cplusplus
}
#endif

#endif	/* XBEE_H */

