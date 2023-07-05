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

    void modem_initialise(uint64_t coordinator);
    
    uint64_t modem_get_coord_addr();

#endif	/* MODEM_H */

