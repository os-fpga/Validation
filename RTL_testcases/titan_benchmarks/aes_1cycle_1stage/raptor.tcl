create_design aes_1cycle_1stage02_24


#target_device GEMINI
target_device 1GE100
add_include_path ./rtl
add_library_path ./rtl
add_design_file ./rtl/aes_cipher_top.v


set_top_module aes_cipher_top
#add_constraint_file ./aes/raptor_sdc.sdc

synth_options 	-effort high -carry auto -fsm_encoding onehot 
analyze
synthesize 

packing 
place 
route 
sta
bitstream 

