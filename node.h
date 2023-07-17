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

#include "sensor_core.h"
    
    struct node_message {
        uint8_t *sid;
        Token_t operation;
    };
    
    Error_t node_intitialise();
    Error_t node_close();
    void node_set_timeout(uint16_t timeout);
    
    struct node_message *node_create_message(Operation_t operation, uint8_t *sid);

    typedef void (*callback_t)();
    

    
    void node_set_callback(Operation_t, callback_t cb, void* payload);
    
    void node_check();
    
    

    
#ifdef	__cplusplus
}
#endif

#endif	/* NODE_H */

