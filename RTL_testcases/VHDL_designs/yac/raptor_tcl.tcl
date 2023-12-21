create_design cordic_iterative_wb
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/cordic_iterative_pkg.vhd
add_design_file ./rtl/cordic_iterative_int.vhd
add_design_file ./rtl/cordic_iterative_pkg.vhd
add_design_file ./rtl/cordic_iterative_wb.vhd
set_top_module cordic_iterative_wb
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
