# create_clock -period 5 clk {clk1 clk2 clk3} # This does not work. This should work

create_clock -period 5 clk1  
create_clock -period 5 clk2 
create_clock -period 5 clk3 

# set_false_path -from [get_pins {out}] -to [get_pins {out}]

set_input_delay 1 -clock clk1 [get_ports {*}]
set_output_delay 1 -clock clk1 [get_ports {*}]

set_input_delay 1 -clock clk2 [get_ports {*}]
set_output_delay 1 -clock clk2 [get_ports {*}]

set_input_delay 1 -clock clk3 [get_ports {*}]
set_output_delay 1 -clock clk3 [get_ports {*}]

# create_clock -period 15 clock_main_c
# set_input_delay 1 -clock clock_main_c [get_ports {*}]
# set_output_delay 1 -clock clock_main_c [get_ports {*}]