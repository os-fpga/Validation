create_design GJC48
target_device GEMINI_COMPACT_22x4
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/GJC48.v
set_top_module GJC48
add_constraint_file pin_constraints.pin
add_constraint_file constraints.sdc
analyze
synthesize delay
add_simulation_file ./sim/co_sim_tb/co_sim_GJC48.v ./rtl/GJC48.v
set_top_testbench co_sim_GJC48
# Open the input file in read mode
set input_file [open "GJC48/run_1/synth_1_1/synthesis/GJC48\_post_synth.v" r]
# Read the file content
set file_content [read $input_file]
# Close the input file after reading
close $input_file
set modified_content [string map {"GJC48(" "GJC48_post_synth("} $file_content]
# Open the file again, this time in write mode to overwrite the old content
set output_file [open "GJC48/run_1/synth_1_1/synthesis/GJC48\_post_synth.v" w]
# Write the modified content back to the file
puts $output_file $modified_content
# Close the file
close $output_file
puts "Modification completed."
simulation_options compilation icarus gate
simulate gate icarus
packing
place
route
# Open the input file in read mode
set input_file [open "GJC48/run_1/synth_1_1/synthesis/post_pnr_wrapper_GJC48\_post_synth.v" r]
# Read the file content
set file_content [read $input_file]
# Close the input file after reading
close $input_file
set modified_content [string map {"module GJC48(" "module GJC48_post_route ("} $file_content]
# Open the file again, this time in write mode to overwrite the old content
set output_file [open "GJC48/run_1/synth_1_1/synthesis/post_pnr_wrapper_GJC48\_post_synth.v" w]
# Write the modified content back to the file
puts $output_file $modified_content
# Close the file
close $output_file
puts "Modification completed."
simulation_options compilation icarus -DPNR=1 pnr
simulate pnr icarus
sta
power
bitstream 
