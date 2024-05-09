create_design i_buf_ds_i_delay
add_design_file i_buf_ds_i_delay.v
set_top_module i_buf_ds_i_delay
# add_constraint_file constraints.sdc
add_constraint_file pin_constraints.pin
# Using 1VG28 instead of gemini 10x8 because 10x8 does not have enough IO pads for this design
target_device 1VG28

analyze
synthesize
packing
place
route
sta
bitstream