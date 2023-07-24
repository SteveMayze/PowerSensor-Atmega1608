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
#include "ina219/INA219.h"
    
    typedef struct {
        Token_t operation;
        uint8_t *sid;
        uint8_t data_token[16];
        float data_value[16];
        uint8_t data_length;
    } Node_Message_t;
    
    Error_t node_intitialise();
    Error_t node_close();
    void node_set_timeout(uint16_t timeout);
    void node_data_collection();
    void node_data_received(void);
    
    Node_Message_t *node_create_message(Token_t token, uint8_t *sid);

    typedef void (*Event_Callback_t)();
    

    
    void fsm_set_event_callback(FSM_Events_t event, Event_Callback_t cb);
    
    void node_check();
    
    

    
#ifdef	__cplusplus
}
#endif

#endif	/* NODE_H */

