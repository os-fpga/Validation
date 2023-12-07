create_clock -period 2.5 I_clk
set_input_delay 0 -clock I_clk [get_ports {*}]
set_output_delay 0 -clock I_clk [get_ports {*}]

