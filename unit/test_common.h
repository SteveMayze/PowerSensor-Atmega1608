/* 
 * File:   test_common.h
 * Author: steve
 *
 * Created on July 28, 2023, 8:24 PM
 */

#ifndef TEST_COMMON_H
#define	TEST_COMMON_H

#ifdef	__cplusplus
extern "C" {
#endif
    
#include "../mcc_generated_files/mcc.h"
#include "../modem.h"
#include "../ina219/INA219.h"    
    
uint8_t *get_test_sid();
void set_datareq_response_flag(bool _flag);
void set_dataack_response_flag(bool _flag);
void set_nodeintroreq_response_flag(bool _flag);
void set_nodeintroack_response_flag(bool _flag);
void set_timeout_response_flag(bool _flag);

bool get_datareq_response_flag();
bool get_dataack_response_flag();
bool get_nodeintroreq_response_flag();
bool get_nodeintroack_response_flag();
bool get_timeout_response_flag();

ModemResponse_t *get_dataReq_response();

ModemResponse_t *get_dataack_response();

ModemResponse_t *get_nodeintroreq_response();

ModemResponse_t *get_nodeintroack_response();

void test_handle_datareq_response();

void test_handle_dataack_response();

void test_handle_nodeintroreq_response();

void test_handle_nodeintroack_response();

void test_handle_timeout();

INA219_Data_t *get_ina219_data();


#ifdef	__cplusplus
}
#endif

#endif	/* TEST_COMMON_H */

