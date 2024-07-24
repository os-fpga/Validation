create_clock -period 10 clk_pll_in
create_generated_clock -source [get_clocks clk_pll_in] -divide_by 1 [get_nets pll_clk]
create_generated_clock -source [get_clocks clk_pll_in] -divide_by 3 [get_nets pll_clk_div3]

set_input_delay 2 -clock pll_clk_div3 [get_ports {reset}]
set_input_delay 2 -clock pll_clk_div3 [get_ports {enable_n}]
set_output_delay 2 -clock pll_clk_div3 [get_ports {counter[0]}]
set_output_delay 2 -clock pll_clk_div3 [get_ports {counter[1]}]
set_output_delay 2 -clock pll_clk_div3 [get_ports {counter[2]}]
