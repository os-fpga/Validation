create_design dsp_AB_36x36_Pipeline
target_device GEMINI
add_include_path ../src
add_library_path ../src
add_library_ext .v .sv
add_design_file ../src/dsp_AB_36x36_Pipeline_v1_0.v
set_top_module dsp_AB_36x36_Pipeline
synthesize