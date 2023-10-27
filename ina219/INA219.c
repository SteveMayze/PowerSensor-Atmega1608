
#include "../mcc_generated_files/mcc.h"
#include "../mcc_generated_files/include/twi0_master.h"
#include "INA219.h"
#include "util/delay.h"

// #define LOGGER_DEBUG
#define LOGGER_INFO

#include "../logger.h"

void INA219_set_read_callback(twi0_callback_t callback);
void INA219_set_restartwrite_callback(twi0_callback_t callback);

  uint8_t iic_address;
  uint16_t ina219_calibration;
  uint16_t ina219_configuration;

INA219_Data_t INA219_Data;
        


uint8_t write_buffer[3];
union read_buffer_t {
    float bitFloat;
    uint16_t bit16;
    uint8_t bit8[2];

};

union read_buffer_t read_buffer;

typedef uint16_t (*data_handler)(void);

static uint16_t get_raw_shunt_voltage();
static uint16_t get_raw_bus_voltage();
static uint16_t get_raw_current();
static uint16_t get_raw_power();

data_handler data_handlers[] = {
    get_raw_shunt_voltage,
    get_raw_bus_voltage,
    get_raw_current,
    get_raw_power
};



twi0_callback_t ina219_read_callback;
twi0_callback_t ina219_restart_write_callback; 

// Prototype for the state handlers.
static void INA219_DEFAULT_CONFIG(void);
static void INA219_20V_15A_CONFIG(void);
static void INA219_12V_3A_CONFIG(void);

typedef void (*profileSetupFunction)(void);

// An array to collect the state handlers
profileSetupFunction ina219_configurations[] = {
    INA219_DEFAULT_CONFIG,
    INA219_20V_15A_CONFIG,
    INA219_12V_3A_CONFIG,
};

void INA219_set_calibration(uint16_t calibaration){
    LOG_DEBUG("INA219_set_calibration: start calibration: %04X\n", calibaration);
    uint8_t data[3];
    data[0] = INA219_CAL; // Register
    data[1] = calibaration >> 8;   // MSB
    data[2] = 0xFF & calibaration; // LSB
    while(!I2C0_Open(iic_address));
    I2C0_SetBuffer(data, 3);
    I2C0_MasterWrite(); // Write
    I2C0_Close();    
    LOG_DEBUG("INA219_set_calibration: end\n");
}

/**
 * \brief The default read handler for a two bytes of data
 * \param ptr
 * \return 
 */
static twi0_operations_t default_read_handler(void *ptr)
{
    LOG_DEBUG("default_read_handler: Start\n");
    I2C0_SetBuffer(ptr, 2);
    I2C0_SetDataCompleteCallback(NULL, NULL);
    LOG_DEBUG("default_read_handler: End %d\n", I2C0_RESTART_READ);
    return I2C0_RESTART_READ;
}

/**
 * 
 */
void INA219_Initialise(uint8_t addr, INA219_Config_Profile_t profile) {
    LOG_DEBUG("INA219_Initialise: Start\n");

    INA219_set_read_callback(default_read_handler);
    INA219_set_restartwrite_callback(I2C0_SetRestartWriteCallback);
    
    iic_address = addr;
    
    ina219_configurations[profile]();

    INA219_set_calibration(ina219_calibration);

    uint8_t data[3];
    data[0] = INA219_CFG;                   // Configuration register
    data[1] = ina219_configuration >> 8;      // MSB
    data[2] = 0xFF & ina219_configuration;    // LSB
    while(!I2C0_Open(iic_address));
    I2C0_SetBuffer(data, 3);
    I2C0_MasterWrite(); // Write
    I2C0_Close();    
    LOG_DEBUG("INA219_Initialise: End\n");

}

/**
 * \brief Sets a callback for recording the register values, if needed.
 */
void INA219_set_read_callback(twi0_callback_t callback){
    LOG_DEBUG("INA219_set_read_callback: Setting the read call back\n");
    ina219_read_callback = callback;
}

void INA219_set_restartwrite_callback(twi0_callback_t callback){
    LOG_DEBUG("INA219_set_read_callback: Setting the restart write call back\n");
    ina219_restart_write_callback = callback;
}

uint16_t read_register_value(uint8_t reg, bool calibrate){
    LOG_DEBUG("read_register_value: start reg: %d, calibrate: %d \n", reg, (uint8_t)calibrate);
    if( calibrate ){
        INA219_set_calibration(ina219_calibration);
        _delay_ms(500);
    }
    
    while(!I2C0_Open(iic_address)); // sit here until we get the bus..
    I2C0_SetDataCompleteCallback(ina219_read_callback, read_buffer.bit8);
    I2C0_SetBuffer(&reg, 1);
    
    I2C0_SetAddressNackCallback(ina219_restart_write_callback, NULL); //NACK polling?
    I2C0_MasterWrite();
    while(I2C0_BUSY == I2C0_Close()); // sit here until finished.

    uint16_t result = ((uint16_t) read_buffer.bit8[0]<<8)|read_buffer.bit8[1];
    LOG_DEBUG("get_register_value: end result: %04X\n", result );

    return result;

}


