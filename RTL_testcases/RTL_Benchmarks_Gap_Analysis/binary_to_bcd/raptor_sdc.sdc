create_clock -period 2.5 -name clk_0
set_input_delay 0 -clock clk_0 [get_ports {*}]
set_output_delay 0 -clock clk_0 [get_ports {*}]
create_clock -period 2.5 -name clk_1
set_input_delay 0 -clock clk_1 [get_ports {*}]
set_output_delay 0 -clock clk_1 [get_ports {*}]
