create_clock -period 2.5 s_ahb_aclk
set_input_delay 0.1 -clock s_ahb_aclk [get_ports {*}] 
set_output_delay 0.1 -clock s_ahb_aclk [get_ports {*}] 
