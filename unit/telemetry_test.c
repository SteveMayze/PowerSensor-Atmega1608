
#include "telemetry_test.h"
#include "unity.h"

int run_telemetry_tests(){
    UnityBegin("telemetry_test");
    
    RUN_TEST(xbee_test_build_frame);

    
    UnityEnd();
    return 0;   
}

