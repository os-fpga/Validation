create_clock -period 5 clk
set_input_delay 1 -clock clk [get_ports {din}]
set_output_delay 1 -clock clk [get_ports {oe}]
set_output_delay 1 -clock clk [get_ports {tristate_out}]
