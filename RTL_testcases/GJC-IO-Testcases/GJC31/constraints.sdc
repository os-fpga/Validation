
create_clock -period 5 clk_i_buf

create_generated_clock -source [get_clocks clk_i_buf] -divide_by 4 [get_nets clk_i]

set_output_delay 2 -clock clk_i [get_ports {data_o}]

