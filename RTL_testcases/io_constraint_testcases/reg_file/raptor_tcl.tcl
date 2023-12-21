create_design reg_file
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/reg_file.v
set_top_module reg_file
add_constraint_file ./pin_mapping.pin
synthesize delay
packing
global_placement
place
route
sta opensta
power
bitstream 
