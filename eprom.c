
#include "mcc_generated_files/mcc.h"
#include "eprom.h"
// #include <avr/pgmspace.h>
#include <string.h>
#include <avr/sfr_defs.h>
#define LOGGER_INFO

#include "logger.h"

uint8_t _sid[10];
bool sid_init = false;



/*!
 * \brief Returns the serial number from the micro-controller Signature Rows.
 * 
 */
uint8_t*  eprom_read_serial_id()
{
    memcpy(_sid, ( void *)&SIGROW.SERNUM0, 10);
//    if (!sid_init){
//        uint16_t address = 0x1100; // Start address of the signature row
//        for (uint8_t i = 0; i < 10; i++) {
//            _sid[i] = pgm_read_byte(address + i); // Read the signature row byte by byte
//        }
//        sid_init = true;
//        LOG_BYTE_STREAM("Serial_ID: ", _sid, 10);
//    }
    return _sid;
}

