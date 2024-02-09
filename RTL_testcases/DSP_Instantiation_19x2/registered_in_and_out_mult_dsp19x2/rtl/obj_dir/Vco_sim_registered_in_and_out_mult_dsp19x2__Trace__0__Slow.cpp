// Verilated -*- SystemC -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_sc.h"
#include "Vco_sim_registered_in_and_out_mult_dsp19x2__Syms.h"


VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root__trace_init_sub__TOP__0(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root__trace_init_sub__TOP__0\n"); );
    // Init
    const int c = vlSymsp->__Vm_baseCode;
    // Body
    tracep->pushNamePrefix("co_sim_registered_in_and_out_mult_dsp19x2 ");
    tracep->declBit(c+136,"clk", false,-1);
    tracep->declBit(c+2,"reset", false,-1);
    tracep->declBus(c+3,"a", false,-1, 19,0);
    tracep->declBus(c+4,"b", false,-1, 17,0);
    tracep->declQuad(c+14,"z_out", false,-1, 37,0);
    tracep->declBus(c+5,"mult1", false,-1, 31,0);
    tracep->declBus(c+6,"mult2", false,-1, 31,0);
    tracep->declQuad(c+7,"expected_out", false,-1, 37,0);
    tracep->declQuad(c+16,"z_out_netlist", false,-1, 37,0);
    tracep->declBus(c+9,"mismatch", false,-1, 31,0);
    tracep->pushNamePrefix("golden ");
    tracep->declBit(c+136,"clk", false,-1);
    tracep->declBit(c+2,"reset", false,-1);
    tracep->declBus(c+3,"a", false,-1, 19,0);
    tracep->declBus(c+4,"b", false,-1, 17,0);
    tracep->declQuad(c+14,"z_out", false,-1, 37,0);
    tracep->declBit(c+18,"DLY_B1", false,-1);
    tracep->declBit(c+19,"DLY_B2", false,-1);
    tracep->declBit(c+137,"ACC_FIR", false,-1);
    tracep->declBit(c+138,"LOAD_ACC", false,-1);
    tracep->declBit(c+139,"SATURATE", false,-1);
    tracep->declBit(c+140,"ROUND", false,-1);
    tracep->declBit(c+141,"SUBTRACT", false,-1);
    tracep->pushNamePrefix("DSP_inst ");
    tracep->declQuad(c+142,"DSP_MODE", false,-1, 63,0);
    tracep->declBus(c+144,"COEFF1_0", false,-1, 9,0);
    tracep->declBus(c+144,"COEFF1_1", false,-1, 9,0);
    tracep->declBus(c+144,"COEFF1_2", false,-1, 9,0);
    tracep->declBus(c+144,"COEFF1_3", false,-1, 9,0);
    tracep->declBus(c+144,"COEFF2_0", false,-1, 9,0);
    tracep->declBus(c+144,"COEFF2_1", false,-1, 9,0);
    tracep->declBus(c+144,"COEFF2_2", false,-1, 9,0);
    tracep->declBus(c+144,"COEFF2_3", false,-1, 9,0);
    tracep->declBus(c+145,"OUTPUT_REG_EN", false,-1, 31,0);
    tracep->declBus(c+145,"INPUT_REG_EN", false,-1, 31,0);
    tracep->declBus(c+10,"A1", false,-1, 9,0);
    tracep->declBus(c+11,"B1", false,-1, 8,0);
    tracep->declBus(c+20,"Z1", false,-1, 18,0);
    tracep->declBus(c+21,"DLY_B1", false,-1, 8,0);
    tracep->declBus(c+12,"A2", false,-1, 9,0);
    tracep->declBus(c+13,"B2", false,-1, 8,0);
    tracep->declBus(c+22,"Z2", false,-1, 18,0);
    tracep->declBus(c+23,"DLY_B2", false,-1, 8,0);
    tracep->declBit(c+136,"CLK", false,-1);
    tracep->declBit(c+2,"RESET", false,-1);
    tracep->declBus(c+1,"ACC_FIR", false,-1, 4,0);
    tracep->declBus(c+146,"FEEDBACK", false,-1, 2,0);
    tracep->declBit(c+138,"LOAD_ACC", false,-1);
    tracep->declBit(c+147,"UNSIGNED_A", false,-1);
    tracep->declBit(c+147,"UNSIGNED_B", false,-1);
    tracep->declBit(c+139,"SATURATE", false,-1);
    tracep->declBus(c+148,"SHIFT_RIGHT", false,-1, 4,0);
    tracep->declBit(c+140,"ROUND", false,-1);
    tracep->declBit(c+141,"SUBTRACT", false,-1);
    tracep->declBit(c+24,"subtract_reg", false,-1);
    tracep->declBus(c+25,"acc_fir_reg", false,-1, 4,0);
    tracep->declBus(c+26,"feedback_reg", false,-1, 2,0);
    tracep->declBus(c+27,"shift_right_reg1", false,-1, 4,0);
    tracep->declBus(c+28,"shift_right_reg2", false,-1, 4,0);
    tracep->declBit(c+29,"round_reg1", false,-1);
    tracep->declBit(c+30,"round_reg2", false,-1);
    tracep->declBit(c+31,"saturate_reg1", false,-1);
    tracep->declBit(c+32,"saturate_reg2", false,-1);
    tracep->declBit(c+33,"load_acc_reg", false,-1);
    tracep->declBus(c+34,"a1_reg", false,-1, 9,0);
    tracep->declBus(c+35,"a2_reg", false,-1, 9,0);
    tracep->declBus(c+36,"b1_reg", false,-1, 8,0);
    tracep->declBus(c+37,"b2_reg", false,-1, 8,0);
    tracep->declBit(c+38,"unsigned_a_reg", false,-1);
    tracep->declBit(c+39,"unsigned_b_reg", false,-1);
    tracep->declBit(c+40,"subtract_int", false,-1);
    tracep->declBus(c+41,"acc_fir_int", false,-1, 4,0);
    tracep->declBus(c+42,"feedback_int", false,-1, 2,0);
    tracep->declBus(c+43,"shift_right_int", false,-1, 4,0);
    tracep->declBit(c+44,"round_int", false,-1);
    tracep->declBit(c+45,"saturate_int", false,-1);
    tracep->declBit(c+46,"load_acc_int", false,-1);
    tracep->declBus(c+47,"a1_int", false,-1, 9,0);
    tracep->declBus(c+48,"a2_int", false,-1, 9,0);
    tracep->declBus(c+49,"b1_int", false,-1, 8,0);
    tracep->declBus(c+50,"b2_int", false,-1, 8,0);
    tracep->declBit(c+51,"unsigned_a_int", false,-1);
    tracep->declBit(c+52,"unsigned_b_int", false,-1);
    tracep->declQuad(c+53,"accumulator", false,-1, 63,0);
    tracep->declQuad(c+55,"add_sub_in", false,-1, 63,0);
    tracep->declQuad(c+57,"mult_out", false,-1, 63,0);
    tracep->declBus(c+59,"mult_out1", false,-1, 31,0);
    tracep->declBus(c+60,"mult_out2", false,-1, 31,0);
    tracep->declQuad(c+61,"add_sub_out", false,-1, 63,0);
    tracep->declQuad(c+63,"pre_shift", false,-1, 63,0);
    tracep->declBus(c+65,"shift_right_f0", false,-1, 31,0);
    tracep->declBus(c+66,"shift_right_f1", false,-1, 31,0);
    tracep->declBus(c+67,"round_f0", false,-1, 31,0);
    tracep->declBus(c+68,"round_f1", false,-1, 31,0);
    tracep->declBus(c+69,"saturate_f0", false,-1, 18,0);
    tracep->declBus(c+70,"saturate_f1", false,-1, 18,0);
    tracep->declQuad(c+71,"z_out", false,-1, 37,0);
    tracep->declQuad(c+14,"z_out_reg", false,-1, 37,0);
    tracep->declBus(c+21,"dly_b1", false,-1, 8,0);
    tracep->declBus(c+23,"dly_b2", false,-1, 8,0);
    tracep->declBus(c+73,"mult_a1", false,-1, 9,0);
    tracep->declBus(c+74,"mult_a2", false,-1, 9,0);
    tracep->declBus(c+75,"mult_b1", false,-1, 8,0);
    tracep->declBus(c+76,"mult_b2", false,-1, 8,0);
    tracep->popNamePrefix(2);
    tracep->pushNamePrefix("netlist ");
    tracep->declBus(c+3,"a", false,-1, 19,0);
    tracep->declBus(c+4,"b", false,-1, 17,0);
    tracep->declBit(c+136,"clk", false,-1);
    tracep->declBit(c+2,"reset", false,-1);
    tracep->declQuad(c+16,"z_out", false,-1, 37,0);
    tracep->declBit(c+77,"DLY_B1", false,-1);
    tracep->declBit(c+78,"DLY_B2", false,-1);
    tracep->pushNamePrefix("DSP_inst ");
    tracep->declQuad(c+142,"DSP_MODE", false,-1, 63,0);
    tracep->declBus(c+144,"COEFF1_0", false,-1, 9,0);
    tracep->declBus(c+144,"COEFF1_1", false,-1, 9,0);
    tracep->declBus(c+144,"COEFF1_2", false,-1, 9,0);
    tracep->declBus(c+144,"COEFF1_3", false,-1, 9,0);
    tracep->declBus(c+144,"COEFF2_0", false,-1, 9,0);
    tracep->declBus(c+144,"COEFF2_1", false,-1, 9,0);
    tracep->declBus(c+144,"COEFF2_2", false,-1, 9,0);
    tracep->declBus(c+144,"COEFF2_3", false,-1, 9,0);
    tracep->declBus(c+145,"OUTPUT_REG_EN", false,-1, 31,0);
    tracep->declBus(c+145,"INPUT_REG_EN", false,-1, 31,0);
    tracep->declBus(c+10,"A1", false,-1, 9,0);
    tracep->declBus(c+11,"B1", false,-1, 8,0);
    tracep->declBus(c+79,"Z1", false,-1, 18,0);
    tracep->declBus(c+80,"DLY_B1", false,-1, 8,0);
    tracep->declBus(c+12,"A2", false,-1, 9,0);
    tracep->declBus(c+13,"B2", false,-1, 8,0);
    tracep->declBus(c+81,"Z2", false,-1, 18,0);
    tracep->declBus(c+82,"DLY_B2", false,-1, 8,0);
    tracep->declBit(c+136,"CLK", false,-1);
    tracep->declBit(c+2,"RESET", false,-1);
    tracep->declBus(c+148,"ACC_FIR", false,-1, 4,0);
    tracep->declBus(c+146,"FEEDBACK", false,-1, 2,0);
    tracep->declBit(c+147,"LOAD_ACC", false,-1);
    tracep->declBit(c+147,"UNSIGNED_A", false,-1);
    tracep->declBit(c+147,"UNSIGNED_B", false,-1);
    tracep->declBit(c+147,"SATURATE", false,-1);
    tracep->declBus(c+148,"SHIFT_RIGHT", false,-1, 4,0);
    tracep->declBit(c+147,"ROUND", false,-1);
    tracep->declBit(c+147,"SUBTRACT", false,-1);
    tracep->declBit(c+83,"subtract_reg", false,-1);
    tracep->declBus(c+84,"acc_fir_reg", false,-1, 4,0);
    tracep->declBus(c+85,"feedback_reg", false,-1, 2,0);
    tracep->declBus(c+86,"shift_right_reg1", false,-1, 4,0);
    tracep->declBus(c+87,"shift_right_reg2", false,-1, 4,0);
    tracep->declBit(c+88,"round_reg1", false,-1);
    tracep->declBit(c+89,"round_reg2", false,-1);
    tracep->declBit(c+90,"saturate_reg1", false,-1);
    tracep->declBit(c+91,"saturate_reg2", false,-1);
    tracep->declBit(c+92,"load_acc_reg", false,-1);
    tracep->declBus(c+93,"a1_reg", false,-1, 9,0);
    tracep->declBus(c+94,"a2_reg", false,-1, 9,0);
    tracep->declBus(c+95,"b1_reg", false,-1, 8,0);
    tracep->declBus(c+96,"b2_reg", false,-1, 8,0);
    tracep->declBit(c+97,"unsigned_a_reg", false,-1);
    tracep->declBit(c+98,"unsigned_b_reg", false,-1);
    tracep->declBit(c+99,"subtract_int", false,-1);
    tracep->declBus(c+100,"acc_fir_int", false,-1, 4,0);
    tracep->declBus(c+101,"feedback_int", false,-1, 2,0);
    tracep->declBus(c+102,"shift_right_int", false,-1, 4,0);
    tracep->declBit(c+103,"round_int", false,-1);
    tracep->declBit(c+104,"saturate_int", false,-1);
    tracep->declBit(c+105,"load_acc_int", false,-1);
    tracep->declBus(c+106,"a1_int", false,-1, 9,0);
    tracep->declBus(c+107,"a2_int", false,-1, 9,0);
    tracep->declBus(c+108,"b1_int", false,-1, 8,0);
    tracep->declBus(c+109,"b2_int", false,-1, 8,0);
    tracep->declBit(c+110,"unsigned_a_int", false,-1);
    tracep->declBit(c+111,"unsigned_b_int", false,-1);
    tracep->declQuad(c+112,"accumulator", false,-1, 63,0);
    tracep->declQuad(c+114,"add_sub_in", false,-1, 63,0);
    tracep->declQuad(c+116,"mult_out", false,-1, 63,0);
    tracep->declBus(c+118,"mult_out1", false,-1, 31,0);
    tracep->declBus(c+119,"mult_out2", false,-1, 31,0);
    tracep->declQuad(c+120,"add_sub_out", false,-1, 63,0);
    tracep->declQuad(c+122,"pre_shift", false,-1, 63,0);
    tracep->declBus(c+124,"shift_right_f0", false,-1, 31,0);
    tracep->declBus(c+125,"shift_right_f1", false,-1, 31,0);
    tracep->declBus(c+126,"round_f0", false,-1, 31,0);
    tracep->declBus(c+127,"round_f1", false,-1, 31,0);
    tracep->declBus(c+128,"saturate_f0", false,-1, 18,0);
    tracep->declBus(c+129,"saturate_f1", false,-1, 18,0);
    tracep->declQuad(c+130,"z_out", false,-1, 37,0);
    tracep->declQuad(c+16,"z_out_reg", false,-1, 37,0);
    tracep->declBus(c+80,"dly_b1", false,-1, 8,0);
    tracep->declBus(c+82,"dly_b2", false,-1, 8,0);
    tracep->declBus(c+132,"mult_a1", false,-1, 9,0);
    tracep->declBus(c+133,"mult_a2", false,-1, 9,0);
    tracep->declBus(c+134,"mult_b1", false,-1, 8,0);
    tracep->declBus(c+135,"mult_b2", false,-1, 8,0);
    tracep->popNamePrefix(3);
}

VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root__trace_init_top(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root__trace_init_top\n"); );
    // Body
    Vco_sim_registered_in_and_out_mult_dsp19x2___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root__trace_full_top_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void Vco_sim_registered_in_and_out_mult_dsp19x2___024root__trace_chg_top_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void Vco_sim_registered_in_and_out_mult_dsp19x2___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/);

VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root__trace_register(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root__trace_register\n"); );
    // Body
    tracep->addFullCb(&Vco_sim_registered_in_and_out_mult_dsp19x2___024root__trace_full_top_0, vlSelf);
    tracep->addChgCb(&Vco_sim_registered_in_and_out_mult_dsp19x2___024root__trace_chg_top_0, vlSelf);
    tracep->addCleanupCb(&Vco_sim_registered_in_and_out_mult_dsp19x2___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root__trace_full_sub_0(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf, VerilatedVcd::Buffer* bufp);

VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root__trace_full_top_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root__trace_full_top_0\n"); );
    // Init
    Vco_sim_registered_in_and_out_mult_dsp19x2___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vco_sim_registered_in_and_out_mult_dsp19x2___024root*>(voidSelf);
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    Vco_sim_registered_in_and_out_mult_dsp19x2___024root__trace_full_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void Vco_sim_registered_in_and_out_mult_dsp19x2___024root__trace_full_sub_0(Vco_sim_registered_in_and_out_mult_dsp19x2___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    Vco_sim_registered_in_and_out_mult_dsp19x2__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vco_sim_registered_in_and_out_mult_dsp19x2___024root__trace_full_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    // Body
    bufp->fullCData(oldp+1,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT____Vcellinp__DSP_inst__ACC_FIR),5);
    bufp->fullBit(oldp+2,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__reset));
    bufp->fullIData(oldp+3,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__a),20);
    bufp->fullIData(oldp+4,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__b),18);
    bufp->fullIData(oldp+5,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mult1),32);
    bufp->fullIData(oldp+6,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mult2),32);
    bufp->fullQData(oldp+7,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__expected_out),38);
    bufp->fullIData(oldp+9,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__mismatch),32);
    bufp->fullSData(oldp+10,((0x3ffU & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__a)),10);
    bufp->fullSData(oldp+11,((0x1ffU & vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__b)),9);
    bufp->fullSData(oldp+12,((0x3ffU & (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__a 
                                        >> 0xaU))),10);
    bufp->fullSData(oldp+13,((0x1ffU & (vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__b 
                                        >> 9U))),9);
    bufp->fullQData(oldp+14,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out_reg),38);
    bufp->fullQData(oldp+16,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out_reg),38);
    bufp->fullBit(oldp+18,((1U & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__dly_b1))));
    bufp->fullBit(oldp+19,((1U & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__dly_b2))));
    bufp->fullIData(oldp+20,((0x7ffffU & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out_reg))),19);
    bufp->fullSData(oldp+21,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__dly_b1),9);
    bufp->fullIData(oldp+22,((0x7ffffU & (IData)((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out_reg 
                                                  >> 0x13U)))),19);
    bufp->fullSData(oldp+23,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__dly_b2),9);
    bufp->fullBit(oldp+24,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__subtract_reg));
    bufp->fullCData(oldp+25,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_reg),5);
    bufp->fullCData(oldp+26,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__feedback_reg),3);
    bufp->fullCData(oldp+27,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_reg1),5);
    bufp->fullCData(oldp+28,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_reg2),5);
    bufp->fullBit(oldp+29,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_reg1));
    bufp->fullBit(oldp+30,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_reg2));
    bufp->fullBit(oldp+31,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_reg1));
    bufp->fullBit(oldp+32,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_reg2));
    bufp->fullBit(oldp+33,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__load_acc_reg));
    bufp->fullSData(oldp+34,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_reg),10);
    bufp->fullSData(oldp+35,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_reg),10);
    bufp->fullSData(oldp+36,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b1_reg),9);
    bufp->fullSData(oldp+37,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b2_reg),9);
    bufp->fullBit(oldp+38,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_a_reg));
    bufp->fullBit(oldp+39,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_b_reg));
    bufp->fullBit(oldp+40,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__subtract_int));
    bufp->fullCData(oldp+41,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__acc_fir_int),5);
    bufp->fullCData(oldp+42,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__feedback_int),3);
    bufp->fullCData(oldp+43,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_int),5);
    bufp->fullBit(oldp+44,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_int));
    bufp->fullBit(oldp+45,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_int));
    bufp->fullBit(oldp+46,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__load_acc_int));
    bufp->fullSData(oldp+47,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a1_int),10);
    bufp->fullSData(oldp+48,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__a2_int),10);
    bufp->fullSData(oldp+49,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b1_int),9);
    bufp->fullSData(oldp+50,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__b2_int),9);
    bufp->fullBit(oldp+51,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_a_int));
    bufp->fullBit(oldp+52,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__unsigned_b_int));
    bufp->fullQData(oldp+53,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__accumulator),64);
    bufp->fullQData(oldp+55,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__add_sub_in),64);
    bufp->fullQData(oldp+57,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out),64);
    bufp->fullIData(oldp+59,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out1),32);
    bufp->fullIData(oldp+60,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_out2),32);
    bufp->fullQData(oldp+61,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__add_sub_out),64);
    bufp->fullQData(oldp+63,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__pre_shift),64);
    bufp->fullIData(oldp+65,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_f0),32);
    bufp->fullIData(oldp+66,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__shift_right_f1),32);
    bufp->fullIData(oldp+67,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f0),32);
    bufp->fullIData(oldp+68,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__round_f1),32);
    bufp->fullIData(oldp+69,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_f0),19);
    bufp->fullIData(oldp+70,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__saturate_f1),19);
    bufp->fullQData(oldp+71,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__z_out),38);
    bufp->fullSData(oldp+73,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a1),10);
    bufp->fullSData(oldp+74,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_a2),10);
    bufp->fullSData(oldp+75,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b1),9);
    bufp->fullSData(oldp+76,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__DSP_inst__DOT__mult_b2),9);
    bufp->fullBit(oldp+77,((1U & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__dly_b1))));
    bufp->fullBit(oldp+78,((1U & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__dly_b2))));
    bufp->fullIData(oldp+79,((0x7ffffU & (IData)(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out_reg))),19);
    bufp->fullSData(oldp+80,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__dly_b1),9);
    bufp->fullIData(oldp+81,((0x7ffffU & (IData)((vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out_reg 
                                                  >> 0x13U)))),19);
    bufp->fullSData(oldp+82,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__dly_b2),9);
    bufp->fullBit(oldp+83,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__subtract_reg));
    bufp->fullCData(oldp+84,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_reg),5);
    bufp->fullCData(oldp+85,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__feedback_reg),3);
    bufp->fullCData(oldp+86,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_reg1),5);
    bufp->fullCData(oldp+87,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_reg2),5);
    bufp->fullBit(oldp+88,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_reg1));
    bufp->fullBit(oldp+89,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_reg2));
    bufp->fullBit(oldp+90,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_reg1));
    bufp->fullBit(oldp+91,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_reg2));
    bufp->fullBit(oldp+92,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__load_acc_reg));
    bufp->fullSData(oldp+93,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_reg),10);
    bufp->fullSData(oldp+94,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_reg),10);
    bufp->fullSData(oldp+95,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b1_reg),9);
    bufp->fullSData(oldp+96,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b2_reg),9);
    bufp->fullBit(oldp+97,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_a_reg));
    bufp->fullBit(oldp+98,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_b_reg));
    bufp->fullBit(oldp+99,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__subtract_int));
    bufp->fullCData(oldp+100,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__acc_fir_int),5);
    bufp->fullCData(oldp+101,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__feedback_int),3);
    bufp->fullCData(oldp+102,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_int),5);
    bufp->fullBit(oldp+103,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_int));
    bufp->fullBit(oldp+104,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_int));
    bufp->fullBit(oldp+105,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__load_acc_int));
    bufp->fullSData(oldp+106,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a1_int),10);
    bufp->fullSData(oldp+107,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__a2_int),10);
    bufp->fullSData(oldp+108,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b1_int),9);
    bufp->fullSData(oldp+109,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__b2_int),9);
    bufp->fullBit(oldp+110,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_a_int));
    bufp->fullBit(oldp+111,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__unsigned_b_int));
    bufp->fullQData(oldp+112,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__accumulator),64);
    bufp->fullQData(oldp+114,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__add_sub_in),64);
    bufp->fullQData(oldp+116,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out),64);
    bufp->fullIData(oldp+118,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out1),32);
    bufp->fullIData(oldp+119,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_out2),32);
    bufp->fullQData(oldp+120,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__add_sub_out),64);
    bufp->fullQData(oldp+122,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__pre_shift),64);
    bufp->fullIData(oldp+124,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_f0),32);
    bufp->fullIData(oldp+125,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__shift_right_f1),32);
    bufp->fullIData(oldp+126,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f0),32);
    bufp->fullIData(oldp+127,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__round_f1),32);
    bufp->fullIData(oldp+128,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_f0),19);
    bufp->fullIData(oldp+129,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__saturate_f1),19);
    bufp->fullQData(oldp+130,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__z_out),38);
    bufp->fullSData(oldp+132,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a1),10);
    bufp->fullSData(oldp+133,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_a2),10);
    bufp->fullSData(oldp+134,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b1),9);
    bufp->fullSData(oldp+135,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__netlist__DOT__DSP_inst__DOT__mult_b2),9);
    bufp->fullBit(oldp+136,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__clk));
    bufp->fullBit(oldp+137,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__ACC_FIR));
    bufp->fullBit(oldp+138,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__LOAD_ACC));
    bufp->fullBit(oldp+139,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__SATURATE));
    bufp->fullBit(oldp+140,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__ROUND));
    bufp->fullBit(oldp+141,(vlSelf->co_sim_registered_in_and_out_mult_dsp19x2__DOT__golden__DOT__SUBTRACT));
    bufp->fullQData(oldp+142,(0x4d554c5449504c59ULL),64);
    bufp->fullSData(oldp+144,(0U),10);
    bufp->fullIData(oldp+145,(0x54525545U),32);
    bufp->fullCData(oldp+146,(1U),3);
    bufp->fullBit(oldp+147,(0U));
    bufp->fullCData(oldp+148,(0U),5);
}
