create_clock -period 2.5 sys_clk
set_input_delay 0.1 -clock sys_clk [get_ports {*}]
set_output_delay 0.1 -clock sys_clk [get_ports {*}]
create_clock -period 2.5 sd_bclkx2
set_input_delay 0.1 -clock sd_bclkx2 [get_ports {*}]
set_output_delay 0.1 -clock sd_bclkx2 [get_ports {*}]
create_clock -period 2.5 sdclk_freq
set_input_delay 0.1 -clock sdclk_freq [get_ports {*}]
set_output_delay 0.1 -clock sdclk_freq [get_ports {*}]
