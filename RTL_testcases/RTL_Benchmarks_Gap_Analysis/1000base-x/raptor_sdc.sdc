create_clock -period 2.5 tbi_rx_ckpin
set_input_delay 0.1 -clock tbi_rx_ckpin [get_ports {*}]
set_output_delay 0.1 -clock tbi_rx_ckpin [get_ports {*}]
