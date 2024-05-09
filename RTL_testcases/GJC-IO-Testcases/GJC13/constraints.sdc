set_top_module GJC13

create_clock -period 10 clk

set_input_delay 3 -clock clk [get_ports {data_i}]
set_input_delay 2 -clock clk [get_ports {enable}]
set_output_delay 3 -clock clk [get_ports {data_o}]

