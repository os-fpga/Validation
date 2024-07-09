
create_clock -period 5 clk_pll_in

create_generated_clock -source [get_clocks clk_pll_in] -divide_by 4 [get_nets clk_design]

set_input_delay 2 -clock clk_design [get_ports {data_i}]
set_input_delay 2 -clock clk_design [get_ports {enable}]
set_output_delay 2 -clock clk_design [get_ports {data_o}]

