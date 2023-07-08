#include "eprom.h"

uint8_t sid[10];
bool sid_init = false;

/*!
 * \brief Returns the serial number from the micro-controller Signature Rows.
 * 
 */
uint8_t*  eprom_read_serial_id()
{
    if (!sid_init){
        uint16_t address = 0x1100; // Start address of the signature row
        for (uint8_t i = 0; i < 10; i++) {
            sid[i] = pgm_read_byte(address + i); // Read the signature row byte by byte
        }
        sid_init = true;
    }
    return sid;
}

