create_design qfp_unit
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/cla.vhd
add_design_file ./rtl/qfp_p.vhd
add_design_file ./rtl/misc.vhd
add_design_file ./rtl/add.vhd
add_design_file ./rtl/divider.vhd
add_design_file ./rtl/mul.vhd
add_design_file ./rtl/norm.vhd
add_design_file ./rtl/recp.vhd
add_design_file ./rtl/qfp_unit.vhd
set_top_module qfp_unit
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream 
