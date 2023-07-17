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

    typedef enum node_error_e {
        NODE_OK,
        NODE_BUSY,
        NODE_TIMEOUT_ERR
    } Error_t;
    
    typedef enum operation_e {
        IDLE = 0,
        READY,
        DATAREQ,
        DATA,
        DATAACK,
        NODEINTROREQ,
        NODEINTRO,
        NODEINTROACK,
        RESET,
        TIMEOUT
    } Operation_t;
    
    #define OPERATION_GROUP 0x10
    #define METADATA_GROUP  0x40

    typedef enum token_e {
        // OPERATIONS
        NODE_OPERATION_READY = OPERATION_GROUP | READY,
                
        // METADATA
        NODE_METADATA_POWER =  METADATA_GROUP | 0x03
                
    } Token_t;


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

