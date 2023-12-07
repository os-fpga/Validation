create_design Yet_Another_VGA_raptor_project_default_1GE100-ES1
target_device 1GE100-ES1
add_design_file ./Src/yavga_pkg.vhd
add_design_file ./Src/charmaps_ROM.vhd
add_design_file ./Src/chars_RAM.vhd
add_design_file ./Src/vga_ctrl.vhd
add_design_file ./Src/waveform_RAM.vhd
add_design_file ./Src/s3e_starter_1600k.vhd
set_top_module s3e_starter_1600k
add_constraint_file Yet_Another_VGA_raptor_project_default_1GE100-ES1/constraints.sdc
analyze
