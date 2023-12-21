create_design sha
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/sha.v
set_top_module sha
synthesize delay
packing
global_placement
place
route
sta
power
bitstream 
