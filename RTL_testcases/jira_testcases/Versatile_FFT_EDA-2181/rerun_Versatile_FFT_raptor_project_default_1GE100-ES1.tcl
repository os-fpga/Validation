create_design Versatile_FFT_raptor_project_default_1GE100-ES1
target_device 1GE100-ES1
add_design_file ./Src/icpx_pkg.vhd
add_design_file ./Src/butterfly.vhd
add_design_file ./Src/dpram_inf.vhd
add_design_file ./Src/icpxram.vhd
add_design_file ./Src/fft_engine.vhd
add_design_file ./Src/fft_len.vhd
add_design_file ./Src/butterfly_tb.vhd
add_design_file ./Src/fft_engine_tb.vhd
set_top_module fft_engine
add_constraint_file Versatile_FFT_raptor_project_default_1GE100-ES1/constraints.sdc
analyze
