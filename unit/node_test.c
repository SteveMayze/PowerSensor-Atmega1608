#include "node_test.h"
#include "unity.h"

#define UNIT_TEST
#include "../node.h"
#include <stdlib.h>
#include "../mocks/Mockmodem.h"
#include "../mocks/Mockeprom.h"
#include "../mocks/MockINA219.h"
#include "test_common.h"

#define LOGGING_DEBUG
#define LOGGING_INFO

#include  "../logger.h"

uint8_t message_stream[128] = { 0 }; 


/**
 * Tests the interaction with the INA210 domain module.
 */
void ready_data_collection_test(){
    set_timeout_response_flag(false);
    eprom_read_serial_id_ExpectAndReturn(get_test_sid());
    INA219_Initialise_Expect(0x40, NODE_INA219_PROFILE);

    node_intitialise();

    printf("\nready_data_collection_test: READY DATAREQ - Data Collection Data Send and then DATAREQ\n");
    
    INA219_Data_t* ina219Data_ptr = get_ina219_data();
    INA219_get_all_readings_ExpectAndReturn(ina219Data_ptr);
    ina219Data_ptr->bus_voltage = 10.5;
    ina219Data_ptr->shunt_voltage = 1.0;
    ina219Data_ptr->current = 2.5;
    
    ModemResponse_t* datareq_response_ptr = get_dataReq_response();    
    ModemResponse_t* dataack_response_ptr = get_dataack_response();
    
    modem_open_Expect(XBEE_ADDR_BROADCAST);
    modem_close_Expect();
    modem_message_arrived_ExpectAndReturn(true);
    modem_receive_message_ExpectAndReturn(datareq_response_ptr);

    modem_message_arrived_ExpectAndReturn(true);
    modem_receive_message_ExpectAndReturn(dataack_response_ptr);

    Node_Message_t *actual = node_create_message(NODE_TOKEN_DATA, get_test_sid());
    
    TEST_ASSERT_GREATER_THAN(0, sizeof(actual) );
    TEST_ASSERT_EQUAL_HEX8_ARRAY(get_test_sid(), actual->sid, 10);  
    TEST_ASSERT_EQUAL(NODE_TOKEN_DATA, actual->operation);
    
    printf("\nready_data_collection_test: Testing the send operation for DATAREQ\n");
    node_set_timeout(0x000F);
    // This time, set up the real call-backs to go through the motions.
    fsm_set_event_callback(FSM_DATAREQ, node_data_collection);
    fsm_set_event_callback(FSM_DATAACK, node_data_received);
    
    fsm_set_event_callback(FSM_TIMEOUT, test_handle_timeout);

    uint8_t expected_message_stream[128] = {NODE_TOKEN_HEADER_OPERATION, NODE_TOKEN_DATA,
                                            NODE_TOKEN_HEADER_SERIAL_ID, 0x02 , 0xC0 , 0x2B , 0xE2 , 0x09 , 0xC0 , 0x2D , 0xE2 , 0x07 , 0xC0, 
                                            NODE_TOKEN_PROPERTY_BUS_VOLTAGE, 0,0,0,0,
                                            NODE_TOKEN_PROPERTY_SHUNT_VOLTAGE, 0,0,0,0,
                                            NODE_TOKEN_PROPERTY_LOAD_CURRENT, 0,0,0,0};
    float values[3] = {10.5, 1.0, 2.5};
    uint8_t buffer[4] = {0,0,0,0};
    sensor_core_convert_float_to_binary(&values[0], buffer);
    for(uint8_t i = 0; i<4; i++){
        expected_message_stream[14+i] = buffer[i];
    }
    sensor_core_convert_float_to_binary(&values[1], buffer);
    for(uint8_t i = 0; i<4; i++){
        expected_message_stream[19+i] = buffer[i];
    }
    sensor_core_convert_float_to_binary(&values[2], buffer);
    for(uint8_t i = 0; i<4; i++){
        expected_message_stream[24+i] = buffer[i];
    }
    Node_Message_t *expected_message = node_create_message(NODE_TOKEN_DATA, get_test_sid());
    expected_message->data_length = 3;
    expected_message->data_token[0]=NODE_TOKEN_PROPERTY_BUS_VOLTAGE;
    expected_message->data_value[0]=10.5;
    expected_message->data_token[1]=NODE_TOKEN_PROPERTY_SHUNT_VOLTAGE;
    expected_message->data_value[1]=1.0;
    expected_message->data_token[2]=NODE_TOKEN_PROPERTY_LOAD_CURRENT;
    expected_message->data_value[2]=2.5;
    
    uint8_t message_length = node_message_to_stream(expected_message, message_stream);
    
    LOG_BYTE_STREAM("expected_message_stream: ", expected_message_stream, message_length);
    LOG_BYTE_STREAM("         message_stream: ", message_stream, message_length);
    
    uint8_t expected_message_length = 28;
    TEST_ASSERT_EQUAL(expected_message_length, message_length);
    TEST_ASSERT_EQUAL_INT8_ARRAY(expected_message_stream, message_stream, expected_message_length);
    
    modem_send_message_Ignore();
    
    node_check();

    TEST_ASSERT_EQUAL(false, get_timeout_response_flag());
    
    // The MockINA219 should be checked to ensure that the data was read.
    // The Mock-modem should be checked to ensure the correct message was sent.
    
    TEST_ASSERT_EQUAL(10.5, ina219Data_ptr->bus_voltage);
    
    TEST_ASSERT_EQUAL(NODE_TOKEN_PROPERTY_BUS_VOLTAGE, actual->data_token[0]);
    TEST_ASSERT_EQUAL(10.5, actual->data_value[0]);
    
    TEST_ASSERT_EQUAL(NODE_TOKEN_PROPERTY_SHUNT_VOLTAGE, actual->data_token[1]);
    TEST_ASSERT_EQUAL(1.0, actual->data_value[1]);
    
    TEST_ASSERT_EQUAL(NODE_TOKEN_PROPERTY_LOAD_CURRENT, actual->data_token[2]);
    TEST_ASSERT_EQUAL(2.5, actual->data_value[2]);
    
    
    TEST_ASSERT_EQUAL(NODE_OK, node_close());

}

