create_design raptor_project_default_rerun
target_device GEMINI_COMPACT_82x68
add_design_file ./Src/timescale.v
add_design_file ./Src/aes_cipher_top.v
add_design_file ./Src/aes_key_expand_128.v
add_design_file ./Src/aes_rcon.v
add_design_file ./Src/aes_sbox.v
add_design_file ./Src/aes_shift_register_top.v
add_constraint_file raptor_project_default/constraints.sdc
analyze
