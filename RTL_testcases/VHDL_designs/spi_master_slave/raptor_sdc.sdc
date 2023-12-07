create_clock -period 2.5 sclk_i
set_input_delay 0.1 -clock sclk_i [get_ports {*}]
set_output_delay 0.1 -clock sclk_i [get_ports {*}]
create_clock -period 2.5 pclk_i
set_input_delay 0.1 -clock pclk_i [get_ports {*}]
set_output_delay 0.1 -clock pclk_i [get_ports {*}]