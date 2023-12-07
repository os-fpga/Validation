create_clock -period 2.5 clk_in
set_input_delay 0.1 -clock clk_in [get_ports {*}]
set_output_delay 0.1 -clock clk_in [get_ports {*}]
create_clock -period 2.5 phy_rxclk
set_input_delay 0.1 -clock phy_rxclk [get_ports {*}]
set_output_delay 0.1 -clock phy_rxclk [get_ports {*}]
