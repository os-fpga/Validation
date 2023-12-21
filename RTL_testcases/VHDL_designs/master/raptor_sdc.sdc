create_clock -period 2.5 clk_uart_29MHz_i
set_input_delay 0.1 -clock clk_uart_29MHz_i [get_ports {*}]
set_output_delay 0.1 -clock clk_uart_29MHz_i [get_ports {*}]
