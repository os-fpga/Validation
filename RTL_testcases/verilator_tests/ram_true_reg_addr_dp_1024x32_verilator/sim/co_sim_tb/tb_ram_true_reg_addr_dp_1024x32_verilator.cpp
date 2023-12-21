#include "../../results_dir/ram_true_reg_addr_dp_1024x32_verilator/run_1/synth_1_1/simulate_rtl/obj_dir/Vco_sim_ram_true_reg_addr_dp_1024x32_verilator.h"
int sc_main(int argc, char** argv){
    Verilated::commandArgs(argc,argv);
    Verilated::traceEverOn(true);
    Vco_sim_ram_true_reg_addr_dp_1024x32_verilator* top;
    top = new Vco_sim_ram_true_reg_addr_dp_1024x32_verilator("top");
        while (!Verilated::gotFinish())    {sc_start(1, SC_NS);}
    return 0;
}
