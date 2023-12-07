create_design fpu_double
target_device GEMINI_COMPACT_104x68
add_design_file -VHDL_2008 ./rtl/fpupack.vhd
add_design_file -VHDL_2008 ./rtl/comppack.vhd
add_design_file -VHDL_2008 ./rtl/fpu_add.vhd
add_design_file -VHDL_2008 ./rtl/fpu_mul.vhd
add_design_file -VHDL_2008 ./rtl/fpu_exceptions.vhd
add_design_file -VHDL_2008 ./rtl/fpu_round.vhd
add_design_file -VHDL_2008 ./rtl/fpu_sub.vhd
add_design_file -VHDL_2008 ./rtl/fpu_div.vhd
add_design_file -VHDL_2008 ./rtl/fpu_double.vhd
set_top_module fpu_double
add_simulation_file -VHDL_2008 tb/fpu_double_TB.vhd
set_top_testbench fpu_double_tb
analyze
simulation_options "ghdl" "simulation" "--stop-time=1000ns"
simulate "rtl" "ghdl" rtl_sim.fst
synthesize delay
