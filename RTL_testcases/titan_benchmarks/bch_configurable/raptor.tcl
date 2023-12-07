create_design test_bch_bm_02_24


#target_device GEMINI
target_device 1GE100
add_include_path ./rtl
add_library_path ./rtl
add_design_file ./rtl/test_bch_bm.v


set_top_module test_bch_bm
#add_constraint_file ./aes/raptor_sdc.sdc

synth_options 	-effort high -carry auto -fsm_encoding onehot 
analyze
synthesize 

packing 
place 
route 
sta
bitstream 

