#!/usr/bin/tclsh
create_design sys_primegen
target_device GEMINI
add_include_path ./rtl
add_design_file ./rtl/sys_primegen_package.vhd
add_design_file ./rtl/nibble2sevenseg.vhd
add_design_file ./rtl/uart_tx.vhd
add_design_file ./rtl/uart_rx.vhd
add_design_file ./rtl/debouncer8channel.vhd
add_design_file ./rtl/clock_divider.vhd
add_design_file ./rtl/bcddigitadder.vhd
add_design_file ./rtl/signedmultiplier.vhd
add_design_file ./rtl/rom32x32_hexout.vhd
add_design_file ./rtl/fourdigitsevensegled.vhd
add_design_file ./rtl/mux16to4.vhd
add_design_file ./rtl/sequencer.vhd
add_design_file ./rtl/rom32x32.vhd
add_design_file ./rtl/debouncer.vhd
add_design_file ./rtl/uart.vhd
add_design_file ./rtl/alu_with_hex2ascii.vhd
add_design_file ./rtl/PmodKYPD.vhd
add_design_file ./rtl/bin2bcd.vhd
add_design_file ./rtl/clocksinglestepper.vhd
add_design_file ./rtl/sys_primegen.vhd
set_top_module sys_primegen
#add_constraint_file <file>: Sets SDC + location constraints
#Constraints: set_pin_loc, set_region_loc, all SDC commands
#batch { cmd1 ... cmdn } : Run compilation script using commands below
#ipgenerate
synthesize delay
pnr_options --gen_post_synthesis_netlist on
packing
global_placement
place
route
sta
power
bitstream
#tcl_exit
