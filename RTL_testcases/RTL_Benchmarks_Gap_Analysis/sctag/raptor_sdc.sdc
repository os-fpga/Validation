create_clock -period 2.5 cmp_gclk
set_input_delay 0.1 -clock cmp_gclk [get_ports {*}]
set_output_delay 0.1 -clock cmp_gclk [get_ports {*}]
create_clock -period 2.5 efc_sctag_fuse_clk1
set_input_delay 0.1 -clock efc_sctag_fuse_clk1 [get_ports {*}]
set_output_delay 0.1 -clock efc_sctag_fuse_clk1 [get_ports {*}]
create_clock -period 2.5 efc_sctag_fuse_clk2
set_input_delay 0.1 -clock efc_sctag_fuse_clk2 [get_ports {*}]
set_output_delay 0.1 -clock efc_sctag_fuse_clk2 [get_ports {*}]