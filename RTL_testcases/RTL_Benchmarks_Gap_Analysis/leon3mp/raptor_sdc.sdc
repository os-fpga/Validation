create_clock -period 2.5 clk
set_input_delay 0 -clock clk [get_ports {*}]
set_output_delay 0 -clock clk [get_ports {*}]
create_clock -period 2.5 etx_clk
set_input_delay 0 -clock etx_clk [get_ports {*}]
set_output_delay 0 -clock etx_clk [get_ports {*}]
create_clock -period 2.5 erx_clk
set_input_delay 0 -clock erx_clk [get_ports {*}]
set_output_delay 0 -clock erx_clk [get_ports {*}]
create_clock -period 2.5 pci_clk
set_input_delay 0 -clock pci_clk [get_ports {*}]
set_output_delay 0 -clock pci_clk [get_ports {*}]