
#include "node.h"
#include "sensor_core.h"
#include  "eprom.h"
#include <string.h>

uint8_t sid[10];


node_status_t node_intitialise(){
     uint8_t *sid_ = eprom_read_serial_id();
     if(sid_){
         memcpy(sid, sid_, sizeof(uint8_t)*10);
         free(sid_);
     } else
         return NODE_STATE_ERROR;
    
    return NODE_STATE_OK;
}

struct node_message *node_create_message() {
   
	struct node_message *message = malloc(sizeof(struct node_message));
    return message;
}
