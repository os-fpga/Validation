// Verilated -*- SystemC -*-
// DESCRIPTION: Verilator output: Symbol table implementation internals

#include "Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__Syms.h"
#include "Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2.h"
#include "Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root.h"

// FUNCTIONS
Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__Syms::~Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__Syms()
{
#ifdef VM_TRACE
    if (__Vm_dumping) _traceDumpClose();
#endif  // VM_TRACE
}

void Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__Syms::_traceDumpOpen() {
    const VerilatedLockGuard lock(__Vm_dumperMutex);
    if (VL_UNLIKELY(!__Vm_dumperp)) {
        __Vm_dumperp = new VerilatedVcdSc();
        __Vm_modelp->trace(__Vm_dumperp, 0, 0);
        std::string dumpfile = _vm_contextp__->dumpfileCheck();
        __Vm_dumperp->open(dumpfile.c_str());
        __Vm_dumping = true;
    }
}

void Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__Syms::_traceDumpClose() {
    const VerilatedLockGuard lock(__Vm_dumperMutex);
    __Vm_dumping = false;
    VL_DO_CLEAR(delete __Vm_dumperp, __Vm_dumperp = nullptr);
}

Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__Syms::Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__Syms(VerilatedContext* contextp, const char* namep, Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2* modelp)
    : VerilatedSyms{contextp}
    // Setup internal state of the Syms class
    , __Vm_modelp{modelp}
    // Setup module instances
    , TOP{this, namep}
{
    // Configure time unit / time precision
    _vm_contextp__->timeunit(-12);
    _vm_contextp__->timeprecision(-12);
    // Setup each module's pointers to their submodules
    // Setup each module's pointer back to symbol table (for public functions)
    TOP.__Vconfigure(true);
    // Setup scopes
    __Vscope_co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__golden__DSP_inst.configure(this, name(), "co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2.golden.DSP_inst", "DSP_inst", -12, VerilatedScope::SCOPE_OTHER);
}
