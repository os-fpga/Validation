set_top_module GJC35

create_clock -period 5 -name clk_design

set_input_delay 2 -clock clk_design [get_ports {data_i}]
set_input_delay 2 -clock clk_design [get_ports {enable}]
set_output_delay 2 -clock clk_design [get_ports {data_o}]

