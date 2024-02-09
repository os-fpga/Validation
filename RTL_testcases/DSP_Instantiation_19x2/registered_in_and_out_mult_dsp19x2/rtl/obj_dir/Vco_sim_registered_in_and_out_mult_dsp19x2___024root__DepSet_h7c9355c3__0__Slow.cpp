// Verilated -*- SystemC -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vco_sim_registered_in_and_out_mult_dsp19x2.h for the primary calling header

#include "verilated.h"

#include "Vco_sim_registered_in_and_out_mult_dsp19x2___024root.h"

VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_static__TOP(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf);

VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_static(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_static\n"); );
    // Body
    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_static__TOP(vlSelf);
    vlSelf->__Vm_traceActivity[3U] = 1U;
    vlSelf->__Vm_traceActivity[2U] = 1U;
    vlSelf->__Vm_traceActivity[1U] = 1U;
    vlSelf->__Vm_traceActivity[0U] = 1U;
}

VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_static__TOP(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_static__TOP\n"); );
    // Body
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mismatch = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__subtract_reg = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_reg = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__feedback_reg = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_reg1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_reg2 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_reg1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_reg2 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_reg1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_reg2 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__load_acc_reg = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_reg = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_reg = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b1_reg = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b2_reg = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_a_reg = 1U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_b_reg = 1U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__subtract_int = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__feedback_int = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_int = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_int = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_int = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__load_acc_int = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b1_int = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b2_int = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_a_int = 1U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_b_int = 1U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__accumulator = 0ULL;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__add_sub_in = 0ULL;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out = 0ULL;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out2 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__add_sub_out = 0ULL;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__pre_shift = 0ULL;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_f0 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_f1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f0 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_f0 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_f1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out = 0ULL;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out_reg = 0ULL;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__dly_b1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__dly_b2 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a2 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b2 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__subtract_reg = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_reg = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__feedback_reg = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_reg1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_reg2 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_reg1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_reg2 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_reg1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_reg2 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__load_acc_reg = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_reg = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_reg = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b1_reg = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b2_reg = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_a_reg = 1U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_b_reg = 1U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__subtract_int = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__feedback_int = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_int = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_int = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_int = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__load_acc_int = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b1_int = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b2_int = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_a_int = 1U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_b_int = 1U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__accumulator = 0ULL;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__add_sub_in = 0ULL;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out = 0ULL;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out2 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__add_sub_out = 0ULL;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__pre_shift = 0ULL;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_f0 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_f1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f0 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_f0 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_f1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out = 0ULL;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out_reg = 0ULL;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__dly_b1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__dly_b2 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a2 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b2 = 0U;
}

VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_initial__TOP(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf);
VL_ATTR_COLD VlCoroutine Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_initial__TOP__0(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf);
VL_ATTR_COLD VlCoroutine Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_initial__TOP__1(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf);
VlCoroutine Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_initial__TOP__2(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf);

VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_initial(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_initial\n"); );
    // Body
    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_initial__TOP(vlSelf);
    vlSelf->__Vm_traceActivity[1U] = 1U;
    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_initial__TOP__0(vlSelf);
    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_initial__TOP__1(vlSelf);
    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_initial__TOP__2(vlSelf);
    vlSelf->__Vtrigrprev__TOP__co_sim_registered_in_and_out_mult_dsp19x2__DOT__clk 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__clk;
    vlSelf->__Vtrigrprev__TOP__co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset;
    vlSelf->__Vtrigrprev__TOP__co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT____Vcellinp__DSP_inst__ACC_FIR 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT____Vcellinp__DSP_inst__ACC_FIR;
}

VL_ATTR_COLD VlCoroutine Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_initial__TOP__0(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_initial__TOP__0\n"); );
    // Body
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__clk = 0U;
    while (1U) {
        co_await vlSelf->__VdlySched.delay(5U, "/nfs_scratch/scratch/AE/saad/New_primitives_test_cases/Cloned_latest/Compiler_Validation/RTL_testcases/DSP_Instantiation_19x2/RTLvsNetlist_Passed/registered_in_and_out_mult_dsp19x2/sim/co_sim_tb/co_sim_registered_in_and_out_mult_dsp19x2.v", 18);
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__clk 
            = (1U & (~ (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__clk)));
    }
}

