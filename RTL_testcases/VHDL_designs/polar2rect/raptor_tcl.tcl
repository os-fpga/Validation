create_design sc_corproc
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/p2r_CordicPipe.vhd
add_design_file ./rtl/sc_corproc.vhd
add_design_file ./rtl/p2r_cordic.vhd
set_top_module sc_corproc
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
