
#include <stdlib.h>

#include "test_common.h"
#include "../node.h"
#include "../mocks/Mockmodem.h"
#include "../mocks/Mockeprom.h"
#include "../mocks/MockINA219.h"



uint8_t node_test_sid[10] = {0x02 , 0xC0 , 0x2B , 0xE2 , 0x09 , 0xC0 , 0x2D , 0xE2 , 0x07 , 0xC0};
bool datareq_response_flag = false;
bool dataack_response_flag = false;
bool nodeintroreq_response_flag = false;
bool nodeintroack_response_flag = false;
bool timeout_response_flag = false;

ModemResponse_t datareq_response;
ModemResponse_t dataack_response;

ModemResponse_t nodeintroreq_response;
ModemResponse_t nodeintroack_response;

INA219_Data_t ina219_data;

uint8_t *get_test_sid(){
    return node_test_sid;
}


void set_datareq_response_flag(bool _flag){
    datareq_response_flag = _flag;
}
void set_dataack_response_flag(bool _flag){
    dataack_response_flag = _flag;
}
void set_nodeintroreq_response_flag(bool _flag){
    nodeintroreq_response_flag = _flag;
}
void set_nodeintroack_response_flag(bool _flag){
    nodeintroack_response_flag = _flag;
}
void set_timeout_response_flag(bool _flag){
    timeout_response_flag = _flag;
}

bool get_datareq_response_flag(){
    return datareq_response_flag;
}
bool get_dataack_response_flag(){
    return dataack_response_flag;
}
bool get_nodeintroreq_response_flag(){
    return nodeintroreq_response_flag;
}
bool get_nodeintroack_response_flag(){
    return nodeintroack_response_flag;
}
bool get_timeout_response_flag(){
    return timeout_response_flag;
}

INA219_Data_t *get_ina219_data(){
    return &ina219_data;
}

ModemResponse_t *get_dataReq_response(){
    printf("get_dataReq_response: Response NODE_TOKEN_DATAREQ\n");
    node_create_message(NODE_TOKEN_DATA, get_test_sid());
    // node_data_collection();
    datareq_response.operation = NODE_TOKEN_DATAREQ;  
    return &datareq_response;
}

ModemResponse_t *get_dataack_response(){
    printf("get_dataack_response: response: NODE_TOKEN_DATAACK\n");
    dataack_response.operation = NODE_TOKEN_DATAACK;
    return &dataack_response;
}

ModemResponse_t *get_nodeintroreq_response(){
    printf("get_nodeintroreq_response: response: ... \n");
    return &nodeintroreq_response;
}

ModemResponse_t *get_nodeintroack_response(){
    printf("get_nodeintroack_response: response: ... \n");
    return &nodeintroack_response;
}

void test_handle_datareq_response(){
    printf("test_handle_datareq_response: Handle DATAREQ - Collect and send information \n");
    // Collect the data from the INA219
    node_create_message(NODE_TOKEN_DATA, get_test_sid());
    datareq_response_flag = true;
}

void test_handle_dataack_response(){
    printf("test_handle_dataack_response: Handle DATAACK - Success. Go back to sleep \n");
    dataack_response_flag = true;
}

void test_handle_nodeintroreq_response(){
    printf("test_handle_nodeintroreq_response: Handle NODEINTROREQ - Collect the details of the node and send \n");
    node_create_message(NODE_TOKEN_NODEINTRO, get_test_sid());
    nodeintroreq_response_flag = true;
}

void test_handle_nodeintroack_response(){
    printf("test_handle_nodeintroack_response: Handle NODEINTROACK - Success. Go back to sleep \n");
    nodeintroack_response_flag = true;
}

void test_handle_timeout(){
    printf("test_handle_timeout: Handle timeout \n");
    timeout_response_flag = true;
}

