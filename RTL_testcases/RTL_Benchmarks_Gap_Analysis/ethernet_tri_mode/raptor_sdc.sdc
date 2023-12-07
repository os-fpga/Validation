create_clock -period 2.5 Clk_125M
set_input_delay 0.1 -clock Clk_125M [get_ports {*}]
set_output_delay 0.1 -clock Clk_125M [get_ports {*}]
create_clock -period 2.5 Clk_user
set_input_delay 0.1 -clock Clk_user [get_ports {*}]
set_output_delay 0.1 -clock Clk_user [get_ports {*}]
create_clock -period 2.5 Clk_reg
set_input_delay 0.1 -clock Clk_reg [get_ports {*}]
set_output_delay 0.1 -clock Clk_reg [get_ports {*}]
create_clock -period 2.5 Rx_clk
set_input_delay 0.1 -clock Rx_clk [get_ports {*}]
set_output_delay 0.1 -clock Rx_clk [get_ports {*}]
create_clock -period 2.5 Tx_clk
set_input_delay 0.1 -clock Tx_clk [get_ports {*}]
set_output_delay 0.1 -clock Tx_clk [get_ports {*}]
