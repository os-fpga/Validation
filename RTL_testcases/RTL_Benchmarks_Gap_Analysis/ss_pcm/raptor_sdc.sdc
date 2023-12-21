create_clock -period 2.5 clk
set_input_delay 0 -clock clk [get_ports {*}]
set_output_delay 0 -clock clk [get_ports {*}]
create_clock -period 2.5 pcm_clk_i
set_input_delay 0 -clock pcm_clk_i [get_ports {*}]
set_output_delay 0 -clock pcm_clk_i [get_ports {*}]