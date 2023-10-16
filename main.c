#define F_CPU 1000000UL

#include "mcc_generated_files/mcc.h"
#include <util/delay.h>


int main(void)
{
    // Initialize drivers from MCC
    SYSTEM_Initialize();
    _delay_ms(1000);
    
    while(1){
        
//        idle();
//        // Send the data ready. The XBEE will report if it was sent OK.
//        // Then wait for the message from the HUB. This will be either
//        // a request to introduce the new node or to send the data.
//        // In each case there will be an immediate response from the XBee to 
//        // say it has been delivered.
//        // In all cases there can be a timeout if there are some problems.
//        // In that case the system should back off and try again later.
//        
//        // xbee_usart should be restricted to just the send and recieve of
//        // the frame data. There should be another XBee module to handle the
//        // generation of the frame etc. Therefore the tests will then make sense.
//        
//        if(send_data_ready()  == ACK){
//            if(wait_for_data_req() == SUCCESS){
//                
//            } else {
//            // An error, back down and try again later.
//        }
//            
//        } else {
//            // An error, back down and try again later.
//        }
    }
}

