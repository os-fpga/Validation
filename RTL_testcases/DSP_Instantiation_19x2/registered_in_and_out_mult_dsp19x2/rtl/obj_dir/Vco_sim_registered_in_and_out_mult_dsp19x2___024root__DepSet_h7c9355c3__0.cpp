// Verilated -*- SystemC -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vco_sim_registered_in_and_out_mult_dsp19x2.h for the primary calling header

#include "verilated.h"

#include "Vco_sim_registered_in_and_out_mult_dsp19x2___024root.h"

void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_act(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_act\n"); );
}

VL_INLINE_OPT void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___nba_sequent__TOP__0(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___nba_sequent__TOP__0\n"); );
    // Body
    if (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset) {
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__accumulator = 0ULL;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__accumulator = 0ULL;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out_reg = 0ULL;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out_reg = 0ULL;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__dly_b2 = 0U;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__dly_b1 = 0U;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__dly_b2 = 0U;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__dly_b1 = 0U;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_reg = 0U;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_reg2 = 0U;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_reg2 = 0U;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b1_reg = 0U;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b2_reg = 0U;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b1_reg = 0U;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b2_reg = 0U;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_reg = 0U;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_reg = 0U;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_reg = 0U;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_reg = 0U;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__feedback_reg = 0U;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__feedback_reg = 0U;
    } else {
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__accumulator 
            = ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__load_acc_int)
                ? vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__add_sub_out
                : vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__accumulator);
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__accumulator 
            = ((IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__load_acc_int)
                ? vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__add_sub_out
                : vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__accumulator);
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out_reg 
            = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out_reg 
            = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__dly_b2 
            = (0x1ffU & (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__b 
                         >> 9U));
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__dly_b1 
            = (0x1ffU & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__b);
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__dly_b2 
            = (0x1ffU & (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__b 
                         >> 9U));
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__dly_b1 
            = (0x1ffU & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__b);
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_reg 
            = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT____Vcellinp__DSP_inst__ACC_FIR;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_reg2 
            = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_reg1;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_reg2 
            = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_reg1;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b1_reg 
            = (0x1ffU & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__b);
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b2_reg 
            = (0x1ffU & (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__b 
                         >> 9U));
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b1_reg 
            = (0x1ffU & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__b);
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b2_reg 
            = (0x1ffU & (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__b 
                         >> 9U));
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_reg 
            = (0x3ffU & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__a);
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_reg 
            = (0x3ffU & (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__a 
                         >> 0xaU));
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_reg 
            = (0x3ffU & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__a);
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_reg 
            = (0x3ffU & (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__a 
                         >> 0xaU));
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__feedback_reg = 1U;
        vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__feedback_reg = 1U;
    }
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__load_acc_reg = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__subtract_reg = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_reg = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__load_acc_reg 
        = ((~ (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset)) 
           & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__LOAD_ACC));
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__subtract_reg 
        = ((~ (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset)) 
           & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__SUBTRACT));
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_reg2 
        = ((~ (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset)) 
           & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_reg1));
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_reg2 
        = ((~ (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset)) 
           & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_reg1));
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_b_reg 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_b_reg 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_reg2 
        = ((~ (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset)) 
           & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_reg1));
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_reg2 
        = ((~ (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset)) 
           & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_reg1));
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_a_reg 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_a_reg 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__load_acc_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__load_acc_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__subtract_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__subtract_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__load_acc_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__load_acc_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__subtract_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__subtract_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_reg1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_reg1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_reg1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_reg1 = 0U;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b1_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b1_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b2_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b2_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b1_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b1_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b2_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b2_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_b_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_b_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_b_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_b_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_reg1 
        = ((~ (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset)) 
           & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__ROUND));
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_reg1 
        = ((~ (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset)) 
           & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__SATURATE));
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_a_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_a_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_a_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_a_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__feedback_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__feedback_reg;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__feedback_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__feedback_reg;
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
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_reg1;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_reg1;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_reg1;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_reg1;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_reg1;
    vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_int 
        = vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_reg1;
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
}

void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_nba(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_nba\n"); );
    // Body
    if (vlSelf->__VnbaTriggered.at(0U)) {
        Vco_sim_registered_in_and_out_mult_dsp19x2___024root___nba_sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[3U] = 1U;
    }
}

