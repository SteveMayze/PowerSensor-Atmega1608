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


    typedef struct response_message {
        
        uint8_t *data;
        uint8_t data_length;
        FSM_States_t operation;
    } ModemResponse_t;

    void modem_open(uint64_t coordinator);
    
    void modem_close(void);
    
    bool modem_message_arrived(void);
    
    uint64_t modem_get_coord_addr();
    
    ModemResponse_t* modem_receive_message(void);

#endif	/* MODEM_H */

