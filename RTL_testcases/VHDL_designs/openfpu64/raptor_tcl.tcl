create_design openFPU64
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/fpu_package.vhd
add_design_file ./rtl/eis_helpers.vhd
add_design_file ./rtl/fpu_mul_single.vhd
add_design_file ./rtl/fpu_add.vhd
add_design_file ./rtl/fpu_mul.vhd
add_design_file ./rtl/openfpu64.vhd
set_top_module openFPU64
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
