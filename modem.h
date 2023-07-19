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

    typedef enum token_e {
        // OPERATIONS
        NODE_TOKEN_READY = OPERATION_GROUP | 0x01,
        NODE_TOKEN_DATAREQ = OPERATION_GROUP | 0x02,
        NODE_TOKEN_DATA = OPERATION_GROUP | 0x03,
        NODE_TOKEN_DATAACK = OPERATION_GROUP | 0x04,
        NODE_TOKEN_NODEINTROREQ = OPERATION_GROUP | 0x05,
        NODE_TOKEN_NODEINTRO = OPERATION_GROUP | 0x06,
        NODE_TOKEN_NODEINTROACK = OPERATION_GROUP | 0x07,
                
        // METADATA
        NODE_METADATA_POWER =  METADATA_GROUP | 0x03
                
    } Token_t;



    typedef struct response_message {
        
        uint8_t *data;
        uint8_t data_length;
        Token_t operation;
    } ModemResponse_t;

    void modem_open(uint64_t coordinator);
    
    void modem_close(void);
    
    bool modem_message_arrived(void);
    
    uint64_t modem_get_coord_addr();
    
    ModemResponse_t* modem_receive_message(void);

#endif	/* MODEM_H */

