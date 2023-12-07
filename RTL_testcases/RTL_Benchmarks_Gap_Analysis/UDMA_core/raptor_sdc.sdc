create_clock -period 2.5 sys_clk_i
set_input_delay 0.1 -clock clk_wr [get_ports {*}]
set_output_delay 0.1 -clock clk_wr [get_ports {*}]
create_clock -period 4 per_clk_i
set_input_delay 0.1 -clock clk_wr [get_ports {*}]
set_output_delay 0.1 -clock clk_wr [get_ports {*}]