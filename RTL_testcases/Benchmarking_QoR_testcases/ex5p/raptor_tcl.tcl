create_design ex5p
target_device 1GVTC
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file ./rtl/ex5p.v
set_top_module ex5p
analyze
synthesize delay
exec python3 /nfs_project/cxl/DV/bilal_malik/temp_work/Validation/RTL_testcases/Benchmarking_QoR_testcases/ex5p/../../../scripts/tb_generator.py ex5p /nfs_project/cxl/DV/bilal_malik/temp_work/Validation/RTL_testcases/Benchmarking_QoR_testcases/ex5p
add_simulation_file ./sim/co_sim_tb/co_sim_ex5p.v ./rtl/ex5p.v
set_top_testbench co_sim_ex5p
# Open the input file in read mode
set input_file [open "ex5p/run_1/synth_1_1/synthesis/ex5p\_post_synth.v" r]
# Read the file content
set file_content [read $input_file]
# Close the input file after reading
close $input_file
set modified_content [string map {"ex5p(" "ex5p_post_synth("} $file_content]
# Open the file again, this time in write mode to overwrite the old content
set output_file [open "ex5p/run_1/synth_1_1/synthesis/ex5p\_post_synth.v" w]
# Write the modified content back to the file
puts $output_file $modified_content
# Close the file
close $output_file
puts "Modification completed."
simulation_options compilation icarus gate
simulate gate icarus
