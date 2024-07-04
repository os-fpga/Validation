set_top_module GJC30

create_clock -period 10 -name clk_i_buf

set_output_delay 3 -clock clk_i_buf [get_ports {dly_tap_val_inv_buf}]

