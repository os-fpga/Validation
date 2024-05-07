create_clock -period 2.5 phy_txclk
set_input_delay 0.1 -clock phy_txclk [get_ports {*}]
set_output_delay 0.1 -clock phy_txclk [get_ports {*}]
create_clock -period 2.5 phy_rxclk
set_input_delay 0.1 -clock phy_rxclk [get_ports {*}]
set_output_delay 0.1 -clock phy_rxclk [get_ports {*}]
create_clock -period 2.5 clk_10K
set_input_delay 0.1 -clock clk_10K [get_ports {*}]
set_output_delay 0.1 -clock clk_10K [get_ports {*}]
create_clock -period 2.5 ff_clk
set_input_delay 0.1 -clock ff_clk [get_ports {*}]
set_output_delay 0.1 -clock ff_clk [get_ports {*}]