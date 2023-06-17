#include "unity.h"
#include "power_sensor_test.h"
#include "../power_sensor.h"



void set_i2c_address_test(){
    
    power_sensor_set_i2c(0x01);
    
    
}

int run_power_sensor_tests(){
    UnityBegin("sensor_core_test.c");
    
    RUN_TEST(set_i2c_address_test);

    UnityEnd();
    return 0;   
 
}


