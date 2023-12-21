create_clock -period 8 clk_125MHz
set_input_delay 0.1 -clock clk_125MHz [get_ports {*}]
set_output_delay 0.1 -clock clk_125MHz [get_ports {*}]