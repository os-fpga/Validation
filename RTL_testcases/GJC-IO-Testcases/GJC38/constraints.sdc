create_clock -period 10 clk_pll_in

# TODO:
#create_generated_clock -source clk_pll_in -divide_by 1 pll_clk

create_generated_clock -source clk_pll_in -divide_by 4 pll_clk_div4

# TODO:
#set_input_delay 2 -clock  pll_clk [get_ports {reset}]
#set_input_delay 2 -clock pll_clk [get_ports {enable_n}]

set_output_delay 2 -clock pll_clk_div4  [get_ports {data_o}]

