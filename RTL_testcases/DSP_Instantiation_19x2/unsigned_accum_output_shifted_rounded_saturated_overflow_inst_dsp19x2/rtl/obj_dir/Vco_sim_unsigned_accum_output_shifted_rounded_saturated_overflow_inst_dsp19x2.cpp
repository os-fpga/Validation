// Verilated -*- SystemC -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2.h"
#include "Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__Syms.h"
#include "verilated_vcd_sc.h"

//============================================================
// Constructors

Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2::Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2(sc_module_name /* unused */)
    : VerilatedModel{*Verilated::threadContextp()}
    , vlSymsp{new Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__Syms(contextp(), name(), this)}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
    // Sensitivities on all clocks and combinational inputs
    SC_METHOD(eval);
    SC_METHOD(eval_sens);

}

//============================================================
// Destructor

Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2::~Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root___eval_debug_assertions(Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root* vlSelf);
#endif  // VL_DEBUG
void Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root___eval_static(Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root* vlSelf);
void Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root___eval_initial(Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root* vlSelf);
void Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root___eval_settle(Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root* vlSelf);
void Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root___eval(Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root* vlSelf);

void Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2::eval() {
    eval_step();
    if (eventsPending()) {
        sc_time dt = sc_time::from_value(nextTimeSlot() - contextp()->time());
        next_trigger(dt, trigger_eval);
    } else {
        next_trigger(trigger_eval);
    }
}

void Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2::eval_sens() {
    trigger_eval.notify();
}

void Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_activity = true;
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root___eval_static(&(vlSymsp->TOP));
        Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root___eval_initial(&(vlSymsp->TOP));
        Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
}

//============================================================
// Events and timing
bool Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty(); }

uint64_t Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

//============================================================
// Invoke final blocks

void Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root___eval_final(Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root* vlSelf);

VL_ATTR_COLD void Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2::final() {
    Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2::hierName() const { return vlSymsp->name(); }
const char* Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2::modelName() const { return "Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2"; }
unsigned Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2::threads() const { return 1; }
std::unique_ptr<VerilatedTraceConfig> Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2::traceConfig() const {
    return std::unique_ptr<VerilatedTraceConfig>{new VerilatedTraceConfig{false, false, false}};
};

//============================================================
// Trace configuration

void Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root__trace_init_top(Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root*>(voidSelf);
    Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->scopeEscape(' ');
    tracep->pushNamePrefix(std::string{vlSymsp->name()} + ' ');
    Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root__trace_init_top(vlSelf, tracep);
    tracep->popNamePrefix();
    tracep->scopeEscape('.');
}

VL_ATTR_COLD void Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root__trace_register(Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2::trace(VerilatedVcdC* tfp, int levels, int options) {
    if (!sc_core::sc_get_curr_simcontext()->elaboration_done()) {
        vl_fatal(__FILE__, __LINE__, name(), "Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2::trace() is called before sc_core::sc_start(). Run sc_core::sc_start(sc_core::SC_ZERO_TIME) before trace() to complete elaboration.");
    }if (tfp->isOpen()) {
        vl_fatal(__FILE__, __LINE__, __FILE__,"'Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2::trace()' shall not be called after 'VerilatedVcdC::open()'.");
    }
    if (false && levels && options) {}  // Prevent unused
    tfp->spTrace()->addModel(this);
    tfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP));
    Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root__trace_register(&(vlSymsp->TOP), tfp->spTrace());
}