VL_ATTR_COLD VlCoroutine Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_initial__TOP__1(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_initial__TOP__1\n"); );
    // Init
    IData/*31:0*/ co_sim_registered_in_and_out_mult_dsp19x2__DOT____Vrepeat0;
    // Body
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__a = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__b = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__expected_out = 0ULL;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mult1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mult2 = 0U;
    VL_WRITEF("\n\n*** Random Functionality Tests for multiplier with signed inputs are applied***\n\n\n");
    co_sim_registered_in_and_out_mult_dsp19x2__DOT____Vrepeat0 = 0x1f4U;
    while (VL_LTS_III(32, 0U, co_sim_registered_in_and_out_mult_dsp19x2__DOT____Vrepeat0)) {
        co_await vlSelf->__VtrigSched_h587bfce9__0.trigger("@(negedge co_sim_registered_in_and_out_mult_dsp19x2.clk)", "/nfs_scratch/scratch/AE/saad/New_primitives_test_cases/Cloned_latest/Compiler_Validation/RTL_testcases/DSP_Instantiation_19x2/RTLvsNetlist_Passed/registered_in_and_out_mult_dsp19x2/sim/co_sim_tb/co_sim_registered_in_and_out_mult_dsp19x2.v", 25);
        vlSelf->__Vm_traceActivity[2U] = 1U;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__a 
            = (0xfffffU & VL_RANDOM_I());
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__b 
            = (0x3ffffU & VL_RANDOM_I());
        co_await vlSelf->__VtrigSched_h587bfce9__0.trigger("@(negedge co_sim_registered_in_and_out_mult_dsp19x2.clk)", "/nfs_scratch/scratch/AE/saad/New_primitives_test_cases/Cloned_latest/Compiler_Validation/RTL_testcases/DSP_Instantiation_19x2/RTLvsNetlist_Passed/registered_in_and_out_mult_dsp19x2/sim/co_sim_tb/co_sim_registered_in_and_out_mult_dsp19x2.v", 28);
        vlSelf->__Vm_traceActivity[2U] = 1U;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mult1 
            = VL_MULS_III(32, VL_EXTENDS_II(32,10, 
                                            (0x3ffU 
                                             & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__a)), 
                          VL_EXTENDS_II(32,9, (0x1ffU 
                                               & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__b)));
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mult2 
            = VL_MULS_III(32, VL_EXTENDS_II(32,10, 
                                            (0x3ffU 
                                             & (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__a 
                                                >> 0xaU))), 
                          VL_EXTENDS_II(32,9, (0x1ffU 
                                               & (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__b 
                                                  >> 9U))));
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__expected_out 
            = (((QData)((IData)((0x7ffffU & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mult2))) 
                << 0x13U) | (QData)((IData)((0x7ffffU 
                                             & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mult1))));
        co_await vlSelf->__VtrigSched_h587bfce9__0.trigger("@(negedge co_sim_registered_in_and_out_mult_dsp19x2.clk)", "/nfs_scratch/scratch/AE/saad/New_primitives_test_cases/Cloned_latest/Compiler_Validation/RTL_testcases/DSP_Instantiation_19x2/RTLvsNetlist_Passed/registered_in_and_out_mult_dsp19x2/sim/co_sim_tb/co_sim_registered_in_and_out_mult_dsp19x2.v", 32);
        vlSelf->__Vm_traceActivity[2U] = 1U;
        VL_WRITEF("%20#  Test stimulus is: a=%0d, b=%0d\n",
                  64,VL_TIME_UNITED_Q(1),20,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__a,
                  18,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__b);
        if ((((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out_reg 
               != vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out_reg) 
              | (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out_reg 
                 != vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__expected_out)) 
             | (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out_reg 
                != vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__expected_out))) {
            VL_WRITEF("Data Mismatch. Golden instantiated mult: %0d, Netlist instantiated mult: %0d, Expected output mult: %0d,  Time: %0t\n",
                      38,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out_reg,
                      38,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out_reg,
                      38,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__expected_out,
                      64,VL_TIME_UNITED_Q(1),-12);
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mismatch 
                = ((IData)(1U) + vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mismatch);
        } else {
            VL_WRITEF("Data Matched. Golden instantiated mult: %0d, Netlist instantiated mult: %0d, Expected output mult: %0d,  Time: %0t\n",
                      38,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out_reg,
                      38,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out_reg,
                      38,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__expected_out,
                      64,VL_TIME_UNITED_Q(1),-12);
        }
        co_sim_registered_in_and_out_mult_dsp19x2__DOT____Vrepeat0 
            = (co_sim_registered_in_and_out_mult_dsp19x2__DOT____Vrepeat0 
               - (IData)(1U));
    }
    VL_WRITEF("\n\n***Random Functionality Tests for multiplier with signed inputs are ended***\n\n\n");
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset = 1U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__expected_out = 0ULL;
    VL_WRITEF("\n\n***Reset Test is applied***\n\n\n");
    VL_WRITEF("%20#  Test stimulus is: a=%0d, b=%0d\n",
              64,VL_TIME_UNITED_Q(1),20,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__a,
              18,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__b);
    co_await vlSelf->__VtrigSched_h587bfce9__0.trigger("@(negedge co_sim_registered_in_and_out_mult_dsp19x2.clk)", "/nfs_scratch/scratch/AE/saad/New_primitives_test_cases/Cloned_latest/Compiler_Validation/RTL_testcases/DSP_Instantiation_19x2/RTLvsNetlist_Passed/registered_in_and_out_mult_dsp19x2/sim/co_sim_tb/co_sim_registered_in_and_out_mult_dsp19x2.v", 42);
    vlSelf->__Vm_traceActivity[2U] = 1U;
    co_await vlSelf->__VtrigSched_h587bfce9__0.trigger("@(negedge co_sim_registered_in_and_out_mult_dsp19x2.clk)", "/nfs_scratch/scratch/AE/saad/New_primitives_test_cases/Cloned_latest/Compiler_Validation/RTL_testcases/DSP_Instantiation_19x2/RTLvsNetlist_Passed/registered_in_and_out_mult_dsp19x2/sim/co_sim_tb/co_sim_registered_in_and_out_mult_dsp19x2.v", 43);
    vlSelf->__Vm_traceActivity[2U] = 1U;
    if ((((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out_reg 
           != vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out_reg) 
          | (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out_reg 
             != vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__expected_out)) 
         | (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out_reg 
            != vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__expected_out))) {
        VL_WRITEF("Data Mismatch. Golden instantiated mult: %0d, Netlist instantiated mult: %0d, Expected output mult: %0d,  Time: %0t\n",
                  38,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out_reg,
                  38,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out_reg,
                  38,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__expected_out,
                  64,VL_TIME_UNITED_Q(1),-12);
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mismatch 
            = ((IData)(1U) + vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mismatch);
    } else {
        VL_WRITEF("Data Matched. Golden instantiated mult: %0d, Netlist instantiated mult: %0d, Expected output mult: %0d,  Time: %0t\n",
                  38,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out_reg,
                  38,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out_reg,
                  38,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__expected_out,
                  64,VL_TIME_UNITED_Q(1),-12);
    }
    VL_WRITEF("\n\n***Reset Test is ended***\n\n\n\n\n***Directed Functionality Test for multiplier is applied***\n\n\n");
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset = 0U;
    co_await vlSelf->__VtrigSched_h587bfce9__0.trigger("@(negedge co_sim_registered_in_and_out_mult_dsp19x2.clk)", "/nfs_scratch/scratch/AE/saad/New_primitives_test_cases/Cloned_latest/Compiler_Validation/RTL_testcases/DSP_Instantiation_19x2/RTLvsNetlist_Passed/registered_in_and_out_mult_dsp19x2/sim/co_sim_tb/co_sim_registered_in_and_out_mult_dsp19x2.v", 49);
    vlSelf->__Vm_traceActivity[2U] = 1U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__a = 0xfffffU;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__b = 0x3ffffU;
    co_await vlSelf->__VtrigSched_h587bfce9__0.trigger("@(negedge co_sim_registered_in_and_out_mult_dsp19x2.clk)", "/nfs_scratch/scratch/AE/saad/New_primitives_test_cases/Cloned_latest/Compiler_Validation/RTL_testcases/DSP_Instantiation_19x2/RTLvsNetlist_Passed/registered_in_and_out_mult_dsp19x2/sim/co_sim_tb/co_sim_registered_in_and_out_mult_dsp19x2.v", 52);
    vlSelf->__Vm_traceActivity[2U] = 1U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mult1 
        = VL_MULS_III(32, VL_EXTENDS_II(32,10, (0x3ffU 
                                                & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__a)), 
                      VL_EXTENDS_II(32,9, (0x1ffU & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__b)));
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mult2 
        = VL_MULS_III(32, VL_EXTENDS_II(32,10, (0x3ffU 
                                                & (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__a 
                                                   >> 0xaU))), 
                      VL_EXTENDS_II(32,9, (0x1ffU & 
                                           (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__b 
                                            >> 9U))));
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__expected_out 
        = (((QData)((IData)((0x7ffffU & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mult2))) 
            << 0x13U) | (QData)((IData)((0x7ffffU & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mult1))));
    co_await vlSelf->__VtrigSched_h587bfce9__0.trigger("@(negedge co_sim_registered_in_and_out_mult_dsp19x2.clk)", "/nfs_scratch/scratch/AE/saad/New_primitives_test_cases/Cloned_latest/Compiler_Validation/RTL_testcases/DSP_Instantiation_19x2/RTLvsNetlist_Passed/registered_in_and_out_mult_dsp19x2/sim/co_sim_tb/co_sim_registered_in_and_out_mult_dsp19x2.v", 56);
    vlSelf->__Vm_traceActivity[2U] = 1U;
    VL_WRITEF("%20#  Test stimulus is: a=%0d, b=%0d\n",
              64,VL_TIME_UNITED_Q(1),20,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__a,
              18,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__b);
    if ((((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out_reg 
           != vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out_reg) 
          | (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out_reg 
             != vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__expected_out)) 
         | (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out_reg 
            != vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__expected_out))) {
        VL_WRITEF("Data Mismatch. Golden instantiated mult: %0d, Netlist instantiated mult: %0d, Expected output mult: %0d,  Time: %0t\n",
                  38,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out_reg,
                  38,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out_reg,
                  38,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__expected_out,
                  64,VL_TIME_UNITED_Q(1),-12);
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mismatch 
            = ((IData)(1U) + vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mismatch);
    } else {
        VL_WRITEF("Data Matched. Golden instantiated mult: %0d, Netlist instantiated mult: %0d, Expected output mult: %0d,  Time: %0t\n",
                  38,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out_reg,
                  38,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out_reg,
                  38,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__expected_out,
                  64,VL_TIME_UNITED_Q(1),-12);
    }
    VL_WRITEF("\n\n***Directed Functionality Test for multiplier is ended***\n\n\n");
    co_await vlSelf->__VdlySched.delay(0x64U, "/nfs_scratch/scratch/AE/saad/New_primitives_test_cases/Cloned_latest/Compiler_Validation/RTL_testcases/DSP_Instantiation_19x2/RTLvsNetlist_Passed/registered_in_and_out_mult_dsp19x2/sim/co_sim_tb/co_sim_registered_in_and_out_mult_dsp19x2.v", 60);
    vlSelf->__Vm_traceActivity[2U] = 1U;
    if ((0U == vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mismatch)) {
        VL_WRITEF("\n**** All Comparison Matched ***\nSimulation Passed\n");
    } else {
        VL_WRITEF("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed\n",
                  32,vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mismatch);
    }
    VL_FINISH_MT("/nfs_scratch/scratch/AE/saad/New_primitives_test_cases/Cloned_latest/Compiler_Validation/RTL_testcases/DSP_Instantiation_19x2/RTLvsNetlist_Passed/registered_in_and_out_mult_dsp19x2/sim/co_sim_tb/co_sim_registered_in_and_out_mult_dsp19x2.v", 65, "");
    vlSelf->__Vm_traceActivity[2U] = 1U;
}

VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_final(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_final\n"); );
}

VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_triggers__stl(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___dump_triggers__stl(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf);
#endif  // VL_DEBUG
VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_stl(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf);

VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_settle(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_settle\n"); );
    // Init
    CData/*0:0*/ __VstlContinue;
    // Body
    vlSelf->__VstlIterCount = 0U;
    __VstlContinue = 1U;
    while (__VstlContinue) {
        __VstlContinue = 0U;
        Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_triggers__stl(vlSelf);
        if (vlSelf->__VstlTriggered.any()) {
            __VstlContinue = 1U;
            if ((0x64U < vlSelf->__VstlIterCount)) {
#ifdef VL_DEBUG
                Vco_sim_registered_in_and_out_mult_dsp19x2___024root___dump_triggers__stl(vlSelf);
#endif
                VL_FATAL_MT("/nfs_scratch/scratch/AE/saad/New_primitives_test_cases/Cloned_latest/Compiler_Validation/RTL_testcases/DSP_Instantiation_19x2/RTLvsNetlist_Passed/registered_in_and_out_mult_dsp19x2/sim/co_sim_tb/co_sim_registered_in_and_out_mult_dsp19x2.v", 1, "", "Settle region did not converge.");
            }
            vlSelf->__VstlIterCount = ((IData)(1U) 
                                       + vlSelf->__VstlIterCount);
            Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_stl(vlSelf);
        }
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___dump_triggers__stl(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___dump_triggers__stl\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VstlTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if (vlSelf->__VstlTriggered.at(0U)) {
        VL_DBG_MSGF("         'stl' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___stl_sequent__TOP__0(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___stl_sequent__TOP__0\n"); );
    // Body
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__load_acc_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__load_acc_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__load_acc_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__load_acc_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT____Vcellinp__DSP_inst__ACC_FIR 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__ACC_FIR;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_reg1;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_reg1;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_reg1;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_reg1;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_reg1;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_reg1;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__subtract_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__subtract_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__subtract_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__subtract_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b1_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b1_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b2_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b2_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b1_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b1_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b2_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b2_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_b_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_b_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_b_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_b_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_a_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_a_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_a_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_a_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__feedback_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__feedback_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__feedback_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__feedback_reg;
    if ((4U & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__feedback_int))) {
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__add_sub_in 
            = ((2U & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__feedback_int))
                ? ((1U & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__feedback_int))
                    ? ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_a_int)
                        ? (((QData)((IData)(((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int) 
                                             << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int)))) 
                            << 0x20U) | (QData)((IData)(
                                                        ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int) 
                                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int)))))
                        : (((QData)((IData)(((((- (IData)(
                                                          (1U 
                                                           & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int) 
                                                              >> 9U)))) 
                                               << 0xaU) 
                                              | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int)) 
                                             << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int)))) 
                            << 0x20U) | (QData)((IData)(
                                                        ((((- (IData)(
                                                                      (1U 
                                                                       & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int) 
                                                                          >> 9U)))) 
                                                           << 0xaU) 
                                                          | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int)) 
                                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int))))))
                    : ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_a_int)
                        ? (((QData)((IData)(((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int) 
                                             << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int)))) 
                            << 0x20U) | (QData)((IData)(
                                                        ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int) 
                                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int)))))
                        : (((QData)((IData)(((((- (IData)(
                                                          (1U 
                                                           & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int) 
                                                              >> 9U)))) 
                                               << 0xaU) 
                                              | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int)) 
                                             << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int)))) 
                            << 0x20U) | (QData)((IData)(
                                                        ((((- (IData)(
                                                                      (1U 
                                                                       & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int) 
                                                                          >> 9U)))) 
                                                           << 0xaU) 
                                                          | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int)) 
                                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int)))))))
                : ((1U & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__feedback_int))
                    ? ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_a_int)
                        ? (((QData)((IData)(((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int) 
                                             << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int)))) 
                            << 0x20U) | (QData)((IData)(
                                                        ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int) 
                                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int)))))
                        : (((QData)((IData)(((((- (IData)(
                                                          (1U 
                                                           & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int) 
                                                              >> 9U)))) 
                                               << 0xaU) 
                                              | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int)) 
                                             << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int)))) 
                            << 0x20U) | (QData)((IData)(
                                                        ((((- (IData)(
                                                                      (1U 
                                                                       & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int) 
                                                                          >> 9U)))) 
                                                           << 0xaU) 
                                                          | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int)) 
                                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int))))))
                    : ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_a_int)
                        ? (((QData)((IData)(((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int) 
                                             << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int)))) 
                            << 0x20U) | (QData)((IData)(
                                                        ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int) 
                                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int)))))
                        : (((QData)((IData)(((((- (IData)(
                                                          (1U 
                                                           & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int) 
                                                              >> 9U)))) 
                                               << 0xaU) 
                                              | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int)) 
                                             << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int)))) 
                            << 0x20U) | (QData)((IData)(
                                                        ((((- (IData)(
                                                                      (1U 
                                                                       & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int) 
                                                                          >> 9U)))) 
                                                           << 0xaU) 
                                                          | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int)) 
                                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int))))))));
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b1 
            = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b1_int;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b2 
            = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b2_int;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a1 = 0U;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a2 = 0U;
    } else if ((2U & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__feedback_int))) {
        if ((1U & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__feedback_int))) {
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__add_sub_in 
                = ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_a_int)
                    ? (((QData)((IData)(((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int) 
                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int)))) 
                        << 0x20U) | (QData)((IData)(
                                                    ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int) 
                                                     << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int)))))
                    : (((QData)((IData)(((((- (IData)(
                                                      (1U 
                                                       & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int) 
                                                          >> 9U)))) 
                                           << 0xaU) 
                                          | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int)) 
                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int)))) 
                        << 0x20U) | (QData)((IData)(
                                                    ((((- (IData)(
                                                                  (1U 
                                                                   & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int) 
                                                                      >> 9U)))) 
                                                       << 0xaU) 
                                                      | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int)) 
                                                     << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int))))));
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b1 
                = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b1_int;
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b2 
                = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b2_int;
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a1 
                = (0x3ffU & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__accumulator));
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a2 
                = (0x3ffU & (IData)((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__accumulator 
                                     >> 0x20U)));
        } else {
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__add_sub_in 
                = ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_a_int)
                    ? (((QData)((IData)(((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int) 
                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int)))) 
                        << 0x20U) | (QData)((IData)(
                                                    ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int) 
                                                     << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int)))))
                    : (((QData)((IData)(((((- (IData)(
                                                      (1U 
                                                       & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int) 
                                                          >> 9U)))) 
                                           << 0xaU) 
                                          | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int)) 
                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int)))) 
                        << 0x20U) | (QData)((IData)(
                                                    ((((- (IData)(
                                                                  (1U 
                                                                   & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int) 
                                                                      >> 9U)))) 
                                                       << 0xaU) 
                                                      | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int)) 
                                                     << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int))))));
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b1 = 0U;
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b2 = 0U;
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a1 
                = (0x3ffU & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int));
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a2 
                = (0x3ffU & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int));
        }
    } else {
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__add_sub_in 
            = ((1U & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__feedback_int))
                ? 0ULL : vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__accumulator);
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b1 
            = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b1_int;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b2 
            = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b2_int;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a1 
            = (0x3ffU & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int));
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a2 
            = (0x3ffU & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int));
    }
    if ((4U & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__feedback_int))) {
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__add_sub_in 
            = ((2U & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__feedback_int))
                ? ((1U & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__feedback_int))
                    ? ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_a_int)
                        ? (((QData)((IData)(((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int) 
                                             << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int)))) 
                            << 0x20U) | (QData)((IData)(
                                                        ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int) 
                                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int)))))
                        : (((QData)((IData)(((((- (IData)(
                                                          (1U 
                                                           & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int) 
                                                              >> 9U)))) 
                                               << 0xaU) 
                                              | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int)) 
                                             << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int)))) 
                            << 0x20U) | (QData)((IData)(
                                                        ((((- (IData)(
                                                                      (1U 
                                                                       & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int) 
                                                                          >> 9U)))) 
                                                           << 0xaU) 
                                                          | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int)) 
                                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int))))))
                    : ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_a_int)
                        ? (((QData)((IData)(((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int) 
                                             << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int)))) 
                            << 0x20U) | (QData)((IData)(
                                                        ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int) 
                                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int)))))
                        : (((QData)((IData)(((((- (IData)(
                                                          (1U 
                                                           & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int) 
                                                              >> 9U)))) 
                                               << 0xaU) 
                                              | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int)) 
                                             << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int)))) 
                            << 0x20U) | (QData)((IData)(
                                                        ((((- (IData)(
                                                                      (1U 
                                                                       & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int) 
                                                                          >> 9U)))) 
                                                           << 0xaU) 
                                                          | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int)) 
                                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int)))))))
                : ((1U & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__feedback_int))
                    ? ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_a_int)
                        ? (((QData)((IData)(((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int) 
                                             << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int)))) 
                            << 0x20U) | (QData)((IData)(
                                                        ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int) 
                                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int)))))
                        : (((QData)((IData)(((((- (IData)(
                                                          (1U 
                                                           & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int) 
                                                              >> 9U)))) 
                                               << 0xaU) 
                                              | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int)) 
                                             << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int)))) 
                            << 0x20U) | (QData)((IData)(
                                                        ((((- (IData)(
                                                                      (1U 
                                                                       & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int) 
                                                                          >> 9U)))) 
                                                           << 0xaU) 
                                                          | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int)) 
                                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int))))))
                    : ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_a_int)
                        ? (((QData)((IData)(((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int) 
                                             << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int)))) 
                            << 0x20U) | (QData)((IData)(
                                                        ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int) 
                                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int)))))
                        : (((QData)((IData)(((((- (IData)(
                                                          (1U 
                                                           & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int) 
                                                              >> 9U)))) 
                                               << 0xaU) 
                                              | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int)) 
                                             << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int)))) 
                            << 0x20U) | (QData)((IData)(
                                                        ((((- (IData)(
                                                                      (1U 
                                                                       & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int) 
                                                                          >> 9U)))) 
                                                           << 0xaU) 
                                                          | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int)) 
                                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int))))))));
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b1 
            = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b1_int;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b2 
            = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b2_int;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a1 = 0U;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a2 = 0U;
    } else if ((2U & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__feedback_int))) {
        if ((1U & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__feedback_int))) {
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__add_sub_in 
                = ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_a_int)
                    ? (((QData)((IData)(((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int) 
                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int)))) 
                        << 0x20U) | (QData)((IData)(
                                                    ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int) 
                                                     << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int)))))
                    : (((QData)((IData)(((((- (IData)(
                                                      (1U 
                                                       & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int) 
                                                          >> 9U)))) 
                                           << 0xaU) 
                                          | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int)) 
                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int)))) 
                        << 0x20U) | (QData)((IData)(
                                                    ((((- (IData)(
                                                                  (1U 
                                                                   & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int) 
                                                                      >> 9U)))) 
                                                       << 0xaU) 
                                                      | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int)) 
                                                     << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int))))));
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b1 
                = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b1_int;
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b2 
                = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b2_int;
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a1 
                = (0x3ffU & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__accumulator));
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a2 
                = (0x3ffU & (IData)((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__accumulator 
                                     >> 0x20U)));
        } else {
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__add_sub_in 
                = ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_a_int)
                    ? (((QData)((IData)(((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int) 
                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int)))) 
                        << 0x20U) | (QData)((IData)(
                                                    ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int) 
                                                     << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int)))))
                    : (((QData)((IData)(((((- (IData)(
                                                      (1U 
                                                       & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int) 
                                                          >> 9U)))) 
                                           << 0xaU) 
                                          | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int)) 
                                         << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int)))) 
                        << 0x20U) | (QData)((IData)(
                                                    ((((- (IData)(
                                                                  (1U 
                                                                   & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int) 
                                                                      >> 9U)))) 
                                                       << 0xaU) 
                                                      | (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int)) 
                                                     << (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int))))));
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b1 = 0U;
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b2 = 0U;
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a1 
                = (0x3ffU & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int));
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a2 
                = (0x3ffU & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int));
        }
    } else {
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__add_sub_in 
            = ((1U & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__feedback_int))
                ? 0ULL : vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__accumulator);
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b1 
            = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b1_int;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b2 
            = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b2_int;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a1 
            = (0x3ffU & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int));
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a2 
            = (0x3ffU & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int));
    }
    if (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_a_int) {
        if (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_b_int) {
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out1 
                = ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a1) 
                   * (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b1));
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out2 
                = ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a2) 
                   * (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b2));
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out 
                = (((QData)((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out2)) 
                    << 0x20U) | (QData)((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out1)));
        } else {
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out1 
                = VL_MULS_III(32, VL_EXTENDS_II(32,11, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a1)), 
                              VL_EXTENDS_II(32,9, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b1)));
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out2 
                = VL_MULS_III(32, VL_EXTENDS_II(32,11, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a2)), 
                              VL_EXTENDS_II(32,9, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b2)));
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out 
                = (((QData)((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out2)) 
                    << 0x20U) | (QData)((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out1)));
        }
    } else if (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_b_int) {
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out1 
            = VL_MULS_III(32, VL_EXTENDS_II(32,10, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a1)), 
                          VL_EXTENDS_II(32,10, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b1)));
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out2 
            = VL_MULS_III(32, VL_EXTENDS_II(32,10, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a2)), 
                          VL_EXTENDS_II(32,10, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b2)));
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out 
            = (((QData)((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out2)) 
                << 0x20U) | (QData)((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out1)));
    } else {
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out1 
            = VL_MULS_III(32, VL_EXTENDS_II(32,10, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a1)), 
                          VL_EXTENDS_II(32,9, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b1)));
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out2 
            = VL_MULS_III(32, VL_EXTENDS_II(32,10, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a2)), 
                          VL_EXTENDS_II(32,9, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b2)));
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out 
            = (((QData)((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out2)) 
                << 0x20U) | (QData)((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out1)));
    }
    if (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_a_int) {
        if (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_b_int) {
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out1 
                = ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a1) 
                   * (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b1));
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out2 
                = ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a2) 
                   * (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b2));
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out 
                = (((QData)((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out2)) 
                    << 0x20U) | (QData)((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out1)));
        } else {
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out1 
                = VL_MULS_III(32, VL_EXTENDS_II(32,11, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a1)), 
                              VL_EXTENDS_II(32,9, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b1)));
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out2 
                = VL_MULS_III(32, VL_EXTENDS_II(32,11, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a2)), 
                              VL_EXTENDS_II(32,9, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b2)));
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out 
                = (((QData)((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out2)) 
                    << 0x20U) | (QData)((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out1)));
        }
    } else if (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_b_int) {
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out1 
            = VL_MULS_III(32, VL_EXTENDS_II(32,10, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a1)), 
                          VL_EXTENDS_II(32,10, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b1)));
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out2 
            = VL_MULS_III(32, VL_EXTENDS_II(32,10, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a2)), 
                          VL_EXTENDS_II(32,10, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b2)));
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out 
            = (((QData)((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out2)) 
                << 0x20U) | (QData)((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out1)));
    } else {
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out1 
            = VL_MULS_III(32, VL_EXTENDS_II(32,10, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a1)), 
                          VL_EXTENDS_II(32,9, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b1)));
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out2 
            = VL_MULS_III(32, VL_EXTENDS_II(32,10, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a2)), 
                          VL_EXTENDS_II(32,9, (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b2)));
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out 
            = (((QData)((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out2)) 
                << 0x20U) | (QData)((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out1)));
    }
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out 
        = (((QData)((IData)((0x7ffffU & (IData)((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out 
                                                 >> 0x20U))))) 
            << 0x13U) | (QData)((IData)((0x7ffffU & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out)))));
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__add_sub_out 
        = ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__subtract_int)
            ? (((QData)((IData)(((IData)((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__add_sub_in 
                                          >> 0x20U)) 
                                 - (IData)((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out 
                                            >> 0x20U))))) 
                << 0x20U) | (QData)((IData)(((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__add_sub_in) 
                                             - (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out)))))
            : (((QData)((IData)(((IData)((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__add_sub_in 
                                          >> 0x20U)) 
                                 + (IData)((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out 
                                            >> 0x20U))))) 
                << 0x20U) | (QData)((IData)(((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__add_sub_in) 
                                             + (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out))))));
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out 
        = (((QData)((IData)((0x7ffffU & (IData)((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out 
                                                 >> 0x20U))))) 
            << 0x13U) | (QData)((IData)((0x7ffffU & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out)))));
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__add_sub_out 
        = ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__subtract_int)
            ? (((QData)((IData)(((IData)((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__add_sub_in 
                                          >> 0x20U)) 
                                 - (IData)((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out 
                                            >> 0x20U))))) 
                << 0x20U) | (QData)((IData)(((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__add_sub_in) 
                                             - (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out)))))
            : (((QData)((IData)(((IData)((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__add_sub_in 
                                          >> 0x20U)) 
                                 + (IData)((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out 
                                            >> 0x20U))))) 
                << 0x20U) | (QData)((IData)(((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__add_sub_in) 
                                             + (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out))))));
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__pre_shift 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__add_sub_out;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_f0 
        = ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__pre_shift) 
           >> (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_int));
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_f1 
        = ((IData)((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__pre_shift 
                    >> 0x20U)) >> (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_int));
    if (((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_int) 
         & (0U < (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_int)))) {
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f0 
            = ((1U & (IData)((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__pre_shift 
                              >> (0x3fU & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_int) 
                                           - (IData)(1U))))))
                ? ((IData)(1U) + vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_f0)
                : vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_f0);
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f1 
            = ((1U & (IData)((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__pre_shift 
                              >> (0x3fU & ((IData)(0x1fU) 
                                           + (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_int))))))
                ? ((IData)(1U) + vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_f1)
                : vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_f1);
    } else {
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f0 
            = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_f0;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f1 
            = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_f1;
    }
    if (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_int) {
        if (((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_a_int) 
             & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_b_int))) {
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_f0 
                = (VL_GTS_III(32, 0U, vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f0)
                    ? 0U : ((0x7ffffU < vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f0)
                             ? 0x7ffffU : (0x7ffffU 
                                           & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f0)));
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_f1 
                = (VL_GTS_III(32, 0U, vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f1)
                    ? 0U : ((0x7ffffU < vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f1)
                             ? 0x7ffffU : (0x7ffffU 
                                           & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f1)));
        } else {
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_f0 
                = (VL_LTS_III(32, 0x3ffffU, vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f0)
                    ? 0x3ffffU : (VL_GTS_III(32, 0xfffc0000U, vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f0)
                                   ? 0x40000U : (0x7ffffU 
                                                 & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f0)));
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_f1 
                = (VL_LTS_III(32, 0x3ffffU, vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f1)
                    ? 0x3ffffU : (VL_GTS_III(32, 0xfffc0000U, vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f1)
                                   ? 0x40000U : (0x7ffffU 
                                                 & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f1)));
        }
    } else {
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_f0 
            = (0x7ffffU & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f0);
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_f1 
            = (0x7ffffU & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f1);
    }
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__pre_shift 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__add_sub_out;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_f0 
        = ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__pre_shift) 
           >> (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_int));
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_f1 
        = ((IData)((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__pre_shift 
                    >> 0x20U)) >> (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_int));
    if (((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_int) 
         & (0U < (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_int)))) {
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f0 
            = ((1U & (IData)((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__pre_shift 
                              >> (0x3fU & ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_int) 
                                           - (IData)(1U))))))
                ? ((IData)(1U) + vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_f0)
                : vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_f0);
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f1 
            = ((1U & (IData)((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__pre_shift 
                              >> (0x3fU & ((IData)(0x1fU) 
                                           + (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_int))))))
                ? ((IData)(1U) + vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_f1)
                : vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_f1);
    } else {
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f0 
            = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_f0;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f1 
            = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_f1;
    }
    if (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_int) {
        if (((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_a_int) 
             & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_b_int))) {
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_f0 
                = (VL_GTS_III(32, 0U, vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f0)
                    ? 0U : ((0x7ffffU < vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f0)
                             ? 0x7ffffU : (0x7ffffU 
                                           & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f0)));
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_f1 
                = (VL_GTS_III(32, 0U, vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f1)
                    ? 0U : ((0x7ffffU < vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f1)
                             ? 0x7ffffU : (0x7ffffU 
                                           & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f1)));
        } else {
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_f0 
                = (VL_LTS_III(32, 0x3ffffU, vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f0)
                    ? 0x3ffffU : (VL_GTS_III(32, 0xfffc0000U, vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f0)
                                   ? 0x40000U : (0x7ffffU 
                                                 & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f0)));
            vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_f1 
                = (VL_LTS_III(32, 0x3ffffU, vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f1)
                    ? 0x3ffffU : (VL_GTS_III(32, 0xfffc0000U, vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f1)
                                   ? 0x40000U : (0x7ffffU 
                                                 & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f1)));
        }
    } else {
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_f0 
            = (0x7ffffU & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f0);
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_f1 
            = (0x7ffffU & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f1);
    }
}

VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_stl(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_stl\n"); );
    // Body
    if (vlSelf->__VstlTriggered.at(0U)) {
        Vco_sim_registered_in_and_out_mult_dsp19x2___024root___stl_sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[3U] = 1U;
        vlSelf->__Vm_traceActivity[2U] = 1U;
        vlSelf->__Vm_traceActivity[1U] = 1U;
        vlSelf->__Vm_traceActivity[0U] = 1U;
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___dump_triggers__act(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VactTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if (vlSelf->__VactTriggered.at(0U)) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @(posedge co_sim_registered_in_and_out_mult_dsp19x2.clk or posedge co_sim_registered_in_and_out_mult_dsp19x2.reset)\n");
    }
    if (vlSelf->__VactTriggered.at(1U)) {
        VL_DBG_MSGF("         'act' region trigger index 1 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
    if (vlSelf->__VactTriggered.at(2U)) {
        VL_DBG_MSGF("         'act' region trigger index 2 is active: @(negedge co_sim_registered_in_and_out_mult_dsp19x2.clk)\n");
    }
    if (vlSelf->__VactTriggered.at(3U)) {
        VL_DBG_MSGF("         'act' region trigger index 3 is active: @([changed] co_sim_registered_in_and_out_mult_dsp19x2.golden.__Vcellinp__DSP_inst__ACC_FIR)\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___dump_triggers__nba(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___dump_triggers__nba\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VnbaTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if (vlSelf->__VnbaTriggered.at(0U)) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @(posedge co_sim_registered_in_and_out_mult_dsp19x2.clk or posedge co_sim_registered_in_and_out_mult_dsp19x2.reset)\n");
    }
    if (vlSelf->__VnbaTriggered.at(1U)) {
        VL_DBG_MSGF("         'nba' region trigger index 1 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
    if (vlSelf->__VnbaTriggered.at(2U)) {
        VL_DBG_MSGF("         'nba' region trigger index 2 is active: @(negedge co_sim_registered_in_and_out_mult_dsp19x2.clk)\n");
    }
    if (vlSelf->__VnbaTriggered.at(3U)) {
        VL_DBG_MSGF("         'nba' region trigger index 3 is active: @([changed] co_sim_registered_in_and_out_mult_dsp19x2.golden.__Vcellinp__DSP_inst__ACC_FIR)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___ctor_var_reset(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__clk = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__a = VL_RAND_RESET_I(20);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__b = VL_RAND_RESET_I(18);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mult1 = VL_RAND_RESET_I(32);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mult2 = VL_RAND_RESET_I(32);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__expected_out = VL_RAND_RESET_Q(38);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mismatch = VL_RAND_RESET_I(32);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT____Vcellinp__DSP_inst__ACC_FIR = VL_RAND_RESET_I(5);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__ACC_FIR = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__LOAD_ACC = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__SATURATE = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__ROUND = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__SUBTRACT = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__subtract_reg = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_reg = VL_RAND_RESET_I(5);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__feedback_reg = VL_RAND_RESET_I(3);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_reg1 = VL_RAND_RESET_I(5);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_reg2 = VL_RAND_RESET_I(5);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_reg1 = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_reg2 = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_reg1 = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_reg2 = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__load_acc_reg = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_reg = VL_RAND_RESET_I(10);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_reg = VL_RAND_RESET_I(10);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b1_reg = VL_RAND_RESET_I(9);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b2_reg = VL_RAND_RESET_I(9);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_a_reg = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_b_reg = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__subtract_int = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int = VL_RAND_RESET_I(5);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__feedback_int = VL_RAND_RESET_I(3);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_int = VL_RAND_RESET_I(5);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_int = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_int = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__load_acc_int = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int = VL_RAND_RESET_I(10);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int = VL_RAND_RESET_I(10);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b1_int = VL_RAND_RESET_I(9);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b2_int = VL_RAND_RESET_I(9);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_a_int = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_b_int = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__accumulator = VL_RAND_RESET_Q(64);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__add_sub_in = VL_RAND_RESET_Q(64);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out = VL_RAND_RESET_Q(64);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out1 = VL_RAND_RESET_I(32);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out2 = VL_RAND_RESET_I(32);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__add_sub_out = VL_RAND_RESET_Q(64);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__pre_shift = VL_RAND_RESET_Q(64);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_f0 = VL_RAND_RESET_I(32);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_f1 = VL_RAND_RESET_I(32);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f0 = VL_RAND_RESET_I(32);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f1 = VL_RAND_RESET_I(32);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_f0 = VL_RAND_RESET_I(19);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_f1 = VL_RAND_RESET_I(19);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out = VL_RAND_RESET_Q(38);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out_reg = VL_RAND_RESET_Q(38);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__dly_b1 = VL_RAND_RESET_I(9);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__dly_b2 = VL_RAND_RESET_I(9);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a1 = VL_RAND_RESET_I(10);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a2 = VL_RAND_RESET_I(10);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b1 = VL_RAND_RESET_I(9);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b2 = VL_RAND_RESET_I(9);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__subtract_reg = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_reg = VL_RAND_RESET_I(5);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__feedback_reg = VL_RAND_RESET_I(3);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_reg1 = VL_RAND_RESET_I(5);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_reg2 = VL_RAND_RESET_I(5);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_reg1 = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_reg2 = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_reg1 = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_reg2 = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__load_acc_reg = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_reg = VL_RAND_RESET_I(10);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_reg = VL_RAND_RESET_I(10);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b1_reg = VL_RAND_RESET_I(9);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b2_reg = VL_RAND_RESET_I(9);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_a_reg = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_b_reg = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__subtract_int = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int = VL_RAND_RESET_I(5);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__feedback_int = VL_RAND_RESET_I(3);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_int = VL_RAND_RESET_I(5);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_int = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_int = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__load_acc_int = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int = VL_RAND_RESET_I(10);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int = VL_RAND_RESET_I(10);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b1_int = VL_RAND_RESET_I(9);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b2_int = VL_RAND_RESET_I(9);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_a_int = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_b_int = VL_RAND_RESET_I(1);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__accumulator = VL_RAND_RESET_Q(64);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__add_sub_in = VL_RAND_RESET_Q(64);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out = VL_RAND_RESET_Q(64);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out1 = VL_RAND_RESET_I(32);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out2 = VL_RAND_RESET_I(32);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__add_sub_out = VL_RAND_RESET_Q(64);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__pre_shift = VL_RAND_RESET_Q(64);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_f0 = VL_RAND_RESET_I(32);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_f1 = VL_RAND_RESET_I(32);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f0 = VL_RAND_RESET_I(32);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f1 = VL_RAND_RESET_I(32);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_f0 = VL_RAND_RESET_I(19);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_f1 = VL_RAND_RESET_I(19);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out = VL_RAND_RESET_Q(38);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out_reg = VL_RAND_RESET_Q(38);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__dly_b1 = VL_RAND_RESET_I(9);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__dly_b2 = VL_RAND_RESET_I(9);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a1 = VL_RAND_RESET_I(10);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a2 = VL_RAND_RESET_I(10);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b1 = VL_RAND_RESET_I(9);
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b2 = VL_RAND_RESET_I(9);
    vlSelf->__VstlIterCount = 0;
    vlSelf->__Vtrigrprev__TOP__co_sim_registered_in_and_out_mult_dsp19x2__DOT__clk = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigrprev__TOP__co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigrprev__TOP__co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT____Vcellinp__DSP_inst__ACC_FIR = VL_RAND_RESET_I(5);
    vlSelf->__VactDidInit = 0;
    vlSelf->__VactIterCount = 0;
    vlSelf->__VactContinue = 0;
    for (int __Vi0 = 0; __Vi0 < 4; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = 0;
    }
}
