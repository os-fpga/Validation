create_design AES_DECRYPT_V2_02_24
target_device GEMINI
add_include_path ./rtl
add_library_path ./rtl
add_library_ext .v .sv
add_design_file -SV_2012 ./rtl/aes_decrypt128.sv
add_design_file -SV_2012 ./rtl/aes_decrypt192.sv
add_design_file -SV_2012 ./rtl/aes_decrypt256.sv
add_design_file -SV_2012 ./rtl/aes_decrypt256.SV
add_design_file -SV_2012 ./rtl/decrypt.sv
add_design_file -SV_2012 ./rtl/generic_muxfx.v
add_design_file -SV_2012 ./rtl/gfmul.sv
add_design_file -SV_2012 ./rtl/InvAddRoundKey.sv
add_design_file -SV_2012 ./rtl/InvMixCol_slice.sv
add_design_file -SV_2012 ./rtl/InvMixColumns.sv
add_design_file -SV_2012 ./rtl/InvSbox.sv
add_design_file -SV_2012 ./rtl/InvShiftRows.sv
add_design_file -SV_2012 ./rtl/InvSubBytes.sv
add_design_file -SV_2012 ./rtl/KeyExpand128.sv
add_design_file -SV_2012 ./rtl/KeyExpand192.sv
add_design_file -SV_2012 ./rtl/KeyExpand256.sv
add_design_file -SV_2012 ./rtl/KschBuffer.sv
add_design_file -SV_2012 ./rtl/RotWord.sv
add_design_file -SV_2012 ./rtl/Sbox.sv
add_design_file -SV_2012 ./rtl/SubWord.sv
add_design_file  ./rtl/wrapper.v
add_design_file  ./rtl/aes_decrypt_wrapper_top.v
set_top_module aes_decrypt_wrapper_top
synthesize -effort high
add_constraint_file ./AES_DECRYPT.srcs/constrs_1/aes_decrypt.sdc
packing
global_placement
place
route
sta
power
bitstream 
