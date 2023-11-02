#include "build-config.h"

#include "mcc_generated_files/mcc.h"
#include "eprom.h"
#include <string.h>
#include <avr/sfr_defs.h>
#include <avr/eeprom.h>

#include "logger.h"

uint8_t _sid[10];
bool sid_init = false;



/*!
 * \brief Returns the serial number from the micro-controller Signature Rows.
 * 
 */
uint8_t*  eprom_read_serial_id()
{
    if (!sid_init){
        memcpy(_sid, ( void *)&SIGROW.SERNUM0, 10);
        sid_init = true;
        LOG_BYTE_STREAM("Serial_ID: ", _sid, 10);
    }
    return _sid;
}

void eprom_write_addr(uint64_t *addr){
    eeprom_write_block (addr,  0, sizeof(uint64_t));
}

void eprom_read_addr(uint64_t *addr){
    eeprom_read_block (addr,  0, sizeof(uint64_t));
}