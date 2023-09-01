/* 
 * File:   INA219.h
 * Author: Steven
 *
 * Created on September 10, 2022, 3:44 PM
 */

#ifndef INA219_H
#define	INA219_H

#ifdef	__cplusplus
extern "C" {
#endif

#include "../mcc_generated_files/mcc.h"

// Configuration register bits
#define INA219_RST 15
#define INA219_BRNG 13
#define INA219_PG1 12
#define INA219_PG0 11 
#define INA219_BADC4 10
#define INA219_BADC3 9
#define INA219_BADC2 8
#define INA219_BADC1 7
#define INA219_SADC4 6
#define INA219_SADC3 5
#define INA219_SADC2 4
#define INA219_SADC1 3 
#define INA219_MODE3 2
#define INA219_MODE2 1
#define INA219_MODE1 0

// Configuration Bus Voltage Range 16V
// #define INA219_BRNG_16V (1 << INA219_BRNG)
#define INA219_BRNG_32V (1 << INA219_BRNG)

// PGA Gain bit settings
#define INA219_PGA_1 (0 << INA219_PG0)
#define INA219_PGA_2 (1 << INA219_PG0)
#define INA219_PGA_4 (2 << INA219_PG0)
#define INA219_PGA_8 (3 << INA219_PG0)

// ADC Settings - Sample size
#define INA219_ADC_9_BIT 0x0000
#define INA219_ADC_10_BIT 0x0001
#define INA219_ADC_11_BIT 0x0010
#define INA219_ADC_12_BIT 0x0011
#define INA219_ADC_12b_BIT 0x1000
    
// ADC Settings number of samples    
#define INA219_ADC_2_SAMPLES 0x1001
#define INA219_ADC_4_SAMPLES 0x1010
#define INA219_ADC_8_SAMPLES 0x1011
#define INA219_ADC_16_SAMPLES 0x1100
#define INA219_ADC_32_SAMPLES 0x1101
#define INA219_ADC_64_SAMPLES 0x1110
#define INA219_ADC_128_SAMPLES 0x1111

// Bus ADC Resolution and averaging
#define INA219_BADC_9_BIT (INA219_ADC_9_BIT << INA219_BADC1)    
#define INA219_BADC_10_BIT (INA219_ADC_10_BIT << INA219_BADC1)    
#define INA219_BADC_11_BIT (INA219_ADC_11_BIT << INA219_BADC1)    
#define INA219_BADC_12_BIT (INA219_ADC_12_BIT << INA219_BADC1)  
    
#define INA219_BADC_2_SAMPLES (INA219_ADC_2_SAMPLES << INA219_BADC1)    
#define INA219_BADC_4_SAMPLES (INA219_ADC_4_SAMPLES << INA219_BADC1)    
#define INA219_BADC_8_SAMPLES (INA219_ADC_8_SAMPLES << INA219_BADC1)    
#define INA219_BADC_16_SAMPLES (INA219_ADC_16_SAMPLES << INA219_BADC1)  
#define INA219_BADC_32_SAMPLES (INA219_ADC_32_SAMPLES << INA219_BADC1)  
#define INA219_BADC_64_SAMPLES (INA219_ADC_64_SAMPLES << INA219_BADC1)  
#define INA219_BADC_128_SAMPLES (INA219_ADC_128_SAMPLES << INA219_BADC1)  
    
    
// Shunt Resolution and averaging
#define INA219_SADC_9_BIT (INA219_ADC_9_BIT << INA219_SADC1)    
#define INA219_SADC_10_BIT (INA219_ADC_10_BIT << INA219_SADC1)    
#define INA219_SADC_11_BIT (INA219_ADC_11_BIT << INA219_SADC1)    
#define INA219_SADC_12_BIT (INA219_ADC_12_BIT << INA219_SADC1)    

#define INA219_SADC_2_SAMPLES (INA219_ADC_2_SAMPLES << INA219_SADC1)    
#define INA219_SADC_4_SAMPLES (INA219_ADC_4_SAMPLES << INA219_SADC1)    
#define INA219_SADC_8_SAMPLES (INA219_ADC_8_SAMPLES << INA219_SADC1)    
#define INA219_SADC_16_SAMPLES (INA219_ADC_16_SAMPLES << INA219_SADC1)  
#define INA219_SADC_32_SAMPLES (INA219_ADC_32_SAMPLES << INA219_SADC1)  
#define INA219_SADC_64_SAMPLES (INA219_ADC_64_SAMPLES << INA219_SADC1)  
#define INA219_SADC_128_SAMPLES (INA219_ADC_128_SAMPLES << INA219_SADC1)  

// Mode Settings
#define INA219_MODE_PWR_DN (0 << INA219_MODE1)  // 000 - Power down.
#define INA219_MODE_TRG_SH (1 << INA219_MODE1)  // 001 - Shunt voltage, tirggered
#define INA219_MODE_TRG_B (2 << INA219_MODE1)   // 010 - Bus voltage, triggered.
#define INA219_MODE_TRG_SHB (3 << INA219_MODE1) // 011 - Shunt and bug, triggered.
#define INA219_MODE_ADC_OFF (4 << INA219_MODE1) // 100 - ADC off (disabled).
#define INA219_MODE_CNT_SH (5 << INA219_MODE1)  // 101 - Shunt voltage, continuous.
#define INA219_MODE_CNT_B (6 << INA219_MODE1)   // 110 - Bus voltage, continuous.
#define INA219_MODE_CNT_SHB (7 << INA219_MODE1) // 111 - Shunt and bus, continuous.
    
// INA219 Registers
    
#define INA219_CFG 0x00             // Configuraiton
#define INA219_SHUNT_VOLTAGE 0x01   // Shunt Voltage
#define INA219_BUS_VOLTAGE 0x02     // Bus Voltage
#define INA219_POWER 0x03           // Power
#define INA219_CURRENT 0x04         // Current
#define INA219_CAL 0x05             // Calibration

    
// I2C/TWI/SMB Device addresses
#define INA219_ADDR_GND_GND    0b01000000 // Default
#define INA219_ADDR_GND_VS     0b01000001
#define INA219_ADDR_GND_SDA    0b01000010
#define INA219_ADDR_GND_SCL    0b01000011
#define INA219_ADDR_VS_GND     0b01000100
#define INA219_ADDR_VS_VS      0b01000101
#define INA219_ADDR_VS_SDA     0b01000110
#define INA219_ADDR_VS_SCL     0b01000111
#define INA219_ADDR_SDA_GND    0b01001000
#define INA219_ADDR_SDA_VS     0b01001001
#define INA219_ADDR_SDA_SDA    0b01001010
#define INA219_ADDR_SDA_SCL    0b01001011
#define INA219_ADDR_SCL_GND    0b01001100
#define INA219_ADDR_SCL_VS     0b01001101
#define INA219_ADDR_SCL_SDA    0b01001110
#define INA219_ADDR_SCL_SCL    0b01001111
    
    
/**
 * \breif The eunum to describe the supported profiles for the module.
 * 
 * The configuration of the INA219 is given as a set of profiles that have
 * been previously caluclulated. For micro controller work, it does not seem
 * worthwhile the effort to build in the smarts to take arbitrary values and
 * calculate the configuration. 
 */    
typedef enum ina219_config_profile_e {
    INA219_CONFIG_PROFILE_DEFAULT = 0,
    INA219_CONFIG_PROFILE_20V_15A,
    INA219_CONFIG_PROFILE_12V_3A,
} INA219_Config_Profile_t;

typedef enum ina219_readings {
    INA219_READING_BUS_VOLTAGE,
    INA219_READING_SHUNT_VOLTAGE,
    INA219_READING_CURRENT,
    INA219_READING_POWER
} INA219_Readings;

    // Data structure for the reading results.
    typedef struct  {
        uint16_t raw_shunt_voltage;
        uint16_t raw_bus_voltage;
        uint16_t raw_current;
        uint16_t raw_power;
        
        float shunt_voltage;
        float bus_voltage;
        float power;
        float current;
    } INA219_Data_t;
    

    /**
     * \brief Initializes the INA219 module
     * 
     * \param[in] addr
     * \param[in] profile
     * \param[in] calibaration
     */
    void INA219_Initialise(uint8_t addr, INA219_Config_Profile_t profile);
    

    /**
     * \brief Returns a pointer to the readings object.
     * 
     * \return the readings in the pointer to the INA219_Data_t structure.
     */
    INA219_Data_t* INA219_getReadings();
    
    /**
     * \brief Obtain a single reading value.
     * 
     * \param reading
     * \return 
     */
    uint16_t INA219_getReading(INA219_Readings reading);
    
#ifdef	__cplusplus
}
#endif

#endif	/* INA219_H */

