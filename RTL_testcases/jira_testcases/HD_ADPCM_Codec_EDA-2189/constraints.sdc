create_clock -period 14 CLOCK_IN

#create_generated_clock -source [get_ports CLOCK_IN] -divide_by 2 [get_pins I2S_ACTIVE_IN_reg/Q]
#create_generated_clock -source [get_ports CLOCK_IN] -divide_by 2 [get_pins u3/I2S_Clock_reg/Q]
#create_generated_clock -source [get_pins u3/I2S_Clock_reg/Q] -divide_by 2 [get_pins u3/I2S_PCM_DATA_ACCESS_OUT_reg/Q]
#create_generated_clock -source [get_ports CLOCK_IN] -divide_by 2 [get_pins u4/Flash_Memory_Clock_reg/Q]