void set_node_state(FSM_States_t state);

void ready_node_intro_test(){
    set_timeout_response_flag(false);
    eprom_read_serial_id_ExpectAndReturn(get_test_sid());
    INA219_Initialise_Expect(0x40, NODE_INA219_PROFILE);

    node_intitialise();
    set_node_state(FSM_NODEINTRO);
    printf("\nready_node_intro_test: Testing the send intro information for NODEINTROREQ\n");

    
    ModemResponse_t* nodeintroreq_response_ptr = get_nodeintroreq_response();    
    ModemResponse_t* nodeintroack_response_ptr = get_nodeintroack_response();
    
    modem_open_Expect(XBEE_ADDR_BROADCAST);
    modem_close_Expect();
    modem_message_arrived_ExpectAndReturn(true);
    modem_receive_message_ExpectAndReturn(nodeintroreq_response_ptr);

    modem_message_arrived_ExpectAndReturn(true);
    modem_receive_message_ExpectAndReturn(nodeintroack_response_ptr);

    Node_Message_t *actual = node_create_message(NODE_TOKEN_NODEINTRO, get_test_sid());
    
    TEST_ASSERT_GREATER_THAN(0, sizeof(actual) );
    TEST_ASSERT_EQUAL_HEX8_ARRAY(get_test_sid(), actual->sid, 10);  
    TEST_ASSERT_EQUAL(NODE_TOKEN_NODEINTRO, actual->operation);
    
   printf("\nready_node_intro_test: Testing the send operation for NODEINTRO \n");
   node_set_timeout(0x000F);
   fsm_set_event_callback(FSM_NODEINTROREQ, node_intro_callback);
   fsm_set_event_callback(FSM_NODEINTROACK, node_intro_ack_callback);
   fsm_set_event_callback(FSM_TIMEOUT, test_handle_timeout);
   
   uint8_t expected_message_stream[128] = {NODE_TOKEN_HEADER_OPERATION, NODE_TOKEN_NODEINTRO,
                                           NODE_TOKEN_HEADER_SERIAL_ID, 0x02 , 0xC0 , 0x2B , 0xE2 , 0x09 , 0xC0 , 0x2D , 0xE2 , 0x07 , 0xC0,
                                           NODE_TOKEN_HEADER_DOMAIN, NODE_METADATA_DOMAIN_POWER,
                                           NODE_TOKEN_HEADER_CLASS, NODE_METADATA_CLASS_SENSOR,
                                           NODE_TOKEN_PROPERTY, NODE_TOKEN_PROPERTY_BUS_VOLTAGE,
                                           NODE_TOKEN_PROPERTY, NODE_TOKEN_PROPERTY_SHUNT_VOLTAGE,
                                           NODE_TOKEN_PROPERTY, NODE_TOKEN_PROPERTY_LOAD_CURRENT,
                                        };
   
    Node_Message_t *expected_message = node_create_message(NODE_TOKEN_NODEINTRO, get_test_sid());
    expected_message->data_length = 5;
    expected_message->data_token[0]=NODE_TOKEN_HEADER_DOMAIN;
    expected_message->data_value[0]=NODE_METADATA_DOMAIN_POWER;
    expected_message->data_token[1]=NODE_TOKEN_HEADER_CLASS;
    expected_message->data_value[1]=NODE_METADATA_CLASS_SENSOR;
    expected_message->data_token[2]=NODE_TOKEN_PROPERTY;
    expected_message->data_value[2]=NODE_TOKEN_PROPERTY_BUS_VOLTAGE;
    expected_message->data_token[3]=NODE_TOKEN_PROPERTY;
    expected_message->data_value[3]=NODE_TOKEN_PROPERTY_SHUNT_VOLTAGE;
    expected_message->data_token[4]=NODE_TOKEN_PROPERTY;
    expected_message->data_value[4]=NODE_TOKEN_PROPERTY_LOAD_CURRENT;
    
    uint8_t message_length = node_message_to_stream(expected_message, message_stream);
    
    LOG_BYTE_STREAM("expected_message_stream: ", expected_message_stream, message_length);
    LOG_BYTE_STREAM("         message_stream: ", message_stream, message_length);
    
    uint8_t expected_message_length = 23;

    TEST_ASSERT_EQUAL(expected_message_length, message_length);
    TEST_ASSERT_EQUAL_INT8_ARRAY(expected_message_stream, message_stream, expected_message_length);
    
    modem_send_message_Ignore();
    

    node_check();
    
    TEST_ASSERT_EQUAL(false, get_timeout_response_flag());
    TEST_ASSERT_EQUAL(NODE_TOKEN_HEADER_DOMAIN, actual->data_token[0]);
    TEST_ASSERT_EQUAL(NODE_METADATA_DOMAIN_POWER, actual->data_value[0]);
    
    TEST_ASSERT_EQUAL(NODE_TOKEN_HEADER_CLASS, actual->data_token[1]);
    TEST_ASSERT_EQUAL(NODE_METADATA_CLASS_SENSOR, actual->data_value[1]);
    
    TEST_ASSERT_EQUAL(NODE_TOKEN_PROPERTY, actual->data_token[2]);
    TEST_ASSERT_EQUAL(NODE_TOKEN_PROPERTY_BUS_VOLTAGE, actual->data_value[2]);
    
    TEST_ASSERT_EQUAL(NODE_TOKEN_PROPERTY, actual->data_token[3]);
    TEST_ASSERT_EQUAL(NODE_TOKEN_PROPERTY_SHUNT_VOLTAGE, actual->data_value[3]);
    
    TEST_ASSERT_EQUAL(NODE_TOKEN_PROPERTY, actual->data_token[4]);
    TEST_ASSERT_EQUAL(NODE_TOKEN_PROPERTY_LOAD_CURRENT, actual->data_value[4]);
    
    
    TEST_ASSERT_EQUAL(NODE_OK, node_close());

}


/**
 * A node is a generic device. It will follow the pattern of
 * 
 *  wake
 *  start the modem
 *  send a READY
 *  wait for a response
 *  On timeout, record this and go back to sleep
 * 
 *  on expected response, take the next step.
 *  on false response, record this and go back to sleep.
 * 
 * 
 * @return 
 */
int run_node_tests(){
    UnityBegin("node_test");
        
    printf("\n\n=============== ready_data_collection_test ====================\n\n");

    RUN_TEST(ready_data_collection_test);

    printf("\n\n=============== ready_node_intro_test ====================\n\n");

    RUN_TEST(ready_node_intro_test);

    UnityEnd();
    return 0;   
 
}


