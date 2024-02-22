create_design dsp_AB_16x10_signed
target_device GEMINI_COMPACT_104x68
configure_ip dsp_generator_v1_0 -mod_name dsp_AB_16x10_signed -Pa_width=16 -Pb_width=10 -Preg_in=1 -Preg_out=1 -Punsigned=0 -out_file ./dsp_AB_16x10_signed/run_1/IPs/dsp_AB_16x10_signed
ipgenerate
add_library_path ./dsp_AB_16x10_signed/run_1/IPs/rapidsilicon/ip/dsp_generator/v1_0/dsp_AB_16x10_signed/src/
add_design_file ./dsp_AB_16x10_signed/run_1/IPs/rapidsilicon/ip/dsp_generator/v1_0/dsp_AB_16x10_signed/src/dsp_AB_16x10_signed\_v1_0.v
set_top_module dsp_AB_16x10_signed
analyze
simulate_ip dsp_AB_16x10_signed
add_simulation_file /nfs_scratch/scratch/litex/sarmad_salman/practice/ep4/Validation/RTL_testcases/IP_Catalog_Designs/dsp/dsp_generator_AB_16X10_signed/results_dir/dsp_AB_16x10_signed/run_1/IPs/rapidsilicon/ip/dsp_generator/v1_0/dsp_AB_16x10_signed/sim/dsp_test.v
synth_options -new_tdp36k 
synthesize delay
simulation_options compilation -g2012 gate
simulate gate iverilog
pin_loc_assign_method free
packing
global_placement
place
route
sta
power
bitstream 
