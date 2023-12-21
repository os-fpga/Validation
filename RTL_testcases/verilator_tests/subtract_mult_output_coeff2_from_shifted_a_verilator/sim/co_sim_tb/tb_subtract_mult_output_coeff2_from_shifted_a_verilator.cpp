#include "../../results_dir/subtract_mult_output_coeff2_from_shifted_a_verilator/run_1/synth_1_1/simulate_gate/obj_dir/Vco_sim_subtract_mult_output_coeff2_from_shifted_a_verilator.h"
int sc_main(int argc, char** argv){
    Verilated::commandArgs(argc,argv);
    Verilated::traceEverOn(true);
    Vco_sim_subtract_mult_output_coeff2_from_shifted_a_verilator* top;
    top = new Vco_sim_subtract_mult_output_coeff2_from_shifted_a_verilator("top");
        while (!Verilated::gotFinish())    {sc_start(1, SC_NS);}
    return 0;
}
