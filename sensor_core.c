#include "sensor_core.h"
#include <avr/pgmspace.h>
#include <string.h>


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


void sensor_core_convert_float_to_binary(float f_value, uint8_t *b_value) {
    memcpy(b_value, &f_value, sizeof(f_value));
}


void sensor_core_convert_binary_to_float(uint8_t *b_value, float *f_value){
    memcpy(f_value, b_value, sizeof(float));
}
