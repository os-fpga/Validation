create_clock -period 2.5 clk_i
set_input_delay 0 -clock clk_i [get_ports {*}]
set_output_delay 0 -clock clk_i [get_ports {*}]

create_clock -period 2.5 dspclk
set_input_delay 0 -clock dspclk [get_ports {*}]
set_output_delay 0 -clock dspclk [get_ports {*}]