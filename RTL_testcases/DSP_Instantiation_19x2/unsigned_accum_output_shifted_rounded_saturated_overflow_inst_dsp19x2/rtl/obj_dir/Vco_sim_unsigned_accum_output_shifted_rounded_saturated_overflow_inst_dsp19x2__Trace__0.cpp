// Verilated -*- SystemC -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_sc.h"
#include "Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__Syms.h"


void Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root__trace_chg_sub_0(Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root* vlSelf, VerilatedVcd::Buffer* bufp);

void Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root__trace_chg_top_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root__trace_chg_top_0\n"); );
    // Init
    Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root*>(voidSelf);
    Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root__trace_chg_sub_0((&vlSymsp->TOP), bufp);
}

void Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root__trace_chg_sub_0(Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root__trace_chg_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 1);
    // Body
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[0U])) {
        bufp->chgCData(oldp+0,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT____Vcellinp__DSP_inst__ACC_FIR),5);
        bufp->chgCData(oldp+1,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int),5);
    }
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[1U])) {
        bufp->chgBit(oldp+2,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__subtract_int));
        bufp->chgCData(oldp+3,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__feedback_int),3);
        bufp->chgBit(oldp+4,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__load_acc_int));
        bufp->chgBit(oldp+5,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_a_int));
        bufp->chgBit(oldp+6,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_b_int));
        bufp->chgBit(oldp+7,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__subtract_int));
        bufp->chgCData(oldp+8,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int),5);
        bufp->chgCData(oldp+9,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__feedback_int),3);
        bufp->chgBit(oldp+10,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__load_acc_int));
        bufp->chgBit(oldp+11,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_a_int));
        bufp->chgBit(oldp+12,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_b_int));
    }
    if (VL_UNLIKELY((vlSelf->__Vm_traceActivity[1U] 
                     | vlSelf->__Vm_traceActivity[2U]))) {
        bufp->chgIData(oldp+13,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__a),20);
        bufp->chgIData(oldp+14,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__b),18);
        bufp->chgCData(oldp+15,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__shift_right),6);
        bufp->chgBit(oldp+16,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__reset));
        bufp->chgQData(oldp+17,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__expected_out),38);
        bufp->chgIData(oldp+19,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__mult1),32);
        bufp->chgIData(oldp+20,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__mult2),32);
        bufp->chgQData(oldp+21,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__expected_out2),64);
        bufp->chgQData(oldp+23,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__mult),64);
        bufp->chgIData(oldp+25,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__expected_out_shifted1),32);
        bufp->chgIData(oldp+26,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__expected_out_shifted2),32);
        bufp->chgIData(oldp+27,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__mismatch),32);
        bufp->chgCData(oldp+28,((0x1fU & (IData)(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__shift_right))),5);
        bufp->chgSData(oldp+29,((0x3ffU & vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__a)),10);
        bufp->chgSData(oldp+30,((0x1ffU & vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__b)),9);
        bufp->chgSData(oldp+31,((0x3ffU & (vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__a 
                                           >> 0xaU))),10);
        bufp->chgSData(oldp+32,((0x1ffU & (vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__b 
                                           >> 9U))),9);
    }
    if (VL_UNLIKELY((vlSelf->__Vm_traceActivity[3U] 
                     | vlSelf->__Vm_traceActivity[5U]))) {
        bufp->chgSData(oldp+33,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int),10);
        bufp->chgSData(oldp+34,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int),10);
        bufp->chgSData(oldp+35,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b1_int),9);
        bufp->chgSData(oldp+36,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b2_int),9);
        bufp->chgSData(oldp+37,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b1),9);
        bufp->chgSData(oldp+38,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b2),9);
        bufp->chgSData(oldp+39,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int),10);
        bufp->chgSData(oldp+40,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int),10);
        bufp->chgSData(oldp+41,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b1_int),9);
        bufp->chgSData(oldp+42,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b2_int),9);
        bufp->chgSData(oldp+43,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b1),9);
        bufp->chgSData(oldp+44,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b2),9);
    }
    if (VL_UNLIKELY((vlSelf->__Vm_traceActivity[3U] 
                     | vlSelf->__Vm_traceActivity[6U]))) {
        bufp->chgQData(oldp+45,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__add_sub_in),64);
        bufp->chgQData(oldp+47,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out),64);
        bufp->chgIData(oldp+49,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out1),32);
        bufp->chgIData(oldp+50,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out2),32);
        bufp->chgQData(oldp+51,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__add_sub_out),64);
        bufp->chgSData(oldp+53,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a1),10);
        bufp->chgSData(oldp+54,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a2),10);
        bufp->chgQData(oldp+55,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__add_sub_in),64);
        bufp->chgQData(oldp+57,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out),64);
        bufp->chgIData(oldp+59,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out1),32);
        bufp->chgIData(oldp+60,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out2),32);
        bufp->chgQData(oldp+61,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__add_sub_out),64);
        bufp->chgSData(oldp+63,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a1),10);
        bufp->chgSData(oldp+64,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a2),10);
    }
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[4U])) {
        bufp->chgQData(oldp+65,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out),38);
        bufp->chgQData(oldp+67,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out),38);
        bufp->chgBit(oldp+69,((1U & (IData)(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__dly_b1))));
        bufp->chgBit(oldp+70,((1U & (IData)(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__dly_b2))));
        bufp->chgIData(oldp+71,((0x7ffffU & (IData)(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out))),19);
        bufp->chgSData(oldp+72,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__dly_b1),9);
        bufp->chgIData(oldp+73,((0x7ffffU & (IData)(
                                                    (vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out 
                                                     >> 0x13U)))),19);
        bufp->chgSData(oldp+74,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__dly_b2),9);
        bufp->chgBit(oldp+75,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__subtract_reg));
        bufp->chgCData(oldp+76,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_reg),5);
        bufp->chgCData(oldp+77,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__feedback_reg),3);
        bufp->chgCData(oldp+78,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_reg1),5);
        bufp->chgCData(oldp+79,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_reg2),5);
        bufp->chgBit(oldp+80,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_reg1));
        bufp->chgBit(oldp+81,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_reg2));
        bufp->chgBit(oldp+82,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_reg1));
        bufp->chgBit(oldp+83,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_reg2));
        bufp->chgBit(oldp+84,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__load_acc_reg));
        bufp->chgSData(oldp+85,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_reg),10);
        bufp->chgSData(oldp+86,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_reg),10);
        bufp->chgSData(oldp+87,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b1_reg),9);
        bufp->chgSData(oldp+88,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b2_reg),9);
        bufp->chgBit(oldp+89,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_a_reg));
        bufp->chgBit(oldp+90,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_b_reg));
        bufp->chgCData(oldp+91,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_int),5);
        bufp->chgBit(oldp+92,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_int));
        bufp->chgBit(oldp+93,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_int));
        bufp->chgQData(oldp+94,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__accumulator),64);
        bufp->chgQData(oldp+96,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__pre_shift),64);
        bufp->chgIData(oldp+98,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_f0),32);
        bufp->chgIData(oldp+99,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_f1),32);
        bufp->chgIData(oldp+100,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f0),32);
        bufp->chgIData(oldp+101,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f1),32);
        bufp->chgIData(oldp+102,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_f0),19);
        bufp->chgIData(oldp+103,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_f1),19);
        bufp->chgQData(oldp+104,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out_reg),38);
        bufp->chgBit(oldp+106,((1U & (IData)(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__dly_b1))));
        bufp->chgBit(oldp+107,((1U & (IData)(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__dly_b2))));
        bufp->chgIData(oldp+108,((0x7ffffU & (IData)(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out))),19);
        bufp->chgSData(oldp+109,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__dly_b1),9);
        bufp->chgIData(oldp+110,((0x7ffffU & (IData)(
                                                     (vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out 
                                                      >> 0x13U)))),19);
        bufp->chgSData(oldp+111,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__dly_b2),9);
        bufp->chgBit(oldp+112,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__subtract_reg));
        bufp->chgCData(oldp+113,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_reg),5);
        bufp->chgCData(oldp+114,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__feedback_reg),3);
        bufp->chgCData(oldp+115,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_reg1),5);
        bufp->chgCData(oldp+116,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_reg2),5);
        bufp->chgBit(oldp+117,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_reg1));
        bufp->chgBit(oldp+118,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_reg2));
        bufp->chgBit(oldp+119,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_reg1));
        bufp->chgBit(oldp+120,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_reg2));
        bufp->chgBit(oldp+121,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__load_acc_reg));
        bufp->chgSData(oldp+122,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_reg),10);
        bufp->chgSData(oldp+123,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_reg),10);
        bufp->chgSData(oldp+124,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b1_reg),9);
        bufp->chgSData(oldp+125,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b2_reg),9);
        bufp->chgBit(oldp+126,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_a_reg));
        bufp->chgBit(oldp+127,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_b_reg));
        bufp->chgCData(oldp+128,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_int),5);
        bufp->chgBit(oldp+129,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_int));
        bufp->chgBit(oldp+130,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_int));
        bufp->chgQData(oldp+131,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__accumulator),64);
        bufp->chgQData(oldp+133,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__pre_shift),64);
        bufp->chgIData(oldp+135,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_f0),32);
        bufp->chgIData(oldp+136,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_f1),32);
        bufp->chgIData(oldp+137,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f0),32);
        bufp->chgIData(oldp+138,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f1),32);
        bufp->chgIData(oldp+139,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_f0),19);
        bufp->chgIData(oldp+140,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_f1),19);
        bufp->chgQData(oldp+141,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out_reg),38);
    }
    bufp->chgBit(oldp+143,(vlSelf->co_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__DOT__clk));
}

void Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root__trace_cleanup\n"); );
    // Init
    Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2___024root*>(voidSelf);
    Vco_sim_unsigned_accum_output_shifted_rounded_saturated_overflow_inst_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    vlSymsp->__Vm_activity = false;
    vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[2U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[3U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[4U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[5U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[6U] = 0U;
}
