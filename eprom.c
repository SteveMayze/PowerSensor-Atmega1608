#include "eprom.h"



/*!
 * \brief Returns the serial number from the micro-controller Signature Rows.
 * 
 */
void _eprom_read_serial_id(uint8_t buf[])
{
    uint16_t address = 0x1100; // Start address of the signature row
    for (uint8_t i = 0; i < 11; i++) {
        buf[i] = pgm_read_byte(address + i); // Read the signature row byte by byte
    }
}




uint8_t* eprom_read_serial_id() {
    uint8_t *serial = (unit_t *)malloc(sizeof(uint8_t)*10);
    if( serial ){
        uint16_t address = 0x1100; // Start address of the signature row
        for (uint8_t i = 0; i < 11; i++) {
            serial[i] = pgm_read_byte(address + i); // Read the signature row byte by byte
        }
    }
    return serial;
}