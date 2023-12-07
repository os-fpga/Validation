create_clock -period 2.5 LR_CK
set_input_delay 0.1 -clock LR_CK [get_ports {*}]
set_output_delay 0.1 -clock LR_CK [get_ports {*}]
create_clock -period 2.5 BIT_CK
set_input_delay 0.1 -clock BIT_CK [get_ports {*}]
set_output_delay 0.1 -clock BIT_CK [get_ports {*}]