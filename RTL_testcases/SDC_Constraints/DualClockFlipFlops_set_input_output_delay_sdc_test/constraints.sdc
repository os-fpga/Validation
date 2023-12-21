 
create_clock -period 20 [get_ports clk1]
create_clock -period 10 [get_ports clk2]

#set_input_delay 0.1 [all_inputs]
#set_output_delay 0.2 [all_outputs]

set_output_delay -clock clk2 -min 1 [get_ports {q_output}]
