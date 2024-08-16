# Create a Virtual clock (-name option) as there are no clocks in this design
create_clock -period 5 -name vclk

set_input_delay 1 -clock vclk [get_ports {din}]
set_output_delay 1 -clock vclk [get_ports {dout}]
