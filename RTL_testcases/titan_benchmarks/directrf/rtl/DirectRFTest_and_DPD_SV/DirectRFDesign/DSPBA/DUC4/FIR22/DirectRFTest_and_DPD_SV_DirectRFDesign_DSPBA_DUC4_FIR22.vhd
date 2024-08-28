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

-- VHDL created from DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR22
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
entity DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR22 is
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
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR22 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_memread_q_13_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr2_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi1_delayr1_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi1_delayr3_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_sym_add0_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_wi0_sym_add0_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_wi0_sym_add0_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_wi0_sym_add0_q : std_logic_vector (16 downto 0);
    signal d_u0_m0_wo0_wi0_sym_add0_q_12_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_wi1_sym_add1_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_wi1_sym_add1_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_wi1_sym_add1_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_wi1_sym_add1_q : std_logic_vector (16 downto 0);
    signal d_u0_m0_wo0_wi1_sym_add1_q_12_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_oseq_gated_reg_q : std_logic_vector (0 downto 0);
    signal u1_m0_wo0_wi0_delayr2_q : std_logic_vector (15 downto 0);
    signal u1_m0_wo0_wi1_delayr1_q : std_logic_vector (15 downto 0);
    signal u1_m0_wo0_wi1_delayr3_q : std_logic_vector (15 downto 0);
    signal u1_m0_wo0_wi0_sym_add0_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo0_wi0_sym_add0_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo0_wi0_sym_add0_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo0_wi0_sym_add0_q : std_logic_vector (16 downto 0);
    signal d_u1_m0_wo0_wi0_sym_add0_q_12_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo0_wi1_sym_add1_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo0_wi1_sym_add1_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo0_wi1_sym_add1_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo0_wi1_sym_add1_q : std_logic_vector (16 downto 0);
    signal d_u1_m0_wo0_wi1_sym_add1_q_12_q : std_logic_vector (16 downto 0);
    signal u2_m0_wo0_wi0_delayr2_q : std_logic_vector (15 downto 0);
    signal u2_m0_wo0_wi1_delayr1_q : std_logic_vector (15 downto 0);
    signal u2_m0_wo0_wi1_delayr3_q : std_logic_vector (15 downto 0);
    signal u2_m0_wo0_wi0_sym_add0_a : std_logic_vector(16 downto 0);
    signal u2_m0_wo0_wi0_sym_add0_b : std_logic_vector(16 downto 0);
    signal u2_m0_wo0_wi0_sym_add0_o : std_logic_vector (16 downto 0);
    signal u2_m0_wo0_wi0_sym_add0_q : std_logic_vector (16 downto 0);
    signal d_u2_m0_wo0_wi0_sym_add0_q_12_q : std_logic_vector (16 downto 0);
    signal u2_m0_wo0_wi1_sym_add1_a : std_logic_vector(16 downto 0);
    signal u2_m0_wo0_wi1_sym_add1_b : std_logic_vector(16 downto 0);
    signal u2_m0_wo0_wi1_sym_add1_o : std_logic_vector (16 downto 0);
    signal u2_m0_wo0_wi1_sym_add1_q : std_logic_vector (16 downto 0);
    signal d_u2_m0_wo0_wi1_sym_add1_q_12_q : std_logic_vector (16 downto 0);
    signal u3_m0_wo0_wi0_delayr2_q : std_logic_vector (15 downto 0);
    signal u3_m0_wo0_wi1_delayr1_q : std_logic_vector (15 downto 0);
    signal u3_m0_wo0_wi1_delayr3_q : std_logic_vector (15 downto 0);
    signal u3_m0_wo0_wi0_sym_add0_a : std_logic_vector(16 downto 0);
    signal u3_m0_wo0_wi0_sym_add0_b : std_logic_vector(16 downto 0);
    signal u3_m0_wo0_wi0_sym_add0_o : std_logic_vector (16 downto 0);
    signal u3_m0_wo0_wi0_sym_add0_q : std_logic_vector (16 downto 0);
    signal d_u3_m0_wo0_wi0_sym_add0_q_12_q : std_logic_vector (16 downto 0);
    signal u3_m0_wo0_wi1_sym_add1_a : std_logic_vector(16 downto 0);
    signal u3_m0_wo0_wi1_sym_add1_b : std_logic_vector(16 downto 0);
    signal u3_m0_wo0_wi1_sym_add1_o : std_logic_vector (16 downto 0);
    signal u3_m0_wo0_wi1_sym_add1_q : std_logic_vector (16 downto 0);
    signal d_u3_m0_wo0_wi1_sym_add1_q_12_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo2_wi0_sym_add0_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo2_wi0_sym_add0_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo2_wi0_sym_add0_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo2_wi0_sym_add0_q : std_logic_vector (16 downto 0);
    signal d_u0_m0_wo2_wi0_sym_add0_q_12_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo2_wi1_sym_add1_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo2_wi1_sym_add1_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo2_wi1_sym_add1_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo2_wi1_sym_add1_q : std_logic_vector (16 downto 0);
    signal d_u0_m0_wo2_wi1_sym_add1_q_12_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo2_wi0_sym_add0_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo2_wi0_sym_add0_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo2_wi0_sym_add0_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo2_wi0_sym_add0_q : std_logic_vector (16 downto 0);
    signal d_u1_m0_wo2_wi0_sym_add0_q_12_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo2_wi1_sym_add1_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo2_wi1_sym_add1_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo2_wi1_sym_add1_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo2_wi1_sym_add1_q : std_logic_vector (16 downto 0);
    signal d_u1_m0_wo2_wi1_sym_add1_q_12_q : std_logic_vector (16 downto 0);
    signal u2_m0_wo2_wi0_sym_add0_a : std_logic_vector(16 downto 0);
    signal u2_m0_wo2_wi0_sym_add0_b : std_logic_vector(16 downto 0);
    signal u2_m0_wo2_wi0_sym_add0_o : std_logic_vector (16 downto 0);
    signal u2_m0_wo2_wi0_sym_add0_q : std_logic_vector (16 downto 0);
    signal d_u2_m0_wo2_wi0_sym_add0_q_12_q : std_logic_vector (16 downto 0);
    signal u2_m0_wo2_wi1_sym_add1_a : std_logic_vector(16 downto 0);
    signal u2_m0_wo2_wi1_sym_add1_b : std_logic_vector(16 downto 0);
    signal u2_m0_wo2_wi1_sym_add1_o : std_logic_vector (16 downto 0);
    signal u2_m0_wo2_wi1_sym_add1_q : std_logic_vector (16 downto 0);
    signal d_u2_m0_wo2_wi1_sym_add1_q_12_q : std_logic_vector (16 downto 0);
    signal u3_m0_wo2_wi0_sym_add0_a : std_logic_vector(16 downto 0);
    signal u3_m0_wo2_wi0_sym_add0_b : std_logic_vector(16 downto 0);
    signal u3_m0_wo2_wi0_sym_add0_o : std_logic_vector (16 downto 0);
    signal u3_m0_wo2_wi0_sym_add0_q : std_logic_vector (16 downto 0);
    signal d_u3_m0_wo2_wi0_sym_add0_q_12_q : std_logic_vector (16 downto 0);
    signal u3_m0_wo2_wi1_sym_add1_a : std_logic_vector(16 downto 0);
    signal u3_m0_wo2_wi1_sym_add1_b : std_logic_vector(16 downto 0);
    signal u3_m0_wo2_wi1_sym_add1_o : std_logic_vector (16 downto 0);
    signal u3_m0_wo2_wi1_sym_add1_q : std_logic_vector (16 downto 0);
    signal d_u3_m0_wo2_wi1_sym_add1_q_12_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_a : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_b : std_logic_vector(19 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_o : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_3_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_3_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_3_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_3_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_1_a : std_logic_vector(25 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_1_b : std_logic_vector(25 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_1_o : std_logic_vector (25 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_1_q : std_logic_vector (25 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_3_a : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_3_b : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_3_o : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_3_q : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_a : std_logic_vector(19 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_b : std_logic_vector(19 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_o : std_logic_vector (19 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_q : std_logic_vector (19 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_3_a : std_logic_vector(27 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_3_b : std_logic_vector(27 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_3_o : std_logic_vector (27 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_3_q : std_logic_vector (27 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_1_a : std_logic_vector(25 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_1_b : std_logic_vector(25 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_1_o : std_logic_vector (25 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_1_q : std_logic_vector (25 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_3_a : std_logic_vector(28 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_3_b : std_logic_vector(28 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_3_o : std_logic_vector (28 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_3_q : std_logic_vector (28 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_1_a : std_logic_vector(19 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_1_b : std_logic_vector(19 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_1_o : std_logic_vector (19 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_1_q : std_logic_vector (19 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_3_a : std_logic_vector(27 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_3_b : std_logic_vector(27 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_3_o : std_logic_vector (27 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_3_q : std_logic_vector (27 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_1_a : std_logic_vector(25 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_1_b : std_logic_vector(25 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_1_o : std_logic_vector (25 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_1_q : std_logic_vector (25 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_3_a : std_logic_vector(28 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_3_b : std_logic_vector(28 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_3_o : std_logic_vector (28 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_3_q : std_logic_vector (28 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_1_a : std_logic_vector(19 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_1_b : std_logic_vector(19 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_1_o : std_logic_vector (19 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_1_q : std_logic_vector (19 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_3_a : std_logic_vector(27 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_3_b : std_logic_vector(27 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_3_o : std_logic_vector (27 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_3_q : std_logic_vector (27 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_1_a : std_logic_vector(25 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_1_b : std_logic_vector(25 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_1_o : std_logic_vector (25 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_1_q : std_logic_vector (25 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_3_a : std_logic_vector(28 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_3_b : std_logic_vector(28 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_3_o : std_logic_vector (28 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_3_q : std_logic_vector (28 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(25 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(25 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (25 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (25 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_add_3_a : std_logic_vector(28 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_add_3_b : std_logic_vector(28 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_add_3_o : std_logic_vector (28 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_add_3_q : std_logic_vector (28 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_a : std_logic_vector(19 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_b : std_logic_vector(19 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_o : std_logic_vector (19 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_sub_3_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_sub_3_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_sub_3_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_sub_3_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(25 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(25 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (25 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (25 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_add_3_a : std_logic_vector(28 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_add_3_b : std_logic_vector(28 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_add_3_o : std_logic_vector (28 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_add_3_q : std_logic_vector (28 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_a : std_logic_vector(19 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_b : std_logic_vector(19 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_o : std_logic_vector (19 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_q : std_logic_vector (19 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_sub_3_a : std_logic_vector(27 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_sub_3_b : std_logic_vector(27 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_sub_3_o : std_logic_vector (27 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_sub_3_q : std_logic_vector (27 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(25 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(25 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (25 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (25 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_add_3_a : std_logic_vector(28 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_add_3_b : std_logic_vector(28 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_add_3_o : std_logic_vector (28 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_add_3_q : std_logic_vector (28 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult1_sub_1_a : std_logic_vector(19 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult1_sub_1_b : std_logic_vector(19 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult1_sub_1_o : std_logic_vector (19 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult1_sub_1_q : std_logic_vector (19 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult1_sub_3_a : std_logic_vector(27 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult1_sub_3_b : std_logic_vector(27 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult1_sub_3_o : std_logic_vector (27 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult1_sub_3_q : std_logic_vector (27 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(25 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(25 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (25 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (25 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_add_3_a : std_logic_vector(28 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_add_3_b : std_logic_vector(28 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_add_3_o : std_logic_vector (28 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_add_3_q : std_logic_vector (28 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult1_sub_1_a : std_logic_vector(19 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult1_sub_1_b : std_logic_vector(19 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult1_sub_1_o : std_logic_vector (19 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult1_sub_1_q : std_logic_vector (19 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult1_sub_3_a : std_logic_vector(27 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult1_sub_3_b : std_logic_vector(27 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult1_sub_3_o : std_logic_vector (27 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult1_sub_3_q : std_logic_vector (27 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem_reset0 : std_logic;
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt_i : unsigned(1 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt_eq : std_logic;
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_mem_top_q : std_logic_vector (2 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_cmpReg_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_sticky_ena_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_wi1_phasedelay1_q_14_replace_mem_reset0 : std_logic;
    signal d_u0_m0_wo0_wi1_phasedelay1_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo0_wi1_phasedelay1_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u0_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u0_m0_wo0_wi1_phasedelay1_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_reset0 : std_logic;
    signal d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi1_phasedelay1_q_14_replace_mem_reset0 : std_logic;
    signal d_u1_m0_wo0_wi1_phasedelay1_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi1_phasedelay1_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u1_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u1_m0_wo0_wi1_phasedelay1_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_reset0 : std_logic;
    signal d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo0_wi1_phasedelay1_q_14_replace_mem_reset0 : std_logic;
    signal d_u2_m0_wo0_wi1_phasedelay1_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo0_wi1_phasedelay1_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u2_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u2_m0_wo0_wi1_phasedelay1_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_reset0 : std_logic;
    signal d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo0_wi1_phasedelay1_q_14_replace_mem_reset0 : std_logic;
    signal d_u3_m0_wo0_wi1_phasedelay1_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo0_wi1_phasedelay1_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u3_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u3_m0_wo0_wi1_phasedelay1_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_notEnable_a : std_logic_vector(0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_notEnable_q : std_logic_vector(0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_a : std_logic_vector(0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_b : std_logic_vector(0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (18 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (26 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (26 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (24 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (24 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q : std_logic_vector (27 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (18 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (18 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (26 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (26 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (24 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (24 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int : std_logic_vector (27 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q : std_logic_vector (27 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (18 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (18 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (26 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (26 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (24 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (24 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int : std_logic_vector (27 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_shift2_q : std_logic_vector (27 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (18 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (18 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (26 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (26 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (24 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (24 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int : std_logic_vector (27 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_shift2_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (24 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (24 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (27 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (18 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (18 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_shift2_q_int : std_logic_vector (26 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_shift2_q : std_logic_vector (26 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (24 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (24 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (27 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (27 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (18 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (18 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_shift2_q_int : std_logic_vector (26 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_shift2_q : std_logic_vector (26 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (24 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (24 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (27 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (27 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (18 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (18 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult1_shift2_q_int : std_logic_vector (26 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult1_shift2_q : std_logic_vector (26 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (24 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (24 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (27 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (27 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (18 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (18 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult1_shift2_q_int : std_logic_vector (26 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult1_shift2_q : std_logic_vector (26 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_shift4_q : std_logic_vector (30 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int : std_logic_vector (30 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_shift4_q : std_logic_vector (30 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int : std_logic_vector (30 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_shift4_q : std_logic_vector (30 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int : std_logic_vector (30 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_shift4_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_shift4_q_int : std_logic_vector (30 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_shift4_q : std_logic_vector (30 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_shift4_q_int : std_logic_vector (30 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_shift4_q : std_logic_vector (30 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_shift4_q_int : std_logic_vector (30 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_shift4_q : std_logic_vector (30 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_shift4_q_int : std_logic_vector (30 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_shift4_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo3_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo3_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_cmp_a : std_logic_vector(2 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_cmp_b : std_logic_vector(2 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_cmp_q : std_logic_vector(0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_nor_a : std_logic_vector(0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_nor_b : std_logic_vector(0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_nor_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u1_m0_wo3_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u1_m0_wo3_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u1_m0_wo1_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u1_m0_wo1_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u2_m0_wo3_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u2_m0_wo3_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u2_m0_wo1_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u2_m0_wo1_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u3_m0_wo3_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u3_m0_wo3_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u3_m0_wo1_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u3_m0_wo1_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
begin


	--d_u0_m0_wo0_wi0_phasedelay0_q_14_notEnable(LOGICAL,461)
    d_u0_m0_wo0_wi0_phasedelay0_q_14_notEnable_a <= VCC_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_14_notEnable_q <= not d_u0_m0_wo0_wi0_phasedelay0_q_14_notEnable_a;

	--d_u0_m0_wo0_wi0_phasedelay0_q_14_nor(LOGICAL,462)
    d_u0_m0_wo0_wi0_phasedelay0_q_14_nor_a <= d_u0_m0_wo0_wi0_phasedelay0_q_14_notEnable_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_14_nor_b <= d_u0_m0_wo0_wi0_phasedelay0_q_14_sticky_ena_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_14_nor_q <= not (d_u0_m0_wo0_wi0_phasedelay0_q_14_nor_a or d_u0_m0_wo0_wi0_phasedelay0_q_14_nor_b);

	--d_u0_m0_wo0_wi0_phasedelay0_q_14_mem_top(CONSTANT,458)
    d_u0_m0_wo0_wi0_phasedelay0_q_14_mem_top_q <= "010";

	--d_u0_m0_wo0_wi0_phasedelay0_q_14_cmp(LOGICAL,459)
    d_u0_m0_wo0_wi0_phasedelay0_q_14_cmp_a <= d_u0_m0_wo0_wi0_phasedelay0_q_14_mem_top_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_14_cmp_b <= STD_LOGIC_VECTOR("0" & d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q);
    d_u0_m0_wo0_wi0_phasedelay0_q_14_cmp_q <= "1" when d_u0_m0_wo0_wi0_phasedelay0_q_14_cmp_a = d_u0_m0_wo0_wi0_phasedelay0_q_14_cmp_b else "0";

	--d_u0_m0_wo0_wi0_phasedelay0_q_14_cmpReg(REG,460)
    d_u0_m0_wo0_wi0_phasedelay0_q_14_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_wi0_phasedelay0_q_14_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_wi0_phasedelay0_q_14_cmpReg_q <= d_u0_m0_wo0_wi0_phasedelay0_q_14_cmp_q;
        END IF;
    END PROCESS;


	--d_u0_m0_wo0_wi0_phasedelay0_q_14_sticky_ena(REG,463)
    d_u0_m0_wo0_wi0_phasedelay0_q_14_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_wi0_phasedelay0_q_14_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_wi0_phasedelay0_q_14_nor_q = "1") THEN
                d_u0_m0_wo0_wi0_phasedelay0_q_14_sticky_ena_q <= d_u0_m0_wo0_wi0_phasedelay0_q_14_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd(LOGICAL,464)
    d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_a <= d_u0_m0_wo0_wi0_phasedelay0_q_14_sticky_ena_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_b <= VCC_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_q <= d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_a and d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_b;

	--xIn(PORTIN,2)@10

	--d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt(COUNTER,454)
    -- every=1, low=0, high=2, step=1, init=1
    d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt_i <= TO_UNSIGNED(1,2);
            d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt_i = 1 THEN
                  d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt_eq <= '1';
                ELSE
                  d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt_eq <= '0';
                END IF;
                IF (d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt_eq = '1') THEN
                    d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt_i <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt_i - 2;
                ELSE
                    d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt_i <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt_i,2));


	--d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg(REG,455)
    d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q <= "00";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--VCC(CONSTANT,1)@0
    VCC_q <= "1";

	--d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux(MUX,456)
    d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_s <= VCC_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux: PROCESS (d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_s, d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q, d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt_q)
    BEGIN
            CASE d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_s IS
                  WHEN "0" => d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q;
                  WHEN "1" => d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt_q;
                  WHEN OTHERS => d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem(DUALMEM,525)
    d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_reset0 <= areset;
    d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ia <= xIn_6;
    d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q;
    d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q;
    d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 16,
        widthad_b => 2,
        numwords_b => 3,
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
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_iq,
        address_a => d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_aa,
        data_a => d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ia
    );
        d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_q <= d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_iq(15 downto 0);

	--u3_m0_wo3_mtree_mult1_0_shift0(BITSHIFT,427)@14
    u3_m0_wo3_mtree_mult1_0_shift0_q_int <= d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_q & "00000000000000";
    u3_m0_wo3_mtree_mult1_0_shift0_q <= u3_m0_wo3_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u3_m0_wo0_wi1_delayr1(DELAY,81)@10
    u3_m0_wo0_wi1_delayr1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_7, xout => u3_m0_wo0_wi1_delayr1_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u3_m0_wo2_wi0_sym_add0(ADD,235)@10
    u3_m0_wo2_wi0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_6(15)) & xIn_6);
    u3_m0_wo2_wi0_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => u3_m0_wo0_wi1_delayr1_q(15)) & u3_m0_wo0_wi1_delayr1_q);
    u3_m0_wo2_wi0_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo2_wi0_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo2_wi0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo2_wi0_sym_add0_a) + SIGNED(u3_m0_wo2_wi0_sym_add0_b));
        END IF;
    END PROCESS;
    u3_m0_wo2_wi0_sym_add0_q <= u3_m0_wo2_wi0_sym_add0_o(16 downto 0);


	--d_u3_m0_wo2_wi0_sym_add0_q_12(DELAY,451)@11
    d_u3_m0_wo2_wi0_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u3_m0_wo2_wi0_sym_add0_q, xout => d_u3_m0_wo2_wi0_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u3_m0_wo2_mtree_madd2_0_constmult0_shift2(BITSHIFT,412)@12
    u3_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int <= d_u3_m0_wo2_wi0_sym_add0_q_12_q & "00000000000";
    u3_m0_wo2_mtree_madd2_0_constmult0_shift2_q <= u3_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int(27 downto 0);

	--u3_m0_wo2_mtree_madd2_0_constmult0_shift0(BITSHIFT,410)@11
    u3_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int <= u3_m0_wo2_wi0_sym_add0_q & "00000000";
    u3_m0_wo2_mtree_madd2_0_constmult0_shift0_q <= u3_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int(24 downto 0);

	--u3_m0_wo2_mtree_madd2_0_constmult0_add_1(ADD,411)@11
    u3_m0_wo2_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((25 downto 17 => u3_m0_wo2_wi0_sym_add0_q(16)) & u3_m0_wo2_wi0_sym_add0_q);
    u3_m0_wo2_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((25 downto 25 => u3_m0_wo2_mtree_madd2_0_constmult0_shift0_q(24)) & u3_m0_wo2_mtree_madd2_0_constmult0_shift0_q);
    u3_m0_wo2_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo2_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo2_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo2_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u3_m0_wo2_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u3_m0_wo2_mtree_madd2_0_constmult0_add_1_q <= u3_m0_wo2_mtree_madd2_0_constmult0_add_1_o(25 downto 0);


	--u3_m0_wo2_mtree_madd2_0_constmult0_add_3(ADD,413)@12
    u3_m0_wo2_mtree_madd2_0_constmult0_add_3_a <= STD_LOGIC_VECTOR((28 downto 26 => u3_m0_wo2_mtree_madd2_0_constmult0_add_1_q(25)) & u3_m0_wo2_mtree_madd2_0_constmult0_add_1_q);
    u3_m0_wo2_mtree_madd2_0_constmult0_add_3_b <= STD_LOGIC_VECTOR((28 downto 28 => u3_m0_wo2_mtree_madd2_0_constmult0_shift2_q(27)) & u3_m0_wo2_mtree_madd2_0_constmult0_shift2_q);
    u3_m0_wo2_mtree_madd2_0_constmult0_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo2_mtree_madd2_0_constmult0_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo2_mtree_madd2_0_constmult0_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo2_mtree_madd2_0_constmult0_add_3_a) + SIGNED(u3_m0_wo2_mtree_madd2_0_constmult0_add_3_b));
        END IF;
    END PROCESS;
    u3_m0_wo2_mtree_madd2_0_constmult0_add_3_q <= u3_m0_wo2_mtree_madd2_0_constmult0_add_3_o(28 downto 0);


	--u3_m0_wo2_mtree_madd2_0_constmult0_shift4(BITSHIFT,414)@13
    u3_m0_wo2_mtree_madd2_0_constmult0_shift4_q_int <= u3_m0_wo2_mtree_madd2_0_constmult0_add_3_q & "00";
    u3_m0_wo2_mtree_madd2_0_constmult0_shift4_q <= u3_m0_wo2_mtree_madd2_0_constmult0_shift4_q_int(30 downto 0);

	--u3_m0_wo0_wi0_delayr2(DELAY,77)@10
    u3_m0_wo0_wi0_delayr2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_6, xout => u3_m0_wo0_wi0_delayr2_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u3_m0_wo2_wi1_sym_add1(ADD,236)@10
    u3_m0_wo2_wi1_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_7(15)) & xIn_7);
    u3_m0_wo2_wi1_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u3_m0_wo0_wi0_delayr2_q(15)) & u3_m0_wo0_wi0_delayr2_q);
    u3_m0_wo2_wi1_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo2_wi1_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo2_wi1_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo2_wi1_sym_add1_a) + SIGNED(u3_m0_wo2_wi1_sym_add1_b));
        END IF;
    END PROCESS;
    u3_m0_wo2_wi1_sym_add1_q <= u3_m0_wo2_wi1_sym_add1_o(16 downto 0);


	--d_u3_m0_wo2_wi1_sym_add1_q_12(DELAY,452)@11
    d_u3_m0_wo2_wi1_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u3_m0_wo2_wi1_sym_add1_q, xout => d_u3_m0_wo2_wi1_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u3_m0_wo2_mtree_madd2_0_constmult1_shift2(BITSHIFT,417)@12
    u3_m0_wo2_mtree_madd2_0_constmult1_shift2_q_int <= d_u3_m0_wo2_wi1_sym_add1_q_12_q & "0000000000";
    u3_m0_wo2_mtree_madd2_0_constmult1_shift2_q <= u3_m0_wo2_mtree_madd2_0_constmult1_shift2_q_int(26 downto 0);

	--u3_m0_wo2_mtree_madd2_0_constmult1_shift0(BITSHIFT,415)@11
    u3_m0_wo2_mtree_madd2_0_constmult1_shift0_q_int <= u3_m0_wo2_wi1_sym_add1_q & "00";
    u3_m0_wo2_mtree_madd2_0_constmult1_shift0_q <= u3_m0_wo2_mtree_madd2_0_constmult1_shift0_q_int(18 downto 0);

	--u3_m0_wo2_mtree_madd2_0_constmult1_sub_1(SUB,416)@11
    u3_m0_wo2_mtree_madd2_0_constmult1_sub_1_a <= STD_LOGIC_VECTOR((19 downto 1 => GND_q(0)) & GND_q);
    u3_m0_wo2_mtree_madd2_0_constmult1_sub_1_b <= STD_LOGIC_VECTOR((19 downto 19 => u3_m0_wo2_mtree_madd2_0_constmult1_shift0_q(18)) & u3_m0_wo2_mtree_madd2_0_constmult1_shift0_q);
    u3_m0_wo2_mtree_madd2_0_constmult1_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo2_mtree_madd2_0_constmult1_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo2_mtree_madd2_0_constmult1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo2_mtree_madd2_0_constmult1_sub_1_a) - SIGNED(u3_m0_wo2_mtree_madd2_0_constmult1_sub_1_b));
        END IF;
    END PROCESS;
    u3_m0_wo2_mtree_madd2_0_constmult1_sub_1_q <= u3_m0_wo2_mtree_madd2_0_constmult1_sub_1_o(19 downto 0);


	--u3_m0_wo2_mtree_madd2_0_constmult1_sub_3(SUB,418)@12
    u3_m0_wo2_mtree_madd2_0_constmult1_sub_3_a <= STD_LOGIC_VECTOR((27 downto 20 => u3_m0_wo2_mtree_madd2_0_constmult1_sub_1_q(19)) & u3_m0_wo2_mtree_madd2_0_constmult1_sub_1_q);
    u3_m0_wo2_mtree_madd2_0_constmult1_sub_3_b <= STD_LOGIC_VECTOR((27 downto 27 => u3_m0_wo2_mtree_madd2_0_constmult1_shift2_q(26)) & u3_m0_wo2_mtree_madd2_0_constmult1_shift2_q);
    u3_m0_wo2_mtree_madd2_0_constmult1_sub_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo2_mtree_madd2_0_constmult1_sub_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo2_mtree_madd2_0_constmult1_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo2_mtree_madd2_0_constmult1_sub_3_a) - SIGNED(u3_m0_wo2_mtree_madd2_0_constmult1_sub_3_b));
        END IF;
    END PROCESS;
    u3_m0_wo2_mtree_madd2_0_constmult1_sub_3_q <= u3_m0_wo2_mtree_madd2_0_constmult1_sub_3_o(27 downto 0);


	--u3_m0_wo2_mtree_madd2_0_sum1(ADD,419)@13
    u3_m0_wo2_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u3_m0_wo2_mtree_madd2_0_constmult1_sub_3_q(27)) & u3_m0_wo2_mtree_madd2_0_constmult1_sub_3_q);
    u3_m0_wo2_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u3_m0_wo2_mtree_madd2_0_constmult0_shift4_q(30)) & u3_m0_wo2_mtree_madd2_0_constmult0_shift4_q);
    u3_m0_wo2_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo2_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo2_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo2_mtree_madd2_0_sum1_a) + SIGNED(u3_m0_wo2_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u3_m0_wo2_mtree_madd2_0_sum1_q <= u3_m0_wo2_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u3_m0_wo0_wi1_phasedelay1_q_14_replace_mem(DUALMEM,537)
    d_u3_m0_wo0_wi1_phasedelay1_q_14_replace_mem_reset0 <= areset;
    d_u3_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ia <= u3_m0_wo0_wi1_delayr1_q;
    d_u3_m0_wo0_wi1_phasedelay1_q_14_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q;
    d_u3_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q;
    d_u3_m0_wo0_wi1_phasedelay1_q_14_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 16,
        widthad_b => 2,
        numwords_b => 3,
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
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u3_m0_wo0_wi1_phasedelay1_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u3_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u3_m0_wo0_wi1_phasedelay1_q_14_replace_mem_iq,
        address_a => d_u3_m0_wo0_wi1_phasedelay1_q_14_replace_mem_aa,
        data_a => d_u3_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ia
    );
        d_u3_m0_wo0_wi1_phasedelay1_q_14_replace_mem_q <= d_u3_m0_wo0_wi1_phasedelay1_q_14_replace_mem_iq(15 downto 0);

	--u3_m0_wo1_mtree_mult1_0_shift0(BITSHIFT,379)@14
    u3_m0_wo1_mtree_mult1_0_shift0_q_int <= d_u3_m0_wo0_wi1_phasedelay1_q_14_replace_mem_q & "00000000000000";
    u3_m0_wo1_mtree_mult1_0_shift0_q <= u3_m0_wo1_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u3_m0_wo0_wi1_sym_add1(ADD,88)@10
    u3_m0_wo0_wi1_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => u3_m0_wo0_wi1_delayr1_q(15)) & u3_m0_wo0_wi1_delayr1_q);
    u3_m0_wo0_wi1_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u3_m0_wo0_wi0_delayr2_q(15)) & u3_m0_wo0_wi0_delayr2_q);
    u3_m0_wo0_wi1_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo0_wi1_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo0_wi1_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo0_wi1_sym_add1_a) + SIGNED(u3_m0_wo0_wi1_sym_add1_b));
        END IF;
    END PROCESS;
    u3_m0_wo0_wi1_sym_add1_q <= u3_m0_wo0_wi1_sym_add1_o(16 downto 0);


	--d_u3_m0_wo0_wi1_sym_add1_q_12(DELAY,444)@11
    d_u3_m0_wo0_wi1_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u3_m0_wo0_wi1_sym_add1_q, xout => d_u3_m0_wo0_wi1_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u3_m0_wo0_mtree_madd2_0_constmult1_shift2(BITSHIFT,368)@12
    u3_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int <= d_u3_m0_wo0_wi1_sym_add1_q_12_q & "00000000000";
    u3_m0_wo0_mtree_madd2_0_constmult1_shift2_q <= u3_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int(27 downto 0);

	--u3_m0_wo0_mtree_madd2_0_constmult1_shift0(BITSHIFT,366)@11
    u3_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int <= u3_m0_wo0_wi1_sym_add1_q & "00000000";
    u3_m0_wo0_mtree_madd2_0_constmult1_shift0_q <= u3_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int(24 downto 0);

	--u3_m0_wo0_mtree_madd2_0_constmult1_add_1(ADD,367)@11
    u3_m0_wo0_mtree_madd2_0_constmult1_add_1_a <= STD_LOGIC_VECTOR((25 downto 17 => u3_m0_wo0_wi1_sym_add1_q(16)) & u3_m0_wo0_wi1_sym_add1_q);
    u3_m0_wo0_mtree_madd2_0_constmult1_add_1_b <= STD_LOGIC_VECTOR((25 downto 25 => u3_m0_wo0_mtree_madd2_0_constmult1_shift0_q(24)) & u3_m0_wo0_mtree_madd2_0_constmult1_shift0_q);
    u3_m0_wo0_mtree_madd2_0_constmult1_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo0_mtree_madd2_0_constmult1_add_1_a) + SIGNED(u3_m0_wo0_mtree_madd2_0_constmult1_add_1_b));
        END IF;
    END PROCESS;
    u3_m0_wo0_mtree_madd2_0_constmult1_add_1_q <= u3_m0_wo0_mtree_madd2_0_constmult1_add_1_o(25 downto 0);


	--u3_m0_wo0_mtree_madd2_0_constmult1_add_3(ADD,369)@12
    u3_m0_wo0_mtree_madd2_0_constmult1_add_3_a <= STD_LOGIC_VECTOR((28 downto 26 => u3_m0_wo0_mtree_madd2_0_constmult1_add_1_q(25)) & u3_m0_wo0_mtree_madd2_0_constmult1_add_1_q);
    u3_m0_wo0_mtree_madd2_0_constmult1_add_3_b <= STD_LOGIC_VECTOR((28 downto 28 => u3_m0_wo0_mtree_madd2_0_constmult1_shift2_q(27)) & u3_m0_wo0_mtree_madd2_0_constmult1_shift2_q);
    u3_m0_wo0_mtree_madd2_0_constmult1_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo0_mtree_madd2_0_constmult1_add_3_a) + SIGNED(u3_m0_wo0_mtree_madd2_0_constmult1_add_3_b));
        END IF;
    END PROCESS;
    u3_m0_wo0_mtree_madd2_0_constmult1_add_3_q <= u3_m0_wo0_mtree_madd2_0_constmult1_add_3_o(28 downto 0);


	--u3_m0_wo0_mtree_madd2_0_constmult1_shift4(BITSHIFT,370)@13
    u3_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int <= u3_m0_wo0_mtree_madd2_0_constmult1_add_3_q & "00";
    u3_m0_wo0_mtree_madd2_0_constmult1_shift4_q <= u3_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int(30 downto 0);

	--u3_m0_wo0_wi1_delayr3(DELAY,84)@10
    u3_m0_wo0_wi1_delayr3 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => u3_m0_wo0_wi1_delayr1_q, xout => u3_m0_wo0_wi1_delayr3_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u3_m0_wo0_wi0_sym_add0(ADD,87)@10
    u3_m0_wo0_wi0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_6(15)) & xIn_6);
    u3_m0_wo0_wi0_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => u3_m0_wo0_wi1_delayr3_q(15)) & u3_m0_wo0_wi1_delayr3_q);
    u3_m0_wo0_wi0_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo0_wi0_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo0_wi0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo0_wi0_sym_add0_a) + SIGNED(u3_m0_wo0_wi0_sym_add0_b));
        END IF;
    END PROCESS;
    u3_m0_wo0_wi0_sym_add0_q <= u3_m0_wo0_wi0_sym_add0_o(16 downto 0);


	--d_u3_m0_wo0_wi0_sym_add0_q_12(DELAY,443)@11
    d_u3_m0_wo0_wi0_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u3_m0_wo0_wi0_sym_add0_q, xout => d_u3_m0_wo0_wi0_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u3_m0_wo0_mtree_madd2_0_constmult0_shift2(BITSHIFT,364)@12
    u3_m0_wo0_mtree_madd2_0_constmult0_shift2_q_int <= d_u3_m0_wo0_wi0_sym_add0_q_12_q & "0000000000";
    u3_m0_wo0_mtree_madd2_0_constmult0_shift2_q <= u3_m0_wo0_mtree_madd2_0_constmult0_shift2_q_int(26 downto 0);

	--u3_m0_wo0_mtree_madd2_0_constmult0_shift0(BITSHIFT,362)@11
    u3_m0_wo0_mtree_madd2_0_constmult0_shift0_q_int <= u3_m0_wo0_wi0_sym_add0_q & "00";
    u3_m0_wo0_mtree_madd2_0_constmult0_shift0_q <= u3_m0_wo0_mtree_madd2_0_constmult0_shift0_q_int(18 downto 0);

	--u3_m0_wo0_mtree_madd2_0_constmult0_sub_1(SUB,363)@11
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_1_a <= STD_LOGIC_VECTOR((19 downto 1 => GND_q(0)) & GND_q);
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_1_b <= STD_LOGIC_VECTOR((19 downto 19 => u3_m0_wo0_mtree_madd2_0_constmult0_shift0_q(18)) & u3_m0_wo0_mtree_madd2_0_constmult0_shift0_q);
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult0_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult0_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo0_mtree_madd2_0_constmult0_sub_1_a) - SIGNED(u3_m0_wo0_mtree_madd2_0_constmult0_sub_1_b));
        END IF;
    END PROCESS;
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_1_q <= u3_m0_wo0_mtree_madd2_0_constmult0_sub_1_o(19 downto 0);


	--u3_m0_wo0_mtree_madd2_0_constmult0_sub_3(SUB,365)@12
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_3_a <= STD_LOGIC_VECTOR((27 downto 20 => u3_m0_wo0_mtree_madd2_0_constmult0_sub_1_q(19)) & u3_m0_wo0_mtree_madd2_0_constmult0_sub_1_q);
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_3_b <= STD_LOGIC_VECTOR((27 downto 27 => u3_m0_wo0_mtree_madd2_0_constmult0_shift2_q(26)) & u3_m0_wo0_mtree_madd2_0_constmult0_shift2_q);
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult0_sub_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult0_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo0_mtree_madd2_0_constmult0_sub_3_a) - SIGNED(u3_m0_wo0_mtree_madd2_0_constmult0_sub_3_b));
        END IF;
    END PROCESS;
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_3_q <= u3_m0_wo0_mtree_madd2_0_constmult0_sub_3_o(27 downto 0);


	--u3_m0_wo0_mtree_madd2_0_sum1(ADD,371)@13
    u3_m0_wo0_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u3_m0_wo0_mtree_madd2_0_constmult0_sub_3_q(27)) & u3_m0_wo0_mtree_madd2_0_constmult0_sub_3_q);
    u3_m0_wo0_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u3_m0_wo0_mtree_madd2_0_constmult1_shift4_q(30)) & u3_m0_wo0_mtree_madd2_0_constmult1_shift4_q);
    u3_m0_wo0_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo0_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo0_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo0_mtree_madd2_0_sum1_a) + SIGNED(u3_m0_wo0_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u3_m0_wo0_mtree_madd2_0_sum1_q <= u3_m0_wo0_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem(DUALMEM,501)
    d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_reset0 <= areset;
    d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ia <= xIn_4;
    d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q;
    d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q;
    d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 16,
        widthad_b => 2,
        numwords_b => 3,
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
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_iq,
        address_a => d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_aa,
        data_a => d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ia
    );
        d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_q <= d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_iq(15 downto 0);

	--u2_m0_wo3_mtree_mult1_0_shift0(BITSHIFT,425)@14
    u2_m0_wo3_mtree_mult1_0_shift0_q_int <= d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_q & "00000000000000";
    u2_m0_wo3_mtree_mult1_0_shift0_q <= u2_m0_wo3_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u2_m0_wo0_wi1_delayr1(DELAY,59)@10
    u2_m0_wo0_wi1_delayr1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_5, xout => u2_m0_wo0_wi1_delayr1_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u2_m0_wo2_wi0_sym_add0(ADD,213)@10
    u2_m0_wo2_wi0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_4(15)) & xIn_4);
    u2_m0_wo2_wi0_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => u2_m0_wo0_wi1_delayr1_q(15)) & u2_m0_wo0_wi1_delayr1_q);
    u2_m0_wo2_wi0_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo2_wi0_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo2_wi0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo2_wi0_sym_add0_a) + SIGNED(u2_m0_wo2_wi0_sym_add0_b));
        END IF;
    END PROCESS;
    u2_m0_wo2_wi0_sym_add0_q <= u2_m0_wo2_wi0_sym_add0_o(16 downto 0);


	--d_u2_m0_wo2_wi0_sym_add0_q_12(DELAY,449)@11
    d_u2_m0_wo2_wi0_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u2_m0_wo2_wi0_sym_add0_q, xout => d_u2_m0_wo2_wi0_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u2_m0_wo2_mtree_madd2_0_constmult0_shift2(BITSHIFT,402)@12
    u2_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int <= d_u2_m0_wo2_wi0_sym_add0_q_12_q & "00000000000";
    u2_m0_wo2_mtree_madd2_0_constmult0_shift2_q <= u2_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int(27 downto 0);

	--u2_m0_wo2_mtree_madd2_0_constmult0_shift0(BITSHIFT,400)@11
    u2_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int <= u2_m0_wo2_wi0_sym_add0_q & "00000000";
    u2_m0_wo2_mtree_madd2_0_constmult0_shift0_q <= u2_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int(24 downto 0);

	--u2_m0_wo2_mtree_madd2_0_constmult0_add_1(ADD,401)@11
    u2_m0_wo2_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((25 downto 17 => u2_m0_wo2_wi0_sym_add0_q(16)) & u2_m0_wo2_wi0_sym_add0_q);
    u2_m0_wo2_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((25 downto 25 => u2_m0_wo2_mtree_madd2_0_constmult0_shift0_q(24)) & u2_m0_wo2_mtree_madd2_0_constmult0_shift0_q);
    u2_m0_wo2_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo2_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo2_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo2_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u2_m0_wo2_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u2_m0_wo2_mtree_madd2_0_constmult0_add_1_q <= u2_m0_wo2_mtree_madd2_0_constmult0_add_1_o(25 downto 0);


	--u2_m0_wo2_mtree_madd2_0_constmult0_add_3(ADD,403)@12
    u2_m0_wo2_mtree_madd2_0_constmult0_add_3_a <= STD_LOGIC_VECTOR((28 downto 26 => u2_m0_wo2_mtree_madd2_0_constmult0_add_1_q(25)) & u2_m0_wo2_mtree_madd2_0_constmult0_add_1_q);
    u2_m0_wo2_mtree_madd2_0_constmult0_add_3_b <= STD_LOGIC_VECTOR((28 downto 28 => u2_m0_wo2_mtree_madd2_0_constmult0_shift2_q(27)) & u2_m0_wo2_mtree_madd2_0_constmult0_shift2_q);
    u2_m0_wo2_mtree_madd2_0_constmult0_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo2_mtree_madd2_0_constmult0_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo2_mtree_madd2_0_constmult0_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo2_mtree_madd2_0_constmult0_add_3_a) + SIGNED(u2_m0_wo2_mtree_madd2_0_constmult0_add_3_b));
        END IF;
    END PROCESS;
    u2_m0_wo2_mtree_madd2_0_constmult0_add_3_q <= u2_m0_wo2_mtree_madd2_0_constmult0_add_3_o(28 downto 0);


	--u2_m0_wo2_mtree_madd2_0_constmult0_shift4(BITSHIFT,404)@13
    u2_m0_wo2_mtree_madd2_0_constmult0_shift4_q_int <= u2_m0_wo2_mtree_madd2_0_constmult0_add_3_q & "00";
    u2_m0_wo2_mtree_madd2_0_constmult0_shift4_q <= u2_m0_wo2_mtree_madd2_0_constmult0_shift4_q_int(30 downto 0);

	--u2_m0_wo0_wi0_delayr2(DELAY,55)@10
    u2_m0_wo0_wi0_delayr2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_4, xout => u2_m0_wo0_wi0_delayr2_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u2_m0_wo2_wi1_sym_add1(ADD,214)@10
    u2_m0_wo2_wi1_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_5(15)) & xIn_5);
    u2_m0_wo2_wi1_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u2_m0_wo0_wi0_delayr2_q(15)) & u2_m0_wo0_wi0_delayr2_q);
    u2_m0_wo2_wi1_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo2_wi1_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo2_wi1_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo2_wi1_sym_add1_a) + SIGNED(u2_m0_wo2_wi1_sym_add1_b));
        END IF;
    END PROCESS;
    u2_m0_wo2_wi1_sym_add1_q <= u2_m0_wo2_wi1_sym_add1_o(16 downto 0);


	--d_u2_m0_wo2_wi1_sym_add1_q_12(DELAY,450)@11
    d_u2_m0_wo2_wi1_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u2_m0_wo2_wi1_sym_add1_q, xout => d_u2_m0_wo2_wi1_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u2_m0_wo2_mtree_madd2_0_constmult1_shift2(BITSHIFT,407)@12
    u2_m0_wo2_mtree_madd2_0_constmult1_shift2_q_int <= d_u2_m0_wo2_wi1_sym_add1_q_12_q & "0000000000";
    u2_m0_wo2_mtree_madd2_0_constmult1_shift2_q <= u2_m0_wo2_mtree_madd2_0_constmult1_shift2_q_int(26 downto 0);

	--u2_m0_wo2_mtree_madd2_0_constmult1_shift0(BITSHIFT,405)@11
    u2_m0_wo2_mtree_madd2_0_constmult1_shift0_q_int <= u2_m0_wo2_wi1_sym_add1_q & "00";
    u2_m0_wo2_mtree_madd2_0_constmult1_shift0_q <= u2_m0_wo2_mtree_madd2_0_constmult1_shift0_q_int(18 downto 0);

	--u2_m0_wo2_mtree_madd2_0_constmult1_sub_1(SUB,406)@11
    u2_m0_wo2_mtree_madd2_0_constmult1_sub_1_a <= STD_LOGIC_VECTOR((19 downto 1 => GND_q(0)) & GND_q);
    u2_m0_wo2_mtree_madd2_0_constmult1_sub_1_b <= STD_LOGIC_VECTOR((19 downto 19 => u2_m0_wo2_mtree_madd2_0_constmult1_shift0_q(18)) & u2_m0_wo2_mtree_madd2_0_constmult1_shift0_q);
    u2_m0_wo2_mtree_madd2_0_constmult1_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo2_mtree_madd2_0_constmult1_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo2_mtree_madd2_0_constmult1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo2_mtree_madd2_0_constmult1_sub_1_a) - SIGNED(u2_m0_wo2_mtree_madd2_0_constmult1_sub_1_b));
        END IF;
    END PROCESS;
    u2_m0_wo2_mtree_madd2_0_constmult1_sub_1_q <= u2_m0_wo2_mtree_madd2_0_constmult1_sub_1_o(19 downto 0);


	--u2_m0_wo2_mtree_madd2_0_constmult1_sub_3(SUB,408)@12
    u2_m0_wo2_mtree_madd2_0_constmult1_sub_3_a <= STD_LOGIC_VECTOR((27 downto 20 => u2_m0_wo2_mtree_madd2_0_constmult1_sub_1_q(19)) & u2_m0_wo2_mtree_madd2_0_constmult1_sub_1_q);
    u2_m0_wo2_mtree_madd2_0_constmult1_sub_3_b <= STD_LOGIC_VECTOR((27 downto 27 => u2_m0_wo2_mtree_madd2_0_constmult1_shift2_q(26)) & u2_m0_wo2_mtree_madd2_0_constmult1_shift2_q);
    u2_m0_wo2_mtree_madd2_0_constmult1_sub_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo2_mtree_madd2_0_constmult1_sub_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo2_mtree_madd2_0_constmult1_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo2_mtree_madd2_0_constmult1_sub_3_a) - SIGNED(u2_m0_wo2_mtree_madd2_0_constmult1_sub_3_b));
        END IF;
    END PROCESS;
    u2_m0_wo2_mtree_madd2_0_constmult1_sub_3_q <= u2_m0_wo2_mtree_madd2_0_constmult1_sub_3_o(27 downto 0);


	--u2_m0_wo2_mtree_madd2_0_sum1(ADD,409)@13
    u2_m0_wo2_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u2_m0_wo2_mtree_madd2_0_constmult1_sub_3_q(27)) & u2_m0_wo2_mtree_madd2_0_constmult1_sub_3_q);
    u2_m0_wo2_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u2_m0_wo2_mtree_madd2_0_constmult0_shift4_q(30)) & u2_m0_wo2_mtree_madd2_0_constmult0_shift4_q);
    u2_m0_wo2_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo2_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo2_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo2_mtree_madd2_0_sum1_a) + SIGNED(u2_m0_wo2_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u2_m0_wo2_mtree_madd2_0_sum1_q <= u2_m0_wo2_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u2_m0_wo0_wi1_phasedelay1_q_14_replace_mem(DUALMEM,513)
    d_u2_m0_wo0_wi1_phasedelay1_q_14_replace_mem_reset0 <= areset;
    d_u2_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ia <= u2_m0_wo0_wi1_delayr1_q;
    d_u2_m0_wo0_wi1_phasedelay1_q_14_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q;
    d_u2_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q;
    d_u2_m0_wo0_wi1_phasedelay1_q_14_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 16,
        widthad_b => 2,
        numwords_b => 3,
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
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u2_m0_wo0_wi1_phasedelay1_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u2_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u2_m0_wo0_wi1_phasedelay1_q_14_replace_mem_iq,
        address_a => d_u2_m0_wo0_wi1_phasedelay1_q_14_replace_mem_aa,
        data_a => d_u2_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ia
    );
        d_u2_m0_wo0_wi1_phasedelay1_q_14_replace_mem_q <= d_u2_m0_wo0_wi1_phasedelay1_q_14_replace_mem_iq(15 downto 0);

	--u2_m0_wo1_mtree_mult1_0_shift0(BITSHIFT,377)@14
    u2_m0_wo1_mtree_mult1_0_shift0_q_int <= d_u2_m0_wo0_wi1_phasedelay1_q_14_replace_mem_q & "00000000000000";
    u2_m0_wo1_mtree_mult1_0_shift0_q <= u2_m0_wo1_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u2_m0_wo0_wi1_sym_add1(ADD,66)@10
    u2_m0_wo0_wi1_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => u2_m0_wo0_wi1_delayr1_q(15)) & u2_m0_wo0_wi1_delayr1_q);
    u2_m0_wo0_wi1_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u2_m0_wo0_wi0_delayr2_q(15)) & u2_m0_wo0_wi0_delayr2_q);
    u2_m0_wo0_wi1_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo0_wi1_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo0_wi1_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo0_wi1_sym_add1_a) + SIGNED(u2_m0_wo0_wi1_sym_add1_b));
        END IF;
    END PROCESS;
    u2_m0_wo0_wi1_sym_add1_q <= u2_m0_wo0_wi1_sym_add1_o(16 downto 0);


	--d_u2_m0_wo0_wi1_sym_add1_q_12(DELAY,440)@11
    d_u2_m0_wo0_wi1_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u2_m0_wo0_wi1_sym_add1_q, xout => d_u2_m0_wo0_wi1_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u2_m0_wo0_mtree_madd2_0_constmult1_shift2(BITSHIFT,358)@12
    u2_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int <= d_u2_m0_wo0_wi1_sym_add1_q_12_q & "00000000000";
    u2_m0_wo0_mtree_madd2_0_constmult1_shift2_q <= u2_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int(27 downto 0);

	--u2_m0_wo0_mtree_madd2_0_constmult1_shift0(BITSHIFT,356)@11
    u2_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int <= u2_m0_wo0_wi1_sym_add1_q & "00000000";
    u2_m0_wo0_mtree_madd2_0_constmult1_shift0_q <= u2_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int(24 downto 0);

	--u2_m0_wo0_mtree_madd2_0_constmult1_add_1(ADD,357)@11
    u2_m0_wo0_mtree_madd2_0_constmult1_add_1_a <= STD_LOGIC_VECTOR((25 downto 17 => u2_m0_wo0_wi1_sym_add1_q(16)) & u2_m0_wo0_wi1_sym_add1_q);
    u2_m0_wo0_mtree_madd2_0_constmult1_add_1_b <= STD_LOGIC_VECTOR((25 downto 25 => u2_m0_wo0_mtree_madd2_0_constmult1_shift0_q(24)) & u2_m0_wo0_mtree_madd2_0_constmult1_shift0_q);
    u2_m0_wo0_mtree_madd2_0_constmult1_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo0_mtree_madd2_0_constmult1_add_1_a) + SIGNED(u2_m0_wo0_mtree_madd2_0_constmult1_add_1_b));
        END IF;
    END PROCESS;
    u2_m0_wo0_mtree_madd2_0_constmult1_add_1_q <= u2_m0_wo0_mtree_madd2_0_constmult1_add_1_o(25 downto 0);


	--u2_m0_wo0_mtree_madd2_0_constmult1_add_3(ADD,359)@12
    u2_m0_wo0_mtree_madd2_0_constmult1_add_3_a <= STD_LOGIC_VECTOR((28 downto 26 => u2_m0_wo0_mtree_madd2_0_constmult1_add_1_q(25)) & u2_m0_wo0_mtree_madd2_0_constmult1_add_1_q);
    u2_m0_wo0_mtree_madd2_0_constmult1_add_3_b <= STD_LOGIC_VECTOR((28 downto 28 => u2_m0_wo0_mtree_madd2_0_constmult1_shift2_q(27)) & u2_m0_wo0_mtree_madd2_0_constmult1_shift2_q);
    u2_m0_wo0_mtree_madd2_0_constmult1_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo0_mtree_madd2_0_constmult1_add_3_a) + SIGNED(u2_m0_wo0_mtree_madd2_0_constmult1_add_3_b));
        END IF;
    END PROCESS;
    u2_m0_wo0_mtree_madd2_0_constmult1_add_3_q <= u2_m0_wo0_mtree_madd2_0_constmult1_add_3_o(28 downto 0);


	--u2_m0_wo0_mtree_madd2_0_constmult1_shift4(BITSHIFT,360)@13
    u2_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int <= u2_m0_wo0_mtree_madd2_0_constmult1_add_3_q & "00";
    u2_m0_wo0_mtree_madd2_0_constmult1_shift4_q <= u2_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int(30 downto 0);

	--u2_m0_wo0_wi1_delayr3(DELAY,62)@10
    u2_m0_wo0_wi1_delayr3 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => u2_m0_wo0_wi1_delayr1_q, xout => u2_m0_wo0_wi1_delayr3_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u2_m0_wo0_wi0_sym_add0(ADD,65)@10
    u2_m0_wo0_wi0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_4(15)) & xIn_4);
    u2_m0_wo0_wi0_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => u2_m0_wo0_wi1_delayr3_q(15)) & u2_m0_wo0_wi1_delayr3_q);
    u2_m0_wo0_wi0_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo0_wi0_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo0_wi0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo0_wi0_sym_add0_a) + SIGNED(u2_m0_wo0_wi0_sym_add0_b));
        END IF;
    END PROCESS;
    u2_m0_wo0_wi0_sym_add0_q <= u2_m0_wo0_wi0_sym_add0_o(16 downto 0);


	--d_u2_m0_wo0_wi0_sym_add0_q_12(DELAY,439)@11
    d_u2_m0_wo0_wi0_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u2_m0_wo0_wi0_sym_add0_q, xout => d_u2_m0_wo0_wi0_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u2_m0_wo0_mtree_madd2_0_constmult0_shift2(BITSHIFT,354)@12
    u2_m0_wo0_mtree_madd2_0_constmult0_shift2_q_int <= d_u2_m0_wo0_wi0_sym_add0_q_12_q & "0000000000";
    u2_m0_wo0_mtree_madd2_0_constmult0_shift2_q <= u2_m0_wo0_mtree_madd2_0_constmult0_shift2_q_int(26 downto 0);

	--u2_m0_wo0_mtree_madd2_0_constmult0_shift0(BITSHIFT,352)@11
    u2_m0_wo0_mtree_madd2_0_constmult0_shift0_q_int <= u2_m0_wo0_wi0_sym_add0_q & "00";
    u2_m0_wo0_mtree_madd2_0_constmult0_shift0_q <= u2_m0_wo0_mtree_madd2_0_constmult0_shift0_q_int(18 downto 0);

	--u2_m0_wo0_mtree_madd2_0_constmult0_sub_1(SUB,353)@11
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_1_a <= STD_LOGIC_VECTOR((19 downto 1 => GND_q(0)) & GND_q);
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_1_b <= STD_LOGIC_VECTOR((19 downto 19 => u2_m0_wo0_mtree_madd2_0_constmult0_shift0_q(18)) & u2_m0_wo0_mtree_madd2_0_constmult0_shift0_q);
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult0_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult0_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo0_mtree_madd2_0_constmult0_sub_1_a) - SIGNED(u2_m0_wo0_mtree_madd2_0_constmult0_sub_1_b));
        END IF;
    END PROCESS;
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_1_q <= u2_m0_wo0_mtree_madd2_0_constmult0_sub_1_o(19 downto 0);


	--u2_m0_wo0_mtree_madd2_0_constmult0_sub_3(SUB,355)@12
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_3_a <= STD_LOGIC_VECTOR((27 downto 20 => u2_m0_wo0_mtree_madd2_0_constmult0_sub_1_q(19)) & u2_m0_wo0_mtree_madd2_0_constmult0_sub_1_q);
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_3_b <= STD_LOGIC_VECTOR((27 downto 27 => u2_m0_wo0_mtree_madd2_0_constmult0_shift2_q(26)) & u2_m0_wo0_mtree_madd2_0_constmult0_shift2_q);
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult0_sub_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult0_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo0_mtree_madd2_0_constmult0_sub_3_a) - SIGNED(u2_m0_wo0_mtree_madd2_0_constmult0_sub_3_b));
        END IF;
    END PROCESS;
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_3_q <= u2_m0_wo0_mtree_madd2_0_constmult0_sub_3_o(27 downto 0);


	--u2_m0_wo0_mtree_madd2_0_sum1(ADD,361)@13
    u2_m0_wo0_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u2_m0_wo0_mtree_madd2_0_constmult0_sub_3_q(27)) & u2_m0_wo0_mtree_madd2_0_constmult0_sub_3_q);
    u2_m0_wo0_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u2_m0_wo0_mtree_madd2_0_constmult1_shift4_q(30)) & u2_m0_wo0_mtree_madd2_0_constmult1_shift4_q);
    u2_m0_wo0_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo0_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo0_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo0_mtree_madd2_0_sum1_a) + SIGNED(u2_m0_wo0_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u2_m0_wo0_mtree_madd2_0_sum1_q <= u2_m0_wo0_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem(DUALMEM,477)
    d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_reset0 <= areset;
    d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ia <= xIn_2;
    d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q;
    d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q;
    d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 16,
        widthad_b => 2,
        numwords_b => 3,
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
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_iq,
        address_a => d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_aa,
        data_a => d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ia
    );
        d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_q <= d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_iq(15 downto 0);

	--u1_m0_wo3_mtree_mult1_0_shift0(BITSHIFT,423)@14
    u1_m0_wo3_mtree_mult1_0_shift0_q_int <= d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_q & "00000000000000";
    u1_m0_wo3_mtree_mult1_0_shift0_q <= u1_m0_wo3_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u1_m0_wo0_wi1_delayr1(DELAY,37)@10
    u1_m0_wo0_wi1_delayr1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_3, xout => u1_m0_wo0_wi1_delayr1_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u1_m0_wo2_wi0_sym_add0(ADD,191)@10
    u1_m0_wo2_wi0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_2(15)) & xIn_2);
    u1_m0_wo2_wi0_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => u1_m0_wo0_wi1_delayr1_q(15)) & u1_m0_wo0_wi1_delayr1_q);
    u1_m0_wo2_wi0_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo2_wi0_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo2_wi0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo2_wi0_sym_add0_a) + SIGNED(u1_m0_wo2_wi0_sym_add0_b));
        END IF;
    END PROCESS;
    u1_m0_wo2_wi0_sym_add0_q <= u1_m0_wo2_wi0_sym_add0_o(16 downto 0);


	--d_u1_m0_wo2_wi0_sym_add0_q_12(DELAY,447)@11
    d_u1_m0_wo2_wi0_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u1_m0_wo2_wi0_sym_add0_q, xout => d_u1_m0_wo2_wi0_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u1_m0_wo2_mtree_madd2_0_constmult0_shift2(BITSHIFT,392)@12
    u1_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int <= d_u1_m0_wo2_wi0_sym_add0_q_12_q & "00000000000";
    u1_m0_wo2_mtree_madd2_0_constmult0_shift2_q <= u1_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int(27 downto 0);

	--u1_m0_wo2_mtree_madd2_0_constmult0_shift0(BITSHIFT,390)@11
    u1_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int <= u1_m0_wo2_wi0_sym_add0_q & "00000000";
    u1_m0_wo2_mtree_madd2_0_constmult0_shift0_q <= u1_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int(24 downto 0);

	--u1_m0_wo2_mtree_madd2_0_constmult0_add_1(ADD,391)@11
    u1_m0_wo2_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((25 downto 17 => u1_m0_wo2_wi0_sym_add0_q(16)) & u1_m0_wo2_wi0_sym_add0_q);
    u1_m0_wo2_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((25 downto 25 => u1_m0_wo2_mtree_madd2_0_constmult0_shift0_q(24)) & u1_m0_wo2_mtree_madd2_0_constmult0_shift0_q);
    u1_m0_wo2_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo2_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo2_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo2_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u1_m0_wo2_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo2_mtree_madd2_0_constmult0_add_1_q <= u1_m0_wo2_mtree_madd2_0_constmult0_add_1_o(25 downto 0);


	--u1_m0_wo2_mtree_madd2_0_constmult0_add_3(ADD,393)@12
    u1_m0_wo2_mtree_madd2_0_constmult0_add_3_a <= STD_LOGIC_VECTOR((28 downto 26 => u1_m0_wo2_mtree_madd2_0_constmult0_add_1_q(25)) & u1_m0_wo2_mtree_madd2_0_constmult0_add_1_q);
    u1_m0_wo2_mtree_madd2_0_constmult0_add_3_b <= STD_LOGIC_VECTOR((28 downto 28 => u1_m0_wo2_mtree_madd2_0_constmult0_shift2_q(27)) & u1_m0_wo2_mtree_madd2_0_constmult0_shift2_q);
    u1_m0_wo2_mtree_madd2_0_constmult0_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo2_mtree_madd2_0_constmult0_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo2_mtree_madd2_0_constmult0_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo2_mtree_madd2_0_constmult0_add_3_a) + SIGNED(u1_m0_wo2_mtree_madd2_0_constmult0_add_3_b));
        END IF;
    END PROCESS;
    u1_m0_wo2_mtree_madd2_0_constmult0_add_3_q <= u1_m0_wo2_mtree_madd2_0_constmult0_add_3_o(28 downto 0);


	--u1_m0_wo2_mtree_madd2_0_constmult0_shift4(BITSHIFT,394)@13
    u1_m0_wo2_mtree_madd2_0_constmult0_shift4_q_int <= u1_m0_wo2_mtree_madd2_0_constmult0_add_3_q & "00";
    u1_m0_wo2_mtree_madd2_0_constmult0_shift4_q <= u1_m0_wo2_mtree_madd2_0_constmult0_shift4_q_int(30 downto 0);

	--u1_m0_wo0_wi0_delayr2(DELAY,33)@10
    u1_m0_wo0_wi0_delayr2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_2, xout => u1_m0_wo0_wi0_delayr2_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u1_m0_wo2_wi1_sym_add1(ADD,192)@10
    u1_m0_wo2_wi1_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_3(15)) & xIn_3);
    u1_m0_wo2_wi1_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u1_m0_wo0_wi0_delayr2_q(15)) & u1_m0_wo0_wi0_delayr2_q);
    u1_m0_wo2_wi1_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo2_wi1_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo2_wi1_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo2_wi1_sym_add1_a) + SIGNED(u1_m0_wo2_wi1_sym_add1_b));
        END IF;
    END PROCESS;
    u1_m0_wo2_wi1_sym_add1_q <= u1_m0_wo2_wi1_sym_add1_o(16 downto 0);


	--d_u1_m0_wo2_wi1_sym_add1_q_12(DELAY,448)@11
    d_u1_m0_wo2_wi1_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u1_m0_wo2_wi1_sym_add1_q, xout => d_u1_m0_wo2_wi1_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u1_m0_wo2_mtree_madd2_0_constmult1_shift2(BITSHIFT,397)@12
    u1_m0_wo2_mtree_madd2_0_constmult1_shift2_q_int <= d_u1_m0_wo2_wi1_sym_add1_q_12_q & "0000000000";
    u1_m0_wo2_mtree_madd2_0_constmult1_shift2_q <= u1_m0_wo2_mtree_madd2_0_constmult1_shift2_q_int(26 downto 0);

	--u1_m0_wo2_mtree_madd2_0_constmult1_shift0(BITSHIFT,395)@11
    u1_m0_wo2_mtree_madd2_0_constmult1_shift0_q_int <= u1_m0_wo2_wi1_sym_add1_q & "00";
    u1_m0_wo2_mtree_madd2_0_constmult1_shift0_q <= u1_m0_wo2_mtree_madd2_0_constmult1_shift0_q_int(18 downto 0);

	--u1_m0_wo2_mtree_madd2_0_constmult1_sub_1(SUB,396)@11
    u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_a <= STD_LOGIC_VECTOR((19 downto 1 => GND_q(0)) & GND_q);
    u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_b <= STD_LOGIC_VECTOR((19 downto 19 => u1_m0_wo2_mtree_madd2_0_constmult1_shift0_q(18)) & u1_m0_wo2_mtree_madd2_0_constmult1_shift0_q);
    u1_m0_wo2_mtree_madd2_0_constmult1_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_a) - SIGNED(u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_q <= u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_o(19 downto 0);


	--u1_m0_wo2_mtree_madd2_0_constmult1_sub_3(SUB,398)@12
    u1_m0_wo2_mtree_madd2_0_constmult1_sub_3_a <= STD_LOGIC_VECTOR((27 downto 20 => u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_q(19)) & u1_m0_wo2_mtree_madd2_0_constmult1_sub_1_q);
    u1_m0_wo2_mtree_madd2_0_constmult1_sub_3_b <= STD_LOGIC_VECTOR((27 downto 27 => u1_m0_wo2_mtree_madd2_0_constmult1_shift2_q(26)) & u1_m0_wo2_mtree_madd2_0_constmult1_shift2_q);
    u1_m0_wo2_mtree_madd2_0_constmult1_sub_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo2_mtree_madd2_0_constmult1_sub_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo2_mtree_madd2_0_constmult1_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo2_mtree_madd2_0_constmult1_sub_3_a) - SIGNED(u1_m0_wo2_mtree_madd2_0_constmult1_sub_3_b));
        END IF;
    END PROCESS;
    u1_m0_wo2_mtree_madd2_0_constmult1_sub_3_q <= u1_m0_wo2_mtree_madd2_0_constmult1_sub_3_o(27 downto 0);


	--u1_m0_wo2_mtree_madd2_0_sum1(ADD,399)@13
    u1_m0_wo2_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u1_m0_wo2_mtree_madd2_0_constmult1_sub_3_q(27)) & u1_m0_wo2_mtree_madd2_0_constmult1_sub_3_q);
    u1_m0_wo2_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u1_m0_wo2_mtree_madd2_0_constmult0_shift4_q(30)) & u1_m0_wo2_mtree_madd2_0_constmult0_shift4_q);
    u1_m0_wo2_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo2_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo2_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo2_mtree_madd2_0_sum1_a) + SIGNED(u1_m0_wo2_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u1_m0_wo2_mtree_madd2_0_sum1_q <= u1_m0_wo2_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u1_m0_wo0_wi1_phasedelay1_q_14_replace_mem(DUALMEM,489)
    d_u1_m0_wo0_wi1_phasedelay1_q_14_replace_mem_reset0 <= areset;
    d_u1_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ia <= u1_m0_wo0_wi1_delayr1_q;
    d_u1_m0_wo0_wi1_phasedelay1_q_14_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q;
    d_u1_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q;
    d_u1_m0_wo0_wi1_phasedelay1_q_14_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 16,
        widthad_b => 2,
        numwords_b => 3,
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
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u1_m0_wo0_wi1_phasedelay1_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u1_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u1_m0_wo0_wi1_phasedelay1_q_14_replace_mem_iq,
        address_a => d_u1_m0_wo0_wi1_phasedelay1_q_14_replace_mem_aa,
        data_a => d_u1_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ia
    );
        d_u1_m0_wo0_wi1_phasedelay1_q_14_replace_mem_q <= d_u1_m0_wo0_wi1_phasedelay1_q_14_replace_mem_iq(15 downto 0);

	--u1_m0_wo1_mtree_mult1_0_shift0(BITSHIFT,375)@14
    u1_m0_wo1_mtree_mult1_0_shift0_q_int <= d_u1_m0_wo0_wi1_phasedelay1_q_14_replace_mem_q & "00000000000000";
    u1_m0_wo1_mtree_mult1_0_shift0_q <= u1_m0_wo1_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u1_m0_wo0_wi1_sym_add1(ADD,44)@10
    u1_m0_wo0_wi1_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => u1_m0_wo0_wi1_delayr1_q(15)) & u1_m0_wo0_wi1_delayr1_q);
    u1_m0_wo0_wi1_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u1_m0_wo0_wi0_delayr2_q(15)) & u1_m0_wo0_wi0_delayr2_q);
    u1_m0_wo0_wi1_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_wi1_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_wi1_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_wi1_sym_add1_a) + SIGNED(u1_m0_wo0_wi1_sym_add1_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_wi1_sym_add1_q <= u1_m0_wo0_wi1_sym_add1_o(16 downto 0);


	--d_u1_m0_wo0_wi1_sym_add1_q_12(DELAY,436)@11
    d_u1_m0_wo0_wi1_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u1_m0_wo0_wi1_sym_add1_q, xout => d_u1_m0_wo0_wi1_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u1_m0_wo0_mtree_madd2_0_constmult1_shift2(BITSHIFT,348)@12
    u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int <= d_u1_m0_wo0_wi1_sym_add1_q_12_q & "00000000000";
    u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q <= u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int(27 downto 0);

	--u1_m0_wo0_mtree_madd2_0_constmult1_shift0(BITSHIFT,346)@11
    u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int <= u1_m0_wo0_wi1_sym_add1_q & "00000000";
    u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q <= u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int(24 downto 0);

	--u1_m0_wo0_mtree_madd2_0_constmult1_add_1(ADD,347)@11
    u1_m0_wo0_mtree_madd2_0_constmult1_add_1_a <= STD_LOGIC_VECTOR((25 downto 17 => u1_m0_wo0_wi1_sym_add1_q(16)) & u1_m0_wo0_wi1_sym_add1_q);
    u1_m0_wo0_mtree_madd2_0_constmult1_add_1_b <= STD_LOGIC_VECTOR((25 downto 25 => u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q(24)) & u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q);
    u1_m0_wo0_mtree_madd2_0_constmult1_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_mtree_madd2_0_constmult1_add_1_a) + SIGNED(u1_m0_wo0_mtree_madd2_0_constmult1_add_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_mtree_madd2_0_constmult1_add_1_q <= u1_m0_wo0_mtree_madd2_0_constmult1_add_1_o(25 downto 0);


	--u1_m0_wo0_mtree_madd2_0_constmult1_add_3(ADD,349)@12
    u1_m0_wo0_mtree_madd2_0_constmult1_add_3_a <= STD_LOGIC_VECTOR((28 downto 26 => u1_m0_wo0_mtree_madd2_0_constmult1_add_1_q(25)) & u1_m0_wo0_mtree_madd2_0_constmult1_add_1_q);
    u1_m0_wo0_mtree_madd2_0_constmult1_add_3_b <= STD_LOGIC_VECTOR((28 downto 28 => u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q(27)) & u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q);
    u1_m0_wo0_mtree_madd2_0_constmult1_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_mtree_madd2_0_constmult1_add_3_a) + SIGNED(u1_m0_wo0_mtree_madd2_0_constmult1_add_3_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_mtree_madd2_0_constmult1_add_3_q <= u1_m0_wo0_mtree_madd2_0_constmult1_add_3_o(28 downto 0);


	--u1_m0_wo0_mtree_madd2_0_constmult1_shift4(BITSHIFT,350)@13
    u1_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int <= u1_m0_wo0_mtree_madd2_0_constmult1_add_3_q & "00";
    u1_m0_wo0_mtree_madd2_0_constmult1_shift4_q <= u1_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int(30 downto 0);

	--u1_m0_wo0_wi1_delayr3(DELAY,40)@10
    u1_m0_wo0_wi1_delayr3 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => u1_m0_wo0_wi1_delayr1_q, xout => u1_m0_wo0_wi1_delayr3_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u1_m0_wo0_wi0_sym_add0(ADD,43)@10
    u1_m0_wo0_wi0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_2(15)) & xIn_2);
    u1_m0_wo0_wi0_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => u1_m0_wo0_wi1_delayr3_q(15)) & u1_m0_wo0_wi1_delayr3_q);
    u1_m0_wo0_wi0_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_wi0_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_wi0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_wi0_sym_add0_a) + SIGNED(u1_m0_wo0_wi0_sym_add0_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_wi0_sym_add0_q <= u1_m0_wo0_wi0_sym_add0_o(16 downto 0);


	--d_u1_m0_wo0_wi0_sym_add0_q_12(DELAY,435)@11
    d_u1_m0_wo0_wi0_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u1_m0_wo0_wi0_sym_add0_q, xout => d_u1_m0_wo0_wi0_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u1_m0_wo0_mtree_madd2_0_constmult0_shift2(BITSHIFT,344)@12
    u1_m0_wo0_mtree_madd2_0_constmult0_shift2_q_int <= d_u1_m0_wo0_wi0_sym_add0_q_12_q & "0000000000";
    u1_m0_wo0_mtree_madd2_0_constmult0_shift2_q <= u1_m0_wo0_mtree_madd2_0_constmult0_shift2_q_int(26 downto 0);

	--u1_m0_wo0_mtree_madd2_0_constmult0_shift0(BITSHIFT,342)@11
    u1_m0_wo0_mtree_madd2_0_constmult0_shift0_q_int <= u1_m0_wo0_wi0_sym_add0_q & "00";
    u1_m0_wo0_mtree_madd2_0_constmult0_shift0_q <= u1_m0_wo0_mtree_madd2_0_constmult0_shift0_q_int(18 downto 0);

	--u1_m0_wo0_mtree_madd2_0_constmult0_sub_1(SUB,343)@11
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_a <= STD_LOGIC_VECTOR((19 downto 1 => GND_q(0)) & GND_q);
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_b <= STD_LOGIC_VECTOR((19 downto 19 => u1_m0_wo0_mtree_madd2_0_constmult0_shift0_q(18)) & u1_m0_wo0_mtree_madd2_0_constmult0_shift0_q);
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_a) - SIGNED(u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_q <= u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_o(19 downto 0);


	--u1_m0_wo0_mtree_madd2_0_constmult0_sub_3(SUB,345)@12
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_3_a <= STD_LOGIC_VECTOR((27 downto 20 => u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_q(19)) & u1_m0_wo0_mtree_madd2_0_constmult0_sub_1_q);
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_3_b <= STD_LOGIC_VECTOR((27 downto 27 => u1_m0_wo0_mtree_madd2_0_constmult0_shift2_q(26)) & u1_m0_wo0_mtree_madd2_0_constmult0_shift2_q);
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult0_sub_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult0_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_mtree_madd2_0_constmult0_sub_3_a) - SIGNED(u1_m0_wo0_mtree_madd2_0_constmult0_sub_3_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_3_q <= u1_m0_wo0_mtree_madd2_0_constmult0_sub_3_o(27 downto 0);


	--u1_m0_wo0_mtree_madd2_0_sum1(ADD,351)@13
    u1_m0_wo0_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u1_m0_wo0_mtree_madd2_0_constmult0_sub_3_q(27)) & u1_m0_wo0_mtree_madd2_0_constmult0_sub_3_q);
    u1_m0_wo0_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u1_m0_wo0_mtree_madd2_0_constmult1_shift4_q(30)) & u1_m0_wo0_mtree_madd2_0_constmult1_shift4_q);
    u1_m0_wo0_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_mtree_madd2_0_sum1_a) + SIGNED(u1_m0_wo0_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_mtree_madd2_0_sum1_q <= u1_m0_wo0_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem(DUALMEM,453)
    d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem_reset0 <= areset;
    d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ia <= xIn_0;
    d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 16,
        widthad_b => 2,
        numwords_b => 3,
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
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem_iq,
        address_a => d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem_aa,
        data_a => d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ia
    );
        d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem_q <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem_iq(15 downto 0);

	--u0_m0_wo3_mtree_mult1_0_shift0(BITSHIFT,421)@14
    u0_m0_wo3_mtree_mult1_0_shift0_q_int <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem_q & "00000000000000";
    u0_m0_wo3_mtree_mult1_0_shift0_q <= u0_m0_wo3_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u0_m0_wo0_wi1_delayr1(DELAY,15)@10
    u0_m0_wo0_wi1_delayr1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_1, xout => u0_m0_wo0_wi1_delayr1_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo2_wi0_sym_add0(ADD,169)@10
    u0_m0_wo2_wi0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_0(15)) & xIn_0);
    u0_m0_wo2_wi0_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi1_delayr1_q(15)) & u0_m0_wo0_wi1_delayr1_q);
    u0_m0_wo2_wi0_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_wi0_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_wi0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_wi0_sym_add0_a) + SIGNED(u0_m0_wo2_wi0_sym_add0_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_wi0_sym_add0_q <= u0_m0_wo2_wi0_sym_add0_o(16 downto 0);


	--d_u0_m0_wo2_wi0_sym_add0_q_12(DELAY,445)@11
    d_u0_m0_wo2_wi0_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u0_m0_wo2_wi0_sym_add0_q, xout => d_u0_m0_wo2_wi0_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u0_m0_wo2_mtree_madd2_0_constmult0_shift2(BITSHIFT,382)@12
    u0_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int <= d_u0_m0_wo2_wi0_sym_add0_q_12_q & "00000000000";
    u0_m0_wo2_mtree_madd2_0_constmult0_shift2_q <= u0_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int(27 downto 0);

	--u0_m0_wo2_mtree_madd2_0_constmult0_shift0(BITSHIFT,380)@11
    u0_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int <= u0_m0_wo2_wi0_sym_add0_q & "00000000";
    u0_m0_wo2_mtree_madd2_0_constmult0_shift0_q <= u0_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int(24 downto 0);

	--u0_m0_wo2_mtree_madd2_0_constmult0_add_1(ADD,381)@11
    u0_m0_wo2_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((25 downto 17 => u0_m0_wo2_wi0_sym_add0_q(16)) & u0_m0_wo2_wi0_sym_add0_q);
    u0_m0_wo2_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo2_mtree_madd2_0_constmult0_shift0_q(24)) & u0_m0_wo2_mtree_madd2_0_constmult0_shift0_q);
    u0_m0_wo2_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u0_m0_wo2_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_madd2_0_constmult0_add_1_q <= u0_m0_wo2_mtree_madd2_0_constmult0_add_1_o(25 downto 0);


	--u0_m0_wo2_mtree_madd2_0_constmult0_add_3(ADD,383)@12
    u0_m0_wo2_mtree_madd2_0_constmult0_add_3_a <= STD_LOGIC_VECTOR((28 downto 26 => u0_m0_wo2_mtree_madd2_0_constmult0_add_1_q(25)) & u0_m0_wo2_mtree_madd2_0_constmult0_add_1_q);
    u0_m0_wo2_mtree_madd2_0_constmult0_add_3_b <= STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo2_mtree_madd2_0_constmult0_shift2_q(27)) & u0_m0_wo2_mtree_madd2_0_constmult0_shift2_q);
    u0_m0_wo2_mtree_madd2_0_constmult0_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_madd2_0_constmult0_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_madd2_0_constmult0_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_madd2_0_constmult0_add_3_a) + SIGNED(u0_m0_wo2_mtree_madd2_0_constmult0_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_madd2_0_constmult0_add_3_q <= u0_m0_wo2_mtree_madd2_0_constmult0_add_3_o(28 downto 0);


	--u0_m0_wo2_mtree_madd2_0_constmult0_shift4(BITSHIFT,384)@13
    u0_m0_wo2_mtree_madd2_0_constmult0_shift4_q_int <= u0_m0_wo2_mtree_madd2_0_constmult0_add_3_q & "00";
    u0_m0_wo2_mtree_madd2_0_constmult0_shift4_q <= u0_m0_wo2_mtree_madd2_0_constmult0_shift4_q_int(30 downto 0);

	--u0_m0_wo0_wi0_delayr2(DELAY,11)@10
    u0_m0_wo0_wi0_delayr2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_0, xout => u0_m0_wo0_wi0_delayr2_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo2_wi1_sym_add1(ADD,170)@10
    u0_m0_wo2_wi1_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_1(15)) & xIn_1);
    u0_m0_wo2_wi1_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_delayr2_q(15)) & u0_m0_wo0_wi0_delayr2_q);
    u0_m0_wo2_wi1_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_wi1_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_wi1_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_wi1_sym_add1_a) + SIGNED(u0_m0_wo2_wi1_sym_add1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_wi1_sym_add1_q <= u0_m0_wo2_wi1_sym_add1_o(16 downto 0);


	--d_u0_m0_wo2_wi1_sym_add1_q_12(DELAY,446)@11
    d_u0_m0_wo2_wi1_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u0_m0_wo2_wi1_sym_add1_q, xout => d_u0_m0_wo2_wi1_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u0_m0_wo2_mtree_madd2_0_constmult1_shift2(BITSHIFT,387)@12
    u0_m0_wo2_mtree_madd2_0_constmult1_shift2_q_int <= d_u0_m0_wo2_wi1_sym_add1_q_12_q & "0000000000";
    u0_m0_wo2_mtree_madd2_0_constmult1_shift2_q <= u0_m0_wo2_mtree_madd2_0_constmult1_shift2_q_int(26 downto 0);

	--u0_m0_wo2_mtree_madd2_0_constmult1_shift0(BITSHIFT,385)@11
    u0_m0_wo2_mtree_madd2_0_constmult1_shift0_q_int <= u0_m0_wo2_wi1_sym_add1_q & "00";
    u0_m0_wo2_mtree_madd2_0_constmult1_shift0_q <= u0_m0_wo2_mtree_madd2_0_constmult1_shift0_q_int(18 downto 0);

	--u0_m0_wo2_mtree_madd2_0_constmult1_sub_1(SUB,386)@11
    u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_a <= STD_LOGIC_VECTOR((19 downto 1 => GND_q(0)) & GND_q);
    u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_b <= STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo2_mtree_madd2_0_constmult1_shift0_q(18)) & u0_m0_wo2_mtree_madd2_0_constmult1_shift0_q);
    u0_m0_wo2_mtree_madd2_0_constmult1_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_a) - SIGNED(u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_q <= u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_o(19 downto 0);


	--u0_m0_wo2_mtree_madd2_0_constmult1_sub_3(SUB,388)@12
    u0_m0_wo2_mtree_madd2_0_constmult1_sub_3_a <= STD_LOGIC_VECTOR((27 downto 20 => u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_q(19)) & u0_m0_wo2_mtree_madd2_0_constmult1_sub_1_q);
    u0_m0_wo2_mtree_madd2_0_constmult1_sub_3_b <= STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo2_mtree_madd2_0_constmult1_shift2_q(26)) & u0_m0_wo2_mtree_madd2_0_constmult1_shift2_q);
    u0_m0_wo2_mtree_madd2_0_constmult1_sub_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_madd2_0_constmult1_sub_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_madd2_0_constmult1_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_madd2_0_constmult1_sub_3_a) - SIGNED(u0_m0_wo2_mtree_madd2_0_constmult1_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_madd2_0_constmult1_sub_3_q <= u0_m0_wo2_mtree_madd2_0_constmult1_sub_3_o(27 downto 0);


	--u0_m0_wo2_mtree_madd2_0_sum1(ADD,389)@13
    u0_m0_wo2_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u0_m0_wo2_mtree_madd2_0_constmult1_sub_3_q(27)) & u0_m0_wo2_mtree_madd2_0_constmult1_sub_3_q);
    u0_m0_wo2_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo2_mtree_madd2_0_constmult0_shift4_q(30)) & u0_m0_wo2_mtree_madd2_0_constmult0_shift4_q);
    u0_m0_wo2_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_madd2_0_sum1_a) + SIGNED(u0_m0_wo2_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_madd2_0_sum1_q <= u0_m0_wo2_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u0_m0_wo0_wi1_phasedelay1_q_14_replace_mem(DUALMEM,465)
    d_u0_m0_wo0_wi1_phasedelay1_q_14_replace_mem_reset0 <= areset;
    d_u0_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ia <= u0_m0_wo0_wi1_delayr1_q;
    d_u0_m0_wo0_wi1_phasedelay1_q_14_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q;
    d_u0_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q;
    d_u0_m0_wo0_wi1_phasedelay1_q_14_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 16,
        widthad_b => 2,
        numwords_b => 3,
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
        clocken1 => d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u0_m0_wo0_wi1_phasedelay1_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u0_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u0_m0_wo0_wi1_phasedelay1_q_14_replace_mem_iq,
        address_a => d_u0_m0_wo0_wi1_phasedelay1_q_14_replace_mem_aa,
        data_a => d_u0_m0_wo0_wi1_phasedelay1_q_14_replace_mem_ia
    );
        d_u0_m0_wo0_wi1_phasedelay1_q_14_replace_mem_q <= d_u0_m0_wo0_wi1_phasedelay1_q_14_replace_mem_iq(15 downto 0);

	--u0_m0_wo1_mtree_mult1_0_shift0(BITSHIFT,373)@14
    u0_m0_wo1_mtree_mult1_0_shift0_q_int <= d_u0_m0_wo0_wi1_phasedelay1_q_14_replace_mem_q & "00000000000000";
    u0_m0_wo1_mtree_mult1_0_shift0_q <= u0_m0_wo1_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u0_m0_wo0_wi1_sym_add1(ADD,22)@10
    u0_m0_wo0_wi1_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi1_delayr1_q(15)) & u0_m0_wo0_wi1_delayr1_q);
    u0_m0_wo0_wi1_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_delayr2_q(15)) & u0_m0_wo0_wi0_delayr2_q);
    u0_m0_wo0_wi1_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi1_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi1_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_wi1_sym_add1_a) + SIGNED(u0_m0_wo0_wi1_sym_add1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_wi1_sym_add1_q <= u0_m0_wo0_wi1_sym_add1_o(16 downto 0);


	--d_u0_m0_wo0_wi1_sym_add1_q_12(DELAY,432)@11
    d_u0_m0_wo0_wi1_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi1_sym_add1_q, xout => d_u0_m0_wo0_wi1_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_madd2_0_constmult1_shift2(BITSHIFT,338)@12
    u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int <= d_u0_m0_wo0_wi1_sym_add1_q_12_q & "00000000000";
    u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q <= u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int(27 downto 0);

	--u0_m0_wo0_mtree_madd2_0_constmult1_shift0(BITSHIFT,336)@11
    u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int <= u0_m0_wo0_wi1_sym_add1_q & "00000000";
    u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q <= u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int(24 downto 0);

	--u0_m0_wo0_mtree_madd2_0_constmult1_add_1(ADD,337)@11
    u0_m0_wo0_mtree_madd2_0_constmult1_add_1_a <= STD_LOGIC_VECTOR((25 downto 17 => u0_m0_wo0_wi1_sym_add1_q(16)) & u0_m0_wo0_wi1_sym_add1_q);
    u0_m0_wo0_mtree_madd2_0_constmult1_add_1_b <= STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q(24)) & u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q);
    u0_m0_wo0_mtree_madd2_0_constmult1_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_madd2_0_constmult1_add_1_a) + SIGNED(u0_m0_wo0_mtree_madd2_0_constmult1_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_madd2_0_constmult1_add_1_q <= u0_m0_wo0_mtree_madd2_0_constmult1_add_1_o(25 downto 0);


	--u0_m0_wo0_mtree_madd2_0_constmult1_add_3(ADD,339)@12
    u0_m0_wo0_mtree_madd2_0_constmult1_add_3_a <= STD_LOGIC_VECTOR((28 downto 26 => u0_m0_wo0_mtree_madd2_0_constmult1_add_1_q(25)) & u0_m0_wo0_mtree_madd2_0_constmult1_add_1_q);
    u0_m0_wo0_mtree_madd2_0_constmult1_add_3_b <= STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q(27)) & u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q);
    u0_m0_wo0_mtree_madd2_0_constmult1_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_madd2_0_constmult1_add_3_a) + SIGNED(u0_m0_wo0_mtree_madd2_0_constmult1_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_madd2_0_constmult1_add_3_q <= u0_m0_wo0_mtree_madd2_0_constmult1_add_3_o(28 downto 0);


	--u0_m0_wo0_mtree_madd2_0_constmult1_shift4(BITSHIFT,340)@13
    u0_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int <= u0_m0_wo0_mtree_madd2_0_constmult1_add_3_q & "00";
    u0_m0_wo0_mtree_madd2_0_constmult1_shift4_q <= u0_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int(30 downto 0);

	--u0_m0_wo0_wi1_delayr3(DELAY,18)@10
    u0_m0_wo0_wi1_delayr3 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi1_delayr1_q, xout => u0_m0_wo0_wi1_delayr3_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo0_wi0_sym_add0(ADD,21)@10
    u0_m0_wo0_wi0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_0(15)) & xIn_0);
    u0_m0_wo0_wi0_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi1_delayr3_q(15)) & u0_m0_wo0_wi1_delayr3_q);
    u0_m0_wo0_wi0_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_wi0_sym_add0_a) + SIGNED(u0_m0_wo0_wi0_sym_add0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_sym_add0_q <= u0_m0_wo0_wi0_sym_add0_o(16 downto 0);


	--d_u0_m0_wo0_wi0_sym_add0_q_12(DELAY,431)@11
    d_u0_m0_wo0_wi0_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_sym_add0_q, xout => d_u0_m0_wo0_wi0_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_madd2_0_constmult0_shift2(BITSHIFT,334)@12
    u0_m0_wo0_mtree_madd2_0_constmult0_shift2_q_int <= d_u0_m0_wo0_wi0_sym_add0_q_12_q & "0000000000";
    u0_m0_wo0_mtree_madd2_0_constmult0_shift2_q <= u0_m0_wo0_mtree_madd2_0_constmult0_shift2_q_int(26 downto 0);

	--u0_m0_wo0_mtree_madd2_0_constmult0_shift0(BITSHIFT,332)@11
    u0_m0_wo0_mtree_madd2_0_constmult0_shift0_q_int <= u0_m0_wo0_wi0_sym_add0_q & "00";
    u0_m0_wo0_mtree_madd2_0_constmult0_shift0_q <= u0_m0_wo0_mtree_madd2_0_constmult0_shift0_q_int(18 downto 0);

	--u0_m0_wo0_mtree_madd2_0_constmult0_sub_1(SUB,333)@11
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_a <= STD_LOGIC_VECTOR((19 downto 1 => GND_q(0)) & GND_q);
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_b <= STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_madd2_0_constmult0_shift0_q(18)) & u0_m0_wo0_mtree_madd2_0_constmult0_shift0_q);
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_a) - SIGNED(u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_q <= u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_o(19 downto 0);


	--u0_m0_wo0_mtree_madd2_0_constmult0_sub_3(SUB,335)@12
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_3_a <= STD_LOGIC_VECTOR((27 downto 20 => u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_q(19)) & u0_m0_wo0_mtree_madd2_0_constmult0_sub_1_q);
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_3_b <= STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_madd2_0_constmult0_shift2_q(26)) & u0_m0_wo0_mtree_madd2_0_constmult0_shift2_q);
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult0_sub_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult0_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_madd2_0_constmult0_sub_3_a) - SIGNED(u0_m0_wo0_mtree_madd2_0_constmult0_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_3_q <= u0_m0_wo0_mtree_madd2_0_constmult0_sub_3_o(27 downto 0);


	--u0_m0_wo0_mtree_madd2_0_sum1(ADD,341)@13
    u0_m0_wo0_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u0_m0_wo0_mtree_madd2_0_constmult0_sub_3_q(27)) & u0_m0_wo0_mtree_madd2_0_constmult0_sub_3_q);
    u0_m0_wo0_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo0_mtree_madd2_0_constmult1_shift4_q(30)) & u0_m0_wo0_mtree_madd2_0_constmult1_shift4_q);
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

	--d_u0_m0_wo0_memread_q_13(DELAY,428)@10
    d_u0_m0_wo0_memread_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => xIn_v, xout => d_u0_m0_wo0_memread_q_13_q, clk => clk, aclr => areset );

	--u0_m0_wo0_oseq_gated_reg(REG,24)@13
    u0_m0_wo0_oseq_gated_reg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= d_u0_m0_wo0_memread_q_13_q;
        END IF;
    END PROCESS;


	--xOut(PORTOUT,331)@14
    xOut_v <= u0_m0_wo0_oseq_gated_reg_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= STD_LOGIC_VECTOR((33 downto 32 => u0_m0_wo0_mtree_madd2_0_sum1_q(31)) & u0_m0_wo0_mtree_madd2_0_sum1_q);
    xOut_1 <= STD_LOGIC_VECTOR((33 downto 30 => u0_m0_wo1_mtree_mult1_0_shift0_q(29)) & u0_m0_wo1_mtree_mult1_0_shift0_q);
    xOut_2 <= STD_LOGIC_VECTOR((33 downto 32 => u0_m0_wo2_mtree_madd2_0_sum1_q(31)) & u0_m0_wo2_mtree_madd2_0_sum1_q);
    xOut_3 <= STD_LOGIC_VECTOR((33 downto 30 => u0_m0_wo3_mtree_mult1_0_shift0_q(29)) & u0_m0_wo3_mtree_mult1_0_shift0_q);
    xOut_4 <= STD_LOGIC_VECTOR((33 downto 32 => u1_m0_wo0_mtree_madd2_0_sum1_q(31)) & u1_m0_wo0_mtree_madd2_0_sum1_q);
    xOut_5 <= STD_LOGIC_VECTOR((33 downto 30 => u1_m0_wo1_mtree_mult1_0_shift0_q(29)) & u1_m0_wo1_mtree_mult1_0_shift0_q);
    xOut_6 <= STD_LOGIC_VECTOR((33 downto 32 => u1_m0_wo2_mtree_madd2_0_sum1_q(31)) & u1_m0_wo2_mtree_madd2_0_sum1_q);
    xOut_7 <= STD_LOGIC_VECTOR((33 downto 30 => u1_m0_wo3_mtree_mult1_0_shift0_q(29)) & u1_m0_wo3_mtree_mult1_0_shift0_q);
    xOut_8 <= STD_LOGIC_VECTOR((33 downto 32 => u2_m0_wo0_mtree_madd2_0_sum1_q(31)) & u2_m0_wo0_mtree_madd2_0_sum1_q);
    xOut_9 <= STD_LOGIC_VECTOR((33 downto 30 => u2_m0_wo1_mtree_mult1_0_shift0_q(29)) & u2_m0_wo1_mtree_mult1_0_shift0_q);
    xOut_10 <= STD_LOGIC_VECTOR((33 downto 32 => u2_m0_wo2_mtree_madd2_0_sum1_q(31)) & u2_m0_wo2_mtree_madd2_0_sum1_q);
    xOut_11 <= STD_LOGIC_VECTOR((33 downto 30 => u2_m0_wo3_mtree_mult1_0_shift0_q(29)) & u2_m0_wo3_mtree_mult1_0_shift0_q);
    xOut_12 <= STD_LOGIC_VECTOR((33 downto 32 => u3_m0_wo0_mtree_madd2_0_sum1_q(31)) & u3_m0_wo0_mtree_madd2_0_sum1_q);
    xOut_13 <= STD_LOGIC_VECTOR((33 downto 30 => u3_m0_wo1_mtree_mult1_0_shift0_q(29)) & u3_m0_wo1_mtree_mult1_0_shift0_q);
    xOut_14 <= STD_LOGIC_VECTOR((33 downto 32 => u3_m0_wo2_mtree_madd2_0_sum1_q(31)) & u3_m0_wo2_mtree_madd2_0_sum1_q);
    xOut_15 <= STD_LOGIC_VECTOR((33 downto 30 => u3_m0_wo3_mtree_mult1_0_shift0_q(29)) & u3_m0_wo3_mtree_mult1_0_shift0_q);


end normal;
