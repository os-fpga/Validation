create_clock -period 2.5 tx_tetra_clk_36_KHz
set_input_delay 0 -clock tx_tetra_clk_36_KHz [get_ports {*}]
set_output_delay 0 -clock tx_tetra_clk_36_KHz [get_ports {*}]

create_clock -period 2.5 tx_tetra_clk_18_KHz
set_input_delay 0 -clock tx_tetra_clk_18_KHz [get_ports {*}]
set_output_delay 0 -clock tx_tetra_clk_18_KHz [get_ports {*}]

create_clock -period 2.5 rx_clk_18_KHz
set_input_delay 0 -clock rx_clk_18_KHz [get_ports {*}]
set_output_delay 0 -clock rx_clk_18_KHz [get_ports {*}]

set_clock_groups -exclusive -group {tx_tetra_clk_36_KHz} -group {tx_tetra_clk_18_KHz} -group {rx_clk_18_KHz}

set_clock_uncertainty 0.698
