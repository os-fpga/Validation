create_design MDCT
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file -work avinash ./rtl/MDCT_PKG.vhd
add_design_file -work avinash ./rtl/DCT1D.vhd
add_design_file -work avinash ./rtl/DCT2D.vhd
add_design_file -work avinash ./rtl/ROMO.vhd
add_design_file -work avinash ./rtl/DBUFCTL.vhd
add_design_file -work avinash ./rtl/RAM.vhd
add_design_file -work avinash ./rtl/ROME.vhd
add_design_file -work avinash ./rtl/MDCT.vhd
set_top_module MDCT -work avinash
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
