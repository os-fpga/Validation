create_design DCT8_final
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/dctslow.vhd
add_design_file ./rtl/DCT8_final.vhd
add_design_file ./rtl/serout.vhd
set_top_module DCT8_final
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
