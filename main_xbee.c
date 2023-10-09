#define F_CPU 1000000UL

#include "mcc_generated_files/mcc.h"
#include <util/delay.h>
#include<string.h>
#include "libavrxbee/xbee.h"

#define GREEN_ADDR 0x0013A200415D58CB
#define RED_ADDR   0x0013A20041AE49D4

int main(void) {
    // Initialise drivers from MCC
    SYSTEM_Initialize();
    
    printf("main: One \n");
    struct xbee_tx_request r;

    r.addr = RED_ADDR;
    r.data = (unsigned char*)strdup("coming from the atmega 1608!");
    r.len = strlen("coming from the atmega 1608!");

    struct xbee_frame *f;

    f = xbee_create_tx_request_frame(0x01, &r);
    free(r.data);
    
    printf("main: Two \n");

    unsigned int size;
    unsigned char *bytes;
    bytes = xbee_frame_to_bytes(f, &size);
    free(f);

    // usart_tx_blob(bytes, size);
    for(int idx=0; idx<size; idx++){
        USART0_Write(bytes[idx]);
        printf("%02X ", bytes[idx]);
    }
    
    printf("\n");
    free(bytes);
    printf("main: Three \n");

    while (1) {
        _delay_ms(1000);
    }
}

