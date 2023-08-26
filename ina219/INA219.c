
#include "../mcc_generated_files/mcc.h"
#include "../mcc_generated_files/include/twi0_master.h"
#include "INA219.h"
#include "util/delay.h"

  uint8_t iic_address;
  uint16_t ina219_calibration;
  uint16_t ina219_configuration;

INA219_Data_t INA219_Data;
        
uint8_t write_buffer[3];
union read_buffer_t {
    uint16_t bit16;
    uint8_t bit8[2];

};

union read_buffer_t read_buffer;

/*
    r_shunt: 0.022?, max current: 14.545454545454547A, power: 4.8W
    min current_lsb: 0.000457763671875, max current_lsb: 0.003662109375
    current_lsb: 0.0005
    Calibration: 37236
*/

typedef void(profileSetupFunction)(void);


// Prototype for the state handlers.
static void INA219_DEFAULT_CONFIG(void);
static void INA219_20V_15A_CONFIG(void);
static void INA219_12V_3A_CONFIG(void);

// An array to collect the state handlers
profileSetupFunction *ina219_configurations[] = {
    INA219_DEFAULT_CONFIG,
    INA219_20V_15A_CONFIG,
    INA219_12V_3A_CONFIG,
};

// LEGACY
//#define INA219_DEFAULT_CFG 0x199F
//#define INA219_DEFAULT_CFG_0 0x19
//#define INA219_DEFAULT_CFG_1 0x9F


void INA219_set_calibration(uint16_t calibaration){
    uint8_t data[3];
    data[0] = INA219_CAL; // Register
    data[1] = calibaration >> 8;   // MSB
    data[2] = 0xFF & calibaration; // LSB
    I2C0_Open(iic_address);
    I2C0_SetBuffer(data, 2);
    I2C0_MasterOperation(false); // Write
    I2C0_Close();    
}

/**
 * 
 */
void INA219_Initialise(uint8_t addr, INA219_Config_Profile_t profile) {
    
    iic_address = addr;
    
    ina219_configurations[profile]();

    INA219_set_calibration(ina219_calibration);

    uint8_t data[3];
    data[0] = INA219_CFG;                   // Configuration register
    data[1] = ina219_configuration >> 8;      // MSB
    data[2] = 0xFF & ina219_configuration;    // LSB
    I2C0_Open(iic_address);
    I2C0_SetBuffer(data, 2);
    I2C0_MasterOperation(false); // Write
    I2C0_Close();    

}


uint16_t get_regsiter_value(uint8_t reg, bool calibrate){
    if( calibrate )
        INA219_set_calibration(ina219_calibration);
    write_buffer[0] = reg;
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
    }
    INA219_Data.bus_voltage = (int16_t) ((INA219_Data.raw_bus_voltage >> 3) * 4);
    INA219_Data.bus_voltage = INA219_Data.bus_voltage * 0.001;

    INA219_Data.raw_shunt_voltage = get_regsiter_value(INA219_SHUNT_VOLTAGE, false);
    INA219_Data.shunt_voltage = INA219_Data.raw_shunt_voltage * 0.01;


    INA219_Data.raw_current = get_regsiter_value(INA219_CURRENT, true);
    INA219_Data.current = ((float) INA219_Data.raw_current / 10.0);

    INA219_Data.raw_power = get_regsiter_value(INA219_POWER, true);
    INA219_Data.power = ((float) INA219_Data.raw_power * 2.0);

    return &INA219_Data;

}

/**
 * \brief Sets the INA219 default values for the configuration and the 
 *        calibration.
 * 
 * 
 */
static void INA219_DEFAULT_CONFIG(void){
    printf("INA219_DEFAULT_CONFIG: Start\n");
    ina219_configuration = 0x00;
    ina219_configuration = INA219_BRNG_32V | INA219_PGA_8 | INA219_BADC_12_BIT | 
                           INA219_SADC_12_BIT | INA219_MODE_CNT_SHB;
    ina219_calibration = 0x399F;
    printf("INA219_DEFAULT_CONFIG: End\n");
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
    printf("INA219_20V_15A_CONFIG: Start\n");
    ina219_configuration = 0x00;
    ina219_configuration = INA219_BRNG_32V | INA219_PGA_8 | INA219_BADC_12_BIT | 
                           INA219_SADC_12_BIT | INA219_MODE_CNT_SHB;
    ina219_calibration = 0x9174;
    printf("INA219_20V_15A_CONFIG: End\n");
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
    printf("INA219_12V_3A_CONFIG: Start\n");
    ina219_configuration = 0x00;
    ina219_configuration = INA219_PGA_8 | INA219_BADC_12_BIT | 
                           INA219_SADC_12_BIT | INA219_MODE_CNT_SHB;
    ina219_calibration = 0x9588;
    printf("INA219_12V_3A_CONFIG: End\n");
}



