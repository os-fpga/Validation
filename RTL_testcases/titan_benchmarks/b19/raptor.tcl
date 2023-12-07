create_design b19_02_24

add_include_path ./rtl
add_library_path ./rtl

#target_device GEMINI
target_device 1GE100

add_design_file ./rtl/b19.vhd

set_top_module b19
#add_constraint_file ./aes/raptor_sdc.sdc

synth_options 	-effort high -carry auto -fsm_encoding onehot 
analyze
synthesize 

packing 
place 
route 
sta
bitstream 

