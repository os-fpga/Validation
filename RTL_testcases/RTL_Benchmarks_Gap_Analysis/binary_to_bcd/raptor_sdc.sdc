create_clock -period 2.5 clk_0
set_input_delay 0 -clock clk_0 [get_ports {*}]
set_output_delay 0 -clock clk_0 [get_ports {*}]
