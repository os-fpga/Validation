create_clock -period 1000 clk_1_mhz
set_input_delay 0.1 -clock clk_1_mhz [get_ports {*}]
set_output_delay 0.1 -clock clk_1_mhz [get_ports {*}]
create_clock -period 125 clk_8_mhz
set_input_delay 0.1 -clock clk_8_mhz [get_ports {*}]
set_output_delay 0.1 -clock clk_8_mhz [get_ports {*}]