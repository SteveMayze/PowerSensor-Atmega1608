#include "build-config.h"
#include "mcc_generated_files/mcc.h"
#include <util/delay.h>
#include "node.h"
#include "eprom.h"

#include "logger.h"


int main(void)
{
    SYSTEM_Initialize();
    _delay_ms(1000);
    LOG_INFO("\n\n\nmain: Node Initialisation \n");
    
    node_intitialise();
    
    node_set_timeout(0x0006);
    // This time, set up the real call-backs to go through the motions.

    _delay_ms(5000);
    
    LOG_INFO("\n main: Starting the control loop \n");
    while(1){
        LOG_DEBUG("\f main: Waking - Node check \n");
        node_create_message(NODE_TOKEN_READY, eprom_read_serial_id());
        node_check();
        LOG_DEBUG("main: sleeping 60 seconds... \n");
        _delay_ms(60000);
    }
}
