create_clock -period 2 PCLK
set_input_delay 0.1 -clock PCLK [get_ports {*}]
set_output_delay 0.1 -clock PCLK [get_ports {*}]
create_clock -period 2.5 BR_clk
set_input_delay 0.1 -clock BR_clk [get_ports {*}]
set_output_delay 0.1 -clock BR_clk [get_ports {*}]
create_clock -period 5 B_CLK
set_input_delay 0.1 -clock B_CLK [get_ports {*}]
set_output_delay 0.1 -clock B_CLK [get_ports {*}]