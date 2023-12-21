create_design zbt_top
target_device GEMINI_COMPACT_104x68
add_design_file -VHDL_2008 ./rtl/zbt_top.vhd
set_top_module zbt_top
add_simulation_file -VHDL_2008 tb/tb_zbt_top.vhd
set_top_testbench tb_zbt_top_vhd
analyze
simulation_options "ghdl" "simulation" "--stop-time=1000ns"
simulate "rtl" "ghdl" rtl_sim.vcd
synthesize delay
packing
global_placement
place
route
sta
power
bitstream 
