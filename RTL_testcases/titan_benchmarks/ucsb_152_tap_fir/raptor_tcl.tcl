create_design ucsb_152_tap_fir
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/ucsb_152_tap_fir.v
set_top_module ucsb_152_tap_fir
synthesize delay
packing
global_placement
place
route
sta
power
bitstream 
