create_clock -period 10 clk_pll_in
create_generated_clock -source clk_pll_in -divide_by 1 clk_design0
create_generated_clock -source clk_pll_in -divide_by 2 clk_design1 
create_generated_clock -source clk_pll_in -divide_by 3 clk_design2 
create_generated_clock -source clk_pll_in -divide_by 4 clk_design3
create_generated_clock -source clk_pll_in -divide_by 1 clk_design4 
create_generated_clock -source clk_pll_in -divide_by 2 clk_design5 
create_generated_clock -source clk_pll_in -divide_by 3 clk_design6 
create_generated_clock -source clk_pll_in -divide_by 4 clk_design7
