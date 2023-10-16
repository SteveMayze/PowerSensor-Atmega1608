#define F_CPU 10000000

#include "mcc_generated_files/mcc.h"
#include <util/delay.h>
#include "node.h"
#include "eprom.h"

int main(void)
{
    SYSTEM_Initialize();
    _delay_ms(1000);
    printf("\n\n\n\f Node Initialisation \n");
    
    node_intitialise();
    
    _delay_ms(3000);
    
    printf("\n Starting the control loop \n");
    while(1){
        printf("\f Waking - Node check \n");
        node_create_message(NODE_TOKEN_READY, eprom_read_serial_id());
        node_check();
        printf("sleeping... \n");
        _delay_ms(10000);
    }
}
