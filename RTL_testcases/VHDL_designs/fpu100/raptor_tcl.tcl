create_design fpu
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/fpupack.vhd
add_design_file ./rtl/comppack.vhd
add_design_file ./rtl/mul_24.vhd
add_design_file ./rtl/serial_div.vhd
add_design_file ./rtl/sqrt.vhd
add_design_file ./rtl/addsub_28.vhd
add_design_file ./rtl/pre_norm_mul.vhd
add_design_file ./rtl/pre_norm_sqrt.vhd
add_design_file ./rtl/fpu.vhd
add_design_file ./rtl/post_norm_div.vhd
add_design_file ./rtl/serial_mul.vhd
add_design_file ./rtl/pre_norm_addsub.vhd
add_design_file ./rtl/post_norm_addsub.vhd
add_design_file ./rtl/post_norm_sqrt.vhd
add_design_file ./rtl/pre_norm_div.vhd
add_design_file ./rtl/post_norm_mul.vhd
set_top_module fpu
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
