----------------------------------------------------------------------------- 
-- Altera DSP Builder Advanced Flow Tools Release Version 13.0
-- Quartus II development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2012 Altera Corporation.  All rights reserved.    
-- Your use of  Altera  Corporation's design tools,  logic functions and other 
-- software and tools,  and its AMPP  partner logic functions, and  any output 
-- files  any of the  foregoing  device programming or simulation files),  and 
-- any associated  documentation or information are expressly subject  to  the 
-- terms and conditions  of the Altera Program License Subscription Agreement, 
-- Altera  MegaCore  Function  License  Agreement, or other applicable license 
-- agreement,  including,  without limitation,  that your use  is for the sole 
-- purpose of  programming  logic  devices  manufactured by Altera and sold by 
-- Altera or its authorized  distributors.  Please  refer  to  the  applicable 
-- agreement for further details.
----------------------------------------------------------------------------- 

-- VHDL created from DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24
-- VHDL created on Thu Oct  4 07:10:10 2012


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;
USE work.DirectRFTest_and_DPD_SV_safe_path.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

-- Text written from /data/rkay/daily_build/13.0/38.3/p4/ip/aion/src/mip_common/hw_model.cpp:1242
entity DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24 is
    port (
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        xIn_0 : in std_logic_vector(15 downto 0);
        xIn_1 : in std_logic_vector(15 downto 0);
        xIn_2 : in std_logic_vector(15 downto 0);
        xIn_3 : in std_logic_vector(15 downto 0);
        xIn_4 : in std_logic_vector(15 downto 0);
        xIn_5 : in std_logic_vector(15 downto 0);
        xIn_6 : in std_logic_vector(15 downto 0);
        xIn_7 : in std_logic_vector(15 downto 0);
        xIn_8 : in std_logic_vector(15 downto 0);
        xIn_9 : in std_logic_vector(15 downto 0);
        xIn_10 : in std_logic_vector(15 downto 0);
        xIn_11 : in std_logic_vector(15 downto 0);
        xIn_12 : in std_logic_vector(15 downto 0);
        xIn_13 : in std_logic_vector(15 downto 0);
        xIn_14 : in std_logic_vector(15 downto 0);
        xIn_15 : in std_logic_vector(15 downto 0);
        xOut_v : out std_logic_vector(0 downto 0);
        xOut_c : out std_logic_vector(7 downto 0);
        xOut_0 : out std_logic_vector(33 downto 0);
        xOut_1 : out std_logic_vector(33 downto 0);
        xOut_2 : out std_logic_vector(33 downto 0);
        xOut_3 : out std_logic_vector(33 downto 0);
        xOut_4 : out std_logic_vector(33 downto 0);
        xOut_5 : out std_logic_vector(33 downto 0);
        xOut_6 : out std_logic_vector(33 downto 0);
        xOut_7 : out std_logic_vector(33 downto 0);
        xOut_8 : out std_logic_vector(33 downto 0);
        xOut_9 : out std_logic_vector(33 downto 0);
        xOut_10 : out std_logic_vector(33 downto 0);
        xOut_11 : out std_logic_vector(33 downto 0);
        xOut_12 : out std_logic_vector(33 downto 0);
        xOut_13 : out std_logic_vector(33 downto 0);
        xOut_14 : out std_logic_vector(33 downto 0);
        xOut_15 : out std_logic_vector(33 downto 0);
        xOut_16 : out std_logic_vector(33 downto 0);
        xOut_17 : out std_logic_vector(33 downto 0);
        xOut_18 : out std_logic_vector(33 downto 0);
        xOut_19 : out std_logic_vector(33 downto 0);
        xOut_20 : out std_logic_vector(33 downto 0);
        xOut_21 : out std_logic_vector(33 downto 0);
        xOut_22 : out std_logic_vector(33 downto 0);
        xOut_23 : out std_logic_vector(33 downto 0);
        xOut_24 : out std_logic_vector(33 downto 0);
        xOut_25 : out std_logic_vector(33 downto 0);
        xOut_26 : out std_logic_vector(33 downto 0);
        xOut_27 : out std_logic_vector(33 downto 0);
        xOut_28 : out std_logic_vector(33 downto 0);
        xOut_29 : out std_logic_vector(33 downto 0);
        xOut_30 : out std_logic_vector(33 downto 0);
        xOut_31 : out std_logic_vector(33 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_sel_q_12_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi5_delayr3_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi6_delayr2_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi7_delayr1_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_sym_add0_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_wi0_sym_add0_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_wi0_sym_add0_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_wi0_sym_add0_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_wi7_sym_add1_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_wi7_sym_add1_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_wi7_sym_add1_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_wi7_sym_add1_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_oseq_gated_reg_q : std_logic_vector (0 downto 0);
    signal u1_m0_wo0_wi5_delayr3_q : std_logic_vector (15 downto 0);
    signal u1_m0_wo0_wi6_delayr2_q : std_logic_vector (15 downto 0);
    signal u1_m0_wo0_wi7_delayr1_q : std_logic_vector (15 downto 0);
    signal u1_m0_wo0_wi0_sym_add0_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo0_wi0_sym_add0_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo0_wi0_sym_add0_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo0_wi0_sym_add0_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo0_wi7_sym_add1_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo0_wi7_sym_add1_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo0_wi7_sym_add1_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo0_wi7_sym_add1_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo2_wi0_sym_add0_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo2_wi0_sym_add0_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo2_wi0_sym_add0_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo2_wi0_sym_add0_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo2_wi1_sym_add1_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo2_wi1_sym_add1_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo2_wi1_sym_add1_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo2_wi1_sym_add1_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo2_wi0_sym_add0_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo2_wi0_sym_add0_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo2_wi0_sym_add0_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo2_wi0_sym_add0_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo2_wi1_sym_add1_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo2_wi1_sym_add1_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo2_wi1_sym_add1_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo2_wi1_sym_add1_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo4_wi1_sym_add0_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo4_wi1_sym_add0_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo4_wi1_sym_add0_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo4_wi1_sym_add0_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo4_wi2_sym_add1_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo4_wi2_sym_add1_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo4_wi2_sym_add1_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo4_wi2_sym_add1_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo4_wi1_sym_add0_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo4_wi1_sym_add0_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo4_wi1_sym_add0_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo4_wi1_sym_add0_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo4_wi2_sym_add1_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo4_wi2_sym_add1_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo4_wi2_sym_add1_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo4_wi2_sym_add1_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo6_wi2_sym_add0_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo6_wi2_sym_add0_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo6_wi2_sym_add0_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo6_wi2_sym_add0_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo6_wi3_sym_add1_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo6_wi3_sym_add1_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo6_wi3_sym_add1_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo6_wi3_sym_add1_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo6_wi2_sym_add0_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo6_wi2_sym_add0_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo6_wi2_sym_add0_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo6_wi2_sym_add0_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo6_wi3_sym_add1_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo6_wi3_sym_add1_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo6_wi3_sym_add1_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo6_wi3_sym_add1_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo8_wi3_sym_add0_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo8_wi3_sym_add0_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo8_wi3_sym_add0_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo8_wi3_sym_add0_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo8_wi4_sym_add1_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo8_wi4_sym_add1_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo8_wi4_sym_add1_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo8_wi4_sym_add1_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo8_wi3_sym_add0_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo8_wi3_sym_add0_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo8_wi3_sym_add0_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo8_wi3_sym_add0_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo8_wi4_sym_add1_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo8_wi4_sym_add1_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo8_wi4_sym_add1_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo8_wi4_sym_add1_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo10_wi4_sym_add0_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo10_wi4_sym_add0_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo10_wi4_sym_add0_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo10_wi4_sym_add0_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo10_wi5_sym_add1_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo10_wi5_sym_add1_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo10_wi5_sym_add1_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo10_wi5_sym_add1_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo10_wi4_sym_add0_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo10_wi4_sym_add0_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo10_wi4_sym_add0_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo10_wi4_sym_add0_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo10_wi5_sym_add1_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo10_wi5_sym_add1_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo10_wi5_sym_add1_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo10_wi5_sym_add1_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo12_wi5_sym_add0_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo12_wi5_sym_add0_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo12_wi5_sym_add0_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo12_wi5_sym_add0_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo12_wi6_sym_add1_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo12_wi6_sym_add1_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo12_wi6_sym_add1_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo12_wi6_sym_add1_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo12_wi5_sym_add0_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo12_wi5_sym_add0_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo12_wi5_sym_add0_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo12_wi5_sym_add0_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo12_wi6_sym_add1_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo12_wi6_sym_add1_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo12_wi6_sym_add1_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo12_wi6_sym_add1_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo14_wi6_sym_add0_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo14_wi6_sym_add0_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo14_wi6_sym_add0_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo14_wi6_sym_add0_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo14_wi7_sym_add1_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo14_wi7_sym_add1_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo14_wi7_sym_add1_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo14_wi7_sym_add1_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo14_wi6_sym_add0_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo14_wi6_sym_add0_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo14_wi6_sym_add0_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo14_wi6_sym_add0_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo14_wi7_sym_add1_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo14_wi7_sym_add1_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo14_wi7_sym_add1_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo14_wi7_sym_add1_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_1_a : std_logic_vector(20 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_1_b : std_logic_vector(20 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_1_o : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_1_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_a : std_logic_vector(27 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_b : std_logic_vector(27 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_o : std_logic_vector (27 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_q : std_logic_vector (27 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_1_a : std_logic_vector(20 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_1_b : std_logic_vector(20 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_1_o : std_logic_vector (20 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_1_q : std_logic_vector (20 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(20 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(20 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (20 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(20 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(20 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (20 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (20 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_a : std_logic_vector(27 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_b : std_logic_vector(27 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_o : std_logic_vector (27 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_q : std_logic_vector (27 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(20 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(20 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (20 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult1_sub_1_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult1_sub_1_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult1_sub_1_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult1_sub_1_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(20 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(20 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (20 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (20 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult1_sub_1_a : std_logic_vector(27 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult1_sub_1_b : std_logic_vector(27 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult1_sub_1_o : std_logic_vector (27 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult1_sub_1_q : std_logic_vector (27 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(20 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(20 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (20 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult1_sub_1_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult1_sub_1_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult1_sub_1_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult1_sub_1_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(20 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(20 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (20 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (20 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult1_sub_1_a : std_logic_vector(27 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult1_sub_1_b : std_logic_vector(27 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult1_sub_1_o : std_logic_vector (27 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult1_sub_1_q : std_logic_vector (27 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo8_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(20 downto 0);
    signal u0_m0_wo8_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(20 downto 0);
    signal u0_m0_wo8_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (20 downto 0);
    signal u0_m0_wo8_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo8_mtree_madd2_0_constmult1_sub_1_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo8_mtree_madd2_0_constmult1_sub_1_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo8_mtree_madd2_0_constmult1_sub_1_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo8_mtree_madd2_0_constmult1_sub_1_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo8_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo8_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo8_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo8_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u1_m0_wo8_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(20 downto 0);
    signal u1_m0_wo8_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(20 downto 0);
    signal u1_m0_wo8_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (20 downto 0);
    signal u1_m0_wo8_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (20 downto 0);
    signal u1_m0_wo8_mtree_madd2_0_constmult1_sub_1_a : std_logic_vector(27 downto 0);
    signal u1_m0_wo8_mtree_madd2_0_constmult1_sub_1_b : std_logic_vector(27 downto 0);
    signal u1_m0_wo8_mtree_madd2_0_constmult1_sub_1_o : std_logic_vector (27 downto 0);
    signal u1_m0_wo8_mtree_madd2_0_constmult1_sub_1_q : std_logic_vector (27 downto 0);
    signal u1_m0_wo8_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u1_m0_wo8_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u1_m0_wo8_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u1_m0_wo8_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo10_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(20 downto 0);
    signal u0_m0_wo10_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(20 downto 0);
    signal u0_m0_wo10_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (20 downto 0);
    signal u0_m0_wo10_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo10_mtree_madd2_0_constmult1_sub_1_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo10_mtree_madd2_0_constmult1_sub_1_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo10_mtree_madd2_0_constmult1_sub_1_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo10_mtree_madd2_0_constmult1_sub_1_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo10_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo10_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo10_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo10_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u1_m0_wo10_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(20 downto 0);
    signal u1_m0_wo10_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(20 downto 0);
    signal u1_m0_wo10_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (20 downto 0);
    signal u1_m0_wo10_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (20 downto 0);
    signal u1_m0_wo10_mtree_madd2_0_constmult1_sub_1_a : std_logic_vector(27 downto 0);
    signal u1_m0_wo10_mtree_madd2_0_constmult1_sub_1_b : std_logic_vector(27 downto 0);
    signal u1_m0_wo10_mtree_madd2_0_constmult1_sub_1_o : std_logic_vector (27 downto 0);
    signal u1_m0_wo10_mtree_madd2_0_constmult1_sub_1_q : std_logic_vector (27 downto 0);
    signal u1_m0_wo10_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u1_m0_wo10_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u1_m0_wo10_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u1_m0_wo10_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo12_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(20 downto 0);
    signal u0_m0_wo12_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(20 downto 0);
    signal u0_m0_wo12_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (20 downto 0);
    signal u0_m0_wo12_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo12_mtree_madd2_0_constmult1_sub_1_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo12_mtree_madd2_0_constmult1_sub_1_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo12_mtree_madd2_0_constmult1_sub_1_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo12_mtree_madd2_0_constmult1_sub_1_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo12_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo12_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo12_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo12_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u1_m0_wo12_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(20 downto 0);
    signal u1_m0_wo12_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(20 downto 0);
    signal u1_m0_wo12_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (20 downto 0);
    signal u1_m0_wo12_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (20 downto 0);
    signal u1_m0_wo12_mtree_madd2_0_constmult1_sub_1_a : std_logic_vector(27 downto 0);
    signal u1_m0_wo12_mtree_madd2_0_constmult1_sub_1_b : std_logic_vector(27 downto 0);
    signal u1_m0_wo12_mtree_madd2_0_constmult1_sub_1_o : std_logic_vector (27 downto 0);
    signal u1_m0_wo12_mtree_madd2_0_constmult1_sub_1_q : std_logic_vector (27 downto 0);
    signal u1_m0_wo12_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u1_m0_wo12_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u1_m0_wo12_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u1_m0_wo12_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo14_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(20 downto 0);
    signal u0_m0_wo14_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(20 downto 0);
    signal u0_m0_wo14_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (20 downto 0);
    signal u0_m0_wo14_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo14_mtree_madd2_0_constmult1_sub_1_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo14_mtree_madd2_0_constmult1_sub_1_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo14_mtree_madd2_0_constmult1_sub_1_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo14_mtree_madd2_0_constmult1_sub_1_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo14_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo14_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo14_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo14_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u1_m0_wo14_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(20 downto 0);
    signal u1_m0_wo14_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(20 downto 0);
    signal u1_m0_wo14_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (20 downto 0);
    signal u1_m0_wo14_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (20 downto 0);
    signal u1_m0_wo14_mtree_madd2_0_constmult1_sub_1_a : std_logic_vector(27 downto 0);
    signal u1_m0_wo14_mtree_madd2_0_constmult1_sub_1_b : std_logic_vector(27 downto 0);
    signal u1_m0_wo14_mtree_madd2_0_constmult1_sub_1_o : std_logic_vector (27 downto 0);
    signal u1_m0_wo14_mtree_madd2_0_constmult1_sub_1_q : std_logic_vector (27 downto 0);
    signal u1_m0_wo14_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u1_m0_wo14_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u1_m0_wo14_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u1_m0_wo14_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_mem_reset0 : std_logic;
    signal d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdcnt_i : unsigned(0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_13_cmpReg_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_13_sticky_ena_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_wi7_phasedelay1_q_13_replace_mem_reset0 : std_logic;
    signal d_u0_m0_wo0_wi7_phasedelay1_q_13_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo0_wi7_phasedelay1_q_13_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo0_wi7_phasedelay1_q_13_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo0_wi7_phasedelay1_q_13_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_wi7_phasedelay1_q_13_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_wi7_phasedelay1_q_13_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi0_phasedelay0_q_13_replace_mem_reset0 : std_logic;
    signal d_u1_m0_wo0_wi0_phasedelay0_q_13_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi0_phasedelay0_q_13_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi0_phasedelay0_q_13_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi0_phasedelay0_q_13_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u1_m0_wo0_wi0_phasedelay0_q_13_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u1_m0_wo0_wi0_phasedelay0_q_13_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi7_phasedelay1_q_13_replace_mem_reset0 : std_logic;
    signal d_u1_m0_wo0_wi7_phasedelay1_q_13_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi7_phasedelay1_q_13_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi7_phasedelay1_q_13_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi7_phasedelay1_q_13_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u1_m0_wo0_wi7_phasedelay1_q_13_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u1_m0_wo0_wi7_phasedelay1_q_13_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo2_wi1_phasedelay1_q_13_replace_mem_reset0 : std_logic;
    signal d_u0_m0_wo2_wi1_phasedelay1_q_13_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo2_wi1_phasedelay1_q_13_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo2_wi1_phasedelay1_q_13_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo2_wi1_phasedelay1_q_13_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo2_wi1_phasedelay1_q_13_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo2_wi1_phasedelay1_q_13_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo2_wi1_phasedelay1_q_13_replace_mem_reset0 : std_logic;
    signal d_u1_m0_wo2_wi1_phasedelay1_q_13_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo2_wi1_phasedelay1_q_13_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo2_wi1_phasedelay1_q_13_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo2_wi1_phasedelay1_q_13_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u1_m0_wo2_wi1_phasedelay1_q_13_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u1_m0_wo2_wi1_phasedelay1_q_13_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo4_wi2_phasedelay1_q_13_replace_mem_reset0 : std_logic;
    signal d_u0_m0_wo4_wi2_phasedelay1_q_13_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo4_wi2_phasedelay1_q_13_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo4_wi2_phasedelay1_q_13_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo4_wi2_phasedelay1_q_13_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo4_wi2_phasedelay1_q_13_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo4_wi2_phasedelay1_q_13_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo4_wi2_phasedelay1_q_13_replace_mem_reset0 : std_logic;
    signal d_u1_m0_wo4_wi2_phasedelay1_q_13_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo4_wi2_phasedelay1_q_13_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo4_wi2_phasedelay1_q_13_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo4_wi2_phasedelay1_q_13_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u1_m0_wo4_wi2_phasedelay1_q_13_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u1_m0_wo4_wi2_phasedelay1_q_13_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo6_wi3_phasedelay1_q_13_replace_mem_reset0 : std_logic;
    signal d_u0_m0_wo6_wi3_phasedelay1_q_13_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo6_wi3_phasedelay1_q_13_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo6_wi3_phasedelay1_q_13_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo6_wi3_phasedelay1_q_13_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo6_wi3_phasedelay1_q_13_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo6_wi3_phasedelay1_q_13_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo6_wi3_phasedelay1_q_13_replace_mem_reset0 : std_logic;
    signal d_u1_m0_wo6_wi3_phasedelay1_q_13_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo6_wi3_phasedelay1_q_13_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo6_wi3_phasedelay1_q_13_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo6_wi3_phasedelay1_q_13_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u1_m0_wo6_wi3_phasedelay1_q_13_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u1_m0_wo6_wi3_phasedelay1_q_13_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo8_wi4_phasedelay1_q_13_replace_mem_reset0 : std_logic;
    signal d_u0_m0_wo8_wi4_phasedelay1_q_13_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo8_wi4_phasedelay1_q_13_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo8_wi4_phasedelay1_q_13_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo8_wi4_phasedelay1_q_13_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo8_wi4_phasedelay1_q_13_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo8_wi4_phasedelay1_q_13_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo8_wi4_phasedelay1_q_13_replace_mem_reset0 : std_logic;
    signal d_u1_m0_wo8_wi4_phasedelay1_q_13_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo8_wi4_phasedelay1_q_13_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo8_wi4_phasedelay1_q_13_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo8_wi4_phasedelay1_q_13_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u1_m0_wo8_wi4_phasedelay1_q_13_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u1_m0_wo8_wi4_phasedelay1_q_13_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo10_wi5_phasedelay1_q_13_replace_mem_reset0 : std_logic;
    signal d_u0_m0_wo10_wi5_phasedelay1_q_13_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo10_wi5_phasedelay1_q_13_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo10_wi5_phasedelay1_q_13_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo10_wi5_phasedelay1_q_13_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo10_wi5_phasedelay1_q_13_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo10_wi5_phasedelay1_q_13_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo10_wi5_phasedelay1_q_13_replace_mem_reset0 : std_logic;
    signal d_u1_m0_wo10_wi5_phasedelay1_q_13_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo10_wi5_phasedelay1_q_13_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo10_wi5_phasedelay1_q_13_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo10_wi5_phasedelay1_q_13_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u1_m0_wo10_wi5_phasedelay1_q_13_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u1_m0_wo10_wi5_phasedelay1_q_13_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo12_wi6_phasedelay1_q_13_replace_mem_reset0 : std_logic;
    signal d_u0_m0_wo12_wi6_phasedelay1_q_13_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo12_wi6_phasedelay1_q_13_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo12_wi6_phasedelay1_q_13_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo12_wi6_phasedelay1_q_13_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo12_wi6_phasedelay1_q_13_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo12_wi6_phasedelay1_q_13_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo12_wi6_phasedelay1_q_13_replace_mem_reset0 : std_logic;
    signal d_u1_m0_wo12_wi6_phasedelay1_q_13_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo12_wi6_phasedelay1_q_13_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo12_wi6_phasedelay1_q_13_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo12_wi6_phasedelay1_q_13_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u1_m0_wo12_wi6_phasedelay1_q_13_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u1_m0_wo12_wi6_phasedelay1_q_13_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_13_notEnable_a : std_logic_vector(0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_13_notEnable_q : std_logic_vector(0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_a : std_logic_vector(0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_b : std_logic_vector(0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (26 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (26 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (19 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (26 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (26 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (19 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (19 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (26 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (26 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (19 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (19 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (26 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (26 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (19 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (26 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (26 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (19 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (19 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (26 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (26 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (19 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (26 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (26 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (19 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (19 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (26 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (26 downto 0);
    signal u0_m0_wo8_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (19 downto 0);
    signal u0_m0_wo8_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo8_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (26 downto 0);
    signal u0_m0_wo8_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (26 downto 0);
    signal u1_m0_wo8_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (19 downto 0);
    signal u1_m0_wo8_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (19 downto 0);
    signal u1_m0_wo8_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (26 downto 0);
    signal u1_m0_wo8_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (26 downto 0);
    signal u0_m0_wo10_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (19 downto 0);
    signal u0_m0_wo10_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo10_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (26 downto 0);
    signal u0_m0_wo10_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (26 downto 0);
    signal u1_m0_wo10_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (19 downto 0);
    signal u1_m0_wo10_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (19 downto 0);
    signal u1_m0_wo10_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (26 downto 0);
    signal u1_m0_wo10_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (26 downto 0);
    signal u0_m0_wo12_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (19 downto 0);
    signal u0_m0_wo12_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo12_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (26 downto 0);
    signal u0_m0_wo12_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (26 downto 0);
    signal u1_m0_wo12_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (19 downto 0);
    signal u1_m0_wo12_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (19 downto 0);
    signal u1_m0_wo12_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (26 downto 0);
    signal u1_m0_wo12_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (26 downto 0);
    signal u0_m0_wo14_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (19 downto 0);
    signal u0_m0_wo14_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo14_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (26 downto 0);
    signal u0_m0_wo14_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (26 downto 0);
    signal u1_m0_wo14_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (19 downto 0);
    signal u1_m0_wo14_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (19 downto 0);
    signal u1_m0_wo14_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (26 downto 0);
    signal u1_m0_wo14_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (26 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q : std_logic_vector (30 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int : std_logic_vector (30 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (30 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (30 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (30 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (30 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (30 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (30 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (30 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (30 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (30 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo8_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (30 downto 0);
    signal u0_m0_wo8_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (30 downto 0);
    signal u1_m0_wo8_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (30 downto 0);
    signal u1_m0_wo8_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo10_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (30 downto 0);
    signal u0_m0_wo10_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (30 downto 0);
    signal u1_m0_wo10_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (30 downto 0);
    signal u1_m0_wo10_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo12_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (30 downto 0);
    signal u0_m0_wo12_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (30 downto 0);
    signal u1_m0_wo12_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (30 downto 0);
    signal u1_m0_wo12_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo14_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (30 downto 0);
    signal u0_m0_wo14_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (30 downto 0);
    signal u1_m0_wo14_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (30 downto 0);
    signal u1_m0_wo14_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo3_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo3_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_13_nor_a : std_logic_vector(0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_13_nor_b : std_logic_vector(0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_13_nor_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u1_m0_wo3_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u1_m0_wo3_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u1_m0_wo1_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u1_m0_wo1_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo5_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo5_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u1_m0_wo5_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u1_m0_wo5_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo7_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo7_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u1_m0_wo7_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u1_m0_wo7_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo9_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo9_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u1_m0_wo9_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u1_m0_wo9_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo11_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo11_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u1_m0_wo11_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u1_m0_wo11_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo13_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo13_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u1_m0_wo13_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u1_m0_wo13_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo15_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo15_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u1_m0_wo15_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u1_m0_wo15_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
begin


	--d_u0_m0_wo0_wi0_phasedelay0_q_13_notEnable(LOGICAL,1995)
    d_u0_m0_wo0_wi0_phasedelay0_q_13_notEnable_a <= VCC_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_13_notEnable_q <= not d_u0_m0_wo0_wi0_phasedelay0_q_13_notEnable_a;

	--d_u0_m0_wo0_wi0_phasedelay0_q_13_nor(LOGICAL,1996)
    d_u0_m0_wo0_wi0_phasedelay0_q_13_nor_a <= d_u0_m0_wo0_wi0_phasedelay0_q_13_notEnable_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_13_nor_b <= d_u0_m0_wo0_wi0_phasedelay0_q_13_sticky_ena_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_13_nor_q <= not (d_u0_m0_wo0_wi0_phasedelay0_q_13_nor_a or d_u0_m0_wo0_wi0_phasedelay0_q_13_nor_b);

	--d_u0_m0_wo0_wi0_phasedelay0_q_13_cmpReg(REG,1994)
    d_u0_m0_wo0_wi0_phasedelay0_q_13_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_wi0_phasedelay0_q_13_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_wi0_phasedelay0_q_13_cmpReg_q <= VCC_q;
        END IF;
    END PROCESS;


	--d_u0_m0_wo0_wi0_phasedelay0_q_13_sticky_ena(REG,1997)
    d_u0_m0_wo0_wi0_phasedelay0_q_13_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_wi0_phasedelay0_q_13_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_wi0_phasedelay0_q_13_nor_q = "1") THEN
                d_u0_m0_wo0_wi0_phasedelay0_q_13_sticky_ena_q <= d_u0_m0_wo0_wi0_phasedelay0_q_13_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd(LOGICAL,1998)
    d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_a <= d_u0_m0_wo0_wi0_phasedelay0_q_13_sticky_ena_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_b <= VCC_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_q <= d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_a and d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_b;

	--xIn(PORTIN,2)@10

	--d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdcnt(COUNTER,1990)
    -- every=1, low=0, high=1, step=1, init=1
    d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
                d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdcnt_i <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdcnt_i + 1;
        END IF;
    END PROCESS;
    d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdcnt_i,1));


	--d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg(REG,1991)
    d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg_q <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--VCC(CONSTANT,1)@0
    VCC_q <= "1";

	--d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux(MUX,1992)
    d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_s <= VCC_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux: PROCESS (d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_s, d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg_q, d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdcnt_q)
    BEGIN
            CASE d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_s IS
                  WHEN "0" => d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_q <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg_q;
                  WHEN "1" => d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_q <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdcnt_q;
                  WHEN OTHERS => d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--d_u1_m0_wo12_wi6_phasedelay1_q_13_replace_mem(DUALMEM,2139)
    d_u1_m0_wo12_wi6_phasedelay1_q_13_replace_mem_reset0 <= areset;
    d_u1_m0_wo12_wi6_phasedelay1_q_13_replace_mem_ia <= xIn_14;
    d_u1_m0_wo12_wi6_phasedelay1_q_13_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg_q;
    d_u1_m0_wo12_wi6_phasedelay1_q_13_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_q;
    d_u1_m0_wo12_wi6_phasedelay1_q_13_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u1_m0_wo12_wi6_phasedelay1_q_13_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u1_m0_wo12_wi6_phasedelay1_q_13_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u1_m0_wo12_wi6_phasedelay1_q_13_replace_mem_iq,
        address_a => d_u1_m0_wo12_wi6_phasedelay1_q_13_replace_mem_aa,
        data_a => d_u1_m0_wo12_wi6_phasedelay1_q_13_replace_mem_ia
    );
        d_u1_m0_wo12_wi6_phasedelay1_q_13_replace_mem_q <= d_u1_m0_wo12_wi6_phasedelay1_q_13_replace_mem_iq(15 downto 0);

	--u1_m0_wo15_mtree_mult1_0_shift0(BITSHIFT,1971)@13
    u1_m0_wo15_mtree_mult1_0_shift0_q_int <= d_u1_m0_wo12_wi6_phasedelay1_q_13_replace_mem_q & "00000000000000";
    u1_m0_wo15_mtree_mult1_0_shift0_q <= u1_m0_wo15_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u1_m0_wo14_wi7_sym_add1(ADD,1686)@10
    u1_m0_wo14_wi7_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_15(15)) & xIn_15);
    u1_m0_wo14_wi7_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_12(15)) & xIn_12);
    u1_m0_wo14_wi7_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo14_wi7_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo14_wi7_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo14_wi7_sym_add1_a) + SIGNED(u1_m0_wo14_wi7_sym_add1_b));
        END IF;
    END PROCESS;
    u1_m0_wo14_wi7_sym_add1_q <= u1_m0_wo14_wi7_sym_add1_o(16 downto 0);


	--u1_m0_wo14_mtree_madd2_0_constmult1_shift0(BITSHIFT,1965)@11
    u1_m0_wo14_mtree_madd2_0_constmult1_shift0_q_int <= u1_m0_wo14_wi7_sym_add1_q & "0000000000";
    u1_m0_wo14_mtree_madd2_0_constmult1_shift0_q <= u1_m0_wo14_mtree_madd2_0_constmult1_shift0_q_int(26 downto 0);

	--u1_m0_wo14_mtree_madd2_0_constmult1_sub_1(SUB,1966)@11
    u1_m0_wo14_mtree_madd2_0_constmult1_sub_1_a <= STD_LOGIC_VECTOR((27 downto 1 => GND_q(0)) & GND_q);
    u1_m0_wo14_mtree_madd2_0_constmult1_sub_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u1_m0_wo14_mtree_madd2_0_constmult1_shift0_q(26)) & u1_m0_wo14_mtree_madd2_0_constmult1_shift0_q);
    u1_m0_wo14_mtree_madd2_0_constmult1_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo14_mtree_madd2_0_constmult1_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo14_mtree_madd2_0_constmult1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo14_mtree_madd2_0_constmult1_sub_1_a) - SIGNED(u1_m0_wo14_mtree_madd2_0_constmult1_sub_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo14_mtree_madd2_0_constmult1_sub_1_q <= u1_m0_wo14_mtree_madd2_0_constmult1_sub_1_o(27 downto 0);


	--u1_m0_wo14_mtree_madd2_0_constmult0_shift0(BITSHIFT,1962)@11
    u1_m0_wo14_mtree_madd2_0_constmult0_shift0_q_int <= u1_m0_wo14_wi6_sym_add0_q & "000";
    u1_m0_wo14_mtree_madd2_0_constmult0_shift0_q <= u1_m0_wo14_mtree_madd2_0_constmult0_shift0_q_int(19 downto 0);

	--u1_m0_wo14_wi6_sym_add0(ADD,1685)@10
    u1_m0_wo14_wi6_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_14(15)) & xIn_14);
    u1_m0_wo14_wi6_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_13(15)) & xIn_13);
    u1_m0_wo14_wi6_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo14_wi6_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo14_wi6_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo14_wi6_sym_add0_a) + SIGNED(u1_m0_wo14_wi6_sym_add0_b));
        END IF;
    END PROCESS;
    u1_m0_wo14_wi6_sym_add0_q <= u1_m0_wo14_wi6_sym_add0_o(16 downto 0);


	--u1_m0_wo14_mtree_madd2_0_constmult0_add_1(ADD,1963)@11
    u1_m0_wo14_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((20 downto 17 => u1_m0_wo14_wi6_sym_add0_q(16)) & u1_m0_wo14_wi6_sym_add0_q);
    u1_m0_wo14_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((20 downto 20 => u1_m0_wo14_mtree_madd2_0_constmult0_shift0_q(19)) & u1_m0_wo14_mtree_madd2_0_constmult0_shift0_q);
    u1_m0_wo14_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo14_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo14_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo14_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u1_m0_wo14_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo14_mtree_madd2_0_constmult0_add_1_q <= u1_m0_wo14_mtree_madd2_0_constmult0_add_1_o(20 downto 0);


	--u1_m0_wo14_mtree_madd2_0_constmult0_shift2(BITSHIFT,1964)@12
    u1_m0_wo14_mtree_madd2_0_constmult0_shift2_q_int <= u1_m0_wo14_mtree_madd2_0_constmult0_add_1_q & "0000000000";
    u1_m0_wo14_mtree_madd2_0_constmult0_shift2_q <= u1_m0_wo14_mtree_madd2_0_constmult0_shift2_q_int(30 downto 0);

	--u1_m0_wo14_mtree_madd2_0_sum1(ADD,1967)@12
    u1_m0_wo14_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 31 => u1_m0_wo14_mtree_madd2_0_constmult0_shift2_q(30)) & u1_m0_wo14_mtree_madd2_0_constmult0_shift2_q);
    u1_m0_wo14_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 28 => u1_m0_wo14_mtree_madd2_0_constmult1_sub_1_q(27)) & u1_m0_wo14_mtree_madd2_0_constmult1_sub_1_q);
    u1_m0_wo14_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo14_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo14_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo14_mtree_madd2_0_sum1_a) + SIGNED(u1_m0_wo14_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u1_m0_wo14_mtree_madd2_0_sum1_q <= u1_m0_wo14_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u1_m0_wo10_wi5_phasedelay1_q_13_replace_mem(DUALMEM,2119)
    d_u1_m0_wo10_wi5_phasedelay1_q_13_replace_mem_reset0 <= areset;
    d_u1_m0_wo10_wi5_phasedelay1_q_13_replace_mem_ia <= xIn_13;
    d_u1_m0_wo10_wi5_phasedelay1_q_13_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg_q;
    d_u1_m0_wo10_wi5_phasedelay1_q_13_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_q;
    d_u1_m0_wo10_wi5_phasedelay1_q_13_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u1_m0_wo10_wi5_phasedelay1_q_13_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u1_m0_wo10_wi5_phasedelay1_q_13_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u1_m0_wo10_wi5_phasedelay1_q_13_replace_mem_iq,
        address_a => d_u1_m0_wo10_wi5_phasedelay1_q_13_replace_mem_aa,
        data_a => d_u1_m0_wo10_wi5_phasedelay1_q_13_replace_mem_ia
    );
        d_u1_m0_wo10_wi5_phasedelay1_q_13_replace_mem_q <= d_u1_m0_wo10_wi5_phasedelay1_q_13_replace_mem_iq(15 downto 0);

	--u1_m0_wo13_mtree_mult1_0_shift0(BITSHIFT,1955)@13
    u1_m0_wo13_mtree_mult1_0_shift0_q_int <= d_u1_m0_wo10_wi5_phasedelay1_q_13_replace_mem_q & "00000000000000";
    u1_m0_wo13_mtree_mult1_0_shift0_q <= u1_m0_wo13_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u1_m0_wo12_wi6_sym_add1(ADD,1464)@10
    u1_m0_wo12_wi6_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_14(15)) & xIn_14);
    u1_m0_wo12_wi6_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_11(15)) & xIn_11);
    u1_m0_wo12_wi6_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo12_wi6_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo12_wi6_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo12_wi6_sym_add1_a) + SIGNED(u1_m0_wo12_wi6_sym_add1_b));
        END IF;
    END PROCESS;
    u1_m0_wo12_wi6_sym_add1_q <= u1_m0_wo12_wi6_sym_add1_o(16 downto 0);


	--u1_m0_wo12_mtree_madd2_0_constmult1_shift0(BITSHIFT,1949)@11
    u1_m0_wo12_mtree_madd2_0_constmult1_shift0_q_int <= u1_m0_wo12_wi6_sym_add1_q & "0000000000";
    u1_m0_wo12_mtree_madd2_0_constmult1_shift0_q <= u1_m0_wo12_mtree_madd2_0_constmult1_shift0_q_int(26 downto 0);

	--u1_m0_wo12_mtree_madd2_0_constmult1_sub_1(SUB,1950)@11
    u1_m0_wo12_mtree_madd2_0_constmult1_sub_1_a <= STD_LOGIC_VECTOR((27 downto 1 => GND_q(0)) & GND_q);
    u1_m0_wo12_mtree_madd2_0_constmult1_sub_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u1_m0_wo12_mtree_madd2_0_constmult1_shift0_q(26)) & u1_m0_wo12_mtree_madd2_0_constmult1_shift0_q);
    u1_m0_wo12_mtree_madd2_0_constmult1_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo12_mtree_madd2_0_constmult1_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo12_mtree_madd2_0_constmult1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo12_mtree_madd2_0_constmult1_sub_1_a) - SIGNED(u1_m0_wo12_mtree_madd2_0_constmult1_sub_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo12_mtree_madd2_0_constmult1_sub_1_q <= u1_m0_wo12_mtree_madd2_0_constmult1_sub_1_o(27 downto 0);


	--u1_m0_wo12_mtree_madd2_0_constmult0_shift0(BITSHIFT,1946)@11
    u1_m0_wo12_mtree_madd2_0_constmult0_shift0_q_int <= u1_m0_wo12_wi5_sym_add0_q & "000";
    u1_m0_wo12_mtree_madd2_0_constmult0_shift0_q <= u1_m0_wo12_mtree_madd2_0_constmult0_shift0_q_int(19 downto 0);

	--u1_m0_wo12_wi5_sym_add0(ADD,1463)@10
    u1_m0_wo12_wi5_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_13(15)) & xIn_13);
    u1_m0_wo12_wi5_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_12(15)) & xIn_12);
    u1_m0_wo12_wi5_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo12_wi5_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo12_wi5_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo12_wi5_sym_add0_a) + SIGNED(u1_m0_wo12_wi5_sym_add0_b));
        END IF;
    END PROCESS;
    u1_m0_wo12_wi5_sym_add0_q <= u1_m0_wo12_wi5_sym_add0_o(16 downto 0);


	--u1_m0_wo12_mtree_madd2_0_constmult0_add_1(ADD,1947)@11
    u1_m0_wo12_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((20 downto 17 => u1_m0_wo12_wi5_sym_add0_q(16)) & u1_m0_wo12_wi5_sym_add0_q);
    u1_m0_wo12_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((20 downto 20 => u1_m0_wo12_mtree_madd2_0_constmult0_shift0_q(19)) & u1_m0_wo12_mtree_madd2_0_constmult0_shift0_q);
    u1_m0_wo12_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo12_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo12_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo12_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u1_m0_wo12_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo12_mtree_madd2_0_constmult0_add_1_q <= u1_m0_wo12_mtree_madd2_0_constmult0_add_1_o(20 downto 0);


	--u1_m0_wo12_mtree_madd2_0_constmult0_shift2(BITSHIFT,1948)@12
    u1_m0_wo12_mtree_madd2_0_constmult0_shift2_q_int <= u1_m0_wo12_mtree_madd2_0_constmult0_add_1_q & "0000000000";
    u1_m0_wo12_mtree_madd2_0_constmult0_shift2_q <= u1_m0_wo12_mtree_madd2_0_constmult0_shift2_q_int(30 downto 0);

	--u1_m0_wo12_mtree_madd2_0_sum1(ADD,1951)@12
    u1_m0_wo12_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 31 => u1_m0_wo12_mtree_madd2_0_constmult0_shift2_q(30)) & u1_m0_wo12_mtree_madd2_0_constmult0_shift2_q);
    u1_m0_wo12_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 28 => u1_m0_wo12_mtree_madd2_0_constmult1_sub_1_q(27)) & u1_m0_wo12_mtree_madd2_0_constmult1_sub_1_q);
    u1_m0_wo12_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo12_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo12_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo12_mtree_madd2_0_sum1_a) + SIGNED(u1_m0_wo12_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u1_m0_wo12_mtree_madd2_0_sum1_q <= u1_m0_wo12_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u1_m0_wo8_wi4_phasedelay1_q_13_replace_mem(DUALMEM,2099)
    d_u1_m0_wo8_wi4_phasedelay1_q_13_replace_mem_reset0 <= areset;
    d_u1_m0_wo8_wi4_phasedelay1_q_13_replace_mem_ia <= xIn_12;
    d_u1_m0_wo8_wi4_phasedelay1_q_13_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg_q;
    d_u1_m0_wo8_wi4_phasedelay1_q_13_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_q;
    d_u1_m0_wo8_wi4_phasedelay1_q_13_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u1_m0_wo8_wi4_phasedelay1_q_13_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u1_m0_wo8_wi4_phasedelay1_q_13_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u1_m0_wo8_wi4_phasedelay1_q_13_replace_mem_iq,
        address_a => d_u1_m0_wo8_wi4_phasedelay1_q_13_replace_mem_aa,
        data_a => d_u1_m0_wo8_wi4_phasedelay1_q_13_replace_mem_ia
    );
        d_u1_m0_wo8_wi4_phasedelay1_q_13_replace_mem_q <= d_u1_m0_wo8_wi4_phasedelay1_q_13_replace_mem_iq(15 downto 0);

	--u1_m0_wo11_mtree_mult1_0_shift0(BITSHIFT,1939)@13
    u1_m0_wo11_mtree_mult1_0_shift0_q_int <= d_u1_m0_wo8_wi4_phasedelay1_q_13_replace_mem_q & "00000000000000";
    u1_m0_wo11_mtree_mult1_0_shift0_q <= u1_m0_wo11_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u1_m0_wo10_wi5_sym_add1(ADD,1242)@10
    u1_m0_wo10_wi5_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_13(15)) & xIn_13);
    u1_m0_wo10_wi5_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_10(15)) & xIn_10);
    u1_m0_wo10_wi5_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo10_wi5_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo10_wi5_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo10_wi5_sym_add1_a) + SIGNED(u1_m0_wo10_wi5_sym_add1_b));
        END IF;
    END PROCESS;
    u1_m0_wo10_wi5_sym_add1_q <= u1_m0_wo10_wi5_sym_add1_o(16 downto 0);


	--u1_m0_wo10_mtree_madd2_0_constmult1_shift0(BITSHIFT,1933)@11
    u1_m0_wo10_mtree_madd2_0_constmult1_shift0_q_int <= u1_m0_wo10_wi5_sym_add1_q & "0000000000";
    u1_m0_wo10_mtree_madd2_0_constmult1_shift0_q <= u1_m0_wo10_mtree_madd2_0_constmult1_shift0_q_int(26 downto 0);

	--u1_m0_wo10_mtree_madd2_0_constmult1_sub_1(SUB,1934)@11
    u1_m0_wo10_mtree_madd2_0_constmult1_sub_1_a <= STD_LOGIC_VECTOR((27 downto 1 => GND_q(0)) & GND_q);
    u1_m0_wo10_mtree_madd2_0_constmult1_sub_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u1_m0_wo10_mtree_madd2_0_constmult1_shift0_q(26)) & u1_m0_wo10_mtree_madd2_0_constmult1_shift0_q);
    u1_m0_wo10_mtree_madd2_0_constmult1_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo10_mtree_madd2_0_constmult1_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo10_mtree_madd2_0_constmult1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo10_mtree_madd2_0_constmult1_sub_1_a) - SIGNED(u1_m0_wo10_mtree_madd2_0_constmult1_sub_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo10_mtree_madd2_0_constmult1_sub_1_q <= u1_m0_wo10_mtree_madd2_0_constmult1_sub_1_o(27 downto 0);


	--u1_m0_wo10_mtree_madd2_0_constmult0_shift0(BITSHIFT,1930)@11
    u1_m0_wo10_mtree_madd2_0_constmult0_shift0_q_int <= u1_m0_wo10_wi4_sym_add0_q & "000";
    u1_m0_wo10_mtree_madd2_0_constmult0_shift0_q <= u1_m0_wo10_mtree_madd2_0_constmult0_shift0_q_int(19 downto 0);

	--u1_m0_wo10_wi4_sym_add0(ADD,1241)@10
    u1_m0_wo10_wi4_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_12(15)) & xIn_12);
    u1_m0_wo10_wi4_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_11(15)) & xIn_11);
    u1_m0_wo10_wi4_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo10_wi4_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo10_wi4_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo10_wi4_sym_add0_a) + SIGNED(u1_m0_wo10_wi4_sym_add0_b));
        END IF;
    END PROCESS;
    u1_m0_wo10_wi4_sym_add0_q <= u1_m0_wo10_wi4_sym_add0_o(16 downto 0);


	--u1_m0_wo10_mtree_madd2_0_constmult0_add_1(ADD,1931)@11
    u1_m0_wo10_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((20 downto 17 => u1_m0_wo10_wi4_sym_add0_q(16)) & u1_m0_wo10_wi4_sym_add0_q);
    u1_m0_wo10_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((20 downto 20 => u1_m0_wo10_mtree_madd2_0_constmult0_shift0_q(19)) & u1_m0_wo10_mtree_madd2_0_constmult0_shift0_q);
    u1_m0_wo10_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo10_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo10_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo10_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u1_m0_wo10_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo10_mtree_madd2_0_constmult0_add_1_q <= u1_m0_wo10_mtree_madd2_0_constmult0_add_1_o(20 downto 0);


	--u1_m0_wo10_mtree_madd2_0_constmult0_shift2(BITSHIFT,1932)@12
    u1_m0_wo10_mtree_madd2_0_constmult0_shift2_q_int <= u1_m0_wo10_mtree_madd2_0_constmult0_add_1_q & "0000000000";
    u1_m0_wo10_mtree_madd2_0_constmult0_shift2_q <= u1_m0_wo10_mtree_madd2_0_constmult0_shift2_q_int(30 downto 0);

	--u1_m0_wo10_mtree_madd2_0_sum1(ADD,1935)@12
    u1_m0_wo10_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 31 => u1_m0_wo10_mtree_madd2_0_constmult0_shift2_q(30)) & u1_m0_wo10_mtree_madd2_0_constmult0_shift2_q);
    u1_m0_wo10_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 28 => u1_m0_wo10_mtree_madd2_0_constmult1_sub_1_q(27)) & u1_m0_wo10_mtree_madd2_0_constmult1_sub_1_q);
    u1_m0_wo10_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo10_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo10_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo10_mtree_madd2_0_sum1_a) + SIGNED(u1_m0_wo10_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u1_m0_wo10_mtree_madd2_0_sum1_q <= u1_m0_wo10_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u1_m0_wo6_wi3_phasedelay1_q_13_replace_mem(DUALMEM,2079)
    d_u1_m0_wo6_wi3_phasedelay1_q_13_replace_mem_reset0 <= areset;
    d_u1_m0_wo6_wi3_phasedelay1_q_13_replace_mem_ia <= xIn_11;
    d_u1_m0_wo6_wi3_phasedelay1_q_13_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg_q;
    d_u1_m0_wo6_wi3_phasedelay1_q_13_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_q;
    d_u1_m0_wo6_wi3_phasedelay1_q_13_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u1_m0_wo6_wi3_phasedelay1_q_13_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u1_m0_wo6_wi3_phasedelay1_q_13_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u1_m0_wo6_wi3_phasedelay1_q_13_replace_mem_iq,
        address_a => d_u1_m0_wo6_wi3_phasedelay1_q_13_replace_mem_aa,
        data_a => d_u1_m0_wo6_wi3_phasedelay1_q_13_replace_mem_ia
    );
        d_u1_m0_wo6_wi3_phasedelay1_q_13_replace_mem_q <= d_u1_m0_wo6_wi3_phasedelay1_q_13_replace_mem_iq(15 downto 0);

	--u1_m0_wo9_mtree_mult1_0_shift0(BITSHIFT,1923)@13
    u1_m0_wo9_mtree_mult1_0_shift0_q_int <= d_u1_m0_wo6_wi3_phasedelay1_q_13_replace_mem_q & "00000000000000";
    u1_m0_wo9_mtree_mult1_0_shift0_q <= u1_m0_wo9_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u1_m0_wo8_wi4_sym_add1(ADD,1020)@10
    u1_m0_wo8_wi4_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_12(15)) & xIn_12);
    u1_m0_wo8_wi4_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_9(15)) & xIn_9);
    u1_m0_wo8_wi4_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo8_wi4_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo8_wi4_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo8_wi4_sym_add1_a) + SIGNED(u1_m0_wo8_wi4_sym_add1_b));
        END IF;
    END PROCESS;
    u1_m0_wo8_wi4_sym_add1_q <= u1_m0_wo8_wi4_sym_add1_o(16 downto 0);


	--u1_m0_wo8_mtree_madd2_0_constmult1_shift0(BITSHIFT,1917)@11
    u1_m0_wo8_mtree_madd2_0_constmult1_shift0_q_int <= u1_m0_wo8_wi4_sym_add1_q & "0000000000";
    u1_m0_wo8_mtree_madd2_0_constmult1_shift0_q <= u1_m0_wo8_mtree_madd2_0_constmult1_shift0_q_int(26 downto 0);

	--u1_m0_wo8_mtree_madd2_0_constmult1_sub_1(SUB,1918)@11
    u1_m0_wo8_mtree_madd2_0_constmult1_sub_1_a <= STD_LOGIC_VECTOR((27 downto 1 => GND_q(0)) & GND_q);
    u1_m0_wo8_mtree_madd2_0_constmult1_sub_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u1_m0_wo8_mtree_madd2_0_constmult1_shift0_q(26)) & u1_m0_wo8_mtree_madd2_0_constmult1_shift0_q);
    u1_m0_wo8_mtree_madd2_0_constmult1_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo8_mtree_madd2_0_constmult1_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo8_mtree_madd2_0_constmult1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo8_mtree_madd2_0_constmult1_sub_1_a) - SIGNED(u1_m0_wo8_mtree_madd2_0_constmult1_sub_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo8_mtree_madd2_0_constmult1_sub_1_q <= u1_m0_wo8_mtree_madd2_0_constmult1_sub_1_o(27 downto 0);


	--u1_m0_wo8_mtree_madd2_0_constmult0_shift0(BITSHIFT,1914)@11
    u1_m0_wo8_mtree_madd2_0_constmult0_shift0_q_int <= u1_m0_wo8_wi3_sym_add0_q & "000";
    u1_m0_wo8_mtree_madd2_0_constmult0_shift0_q <= u1_m0_wo8_mtree_madd2_0_constmult0_shift0_q_int(19 downto 0);

	--u1_m0_wo8_wi3_sym_add0(ADD,1019)@10
    u1_m0_wo8_wi3_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_11(15)) & xIn_11);
    u1_m0_wo8_wi3_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_10(15)) & xIn_10);
    u1_m0_wo8_wi3_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo8_wi3_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo8_wi3_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo8_wi3_sym_add0_a) + SIGNED(u1_m0_wo8_wi3_sym_add0_b));
        END IF;
    END PROCESS;
    u1_m0_wo8_wi3_sym_add0_q <= u1_m0_wo8_wi3_sym_add0_o(16 downto 0);


	--u1_m0_wo8_mtree_madd2_0_constmult0_add_1(ADD,1915)@11
    u1_m0_wo8_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((20 downto 17 => u1_m0_wo8_wi3_sym_add0_q(16)) & u1_m0_wo8_wi3_sym_add0_q);
    u1_m0_wo8_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((20 downto 20 => u1_m0_wo8_mtree_madd2_0_constmult0_shift0_q(19)) & u1_m0_wo8_mtree_madd2_0_constmult0_shift0_q);
    u1_m0_wo8_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo8_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo8_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo8_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u1_m0_wo8_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo8_mtree_madd2_0_constmult0_add_1_q <= u1_m0_wo8_mtree_madd2_0_constmult0_add_1_o(20 downto 0);


	--u1_m0_wo8_mtree_madd2_0_constmult0_shift2(BITSHIFT,1916)@12
    u1_m0_wo8_mtree_madd2_0_constmult0_shift2_q_int <= u1_m0_wo8_mtree_madd2_0_constmult0_add_1_q & "0000000000";
    u1_m0_wo8_mtree_madd2_0_constmult0_shift2_q <= u1_m0_wo8_mtree_madd2_0_constmult0_shift2_q_int(30 downto 0);

	--u1_m0_wo8_mtree_madd2_0_sum1(ADD,1919)@12
    u1_m0_wo8_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 31 => u1_m0_wo8_mtree_madd2_0_constmult0_shift2_q(30)) & u1_m0_wo8_mtree_madd2_0_constmult0_shift2_q);
    u1_m0_wo8_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 28 => u1_m0_wo8_mtree_madd2_0_constmult1_sub_1_q(27)) & u1_m0_wo8_mtree_madd2_0_constmult1_sub_1_q);
    u1_m0_wo8_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo8_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo8_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo8_mtree_madd2_0_sum1_a) + SIGNED(u1_m0_wo8_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u1_m0_wo8_mtree_madd2_0_sum1_q <= u1_m0_wo8_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u1_m0_wo4_wi2_phasedelay1_q_13_replace_mem(DUALMEM,2059)
    d_u1_m0_wo4_wi2_phasedelay1_q_13_replace_mem_reset0 <= areset;
    d_u1_m0_wo4_wi2_phasedelay1_q_13_replace_mem_ia <= xIn_10;
    d_u1_m0_wo4_wi2_phasedelay1_q_13_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg_q;
    d_u1_m0_wo4_wi2_phasedelay1_q_13_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_q;
    d_u1_m0_wo4_wi2_phasedelay1_q_13_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u1_m0_wo4_wi2_phasedelay1_q_13_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u1_m0_wo4_wi2_phasedelay1_q_13_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u1_m0_wo4_wi2_phasedelay1_q_13_replace_mem_iq,
        address_a => d_u1_m0_wo4_wi2_phasedelay1_q_13_replace_mem_aa,
        data_a => d_u1_m0_wo4_wi2_phasedelay1_q_13_replace_mem_ia
    );
        d_u1_m0_wo4_wi2_phasedelay1_q_13_replace_mem_q <= d_u1_m0_wo4_wi2_phasedelay1_q_13_replace_mem_iq(15 downto 0);

	--u1_m0_wo7_mtree_mult1_0_shift0(BITSHIFT,1907)@13
    u1_m0_wo7_mtree_mult1_0_shift0_q_int <= d_u1_m0_wo4_wi2_phasedelay1_q_13_replace_mem_q & "00000000000000";
    u1_m0_wo7_mtree_mult1_0_shift0_q <= u1_m0_wo7_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u1_m0_wo6_wi3_sym_add1(ADD,798)@10
    u1_m0_wo6_wi3_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_11(15)) & xIn_11);
    u1_m0_wo6_wi3_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_8(15)) & xIn_8);
    u1_m0_wo6_wi3_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo6_wi3_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo6_wi3_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo6_wi3_sym_add1_a) + SIGNED(u1_m0_wo6_wi3_sym_add1_b));
        END IF;
    END PROCESS;
    u1_m0_wo6_wi3_sym_add1_q <= u1_m0_wo6_wi3_sym_add1_o(16 downto 0);


	--u1_m0_wo6_mtree_madd2_0_constmult1_shift0(BITSHIFT,1901)@11
    u1_m0_wo6_mtree_madd2_0_constmult1_shift0_q_int <= u1_m0_wo6_wi3_sym_add1_q & "0000000000";
    u1_m0_wo6_mtree_madd2_0_constmult1_shift0_q <= u1_m0_wo6_mtree_madd2_0_constmult1_shift0_q_int(26 downto 0);

	--u1_m0_wo6_mtree_madd2_0_constmult1_sub_1(SUB,1902)@11
    u1_m0_wo6_mtree_madd2_0_constmult1_sub_1_a <= STD_LOGIC_VECTOR((27 downto 1 => GND_q(0)) & GND_q);
    u1_m0_wo6_mtree_madd2_0_constmult1_sub_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u1_m0_wo6_mtree_madd2_0_constmult1_shift0_q(26)) & u1_m0_wo6_mtree_madd2_0_constmult1_shift0_q);
    u1_m0_wo6_mtree_madd2_0_constmult1_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo6_mtree_madd2_0_constmult1_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo6_mtree_madd2_0_constmult1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo6_mtree_madd2_0_constmult1_sub_1_a) - SIGNED(u1_m0_wo6_mtree_madd2_0_constmult1_sub_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo6_mtree_madd2_0_constmult1_sub_1_q <= u1_m0_wo6_mtree_madd2_0_constmult1_sub_1_o(27 downto 0);


	--u1_m0_wo6_mtree_madd2_0_constmult0_shift0(BITSHIFT,1898)@11
    u1_m0_wo6_mtree_madd2_0_constmult0_shift0_q_int <= u1_m0_wo6_wi2_sym_add0_q & "000";
    u1_m0_wo6_mtree_madd2_0_constmult0_shift0_q <= u1_m0_wo6_mtree_madd2_0_constmult0_shift0_q_int(19 downto 0);

	--u1_m0_wo6_wi2_sym_add0(ADD,797)@10
    u1_m0_wo6_wi2_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_10(15)) & xIn_10);
    u1_m0_wo6_wi2_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_9(15)) & xIn_9);
    u1_m0_wo6_wi2_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo6_wi2_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo6_wi2_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo6_wi2_sym_add0_a) + SIGNED(u1_m0_wo6_wi2_sym_add0_b));
        END IF;
    END PROCESS;
    u1_m0_wo6_wi2_sym_add0_q <= u1_m0_wo6_wi2_sym_add0_o(16 downto 0);


	--u1_m0_wo6_mtree_madd2_0_constmult0_add_1(ADD,1899)@11
    u1_m0_wo6_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((20 downto 17 => u1_m0_wo6_wi2_sym_add0_q(16)) & u1_m0_wo6_wi2_sym_add0_q);
    u1_m0_wo6_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((20 downto 20 => u1_m0_wo6_mtree_madd2_0_constmult0_shift0_q(19)) & u1_m0_wo6_mtree_madd2_0_constmult0_shift0_q);
    u1_m0_wo6_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo6_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo6_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo6_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u1_m0_wo6_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo6_mtree_madd2_0_constmult0_add_1_q <= u1_m0_wo6_mtree_madd2_0_constmult0_add_1_o(20 downto 0);


	--u1_m0_wo6_mtree_madd2_0_constmult0_shift2(BITSHIFT,1900)@12
    u1_m0_wo6_mtree_madd2_0_constmult0_shift2_q_int <= u1_m0_wo6_mtree_madd2_0_constmult0_add_1_q & "0000000000";
    u1_m0_wo6_mtree_madd2_0_constmult0_shift2_q <= u1_m0_wo6_mtree_madd2_0_constmult0_shift2_q_int(30 downto 0);

	--u1_m0_wo6_mtree_madd2_0_sum1(ADD,1903)@12
    u1_m0_wo6_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 31 => u1_m0_wo6_mtree_madd2_0_constmult0_shift2_q(30)) & u1_m0_wo6_mtree_madd2_0_constmult0_shift2_q);
    u1_m0_wo6_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 28 => u1_m0_wo6_mtree_madd2_0_constmult1_sub_1_q(27)) & u1_m0_wo6_mtree_madd2_0_constmult1_sub_1_q);
    u1_m0_wo6_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo6_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo6_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo6_mtree_madd2_0_sum1_a) + SIGNED(u1_m0_wo6_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u1_m0_wo6_mtree_madd2_0_sum1_q <= u1_m0_wo6_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u1_m0_wo2_wi1_phasedelay1_q_13_replace_mem(DUALMEM,2039)
    d_u1_m0_wo2_wi1_phasedelay1_q_13_replace_mem_reset0 <= areset;
    d_u1_m0_wo2_wi1_phasedelay1_q_13_replace_mem_ia <= xIn_9;
    d_u1_m0_wo2_wi1_phasedelay1_q_13_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg_q;
    d_u1_m0_wo2_wi1_phasedelay1_q_13_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_q;
    d_u1_m0_wo2_wi1_phasedelay1_q_13_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u1_m0_wo2_wi1_phasedelay1_q_13_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u1_m0_wo2_wi1_phasedelay1_q_13_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u1_m0_wo2_wi1_phasedelay1_q_13_replace_mem_iq,
        address_a => d_u1_m0_wo2_wi1_phasedelay1_q_13_replace_mem_aa,
        data_a => d_u1_m0_wo2_wi1_phasedelay1_q_13_replace_mem_ia
    );
        d_u1_m0_wo2_wi1_phasedelay1_q_13_replace_mem_q <= d_u1_m0_wo2_wi1_phasedelay1_q_13_replace_mem_iq(15 downto 0);

	--u1_m0_wo5_mtree_mult1_0_shift0(BITSHIFT,1891)@13
    u1_m0_wo5_mtree_mult1_0_shift0_q_int <= d_u1_m0_wo2_wi1_phasedelay1_q_13_replace_mem_q & "00000000000000";
    u1_m0_wo5_mtree_mult1_0_shift0_q <= u1_m0_wo5_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u1_m0_wo0_wi7_delayr1(DELAY,125)@10
    u1_m0_wo0_wi7_delayr1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_15, xout => u1_m0_wo0_wi7_delayr1_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u1_m0_wo4_wi2_sym_add1(ADD,576)@10
    u1_m0_wo4_wi2_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_10(15)) & xIn_10);
    u1_m0_wo4_wi2_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u1_m0_wo0_wi7_delayr1_q(15)) & u1_m0_wo0_wi7_delayr1_q);
    u1_m0_wo4_wi2_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo4_wi2_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo4_wi2_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo4_wi2_sym_add1_a) + SIGNED(u1_m0_wo4_wi2_sym_add1_b));
        END IF;
    END PROCESS;
    u1_m0_wo4_wi2_sym_add1_q <= u1_m0_wo4_wi2_sym_add1_o(16 downto 0);


	--u1_m0_wo4_mtree_madd2_0_constmult1_shift0(BITSHIFT,1885)@11
    u1_m0_wo4_mtree_madd2_0_constmult1_shift0_q_int <= u1_m0_wo4_wi2_sym_add1_q & "0000000000";
    u1_m0_wo4_mtree_madd2_0_constmult1_shift0_q <= u1_m0_wo4_mtree_madd2_0_constmult1_shift0_q_int(26 downto 0);

	--u1_m0_wo4_mtree_madd2_0_constmult1_sub_1(SUB,1886)@11
    u1_m0_wo4_mtree_madd2_0_constmult1_sub_1_a <= STD_LOGIC_VECTOR((27 downto 1 => GND_q(0)) & GND_q);
    u1_m0_wo4_mtree_madd2_0_constmult1_sub_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u1_m0_wo4_mtree_madd2_0_constmult1_shift0_q(26)) & u1_m0_wo4_mtree_madd2_0_constmult1_shift0_q);
    u1_m0_wo4_mtree_madd2_0_constmult1_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo4_mtree_madd2_0_constmult1_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo4_mtree_madd2_0_constmult1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo4_mtree_madd2_0_constmult1_sub_1_a) - SIGNED(u1_m0_wo4_mtree_madd2_0_constmult1_sub_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo4_mtree_madd2_0_constmult1_sub_1_q <= u1_m0_wo4_mtree_madd2_0_constmult1_sub_1_o(27 downto 0);


	--u1_m0_wo4_mtree_madd2_0_constmult0_shift0(BITSHIFT,1882)@11
    u1_m0_wo4_mtree_madd2_0_constmult0_shift0_q_int <= u1_m0_wo4_wi1_sym_add0_q & "000";
    u1_m0_wo4_mtree_madd2_0_constmult0_shift0_q <= u1_m0_wo4_mtree_madd2_0_constmult0_shift0_q_int(19 downto 0);

	--u1_m0_wo4_wi1_sym_add0(ADD,575)@10
    u1_m0_wo4_wi1_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_9(15)) & xIn_9);
    u1_m0_wo4_wi1_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_8(15)) & xIn_8);
    u1_m0_wo4_wi1_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo4_wi1_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo4_wi1_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo4_wi1_sym_add0_a) + SIGNED(u1_m0_wo4_wi1_sym_add0_b));
        END IF;
    END PROCESS;
    u1_m0_wo4_wi1_sym_add0_q <= u1_m0_wo4_wi1_sym_add0_o(16 downto 0);


	--u1_m0_wo4_mtree_madd2_0_constmult0_add_1(ADD,1883)@11
    u1_m0_wo4_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((20 downto 17 => u1_m0_wo4_wi1_sym_add0_q(16)) & u1_m0_wo4_wi1_sym_add0_q);
    u1_m0_wo4_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((20 downto 20 => u1_m0_wo4_mtree_madd2_0_constmult0_shift0_q(19)) & u1_m0_wo4_mtree_madd2_0_constmult0_shift0_q);
    u1_m0_wo4_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo4_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo4_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo4_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u1_m0_wo4_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo4_mtree_madd2_0_constmult0_add_1_q <= u1_m0_wo4_mtree_madd2_0_constmult0_add_1_o(20 downto 0);


	--u1_m0_wo4_mtree_madd2_0_constmult0_shift2(BITSHIFT,1884)@12
    u1_m0_wo4_mtree_madd2_0_constmult0_shift2_q_int <= u1_m0_wo4_mtree_madd2_0_constmult0_add_1_q & "0000000000";
    u1_m0_wo4_mtree_madd2_0_constmult0_shift2_q <= u1_m0_wo4_mtree_madd2_0_constmult0_shift2_q_int(30 downto 0);

	--u1_m0_wo4_mtree_madd2_0_sum1(ADD,1887)@12
    u1_m0_wo4_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 31 => u1_m0_wo4_mtree_madd2_0_constmult0_shift2_q(30)) & u1_m0_wo4_mtree_madd2_0_constmult0_shift2_q);
    u1_m0_wo4_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 28 => u1_m0_wo4_mtree_madd2_0_constmult1_sub_1_q(27)) & u1_m0_wo4_mtree_madd2_0_constmult1_sub_1_q);
    u1_m0_wo4_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo4_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo4_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo4_mtree_madd2_0_sum1_a) + SIGNED(u1_m0_wo4_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u1_m0_wo4_mtree_madd2_0_sum1_q <= u1_m0_wo4_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u1_m0_wo0_wi0_phasedelay0_q_13_replace_mem(DUALMEM,2009)
    d_u1_m0_wo0_wi0_phasedelay0_q_13_replace_mem_reset0 <= areset;
    d_u1_m0_wo0_wi0_phasedelay0_q_13_replace_mem_ia <= xIn_8;
    d_u1_m0_wo0_wi0_phasedelay0_q_13_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg_q;
    d_u1_m0_wo0_wi0_phasedelay0_q_13_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_q;
    d_u1_m0_wo0_wi0_phasedelay0_q_13_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u1_m0_wo0_wi0_phasedelay0_q_13_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u1_m0_wo0_wi0_phasedelay0_q_13_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u1_m0_wo0_wi0_phasedelay0_q_13_replace_mem_iq,
        address_a => d_u1_m0_wo0_wi0_phasedelay0_q_13_replace_mem_aa,
        data_a => d_u1_m0_wo0_wi0_phasedelay0_q_13_replace_mem_ia
    );
        d_u1_m0_wo0_wi0_phasedelay0_q_13_replace_mem_q <= d_u1_m0_wo0_wi0_phasedelay0_q_13_replace_mem_iq(15 downto 0);

	--u1_m0_wo3_mtree_mult1_0_shift0(BITSHIFT,1875)@13
    u1_m0_wo3_mtree_mult1_0_shift0_q_int <= d_u1_m0_wo0_wi0_phasedelay0_q_13_replace_mem_q & "00000000000000";
    u1_m0_wo3_mtree_mult1_0_shift0_q <= u1_m0_wo3_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u1_m0_wo0_wi6_delayr2(DELAY,119)@10
    u1_m0_wo0_wi6_delayr2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_14, xout => u1_m0_wo0_wi6_delayr2_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u1_m0_wo2_wi1_sym_add1(ADD,354)@10
    u1_m0_wo2_wi1_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_9(15)) & xIn_9);
    u1_m0_wo2_wi1_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u1_m0_wo0_wi6_delayr2_q(15)) & u1_m0_wo0_wi6_delayr2_q);
    u1_m0_wo2_wi1_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo2_wi1_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo2_wi1_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo2_wi1_sym_add1_a) + SIGNED(u1_m0_wo2_wi1_sym_add1_b));
        END IF;
    END PROCESS;
    u1_m0_wo2_wi1_sym_add1_q <= u1_m0_wo2_wi1_sym_add1_o(16 downto 0);


	--u1_m0_wo2_mtree_madd2_0_constmult1_shift0(BITSHIFT,1869)@11
    u1_m0_wo2_mtree_madd2_0_constmult1_shift0_q_int <= u1_m0_wo2_wi1_sym_add1_q & "0000000000";
    u1_m0_wo2_mtree_madd2_0_constmult1_shift0_q <= u1_m0_wo2_mtree_madd2_0_constmult1_shift0_q_int(26 downto 0);

	--u1_m0_wo2_mtree_madd2_0_constmult1_sub_1(SUB,1870)@11
    u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_a <= STD_LOGIC_VECTOR((27 downto 1 => GND_q(0)) & GND_q);
    u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u1_m0_wo2_mtree_madd2_0_constmult1_shift0_q(26)) & u1_m0_wo2_mtree_madd2_0_constmult1_shift0_q);
    u1_m0_wo2_mtree_madd2_0_constmult1_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_a) - SIGNED(u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_q <= u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_o(27 downto 0);


	--u1_m0_wo2_mtree_madd2_0_constmult0_shift0(BITSHIFT,1866)@11
    u1_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int <= u1_m0_wo2_wi0_sym_add0_q & "000";
    u1_m0_wo2_mtree_madd2_0_constmult0_shift0_q <= u1_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int(19 downto 0);

	--u1_m0_wo2_wi0_sym_add0(ADD,353)@10
    u1_m0_wo2_wi0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_8(15)) & xIn_8);
    u1_m0_wo2_wi0_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => u1_m0_wo0_wi7_delayr1_q(15)) & u1_m0_wo0_wi7_delayr1_q);
    u1_m0_wo2_wi0_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo2_wi0_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo2_wi0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo2_wi0_sym_add0_a) + SIGNED(u1_m0_wo2_wi0_sym_add0_b));
        END IF;
    END PROCESS;
    u1_m0_wo2_wi0_sym_add0_q <= u1_m0_wo2_wi0_sym_add0_o(16 downto 0);


	--u1_m0_wo2_mtree_madd2_0_constmult0_add_1(ADD,1867)@11
    u1_m0_wo2_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((20 downto 17 => u1_m0_wo2_wi0_sym_add0_q(16)) & u1_m0_wo2_wi0_sym_add0_q);
    u1_m0_wo2_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((20 downto 20 => u1_m0_wo2_mtree_madd2_0_constmult0_shift0_q(19)) & u1_m0_wo2_mtree_madd2_0_constmult0_shift0_q);
    u1_m0_wo2_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo2_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo2_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo2_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u1_m0_wo2_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo2_mtree_madd2_0_constmult0_add_1_q <= u1_m0_wo2_mtree_madd2_0_constmult0_add_1_o(20 downto 0);


	--u1_m0_wo2_mtree_madd2_0_constmult0_shift2(BITSHIFT,1868)@12
    u1_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int <= u1_m0_wo2_mtree_madd2_0_constmult0_add_1_q & "0000000000";
    u1_m0_wo2_mtree_madd2_0_constmult0_shift2_q <= u1_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int(30 downto 0);

	--u1_m0_wo2_mtree_madd2_0_sum1(ADD,1871)@12
    u1_m0_wo2_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 31 => u1_m0_wo2_mtree_madd2_0_constmult0_shift2_q(30)) & u1_m0_wo2_mtree_madd2_0_constmult0_shift2_q);
    u1_m0_wo2_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 28 => u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_q(27)) & u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_q);
    u1_m0_wo2_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo2_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo2_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo2_mtree_madd2_0_sum1_a) + SIGNED(u1_m0_wo2_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u1_m0_wo2_mtree_madd2_0_sum1_q <= u1_m0_wo2_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u1_m0_wo0_wi7_phasedelay1_q_13_replace_mem(DUALMEM,2019)
    d_u1_m0_wo0_wi7_phasedelay1_q_13_replace_mem_reset0 <= areset;
    d_u1_m0_wo0_wi7_phasedelay1_q_13_replace_mem_ia <= u1_m0_wo0_wi7_delayr1_q;
    d_u1_m0_wo0_wi7_phasedelay1_q_13_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg_q;
    d_u1_m0_wo0_wi7_phasedelay1_q_13_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_q;
    d_u1_m0_wo0_wi7_phasedelay1_q_13_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u1_m0_wo0_wi7_phasedelay1_q_13_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u1_m0_wo0_wi7_phasedelay1_q_13_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u1_m0_wo0_wi7_phasedelay1_q_13_replace_mem_iq,
        address_a => d_u1_m0_wo0_wi7_phasedelay1_q_13_replace_mem_aa,
        data_a => d_u1_m0_wo0_wi7_phasedelay1_q_13_replace_mem_ia
    );
        d_u1_m0_wo0_wi7_phasedelay1_q_13_replace_mem_q <= d_u1_m0_wo0_wi7_phasedelay1_q_13_replace_mem_iq(15 downto 0);

	--u1_m0_wo1_mtree_mult1_0_shift0(BITSHIFT,1859)@13
    u1_m0_wo1_mtree_mult1_0_shift0_q_int <= d_u1_m0_wo0_wi7_phasedelay1_q_13_replace_mem_q & "00000000000000";
    u1_m0_wo1_mtree_mult1_0_shift0_q <= u1_m0_wo1_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u1_m0_wo0_wi5_delayr3(DELAY,113)@10
    u1_m0_wo0_wi5_delayr3 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_13, xout => u1_m0_wo0_wi5_delayr3_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u1_m0_wo0_wi0_sym_add0(ADD,131)@10
    u1_m0_wo0_wi0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_8(15)) & xIn_8);
    u1_m0_wo0_wi0_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => u1_m0_wo0_wi5_delayr3_q(15)) & u1_m0_wo0_wi5_delayr3_q);
    u1_m0_wo0_wi0_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_wi0_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_wi0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_wi0_sym_add0_a) + SIGNED(u1_m0_wo0_wi0_sym_add0_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_wi0_sym_add0_q <= u1_m0_wo0_wi0_sym_add0_o(16 downto 0);


	--u1_m0_wo0_mtree_madd2_0_constmult0_shift0(BITSHIFT,1850)@11
    u1_m0_wo0_mtree_madd2_0_constmult0_shift0_q_int <= u1_m0_wo0_wi0_sym_add0_q & "0000000000";
    u1_m0_wo0_mtree_madd2_0_constmult0_shift0_q <= u1_m0_wo0_mtree_madd2_0_constmult0_shift0_q_int(26 downto 0);

	--u1_m0_wo0_mtree_madd2_0_constmult0_sub_1(SUB,1851)@11
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_a <= STD_LOGIC_VECTOR((27 downto 1 => GND_q(0)) & GND_q);
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u1_m0_wo0_mtree_madd2_0_constmult0_shift0_q(26)) & u1_m0_wo0_mtree_madd2_0_constmult0_shift0_q);
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_a) - SIGNED(u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_q <= u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_o(27 downto 0);


	--u1_m0_wo0_mtree_madd2_0_constmult1_shift0(BITSHIFT,1852)@11
    u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int <= u1_m0_wo0_wi7_sym_add1_q & "000";
    u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q <= u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int(19 downto 0);

	--u1_m0_wo0_wi7_sym_add1(ADD,132)@10
    u1_m0_wo0_wi7_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => u1_m0_wo0_wi7_delayr1_q(15)) & u1_m0_wo0_wi7_delayr1_q);
    u1_m0_wo0_wi7_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u1_m0_wo0_wi6_delayr2_q(15)) & u1_m0_wo0_wi6_delayr2_q);
    u1_m0_wo0_wi7_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_wi7_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_wi7_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_wi7_sym_add1_a) + SIGNED(u1_m0_wo0_wi7_sym_add1_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_wi7_sym_add1_q <= u1_m0_wo0_wi7_sym_add1_o(16 downto 0);


	--u1_m0_wo0_mtree_madd2_0_constmult1_add_1(ADD,1853)@11
    u1_m0_wo0_mtree_madd2_0_constmult1_add_1_a <= STD_LOGIC_VECTOR((20 downto 17 => u1_m0_wo0_wi7_sym_add1_q(16)) & u1_m0_wo0_wi7_sym_add1_q);
    u1_m0_wo0_mtree_madd2_0_constmult1_add_1_b <= STD_LOGIC_VECTOR((20 downto 20 => u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q(19)) & u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q);
    u1_m0_wo0_mtree_madd2_0_constmult1_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_mtree_madd2_0_constmult1_add_1_a) + SIGNED(u1_m0_wo0_mtree_madd2_0_constmult1_add_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_mtree_madd2_0_constmult1_add_1_q <= u1_m0_wo0_mtree_madd2_0_constmult1_add_1_o(20 downto 0);


	--u1_m0_wo0_mtree_madd2_0_constmult1_shift2(BITSHIFT,1854)@12
    u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int <= u1_m0_wo0_mtree_madd2_0_constmult1_add_1_q & "0000000000";
    u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q <= u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int(30 downto 0);

	--u1_m0_wo0_mtree_madd2_0_sum1(ADD,1855)@12
    u1_m0_wo0_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 31 => u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q(30)) & u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q);
    u1_m0_wo0_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 28 => u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_q(27)) & u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_q);
    u1_m0_wo0_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_mtree_madd2_0_sum1_a) + SIGNED(u1_m0_wo0_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_mtree_madd2_0_sum1_q <= u1_m0_wo0_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u0_m0_wo12_wi6_phasedelay1_q_13_replace_mem(DUALMEM,2129)
    d_u0_m0_wo12_wi6_phasedelay1_q_13_replace_mem_reset0 <= areset;
    d_u0_m0_wo12_wi6_phasedelay1_q_13_replace_mem_ia <= xIn_6;
    d_u0_m0_wo12_wi6_phasedelay1_q_13_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg_q;
    d_u0_m0_wo12_wi6_phasedelay1_q_13_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_q;
    d_u0_m0_wo12_wi6_phasedelay1_q_13_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u0_m0_wo12_wi6_phasedelay1_q_13_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u0_m0_wo12_wi6_phasedelay1_q_13_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u0_m0_wo12_wi6_phasedelay1_q_13_replace_mem_iq,
        address_a => d_u0_m0_wo12_wi6_phasedelay1_q_13_replace_mem_aa,
        data_a => d_u0_m0_wo12_wi6_phasedelay1_q_13_replace_mem_ia
    );
        d_u0_m0_wo12_wi6_phasedelay1_q_13_replace_mem_q <= d_u0_m0_wo12_wi6_phasedelay1_q_13_replace_mem_iq(15 downto 0);

	--u0_m0_wo15_mtree_mult1_0_shift0(BITSHIFT,1969)@13
    u0_m0_wo15_mtree_mult1_0_shift0_q_int <= d_u0_m0_wo12_wi6_phasedelay1_q_13_replace_mem_q & "00000000000000";
    u0_m0_wo15_mtree_mult1_0_shift0_q <= u0_m0_wo15_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u0_m0_wo14_wi7_sym_add1(ADD,1620)@10
    u0_m0_wo14_wi7_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_7(15)) & xIn_7);
    u0_m0_wo14_wi7_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_4(15)) & xIn_4);
    u0_m0_wo14_wi7_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo14_wi7_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo14_wi7_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo14_wi7_sym_add1_a) + SIGNED(u0_m0_wo14_wi7_sym_add1_b));
        END IF;
    END PROCESS;
    u0_m0_wo14_wi7_sym_add1_q <= u0_m0_wo14_wi7_sym_add1_o(16 downto 0);


	--u0_m0_wo14_mtree_madd2_0_constmult1_shift0(BITSHIFT,1959)@11
    u0_m0_wo14_mtree_madd2_0_constmult1_shift0_q_int <= u0_m0_wo14_wi7_sym_add1_q & "0000000000";
    u0_m0_wo14_mtree_madd2_0_constmult1_shift0_q <= u0_m0_wo14_mtree_madd2_0_constmult1_shift0_q_int(26 downto 0);

	--u0_m0_wo14_mtree_madd2_0_constmult1_sub_1(SUB,1960)@11
    u0_m0_wo14_mtree_madd2_0_constmult1_sub_1_a <= STD_LOGIC_VECTOR((27 downto 1 => GND_q(0)) & GND_q);
    u0_m0_wo14_mtree_madd2_0_constmult1_sub_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo14_mtree_madd2_0_constmult1_shift0_q(26)) & u0_m0_wo14_mtree_madd2_0_constmult1_shift0_q);
    u0_m0_wo14_mtree_madd2_0_constmult1_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo14_mtree_madd2_0_constmult1_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo14_mtree_madd2_0_constmult1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo14_mtree_madd2_0_constmult1_sub_1_a) - SIGNED(u0_m0_wo14_mtree_madd2_0_constmult1_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo14_mtree_madd2_0_constmult1_sub_1_q <= u0_m0_wo14_mtree_madd2_0_constmult1_sub_1_o(27 downto 0);


	--u0_m0_wo14_mtree_madd2_0_constmult0_shift0(BITSHIFT,1956)@11
    u0_m0_wo14_mtree_madd2_0_constmult0_shift0_q_int <= u0_m0_wo14_wi6_sym_add0_q & "000";
    u0_m0_wo14_mtree_madd2_0_constmult0_shift0_q <= u0_m0_wo14_mtree_madd2_0_constmult0_shift0_q_int(19 downto 0);

	--u0_m0_wo14_wi6_sym_add0(ADD,1619)@10
    u0_m0_wo14_wi6_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_6(15)) & xIn_6);
    u0_m0_wo14_wi6_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_5(15)) & xIn_5);
    u0_m0_wo14_wi6_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo14_wi6_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo14_wi6_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo14_wi6_sym_add0_a) + SIGNED(u0_m0_wo14_wi6_sym_add0_b));
        END IF;
    END PROCESS;
    u0_m0_wo14_wi6_sym_add0_q <= u0_m0_wo14_wi6_sym_add0_o(16 downto 0);


	--u0_m0_wo14_mtree_madd2_0_constmult0_add_1(ADD,1957)@11
    u0_m0_wo14_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((20 downto 17 => u0_m0_wo14_wi6_sym_add0_q(16)) & u0_m0_wo14_wi6_sym_add0_q);
    u0_m0_wo14_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo14_mtree_madd2_0_constmult0_shift0_q(19)) & u0_m0_wo14_mtree_madd2_0_constmult0_shift0_q);
    u0_m0_wo14_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo14_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo14_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo14_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u0_m0_wo14_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo14_mtree_madd2_0_constmult0_add_1_q <= u0_m0_wo14_mtree_madd2_0_constmult0_add_1_o(20 downto 0);


	--u0_m0_wo14_mtree_madd2_0_constmult0_shift2(BITSHIFT,1958)@12
    u0_m0_wo14_mtree_madd2_0_constmult0_shift2_q_int <= u0_m0_wo14_mtree_madd2_0_constmult0_add_1_q & "0000000000";
    u0_m0_wo14_mtree_madd2_0_constmult0_shift2_q <= u0_m0_wo14_mtree_madd2_0_constmult0_shift2_q_int(30 downto 0);

	--u0_m0_wo14_mtree_madd2_0_sum1(ADD,1961)@12
    u0_m0_wo14_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo14_mtree_madd2_0_constmult0_shift2_q(30)) & u0_m0_wo14_mtree_madd2_0_constmult0_shift2_q);
    u0_m0_wo14_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 28 => u0_m0_wo14_mtree_madd2_0_constmult1_sub_1_q(27)) & u0_m0_wo14_mtree_madd2_0_constmult1_sub_1_q);
    u0_m0_wo14_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo14_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo14_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo14_mtree_madd2_0_sum1_a) + SIGNED(u0_m0_wo14_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u0_m0_wo14_mtree_madd2_0_sum1_q <= u0_m0_wo14_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u0_m0_wo10_wi5_phasedelay1_q_13_replace_mem(DUALMEM,2109)
    d_u0_m0_wo10_wi5_phasedelay1_q_13_replace_mem_reset0 <= areset;
    d_u0_m0_wo10_wi5_phasedelay1_q_13_replace_mem_ia <= xIn_5;
    d_u0_m0_wo10_wi5_phasedelay1_q_13_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg_q;
    d_u0_m0_wo10_wi5_phasedelay1_q_13_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_q;
    d_u0_m0_wo10_wi5_phasedelay1_q_13_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u0_m0_wo10_wi5_phasedelay1_q_13_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u0_m0_wo10_wi5_phasedelay1_q_13_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u0_m0_wo10_wi5_phasedelay1_q_13_replace_mem_iq,
        address_a => d_u0_m0_wo10_wi5_phasedelay1_q_13_replace_mem_aa,
        data_a => d_u0_m0_wo10_wi5_phasedelay1_q_13_replace_mem_ia
    );
        d_u0_m0_wo10_wi5_phasedelay1_q_13_replace_mem_q <= d_u0_m0_wo10_wi5_phasedelay1_q_13_replace_mem_iq(15 downto 0);

	--u0_m0_wo13_mtree_mult1_0_shift0(BITSHIFT,1953)@13
    u0_m0_wo13_mtree_mult1_0_shift0_q_int <= d_u0_m0_wo10_wi5_phasedelay1_q_13_replace_mem_q & "00000000000000";
    u0_m0_wo13_mtree_mult1_0_shift0_q <= u0_m0_wo13_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u0_m0_wo12_wi6_sym_add1(ADD,1398)@10
    u0_m0_wo12_wi6_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_6(15)) & xIn_6);
    u0_m0_wo12_wi6_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_3(15)) & xIn_3);
    u0_m0_wo12_wi6_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo12_wi6_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo12_wi6_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo12_wi6_sym_add1_a) + SIGNED(u0_m0_wo12_wi6_sym_add1_b));
        END IF;
    END PROCESS;
    u0_m0_wo12_wi6_sym_add1_q <= u0_m0_wo12_wi6_sym_add1_o(16 downto 0);


	--u0_m0_wo12_mtree_madd2_0_constmult1_shift0(BITSHIFT,1943)@11
    u0_m0_wo12_mtree_madd2_0_constmult1_shift0_q_int <= u0_m0_wo12_wi6_sym_add1_q & "0000000000";
    u0_m0_wo12_mtree_madd2_0_constmult1_shift0_q <= u0_m0_wo12_mtree_madd2_0_constmult1_shift0_q_int(26 downto 0);

	--u0_m0_wo12_mtree_madd2_0_constmult1_sub_1(SUB,1944)@11
    u0_m0_wo12_mtree_madd2_0_constmult1_sub_1_a <= STD_LOGIC_VECTOR((27 downto 1 => GND_q(0)) & GND_q);
    u0_m0_wo12_mtree_madd2_0_constmult1_sub_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo12_mtree_madd2_0_constmult1_shift0_q(26)) & u0_m0_wo12_mtree_madd2_0_constmult1_shift0_q);
    u0_m0_wo12_mtree_madd2_0_constmult1_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo12_mtree_madd2_0_constmult1_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo12_mtree_madd2_0_constmult1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo12_mtree_madd2_0_constmult1_sub_1_a) - SIGNED(u0_m0_wo12_mtree_madd2_0_constmult1_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo12_mtree_madd2_0_constmult1_sub_1_q <= u0_m0_wo12_mtree_madd2_0_constmult1_sub_1_o(27 downto 0);


	--u0_m0_wo12_mtree_madd2_0_constmult0_shift0(BITSHIFT,1940)@11
    u0_m0_wo12_mtree_madd2_0_constmult0_shift0_q_int <= u0_m0_wo12_wi5_sym_add0_q & "000";
    u0_m0_wo12_mtree_madd2_0_constmult0_shift0_q <= u0_m0_wo12_mtree_madd2_0_constmult0_shift0_q_int(19 downto 0);

	--u0_m0_wo12_wi5_sym_add0(ADD,1397)@10
    u0_m0_wo12_wi5_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_5(15)) & xIn_5);
    u0_m0_wo12_wi5_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_4(15)) & xIn_4);
    u0_m0_wo12_wi5_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo12_wi5_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo12_wi5_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo12_wi5_sym_add0_a) + SIGNED(u0_m0_wo12_wi5_sym_add0_b));
        END IF;
    END PROCESS;
    u0_m0_wo12_wi5_sym_add0_q <= u0_m0_wo12_wi5_sym_add0_o(16 downto 0);


	--u0_m0_wo12_mtree_madd2_0_constmult0_add_1(ADD,1941)@11
    u0_m0_wo12_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((20 downto 17 => u0_m0_wo12_wi5_sym_add0_q(16)) & u0_m0_wo12_wi5_sym_add0_q);
    u0_m0_wo12_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo12_mtree_madd2_0_constmult0_shift0_q(19)) & u0_m0_wo12_mtree_madd2_0_constmult0_shift0_q);
    u0_m0_wo12_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo12_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo12_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo12_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u0_m0_wo12_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo12_mtree_madd2_0_constmult0_add_1_q <= u0_m0_wo12_mtree_madd2_0_constmult0_add_1_o(20 downto 0);


	--u0_m0_wo12_mtree_madd2_0_constmult0_shift2(BITSHIFT,1942)@12
    u0_m0_wo12_mtree_madd2_0_constmult0_shift2_q_int <= u0_m0_wo12_mtree_madd2_0_constmult0_add_1_q & "0000000000";
    u0_m0_wo12_mtree_madd2_0_constmult0_shift2_q <= u0_m0_wo12_mtree_madd2_0_constmult0_shift2_q_int(30 downto 0);

	--u0_m0_wo12_mtree_madd2_0_sum1(ADD,1945)@12
    u0_m0_wo12_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo12_mtree_madd2_0_constmult0_shift2_q(30)) & u0_m0_wo12_mtree_madd2_0_constmult0_shift2_q);
    u0_m0_wo12_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 28 => u0_m0_wo12_mtree_madd2_0_constmult1_sub_1_q(27)) & u0_m0_wo12_mtree_madd2_0_constmult1_sub_1_q);
    u0_m0_wo12_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo12_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo12_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo12_mtree_madd2_0_sum1_a) + SIGNED(u0_m0_wo12_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u0_m0_wo12_mtree_madd2_0_sum1_q <= u0_m0_wo12_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u0_m0_wo8_wi4_phasedelay1_q_13_replace_mem(DUALMEM,2089)
    d_u0_m0_wo8_wi4_phasedelay1_q_13_replace_mem_reset0 <= areset;
    d_u0_m0_wo8_wi4_phasedelay1_q_13_replace_mem_ia <= xIn_4;
    d_u0_m0_wo8_wi4_phasedelay1_q_13_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg_q;
    d_u0_m0_wo8_wi4_phasedelay1_q_13_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_q;
    d_u0_m0_wo8_wi4_phasedelay1_q_13_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u0_m0_wo8_wi4_phasedelay1_q_13_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u0_m0_wo8_wi4_phasedelay1_q_13_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u0_m0_wo8_wi4_phasedelay1_q_13_replace_mem_iq,
        address_a => d_u0_m0_wo8_wi4_phasedelay1_q_13_replace_mem_aa,
        data_a => d_u0_m0_wo8_wi4_phasedelay1_q_13_replace_mem_ia
    );
        d_u0_m0_wo8_wi4_phasedelay1_q_13_replace_mem_q <= d_u0_m0_wo8_wi4_phasedelay1_q_13_replace_mem_iq(15 downto 0);

	--u0_m0_wo11_mtree_mult1_0_shift0(BITSHIFT,1937)@13
    u0_m0_wo11_mtree_mult1_0_shift0_q_int <= d_u0_m0_wo8_wi4_phasedelay1_q_13_replace_mem_q & "00000000000000";
    u0_m0_wo11_mtree_mult1_0_shift0_q <= u0_m0_wo11_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u0_m0_wo10_wi5_sym_add1(ADD,1176)@10
    u0_m0_wo10_wi5_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_5(15)) & xIn_5);
    u0_m0_wo10_wi5_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_2(15)) & xIn_2);
    u0_m0_wo10_wi5_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo10_wi5_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo10_wi5_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo10_wi5_sym_add1_a) + SIGNED(u0_m0_wo10_wi5_sym_add1_b));
        END IF;
    END PROCESS;
    u0_m0_wo10_wi5_sym_add1_q <= u0_m0_wo10_wi5_sym_add1_o(16 downto 0);


	--u0_m0_wo10_mtree_madd2_0_constmult1_shift0(BITSHIFT,1927)@11
    u0_m0_wo10_mtree_madd2_0_constmult1_shift0_q_int <= u0_m0_wo10_wi5_sym_add1_q & "0000000000";
    u0_m0_wo10_mtree_madd2_0_constmult1_shift0_q <= u0_m0_wo10_mtree_madd2_0_constmult1_shift0_q_int(26 downto 0);

	--u0_m0_wo10_mtree_madd2_0_constmult1_sub_1(SUB,1928)@11
    u0_m0_wo10_mtree_madd2_0_constmult1_sub_1_a <= STD_LOGIC_VECTOR((27 downto 1 => GND_q(0)) & GND_q);
    u0_m0_wo10_mtree_madd2_0_constmult1_sub_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo10_mtree_madd2_0_constmult1_shift0_q(26)) & u0_m0_wo10_mtree_madd2_0_constmult1_shift0_q);
    u0_m0_wo10_mtree_madd2_0_constmult1_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo10_mtree_madd2_0_constmult1_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo10_mtree_madd2_0_constmult1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo10_mtree_madd2_0_constmult1_sub_1_a) - SIGNED(u0_m0_wo10_mtree_madd2_0_constmult1_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo10_mtree_madd2_0_constmult1_sub_1_q <= u0_m0_wo10_mtree_madd2_0_constmult1_sub_1_o(27 downto 0);


	--u0_m0_wo10_mtree_madd2_0_constmult0_shift0(BITSHIFT,1924)@11
    u0_m0_wo10_mtree_madd2_0_constmult0_shift0_q_int <= u0_m0_wo10_wi4_sym_add0_q & "000";
    u0_m0_wo10_mtree_madd2_0_constmult0_shift0_q <= u0_m0_wo10_mtree_madd2_0_constmult0_shift0_q_int(19 downto 0);

	--u0_m0_wo10_wi4_sym_add0(ADD,1175)@10
    u0_m0_wo10_wi4_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_4(15)) & xIn_4);
    u0_m0_wo10_wi4_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_3(15)) & xIn_3);
    u0_m0_wo10_wi4_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo10_wi4_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo10_wi4_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo10_wi4_sym_add0_a) + SIGNED(u0_m0_wo10_wi4_sym_add0_b));
        END IF;
    END PROCESS;
    u0_m0_wo10_wi4_sym_add0_q <= u0_m0_wo10_wi4_sym_add0_o(16 downto 0);


	--u0_m0_wo10_mtree_madd2_0_constmult0_add_1(ADD,1925)@11
    u0_m0_wo10_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((20 downto 17 => u0_m0_wo10_wi4_sym_add0_q(16)) & u0_m0_wo10_wi4_sym_add0_q);
    u0_m0_wo10_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo10_mtree_madd2_0_constmult0_shift0_q(19)) & u0_m0_wo10_mtree_madd2_0_constmult0_shift0_q);
    u0_m0_wo10_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo10_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo10_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo10_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u0_m0_wo10_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo10_mtree_madd2_0_constmult0_add_1_q <= u0_m0_wo10_mtree_madd2_0_constmult0_add_1_o(20 downto 0);


	--u0_m0_wo10_mtree_madd2_0_constmult0_shift2(BITSHIFT,1926)@12
    u0_m0_wo10_mtree_madd2_0_constmult0_shift2_q_int <= u0_m0_wo10_mtree_madd2_0_constmult0_add_1_q & "0000000000";
    u0_m0_wo10_mtree_madd2_0_constmult0_shift2_q <= u0_m0_wo10_mtree_madd2_0_constmult0_shift2_q_int(30 downto 0);

	--u0_m0_wo10_mtree_madd2_0_sum1(ADD,1929)@12
    u0_m0_wo10_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo10_mtree_madd2_0_constmult0_shift2_q(30)) & u0_m0_wo10_mtree_madd2_0_constmult0_shift2_q);
    u0_m0_wo10_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 28 => u0_m0_wo10_mtree_madd2_0_constmult1_sub_1_q(27)) & u0_m0_wo10_mtree_madd2_0_constmult1_sub_1_q);
    u0_m0_wo10_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo10_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo10_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo10_mtree_madd2_0_sum1_a) + SIGNED(u0_m0_wo10_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u0_m0_wo10_mtree_madd2_0_sum1_q <= u0_m0_wo10_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u0_m0_wo6_wi3_phasedelay1_q_13_replace_mem(DUALMEM,2069)
    d_u0_m0_wo6_wi3_phasedelay1_q_13_replace_mem_reset0 <= areset;
    d_u0_m0_wo6_wi3_phasedelay1_q_13_replace_mem_ia <= xIn_3;
    d_u0_m0_wo6_wi3_phasedelay1_q_13_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg_q;
    d_u0_m0_wo6_wi3_phasedelay1_q_13_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_q;
    d_u0_m0_wo6_wi3_phasedelay1_q_13_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u0_m0_wo6_wi3_phasedelay1_q_13_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u0_m0_wo6_wi3_phasedelay1_q_13_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u0_m0_wo6_wi3_phasedelay1_q_13_replace_mem_iq,
        address_a => d_u0_m0_wo6_wi3_phasedelay1_q_13_replace_mem_aa,
        data_a => d_u0_m0_wo6_wi3_phasedelay1_q_13_replace_mem_ia
    );
        d_u0_m0_wo6_wi3_phasedelay1_q_13_replace_mem_q <= d_u0_m0_wo6_wi3_phasedelay1_q_13_replace_mem_iq(15 downto 0);

	--u0_m0_wo9_mtree_mult1_0_shift0(BITSHIFT,1921)@13
    u0_m0_wo9_mtree_mult1_0_shift0_q_int <= d_u0_m0_wo6_wi3_phasedelay1_q_13_replace_mem_q & "00000000000000";
    u0_m0_wo9_mtree_mult1_0_shift0_q <= u0_m0_wo9_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u0_m0_wo8_wi4_sym_add1(ADD,954)@10
    u0_m0_wo8_wi4_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_4(15)) & xIn_4);
    u0_m0_wo8_wi4_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_1(15)) & xIn_1);
    u0_m0_wo8_wi4_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo8_wi4_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo8_wi4_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo8_wi4_sym_add1_a) + SIGNED(u0_m0_wo8_wi4_sym_add1_b));
        END IF;
    END PROCESS;
    u0_m0_wo8_wi4_sym_add1_q <= u0_m0_wo8_wi4_sym_add1_o(16 downto 0);


	--u0_m0_wo8_mtree_madd2_0_constmult1_shift0(BITSHIFT,1911)@11
    u0_m0_wo8_mtree_madd2_0_constmult1_shift0_q_int <= u0_m0_wo8_wi4_sym_add1_q & "0000000000";
    u0_m0_wo8_mtree_madd2_0_constmult1_shift0_q <= u0_m0_wo8_mtree_madd2_0_constmult1_shift0_q_int(26 downto 0);

	--u0_m0_wo8_mtree_madd2_0_constmult1_sub_1(SUB,1912)@11
    u0_m0_wo8_mtree_madd2_0_constmult1_sub_1_a <= STD_LOGIC_VECTOR((27 downto 1 => GND_q(0)) & GND_q);
    u0_m0_wo8_mtree_madd2_0_constmult1_sub_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo8_mtree_madd2_0_constmult1_shift0_q(26)) & u0_m0_wo8_mtree_madd2_0_constmult1_shift0_q);
    u0_m0_wo8_mtree_madd2_0_constmult1_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo8_mtree_madd2_0_constmult1_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo8_mtree_madd2_0_constmult1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo8_mtree_madd2_0_constmult1_sub_1_a) - SIGNED(u0_m0_wo8_mtree_madd2_0_constmult1_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo8_mtree_madd2_0_constmult1_sub_1_q <= u0_m0_wo8_mtree_madd2_0_constmult1_sub_1_o(27 downto 0);


	--u0_m0_wo8_mtree_madd2_0_constmult0_shift0(BITSHIFT,1908)@11
    u0_m0_wo8_mtree_madd2_0_constmult0_shift0_q_int <= u0_m0_wo8_wi3_sym_add0_q & "000";
    u0_m0_wo8_mtree_madd2_0_constmult0_shift0_q <= u0_m0_wo8_mtree_madd2_0_constmult0_shift0_q_int(19 downto 0);

	--u0_m0_wo8_wi3_sym_add0(ADD,953)@10
    u0_m0_wo8_wi3_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_3(15)) & xIn_3);
    u0_m0_wo8_wi3_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_2(15)) & xIn_2);
    u0_m0_wo8_wi3_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo8_wi3_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo8_wi3_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo8_wi3_sym_add0_a) + SIGNED(u0_m0_wo8_wi3_sym_add0_b));
        END IF;
    END PROCESS;
    u0_m0_wo8_wi3_sym_add0_q <= u0_m0_wo8_wi3_sym_add0_o(16 downto 0);


	--u0_m0_wo8_mtree_madd2_0_constmult0_add_1(ADD,1909)@11
    u0_m0_wo8_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((20 downto 17 => u0_m0_wo8_wi3_sym_add0_q(16)) & u0_m0_wo8_wi3_sym_add0_q);
    u0_m0_wo8_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo8_mtree_madd2_0_constmult0_shift0_q(19)) & u0_m0_wo8_mtree_madd2_0_constmult0_shift0_q);
    u0_m0_wo8_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo8_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo8_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo8_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u0_m0_wo8_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo8_mtree_madd2_0_constmult0_add_1_q <= u0_m0_wo8_mtree_madd2_0_constmult0_add_1_o(20 downto 0);


	--u0_m0_wo8_mtree_madd2_0_constmult0_shift2(BITSHIFT,1910)@12
    u0_m0_wo8_mtree_madd2_0_constmult0_shift2_q_int <= u0_m0_wo8_mtree_madd2_0_constmult0_add_1_q & "0000000000";
    u0_m0_wo8_mtree_madd2_0_constmult0_shift2_q <= u0_m0_wo8_mtree_madd2_0_constmult0_shift2_q_int(30 downto 0);

	--u0_m0_wo8_mtree_madd2_0_sum1(ADD,1913)@12
    u0_m0_wo8_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo8_mtree_madd2_0_constmult0_shift2_q(30)) & u0_m0_wo8_mtree_madd2_0_constmult0_shift2_q);
    u0_m0_wo8_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 28 => u0_m0_wo8_mtree_madd2_0_constmult1_sub_1_q(27)) & u0_m0_wo8_mtree_madd2_0_constmult1_sub_1_q);
    u0_m0_wo8_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo8_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo8_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo8_mtree_madd2_0_sum1_a) + SIGNED(u0_m0_wo8_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u0_m0_wo8_mtree_madd2_0_sum1_q <= u0_m0_wo8_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u0_m0_wo4_wi2_phasedelay1_q_13_replace_mem(DUALMEM,2049)
    d_u0_m0_wo4_wi2_phasedelay1_q_13_replace_mem_reset0 <= areset;
    d_u0_m0_wo4_wi2_phasedelay1_q_13_replace_mem_ia <= xIn_2;
    d_u0_m0_wo4_wi2_phasedelay1_q_13_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg_q;
    d_u0_m0_wo4_wi2_phasedelay1_q_13_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_q;
    d_u0_m0_wo4_wi2_phasedelay1_q_13_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u0_m0_wo4_wi2_phasedelay1_q_13_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u0_m0_wo4_wi2_phasedelay1_q_13_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u0_m0_wo4_wi2_phasedelay1_q_13_replace_mem_iq,
        address_a => d_u0_m0_wo4_wi2_phasedelay1_q_13_replace_mem_aa,
        data_a => d_u0_m0_wo4_wi2_phasedelay1_q_13_replace_mem_ia
    );
        d_u0_m0_wo4_wi2_phasedelay1_q_13_replace_mem_q <= d_u0_m0_wo4_wi2_phasedelay1_q_13_replace_mem_iq(15 downto 0);

	--u0_m0_wo7_mtree_mult1_0_shift0(BITSHIFT,1905)@13
    u0_m0_wo7_mtree_mult1_0_shift0_q_int <= d_u0_m0_wo4_wi2_phasedelay1_q_13_replace_mem_q & "00000000000000";
    u0_m0_wo7_mtree_mult1_0_shift0_q <= u0_m0_wo7_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u0_m0_wo6_wi3_sym_add1(ADD,732)@10
    u0_m0_wo6_wi3_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_3(15)) & xIn_3);
    u0_m0_wo6_wi3_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_0(15)) & xIn_0);
    u0_m0_wo6_wi3_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo6_wi3_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo6_wi3_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo6_wi3_sym_add1_a) + SIGNED(u0_m0_wo6_wi3_sym_add1_b));
        END IF;
    END PROCESS;
    u0_m0_wo6_wi3_sym_add1_q <= u0_m0_wo6_wi3_sym_add1_o(16 downto 0);


	--u0_m0_wo6_mtree_madd2_0_constmult1_shift0(BITSHIFT,1895)@11
    u0_m0_wo6_mtree_madd2_0_constmult1_shift0_q_int <= u0_m0_wo6_wi3_sym_add1_q & "0000000000";
    u0_m0_wo6_mtree_madd2_0_constmult1_shift0_q <= u0_m0_wo6_mtree_madd2_0_constmult1_shift0_q_int(26 downto 0);

	--u0_m0_wo6_mtree_madd2_0_constmult1_sub_1(SUB,1896)@11
    u0_m0_wo6_mtree_madd2_0_constmult1_sub_1_a <= STD_LOGIC_VECTOR((27 downto 1 => GND_q(0)) & GND_q);
    u0_m0_wo6_mtree_madd2_0_constmult1_sub_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo6_mtree_madd2_0_constmult1_shift0_q(26)) & u0_m0_wo6_mtree_madd2_0_constmult1_shift0_q);
    u0_m0_wo6_mtree_madd2_0_constmult1_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo6_mtree_madd2_0_constmult1_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo6_mtree_madd2_0_constmult1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo6_mtree_madd2_0_constmult1_sub_1_a) - SIGNED(u0_m0_wo6_mtree_madd2_0_constmult1_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo6_mtree_madd2_0_constmult1_sub_1_q <= u0_m0_wo6_mtree_madd2_0_constmult1_sub_1_o(27 downto 0);


	--u0_m0_wo6_mtree_madd2_0_constmult0_shift0(BITSHIFT,1892)@11
    u0_m0_wo6_mtree_madd2_0_constmult0_shift0_q_int <= u0_m0_wo6_wi2_sym_add0_q & "000";
    u0_m0_wo6_mtree_madd2_0_constmult0_shift0_q <= u0_m0_wo6_mtree_madd2_0_constmult0_shift0_q_int(19 downto 0);

	--u0_m0_wo6_wi2_sym_add0(ADD,731)@10
    u0_m0_wo6_wi2_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_2(15)) & xIn_2);
    u0_m0_wo6_wi2_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_1(15)) & xIn_1);
    u0_m0_wo6_wi2_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo6_wi2_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo6_wi2_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo6_wi2_sym_add0_a) + SIGNED(u0_m0_wo6_wi2_sym_add0_b));
        END IF;
    END PROCESS;
    u0_m0_wo6_wi2_sym_add0_q <= u0_m0_wo6_wi2_sym_add0_o(16 downto 0);


	--u0_m0_wo6_mtree_madd2_0_constmult0_add_1(ADD,1893)@11
    u0_m0_wo6_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((20 downto 17 => u0_m0_wo6_wi2_sym_add0_q(16)) & u0_m0_wo6_wi2_sym_add0_q);
    u0_m0_wo6_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo6_mtree_madd2_0_constmult0_shift0_q(19)) & u0_m0_wo6_mtree_madd2_0_constmult0_shift0_q);
    u0_m0_wo6_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo6_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo6_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo6_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u0_m0_wo6_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo6_mtree_madd2_0_constmult0_add_1_q <= u0_m0_wo6_mtree_madd2_0_constmult0_add_1_o(20 downto 0);


	--u0_m0_wo6_mtree_madd2_0_constmult0_shift2(BITSHIFT,1894)@12
    u0_m0_wo6_mtree_madd2_0_constmult0_shift2_q_int <= u0_m0_wo6_mtree_madd2_0_constmult0_add_1_q & "0000000000";
    u0_m0_wo6_mtree_madd2_0_constmult0_shift2_q <= u0_m0_wo6_mtree_madd2_0_constmult0_shift2_q_int(30 downto 0);

	--u0_m0_wo6_mtree_madd2_0_sum1(ADD,1897)@12
    u0_m0_wo6_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo6_mtree_madd2_0_constmult0_shift2_q(30)) & u0_m0_wo6_mtree_madd2_0_constmult0_shift2_q);
    u0_m0_wo6_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 28 => u0_m0_wo6_mtree_madd2_0_constmult1_sub_1_q(27)) & u0_m0_wo6_mtree_madd2_0_constmult1_sub_1_q);
    u0_m0_wo6_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo6_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo6_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo6_mtree_madd2_0_sum1_a) + SIGNED(u0_m0_wo6_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u0_m0_wo6_mtree_madd2_0_sum1_q <= u0_m0_wo6_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u0_m0_wo2_wi1_phasedelay1_q_13_replace_mem(DUALMEM,2029)
    d_u0_m0_wo2_wi1_phasedelay1_q_13_replace_mem_reset0 <= areset;
    d_u0_m0_wo2_wi1_phasedelay1_q_13_replace_mem_ia <= xIn_1;
    d_u0_m0_wo2_wi1_phasedelay1_q_13_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg_q;
    d_u0_m0_wo2_wi1_phasedelay1_q_13_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_q;
    d_u0_m0_wo2_wi1_phasedelay1_q_13_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u0_m0_wo2_wi1_phasedelay1_q_13_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u0_m0_wo2_wi1_phasedelay1_q_13_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u0_m0_wo2_wi1_phasedelay1_q_13_replace_mem_iq,
        address_a => d_u0_m0_wo2_wi1_phasedelay1_q_13_replace_mem_aa,
        data_a => d_u0_m0_wo2_wi1_phasedelay1_q_13_replace_mem_ia
    );
        d_u0_m0_wo2_wi1_phasedelay1_q_13_replace_mem_q <= d_u0_m0_wo2_wi1_phasedelay1_q_13_replace_mem_iq(15 downto 0);

	--u0_m0_wo5_mtree_mult1_0_shift0(BITSHIFT,1889)@13
    u0_m0_wo5_mtree_mult1_0_shift0_q_int <= d_u0_m0_wo2_wi1_phasedelay1_q_13_replace_mem_q & "00000000000000";
    u0_m0_wo5_mtree_mult1_0_shift0_q <= u0_m0_wo5_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u0_m0_wo0_wi7_delayr1(DELAY,59)@10
    u0_m0_wo0_wi7_delayr1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_7, xout => u0_m0_wo0_wi7_delayr1_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo4_wi2_sym_add1(ADD,510)@10
    u0_m0_wo4_wi2_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_2(15)) & xIn_2);
    u0_m0_wo4_wi2_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi7_delayr1_q(15)) & u0_m0_wo0_wi7_delayr1_q);
    u0_m0_wo4_wi2_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo4_wi2_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo4_wi2_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo4_wi2_sym_add1_a) + SIGNED(u0_m0_wo4_wi2_sym_add1_b));
        END IF;
    END PROCESS;
    u0_m0_wo4_wi2_sym_add1_q <= u0_m0_wo4_wi2_sym_add1_o(16 downto 0);


	--u0_m0_wo4_mtree_madd2_0_constmult1_shift0(BITSHIFT,1879)@11
    u0_m0_wo4_mtree_madd2_0_constmult1_shift0_q_int <= u0_m0_wo4_wi2_sym_add1_q & "0000000000";
    u0_m0_wo4_mtree_madd2_0_constmult1_shift0_q <= u0_m0_wo4_mtree_madd2_0_constmult1_shift0_q_int(26 downto 0);

	--u0_m0_wo4_mtree_madd2_0_constmult1_sub_1(SUB,1880)@11
    u0_m0_wo4_mtree_madd2_0_constmult1_sub_1_a <= STD_LOGIC_VECTOR((27 downto 1 => GND_q(0)) & GND_q);
    u0_m0_wo4_mtree_madd2_0_constmult1_sub_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo4_mtree_madd2_0_constmult1_shift0_q(26)) & u0_m0_wo4_mtree_madd2_0_constmult1_shift0_q);
    u0_m0_wo4_mtree_madd2_0_constmult1_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo4_mtree_madd2_0_constmult1_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo4_mtree_madd2_0_constmult1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo4_mtree_madd2_0_constmult1_sub_1_a) - SIGNED(u0_m0_wo4_mtree_madd2_0_constmult1_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo4_mtree_madd2_0_constmult1_sub_1_q <= u0_m0_wo4_mtree_madd2_0_constmult1_sub_1_o(27 downto 0);


	--u0_m0_wo4_mtree_madd2_0_constmult0_shift0(BITSHIFT,1876)@11
    u0_m0_wo4_mtree_madd2_0_constmult0_shift0_q_int <= u0_m0_wo4_wi1_sym_add0_q & "000";
    u0_m0_wo4_mtree_madd2_0_constmult0_shift0_q <= u0_m0_wo4_mtree_madd2_0_constmult0_shift0_q_int(19 downto 0);

	--u0_m0_wo4_wi1_sym_add0(ADD,509)@10
    u0_m0_wo4_wi1_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_1(15)) & xIn_1);
    u0_m0_wo4_wi1_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_0(15)) & xIn_0);
    u0_m0_wo4_wi1_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo4_wi1_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo4_wi1_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo4_wi1_sym_add0_a) + SIGNED(u0_m0_wo4_wi1_sym_add0_b));
        END IF;
    END PROCESS;
    u0_m0_wo4_wi1_sym_add0_q <= u0_m0_wo4_wi1_sym_add0_o(16 downto 0);


	--u0_m0_wo4_mtree_madd2_0_constmult0_add_1(ADD,1877)@11
    u0_m0_wo4_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((20 downto 17 => u0_m0_wo4_wi1_sym_add0_q(16)) & u0_m0_wo4_wi1_sym_add0_q);
    u0_m0_wo4_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo4_mtree_madd2_0_constmult0_shift0_q(19)) & u0_m0_wo4_mtree_madd2_0_constmult0_shift0_q);
    u0_m0_wo4_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo4_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo4_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo4_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u0_m0_wo4_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo4_mtree_madd2_0_constmult0_add_1_q <= u0_m0_wo4_mtree_madd2_0_constmult0_add_1_o(20 downto 0);


	--u0_m0_wo4_mtree_madd2_0_constmult0_shift2(BITSHIFT,1878)@12
    u0_m0_wo4_mtree_madd2_0_constmult0_shift2_q_int <= u0_m0_wo4_mtree_madd2_0_constmult0_add_1_q & "0000000000";
    u0_m0_wo4_mtree_madd2_0_constmult0_shift2_q <= u0_m0_wo4_mtree_madd2_0_constmult0_shift2_q_int(30 downto 0);

	--u0_m0_wo4_mtree_madd2_0_sum1(ADD,1881)@12
    u0_m0_wo4_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo4_mtree_madd2_0_constmult0_shift2_q(30)) & u0_m0_wo4_mtree_madd2_0_constmult0_shift2_q);
    u0_m0_wo4_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 28 => u0_m0_wo4_mtree_madd2_0_constmult1_sub_1_q(27)) & u0_m0_wo4_mtree_madd2_0_constmult1_sub_1_q);
    u0_m0_wo4_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo4_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo4_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo4_mtree_madd2_0_sum1_a) + SIGNED(u0_m0_wo4_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u0_m0_wo4_mtree_madd2_0_sum1_q <= u0_m0_wo4_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_mem(DUALMEM,1989)
    d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_mem_reset0 <= areset;
    d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_mem_ia <= xIn_0;
    d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_mem_iq,
        address_a => d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_mem_aa,
        data_a => d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_mem_ia
    );
        d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_mem_q <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_mem_iq(15 downto 0);

	--u0_m0_wo3_mtree_mult1_0_shift0(BITSHIFT,1873)@13
    u0_m0_wo3_mtree_mult1_0_shift0_q_int <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_mem_q & "00000000000000";
    u0_m0_wo3_mtree_mult1_0_shift0_q <= u0_m0_wo3_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u0_m0_wo0_wi6_delayr2(DELAY,53)@10
    u0_m0_wo0_wi6_delayr2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_6, xout => u0_m0_wo0_wi6_delayr2_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo2_wi1_sym_add1(ADD,288)@10
    u0_m0_wo2_wi1_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_1(15)) & xIn_1);
    u0_m0_wo2_wi1_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi6_delayr2_q(15)) & u0_m0_wo0_wi6_delayr2_q);
    u0_m0_wo2_wi1_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_wi1_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_wi1_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_wi1_sym_add1_a) + SIGNED(u0_m0_wo2_wi1_sym_add1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_wi1_sym_add1_q <= u0_m0_wo2_wi1_sym_add1_o(16 downto 0);


	--u0_m0_wo2_mtree_madd2_0_constmult1_shift0(BITSHIFT,1863)@11
    u0_m0_wo2_mtree_madd2_0_constmult1_shift0_q_int <= u0_m0_wo2_wi1_sym_add1_q & "0000000000";
    u0_m0_wo2_mtree_madd2_0_constmult1_shift0_q <= u0_m0_wo2_mtree_madd2_0_constmult1_shift0_q_int(26 downto 0);

	--u0_m0_wo2_mtree_madd2_0_constmult1_sub_1(SUB,1864)@11
    u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_a <= STD_LOGIC_VECTOR((27 downto 1 => GND_q(0)) & GND_q);
    u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo2_mtree_madd2_0_constmult1_shift0_q(26)) & u0_m0_wo2_mtree_madd2_0_constmult1_shift0_q);
    u0_m0_wo2_mtree_madd2_0_constmult1_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_a) - SIGNED(u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_q <= u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_o(27 downto 0);


	--u0_m0_wo2_mtree_madd2_0_constmult0_shift0(BITSHIFT,1860)@11
    u0_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int <= u0_m0_wo2_wi0_sym_add0_q & "000";
    u0_m0_wo2_mtree_madd2_0_constmult0_shift0_q <= u0_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int(19 downto 0);

	--u0_m0_wo2_wi0_sym_add0(ADD,287)@10
    u0_m0_wo2_wi0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_0(15)) & xIn_0);
    u0_m0_wo2_wi0_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi7_delayr1_q(15)) & u0_m0_wo0_wi7_delayr1_q);
    u0_m0_wo2_wi0_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_wi0_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_wi0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_wi0_sym_add0_a) + SIGNED(u0_m0_wo2_wi0_sym_add0_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_wi0_sym_add0_q <= u0_m0_wo2_wi0_sym_add0_o(16 downto 0);


	--u0_m0_wo2_mtree_madd2_0_constmult0_add_1(ADD,1861)@11
    u0_m0_wo2_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((20 downto 17 => u0_m0_wo2_wi0_sym_add0_q(16)) & u0_m0_wo2_wi0_sym_add0_q);
    u0_m0_wo2_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo2_mtree_madd2_0_constmult0_shift0_q(19)) & u0_m0_wo2_mtree_madd2_0_constmult0_shift0_q);
    u0_m0_wo2_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u0_m0_wo2_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_madd2_0_constmult0_add_1_q <= u0_m0_wo2_mtree_madd2_0_constmult0_add_1_o(20 downto 0);


	--u0_m0_wo2_mtree_madd2_0_constmult0_shift2(BITSHIFT,1862)@12
    u0_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int <= u0_m0_wo2_mtree_madd2_0_constmult0_add_1_q & "0000000000";
    u0_m0_wo2_mtree_madd2_0_constmult0_shift2_q <= u0_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int(30 downto 0);

	--u0_m0_wo2_mtree_madd2_0_sum1(ADD,1865)@12
    u0_m0_wo2_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo2_mtree_madd2_0_constmult0_shift2_q(30)) & u0_m0_wo2_mtree_madd2_0_constmult0_shift2_q);
    u0_m0_wo2_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 28 => u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_q(27)) & u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_q);
    u0_m0_wo2_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_madd2_0_sum1_a) + SIGNED(u0_m0_wo2_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_madd2_0_sum1_q <= u0_m0_wo2_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u0_m0_wo0_wi7_phasedelay1_q_13_replace_mem(DUALMEM,1999)
    d_u0_m0_wo0_wi7_phasedelay1_q_13_replace_mem_reset0 <= areset;
    d_u0_m0_wo0_wi7_phasedelay1_q_13_replace_mem_ia <= u0_m0_wo0_wi7_delayr1_q;
    d_u0_m0_wo0_wi7_phasedelay1_q_13_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdreg_q;
    d_u0_m0_wo0_wi7_phasedelay1_q_13_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_13_replace_rdmux_q;
    d_u0_m0_wo0_wi7_phasedelay1_q_13_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 16,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_13_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u0_m0_wo0_wi7_phasedelay1_q_13_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u0_m0_wo0_wi7_phasedelay1_q_13_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u0_m0_wo0_wi7_phasedelay1_q_13_replace_mem_iq,
        address_a => d_u0_m0_wo0_wi7_phasedelay1_q_13_replace_mem_aa,
        data_a => d_u0_m0_wo0_wi7_phasedelay1_q_13_replace_mem_ia
    );
        d_u0_m0_wo0_wi7_phasedelay1_q_13_replace_mem_q <= d_u0_m0_wo0_wi7_phasedelay1_q_13_replace_mem_iq(15 downto 0);

	--u0_m0_wo1_mtree_mult1_0_shift0(BITSHIFT,1857)@13
    u0_m0_wo1_mtree_mult1_0_shift0_q_int <= d_u0_m0_wo0_wi7_phasedelay1_q_13_replace_mem_q & "00000000000000";
    u0_m0_wo1_mtree_mult1_0_shift0_q <= u0_m0_wo1_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u0_m0_wo0_wi5_delayr3(DELAY,47)@10
    u0_m0_wo0_wi5_delayr3 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_5, xout => u0_m0_wo0_wi5_delayr3_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo0_wi0_sym_add0(ADD,65)@10
    u0_m0_wo0_wi0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_0(15)) & xIn_0);
    u0_m0_wo0_wi0_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi5_delayr3_q(15)) & u0_m0_wo0_wi5_delayr3_q);
    u0_m0_wo0_wi0_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_wi0_sym_add0_a) + SIGNED(u0_m0_wo0_wi0_sym_add0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_sym_add0_q <= u0_m0_wo0_wi0_sym_add0_o(16 downto 0);


	--u0_m0_wo0_mtree_madd2_0_constmult0_shift0(BITSHIFT,1844)@11
    u0_m0_wo0_mtree_madd2_0_constmult0_shift0_q_int <= u0_m0_wo0_wi0_sym_add0_q & "0000000000";
    u0_m0_wo0_mtree_madd2_0_constmult0_shift0_q <= u0_m0_wo0_mtree_madd2_0_constmult0_shift0_q_int(26 downto 0);

	--u0_m0_wo0_mtree_madd2_0_constmult0_sub_1(SUB,1845)@11
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_a <= STD_LOGIC_VECTOR((27 downto 1 => GND_q(0)) & GND_q);
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_madd2_0_constmult0_shift0_q(26)) & u0_m0_wo0_mtree_madd2_0_constmult0_shift0_q);
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_a) - SIGNED(u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_q <= u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_o(27 downto 0);


	--u0_m0_wo0_mtree_madd2_0_constmult1_shift0(BITSHIFT,1846)@11
    u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int <= u0_m0_wo0_wi7_sym_add1_q & "000";
    u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q <= u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int(19 downto 0);

	--u0_m0_wo0_wi7_sym_add1(ADD,66)@10
    u0_m0_wo0_wi7_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi7_delayr1_q(15)) & u0_m0_wo0_wi7_delayr1_q);
    u0_m0_wo0_wi7_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi6_delayr2_q(15)) & u0_m0_wo0_wi6_delayr2_q);
    u0_m0_wo0_wi7_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi7_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi7_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_wi7_sym_add1_a) + SIGNED(u0_m0_wo0_wi7_sym_add1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_wi7_sym_add1_q <= u0_m0_wo0_wi7_sym_add1_o(16 downto 0);


	--u0_m0_wo0_mtree_madd2_0_constmult1_add_1(ADD,1847)@11
    u0_m0_wo0_mtree_madd2_0_constmult1_add_1_a <= STD_LOGIC_VECTOR((20 downto 17 => u0_m0_wo0_wi7_sym_add1_q(16)) & u0_m0_wo0_wi7_sym_add1_q);
    u0_m0_wo0_mtree_madd2_0_constmult1_add_1_b <= STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q(19)) & u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q);
    u0_m0_wo0_mtree_madd2_0_constmult1_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_madd2_0_constmult1_add_1_a) + SIGNED(u0_m0_wo0_mtree_madd2_0_constmult1_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_madd2_0_constmult1_add_1_q <= u0_m0_wo0_mtree_madd2_0_constmult1_add_1_o(20 downto 0);


	--u0_m0_wo0_mtree_madd2_0_constmult1_shift2(BITSHIFT,1848)@12
    u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int <= u0_m0_wo0_mtree_madd2_0_constmult1_add_1_q & "0000000000";
    u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q <= u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int(30 downto 0);

	--u0_m0_wo0_mtree_madd2_0_sum1(ADD,1849)@12
    u0_m0_wo0_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q(30)) & u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q);
    u0_m0_wo0_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 28 => u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_q(27)) & u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_q);
    u0_m0_wo0_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_madd2_0_sum1_a) + SIGNED(u0_m0_wo0_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_madd2_0_sum1_q <= u0_m0_wo0_mtree_madd2_0_sum1_o(31 downto 0);


	--GND(CONSTANT,0)@0
    GND_q <= "0";

	--d_in0_m0_wi0_wo0_assign_sel_q_12(DELAY,1972)@10
    d_in0_m0_wi0_wo0_assign_sel_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => xIn_v, xout => d_in0_m0_wi0_wo0_assign_sel_q_12_q, clk => clk, aclr => areset );

	--u0_m0_wo0_oseq_gated_reg(REG,68)@12
    u0_m0_wo0_oseq_gated_reg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= d_in0_m0_wi0_wo0_assign_sel_q_12_q;
        END IF;
    END PROCESS;


	--xOut(PORTOUT,1843)@13
    xOut_v <= u0_m0_wo0_oseq_gated_reg_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= STD_LOGIC_VECTOR((33 downto 32 => u0_m0_wo0_mtree_madd2_0_sum1_q(31)) & u0_m0_wo0_mtree_madd2_0_sum1_q);
    xOut_1 <= STD_LOGIC_VECTOR((33 downto 30 => u0_m0_wo1_mtree_mult1_0_shift0_q(29)) & u0_m0_wo1_mtree_mult1_0_shift0_q);
    xOut_2 <= STD_LOGIC_VECTOR((33 downto 32 => u0_m0_wo2_mtree_madd2_0_sum1_q(31)) & u0_m0_wo2_mtree_madd2_0_sum1_q);
    xOut_3 <= STD_LOGIC_VECTOR((33 downto 30 => u0_m0_wo3_mtree_mult1_0_shift0_q(29)) & u0_m0_wo3_mtree_mult1_0_shift0_q);
    xOut_4 <= STD_LOGIC_VECTOR((33 downto 32 => u0_m0_wo4_mtree_madd2_0_sum1_q(31)) & u0_m0_wo4_mtree_madd2_0_sum1_q);
    xOut_5 <= STD_LOGIC_VECTOR((33 downto 30 => u0_m0_wo5_mtree_mult1_0_shift0_q(29)) & u0_m0_wo5_mtree_mult1_0_shift0_q);
    xOut_6 <= STD_LOGIC_VECTOR((33 downto 32 => u0_m0_wo6_mtree_madd2_0_sum1_q(31)) & u0_m0_wo6_mtree_madd2_0_sum1_q);
    xOut_7 <= STD_LOGIC_VECTOR((33 downto 30 => u0_m0_wo7_mtree_mult1_0_shift0_q(29)) & u0_m0_wo7_mtree_mult1_0_shift0_q);
    xOut_8 <= STD_LOGIC_VECTOR((33 downto 32 => u0_m0_wo8_mtree_madd2_0_sum1_q(31)) & u0_m0_wo8_mtree_madd2_0_sum1_q);
    xOut_9 <= STD_LOGIC_VECTOR((33 downto 30 => u0_m0_wo9_mtree_mult1_0_shift0_q(29)) & u0_m0_wo9_mtree_mult1_0_shift0_q);
    xOut_10 <= STD_LOGIC_VECTOR((33 downto 32 => u0_m0_wo10_mtree_madd2_0_sum1_q(31)) & u0_m0_wo10_mtree_madd2_0_sum1_q);
    xOut_11 <= STD_LOGIC_VECTOR((33 downto 30 => u0_m0_wo11_mtree_mult1_0_shift0_q(29)) & u0_m0_wo11_mtree_mult1_0_shift0_q);
    xOut_12 <= STD_LOGIC_VECTOR((33 downto 32 => u0_m0_wo12_mtree_madd2_0_sum1_q(31)) & u0_m0_wo12_mtree_madd2_0_sum1_q);
    xOut_13 <= STD_LOGIC_VECTOR((33 downto 30 => u0_m0_wo13_mtree_mult1_0_shift0_q(29)) & u0_m0_wo13_mtree_mult1_0_shift0_q);
    xOut_14 <= STD_LOGIC_VECTOR((33 downto 32 => u0_m0_wo14_mtree_madd2_0_sum1_q(31)) & u0_m0_wo14_mtree_madd2_0_sum1_q);
    xOut_15 <= STD_LOGIC_VECTOR((33 downto 30 => u0_m0_wo15_mtree_mult1_0_shift0_q(29)) & u0_m0_wo15_mtree_mult1_0_shift0_q);
    xOut_16 <= STD_LOGIC_VECTOR((33 downto 32 => u1_m0_wo0_mtree_madd2_0_sum1_q(31)) & u1_m0_wo0_mtree_madd2_0_sum1_q);
    xOut_17 <= STD_LOGIC_VECTOR((33 downto 30 => u1_m0_wo1_mtree_mult1_0_shift0_q(29)) & u1_m0_wo1_mtree_mult1_0_shift0_q);
    xOut_18 <= STD_LOGIC_VECTOR((33 downto 32 => u1_m0_wo2_mtree_madd2_0_sum1_q(31)) & u1_m0_wo2_mtree_madd2_0_sum1_q);
    xOut_19 <= STD_LOGIC_VECTOR((33 downto 30 => u1_m0_wo3_mtree_mult1_0_shift0_q(29)) & u1_m0_wo3_mtree_mult1_0_shift0_q);
    xOut_20 <= STD_LOGIC_VECTOR((33 downto 32 => u1_m0_wo4_mtree_madd2_0_sum1_q(31)) & u1_m0_wo4_mtree_madd2_0_sum1_q);
    xOut_21 <= STD_LOGIC_VECTOR((33 downto 30 => u1_m0_wo5_mtree_mult1_0_shift0_q(29)) & u1_m0_wo5_mtree_mult1_0_shift0_q);
    xOut_22 <= STD_LOGIC_VECTOR((33 downto 32 => u1_m0_wo6_mtree_madd2_0_sum1_q(31)) & u1_m0_wo6_mtree_madd2_0_sum1_q);
    xOut_23 <= STD_LOGIC_VECTOR((33 downto 30 => u1_m0_wo7_mtree_mult1_0_shift0_q(29)) & u1_m0_wo7_mtree_mult1_0_shift0_q);
    xOut_24 <= STD_LOGIC_VECTOR((33 downto 32 => u1_m0_wo8_mtree_madd2_0_sum1_q(31)) & u1_m0_wo8_mtree_madd2_0_sum1_q);
    xOut_25 <= STD_LOGIC_VECTOR((33 downto 30 => u1_m0_wo9_mtree_mult1_0_shift0_q(29)) & u1_m0_wo9_mtree_mult1_0_shift0_q);
    xOut_26 <= STD_LOGIC_VECTOR((33 downto 32 => u1_m0_wo10_mtree_madd2_0_sum1_q(31)) & u1_m0_wo10_mtree_madd2_0_sum1_q);
    xOut_27 <= STD_LOGIC_VECTOR((33 downto 30 => u1_m0_wo11_mtree_mult1_0_shift0_q(29)) & u1_m0_wo11_mtree_mult1_0_shift0_q);
    xOut_28 <= STD_LOGIC_VECTOR((33 downto 32 => u1_m0_wo12_mtree_madd2_0_sum1_q(31)) & u1_m0_wo12_mtree_madd2_0_sum1_q);
    xOut_29 <= STD_LOGIC_VECTOR((33 downto 30 => u1_m0_wo13_mtree_mult1_0_shift0_q(29)) & u1_m0_wo13_mtree_mult1_0_shift0_q);
    xOut_30 <= STD_LOGIC_VECTOR((33 downto 32 => u1_m0_wo14_mtree_madd2_0_sum1_q(31)) & u1_m0_wo14_mtree_madd2_0_sum1_q);
    xOut_31 <= STD_LOGIC_VECTOR((33 downto 30 => u1_m0_wo15_mtree_mult1_0_shift0_q(29)) & u1_m0_wo15_mtree_mult1_0_shift0_q);


end normal;
