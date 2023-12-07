create_clock -period 2.5 clk_mem
set_input_delay 0.1 -clock clk_mem [get_ports {*}]
set_output_delay 0.1 -clock clk_mem [get_ports {*}]

create_clock -period 2.5 clk
set_input_delay 0.1 -clock clk [get_ports {*}]
set_output_delay 0.1 -clock clk [get_ports {*}]