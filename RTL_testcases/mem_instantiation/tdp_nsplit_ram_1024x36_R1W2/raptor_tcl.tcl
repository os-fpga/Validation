#!/usr/bin/tclsh
create_design tdp_nsplit_ram_1024x36_R1W2
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_design_file ./rtl/tdp_nsplit_ram_1024x36_R1W2.v
set_top_module tdp_nsplit_ram_1024x36_R1W2
#add_constraint_file <file>: Sets SDC + location constraints
#Constraints: set_pin_loc, set_region_loc, all SDC commands
#batch { cmd1 ... cmdn } : Run compilation script using commands below
#ipgenerate
synthesize delay
pnr_options --gen_post_synthesis_netlist on
#pnr_netlist_lang verilog
packing
global_placement
place
route
sta
power
bitstream
#tcl_exit
