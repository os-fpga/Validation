create_clock -period 2.5 WB_CLK_I
set_input_delay 0.1 -clock WB_CLK_I [get_ports {*}]
set_output_delay 0.1 -clock WB_CLK_I [get_ports {*}]
create_clock -period 2.5 BR_Clk_I
set_input_delay 0.1 -clock BR_Clk_I [get_ports {*}]
set_output_delay 0.1 -clock BR_Clk_I [get_ports {*}]