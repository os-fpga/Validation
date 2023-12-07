#include "../../results_dir/matrix_mult_3x3_verilator/run_1/synth_1_1/simulate_gate/obj_dir/Vco_sim_matrix_mult_3x3_verilator.h"
int sc_main(int argc, char** argv){
    Verilated::commandArgs(argc,argv);
    Verilated::traceEverOn(true);
    Vco_sim_matrix_mult_3x3_verilator* top;
    top = new Vco_sim_matrix_mult_3x3_verilator("top");
        while (!Verilated::gotFinish())    {sc_start(1, SC_NS);}
    return 0;
}
