/* 
 * File:   sensor_core.h
 * Author: steve
 *
 * Created on May 1, 2023, 7:03 PM
 */

#ifndef SENSOR_CORE_H
#define	SENSOR_CORE_H

#ifdef	__cplusplus
extern "C" {
#endif

#include "mcc_generated_files/mcc.h"
    
    union _float_to_b {
    float f_value;
    uint8_t b_value[4];
};

    // These are the return codes for the primary functions for the node.
    typedef enum node_error_e {
        NODE_OK,
        NODE_BUSY,
        NODE_TIMEOUT_ERR
    } Error_t;
    
    // According to FSM, these are really states.
    typedef enum fsm_states_e {
        FSM_IDLE = 0,
        FSM_READY,
        FSM_DATA,
        FSM_NODEINTRO,
        FSM_RESET,
    } FSM_States_t;
    
    typedef enum fsm_events_e {
        FSM_DATAREQ = 1,
        FSM_DATAACK,
        FSM_NODEINTROREQ,
        FSM_NODEINTROACK,
        FSM_TIMEOUT,
    } FSM_Events_t;
    
    #define OPERATION_GROUP 0x10
    #define METADATA_GROUP  0x40


    /*!
     * \brief Returns the binary i.e. 4 byte uint8_t array representing a 
     *        float value.
     */
    void sensor_core_convert_float_to_binary(float f_value, uint8_t *b_value);
    
    void sensor_core_convert_binary_to_float(uint8_t *b_value, float *f_value);



#ifdef	__cplusplus
}
#endif

#endif	/* SENSOR_CORE_H */

