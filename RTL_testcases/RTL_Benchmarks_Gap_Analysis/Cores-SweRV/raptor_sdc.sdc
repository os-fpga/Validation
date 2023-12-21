create_clock -period 2.5 clk
set_input_delay 0.1 -clock clk_wr [get_ports {*}]
set_output_delay 0.1 -clock clk_wr [get_ports {*}]
create_clock -period 2.5 jtag_tck
set_input_delay 0.1 -clock clk_wr [get_ports {*}]
set_output_delay 0.1 -clock clk_wr [get_ports {*}]
