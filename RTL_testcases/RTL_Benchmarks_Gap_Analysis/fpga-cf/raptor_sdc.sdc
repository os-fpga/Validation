create_clock -period 2.5 MGTCLK_N
set_input_delay 0.1 -clock MGTCLK_N [get_ports {*}]
set_output_delay 0.1 -clock MGTCLK_N [get_ports {*}]
create_clock -period 4 MGTCLK_P
set_input_delay 0.1 -clock MGTCLK_P [get_ports {*}]
set_output_delay 0.1 -clock MGTCLK_P [get_ports {*}]