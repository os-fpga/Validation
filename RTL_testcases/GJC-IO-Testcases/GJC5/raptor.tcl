create_design fabric_clock_rtl
target_device 1GE100-ES1
add_design_file fabric_clock_rtl.v
add_constraint_file fabric_clock_rtl.sdc
ipgenerate
analyze
synth
packing
place
route
sta 