void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_triggers__act(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf);
void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___timing_commit(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___dump_triggers__act(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf);
#endif  // VL_DEBUG
void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___timing_resume(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___dump_triggers__nba(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf);
#endif  // VL_DEBUG

void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval\n"); );
    // Init
    VlTriggerVec<4> __VpreTriggered;
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        __VnbaContinue = 0U;
        vlSelf->__VnbaTriggered.clear();
        vlSelf->__VactIterCount = 0U;
        vlSelf->__VactContinue = 1U;
        while (vlSelf->__VactContinue) {
            vlSelf->__VactContinue = 0U;
            Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_triggers__act(vlSelf);
            Vco_sim_registered_in_and_out_mult_dsp19x2___024root___timing_commit(vlSelf);
            if (vlSelf->__VactTriggered.any()) {
                vlSelf->__VactContinue = 1U;
                if ((0x64U < vlSelf->__VactIterCount)) {
#ifdef VL_DEBUG
                    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___dump_triggers__act(vlSelf);
#endif
                    VL_FATAL_MT("/nfs_scratch/scratch/AE/saad/New_primitives_test_cases/Cloned_latest/Compiler_Validation/RTL_testcases/DSP_Instantiation_19x2/RTLvsNetlist_Passed/registered_in_and_out_mult_dsp19x2/sim/co_sim_tb/co_sim_registered_in_and_out_mult_dsp19x2.v", 1, "", "Active region did not converge.");
                }
                vlSelf->__VactIterCount = ((IData)(1U) 
                                           + vlSelf->__VactIterCount);
                __VpreTriggered.andNot(vlSelf->__VactTriggered, vlSelf->__VnbaTriggered);
                vlSelf->__VnbaTriggered.set(vlSelf->__VactTriggered);
                Vco_sim_registered_in_and_out_mult_dsp19x2___024root___timing_resume(vlSelf);
                Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_act(vlSelf);
            }
        }
        if (vlSelf->__VnbaTriggered.any()) {
            __VnbaContinue = 1U;
            if ((0x64U < __VnbaIterCount)) {
#ifdef VL_DEBUG
                Vco_sim_registered_in_and_out_mult_dsp19x2___024root___dump_triggers__nba(vlSelf);
#endif
                VL_FATAL_MT("/nfs_scratch/scratch/AE/saad/New_primitives_test_cases/Cloned_latest/Compiler_Validation/RTL_testcases/DSP_Instantiation_19x2/RTLvsNetlist_Passed/registered_in_and_out_mult_dsp19x2/sim/co_sim_tb/co_sim_registered_in_and_out_mult_dsp19x2.v", 1, "", "NBA region did not converge.");
            }
            __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
            Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_nba(vlSelf);
        }
    }
}

void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___timing_commit(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___timing_commit\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VactTriggered.at(2U))))) {
        vlSelf->__VtrigSched_h587bfce9__0.commit("@(negedge co_sim_registered_in_and_out_mult_dsp19x2.clk)");
    }
    if ((1U & (~ (IData)(vlSelf->__VactTriggered.at(3U))))) {
        vlSelf->__VtrigSched_hea250c32__0.commit("@([changed] co_sim_registered_in_and_out_mult_dsp19x2.golden.__Vcellinp__DSP_inst__ACC_FIR)");
    }
}

void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___timing_resume(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___timing_resume\n"); );
    // Body
    if (vlSelf->__VactTriggered.at(1U)) {
        vlSelf->__VdlySched.resume();
    }
    if (vlSelf->__VactTriggered.at(2U)) {
        vlSelf->__VtrigSched_h587bfce9__0.resume("@(negedge co_sim_registered_in_and_out_mult_dsp19x2.clk)");
    }
    if (vlSelf->__VactTriggered.at(3U)) {
        vlSelf->__VtrigSched_hea250c32__0.resume("@([changed] co_sim_registered_in_and_out_mult_dsp19x2.golden.__Vcellinp__DSP_inst__ACC_FIR)");
    }
}

#ifdef VL_DEBUG
void Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_debug_assertions(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root___eval_debug_assertions\n"); );
}
#endif  // VL_DEBUG
