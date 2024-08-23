read_verilog -sv /nfs_eda_sw/softwares/Raptor/instl_dir/08_22_2024_09_15_01/share/raptor/sim_models/rapidsilicon/genesis3/FPGA_PRIMITIVES_MODELS/blackbox_models/cell_sim_blackbox.v
verilog_defines 
read_verilog  -I../../../../.././rtl -I../../../../.. -I/nfs_scratch/scratch/CompilerValidation/zaheer_ahmad/os_fpga2/Validation/RTL_testcases/GJC-IO-Testcases/GJC48/results_dir/.././rtl  /nfs_scratch/scratch/CompilerValidation/zaheer_ahmad/os_fpga2/Validation/RTL_testcases/GJC-IO-Testcases/GJC48/results_dir/.././rtl/GJC48.v 

analyze -top GJC48
