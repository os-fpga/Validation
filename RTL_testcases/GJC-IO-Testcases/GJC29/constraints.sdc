create_clock -period 10 clk_i_buf

set_output_delay 3 -clock clk_i_buf [get_ports {*}]

