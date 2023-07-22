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
#include "modem.h"

    
    struct node_message {
        uint8_t *sid;
        Token_t operation;
    };
    
    Error_t node_intitialise();
    Error_t node_close();
    void node_set_timeout(uint16_t timeout);
    void node_data_collection(void);
    void node_data_received(void);
    
    struct node_message *node_create_message(Token_t token, uint8_t *sid);

    typedef void (*callback_t)();
    

    
    void fsm_set_event_callback(FSM_Events_t event, callback_t cb, void* payload);
    
    void node_check();
    
    

    
#ifdef	__cplusplus
}
#endif

#endif	/* NODE_H */

