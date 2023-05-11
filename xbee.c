
#include "xbee.h"
#include "sensor_core.h"

#define FLOAT_LENGTH sizeof(float)

uint8_t calc_checksum(xbee_frame_t *xbee_frame){
    uint8_t checksum = 0x00;
    checksum += xbee_frame->frame_type;
    checksum += xbee_frame->frame_id;
    printf("\nLONG: ");
    for(uint8_t i=0; i<8; i++){
        checksum += xbee_frame->dest_addr_long.bytes[7-i];
        printf("%02X ", xbee_frame->dest_addr_long.bytes[7-i]);
    }
    printf("\nSHORT: ");
    for(uint8_t i=0; i<2; i++){
        checksum += xbee_frame->dest_addr_short.bytes[1-i];
        printf("%02X ", xbee_frame->dest_addr_short.bytes[1-i]);
    }
    checksum += xbee_frame->broadcast_radius;
    checksum += xbee_frame->options;
    printf("\nDATA: ");
    for(uint8_t i=0; i<xbee_frame->rf_data_length; i++){
        checksum += xbee_frame->rf_data[i];
        printf("%02X ", xbee_frame->rf_data[i]);
    }
    printf("\n");
    checksum &= 0xFF;
    checksum = 0xFF - checksum;

    return checksum;
}

XBEE_STATE_T xbee_build_frame(xbee_frame_t *xbee_frame, XBEE_FRAME_TYPE_T frame_type, uint8_t frame_id, 
        uint64_t dest_addr_long, uint16_t dest_addr_short, 
        uint8_t rf_data_length, char *rf_data) {
    
    xbee_frame->start_delimiter = XBEE_START_DELIMITER;
    xbee_frame->data_length = rf_data_length + 14;
    xbee_frame->frame_type = frame_type;
    xbee_frame->frame_id = frame_id;
    xbee_frame->dest_addr_long.b64 = dest_addr_long;
    xbee_frame->dest_addr_short.b32 = dest_addr_short;
    xbee_frame->broadcast_radius = 0x00;
    xbee_frame->options = 0x00;
    xbee_frame->rf_data_length = rf_data_length;
    xbee_frame->rf_data = rf_data;
    xbee_frame->checksum = calc_checksum(xbee_frame);
        
    printf("frame: %02X %04X %02X %02X %02X %02X %s %02X\n", 
            xbee_frame->start_delimiter,
            xbee_frame->data_length,
            xbee_frame->frame_type,
            xbee_frame->frame_id,
            xbee_frame->broadcast_radius,
            xbee_frame->options,
            xbee_frame->rf_data,
            xbee_frame->checksum
            );
    return XBEE_STATE_SUCCESS;
}

XBEE_STATE_T xbee_build_node_frame(xbee_node_frame_t *xbee_node_frame, XBEE_TOKEN_T operation, uint8_t *serial_id, 
        XBEE_TOKEN_T class, XBEE_TOKEN_T domain, uint8_t payload_length, uint8_t *payload ){
    
    xbee_node_frame->operation = operation;
    xbee_node_frame->serial_id = serial_id;
    xbee_node_frame->payload = payload;
    if( operation == XBEE_TOKEN_NODEINTRO ){
        xbee_node_frame->domain = domain;
        xbee_node_frame->class = class;
        printf("node-frame: %02X %02X %02X \n", xbee_node_frame->operation, 
                xbee_node_frame->domain, xbee_node_frame->class);
    } else {
        printf("node-frame: %02X \n", xbee_node_frame->operation);
    }
    
    
    return XBEE_STATE_SUCCESS;
}


XBEE_STATE_T xbee_build_node_data_frame(xbee_node_frame_t *xbee_node_frame,  uint8_t *serial_id, uint8_t payload_length, uint8_t *payload ){
    
    xbee_node_frame->operation = XBEE_TOKEN_DATA;
    xbee_node_frame->serial_id = serial_id;
    xbee_node_frame->payload = payload;    
    
    return XBEE_STATE_SUCCESS;
}

XBEE_STATE_T xbee_build_node_intro_frame(xbee_node_frame_t *xbee_node_frame,  uint8_t *serial_id, 
        XBEE_TOKEN_T domain, XBEE_TOKEN_T class, uint8_t payload_length, uint8_t *payload ){
    
    xbee_node_frame->operation = XBEE_TOKEN_NODEINTRO;
    xbee_node_frame->serial_id = serial_id;
    xbee_node_frame->domain = domain;
    xbee_node_frame->class = class;
    xbee_node_frame->payload = payload;    
    
    return XBEE_STATE_SUCCESS;
}


uint8_t xbee_add_value_to_payload(uint8_t *payload, uint8_t idx, XBEE_TOKEN_T parameter, float f_value){
    uint8_t b_value[FLOAT_LENGTH];
    sensor_core_convert_float_to_binary(f_value, b_value);
    payload[idx++] = parameter;
    for (uint8_t i=0; i<FLOAT_LENGTH; i++) {
        payload[idx++] = b_value[i];
    }
    return idx;
}
    


