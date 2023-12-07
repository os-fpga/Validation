create_clock -period 2.5 ap_clk
set_input_delay 0 -clock ap_clk [get_ports {*}]
set_output_delay 0 -clock ap_clk [get_ports {*}]

