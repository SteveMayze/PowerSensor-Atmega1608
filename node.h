/* 
 * File:   node.h
 * Author: Steven
 *
 * Created on 29 June 2023, 16:13
 */

#ifndef NODE_H
#define	NODE_H

#ifdef	__cplusplus
extern "C" {
#endif
    
#include "mcc_generated_files/mcc.h"

    typedef enum operation_e {
        READY = 1,
        DATAREQ,
        DATA,
        DATAACK,
        NODEINTROREQ,
        NODEINTRO,
        NODEINTROACK,
        TIMEOUT
    } Operation_t;
    
    #define OPERATION_GROUP 0x10
    #define METADATA_GROUP  0x40

    typedef enum token_e {
        // OPERATIONS
        NODE_OPERATION_READY = OPERATION_GROUP | READY,
                
        // METADATA
        NODE_METADATA_POWER =  METADATA_GROUP | 0x03
                
    } node_token_t;

    
    typedef enum node_status_e {
        NODE_STATE_OK,
        NODE_STATE_ERROR
    } node_status_t;
    
    struct node_message {
        uint8_t *sid;
        node_token_t operation;
    };
    
    node_status_t node_intitialise();
    
    struct node_message *node_create_message(Operation_t operation, uint8_t *sid);

    typedef void (*callback_t)();
    

    
    void node_set_callback(Operation_t, callback_t cb);
    void node_send_message();

    
#ifdef	__cplusplus
}
#endif

#endif	/* NODE_H */

