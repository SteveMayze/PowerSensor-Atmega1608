/* 
 * File:   eprom.h
 * Author: Steven
 *
 * Created on 07 July 2023, 13:38
 */

#ifndef EPROM_H
#define	EPROM_H

#ifdef	__cplusplus
extern "C" {
#endif

#include "mcc_generated_files/mcc.h"

   
/*!
 * \brief Returns the serial number from the micro-controller Signature Rows.
 * 
 */
uint8_t* eprom_read_serial_id();

void eprom_write_addr(uint64_t *addr);

void eprom_read_addr(uint64_t *addr);

#ifdef	__cplusplus
}
#endif

#endif	/* EPROM_H */

