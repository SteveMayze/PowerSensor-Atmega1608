#include "sensor_core.h"
#include <avr/pgmspace.h>
#include <string.h>


void sensor_core_convert_float_to_binary(float f_value, uint8_t *b_value) {
    memcpy(b_value, &f_value, sizeof(f_value));
}


void sensor_core_convert_binary_to_float(uint8_t *b_value, float *f_value){
    memcpy(f_value, b_value, sizeof(float));
}
