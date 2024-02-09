// Verilated -*- SystemC -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vco_sim_registered_in_and_out_mult_dsp19x2.h for the primary calling header

#include "verilated.h"

#include "Vco_sim_registered_in_and_out_mult_dsp19x2__Syms.h"
#include "Vco_sim_registered_in_and_out_mult_dsp19x2___024root.h"

VL_INLINE_OPT VlCoroutine Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_initial__TOP__2(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_initial__TOP__2\n"); );
    // Body
    while (1U) {
        co_await vlSelf->__VtrigSched_hea250c32__0.trigger("@([changed] co_sim_registered_in_and_out_mult_dsp19x2.golden.__Vcellinp__DSP_inst__ACC_FIR)", "/nfs_scratch/scratch/AE/saad/New_primitives_test_cases/Cloned_latest/Compiler_Validation/RTL_testcases/DSP_Instantiation_19x2/RTLvsNetlist_Passed/registered_in_and_out_mult_dsp19x2/rtl/./../../DSP19X2.v", 381);
        if (VL_UNLIKELY((0x15U < (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT____Vcellinp__DSP_inst__ACC_FIR)))) {
            VL_WRITEF("WARNING: DSP19x2 instance %Nco_sim_registered_in_and_out_mult_dsp19x2.golden.DSP_inst ACC_FIR input is %2# which is greater than 21 which serves no function\n",
                      vlSymsp->name(),5,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT____Vcellinp__DSP_inst__ACC_FIR);
            co_await vlSelf->__VdlySched.delay(1U, "/nfs_scratch/scratch/AE/saad/New_primitives_test_cases/Cloned_latest/Compiler_Validation/RTL_testcases/DSP_Instantiation_19x2/RTLvsNetlist_Passed/registered_in_and_out_mult_dsp19x2/rtl/./../../DSP19X2.v", 385);
            VL_FINISH_MT("/nfs_scratch/scratch/AE/saad/New_primitives_test_cases/Cloned_latest/Compiler_Validation/RTL_testcases/DSP_Instantiation_19x2/RTLvsNetlist_Passed/registered_in_and_out_mult_dsp19x2/rtl/./../../DSP19X2.v", 385, "");
        }
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___dump_triggers__act(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf);
#endif  // VL_DEBUG

void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_triggers__act(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_triggers__act\n"); );
    // Body
    vlSelf->__VactTriggered.at(0U) = (((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__clk) 
                                       & (~ (IData)(vlSelf->__Vtrigrprev__TOP__co_sim_registered_in_and_out_mult_dsp19x2__DOT__clk))) 
                                      | ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset) 
                                         & (~ (IData)(vlSelf->__Vtrigrprev__TOP__co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset))));
    vlSelf->__VactTriggered.at(1U) = vlSelf->__VdlySched.awaitingCurrentTime();
    vlSelf->__VactTriggered.at(2U) = ((~ (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__clk)) 
                                      & (IData)(vlSelf->__Vtrigrprev__TOP__co_sim_registered_in_and_out_mult_dsp19x2__DOT__clk));
    vlSelf->__VactTriggered.at(3U) = ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT____Vcellinp__DSP_inst__ACC_FIR) 
                                      != (IData)(vlSelf->__Vtrigrprev__TOP__co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT____Vcellinp__DSP_inst__ACC_FIR));
    vlSelf->__Vtrigrprev__TOP__co_sim_registered_in_and_out_mult_dsp19x2__DOT__clk 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__clk;
    vlSelf->__Vtrigrprev__TOP__co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset;
    vlSelf->__Vtrigrprev__TOP__co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT____Vcellinp__DSP_inst__ACC_FIR 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT____Vcellinp__DSP_inst__ACC_FIR;
    if (VL_UNLIKELY((1U & (~ (IData)(vlSelf->__VactDidInit))))) {
        vlSelf->__VactDidInit = 1U;
        vlSelf->__VactTriggered.at(3U) = 1U;
    }
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vco_sim_registered_in_and_out_mult_dsp19x2___024root___dump_triggers__act(vlSelf);
    }
#endif
}
