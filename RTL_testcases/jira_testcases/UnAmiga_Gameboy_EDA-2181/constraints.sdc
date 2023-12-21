create_clock -period 7.000 [get_ports CLOCK_50]

create_generated_clock -name clk -source [get_pins clk16_reg/Q] -divide_by 8 [get_pins clk8_reg/Q]
create_generated_clock -name clk16 -source [get_ports CLOCK_50] -divide_by 2 [get_pins clk16_reg/Q]
