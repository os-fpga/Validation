create_design fpu_double
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/fpupack.vhd
add_design_file ./rtl/comppack.vhd
add_design_file ./rtl/fpu_add.vhd
add_design_file ./rtl/fpu_mul.vhd
add_design_file ./rtl/fpu_exceptions.vhd
add_design_file ./rtl/fpu_round.vhd
add_design_file ./rtl/fpu_sub.vhd
add_design_file ./rtl/fpu_div.vhd
add_design_file ./rtl/fpu_double.vhd
set_top_module fpu_double
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
