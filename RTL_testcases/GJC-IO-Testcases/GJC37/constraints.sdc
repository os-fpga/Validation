set_top_module GJC37

create_clock -period 10 -name clk_design

set_input_delay 2 -clock clk_design [get_ports {reset}]
set_input_delay 2 -clock clk_design [get_ports {enable_n}]
set_output_delay 2 -clock clk_design [get_ports {data_o}]

