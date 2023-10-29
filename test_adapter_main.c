
#include "build-config.h"

#include "mocks/Mocktwi0_master.h"

#include "mcc_generated_files/mcc.h"
#include <util/delay.h>
#include "unit/ina219_test.h"
#include "unit/modem_send_test.h"
#include "unit/modem_receive_test.h"
#include "mocks/Mockusart0.h"

uint8_t actual[46] = {0};
uint8_t actual_idx = 0;
uint8_t expected[46] = {0};
uint8_t payload[48] = {0};

Node_Message_t *modem_test_message;


int main(void) {
    
    // Initialize drivers from MCC
    // Need to specify the initialisation mock during the SYSTEM_Initialize.
    I2C0_Initialize_ExpectAndReturn(0);
    USART0_Initialize_Expect();

    SYSTEM_Initialize();

    LOG_INFO("========== Test starting - INA219 Tests ==========\n\n");

    run_ina219_tests();
    
    LOG_INFO("========== Test starting - MODEM send Tests ===========\n\n");    
    
    run_modem_send_tests();
  
    LOG_INFO("========== Test starting - MODEM receive Tests ===========\n\n");    

    run_modem_receive_tests();

    LOG_INFO("================= Test Completed =================\n\n");

}

void setUp(void) {

}

void tearDown(void) {
}



