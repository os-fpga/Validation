create_clock -period 2.5 clk_i
set_input_delay 0 -clock clk_i [get_ports {*}]
set_output_delay 0 -clock clk_i [get_ports {*}]

create_clock -period 2.5 phy_clk_pad_i
set_input_delay 0 -clock phy_clk_pad_i [get_ports {*}]
set_output_delay 0 -clock phy_clk_pad_i [get_ports {*}]

set_clock_groups -exclusive -group {clk_i} -group {phy_clk_pad_i}
