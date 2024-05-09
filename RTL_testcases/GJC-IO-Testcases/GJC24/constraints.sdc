set_top_module GJC24

create_clock -period 10 -name clk_i

set_input_delay 3 -clock clk_i [get_ports {data_i}]
set_input_delay 2 -clock clk_i [get_ports {reset_n}]
set_input_delay 2 -clock clk_i [get_ports {enable}]
set_output_delay 3 -clock clk_i [get_ports {data_o}]

