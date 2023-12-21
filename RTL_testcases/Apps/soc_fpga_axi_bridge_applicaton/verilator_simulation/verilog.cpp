#include "./Vtb2.h"
int sc_main(int argc, char** argv){
    Verilated::traceEverOn(true);
    new Vtb2("top");
    while (!Verilated::gotFinish()) { sc_start(1, SC_NS); }
    return 0;
}
