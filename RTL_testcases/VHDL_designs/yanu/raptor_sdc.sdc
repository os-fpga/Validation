create_clock -period 2.5 csi_yanuc_clk
set_input_delay 0.1 -clock csi_yanuc_clk[get_ports {*}]
set_output_delay 0.1 -clock csi_yanuc_clk [get_ports {*}]
