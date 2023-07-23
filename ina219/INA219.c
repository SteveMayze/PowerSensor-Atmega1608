
#include "../mcc_generated_files/mcc.h"
#include "../mcc_generated_files/include/twi0_master.h"
#include "INA219.h"
#include "util/delay.h"

static volatile uint8_t iic_address;
INA219_Data_t INA219_Data;
        
uint8_t write_buffer[3];
union read_buffer_t {
    uint16_t bit16;
    uint8_t bit8[2];

};

union read_buffer_t read_buffer;

#define INA219_DEFAULT_CFG 0x199F
#define INA219_DEFAULT_CFG_0 0x19
#define INA219_DEFAULT_CFG_1 0x9F

#define CAL 0x1000
#define CAL_0 0x10
#define CAL_1 0x00


void INA219_set_calibration(){
    uint8_t data[3];
    data[0] = INA219_CAL;
    data[1] = CAL >> 8;
    data[2] = 0xFF & CAL;
    // TWI0_Write(iic_address, data, 2);    
    I2C0_Open(iic_address);
    I2C0_SetBuffer(data, 2);
    I2C0_MasterOperation(false); // Write
    I2C0_Close();    
}

void INA219_Initialise(uint8_t addr) {
    iic_address = addr;
    
    INA219_set_calibration();

    uint8_t data[3];
    data[0] = INA219_CFG;
    data[1] = INA219_DEFAULT_CFG >> 8;
    data[2] = 0xFF & INA219_DEFAULT_CFG;
    // TWI0_Write(iic_address, data, 2);
    I2C0_Open(iic_address);
    I2C0_SetBuffer(data, 2);
    I2C0_MasterOperation(false); // Write
    I2C0_Close();    

}


uint16_t get_regsiter_value(uint8_t reg, bool calibrate){
    if( calibrate )
        INA219_set_calibration();
    write_buffer[0] = reg;
    // TWI0_WriteRead(iic_address, write_buffer, 1, read_buffer.bit8, 2);
    I2C0_Open(iic_address);
    I2C0_SetBuffer(read_buffer.bit8, 2);
    I2C0_MasterOperation(true); // Write
    I2C0_Close();    
    
    uint16_t result = ((uint16_t) read_buffer.bit8[0]<<8)|read_buffer.bit8[1];
    return result;
}


INA219_Data_t* INA219_getReadings() {

    uint8_t timeout = 0;

    INA219_Data.bus_voltage = 0.0;
    INA219_Data.shunt_voltage = 0.0;
    INA219_Data.current = 0.0;
    INA219_Data.power = 0.0;
    bool reading_ok = false;
    while (!reading_ok) {
        INA219_Data.raw_bus_voltage = get_regsiter_value(INA219_BUS_VOLTAGE, false);
        reading_ok = INA219_Data.raw_bus_voltage & 0x02;
        _delay_ms(500);
        timeout++;
//        if(timeout > 10){
//            LED_BLUE_Toggle();
//            break;
//        }
    }
    INA219_Data.bus_voltage = (int16_t) ((readings.raw_bus_voltage >> 3) * 4);
    INA219_Data.bus_voltage = INA219_Data.bus_voltage * 0.001;

    INA219_Data.raw_shunt_voltage = get_regsiter_value(INA219_SHUNT_VOLTAGE, false);
    INA219_Data.shunt_voltage = INA219_Data.raw_shunt_voltage * 0.01;


    INA219_Data.raw_current = get_regsiter_value(INA219_CURRENT, true);
    INA219_Data.current = ((float) INA219_Data.raw_current / 10.0);

    INA219_Data.raw_power = get_regsiter_value(INA219_POWER, true);
    INA219_Data.power = ((float) INA219_Data.raw_power * 2.0);

    return &readings;

}

