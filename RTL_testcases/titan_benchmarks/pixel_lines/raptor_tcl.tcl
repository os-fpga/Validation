create_design Pixel_RunLineEncoding_Detection
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/Pixel_RunLineEncoding_Detection.v
set_top_module Pixel_RunLineEncoding_Detection
synthesize delay
packing
global_placement
place
route
sta
power
bitstream 
