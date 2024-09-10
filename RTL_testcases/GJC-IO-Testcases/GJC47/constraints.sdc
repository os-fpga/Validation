

create_clock -period 10 clk_i_buf

#set_input_delay  1 -clock clk_i_buf [get_ports {reset}]
#set_input_delay  1 -clock clk_i_buf [get_ports {sel_dly}]
#set_input_delay  1 -clock clk_i_buf [get_ports {din_idly}]
#set_input_delay  1 -clock clk_i_buf [get_ports {din_odly}]
#set_input_delay  1 -clock clk_i_buf [get_ports {g2f_trx_dly_tap}]
#set_input_delay  1 -clock clk_i_buf [get_ports {dly_incdec_buf}]
#set_input_delay  1 -clock clk_i_buf [get_ports {dly_ld_buf}]
#set_input_delay  1 -clock clk_i_buf [get_ports {dly_adj_buf}]
#set_input_delay  1 -clock clk_i_buf [get_ports {usr_rd_dly_value}]
#set_input_delay  1 -clock clk_i_buf [get_ports {g2f_rx_dly_tap}]
#set_output_delay 1 -clock clk_i_buf [get_ports {f2g_trx_dly_inc}]
#set_output_delay 1 -clock clk_i_buf [get_ports {f2g_trx_dly_ld}]
#set_output_delay 1 -clock clk_i_buf [get_ports {f2g_trx_dly_adj}]
#set_output_delay 1 -clock clk_i_buf [get_ports {f2g_dly_addr}]
#set_output_delay 1 -clock clk_i_buf [get_ports {data_delayed_buf}]
#set_output_delay 1 -clock clk_i_buf [get_ports {dly_tap_val_inv_buf}]
