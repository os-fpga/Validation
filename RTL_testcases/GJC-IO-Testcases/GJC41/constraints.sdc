set_top_module GJC41

create_clock -period 10 -name clk_design

set_input_delay 1 -clock clk_design [get_ports {reset}]
set_input_delay 1 -clock clk_design [get_ports {enable_n}]
set_output_delay 1.5 -clock clk_design [get_ports {data_i}]
set_output_delay 1.5 -clock clk_design [get_ports {data_o}]
set_output_delay 1 -clock clk_design [get_ports {bitslip_ctrl_n}]
set_output_delay 1 -clock clk_design [get_ports {ready}]

