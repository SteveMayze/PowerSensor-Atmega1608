
 #define LOGGER_LEVEL 2

#include "build-config.h"
#include "mcc_generated_files/mcc.h"
#include <util/delay.h>
#include "node.h"
#include "eprom.h"

#include <avr/sleep.h>

volatile bool tick;

void PIT_cb(void)
{
    /* Clear flag by writing '1': */
    RTC.PITINTFLAGS = RTC_PI_bm;
    LOG_DEBUG("TICK \n");

    tick = true;
}

int main(void)
{
    SYSTEM_Initialize();
    _delay_ms(1000);
    LOG_INFO("main: Node Initialisation \n");
    RTC_SetPITIsrCallback( PIT_cb );
    
    node_intitialise();
    
    node_set_timeout(0x0006);
    // This time, set up the real call-backs to go through the motions.

    _delay_ms(5000);
    
    LOG_INFO("main: Starting the control loop \n");
    RTC_EnablePITInterrupt();
    while(1){
        
        /* Put the CPU in sleep */
        for(uint8_t i = 0; i < 2; i++){
            sleep_mode(); // 30 ~second sleep
        }
        
        if (tick){
            RTC_DisablePITInterrupt();
            tick = false;
            _delay_ms(5000);
        
            LOG_DEBUG("main: Waking - Node check \n");
            node_create_message(NODE_TOKEN_READY, eprom_read_serial_id());
            node_check();
            LOG_DEBUG("main: sleeping 60 seconds... \n");
            RTC_EnablePITInterrupt(); 
        }
    }
}
