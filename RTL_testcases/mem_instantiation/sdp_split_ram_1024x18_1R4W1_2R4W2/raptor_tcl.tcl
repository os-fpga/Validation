create_design sdp_split_ram_1024x18_1R4W1_2R4W2
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/sdp_split_ram_1024x18_1R4W1_2R4W2.v
set_top_module sdp_split_ram_1024x18_1R4W1_2R4W2
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
