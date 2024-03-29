create_clock -period 2.5 iClk
set_input_delay 0 -clock iClk [get_ports {*}]
set_output_delay 0 -clock iClk [get_ports {*}]


set_clock_uncertainty 0.298
