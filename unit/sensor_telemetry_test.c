
#include "sensor_telemetry_test.h"
#include "unity.h"


void telemetry_test_build_frame() {
    TEST_FAIL_MESSAGE("The test is not implemented");
}

int run_telemetry_tests(){
    UnityBegin("sensor_telemetry_test");
    
    RUN_TEST(telemetry_test_build_frame);

    
    UnityEnd();
    return 0;   
}

