create_design simple_bram
target_device 1GE100-ES1
add_design_file simple_bram.v
add_constraint_file simple_bram.sdc
ipgenerate
analyze
synth
packing
place
route
sta
bitstream write_xml


