create_clock -period 2.5 TX_CLK_DIV
set_input_delay 0.1 -clock TX_CLK_DIV [get_ports {*}]
set_output_delay 0.1 -clock TX_CLK_DIV [get_ports {*}]

