create_clock -period 2.5 wciS0_Clk
set_input_delay 0.1 -clock wciS0_Clk [get_ports {*}]
set_output_delay 0.1 -clock wciS0_Clk [get_ports {*}]