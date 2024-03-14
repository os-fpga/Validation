create_clock -period 2.5 clk_i
set_input_delay 0 -clock clk_i [get_ports {*}]
set_output_delay 0 -clock clk_i [get_ports {*}]
create_clock -period 2.5 bit_clk_pad_i
set_input_delay 0 -clock bit_clk_pad_i [get_ports {*}]
set_output_delay 0 -clock bit_clk_pad_i [get_ports {*}]

set_clock_uncertainty 0.698
