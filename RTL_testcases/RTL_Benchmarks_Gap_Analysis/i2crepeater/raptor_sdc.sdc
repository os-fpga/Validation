create_clock -period 2.5 system_clk
set_input_delay 0.1 -clock system_clk [get_ports {*}]
set_output_delay 0.1 -clock system_clk [get_ports {*}]

