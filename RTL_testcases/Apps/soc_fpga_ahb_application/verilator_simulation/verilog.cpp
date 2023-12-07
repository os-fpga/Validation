#include "./Vtb_ahb_master_SC.h"
int sc_main(int argc, char** argv){
    Verilated::traceEverOn(true);
    new Vtb_ahb_master_SC("top");
    while (!Verilated::gotFinish()) { sc_start(1, SC_NS); }
    return 0;
}
