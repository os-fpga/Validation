# Define the clock coming from the internal oscillator
create_clock -period 10 clk_pll_in

# Create the generated clocks from the PLL
create_generated_clock -source clk_pll_in -divide_by 1 pll_clk
create_generated_clock -source clk_pll_in -divide_by 4 pll_clk_div4

# Set input delays for reset and enable
set_input_delay 2 -clock pll_clk_div4 [get_ports {reset}]
set_input_delay 2 -clock pll_clk_div4 [get_ports {enable_n}]

# Set output delays for the serialized data and clock outputs
set_output_delay 2 -clock pll_clk_div4 [get_ports {data_o}]
set_output_delay 2 -clock pll_clk_div4 [get_ports {clk_o}]


