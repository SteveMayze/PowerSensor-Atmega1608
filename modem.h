/* 
 * File:   modem.h
 * Author: Steven
 *
 * Created on 29 June 2023, 17:08
 */

#ifndef MODEM_H
#define	MODEM_H

#ifdef	__cplusplus
extern "C" {
#endif

#include <stdint.h>



#ifdef	__cplusplus
}
#endif

#include "sensor_core.h"
#include "libavrxbee/xbee.h"

#define HEADER_GROUP 0x10
#define OPERATION_GROUP 0x20
#define PROPERTY_GROUP 0x30
#define METADATA_DOMAIN_GROUP  0x40
#define METADATA_CLASS_GROUP  0x50


    typedef enum token_e {
        NODE_TOKEN_VOID = 0x00,
        
        NODE_TOKEN_HEADER_OPERATION = HEADER_GROUP | 0x01,
        NODE_TOKEN_HEADER_SERIAL_ID = HEADER_GROUP | 0x02,
        NODE_TOKEN_HEADER_DOMAIN = HEADER_GROUP | 0x03,
        NODE_TOKEN_HEADER_CLASS = HEADER_GROUP | 0x04,
                
        // OPERATIONS
        NODE_TOKEN_READY = OPERATION_GROUP | 0x01,
        NODE_TOKEN_DATAREQ = OPERATION_GROUP | 0x02,
        NODE_TOKEN_DATA = OPERATION_GROUP | 0x03,
        NODE_TOKEN_DATAACK = OPERATION_GROUP | 0x04,
        NODE_TOKEN_NODEINTROREQ = OPERATION_GROUP | 0x05,
        NODE_TOKEN_NODEINTRO = OPERATION_GROUP | 0x06,
        NODE_TOKEN_NODEINTROACK = OPERATION_GROUP | 0x07,
                
        NODE_TOKEN_PROPERTY = PROPERTY_GROUP|0x00,
        NODE_TOKEN_PROPERTY_BUS_VOLTAGE = PROPERTY_GROUP | 0x01,
        NODE_TOKEN_PROPERTY_SHUNT_VOLTAGE = PROPERTY_GROUP | 0x02,
        NODE_TOKEN_PROPERTY_LOAD_CURRENT = PROPERTY_GROUP | 0x03,
                
        // METADATA
        NODE_METADATA_DOMAIN_POWER =  METADATA_DOMAIN_GROUP | 0x01,
        NODE_METADATA_DOMAIN_CAPACITY =  METADATA_DOMAIN_GROUP | 0x02,
        NODE_METADATA_DOMAIN_RATEY =  METADATA_DOMAIN_GROUP | 0x03,
                
        NODE_METADATA_CLASS_SENSOR =  METADATA_CLASS_GROUP | 0x03,
        NODE_METADATA_CLASS_ACTUATOR =  METADATA_CLASS_GROUP | 0x03,

    } Token_t;



    typedef struct response_message {
        
        xbee_frame_type frame_type;
        Token_t operation;
        uint8_t data_length;
        uint8_t *data;
        
    } ModemResponse_t;

    void modem_open(uint64_t coordinator);
    
    void modem_close(void);
    
    bool modem_message_arrived(void);
    
    uint64_t modem_get_coord_addr();
    
    ModemResponse_t* modem_receive_message(void);
    
    void modem_send_message(unsigned char* node_message, uint8_t data_length);

#endif	/* MODEM_H */

