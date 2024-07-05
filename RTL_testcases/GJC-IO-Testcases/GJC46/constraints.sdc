set_top_module GJC46

create_clock -period 10 clkGHz

set_input_delay 1 -clock clkGHz [get_ports {reset}]
set_input_delay 1 -clock clkGHz [get_ports {enable_n}]
set_output_delay 2 -clock clkGHz [get_ports {data_i}]
set_output_delay 2 -clock clkGHz [get_ports {data_o}]
set_output_delay 1 -clock clkGHz [get_ports {bitslip_ctrl_n}]
set_output_delay 1 -clock clkGHz [get_ports {ready}]

