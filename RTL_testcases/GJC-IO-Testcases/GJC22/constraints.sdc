create_clock -period 10 clk

set_output_delay 3 -clock clk [get_ports {data_o}]

