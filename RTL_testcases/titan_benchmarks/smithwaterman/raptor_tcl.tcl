create_design smithwaterman
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/smithwaterman.v
set_top_module smithwaterman
synthesize delay
packing
global_placement
place
route
sta
power
bitstream 
