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

-- VHDL created from DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR21
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
entity DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR21 is
    port (
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        xIn_0 : in std_logic_vector(15 downto 0);
        xIn_1 : in std_logic_vector(15 downto 0);
        xIn_2 : in std_logic_vector(15 downto 0);
        xIn_3 : in std_logic_vector(15 downto 0);
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
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR21 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_sel_q_14_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_memread_q_13_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr2_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr3_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_sym_add0_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add0_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add0_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add0_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add1_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add1_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_sym_add1_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_sym_add1_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_oseq_gated_reg_q : std_logic_vector (0 downto 0);
    signal u1_m0_wo0_wi0_delayr1_q : std_logic_vector (15 downto 0);
    signal u1_m0_wo0_wi0_delayr2_q : std_logic_vector (15 downto 0);
    signal u1_m0_wo0_wi0_delayr3_q : std_logic_vector (15 downto 0);
    signal u1_m0_wo0_sym_add0_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo0_sym_add0_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo0_sym_add0_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo0_sym_add0_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo0_sym_add1_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo0_sym_add1_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo0_sym_add1_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo0_sym_add1_q : std_logic_vector (16 downto 0);
    signal u2_m0_wo0_wi0_delayr1_q : std_logic_vector (15 downto 0);
    signal u2_m0_wo0_wi0_delayr2_q : std_logic_vector (15 downto 0);
    signal u2_m0_wo0_wi0_delayr3_q : std_logic_vector (15 downto 0);
    signal u2_m0_wo0_sym_add0_a : std_logic_vector(16 downto 0);
    signal u2_m0_wo0_sym_add0_b : std_logic_vector(16 downto 0);
    signal u2_m0_wo0_sym_add0_o : std_logic_vector (16 downto 0);
    signal u2_m0_wo0_sym_add0_q : std_logic_vector (16 downto 0);
    signal u2_m0_wo0_sym_add1_a : std_logic_vector(16 downto 0);
    signal u2_m0_wo0_sym_add1_b : std_logic_vector(16 downto 0);
    signal u2_m0_wo0_sym_add1_o : std_logic_vector (16 downto 0);
    signal u2_m0_wo0_sym_add1_q : std_logic_vector (16 downto 0);
    signal u3_m0_wo0_wi0_delayr1_q : std_logic_vector (15 downto 0);
    signal u3_m0_wo0_wi0_delayr2_q : std_logic_vector (15 downto 0);
    signal u3_m0_wo0_wi0_delayr3_q : std_logic_vector (15 downto 0);
    signal u3_m0_wo0_sym_add0_a : std_logic_vector(16 downto 0);
    signal u3_m0_wo0_sym_add0_b : std_logic_vector(16 downto 0);
    signal u3_m0_wo0_sym_add0_o : std_logic_vector (16 downto 0);
    signal u3_m0_wo0_sym_add0_q : std_logic_vector (16 downto 0);
    signal u3_m0_wo0_sym_add1_a : std_logic_vector(16 downto 0);
    signal u3_m0_wo0_sym_add1_b : std_logic_vector(16 downto 0);
    signal u3_m0_wo0_sym_add1_o : std_logic_vector (16 downto 0);
    signal u3_m0_wo0_sym_add1_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo1_wi0_delayr0_q : std_logic_vector (15 downto 0);
    signal u1_m0_wo1_wi0_delayr0_q : std_logic_vector (15 downto 0);
    signal u2_m0_wo1_wi0_delayr0_q : std_logic_vector (15 downto 0);
    signal u3_m0_wo1_wi0_delayr0_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_a : std_logic_vector(17 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_b : std_logic_vector(17 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_o : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_q : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_add_2_a : std_logic_vector(23 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_add_2_b : std_logic_vector(23 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_add_2_o : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_add_2_q : std_logic_vector (23 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_4_a : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_4_b : std_logic_vector(28 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_4_o : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_4_q : std_logic_vector (28 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_1_a : std_logic_vector(21 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_1_b : std_logic_vector(21 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_1_o : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_1_q : std_logic_vector (21 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_3_a : std_logic_vector(20 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_3_b : std_logic_vector(20 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_3_o : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_3_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_5_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_5_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_5_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_5_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_sum1_a : std_logic_vector(32 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_sum1_b : std_logic_vector(32 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_sum1_o : std_logic_vector (32 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_sum1_q : std_logic_vector (32 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_a : std_logic_vector(17 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_b : std_logic_vector(17 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_o : std_logic_vector (17 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_q : std_logic_vector (17 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_add_2_a : std_logic_vector(23 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_add_2_b : std_logic_vector(23 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_add_2_o : std_logic_vector (23 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_add_2_q : std_logic_vector (23 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_4_a : std_logic_vector(28 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_4_b : std_logic_vector(28 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_4_o : std_logic_vector (28 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_4_q : std_logic_vector (28 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_1_a : std_logic_vector(21 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_1_b : std_logic_vector(21 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_1_o : std_logic_vector (21 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_1_q : std_logic_vector (21 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_3_a : std_logic_vector(20 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_3_b : std_logic_vector(20 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_3_o : std_logic_vector (20 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_3_q : std_logic_vector (20 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_5_a : std_logic_vector(31 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_5_b : std_logic_vector(31 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_5_o : std_logic_vector (31 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_5_q : std_logic_vector (31 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_sum1_a : std_logic_vector(32 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_sum1_b : std_logic_vector(32 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_sum1_o : std_logic_vector (32 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_sum1_q : std_logic_vector (32 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_a : std_logic_vector(17 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_b : std_logic_vector(17 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_o : std_logic_vector (17 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_q : std_logic_vector (17 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_add_2_a : std_logic_vector(23 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_add_2_b : std_logic_vector(23 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_add_2_o : std_logic_vector (23 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_add_2_q : std_logic_vector (23 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_4_a : std_logic_vector(28 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_4_b : std_logic_vector(28 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_4_o : std_logic_vector (28 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_4_q : std_logic_vector (28 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_1_a : std_logic_vector(21 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_1_b : std_logic_vector(21 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_1_o : std_logic_vector (21 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_1_q : std_logic_vector (21 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_3_a : std_logic_vector(20 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_3_b : std_logic_vector(20 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_3_o : std_logic_vector (20 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_3_q : std_logic_vector (20 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_5_a : std_logic_vector(31 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_5_b : std_logic_vector(31 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_5_o : std_logic_vector (31 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_5_q : std_logic_vector (31 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_sum1_a : std_logic_vector(32 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_sum1_b : std_logic_vector(32 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_sum1_o : std_logic_vector (32 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_sum1_q : std_logic_vector (32 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_a : std_logic_vector(17 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_b : std_logic_vector(17 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_o : std_logic_vector (17 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_q : std_logic_vector (17 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_add_2_a : std_logic_vector(23 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_add_2_b : std_logic_vector(23 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_add_2_o : std_logic_vector (23 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_add_2_q : std_logic_vector (23 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_4_a : std_logic_vector(28 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_4_b : std_logic_vector(28 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_4_o : std_logic_vector (28 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_4_q : std_logic_vector (28 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_1_a : std_logic_vector(21 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_1_b : std_logic_vector(21 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_1_o : std_logic_vector (21 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_1_q : std_logic_vector (21 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_3_a : std_logic_vector(20 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_3_b : std_logic_vector(20 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_3_o : std_logic_vector (20 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_3_q : std_logic_vector (20 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_5_a : std_logic_vector(31 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_5_b : std_logic_vector(31 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_5_o : std_logic_vector (31 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_5_q : std_logic_vector (31 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_sum1_a : std_logic_vector(32 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_sum1_b : std_logic_vector(32 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_sum1_o : std_logic_vector (32 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_sum1_q : std_logic_vector (32 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_replace_mem_reset0 : std_logic;
    signal d_in0_m0_wi0_wo0_assign_data_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdcnt_i : unsigned(1 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdcnt_eq : std_logic;
    signal d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_mem_top_q : std_logic_vector (2 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_cmpReg_q : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_sticky_ena_q : std_logic_vector (0 downto 0);
    signal d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_reset0 : std_logic;
    signal d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_in2_m0_wi0_wo0_assign_data_q_14_replace_mem_reset0 : std_logic;
    signal d_in2_m0_wi0_wo0_assign_data_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_in2_m0_wi0_wo0_assign_data_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_in2_m0_wi0_wo0_assign_data_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_in2_m0_wi0_wo0_assign_data_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_in2_m0_wi0_wo0_assign_data_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_in2_m0_wi0_wo0_assign_data_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_in3_m0_wi0_wo0_assign_data_q_14_replace_mem_reset0 : std_logic;
    signal d_in3_m0_wi0_wo0_assign_data_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_in3_m0_wi0_wo0_assign_data_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_in3_m0_wi0_wo0_assign_data_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_in3_m0_wi0_wo0_assign_data_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_in3_m0_wi0_wo0_assign_data_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_in3_m0_wi0_wo0_assign_data_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_notEnable_a : std_logic_vector(0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_notEnable_q : std_logic_vector(0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_enaAnd_a : std_logic_vector(0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_enaAnd_b : std_logic_vector(0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_enaAnd_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int : std_logic_vector (22 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_shift1_q : std_logic_vector (22 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (20 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int : std_logic_vector (19 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q : std_logic_vector (19 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int : std_logic_vector (22 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_shift1_q : std_logic_vector (22 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (20 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (20 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int : std_logic_vector (19 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q : std_logic_vector (19 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int : std_logic_vector (22 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_shift1_q : std_logic_vector (22 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (20 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (20 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int : std_logic_vector (19 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_shift2_q : std_logic_vector (19 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int : std_logic_vector (22 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_shift1_q : std_logic_vector (22 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (20 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (20 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int : std_logic_vector (19 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_shift2_q : std_logic_vector (19 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo1_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u1_m0_wo1_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u1_m0_wo1_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u2_m0_wo1_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u2_m0_wo1_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u3_m0_wo1_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u3_m0_wo1_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_shift3_q_int : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_shift3_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_shift4_q : std_logic_vector (30 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_shift3_q_int : std_logic_vector (27 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_shift3_q : std_logic_vector (27 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int : std_logic_vector (30 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_shift4_q : std_logic_vector (30 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_shift3_q_int : std_logic_vector (27 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_shift3_q : std_logic_vector (27 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int : std_logic_vector (30 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_shift4_q : std_logic_vector (30 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_shift3_q_int : std_logic_vector (27 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_shift3_q : std_logic_vector (27 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int : std_logic_vector (30 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_shift4_q : std_logic_vector (30 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_cmp_a : std_logic_vector(2 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_cmp_b : std_logic_vector(2 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_cmp_q : std_logic_vector(0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_nor_a : std_logic_vector(0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_nor_b : std_logic_vector(0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_14_nor_q : std_logic_vector(0 downto 0);
begin


	--xIn(PORTIN,2)@10

	--d_in0_m0_wi0_wo0_assign_sel_q_14(DELAY,161)@10
    d_in0_m0_wi0_wo0_assign_sel_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => xIn_v, xout => d_in0_m0_wi0_wo0_assign_sel_q_14_q, clk => clk, aclr => areset );

	--d_in0_m0_wi0_wo0_assign_data_q_14_notEnable(LOGICAL,174)
    d_in0_m0_wi0_wo0_assign_data_q_14_notEnable_a <= VCC_q;
    d_in0_m0_wi0_wo0_assign_data_q_14_notEnable_q <= not d_in0_m0_wi0_wo0_assign_data_q_14_notEnable_a;

	--d_in0_m0_wi0_wo0_assign_data_q_14_nor(LOGICAL,175)
    d_in0_m0_wi0_wo0_assign_data_q_14_nor_a <= d_in0_m0_wi0_wo0_assign_data_q_14_notEnable_q;
    d_in0_m0_wi0_wo0_assign_data_q_14_nor_b <= d_in0_m0_wi0_wo0_assign_data_q_14_sticky_ena_q;
    d_in0_m0_wi0_wo0_assign_data_q_14_nor_q <= not (d_in0_m0_wi0_wo0_assign_data_q_14_nor_a or d_in0_m0_wi0_wo0_assign_data_q_14_nor_b);

	--d_in0_m0_wi0_wo0_assign_data_q_14_mem_top(CONSTANT,171)
    d_in0_m0_wi0_wo0_assign_data_q_14_mem_top_q <= "010";

	--d_in0_m0_wi0_wo0_assign_data_q_14_cmp(LOGICAL,172)
    d_in0_m0_wi0_wo0_assign_data_q_14_cmp_a <= d_in0_m0_wi0_wo0_assign_data_q_14_mem_top_q;
    d_in0_m0_wi0_wo0_assign_data_q_14_cmp_b <= STD_LOGIC_VECTOR("0" & d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdmux_q);
    d_in0_m0_wi0_wo0_assign_data_q_14_cmp_q <= "1" when d_in0_m0_wi0_wo0_assign_data_q_14_cmp_a = d_in0_m0_wi0_wo0_assign_data_q_14_cmp_b else "0";

	--d_in0_m0_wi0_wo0_assign_data_q_14_cmpReg(REG,173)
    d_in0_m0_wi0_wo0_assign_data_q_14_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_in0_m0_wi0_wo0_assign_data_q_14_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_in0_m0_wi0_wo0_assign_data_q_14_cmpReg_q <= d_in0_m0_wi0_wo0_assign_data_q_14_cmp_q;
        END IF;
    END PROCESS;


	--d_in0_m0_wi0_wo0_assign_data_q_14_sticky_ena(REG,176)
    d_in0_m0_wi0_wo0_assign_data_q_14_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_in0_m0_wi0_wo0_assign_data_q_14_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_data_q_14_nor_q = "1") THEN
                d_in0_m0_wi0_wo0_assign_data_q_14_sticky_ena_q <= d_in0_m0_wi0_wo0_assign_data_q_14_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--d_in0_m0_wi0_wo0_assign_data_q_14_enaAnd(LOGICAL,177)
    d_in0_m0_wi0_wo0_assign_data_q_14_enaAnd_a <= d_in0_m0_wi0_wo0_assign_data_q_14_sticky_ena_q;
    d_in0_m0_wi0_wo0_assign_data_q_14_enaAnd_b <= VCC_q;
    d_in0_m0_wi0_wo0_assign_data_q_14_enaAnd_q <= d_in0_m0_wi0_wo0_assign_data_q_14_enaAnd_a and d_in0_m0_wi0_wo0_assign_data_q_14_enaAnd_b;

	--d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdcnt(COUNTER,167)
    -- every=1, low=0, high=2, step=1, init=1
    d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdcnt_i <= TO_UNSIGNED(1,2);
            d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdcnt_i = 1 THEN
                  d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdcnt_eq <= '1';
                ELSE
                  d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdcnt_eq <= '0';
                END IF;
                IF (d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdcnt_eq = '1') THEN
                    d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdcnt_i <= d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdcnt_i - 2;
                ELSE
                    d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdcnt_i <= d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdcnt_i,2));


	--d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdreg(REG,168)
    d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdreg_q <= "00";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdreg_q <= d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--VCC(CONSTANT,1)@0
    VCC_q <= "1";

	--d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdmux(MUX,169)
    d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdmux_s <= VCC_q;
    d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdmux: PROCESS (d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdmux_s, d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdreg_q, d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdcnt_q)
    BEGIN
            CASE d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdmux_s IS
                  WHEN "0" => d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdmux_q <= d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdreg_q;
                  WHEN "1" => d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdmux_q <= d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdcnt_q;
                  WHEN OTHERS => d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--d_in3_m0_wi0_wo0_assign_data_q_14_replace_mem(DUALMEM,202)
    d_in3_m0_wi0_wo0_assign_data_q_14_replace_mem_reset0 <= areset;
    d_in3_m0_wi0_wo0_assign_data_q_14_replace_mem_ia <= xIn_3;
    d_in3_m0_wi0_wo0_assign_data_q_14_replace_mem_aa <= d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdreg_q;
    d_in3_m0_wi0_wo0_assign_data_q_14_replace_mem_ab <= d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdmux_q;
    d_in3_m0_wi0_wo0_assign_data_q_14_replace_mem_dmem : altsyncram
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
        clocken1 => d_in0_m0_wi0_wo0_assign_data_q_14_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_in3_m0_wi0_wo0_assign_data_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_in3_m0_wi0_wo0_assign_data_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_in3_m0_wi0_wo0_assign_data_q_14_replace_mem_iq,
        address_a => d_in3_m0_wi0_wo0_assign_data_q_14_replace_mem_aa,
        data_a => d_in3_m0_wi0_wo0_assign_data_q_14_replace_mem_ia
    );
        d_in3_m0_wi0_wo0_assign_data_q_14_replace_mem_q <= d_in3_m0_wi0_wo0_assign_data_q_14_replace_mem_iq(15 downto 0);

	--u3_m0_wo1_wi0_delayr0(DELAY,86)@14
    u3_m0_wo1_wi0_delayr0 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => d_in3_m0_wi0_wo0_assign_data_q_14_replace_mem_q, xout => u3_m0_wo1_wi0_delayr0_q, ena => d_in0_m0_wi0_wo0_assign_sel_q_14_q(0), clk => clk, aclr => areset );

	--u3_m0_wo1_mtree_mult1_0_shift0(BITSHIFT,159)@14
    u3_m0_wo1_mtree_mult1_0_shift0_q_int <= u3_m0_wo1_wi0_delayr0_q & "00000000000000";
    u3_m0_wo1_mtree_mult1_0_shift0_q <= u3_m0_wo1_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u3_m0_wo0_mtree_madd2_0_constmult1_shift2(BITSHIFT,151)@11
    u3_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int <= u3_m0_wo0_sym_add1_q & "000";
    u3_m0_wo0_mtree_madd2_0_constmult1_shift2_q <= u3_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int(19 downto 0);

	--u3_m0_wo0_wi0_delayr2(DELAY,51)@10
    u3_m0_wo0_wi0_delayr2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => u3_m0_wo0_wi0_delayr1_q, xout => u3_m0_wo0_wi0_delayr2_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u3_m0_wo0_wi0_delayr1(DELAY,50)@10
    u3_m0_wo0_wi0_delayr1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_3, xout => u3_m0_wo0_wi0_delayr1_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u3_m0_wo0_sym_add1(ADD,56)@10
    u3_m0_wo0_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => u3_m0_wo0_wi0_delayr1_q(15)) & u3_m0_wo0_wi0_delayr1_q);
    u3_m0_wo0_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u3_m0_wo0_wi0_delayr2_q(15)) & u3_m0_wo0_wi0_delayr2_q);
    u3_m0_wo0_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo0_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo0_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo0_sym_add1_a) + SIGNED(u3_m0_wo0_sym_add1_b));
        END IF;
    END PROCESS;
    u3_m0_wo0_sym_add1_q <= u3_m0_wo0_sym_add1_o(16 downto 0);


	--u3_m0_wo0_mtree_madd2_0_constmult1_add_3(ADD,152)@11
    u3_m0_wo0_mtree_madd2_0_constmult1_add_3_a <= STD_LOGIC_VECTOR((20 downto 17 => u3_m0_wo0_sym_add1_q(16)) & u3_m0_wo0_sym_add1_q);
    u3_m0_wo0_mtree_madd2_0_constmult1_add_3_b <= STD_LOGIC_VECTOR((20 downto 20 => u3_m0_wo0_mtree_madd2_0_constmult1_shift2_q(19)) & u3_m0_wo0_mtree_madd2_0_constmult1_shift2_q);
    u3_m0_wo0_mtree_madd2_0_constmult1_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo0_mtree_madd2_0_constmult1_add_3_a) + SIGNED(u3_m0_wo0_mtree_madd2_0_constmult1_add_3_b));
        END IF;
    END PROCESS;
    u3_m0_wo0_mtree_madd2_0_constmult1_add_3_q <= u3_m0_wo0_mtree_madd2_0_constmult1_add_3_o(20 downto 0);


	--u3_m0_wo0_mtree_madd2_0_constmult1_shift4(BITSHIFT,153)@12
    u3_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int <= u3_m0_wo0_mtree_madd2_0_constmult1_add_3_q & "0000000000";
    u3_m0_wo0_mtree_madd2_0_constmult1_shift4_q <= u3_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int(30 downto 0);

	--u3_m0_wo0_mtree_madd2_0_constmult1_shift0(BITSHIFT,149)@11
    u3_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int <= u3_m0_wo0_sym_add1_q & "0000";
    u3_m0_wo0_mtree_madd2_0_constmult1_shift0_q <= u3_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int(20 downto 0);

	--u3_m0_wo0_mtree_madd2_0_constmult1_add_1(ADD,150)@11
    u3_m0_wo0_mtree_madd2_0_constmult1_add_1_a <= STD_LOGIC_VECTOR((21 downto 17 => u3_m0_wo0_sym_add1_q(16)) & u3_m0_wo0_sym_add1_q);
    u3_m0_wo0_mtree_madd2_0_constmult1_add_1_b <= STD_LOGIC_VECTOR((21 downto 21 => u3_m0_wo0_mtree_madd2_0_constmult1_shift0_q(20)) & u3_m0_wo0_mtree_madd2_0_constmult1_shift0_q);
    u3_m0_wo0_mtree_madd2_0_constmult1_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo0_mtree_madd2_0_constmult1_add_1_a) + SIGNED(u3_m0_wo0_mtree_madd2_0_constmult1_add_1_b));
        END IF;
    END PROCESS;
    u3_m0_wo0_mtree_madd2_0_constmult1_add_1_q <= u3_m0_wo0_mtree_madd2_0_constmult1_add_1_o(21 downto 0);


	--u3_m0_wo0_mtree_madd2_0_constmult1_add_5(ADD,154)@12
    u3_m0_wo0_mtree_madd2_0_constmult1_add_5_a <= STD_LOGIC_VECTOR((31 downto 22 => u3_m0_wo0_mtree_madd2_0_constmult1_add_1_q(21)) & u3_m0_wo0_mtree_madd2_0_constmult1_add_1_q);
    u3_m0_wo0_mtree_madd2_0_constmult1_add_5_b <= STD_LOGIC_VECTOR((31 downto 31 => u3_m0_wo0_mtree_madd2_0_constmult1_shift4_q(30)) & u3_m0_wo0_mtree_madd2_0_constmult1_shift4_q);
    u3_m0_wo0_mtree_madd2_0_constmult1_add_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult1_add_5_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult1_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo0_mtree_madd2_0_constmult1_add_5_a) + SIGNED(u3_m0_wo0_mtree_madd2_0_constmult1_add_5_b));
        END IF;
    END PROCESS;
    u3_m0_wo0_mtree_madd2_0_constmult1_add_5_q <= u3_m0_wo0_mtree_madd2_0_constmult1_add_5_o(31 downto 0);


	--u3_m0_wo0_mtree_madd2_0_constmult0_shift1(BITSHIFT,145)@11
    u3_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int <= u3_m0_wo0_sym_add0_q & "000000";
    u3_m0_wo0_mtree_madd2_0_constmult0_shift1_q <= u3_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int(22 downto 0);

	--u3_m0_wo0_wi0_delayr3(DELAY,52)@10
    u3_m0_wo0_wi0_delayr3 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => u3_m0_wo0_wi0_delayr2_q, xout => u3_m0_wo0_wi0_delayr3_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u3_m0_wo0_sym_add0(ADD,55)@10
    u3_m0_wo0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_3(15)) & xIn_3);
    u3_m0_wo0_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => u3_m0_wo0_wi0_delayr3_q(15)) & u3_m0_wo0_wi0_delayr3_q);
    u3_m0_wo0_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo0_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo0_sym_add0_a) + SIGNED(u3_m0_wo0_sym_add0_b));
        END IF;
    END PROCESS;
    u3_m0_wo0_sym_add0_q <= u3_m0_wo0_sym_add0_o(16 downto 0);


	--u3_m0_wo0_mtree_madd2_0_constmult0_add_2(ADD,146)@11
    u3_m0_wo0_mtree_madd2_0_constmult0_add_2_a <= STD_LOGIC_VECTOR((23 downto 17 => u3_m0_wo0_sym_add0_q(16)) & u3_m0_wo0_sym_add0_q);
    u3_m0_wo0_mtree_madd2_0_constmult0_add_2_b <= STD_LOGIC_VECTOR((23 downto 23 => u3_m0_wo0_mtree_madd2_0_constmult0_shift1_q(22)) & u3_m0_wo0_mtree_madd2_0_constmult0_shift1_q);
    u3_m0_wo0_mtree_madd2_0_constmult0_add_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult0_add_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult0_add_2_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo0_mtree_madd2_0_constmult0_add_2_a) + SIGNED(u3_m0_wo0_mtree_madd2_0_constmult0_add_2_b));
        END IF;
    END PROCESS;
    u3_m0_wo0_mtree_madd2_0_constmult0_add_2_q <= u3_m0_wo0_mtree_madd2_0_constmult0_add_2_o(23 downto 0);


	--u3_m0_wo0_mtree_madd2_0_constmult0_shift3(BITSHIFT,147)@12
    u3_m0_wo0_mtree_madd2_0_constmult0_shift3_q_int <= u3_m0_wo0_mtree_madd2_0_constmult0_add_2_q & "0000";
    u3_m0_wo0_mtree_madd2_0_constmult0_shift3_q <= u3_m0_wo0_mtree_madd2_0_constmult0_shift3_q_int(27 downto 0);

	--u3_m0_wo0_mtree_madd2_0_constmult0_sub_0(SUB,144)@11
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_a <= STD_LOGIC_VECTOR((17 downto 1 => GND_q(0)) & GND_q);
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_b <= STD_LOGIC_VECTOR((17 downto 17 => u3_m0_wo0_sym_add0_q(16)) & u3_m0_wo0_sym_add0_q);
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_a) - SIGNED(u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_b));
        END IF;
    END PROCESS;
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_q <= u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_o(17 downto 0);


	--u3_m0_wo0_mtree_madd2_0_constmult0_sub_4(SUB,148)@12
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_4_a <= STD_LOGIC_VECTOR((28 downto 18 => u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_q(17)) & u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_q);
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_4_b <= STD_LOGIC_VECTOR((28 downto 28 => u3_m0_wo0_mtree_madd2_0_constmult0_shift3_q(27)) & u3_m0_wo0_mtree_madd2_0_constmult0_shift3_q);
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult0_sub_4_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult0_sub_4_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo0_mtree_madd2_0_constmult0_sub_4_a) - SIGNED(u3_m0_wo0_mtree_madd2_0_constmult0_sub_4_b));
        END IF;
    END PROCESS;
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_4_q <= u3_m0_wo0_mtree_madd2_0_constmult0_sub_4_o(28 downto 0);


	--u3_m0_wo0_mtree_madd2_0_sum1(ADD,155)@13
    u3_m0_wo0_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((32 downto 29 => u3_m0_wo0_mtree_madd2_0_constmult0_sub_4_q(28)) & u3_m0_wo0_mtree_madd2_0_constmult0_sub_4_q);
    u3_m0_wo0_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((32 downto 32 => u3_m0_wo0_mtree_madd2_0_constmult1_add_5_q(31)) & u3_m0_wo0_mtree_madd2_0_constmult1_add_5_q);
    u3_m0_wo0_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo0_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo0_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo0_mtree_madd2_0_sum1_a) + SIGNED(u3_m0_wo0_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u3_m0_wo0_mtree_madd2_0_sum1_q <= u3_m0_wo0_mtree_madd2_0_sum1_o(32 downto 0);


	--d_in2_m0_wi0_wo0_assign_data_q_14_replace_mem(DUALMEM,190)
    d_in2_m0_wi0_wo0_assign_data_q_14_replace_mem_reset0 <= areset;
    d_in2_m0_wi0_wo0_assign_data_q_14_replace_mem_ia <= xIn_2;
    d_in2_m0_wi0_wo0_assign_data_q_14_replace_mem_aa <= d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdreg_q;
    d_in2_m0_wi0_wo0_assign_data_q_14_replace_mem_ab <= d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdmux_q;
    d_in2_m0_wi0_wo0_assign_data_q_14_replace_mem_dmem : altsyncram
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
        clocken1 => d_in0_m0_wi0_wo0_assign_data_q_14_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_in2_m0_wi0_wo0_assign_data_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_in2_m0_wi0_wo0_assign_data_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_in2_m0_wi0_wo0_assign_data_q_14_replace_mem_iq,
        address_a => d_in2_m0_wi0_wo0_assign_data_q_14_replace_mem_aa,
        data_a => d_in2_m0_wi0_wo0_assign_data_q_14_replace_mem_ia
    );
        d_in2_m0_wi0_wo0_assign_data_q_14_replace_mem_q <= d_in2_m0_wi0_wo0_assign_data_q_14_replace_mem_iq(15 downto 0);

	--u2_m0_wo1_wi0_delayr0(DELAY,78)@14
    u2_m0_wo1_wi0_delayr0 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => d_in2_m0_wi0_wo0_assign_data_q_14_replace_mem_q, xout => u2_m0_wo1_wi0_delayr0_q, ena => d_in0_m0_wi0_wo0_assign_sel_q_14_q(0), clk => clk, aclr => areset );

	--u2_m0_wo1_mtree_mult1_0_shift0(BITSHIFT,158)@14
    u2_m0_wo1_mtree_mult1_0_shift0_q_int <= u2_m0_wo1_wi0_delayr0_q & "00000000000000";
    u2_m0_wo1_mtree_mult1_0_shift0_q <= u2_m0_wo1_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u2_m0_wo0_mtree_madd2_0_constmult1_shift2(BITSHIFT,139)@11
    u2_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int <= u2_m0_wo0_sym_add1_q & "000";
    u2_m0_wo0_mtree_madd2_0_constmult1_shift2_q <= u2_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int(19 downto 0);

	--u2_m0_wo0_wi0_delayr2(DELAY,37)@10
    u2_m0_wo0_wi0_delayr2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => u2_m0_wo0_wi0_delayr1_q, xout => u2_m0_wo0_wi0_delayr2_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u2_m0_wo0_wi0_delayr1(DELAY,36)@10
    u2_m0_wo0_wi0_delayr1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_2, xout => u2_m0_wo0_wi0_delayr1_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u2_m0_wo0_sym_add1(ADD,42)@10
    u2_m0_wo0_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => u2_m0_wo0_wi0_delayr1_q(15)) & u2_m0_wo0_wi0_delayr1_q);
    u2_m0_wo0_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u2_m0_wo0_wi0_delayr2_q(15)) & u2_m0_wo0_wi0_delayr2_q);
    u2_m0_wo0_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo0_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo0_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo0_sym_add1_a) + SIGNED(u2_m0_wo0_sym_add1_b));
        END IF;
    END PROCESS;
    u2_m0_wo0_sym_add1_q <= u2_m0_wo0_sym_add1_o(16 downto 0);


	--u2_m0_wo0_mtree_madd2_0_constmult1_add_3(ADD,140)@11
    u2_m0_wo0_mtree_madd2_0_constmult1_add_3_a <= STD_LOGIC_VECTOR((20 downto 17 => u2_m0_wo0_sym_add1_q(16)) & u2_m0_wo0_sym_add1_q);
    u2_m0_wo0_mtree_madd2_0_constmult1_add_3_b <= STD_LOGIC_VECTOR((20 downto 20 => u2_m0_wo0_mtree_madd2_0_constmult1_shift2_q(19)) & u2_m0_wo0_mtree_madd2_0_constmult1_shift2_q);
    u2_m0_wo0_mtree_madd2_0_constmult1_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo0_mtree_madd2_0_constmult1_add_3_a) + SIGNED(u2_m0_wo0_mtree_madd2_0_constmult1_add_3_b));
        END IF;
    END PROCESS;
    u2_m0_wo0_mtree_madd2_0_constmult1_add_3_q <= u2_m0_wo0_mtree_madd2_0_constmult1_add_3_o(20 downto 0);


	--u2_m0_wo0_mtree_madd2_0_constmult1_shift4(BITSHIFT,141)@12
    u2_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int <= u2_m0_wo0_mtree_madd2_0_constmult1_add_3_q & "0000000000";
    u2_m0_wo0_mtree_madd2_0_constmult1_shift4_q <= u2_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int(30 downto 0);

	--u2_m0_wo0_mtree_madd2_0_constmult1_shift0(BITSHIFT,137)@11
    u2_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int <= u2_m0_wo0_sym_add1_q & "0000";
    u2_m0_wo0_mtree_madd2_0_constmult1_shift0_q <= u2_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int(20 downto 0);

	--u2_m0_wo0_mtree_madd2_0_constmult1_add_1(ADD,138)@11
    u2_m0_wo0_mtree_madd2_0_constmult1_add_1_a <= STD_LOGIC_VECTOR((21 downto 17 => u2_m0_wo0_sym_add1_q(16)) & u2_m0_wo0_sym_add1_q);
    u2_m0_wo0_mtree_madd2_0_constmult1_add_1_b <= STD_LOGIC_VECTOR((21 downto 21 => u2_m0_wo0_mtree_madd2_0_constmult1_shift0_q(20)) & u2_m0_wo0_mtree_madd2_0_constmult1_shift0_q);
    u2_m0_wo0_mtree_madd2_0_constmult1_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo0_mtree_madd2_0_constmult1_add_1_a) + SIGNED(u2_m0_wo0_mtree_madd2_0_constmult1_add_1_b));
        END IF;
    END PROCESS;
    u2_m0_wo0_mtree_madd2_0_constmult1_add_1_q <= u2_m0_wo0_mtree_madd2_0_constmult1_add_1_o(21 downto 0);


	--u2_m0_wo0_mtree_madd2_0_constmult1_add_5(ADD,142)@12
    u2_m0_wo0_mtree_madd2_0_constmult1_add_5_a <= STD_LOGIC_VECTOR((31 downto 22 => u2_m0_wo0_mtree_madd2_0_constmult1_add_1_q(21)) & u2_m0_wo0_mtree_madd2_0_constmult1_add_1_q);
    u2_m0_wo0_mtree_madd2_0_constmult1_add_5_b <= STD_LOGIC_VECTOR((31 downto 31 => u2_m0_wo0_mtree_madd2_0_constmult1_shift4_q(30)) & u2_m0_wo0_mtree_madd2_0_constmult1_shift4_q);
    u2_m0_wo0_mtree_madd2_0_constmult1_add_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult1_add_5_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult1_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo0_mtree_madd2_0_constmult1_add_5_a) + SIGNED(u2_m0_wo0_mtree_madd2_0_constmult1_add_5_b));
        END IF;
    END PROCESS;
    u2_m0_wo0_mtree_madd2_0_constmult1_add_5_q <= u2_m0_wo0_mtree_madd2_0_constmult1_add_5_o(31 downto 0);


	--u2_m0_wo0_mtree_madd2_0_constmult0_shift1(BITSHIFT,133)@11
    u2_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int <= u2_m0_wo0_sym_add0_q & "000000";
    u2_m0_wo0_mtree_madd2_0_constmult0_shift1_q <= u2_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int(22 downto 0);

	--u2_m0_wo0_wi0_delayr3(DELAY,38)@10
    u2_m0_wo0_wi0_delayr3 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => u2_m0_wo0_wi0_delayr2_q, xout => u2_m0_wo0_wi0_delayr3_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u2_m0_wo0_sym_add0(ADD,41)@10
    u2_m0_wo0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_2(15)) & xIn_2);
    u2_m0_wo0_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => u2_m0_wo0_wi0_delayr3_q(15)) & u2_m0_wo0_wi0_delayr3_q);
    u2_m0_wo0_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo0_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo0_sym_add0_a) + SIGNED(u2_m0_wo0_sym_add0_b));
        END IF;
    END PROCESS;
    u2_m0_wo0_sym_add0_q <= u2_m0_wo0_sym_add0_o(16 downto 0);


	--u2_m0_wo0_mtree_madd2_0_constmult0_add_2(ADD,134)@11
    u2_m0_wo0_mtree_madd2_0_constmult0_add_2_a <= STD_LOGIC_VECTOR((23 downto 17 => u2_m0_wo0_sym_add0_q(16)) & u2_m0_wo0_sym_add0_q);
    u2_m0_wo0_mtree_madd2_0_constmult0_add_2_b <= STD_LOGIC_VECTOR((23 downto 23 => u2_m0_wo0_mtree_madd2_0_constmult0_shift1_q(22)) & u2_m0_wo0_mtree_madd2_0_constmult0_shift1_q);
    u2_m0_wo0_mtree_madd2_0_constmult0_add_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult0_add_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult0_add_2_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo0_mtree_madd2_0_constmult0_add_2_a) + SIGNED(u2_m0_wo0_mtree_madd2_0_constmult0_add_2_b));
        END IF;
    END PROCESS;
    u2_m0_wo0_mtree_madd2_0_constmult0_add_2_q <= u2_m0_wo0_mtree_madd2_0_constmult0_add_2_o(23 downto 0);


	--u2_m0_wo0_mtree_madd2_0_constmult0_shift3(BITSHIFT,135)@12
    u2_m0_wo0_mtree_madd2_0_constmult0_shift3_q_int <= u2_m0_wo0_mtree_madd2_0_constmult0_add_2_q & "0000";
    u2_m0_wo0_mtree_madd2_0_constmult0_shift3_q <= u2_m0_wo0_mtree_madd2_0_constmult0_shift3_q_int(27 downto 0);

	--u2_m0_wo0_mtree_madd2_0_constmult0_sub_0(SUB,132)@11
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_a <= STD_LOGIC_VECTOR((17 downto 1 => GND_q(0)) & GND_q);
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_b <= STD_LOGIC_VECTOR((17 downto 17 => u2_m0_wo0_sym_add0_q(16)) & u2_m0_wo0_sym_add0_q);
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_a) - SIGNED(u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_b));
        END IF;
    END PROCESS;
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_q <= u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_o(17 downto 0);


	--u2_m0_wo0_mtree_madd2_0_constmult0_sub_4(SUB,136)@12
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_4_a <= STD_LOGIC_VECTOR((28 downto 18 => u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_q(17)) & u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_q);
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_4_b <= STD_LOGIC_VECTOR((28 downto 28 => u2_m0_wo0_mtree_madd2_0_constmult0_shift3_q(27)) & u2_m0_wo0_mtree_madd2_0_constmult0_shift3_q);
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult0_sub_4_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult0_sub_4_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo0_mtree_madd2_0_constmult0_sub_4_a) - SIGNED(u2_m0_wo0_mtree_madd2_0_constmult0_sub_4_b));
        END IF;
    END PROCESS;
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_4_q <= u2_m0_wo0_mtree_madd2_0_constmult0_sub_4_o(28 downto 0);


	--u2_m0_wo0_mtree_madd2_0_sum1(ADD,143)@13
    u2_m0_wo0_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((32 downto 29 => u2_m0_wo0_mtree_madd2_0_constmult0_sub_4_q(28)) & u2_m0_wo0_mtree_madd2_0_constmult0_sub_4_q);
    u2_m0_wo0_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((32 downto 32 => u2_m0_wo0_mtree_madd2_0_constmult1_add_5_q(31)) & u2_m0_wo0_mtree_madd2_0_constmult1_add_5_q);
    u2_m0_wo0_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo0_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo0_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo0_mtree_madd2_0_sum1_a) + SIGNED(u2_m0_wo0_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u2_m0_wo0_mtree_madd2_0_sum1_q <= u2_m0_wo0_mtree_madd2_0_sum1_o(32 downto 0);


	--d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem(DUALMEM,178)
    d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_reset0 <= areset;
    d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_ia <= xIn_1;
    d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_aa <= d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdreg_q;
    d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_ab <= d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdmux_q;
    d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_dmem : altsyncram
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
        clocken1 => d_in0_m0_wi0_wo0_assign_data_q_14_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_iq,
        address_a => d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_aa,
        data_a => d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_ia
    );
        d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_q <= d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_iq(15 downto 0);

	--u1_m0_wo1_wi0_delayr0(DELAY,70)@14
    u1_m0_wo1_wi0_delayr0 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_q, xout => u1_m0_wo1_wi0_delayr0_q, ena => d_in0_m0_wi0_wo0_assign_sel_q_14_q(0), clk => clk, aclr => areset );

	--u1_m0_wo1_mtree_mult1_0_shift0(BITSHIFT,157)@14
    u1_m0_wo1_mtree_mult1_0_shift0_q_int <= u1_m0_wo1_wi0_delayr0_q & "00000000000000";
    u1_m0_wo1_mtree_mult1_0_shift0_q <= u1_m0_wo1_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u1_m0_wo0_mtree_madd2_0_constmult1_shift2(BITSHIFT,127)@11
    u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int <= u1_m0_wo0_sym_add1_q & "000";
    u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q <= u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int(19 downto 0);

	--u1_m0_wo0_wi0_delayr2(DELAY,23)@10
    u1_m0_wo0_wi0_delayr2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => u1_m0_wo0_wi0_delayr1_q, xout => u1_m0_wo0_wi0_delayr2_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u1_m0_wo0_wi0_delayr1(DELAY,22)@10
    u1_m0_wo0_wi0_delayr1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_1, xout => u1_m0_wo0_wi0_delayr1_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u1_m0_wo0_sym_add1(ADD,28)@10
    u1_m0_wo0_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => u1_m0_wo0_wi0_delayr1_q(15)) & u1_m0_wo0_wi0_delayr1_q);
    u1_m0_wo0_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u1_m0_wo0_wi0_delayr2_q(15)) & u1_m0_wo0_wi0_delayr2_q);
    u1_m0_wo0_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_sym_add1_a) + SIGNED(u1_m0_wo0_sym_add1_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_sym_add1_q <= u1_m0_wo0_sym_add1_o(16 downto 0);


	--u1_m0_wo0_mtree_madd2_0_constmult1_add_3(ADD,128)@11
    u1_m0_wo0_mtree_madd2_0_constmult1_add_3_a <= STD_LOGIC_VECTOR((20 downto 17 => u1_m0_wo0_sym_add1_q(16)) & u1_m0_wo0_sym_add1_q);
    u1_m0_wo0_mtree_madd2_0_constmult1_add_3_b <= STD_LOGIC_VECTOR((20 downto 20 => u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q(19)) & u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q);
    u1_m0_wo0_mtree_madd2_0_constmult1_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_mtree_madd2_0_constmult1_add_3_a) + SIGNED(u1_m0_wo0_mtree_madd2_0_constmult1_add_3_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_mtree_madd2_0_constmult1_add_3_q <= u1_m0_wo0_mtree_madd2_0_constmult1_add_3_o(20 downto 0);


	--u1_m0_wo0_mtree_madd2_0_constmult1_shift4(BITSHIFT,129)@12
    u1_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int <= u1_m0_wo0_mtree_madd2_0_constmult1_add_3_q & "0000000000";
    u1_m0_wo0_mtree_madd2_0_constmult1_shift4_q <= u1_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int(30 downto 0);

	--u1_m0_wo0_mtree_madd2_0_constmult1_shift0(BITSHIFT,125)@11
    u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int <= u1_m0_wo0_sym_add1_q & "0000";
    u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q <= u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int(20 downto 0);

	--u1_m0_wo0_mtree_madd2_0_constmult1_add_1(ADD,126)@11
    u1_m0_wo0_mtree_madd2_0_constmult1_add_1_a <= STD_LOGIC_VECTOR((21 downto 17 => u1_m0_wo0_sym_add1_q(16)) & u1_m0_wo0_sym_add1_q);
    u1_m0_wo0_mtree_madd2_0_constmult1_add_1_b <= STD_LOGIC_VECTOR((21 downto 21 => u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q(20)) & u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q);
    u1_m0_wo0_mtree_madd2_0_constmult1_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_mtree_madd2_0_constmult1_add_1_a) + SIGNED(u1_m0_wo0_mtree_madd2_0_constmult1_add_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_mtree_madd2_0_constmult1_add_1_q <= u1_m0_wo0_mtree_madd2_0_constmult1_add_1_o(21 downto 0);


	--u1_m0_wo0_mtree_madd2_0_constmult1_add_5(ADD,130)@12
    u1_m0_wo0_mtree_madd2_0_constmult1_add_5_a <= STD_LOGIC_VECTOR((31 downto 22 => u1_m0_wo0_mtree_madd2_0_constmult1_add_1_q(21)) & u1_m0_wo0_mtree_madd2_0_constmult1_add_1_q);
    u1_m0_wo0_mtree_madd2_0_constmult1_add_5_b <= STD_LOGIC_VECTOR((31 downto 31 => u1_m0_wo0_mtree_madd2_0_constmult1_shift4_q(30)) & u1_m0_wo0_mtree_madd2_0_constmult1_shift4_q);
    u1_m0_wo0_mtree_madd2_0_constmult1_add_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult1_add_5_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult1_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_mtree_madd2_0_constmult1_add_5_a) + SIGNED(u1_m0_wo0_mtree_madd2_0_constmult1_add_5_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_mtree_madd2_0_constmult1_add_5_q <= u1_m0_wo0_mtree_madd2_0_constmult1_add_5_o(31 downto 0);


	--u1_m0_wo0_mtree_madd2_0_constmult0_shift1(BITSHIFT,121)@11
    u1_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int <= u1_m0_wo0_sym_add0_q & "000000";
    u1_m0_wo0_mtree_madd2_0_constmult0_shift1_q <= u1_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int(22 downto 0);

	--u1_m0_wo0_wi0_delayr3(DELAY,24)@10
    u1_m0_wo0_wi0_delayr3 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => u1_m0_wo0_wi0_delayr2_q, xout => u1_m0_wo0_wi0_delayr3_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u1_m0_wo0_sym_add0(ADD,27)@10
    u1_m0_wo0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_1(15)) & xIn_1);
    u1_m0_wo0_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => u1_m0_wo0_wi0_delayr3_q(15)) & u1_m0_wo0_wi0_delayr3_q);
    u1_m0_wo0_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_sym_add0_a) + SIGNED(u1_m0_wo0_sym_add0_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_sym_add0_q <= u1_m0_wo0_sym_add0_o(16 downto 0);


	--u1_m0_wo0_mtree_madd2_0_constmult0_add_2(ADD,122)@11
    u1_m0_wo0_mtree_madd2_0_constmult0_add_2_a <= STD_LOGIC_VECTOR((23 downto 17 => u1_m0_wo0_sym_add0_q(16)) & u1_m0_wo0_sym_add0_q);
    u1_m0_wo0_mtree_madd2_0_constmult0_add_2_b <= STD_LOGIC_VECTOR((23 downto 23 => u1_m0_wo0_mtree_madd2_0_constmult0_shift1_q(22)) & u1_m0_wo0_mtree_madd2_0_constmult0_shift1_q);
    u1_m0_wo0_mtree_madd2_0_constmult0_add_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult0_add_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult0_add_2_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_mtree_madd2_0_constmult0_add_2_a) + SIGNED(u1_m0_wo0_mtree_madd2_0_constmult0_add_2_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_mtree_madd2_0_constmult0_add_2_q <= u1_m0_wo0_mtree_madd2_0_constmult0_add_2_o(23 downto 0);


	--u1_m0_wo0_mtree_madd2_0_constmult0_shift3(BITSHIFT,123)@12
    u1_m0_wo0_mtree_madd2_0_constmult0_shift3_q_int <= u1_m0_wo0_mtree_madd2_0_constmult0_add_2_q & "0000";
    u1_m0_wo0_mtree_madd2_0_constmult0_shift3_q <= u1_m0_wo0_mtree_madd2_0_constmult0_shift3_q_int(27 downto 0);

	--u1_m0_wo0_mtree_madd2_0_constmult0_sub_0(SUB,120)@11
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_a <= STD_LOGIC_VECTOR((17 downto 1 => GND_q(0)) & GND_q);
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_b <= STD_LOGIC_VECTOR((17 downto 17 => u1_m0_wo0_sym_add0_q(16)) & u1_m0_wo0_sym_add0_q);
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_a) - SIGNED(u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_q <= u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_o(17 downto 0);


	--u1_m0_wo0_mtree_madd2_0_constmult0_sub_4(SUB,124)@12
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_4_a <= STD_LOGIC_VECTOR((28 downto 18 => u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_q(17)) & u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_q);
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_4_b <= STD_LOGIC_VECTOR((28 downto 28 => u1_m0_wo0_mtree_madd2_0_constmult0_shift3_q(27)) & u1_m0_wo0_mtree_madd2_0_constmult0_shift3_q);
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult0_sub_4_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult0_sub_4_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_mtree_madd2_0_constmult0_sub_4_a) - SIGNED(u1_m0_wo0_mtree_madd2_0_constmult0_sub_4_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_4_q <= u1_m0_wo0_mtree_madd2_0_constmult0_sub_4_o(28 downto 0);


	--u1_m0_wo0_mtree_madd2_0_sum1(ADD,131)@13
    u1_m0_wo0_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((32 downto 29 => u1_m0_wo0_mtree_madd2_0_constmult0_sub_4_q(28)) & u1_m0_wo0_mtree_madd2_0_constmult0_sub_4_q);
    u1_m0_wo0_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((32 downto 32 => u1_m0_wo0_mtree_madd2_0_constmult1_add_5_q(31)) & u1_m0_wo0_mtree_madd2_0_constmult1_add_5_q);
    u1_m0_wo0_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_mtree_madd2_0_sum1_a) + SIGNED(u1_m0_wo0_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_mtree_madd2_0_sum1_q <= u1_m0_wo0_mtree_madd2_0_sum1_o(32 downto 0);


	--d_in0_m0_wi0_wo0_assign_data_q_14_replace_mem(DUALMEM,166)
    d_in0_m0_wi0_wo0_assign_data_q_14_replace_mem_reset0 <= areset;
    d_in0_m0_wi0_wo0_assign_data_q_14_replace_mem_ia <= xIn_0;
    d_in0_m0_wi0_wo0_assign_data_q_14_replace_mem_aa <= d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdreg_q;
    d_in0_m0_wi0_wo0_assign_data_q_14_replace_mem_ab <= d_in0_m0_wi0_wo0_assign_data_q_14_replace_rdmux_q;
    d_in0_m0_wi0_wo0_assign_data_q_14_replace_mem_dmem : altsyncram
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
        clocken1 => d_in0_m0_wi0_wo0_assign_data_q_14_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_in0_m0_wi0_wo0_assign_data_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_in0_m0_wi0_wo0_assign_data_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_in0_m0_wi0_wo0_assign_data_q_14_replace_mem_iq,
        address_a => d_in0_m0_wi0_wo0_assign_data_q_14_replace_mem_aa,
        data_a => d_in0_m0_wi0_wo0_assign_data_q_14_replace_mem_ia
    );
        d_in0_m0_wi0_wo0_assign_data_q_14_replace_mem_q <= d_in0_m0_wi0_wo0_assign_data_q_14_replace_mem_iq(15 downto 0);

	--u0_m0_wo1_wi0_delayr0(DELAY,62)@14
    u0_m0_wo1_wi0_delayr0 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => d_in0_m0_wi0_wo0_assign_data_q_14_replace_mem_q, xout => u0_m0_wo1_wi0_delayr0_q, ena => d_in0_m0_wi0_wo0_assign_sel_q_14_q(0), clk => clk, aclr => areset );

	--u0_m0_wo1_mtree_mult1_0_shift0(BITSHIFT,156)@14
    u0_m0_wo1_mtree_mult1_0_shift0_q_int <= u0_m0_wo1_wi0_delayr0_q & "00000000000000";
    u0_m0_wo1_mtree_mult1_0_shift0_q <= u0_m0_wo1_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u0_m0_wo0_mtree_madd2_0_constmult1_shift2(BITSHIFT,115)@11
    u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int <= u0_m0_wo0_sym_add1_q & "000";
    u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q <= u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int(19 downto 0);

	--u0_m0_wo0_wi0_delayr2(DELAY,9)@10
    u0_m0_wo0_wi0_delayr2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr1_q, xout => u0_m0_wo0_wi0_delayr2_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo0_wi0_delayr1(DELAY,8)@10
    u0_m0_wo0_wi0_delayr1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_0, xout => u0_m0_wo0_wi0_delayr1_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo0_sym_add1(ADD,14)@10
    u0_m0_wo0_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_delayr1_q(15)) & u0_m0_wo0_wi0_delayr1_q);
    u0_m0_wo0_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_delayr2_q(15)) & u0_m0_wo0_wi0_delayr2_q);
    u0_m0_wo0_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add1_a) + SIGNED(u0_m0_wo0_sym_add1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add1_q <= u0_m0_wo0_sym_add1_o(16 downto 0);


	--u0_m0_wo0_mtree_madd2_0_constmult1_add_3(ADD,116)@11
    u0_m0_wo0_mtree_madd2_0_constmult1_add_3_a <= STD_LOGIC_VECTOR((20 downto 17 => u0_m0_wo0_sym_add1_q(16)) & u0_m0_wo0_sym_add1_q);
    u0_m0_wo0_mtree_madd2_0_constmult1_add_3_b <= STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q(19)) & u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q);
    u0_m0_wo0_mtree_madd2_0_constmult1_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_madd2_0_constmult1_add_3_a) + SIGNED(u0_m0_wo0_mtree_madd2_0_constmult1_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_madd2_0_constmult1_add_3_q <= u0_m0_wo0_mtree_madd2_0_constmult1_add_3_o(20 downto 0);


	--u0_m0_wo0_mtree_madd2_0_constmult1_shift4(BITSHIFT,117)@12
    u0_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int <= u0_m0_wo0_mtree_madd2_0_constmult1_add_3_q & "0000000000";
    u0_m0_wo0_mtree_madd2_0_constmult1_shift4_q <= u0_m0_wo0_mtree_madd2_0_constmult1_shift4_q_int(30 downto 0);

	--u0_m0_wo0_mtree_madd2_0_constmult1_shift0(BITSHIFT,113)@11
    u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int <= u0_m0_wo0_sym_add1_q & "0000";
    u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q <= u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int(20 downto 0);

	--u0_m0_wo0_mtree_madd2_0_constmult1_add_1(ADD,114)@11
    u0_m0_wo0_mtree_madd2_0_constmult1_add_1_a <= STD_LOGIC_VECTOR((21 downto 17 => u0_m0_wo0_sym_add1_q(16)) & u0_m0_wo0_sym_add1_q);
    u0_m0_wo0_mtree_madd2_0_constmult1_add_1_b <= STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q(20)) & u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q);
    u0_m0_wo0_mtree_madd2_0_constmult1_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_madd2_0_constmult1_add_1_a) + SIGNED(u0_m0_wo0_mtree_madd2_0_constmult1_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_madd2_0_constmult1_add_1_q <= u0_m0_wo0_mtree_madd2_0_constmult1_add_1_o(21 downto 0);


	--u0_m0_wo0_mtree_madd2_0_constmult1_add_5(ADD,118)@12
    u0_m0_wo0_mtree_madd2_0_constmult1_add_5_a <= STD_LOGIC_VECTOR((31 downto 22 => u0_m0_wo0_mtree_madd2_0_constmult1_add_1_q(21)) & u0_m0_wo0_mtree_madd2_0_constmult1_add_1_q);
    u0_m0_wo0_mtree_madd2_0_constmult1_add_5_b <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo0_mtree_madd2_0_constmult1_shift4_q(30)) & u0_m0_wo0_mtree_madd2_0_constmult1_shift4_q);
    u0_m0_wo0_mtree_madd2_0_constmult1_add_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult1_add_5_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult1_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_madd2_0_constmult1_add_5_a) + SIGNED(u0_m0_wo0_mtree_madd2_0_constmult1_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_madd2_0_constmult1_add_5_q <= u0_m0_wo0_mtree_madd2_0_constmult1_add_5_o(31 downto 0);


	--u0_m0_wo0_mtree_madd2_0_constmult0_shift1(BITSHIFT,109)@11
    u0_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int <= u0_m0_wo0_sym_add0_q & "000000";
    u0_m0_wo0_mtree_madd2_0_constmult0_shift1_q <= u0_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int(22 downto 0);

	--u0_m0_wo0_wi0_delayr3(DELAY,10)@10
    u0_m0_wo0_wi0_delayr3 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_delayr2_q, xout => u0_m0_wo0_wi0_delayr3_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo0_sym_add0(ADD,13)@10
    u0_m0_wo0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_0(15)) & xIn_0);
    u0_m0_wo0_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_delayr3_q(15)) & u0_m0_wo0_wi0_delayr3_q);
    u0_m0_wo0_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add0_a) + SIGNED(u0_m0_wo0_sym_add0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add0_q <= u0_m0_wo0_sym_add0_o(16 downto 0);


	--u0_m0_wo0_mtree_madd2_0_constmult0_add_2(ADD,110)@11
    u0_m0_wo0_mtree_madd2_0_constmult0_add_2_a <= STD_LOGIC_VECTOR((23 downto 17 => u0_m0_wo0_sym_add0_q(16)) & u0_m0_wo0_sym_add0_q);
    u0_m0_wo0_mtree_madd2_0_constmult0_add_2_b <= STD_LOGIC_VECTOR((23 downto 23 => u0_m0_wo0_mtree_madd2_0_constmult0_shift1_q(22)) & u0_m0_wo0_mtree_madd2_0_constmult0_shift1_q);
    u0_m0_wo0_mtree_madd2_0_constmult0_add_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult0_add_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult0_add_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_madd2_0_constmult0_add_2_a) + SIGNED(u0_m0_wo0_mtree_madd2_0_constmult0_add_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_madd2_0_constmult0_add_2_q <= u0_m0_wo0_mtree_madd2_0_constmult0_add_2_o(23 downto 0);


	--u0_m0_wo0_mtree_madd2_0_constmult0_shift3(BITSHIFT,111)@12
    u0_m0_wo0_mtree_madd2_0_constmult0_shift3_q_int <= u0_m0_wo0_mtree_madd2_0_constmult0_add_2_q & "0000";
    u0_m0_wo0_mtree_madd2_0_constmult0_shift3_q <= u0_m0_wo0_mtree_madd2_0_constmult0_shift3_q_int(27 downto 0);

	--u0_m0_wo0_mtree_madd2_0_constmult0_sub_0(SUB,108)@11
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_a <= STD_LOGIC_VECTOR((17 downto 1 => GND_q(0)) & GND_q);
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_b <= STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo0_sym_add0_q(16)) & u0_m0_wo0_sym_add0_q);
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_a) - SIGNED(u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_q <= u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_o(17 downto 0);


	--u0_m0_wo0_mtree_madd2_0_constmult0_sub_4(SUB,112)@12
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_4_a <= STD_LOGIC_VECTOR((28 downto 18 => u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_q(17)) & u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_q);
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_4_b <= STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_madd2_0_constmult0_shift3_q(27)) & u0_m0_wo0_mtree_madd2_0_constmult0_shift3_q);
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult0_sub_4_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult0_sub_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_madd2_0_constmult0_sub_4_a) - SIGNED(u0_m0_wo0_mtree_madd2_0_constmult0_sub_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_4_q <= u0_m0_wo0_mtree_madd2_0_constmult0_sub_4_o(28 downto 0);


	--u0_m0_wo0_mtree_madd2_0_sum1(ADD,119)@13
    u0_m0_wo0_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((32 downto 29 => u0_m0_wo0_mtree_madd2_0_constmult0_sub_4_q(28)) & u0_m0_wo0_mtree_madd2_0_constmult0_sub_4_q);
    u0_m0_wo0_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((32 downto 32 => u0_m0_wo0_mtree_madd2_0_constmult1_add_5_q(31)) & u0_m0_wo0_mtree_madd2_0_constmult1_add_5_q);
    u0_m0_wo0_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_madd2_0_sum1_a) + SIGNED(u0_m0_wo0_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_madd2_0_sum1_q <= u0_m0_wo0_mtree_madd2_0_sum1_o(32 downto 0);


	--GND(CONSTANT,0)@0
    GND_q <= "0";

	--d_u0_m0_wo0_memread_q_13(DELAY,162)@10
    d_u0_m0_wo0_memread_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => xIn_v, xout => d_u0_m0_wo0_memread_q_13_q, clk => clk, aclr => areset );

	--u0_m0_wo0_oseq_gated_reg(REG,16)@13
    u0_m0_wo0_oseq_gated_reg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= d_u0_m0_wo0_memread_q_13_q;
        END IF;
    END PROCESS;


	--xOut(PORTOUT,107)@14
    xOut_v <= u0_m0_wo0_oseq_gated_reg_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= STD_LOGIC_VECTOR((33 downto 33 => u0_m0_wo0_mtree_madd2_0_sum1_q(32)) & u0_m0_wo0_mtree_madd2_0_sum1_q);
    xOut_1 <= STD_LOGIC_VECTOR((33 downto 30 => u0_m0_wo1_mtree_mult1_0_shift0_q(29)) & u0_m0_wo1_mtree_mult1_0_shift0_q);
    xOut_2 <= STD_LOGIC_VECTOR((33 downto 33 => u1_m0_wo0_mtree_madd2_0_sum1_q(32)) & u1_m0_wo0_mtree_madd2_0_sum1_q);
    xOut_3 <= STD_LOGIC_VECTOR((33 downto 30 => u1_m0_wo1_mtree_mult1_0_shift0_q(29)) & u1_m0_wo1_mtree_mult1_0_shift0_q);
    xOut_4 <= STD_LOGIC_VECTOR((33 downto 33 => u2_m0_wo0_mtree_madd2_0_sum1_q(32)) & u2_m0_wo0_mtree_madd2_0_sum1_q);
    xOut_5 <= STD_LOGIC_VECTOR((33 downto 30 => u2_m0_wo1_mtree_mult1_0_shift0_q(29)) & u2_m0_wo1_mtree_mult1_0_shift0_q);
    xOut_6 <= STD_LOGIC_VECTOR((33 downto 33 => u3_m0_wo0_mtree_madd2_0_sum1_q(32)) & u3_m0_wo0_mtree_madd2_0_sum1_q);
    xOut_7 <= STD_LOGIC_VECTOR((33 downto 30 => u3_m0_wo1_mtree_mult1_0_shift0_q(29)) & u3_m0_wo1_mtree_mult1_0_shift0_q);


end normal;