INA219_Data_t* INA219_get_all_readings() {
    LOG_DEBUG("INA219_get_all_readings: start\n");

    INA219_Data.bus_voltage = 0.0;
    INA219_Data.shunt_voltage = 0.0;
    INA219_Data.current = 0.0;
    INA219_Data.power = 0.0;

    LOG_DEBUG("INA219_get_all_readings: get INA219_BUS_VOLTAGE\n");
    INA219_Data.raw_bus_voltage = read_register_value(INA219_BUS_VOLTAGE, false);
    INA219_Data.bus_voltage = (float) ((float)(INA219_Data.raw_bus_voltage >> 3) * 0.004);
    
    LOG_DEBUG("INA219_get_all_readings: get INA219_SHUNT_VOLTAGE\n");
    INA219_Data.raw_shunt_voltage = read_register_value(INA219_SHUNT_VOLTAGE, false);
    INA219_Data.shunt_voltage = ((float)INA219_Data.raw_shunt_voltage * 0.000010);

    LOG_DEBUG("INA219_get_all_readings: get INA219_CURRENT\n");
    INA219_Data.raw_current = read_register_value(INA219_CURRENT, true);
    INA219_Data.current = ((float) INA219_Data.raw_current /1000);
    
    LOG_DEBUG("INA219_getReadings: get INA219_POWER\n");
    INA219_Data.raw_power = read_register_value(INA219_POWER, true);
    INA219_Data.power = ((float) INA219_Data.raw_power * 0.02);
    LOG_DEBUG("INA219_getReadings: end\n");

    return &INA219_Data;

}

static uint16_t get_raw_shunt_voltage(){
    return read_register_value(INA219_BUS_VOLTAGE, false);
}

static uint16_t get_raw_bus_voltage(){
    return read_register_value(INA219_SHUNT_VOLTAGE, false);
}

static uint16_t get_raw_current(){
    return read_register_value(INA219_CURRENT, true);
}

static uint16_t get_raw_power(){
    return read_register_value(INA219_POWER, true);
}


uint16_t INA219_get_raw_reading(INA219_Readings reading) {
    LOG_DEBUG("INA219_getReading: reading: %d\n", reading);
    return data_handlers[reading]();
}


/**
 * \brief Sets the INA219 default values for the configuration and the 
 *        calibration.
 * 
 * 
 */
static void INA219_DEFAULT_CONFIG(void){
    LOG_DEBUG("INA219_DEFAULT_CONFIG: Start\n");
    ina219_configuration = 0x00;
    ina219_configuration = INA219_BRNG_32V | INA219_PGA_8 | INA219_BADC_12_BIT | 
                           INA219_SADC_12_BIT | INA219_MODE_CNT_SHB;
    ina219_calibration = 0x399F;
    LOG_DEBUG("INA219_DEFAULT_CONFIG: End configuration: %02x, calibration: %02x\n", ina219_configuration, ina219_calibration);
}

/*
 * \brief Sets the INA219 configuration and calibration values for a large profile 
 * 
 
    System Voltage [20]: 
    Load [15]: 
    Full scale value [0.32]: 
    system voltage: 20, load: 15, full scale voltage: 0.32

    ======================================

    r_shunt: 0.022?, max current: 15A, power: 4.8W
    min current_lsb: 458�A, max current_lsb: 3663�A
    current_lsb: 500.0�A
    Calibration: 37236 ? 0x9174

    ======================================
 
 * 
 */
static void INA219_20V_15A_CONFIG(void){
    LOG_DEBUG("INA219_20V_15A_CONFIG: Start\n");
    ina219_configuration = 0x00;
    ina219_configuration = INA219_BRNG_32V | INA219_PGA_8 | INA219_BADC_12_BIT | 
                           INA219_SADC_12_BIT | INA219_MODE_CNT_SHB;
    ina219_calibration = 0x9174;
    LOG_DEBUG("INA219_20V_15A_CONFIG: End configuration: %02x, calibration: %02x\n", ina219_configuration, ina219_calibration);
}


/*
 * \brief Sets the INA219 configuration and calibration values for a small profile 
 * 
 
    System Voltage [20]: 12
    Load [15]: 3
    Full scale value [0.32]: 
    system voltage: 12, load: 3, full scale voltage: 0.32

    ======================================

    r_shunt: 0.107?, max current: 3A, power: 0.96W
    min current_lsb: 92�A, max current_lsb: 733�A
    current_lsb: 100.0�A
    Calibration: 38280 ? 0x9588

    ======================================
 */
static void INA219_12V_3A_CONFIG(void){
    LOG_DEBUG("INA219_12V_3A_CONFIG: Start\n");
    ina219_configuration = 0x00;
    ina219_configuration = INA219_PGA_8 | INA219_BADC_12_BIT | 
                           INA219_SADC_12_BIT | INA219_MODE_CNT_SHB;
    ina219_calibration = 0x0EF4;
    LOG_DEBUG("INA219_12V_3A_CONFIG: End configuration: %02x, calibration: %02x\n", ina219_configuration, ina219_calibration);
}



