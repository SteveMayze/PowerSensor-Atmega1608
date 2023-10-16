#define F_CPU 1000000UL

#include "mcc_generated_files/mcc.h"
#include <util/delay.h>
#include "node.h"

int main(void)
{
    SYSTEM_Initialize();
    _delay_ms(1000);
    printf("Node Initialisation \n");
    
    node_intitialise();
    
    while(1){
        printf("Waking - Node check \n");
        node_check();
        _delay_ms(10000);
    }
}
