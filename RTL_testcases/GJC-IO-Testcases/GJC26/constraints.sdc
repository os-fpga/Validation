set_top_module GJC26

create_clock -period 10 -name clk_i_buf

set_output_delay 3 -clock clk_i_buf [get_ports {data_o_buf}]

