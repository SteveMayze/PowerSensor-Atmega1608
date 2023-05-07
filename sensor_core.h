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
    
    /*!
     * \brief Returns the serial number from the micro-controller Signature Rows.
     * 
     */
    void sensor_core_read_serial_no(uint8_t *buf);



#ifdef	__cplusplus
}
#endif

#endif	/* SENSOR_CORE_H */

