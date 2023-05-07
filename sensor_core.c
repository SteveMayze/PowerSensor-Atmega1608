#include "sensor_core.h"
#include <avr/pgmspace.h>

/*!
 * \brief Returns the serial number from the micro-controller Signature Rows.
 * 
 */
void sensor_core_read_serial_no(uint8_t *buf)
{
    uint16_t address = 0x1100; // Start address of the signature row
    for (uint8_t i = 0; i < 11; i++) {
        buf[i] = pgm_read_byte(address + i); // Read the signature row byte by byte
    }
}




