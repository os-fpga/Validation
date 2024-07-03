set_top_module GJC12

create_clock -period 10 -name clk

set_input_delay 3 -clock clk [get_ports {in_P}]
set_input_delay 2 -clock clk [get_ports {in_N}]
set_output_delay 3 -clock clk [get_ports {out_P}]
set_output_delay 3 -clock clk [get_ports {out_N}]

