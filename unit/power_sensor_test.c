#include "unity.h"
#include "power_sensor_test.h"
#include "../power_sensor.h"



void set_i2c_address_test(){
    TEST_FAIL_MESSAGE("The test is not implemented.");
}

int run_power_sensor_tests(){
    UnityBegin("sensor_core_test");
    
    RUN_TEST(set_i2c_address_test);

    UnityEnd();
    return 0;   
 
}


