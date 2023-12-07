create_clock -period 2.5 crc_clk
set_input_delay 0.1 -clock crc_clk [get_ports {*}]
set_output_delay 0.1 -clock crc_clk [get_ports {*}]