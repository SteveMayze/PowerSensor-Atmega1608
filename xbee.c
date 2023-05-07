
#include "xbee.h"


xbee_frame_t xbee_frame;

uint8_t calc_checksum(void);

XBEE_STATE_T xbee_build_frame(XBEE_FRAME_TYPE_T frame_type, uint8_t frame_id, 
        uint64_t dest_addr_long, uint16_t dest_addr_short, 
        uint8_t rf_data_length, char *rf_data) {
    
    xbee_frame.start_delimiter = XBEE_START_DELIMITER;
    xbee_frame.data_length = rf_data_length + 14;
    xbee_frame.frame_type = frame_type;
    xbee_frame.frame_id = frame_id;
    xbee_frame.dest_addr_long.b64 = dest_addr_long;
    xbee_frame.dest_addr_short.b32 = dest_addr_short;
    xbee_frame.broadcast_radius = 0x00;
    xbee_frame.options = 0x00;
    xbee_frame.rf_data_length = rf_data_length;
    xbee_frame.rf_data = rf_data;
    xbee_frame.checksum = calc_checksum();
        
    printf("frame: %02X %04X %02X %02X %02X %02X %s %02X\n", 
            xbee_frame.start_delimiter,
            xbee_frame.data_length,
            xbee_frame.frame_type,
            xbee_frame.frame_id,
            xbee_frame.broadcast_radius,
            xbee_frame.options,
            xbee_frame.rf_data,
            xbee_frame.checksum
            );
    
    
    return XBEE_STATE_SUCCESS;

}

uint8_t xbee_get_checksum(void){
    return xbee_frame.checksum;
}

xbee_frame_t * get_frame() {
    return &xbee_frame;
}

uint8_t calc_checksum(void){
    uint8_t checksum = 0x00;
    checksum += xbee_frame.frame_type;
    checksum += xbee_frame.frame_id;
    printf("\nLONG: ");
    for(uint8_t i=0; i<8; i++){
        checksum += xbee_frame.dest_addr_long.bytes[7-i];
        printf("%02X ", xbee_frame.dest_addr_long.bytes[7-i]);
    }
    printf("\nSHORT: ");
    for(uint8_t i=0; i<2; i++){
        checksum += xbee_frame.dest_addr_short.bytes[1-i];
        printf("%02X ", xbee_frame.dest_addr_short.bytes[1-i]);
    }
    checksum += xbee_frame.broadcast_radius;
    checksum += xbee_frame.options;
    printf("\nDATA: ");
    for(uint8_t i=0; i<xbee_frame.rf_data_length; i++){
        checksum += xbee_frame.rf_data[i];
        printf("%02X ", xbee_frame.rf_data[i]);
    }
    printf("\n");
    checksum &= 0xFF;
    checksum = 0xFF - checksum;

    return checksum;
}

