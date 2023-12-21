create_clock -period 2.5 clk_wr
set_input_delay 0 -clock clk_wr [get_ports {*}]
set_output_delay 0 -clock clk_wr [get_ports {*}]

