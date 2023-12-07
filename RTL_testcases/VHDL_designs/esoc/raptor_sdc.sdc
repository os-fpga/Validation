create_clock -period 2.5 esoc_clk
set_input_delay 0.1 -clock esoc_clk [get_ports {*}]
set_output_delay 0.1 -clock esoc_clk [get_ports {*}]