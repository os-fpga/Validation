create_clock -period 10 clk_pll_in
create_generated_clock -source clk_pll_in -divide_by 1 clk_design0
create_generated_clock -source clk_pll_in -divide_by 2 clk_design1 
create_generated_clock -source clk_pll_in -divide_by 3 clk_design2 
create_generated_clock -source clk_pll_in -divide_by 4 clk_design3


set_input_delay 2 -clock clk_design0 [get_ports {data_i[0]}]
set_input_delay 2 -clock clk_design1 [get_ports {data_i[1]}]
set_input_delay 2 -clock clk_design2 [get_ports {data_i[2]}]
set_input_delay 2 -clock clk_design3 [get_ports {data_i[3]}]

set_input_delay 2 -clock clk_design0 [get_ports {enable}]

set_output_delay 2 -clock clk_design0 [get_ports {data_o[0]}]
set_output_delay 2 -clock clk_design1 [get_ports {data_o[1]}]
set_output_delay 2 -clock clk_design2 [get_ports {data_o[2]}]
set_output_delay 2 -clock clk_design3 [get_ports {data_o[3]}]
