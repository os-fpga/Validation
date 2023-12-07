create_clock -period 4.000 [get_ports iClkReg]
create_clock -period 4.000 -name iClkProcess -waveform {0.000 2.000} [get_ports iClkProcess]

# create_generated_clock -name sCmdStart_syncReg_p -source [get_ports iClkReg] -divide_by 2 [get_pins sCmdStart_syncReg_p_reg/Q]
