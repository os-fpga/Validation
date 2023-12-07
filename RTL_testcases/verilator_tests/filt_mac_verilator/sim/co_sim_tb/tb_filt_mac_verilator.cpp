
// Define a macro to choose between the two files
// #define USE_FILE_A

#ifdef USE_FILE_A
#include "../../results_dir/filt_mac_verilator/run_1/synth_1_1/simulate_rtl/obj_dir/Vco_sim_filt_mac_verilator.h"
#else
#include "../../results_dir/filt_mac_verilator/run_1/synth_1_1/simulate_gate/obj_dir/Vco_sim_filt_mac_verilator.h"
#endif
int sc_main(int argc, char** argv){
    Verilated::commandArgs(argc,argv);
    Verilated::traceEverOn(true);
    Vco_sim_filt_mac_verilator* top;
    top = new Vco_sim_filt_mac_verilator("top");
        while (!Verilated::gotFinish())    {sc_start(1, SC_NS);}
    return 0;
}
