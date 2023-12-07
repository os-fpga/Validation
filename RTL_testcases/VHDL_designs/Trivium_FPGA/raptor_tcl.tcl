create_design Trivium_Module
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/Key_Sequence_Module.vhd
add_design_file ./rtl/Trivium_Module.vhd
set_top_module Trivium_Module
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
