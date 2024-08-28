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

-- VHDL created from DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18
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
entity DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18 is
    port (
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        xIn_0 : in std_logic_vector(15 downto 0);
        xIn_1 : in std_logic_vector(15 downto 0);
        xOut_v : out std_logic_vector(0 downto 0);
        xOut_c : out std_logic_vector(7 downto 0);
        xOut_0 : out std_logic_vector(34 downto 0);
        xOut_1 : out std_logic_vector(34 downto 0);
        xOut_2 : out std_logic_vector(34 downto 0);
        xOut_3 : out std_logic_vector(34 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal d_xIn_1_11_q : std_logic_vector (15 downto 0);
    signal d_in0_m0_wi0_wo0_assign_sel_q_11_q : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_sel_q_13_q : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_sel_q_14_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_memread_q_12_q : std_logic_vector (0 downto 0);
    type u0_m0_wo0_cma0_a_type is array(0 to 3) of SIGNED(15 downto 0);
    signal u0_m0_wo0_cma0_a : u0_m0_wo0_cma0_a_type;
    type u0_m0_wo0_cma0_b_type is array(0 to 3) of SIGNED(15 downto 0);
    signal u0_m0_wo0_cma0_b : u0_m0_wo0_cma0_b_type;
    type u0_m0_wo0_cma0_c_type is array(0 to 3) of UNSIGNED(2 downto 0);
    signal u0_m0_wo0_cma0_c : u0_m0_wo0_cma0_c_type;
    type u0_m0_wo0_cma0_l_type is array(0 to 3) of SIGNED(16 downto 0);
    signal u0_m0_wo0_cma0_l : u0_m0_wo0_cma0_l_type;
    type u0_m0_wo0_cma0_r_type is array(0 to 3) of SIGNED(14 downto 0);
    signal u0_m0_wo0_cma0_r : u0_m0_wo0_cma0_r_type;
    type u0_m0_wo0_cma0_p_type is array(0 to 3) of SIGNED(31 downto 0);
    signal u0_m0_wo0_cma0_p : u0_m0_wo0_cma0_p_type;
    type u0_m0_wo0_cma0_w_type is array(0 to 3) of SIGNED(33 downto 0);
    signal u0_m0_wo0_cma0_w : u0_m0_wo0_cma0_w_type;
    type u0_m0_wo0_cma0_x_type is array(0 to 3) of SIGNED(33 downto 0);
    signal u0_m0_wo0_cma0_x : u0_m0_wo0_cma0_x_type;
    type u0_m0_wo0_cma0_y_type is array(0 to 3) of SIGNED(33 downto 0);
    signal u0_m0_wo0_cma0_y : u0_m0_wo0_cma0_y_type;
    type u0_m0_wo0_cma0_romtype is array(0 to 7) of SIGNED(14 downto 0);
    signal u0_m0_wo0_cma0_k0 : u0_m0_wo0_cma0_romtype := (
        0 => TO_SIGNED(214,15),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k1 : u0_m0_wo0_cma0_romtype := (
        0 => TO_SIGNED(-1663,15),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k2 : u0_m0_wo0_cma0_romtype := (
        0 => TO_SIGNED(9641,15),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k3 : u0_m0_wo0_cma0_romtype := (
        others => (others => '0'));
    type u0_m0_wo0_cma0_s_type is array(0 to 3) of SIGNED(33 downto 0);
    signal u0_m0_wo0_cma0_s : u0_m0_wo0_cma0_s_type;
    signal u0_m0_wo0_cma0_s0 : std_logic_vector(33 downto 0);
    signal u0_m0_wo0_cma0_q : std_logic_vector (33 downto 0);
    signal d_u0_m0_wo0_cma0_q_14_q : std_logic_vector (33 downto 0);
    signal u0_m0_wo0_oseq_gated_reg_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_oseq_gated_reg_q_13_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_oseq_gated_reg_q_14_q : std_logic_vector (0 downto 0);
    type u1_m0_wo0_cma0_a_type is array(0 to 3) of SIGNED(15 downto 0);
    signal u1_m0_wo0_cma0_a : u1_m0_wo0_cma0_a_type;
    type u1_m0_wo0_cma0_b_type is array(0 to 3) of SIGNED(15 downto 0);
    signal u1_m0_wo0_cma0_b : u1_m0_wo0_cma0_b_type;
    type u1_m0_wo0_cma0_c_type is array(0 to 3) of UNSIGNED(2 downto 0);
    signal u1_m0_wo0_cma0_c : u1_m0_wo0_cma0_c_type;
    type u1_m0_wo0_cma0_l_type is array(0 to 3) of SIGNED(16 downto 0);
    signal u1_m0_wo0_cma0_l : u1_m0_wo0_cma0_l_type;
    type u1_m0_wo0_cma0_r_type is array(0 to 3) of SIGNED(14 downto 0);
    signal u1_m0_wo0_cma0_r : u1_m0_wo0_cma0_r_type;
    type u1_m0_wo0_cma0_p_type is array(0 to 3) of SIGNED(31 downto 0);
    signal u1_m0_wo0_cma0_p : u1_m0_wo0_cma0_p_type;
    type u1_m0_wo0_cma0_w_type is array(0 to 3) of SIGNED(33 downto 0);
    signal u1_m0_wo0_cma0_w : u1_m0_wo0_cma0_w_type;
    type u1_m0_wo0_cma0_x_type is array(0 to 3) of SIGNED(33 downto 0);
    signal u1_m0_wo0_cma0_x : u1_m0_wo0_cma0_x_type;
    type u1_m0_wo0_cma0_y_type is array(0 to 3) of SIGNED(33 downto 0);
    signal u1_m0_wo0_cma0_y : u1_m0_wo0_cma0_y_type;
    type u1_m0_wo0_cma0_romtype is array(0 to 7) of SIGNED(14 downto 0);
    signal u1_m0_wo0_cma0_k0 : u1_m0_wo0_cma0_romtype := (
        0 => TO_SIGNED(214,15),
        others => (others => '0'));
    signal u1_m0_wo0_cma0_k1 : u1_m0_wo0_cma0_romtype := (
        0 => TO_SIGNED(-1663,15),
        others => (others => '0'));
    signal u1_m0_wo0_cma0_k2 : u1_m0_wo0_cma0_romtype := (
        0 => TO_SIGNED(9641,15),
        others => (others => '0'));
    signal u1_m0_wo0_cma0_k3 : u1_m0_wo0_cma0_romtype := (
        others => (others => '0'));
    type u1_m0_wo0_cma0_s_type is array(0 to 3) of SIGNED(33 downto 0);
    signal u1_m0_wo0_cma0_s : u1_m0_wo0_cma0_s_type;
    signal u1_m0_wo0_cma0_s0 : std_logic_vector(33 downto 0);
    signal u1_m0_wo0_cma0_q : std_logic_vector (33 downto 0);
    signal u0_m1_wo0_memread_q : std_logic_vector (0 downto 0);
    signal u0_m1_wo0_oseq_gated_reg_q : std_logic_vector (0 downto 0);
    signal d_u0_m1_wo0_oseq_gated_reg_q_13_q : std_logic_vector (0 downto 0);
    signal d_u0_m1_wo0_oseq_gated_reg_q_14_q : std_logic_vector (0 downto 0);
    signal out0_m0_wo0_lineup_select_seq_0_q : std_logic_vector(0 downto 0);
    signal out0_m0_wo0_lineup_select_seq_0_eq : std_logic;
    signal out0_m0_wo0_lineup_select_delay_0_q : std_logic_vector (0 downto 0);
    signal d_out0_m0_wo0_assign_sel_q_14_q : std_logic_vector (0 downto 0);
    signal out0_m1_wo0_lineup_select_seq_0_q : std_logic_vector(0 downto 0);
    signal out0_m1_wo0_lineup_select_seq_0_eq : std_logic;
    signal out0_m1_wo0_lineup_select_delay_0_q : std_logic_vector (0 downto 0);
    signal d_out0_m1_wo0_assign_sel_q_14_q : std_logic_vector (0 downto 0);
    signal out0_wo0_data_selector_q : std_logic_vector (33 downto 0);
    signal out0_wo0_data_selector_v : std_logic_vector (0 downto 0);
    signal d_out0_wo0_data_selector_v_15_q : std_logic_vector (0 downto 0);
    signal d_out0_wo0_data_selector_q_15_q : std_logic_vector (33 downto 0);
    signal out1_m0_wo0_lineup_select_seq_0_q : std_logic_vector(0 downto 0);
    signal out1_m0_wo0_lineup_select_seq_0_eq : std_logic;
    signal out1_m1_wo0_lineup_select_seq_0_q : std_logic_vector(0 downto 0);
    signal out1_m1_wo0_lineup_select_seq_0_eq : std_logic;
    signal out1_wo0_data_selector_q : std_logic_vector (33 downto 0);
    signal out1_wo0_data_selector_v : std_logic_vector (0 downto 0);
    signal out2_wo0_data_selector_q : std_logic_vector (33 downto 0);
    signal out2_wo0_data_selector_v : std_logic_vector (0 downto 0);
    signal out3_wo0_data_selector_q : std_logic_vector (33 downto 0);
    signal out3_wo0_data_selector_v : std_logic_vector (0 downto 0);
    signal outchan_q : std_logic_vector(2 downto 0);
    signal outchan_i : unsigned(1 downto 0);
    signal d_u0_m1_wo0_mtree_mult1_0_shift0_q_14_q : std_logic_vector (29 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_reset0 : std_logic;
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdcnt_i : unsigned(0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_cmpReg_q : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_sticky_ena_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_mem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_delayr1_replace_mem_iq : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_mem_ia : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_mem_ir : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_mem_aa : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_mem_ab : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_mem_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_rdcnt_i : unsigned(2 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_rdcnt_eq : std_logic;
    signal u0_m0_wo0_wi0_delayr1_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_delayr1_mem_top_q : std_logic_vector (3 downto 0);
    signal u0_m0_wo0_wi0_delayr1_cmpReg_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_sticky_ena_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr3_replace_mem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_delayr3_replace_mem_iq : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr3_replace_mem_ia : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr3_replace_mem_ir : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr3_replace_mem_aa : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_delayr3_replace_mem_ab : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_delayr3_replace_mem_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr3_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal u0_m0_wo0_wi0_delayr3_replace_rdcnt_i : unsigned(2 downto 0);
    signal u0_m0_wo0_wi0_delayr3_replace_rdcnt_eq : std_logic;
    signal u0_m0_wo0_wi0_delayr3_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_delayr3_mem_top_q : std_logic_vector (3 downto 0);
    signal u0_m0_wo0_wi0_delayr3_cmpReg_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr3_sticky_ena_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr4_replace_mem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_delayr4_replace_mem_iq : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_wi0_delayr4_replace_mem_ia : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_wi0_delayr4_replace_mem_ir : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_wi0_delayr4_replace_mem_aa : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_delayr4_replace_mem_ab : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_delayr4_replace_mem_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_wi0_delayr4_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal u0_m0_wo0_wi0_delayr4_replace_rdcnt_i : unsigned(2 downto 0);
    signal u0_m0_wo0_wi0_delayr4_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_delayr4_mem_top_q : std_logic_vector (3 downto 0);
    signal u0_m0_wo0_wi0_delayr4_cmpReg_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr4_sticky_ena_q : std_logic_vector (0 downto 0);
    signal d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_reset0 : std_logic;
    signal d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal u1_m0_wo0_wi0_delayr1_replace_mem_reset0 : std_logic;
    signal u1_m0_wo0_wi0_delayr1_replace_mem_iq : std_logic_vector (31 downto 0);
    signal u1_m0_wo0_wi0_delayr1_replace_mem_ia : std_logic_vector (31 downto 0);
    signal u1_m0_wo0_wi0_delayr1_replace_mem_ir : std_logic_vector (31 downto 0);
    signal u1_m0_wo0_wi0_delayr1_replace_mem_aa : std_logic_vector (2 downto 0);
    signal u1_m0_wo0_wi0_delayr1_replace_mem_ab : std_logic_vector (2 downto 0);
    signal u1_m0_wo0_wi0_delayr1_replace_mem_q : std_logic_vector (31 downto 0);
    signal u1_m0_wo0_wi0_delayr1_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal u1_m0_wo0_wi0_delayr1_replace_rdcnt_i : unsigned(2 downto 0);
    signal u1_m0_wo0_wi0_delayr1_replace_rdcnt_eq : std_logic;
    signal u1_m0_wo0_wi0_delayr1_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal u1_m0_wo0_wi0_delayr1_cmpReg_q : std_logic_vector (0 downto 0);
    signal u1_m0_wo0_wi0_delayr1_sticky_ena_q : std_logic_vector (0 downto 0);
    signal u1_m0_wo0_wi0_delayr3_replace_mem_reset0 : std_logic;
    signal u1_m0_wo0_wi0_delayr3_replace_mem_iq : std_logic_vector (15 downto 0);
    signal u1_m0_wo0_wi0_delayr3_replace_mem_ia : std_logic_vector (15 downto 0);
    signal u1_m0_wo0_wi0_delayr3_replace_mem_ir : std_logic_vector (15 downto 0);
    signal u1_m0_wo0_wi0_delayr3_replace_mem_aa : std_logic_vector (2 downto 0);
    signal u1_m0_wo0_wi0_delayr3_replace_mem_ab : std_logic_vector (2 downto 0);
    signal u1_m0_wo0_wi0_delayr3_replace_mem_q : std_logic_vector (15 downto 0);
    signal u1_m0_wo0_wi0_delayr3_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal u1_m0_wo0_wi0_delayr3_replace_rdcnt_i : unsigned(2 downto 0);
    signal u1_m0_wo0_wi0_delayr3_replace_rdcnt_eq : std_logic;
    signal u1_m0_wo0_wi0_delayr3_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal u1_m0_wo0_wi0_delayr3_cmpReg_q : std_logic_vector (0 downto 0);
    signal u1_m0_wo0_wi0_delayr3_sticky_ena_q : std_logic_vector (0 downto 0);
    signal u1_m0_wo0_wi0_delayr4_replace_mem_reset0 : std_logic;
    signal u1_m0_wo0_wi0_delayr4_replace_mem_iq : std_logic_vector (31 downto 0);
    signal u1_m0_wo0_wi0_delayr4_replace_mem_ia : std_logic_vector (31 downto 0);
    signal u1_m0_wo0_wi0_delayr4_replace_mem_ir : std_logic_vector (31 downto 0);
    signal u1_m0_wo0_wi0_delayr4_replace_mem_aa : std_logic_vector (2 downto 0);
    signal u1_m0_wo0_wi0_delayr4_replace_mem_ab : std_logic_vector (2 downto 0);
    signal u1_m0_wo0_wi0_delayr4_replace_mem_q : std_logic_vector (31 downto 0);
    signal u1_m0_wo0_wi0_delayr4_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal u1_m0_wo0_wi0_delayr4_replace_rdcnt_i : unsigned(2 downto 0);
    signal u1_m0_wo0_wi0_delayr4_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal u1_m0_wo0_wi0_delayr4_cmpReg_q : std_logic_vector (0 downto 0);
    signal u1_m0_wo0_wi0_delayr4_sticky_ena_q : std_logic_vector (0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_replace_mem_reset0 : std_logic;
    signal u0_m1_wo0_wi0_delayr0_replace_mem_iq : std_logic_vector (15 downto 0);
    signal u0_m1_wo0_wi0_delayr0_replace_mem_ia : std_logic_vector (15 downto 0);
    signal u0_m1_wo0_wi0_delayr0_replace_mem_ir : std_logic_vector (15 downto 0);
    signal u0_m1_wo0_wi0_delayr0_replace_mem_aa : std_logic_vector (3 downto 0);
    signal u0_m1_wo0_wi0_delayr0_replace_mem_ab : std_logic_vector (3 downto 0);
    signal u0_m1_wo0_wi0_delayr0_replace_mem_q : std_logic_vector (15 downto 0);
    signal u0_m1_wo0_wi0_delayr0_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal u0_m1_wo0_wi0_delayr0_replace_rdcnt_i : unsigned(3 downto 0);
    signal u0_m1_wo0_wi0_delayr0_replace_rdcnt_eq : std_logic;
    signal u0_m1_wo0_wi0_delayr0_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal u0_m1_wo0_wi0_delayr0_mem_top_q : std_logic_vector (4 downto 0);
    signal u0_m1_wo0_wi0_delayr0_cmpReg_q : std_logic_vector (0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_sticky_ena_q : std_logic_vector (0 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_replace_mem_reset0 : std_logic;
    signal u0_m1_wo0_wi0_phasedelay0_replace_mem_iq : std_logic_vector (15 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_replace_mem_ia : std_logic_vector (15 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_replace_mem_ir : std_logic_vector (15 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_replace_mem_aa : std_logic_vector (1 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_replace_mem_ab : std_logic_vector (1 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_replace_mem_q : std_logic_vector (15 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_i : unsigned(1 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_eq : std_logic;
    signal u0_m1_wo0_wi0_phasedelay0_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_mem_top_q : std_logic_vector (2 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_cmpReg_q : std_logic_vector (0 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_sticky_ena_q : std_logic_vector (0 downto 0);
    signal u1_m1_wo0_wi0_delayr0_replace_mem_reset0 : std_logic;
    signal u1_m1_wo0_wi0_delayr0_replace_mem_iq : std_logic_vector (15 downto 0);
    signal u1_m1_wo0_wi0_delayr0_replace_mem_ia : std_logic_vector (15 downto 0);
    signal u1_m1_wo0_wi0_delayr0_replace_mem_ir : std_logic_vector (15 downto 0);
    signal u1_m1_wo0_wi0_delayr0_replace_mem_aa : std_logic_vector (3 downto 0);
    signal u1_m1_wo0_wi0_delayr0_replace_mem_ab : std_logic_vector (3 downto 0);
    signal u1_m1_wo0_wi0_delayr0_replace_mem_q : std_logic_vector (15 downto 0);
    signal u1_m1_wo0_wi0_delayr0_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal u1_m1_wo0_wi0_delayr0_replace_rdcnt_i : unsigned(3 downto 0);
    signal u1_m1_wo0_wi0_delayr0_replace_rdcnt_eq : std_logic;
    signal u1_m1_wo0_wi0_delayr0_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal u1_m1_wo0_wi0_delayr0_cmpReg_q : std_logic_vector (0 downto 0);
    signal u1_m1_wo0_wi0_delayr0_sticky_ena_q : std_logic_vector (0 downto 0);
    signal u1_m1_wo0_wi0_phasedelay0_replace_mem_reset0 : std_logic;
    signal u1_m1_wo0_wi0_phasedelay0_replace_mem_iq : std_logic_vector (15 downto 0);
    signal u1_m1_wo0_wi0_phasedelay0_replace_mem_ia : std_logic_vector (15 downto 0);
    signal u1_m1_wo0_wi0_phasedelay0_replace_mem_ir : std_logic_vector (15 downto 0);
    signal u1_m1_wo0_wi0_phasedelay0_replace_mem_aa : std_logic_vector (1 downto 0);
    signal u1_m1_wo0_wi0_phasedelay0_replace_mem_ab : std_logic_vector (1 downto 0);
    signal u1_m1_wo0_wi0_phasedelay0_replace_mem_q : std_logic_vector (15 downto 0);
    signal out0_m0_wo0_lineup_0_replace_mem_reset0 : std_logic;
    signal out0_m0_wo0_lineup_0_replace_mem_iq : std_logic_vector (33 downto 0);
    signal out0_m0_wo0_lineup_0_replace_mem_ia : std_logic_vector (33 downto 0);
    signal out0_m0_wo0_lineup_0_replace_mem_ir : std_logic_vector (33 downto 0);
    signal out0_m0_wo0_lineup_0_replace_mem_aa : std_logic_vector (1 downto 0);
    signal out0_m0_wo0_lineup_0_replace_mem_ab : std_logic_vector (1 downto 0);
    signal out0_m0_wo0_lineup_0_replace_mem_q : std_logic_vector (33 downto 0);
    signal out0_m1_wo0_lineup_0_replace_mem_reset0 : std_logic;
    signal out0_m1_wo0_lineup_0_replace_mem_iq : std_logic_vector (29 downto 0);
    signal out0_m1_wo0_lineup_0_replace_mem_ia : std_logic_vector (29 downto 0);
    signal out0_m1_wo0_lineup_0_replace_mem_ir : std_logic_vector (29 downto 0);
    signal out0_m1_wo0_lineup_0_replace_mem_aa : std_logic_vector (1 downto 0);
    signal out0_m1_wo0_lineup_0_replace_mem_ab : std_logic_vector (1 downto 0);
    signal out0_m1_wo0_lineup_0_replace_mem_q : std_logic_vector (29 downto 0);
    signal out2_m0_wo0_lineup_1_replace_mem_reset0 : std_logic;
    signal out2_m0_wo0_lineup_1_replace_mem_iq : std_logic_vector (33 downto 0);
    signal out2_m0_wo0_lineup_1_replace_mem_ia : std_logic_vector (33 downto 0);
    signal out2_m0_wo0_lineup_1_replace_mem_ir : std_logic_vector (33 downto 0);
    signal out2_m0_wo0_lineup_1_replace_mem_aa : std_logic_vector (1 downto 0);
    signal out2_m0_wo0_lineup_1_replace_mem_ab : std_logic_vector (1 downto 0);
    signal out2_m0_wo0_lineup_1_replace_mem_q : std_logic_vector (33 downto 0);
    signal out2_m1_wo0_lineup_1_replace_mem_reset0 : std_logic;
    signal out2_m1_wo0_lineup_1_replace_mem_iq : std_logic_vector (29 downto 0);
    signal out2_m1_wo0_lineup_1_replace_mem_ia : std_logic_vector (29 downto 0);
    signal out2_m1_wo0_lineup_1_replace_mem_ir : std_logic_vector (29 downto 0);
    signal out2_m1_wo0_lineup_1_replace_mem_aa : std_logic_vector (1 downto 0);
    signal out2_m1_wo0_lineup_1_replace_mem_ab : std_logic_vector (1 downto 0);
    signal out2_m1_wo0_lineup_1_replace_mem_q : std_logic_vector (29 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_notEnable_a : std_logic_vector(0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_notEnable_q : std_logic_vector(0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_enaAnd_a : std_logic_vector(0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_enaAnd_b : std_logic_vector(0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_enaAnd_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_delayr3_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr3_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal u0_m0_wo0_wi0_delayr4_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr4_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal u1_m0_wo0_wi0_delayr1_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal u1_m0_wo0_wi0_delayr1_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal u1_m0_wo0_wi0_delayr3_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal u1_m0_wo0_wi0_delayr3_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal u1_m0_wo0_wi0_delayr4_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal u1_m0_wo0_wi0_delayr4_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal u0_m1_wo0_wi0_delayr0_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_enaAnd_a : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_enaAnd_b : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_enaAnd_q : std_logic_vector(0 downto 0);
    signal u1_m1_wo0_wi0_delayr0_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal u1_m1_wo0_wi0_delayr0_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal u0_m0_wo0_wi0_delayr1_notEnable_a : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_notEnable_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_enaAnd_a : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_enaAnd_b : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_enaAnd_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr3_enaAnd_a : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr3_enaAnd_b : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr3_enaAnd_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr4_enaAnd_a : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr4_enaAnd_b : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr4_enaAnd_q : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_delayr1_notEnable_a : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_delayr1_notEnable_q : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_delayr1_enaAnd_a : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_delayr1_enaAnd_b : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_delayr1_enaAnd_q : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_delayr3_enaAnd_a : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_delayr3_enaAnd_b : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_delayr3_enaAnd_q : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_delayr4_enaAnd_a : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_delayr4_enaAnd_b : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_delayr4_enaAnd_q : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_notEnable_a : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_notEnable_q : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_enaAnd_a : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_enaAnd_b : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_enaAnd_q : std_logic_vector(0 downto 0);
    signal u1_m1_wo0_wi0_delayr0_notEnable_a : std_logic_vector(0 downto 0);
    signal u1_m1_wo0_wi0_delayr0_notEnable_q : std_logic_vector(0 downto 0);
    signal u1_m1_wo0_wi0_delayr0_enaAnd_a : std_logic_vector(0 downto 0);
    signal u1_m1_wo0_wi0_delayr0_enaAnd_b : std_logic_vector(0 downto 0);
    signal u1_m1_wo0_wi0_delayr0_enaAnd_q : std_logic_vector(0 downto 0);
    signal out0_m0_wo0_lineup_select_0_a : std_logic_vector(0 downto 0);
    signal out0_m0_wo0_lineup_select_0_b : std_logic_vector(0 downto 0);
    signal out0_m0_wo0_lineup_select_0_q : std_logic_vector(0 downto 0);
    signal out1_m0_wo0_lineup_select_0_a : std_logic_vector(0 downto 0);
    signal out1_m0_wo0_lineup_select_0_b : std_logic_vector(0 downto 0);
    signal out1_m0_wo0_lineup_select_0_q : std_logic_vector(0 downto 0);
    signal out0_m1_wo0_lineup_select_0_a : std_logic_vector(0 downto 0);
    signal out0_m1_wo0_lineup_select_0_b : std_logic_vector(0 downto 0);
    signal out0_m1_wo0_lineup_select_0_q : std_logic_vector(0 downto 0);
    signal out1_m1_wo0_lineup_select_0_a : std_logic_vector(0 downto 0);
    signal out1_m1_wo0_lineup_select_0_b : std_logic_vector(0 downto 0);
    signal out1_m1_wo0_lineup_select_0_q : std_logic_vector(0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_nor_a : std_logic_vector(0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_nor_b : std_logic_vector(0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_nor_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_split1_in : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_wi0_split1_b : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_split1_c : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr1_cmp_a : std_logic_vector(3 downto 0);
    signal u0_m0_wo0_wi0_delayr1_cmp_b : std_logic_vector(3 downto 0);
    signal u0_m0_wo0_wi0_delayr1_cmp_q : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_delayr1_cmp_a : std_logic_vector(3 downto 0);
    signal u1_m0_wo0_wi0_delayr1_cmp_b : std_logic_vector(3 downto 0);
    signal u1_m0_wo0_wi0_delayr1_cmp_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_nor_a : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_nor_b : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_nor_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr3_cmp_a : std_logic_vector(3 downto 0);
    signal u0_m0_wo0_wi0_delayr3_cmp_b : std_logic_vector(3 downto 0);
    signal u0_m0_wo0_wi0_delayr3_cmp_q : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_delayr3_cmp_a : std_logic_vector(3 downto 0);
    signal u1_m0_wo0_wi0_delayr3_cmp_b : std_logic_vector(3 downto 0);
    signal u1_m0_wo0_wi0_delayr3_cmp_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr3_nor_a : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr3_nor_b : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr3_nor_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_split4_in : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_wi0_split4_b : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_split4_c : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_delayr4_cmp_a : std_logic_vector(3 downto 0);
    signal u0_m0_wo0_wi0_delayr4_cmp_b : std_logic_vector(3 downto 0);
    signal u0_m0_wo0_wi0_delayr4_cmp_q : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_delayr4_cmp_a : std_logic_vector(3 downto 0);
    signal u1_m0_wo0_wi0_delayr4_cmp_b : std_logic_vector(3 downto 0);
    signal u1_m0_wo0_wi0_delayr4_cmp_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr4_nor_a : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr4_nor_b : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr4_nor_q : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_split1_in : std_logic_vector (31 downto 0);
    signal u1_m0_wo0_wi0_split1_b : std_logic_vector (15 downto 0);
    signal u1_m0_wo0_wi0_split1_c : std_logic_vector (15 downto 0);
    signal u1_m0_wo0_wi0_delayr1_nor_a : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_delayr1_nor_b : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_delayr1_nor_q : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_delayr3_nor_a : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_delayr3_nor_b : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_delayr3_nor_q : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_split4_in : std_logic_vector (31 downto 0);
    signal u1_m0_wo0_wi0_split4_b : std_logic_vector (15 downto 0);
    signal u1_m0_wo0_wi0_split4_c : std_logic_vector (15 downto 0);
    signal u1_m0_wo0_wi0_delayr4_nor_a : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_delayr4_nor_b : std_logic_vector(0 downto 0);
    signal u1_m0_wo0_wi0_delayr4_nor_q : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_cmp_a : std_logic_vector(4 downto 0);
    signal u0_m1_wo0_wi0_delayr0_cmp_b : std_logic_vector(4 downto 0);
    signal u0_m1_wo0_wi0_delayr0_cmp_q : std_logic_vector(0 downto 0);
    signal u1_m1_wo0_wi0_delayr0_cmp_a : std_logic_vector(4 downto 0);
    signal u1_m1_wo0_wi0_delayr0_cmp_b : std_logic_vector(4 downto 0);
    signal u1_m1_wo0_wi0_delayr0_cmp_q : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_nor_a : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_nor_b : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_nor_q : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u0_m1_wo0_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_cmp_a : std_logic_vector(2 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_cmp_b : std_logic_vector(2 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_cmp_q : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_nor_a : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_nor_b : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_nor_q : std_logic_vector(0 downto 0);
    signal u1_m1_wo0_wi0_delayr0_nor_a : std_logic_vector(0 downto 0);
    signal u1_m1_wo0_wi0_delayr0_nor_b : std_logic_vector(0 downto 0);
    signal u1_m1_wo0_wi0_delayr0_nor_q : std_logic_vector(0 downto 0);
    signal u1_m1_wo0_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u1_m1_wo0_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_wi0_join1_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_wi0_join4_q : std_logic_vector (31 downto 0);
    signal u1_m0_wo0_wi0_join1_q : std_logic_vector (31 downto 0);
    signal u1_m0_wo0_wi0_join4_q : std_logic_vector (31 downto 0);
begin


	--d_in0_m0_wi0_wo0_assign_data_q_13_notEnable(LOGICAL,131)
    d_in0_m0_wi0_wo0_assign_data_q_13_notEnable_a <= VCC_q;
    d_in0_m0_wi0_wo0_assign_data_q_13_notEnable_q <= not d_in0_m0_wi0_wo0_assign_data_q_13_notEnable_a;

	--u0_m1_wo0_wi0_phasedelay0_nor(LOGICAL,238)
    u0_m1_wo0_wi0_phasedelay0_nor_a <= d_in0_m0_wi0_wo0_assign_data_q_13_notEnable_q;
    u0_m1_wo0_wi0_phasedelay0_nor_b <= u0_m1_wo0_wi0_phasedelay0_sticky_ena_q;
    u0_m1_wo0_wi0_phasedelay0_nor_q <= not (u0_m1_wo0_wi0_phasedelay0_nor_a or u0_m1_wo0_wi0_phasedelay0_nor_b);

	--u0_m1_wo0_wi0_phasedelay0_mem_top(CONSTANT,234)
    u0_m1_wo0_wi0_phasedelay0_mem_top_q <= "010";

	--u0_m1_wo0_wi0_phasedelay0_cmp(LOGICAL,235)
    u0_m1_wo0_wi0_phasedelay0_cmp_a <= u0_m1_wo0_wi0_phasedelay0_mem_top_q;
    u0_m1_wo0_wi0_phasedelay0_cmp_b <= STD_LOGIC_VECTOR("0" & u0_m1_wo0_wi0_phasedelay0_replace_rdmux_q);
    u0_m1_wo0_wi0_phasedelay0_cmp_q <= "1" when u0_m1_wo0_wi0_phasedelay0_cmp_a = u0_m1_wo0_wi0_phasedelay0_cmp_b else "0";

	--u0_m1_wo0_wi0_phasedelay0_cmpReg(REG,236)
    u0_m1_wo0_wi0_phasedelay0_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_wi0_phasedelay0_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m1_wo0_wi0_phasedelay0_cmpReg_q <= u0_m1_wo0_wi0_phasedelay0_cmp_q;
        END IF;
    END PROCESS;


	--u0_m1_wo0_wi0_phasedelay0_sticky_ena(REG,239)
    u0_m1_wo0_wi0_phasedelay0_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_wi0_phasedelay0_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u0_m1_wo0_wi0_phasedelay0_nor_q = "1") THEN
                u0_m1_wo0_wi0_phasedelay0_sticky_ena_q <= u0_m1_wo0_wi0_phasedelay0_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m1_wo0_wi0_phasedelay0_enaAnd(LOGICAL,240)
    u0_m1_wo0_wi0_phasedelay0_enaAnd_a <= u0_m1_wo0_wi0_phasedelay0_sticky_ena_q;
    u0_m1_wo0_wi0_phasedelay0_enaAnd_b <= VCC_q;
    u0_m1_wo0_wi0_phasedelay0_enaAnd_q <= u0_m1_wo0_wi0_phasedelay0_enaAnd_a and u0_m1_wo0_wi0_phasedelay0_enaAnd_b;

	--u1_m1_wo0_wi0_delayr0_notEnable(LOGICAL,249)
    u1_m1_wo0_wi0_delayr0_notEnable_a <= d_in0_m0_wi0_wo0_assign_sel_q_14_q;
    u1_m1_wo0_wi0_delayr0_notEnable_q <= not u1_m1_wo0_wi0_delayr0_notEnable_a;

	--u1_m1_wo0_wi0_delayr0_nor(LOGICAL,250)
    u1_m1_wo0_wi0_delayr0_nor_a <= u1_m1_wo0_wi0_delayr0_notEnable_q;
    u1_m1_wo0_wi0_delayr0_nor_b <= u1_m1_wo0_wi0_delayr0_sticky_ena_q;
    u1_m1_wo0_wi0_delayr0_nor_q <= not (u1_m1_wo0_wi0_delayr0_nor_a or u1_m1_wo0_wi0_delayr0_nor_b);

	--u0_m1_wo0_wi0_delayr0_mem_top(CONSTANT,222)
    u0_m1_wo0_wi0_delayr0_mem_top_q <= "01110";

	--u1_m1_wo0_wi0_delayr0_cmp(LOGICAL,247)
    u1_m1_wo0_wi0_delayr0_cmp_a <= u0_m1_wo0_wi0_delayr0_mem_top_q;
    u1_m1_wo0_wi0_delayr0_cmp_b <= STD_LOGIC_VECTOR("0" & u1_m1_wo0_wi0_delayr0_replace_rdmux_q);
    u1_m1_wo0_wi0_delayr0_cmp_q <= "1" when u1_m1_wo0_wi0_delayr0_cmp_a = u1_m1_wo0_wi0_delayr0_cmp_b else "0";

	--u1_m1_wo0_wi0_delayr0_cmpReg(REG,248)
    u1_m1_wo0_wi0_delayr0_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m1_wo0_wi0_delayr0_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_sel_q_14_q = "1") THEN
                u1_m1_wo0_wi0_delayr0_cmpReg_q <= u1_m1_wo0_wi0_delayr0_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--u1_m1_wo0_wi0_delayr0_sticky_ena(REG,251)
    u1_m1_wo0_wi0_delayr0_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m1_wo0_wi0_delayr0_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u1_m1_wo0_wi0_delayr0_nor_q = "1") THEN
                u1_m1_wo0_wi0_delayr0_sticky_ena_q <= u1_m1_wo0_wi0_delayr0_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--u1_m1_wo0_wi0_delayr0_enaAnd(LOGICAL,252)
    u1_m1_wo0_wi0_delayr0_enaAnd_a <= u1_m1_wo0_wi0_delayr0_sticky_ena_q;
    u1_m1_wo0_wi0_delayr0_enaAnd_b <= d_in0_m0_wi0_wo0_assign_sel_q_14_q;
    u1_m1_wo0_wi0_delayr0_enaAnd_q <= u1_m1_wo0_wi0_delayr0_enaAnd_a and u1_m1_wo0_wi0_delayr0_enaAnd_b;

	--d_in0_m0_wi0_wo0_assign_data_q_13_nor(LOGICAL,132)
    d_in0_m0_wi0_wo0_assign_data_q_13_nor_a <= d_in0_m0_wi0_wo0_assign_data_q_13_notEnable_q;
    d_in0_m0_wi0_wo0_assign_data_q_13_nor_b <= d_in0_m0_wi0_wo0_assign_data_q_13_sticky_ena_q;
    d_in0_m0_wi0_wo0_assign_data_q_13_nor_q <= not (d_in0_m0_wi0_wo0_assign_data_q_13_nor_a or d_in0_m0_wi0_wo0_assign_data_q_13_nor_b);

	--d_in0_m0_wi0_wo0_assign_data_q_13_cmpReg(REG,130)
    d_in0_m0_wi0_wo0_assign_data_q_13_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_in0_m0_wi0_wo0_assign_data_q_13_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_in0_m0_wi0_wo0_assign_data_q_13_cmpReg_q <= VCC_q;
        END IF;
    END PROCESS;


	--d_in0_m0_wi0_wo0_assign_data_q_13_sticky_ena(REG,133)
    d_in0_m0_wi0_wo0_assign_data_q_13_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_in0_m0_wi0_wo0_assign_data_q_13_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_data_q_13_nor_q = "1") THEN
                d_in0_m0_wi0_wo0_assign_data_q_13_sticky_ena_q <= d_in0_m0_wi0_wo0_assign_data_q_13_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--d_in0_m0_wi0_wo0_assign_data_q_13_enaAnd(LOGICAL,134)
    d_in0_m0_wi0_wo0_assign_data_q_13_enaAnd_a <= d_in0_m0_wi0_wo0_assign_data_q_13_sticky_ena_q;
    d_in0_m0_wi0_wo0_assign_data_q_13_enaAnd_b <= VCC_q;
    d_in0_m0_wi0_wo0_assign_data_q_13_enaAnd_q <= d_in0_m0_wi0_wo0_assign_data_q_13_enaAnd_a and d_in0_m0_wi0_wo0_assign_data_q_13_enaAnd_b;

	--xIn(PORTIN,2)@10

	--d_xIn_1_11(DELAY,107)@10
    d_xIn_1_11 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_1, xout => d_xIn_1_11_q, clk => clk, aclr => areset );

	--d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdcnt(COUNTER,126)
    -- every=1, low=0, high=1, step=1, init=1
    d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
                d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdcnt_i <= d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdcnt_i + 1;
        END IF;
    END PROCESS;
    d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdcnt_i,1));


	--d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdreg(REG,127)
    d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdreg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdreg_q <= d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux(MUX,128)
    d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux_s <= VCC_q;
    d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux: PROCESS (d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux_s, d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdreg_q, d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdcnt_q)
    BEGIN
            CASE d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux_s IS
                  WHEN "0" => d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux_q <= d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdreg_q;
                  WHEN "1" => d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux_q <= d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdcnt_q;
                  WHEN OTHERS => d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem(DUALMEM,171)
    d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_reset0 <= areset;
    d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_ia <= d_xIn_1_11_q;
    d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_aa <= d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdreg_q;
    d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_ab <= d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux_q;
    d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_dmem : altsyncram
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
        clocken1 => d_in0_m0_wi0_wo0_assign_data_q_13_enaAnd_q(0),
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

	--u1_m1_wo0_wi0_delayr0_replace_rdcnt(COUNTER,242)
    -- every=1, low=0, high=14, step=1, init=1
    u1_m1_wo0_wi0_delayr0_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m1_wo0_wi0_delayr0_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            u1_m1_wo0_wi0_delayr0_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_sel_q_14_q = "1") THEN
                    IF u1_m1_wo0_wi0_delayr0_replace_rdcnt_i = 13 THEN
                      u1_m1_wo0_wi0_delayr0_replace_rdcnt_eq <= '1';
                    ELSE
                      u1_m1_wo0_wi0_delayr0_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (u1_m1_wo0_wi0_delayr0_replace_rdcnt_eq = '1') THEN
                        u1_m1_wo0_wi0_delayr0_replace_rdcnt_i <= u1_m1_wo0_wi0_delayr0_replace_rdcnt_i - 14;
                    ELSE
                        u1_m1_wo0_wi0_delayr0_replace_rdcnt_i <= u1_m1_wo0_wi0_delayr0_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    u1_m1_wo0_wi0_delayr0_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(u1_m1_wo0_wi0_delayr0_replace_rdcnt_i,4));


	--u1_m1_wo0_wi0_delayr0_replace_rdreg(REG,243)
    u1_m1_wo0_wi0_delayr0_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m1_wo0_wi0_delayr0_replace_rdreg_q <= "0000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_sel_q_14_q = "1") THEN
                u1_m1_wo0_wi0_delayr0_replace_rdreg_q <= u1_m1_wo0_wi0_delayr0_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--d_in0_m0_wi0_wo0_assign_sel_q_11(DELAY,109)@10
    d_in0_m0_wi0_wo0_assign_sel_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => xIn_v, xout => d_in0_m0_wi0_wo0_assign_sel_q_11_q, clk => clk, aclr => areset );

	--d_in0_m0_wi0_wo0_assign_sel_q_13(DELAY,110)@11
    d_in0_m0_wi0_wo0_assign_sel_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => d_in0_m0_wi0_wo0_assign_sel_q_11_q, xout => d_in0_m0_wi0_wo0_assign_sel_q_13_q, clk => clk, aclr => areset );

	--d_in0_m0_wi0_wo0_assign_sel_q_14(DELAY,111)@13
    d_in0_m0_wi0_wo0_assign_sel_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => d_in0_m0_wi0_wo0_assign_sel_q_13_q, xout => d_in0_m0_wi0_wo0_assign_sel_q_14_q, clk => clk, aclr => areset );

	--u1_m1_wo0_wi0_delayr0_replace_rdmux(MUX,244)
    u1_m1_wo0_wi0_delayr0_replace_rdmux_s <= d_in0_m0_wi0_wo0_assign_sel_q_14_q;
    u1_m1_wo0_wi0_delayr0_replace_rdmux: PROCESS (u1_m1_wo0_wi0_delayr0_replace_rdmux_s, u1_m1_wo0_wi0_delayr0_replace_rdreg_q, u1_m1_wo0_wi0_delayr0_replace_rdcnt_q)
    BEGIN
            CASE u1_m1_wo0_wi0_delayr0_replace_rdmux_s IS
                  WHEN "0" => u1_m1_wo0_wi0_delayr0_replace_rdmux_q <= u1_m1_wo0_wi0_delayr0_replace_rdreg_q;
                  WHEN "1" => u1_m1_wo0_wi0_delayr0_replace_rdmux_q <= u1_m1_wo0_wi0_delayr0_replace_rdcnt_q;
                  WHEN OTHERS => u1_m1_wo0_wi0_delayr0_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--u1_m1_wo0_wi0_delayr0_replace_mem(DUALMEM,241)
    u1_m1_wo0_wi0_delayr0_replace_mem_reset0 <= areset;
    u1_m1_wo0_wi0_delayr0_replace_mem_ia <= d_in1_m0_wi0_wo0_assign_data_q_14_replace_mem_q;
    u1_m1_wo0_wi0_delayr0_replace_mem_aa <= u1_m1_wo0_wi0_delayr0_replace_rdreg_q;
    u1_m1_wo0_wi0_delayr0_replace_mem_ab <= u1_m1_wo0_wi0_delayr0_replace_rdmux_q;
    u1_m1_wo0_wi0_delayr0_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 4,
        numwords_a => 15,
        width_b => 16,
        widthad_b => 4,
        numwords_b => 15,
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
        clocken1 => u1_m1_wo0_wi0_delayr0_enaAnd_q(0),
        clocken0 => '1',
        wren_a => d_in0_m0_wi0_wo0_assign_sel_q_14_q(0),
        clock0 => clk,
        aclr1 => u1_m1_wo0_wi0_delayr0_replace_mem_reset0,
        clock1 => clk,
        address_b => u1_m1_wo0_wi0_delayr0_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => u1_m1_wo0_wi0_delayr0_replace_mem_iq,
        address_a => u1_m1_wo0_wi0_delayr0_replace_mem_aa,
        data_a => u1_m1_wo0_wi0_delayr0_replace_mem_ia
    );
        u1_m1_wo0_wi0_delayr0_replace_mem_q <= u1_m1_wo0_wi0_delayr0_replace_mem_iq(15 downto 0);

	--u0_m1_wo0_wi0_phasedelay0_replace_rdcnt(COUNTER,230)
    -- every=1, low=0, high=2, step=1, init=1
    u0_m1_wo0_wi0_phasedelay0_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_i <= TO_UNSIGNED(1,2);
            u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_i = 1 THEN
                  u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_eq <= '1';
                ELSE
                  u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_eq <= '0';
                END IF;
                IF (u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_eq = '1') THEN
                    u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_i <= u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_i - 2;
                ELSE
                    u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_i <= u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_i,2));


	--u0_m1_wo0_wi0_phasedelay0_replace_rdreg(REG,231)
    u0_m1_wo0_wi0_phasedelay0_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_wi0_phasedelay0_replace_rdreg_q <= "00";
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m1_wo0_wi0_phasedelay0_replace_rdreg_q <= u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--u0_m1_wo0_wi0_phasedelay0_replace_rdmux(MUX,232)
    u0_m1_wo0_wi0_phasedelay0_replace_rdmux_s <= VCC_q;
    u0_m1_wo0_wi0_phasedelay0_replace_rdmux: PROCESS (u0_m1_wo0_wi0_phasedelay0_replace_rdmux_s, u0_m1_wo0_wi0_phasedelay0_replace_rdreg_q, u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_q)
    BEGIN
            CASE u0_m1_wo0_wi0_phasedelay0_replace_rdmux_s IS
                  WHEN "0" => u0_m1_wo0_wi0_phasedelay0_replace_rdmux_q <= u0_m1_wo0_wi0_phasedelay0_replace_rdreg_q;
                  WHEN "1" => u0_m1_wo0_wi0_phasedelay0_replace_rdmux_q <= u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_q;
                  WHEN OTHERS => u0_m1_wo0_wi0_phasedelay0_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--u1_m1_wo0_wi0_phasedelay0_replace_mem(DUALMEM,253)
    u1_m1_wo0_wi0_phasedelay0_replace_mem_reset0 <= areset;
    u1_m1_wo0_wi0_phasedelay0_replace_mem_ia <= u1_m1_wo0_wi0_delayr0_replace_mem_q;
    u1_m1_wo0_wi0_phasedelay0_replace_mem_aa <= u0_m1_wo0_wi0_phasedelay0_replace_rdreg_q;
    u1_m1_wo0_wi0_phasedelay0_replace_mem_ab <= u0_m1_wo0_wi0_phasedelay0_replace_rdmux_q;
    u1_m1_wo0_wi0_phasedelay0_replace_mem_dmem : altsyncram
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
        clocken1 => u0_m1_wo0_wi0_phasedelay0_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => u1_m1_wo0_wi0_phasedelay0_replace_mem_reset0,
        clock1 => clk,
        address_b => u1_m1_wo0_wi0_phasedelay0_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => u1_m1_wo0_wi0_phasedelay0_replace_mem_iq,
        address_a => u1_m1_wo0_wi0_phasedelay0_replace_mem_aa,
        data_a => u1_m1_wo0_wi0_phasedelay0_replace_mem_ia
    );
        u1_m1_wo0_wi0_phasedelay0_replace_mem_q <= u1_m1_wo0_wi0_phasedelay0_replace_mem_iq(15 downto 0);

	--u1_m1_wo0_mtree_mult1_0_shift0(BITSHIFT,106)@14
    u1_m1_wo0_mtree_mult1_0_shift0_q_int <= u1_m1_wo0_wi0_phasedelay0_replace_mem_q & "00000000000000";
    u1_m1_wo0_mtree_mult1_0_shift0_q <= u1_m1_wo0_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u0_m1_wo0_memread(DELAY,45)@11
    u0_m1_wo0_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => d_in0_m0_wi0_wo0_assign_sel_q_11_q, xout => u0_m1_wo0_memread_q, clk => clk, aclr => areset );

	--u0_m1_wo0_oseq_gated_reg(REG,50)@11
    u0_m1_wo0_oseq_gated_reg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_oseq_gated_reg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m1_wo0_oseq_gated_reg_q <= u0_m1_wo0_memread_q;
        END IF;
    END PROCESS;


	--d_u0_m1_wo0_oseq_gated_reg_q_13(DELAY,118)@12
    d_u0_m1_wo0_oseq_gated_reg_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => u0_m1_wo0_oseq_gated_reg_q, xout => d_u0_m1_wo0_oseq_gated_reg_q_13_q, clk => clk, aclr => areset );

	--d_u0_m1_wo0_oseq_gated_reg_q_14(DELAY,119)@13
    d_u0_m1_wo0_oseq_gated_reg_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => d_u0_m1_wo0_oseq_gated_reg_q_13_q, xout => d_u0_m1_wo0_oseq_gated_reg_q_14_q, clk => clk, aclr => areset );

	--out1_m1_wo0_lineup_select_seq_0(SEQUENCE,76)@13
    out1_m1_wo0_lineup_select_seq_0: PROCESS (clk, areset)
        variable out1_m1_wo0_lineup_select_seq_0_c : signed (5 downto 0);
    BEGIN
        IF (areset = '1') THEN
            out1_m1_wo0_lineup_select_seq_0_c := "000100";
            out1_m1_wo0_lineup_select_seq_0_q <= "0";
            out1_m1_wo0_lineup_select_seq_0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m1_wo0_oseq_gated_reg_q_13_q = "1") THEN
                IF (out1_m1_wo0_lineup_select_seq_0_c = "111101") THEN
                    out1_m1_wo0_lineup_select_seq_0_eq <= '1';
                ELSE
                    out1_m1_wo0_lineup_select_seq_0_eq <= '0';
                END IF;
                IF (out1_m1_wo0_lineup_select_seq_0_eq = '1') THEN
                    out1_m1_wo0_lineup_select_seq_0_c := out1_m1_wo0_lineup_select_seq_0_c + 7;
                ELSE
                    out1_m1_wo0_lineup_select_seq_0_c := out1_m1_wo0_lineup_select_seq_0_c - 1;
                END IF;
                out1_m1_wo0_lineup_select_seq_0_q <= std_logic_vector(out1_m1_wo0_lineup_select_seq_0_c(5 DOWNTO 5));
            END IF;
        END IF;
    END PROCESS;


	--out1_m1_wo0_lineup_select_0(LOGICAL,77)@14
    out1_m1_wo0_lineup_select_0_a <= out1_m1_wo0_lineup_select_seq_0_q;
    out1_m1_wo0_lineup_select_0_b <= d_u0_m1_wo0_oseq_gated_reg_q_14_q;
    out1_m1_wo0_lineup_select_0_q <= out1_m1_wo0_lineup_select_0_a and out1_m1_wo0_lineup_select_0_b;

	--u1_m0_wo0_wi0_delayr1_notEnable(LOGICAL,189)
    u1_m0_wo0_wi0_delayr1_notEnable_a <= d_in0_m0_wi0_wo0_assign_sel_q_11_q;
    u1_m0_wo0_wi0_delayr1_notEnable_q <= not u1_m0_wo0_wi0_delayr1_notEnable_a;

	--u1_m0_wo0_wi0_delayr3_nor(LOGICAL,202)
    u1_m0_wo0_wi0_delayr3_nor_a <= u1_m0_wo0_wi0_delayr1_notEnable_q;
    u1_m0_wo0_wi0_delayr3_nor_b <= u1_m0_wo0_wi0_delayr3_sticky_ena_q;
    u1_m0_wo0_wi0_delayr3_nor_q <= not (u1_m0_wo0_wi0_delayr3_nor_a or u1_m0_wo0_wi0_delayr3_nor_b);

	--u0_m0_wo0_wi0_delayr3_mem_top(CONSTANT,152)
    u0_m0_wo0_wi0_delayr3_mem_top_q <= "0110";

	--u1_m0_wo0_wi0_delayr3_cmp(LOGICAL,199)
    u1_m0_wo0_wi0_delayr3_cmp_a <= u0_m0_wo0_wi0_delayr3_mem_top_q;
    u1_m0_wo0_wi0_delayr3_cmp_b <= STD_LOGIC_VECTOR("0" & u1_m0_wo0_wi0_delayr3_replace_rdmux_q);
    u1_m0_wo0_wi0_delayr3_cmp_q <= "1" when u1_m0_wo0_wi0_delayr3_cmp_a = u1_m0_wo0_wi0_delayr3_cmp_b else "0";

	--u1_m0_wo0_wi0_delayr3_cmpReg(REG,200)
    u1_m0_wo0_wi0_delayr3_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_wi0_delayr3_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_sel_q_11_q = "1") THEN
                u1_m0_wo0_wi0_delayr3_cmpReg_q <= u1_m0_wo0_wi0_delayr3_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--u1_m0_wo0_wi0_delayr3_sticky_ena(REG,203)
    u1_m0_wo0_wi0_delayr3_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_wi0_delayr3_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u1_m0_wo0_wi0_delayr3_nor_q = "1") THEN
                u1_m0_wo0_wi0_delayr3_sticky_ena_q <= u1_m0_wo0_wi0_delayr3_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--u1_m0_wo0_wi0_delayr3_enaAnd(LOGICAL,204)
    u1_m0_wo0_wi0_delayr3_enaAnd_a <= u1_m0_wo0_wi0_delayr3_sticky_ena_q;
    u1_m0_wo0_wi0_delayr3_enaAnd_b <= d_in0_m0_wi0_wo0_assign_sel_q_11_q;
    u1_m0_wo0_wi0_delayr3_enaAnd_q <= u1_m0_wo0_wi0_delayr3_enaAnd_a and u1_m0_wo0_wi0_delayr3_enaAnd_b;

	--u1_m0_wo0_wi0_delayr3_replace_rdcnt(COUNTER,194)
    -- every=1, low=0, high=6, step=1, init=1
    u1_m0_wo0_wi0_delayr3_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_wi0_delayr3_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            u1_m0_wo0_wi0_delayr3_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_sel_q_11_q = "1") THEN
                    IF u1_m0_wo0_wi0_delayr3_replace_rdcnt_i = 5 THEN
                      u1_m0_wo0_wi0_delayr3_replace_rdcnt_eq <= '1';
                    ELSE
                      u1_m0_wo0_wi0_delayr3_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (u1_m0_wo0_wi0_delayr3_replace_rdcnt_eq = '1') THEN
                        u1_m0_wo0_wi0_delayr3_replace_rdcnt_i <= u1_m0_wo0_wi0_delayr3_replace_rdcnt_i - 6;
                    ELSE
                        u1_m0_wo0_wi0_delayr3_replace_rdcnt_i <= u1_m0_wo0_wi0_delayr3_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    u1_m0_wo0_wi0_delayr3_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(u1_m0_wo0_wi0_delayr3_replace_rdcnt_i,3));


	--u1_m0_wo0_wi0_delayr3_replace_rdreg(REG,195)
    u1_m0_wo0_wi0_delayr3_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_wi0_delayr3_replace_rdreg_q <= "000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_sel_q_11_q = "1") THEN
                u1_m0_wo0_wi0_delayr3_replace_rdreg_q <= u1_m0_wo0_wi0_delayr3_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--u1_m0_wo0_wi0_delayr3_replace_rdmux(MUX,196)
    u1_m0_wo0_wi0_delayr3_replace_rdmux_s <= d_in0_m0_wi0_wo0_assign_sel_q_11_q;
    u1_m0_wo0_wi0_delayr3_replace_rdmux: PROCESS (u1_m0_wo0_wi0_delayr3_replace_rdmux_s, u1_m0_wo0_wi0_delayr3_replace_rdreg_q, u1_m0_wo0_wi0_delayr3_replace_rdcnt_q)
    BEGIN
            CASE u1_m0_wo0_wi0_delayr3_replace_rdmux_s IS
                  WHEN "0" => u1_m0_wo0_wi0_delayr3_replace_rdmux_q <= u1_m0_wo0_wi0_delayr3_replace_rdreg_q;
                  WHEN "1" => u1_m0_wo0_wi0_delayr3_replace_rdmux_q <= u1_m0_wo0_wi0_delayr3_replace_rdcnt_q;
                  WHEN OTHERS => u1_m0_wo0_wi0_delayr3_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--u1_m0_wo0_wi0_delayr3_replace_mem(DUALMEM,193)
    u1_m0_wo0_wi0_delayr3_replace_mem_reset0 <= areset;
    u1_m0_wo0_wi0_delayr3_replace_mem_ia <= u1_m0_wo0_wi0_split1_c;
    u1_m0_wo0_wi0_delayr3_replace_mem_aa <= u1_m0_wo0_wi0_delayr3_replace_rdreg_q;
    u1_m0_wo0_wi0_delayr3_replace_mem_ab <= u1_m0_wo0_wi0_delayr3_replace_rdmux_q;
    u1_m0_wo0_wi0_delayr3_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 16,
        widthad_b => 3,
        numwords_b => 7,
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
        clocken1 => u1_m0_wo0_wi0_delayr3_enaAnd_q(0),
        clocken0 => '1',
        wren_a => d_in0_m0_wi0_wo0_assign_sel_q_11_q(0),
        clock0 => clk,
        aclr1 => u1_m0_wo0_wi0_delayr3_replace_mem_reset0,
        clock1 => clk,
        address_b => u1_m0_wo0_wi0_delayr3_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => u1_m0_wo0_wi0_delayr3_replace_mem_iq,
        address_a => u1_m0_wo0_wi0_delayr3_replace_mem_aa,
        data_a => u1_m0_wo0_wi0_delayr3_replace_mem_ia
    );
        u1_m0_wo0_wi0_delayr3_replace_mem_q <= u1_m0_wo0_wi0_delayr3_replace_mem_iq(15 downto 0);

	--u1_m0_wo0_wi0_delayr1_nor(LOGICAL,190)
    u1_m0_wo0_wi0_delayr1_nor_a <= u1_m0_wo0_wi0_delayr1_notEnable_q;
    u1_m0_wo0_wi0_delayr1_nor_b <= u1_m0_wo0_wi0_delayr1_sticky_ena_q;
    u1_m0_wo0_wi0_delayr1_nor_q <= not (u1_m0_wo0_wi0_delayr1_nor_a or u1_m0_wo0_wi0_delayr1_nor_b);

	--u0_m0_wo0_wi0_delayr1_mem_top(CONSTANT,140)
    u0_m0_wo0_wi0_delayr1_mem_top_q <= "0101";

	--u1_m0_wo0_wi0_delayr1_cmp(LOGICAL,187)
    u1_m0_wo0_wi0_delayr1_cmp_a <= u0_m0_wo0_wi0_delayr1_mem_top_q;
    u1_m0_wo0_wi0_delayr1_cmp_b <= STD_LOGIC_VECTOR("0" & u1_m0_wo0_wi0_delayr1_replace_rdmux_q);
    u1_m0_wo0_wi0_delayr1_cmp_q <= "1" when u1_m0_wo0_wi0_delayr1_cmp_a = u1_m0_wo0_wi0_delayr1_cmp_b else "0";

	--u1_m0_wo0_wi0_delayr1_cmpReg(REG,188)
    u1_m0_wo0_wi0_delayr1_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_wi0_delayr1_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_sel_q_11_q = "1") THEN
                u1_m0_wo0_wi0_delayr1_cmpReg_q <= u1_m0_wo0_wi0_delayr1_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--u1_m0_wo0_wi0_delayr1_sticky_ena(REG,191)
    u1_m0_wo0_wi0_delayr1_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_wi0_delayr1_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u1_m0_wo0_wi0_delayr1_nor_q = "1") THEN
                u1_m0_wo0_wi0_delayr1_sticky_ena_q <= u1_m0_wo0_wi0_delayr1_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--u1_m0_wo0_wi0_delayr1_enaAnd(LOGICAL,192)
    u1_m0_wo0_wi0_delayr1_enaAnd_a <= u1_m0_wo0_wi0_delayr1_sticky_ena_q;
    u1_m0_wo0_wi0_delayr1_enaAnd_b <= d_in0_m0_wi0_wo0_assign_sel_q_11_q;
    u1_m0_wo0_wi0_delayr1_enaAnd_q <= u1_m0_wo0_wi0_delayr1_enaAnd_a and u1_m0_wo0_wi0_delayr1_enaAnd_b;

	--u1_m0_wo0_wi0_join1(BITJOIN,28)@11
    u1_m0_wo0_wi0_join1_q <= u1_m0_wo0_wi0_split1_b & d_xIn_1_11_q;

	--u1_m0_wo0_wi0_delayr1_replace_rdcnt(COUNTER,182)
    -- every=1, low=0, high=5, step=1, init=1
    u1_m0_wo0_wi0_delayr1_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_wi0_delayr1_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            u1_m0_wo0_wi0_delayr1_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_sel_q_11_q = "1") THEN
                    IF u1_m0_wo0_wi0_delayr1_replace_rdcnt_i = 4 THEN
                      u1_m0_wo0_wi0_delayr1_replace_rdcnt_eq <= '1';
                    ELSE
                      u1_m0_wo0_wi0_delayr1_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (u1_m0_wo0_wi0_delayr1_replace_rdcnt_eq = '1') THEN
                        u1_m0_wo0_wi0_delayr1_replace_rdcnt_i <= u1_m0_wo0_wi0_delayr1_replace_rdcnt_i - 5;
                    ELSE
                        u1_m0_wo0_wi0_delayr1_replace_rdcnt_i <= u1_m0_wo0_wi0_delayr1_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    u1_m0_wo0_wi0_delayr1_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(u1_m0_wo0_wi0_delayr1_replace_rdcnt_i,3));


	--u1_m0_wo0_wi0_delayr1_replace_rdreg(REG,183)
    u1_m0_wo0_wi0_delayr1_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_wi0_delayr1_replace_rdreg_q <= "000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_sel_q_11_q = "1") THEN
                u1_m0_wo0_wi0_delayr1_replace_rdreg_q <= u1_m0_wo0_wi0_delayr1_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--u1_m0_wo0_wi0_delayr1_replace_rdmux(MUX,184)
    u1_m0_wo0_wi0_delayr1_replace_rdmux_s <= d_in0_m0_wi0_wo0_assign_sel_q_11_q;
    u1_m0_wo0_wi0_delayr1_replace_rdmux: PROCESS (u1_m0_wo0_wi0_delayr1_replace_rdmux_s, u1_m0_wo0_wi0_delayr1_replace_rdreg_q, u1_m0_wo0_wi0_delayr1_replace_rdcnt_q)
    BEGIN
            CASE u1_m0_wo0_wi0_delayr1_replace_rdmux_s IS
                  WHEN "0" => u1_m0_wo0_wi0_delayr1_replace_rdmux_q <= u1_m0_wo0_wi0_delayr1_replace_rdreg_q;
                  WHEN "1" => u1_m0_wo0_wi0_delayr1_replace_rdmux_q <= u1_m0_wo0_wi0_delayr1_replace_rdcnt_q;
                  WHEN OTHERS => u1_m0_wo0_wi0_delayr1_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--u1_m0_wo0_wi0_delayr1_replace_mem(DUALMEM,181)
    u1_m0_wo0_wi0_delayr1_replace_mem_reset0 <= areset;
    u1_m0_wo0_wi0_delayr1_replace_mem_ia <= u1_m0_wo0_wi0_join1_q;
    u1_m0_wo0_wi0_delayr1_replace_mem_aa <= u1_m0_wo0_wi0_delayr1_replace_rdreg_q;
    u1_m0_wo0_wi0_delayr1_replace_mem_ab <= u1_m0_wo0_wi0_delayr1_replace_rdmux_q;
    u1_m0_wo0_wi0_delayr1_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 6,
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
        clocken1 => u1_m0_wo0_wi0_delayr1_enaAnd_q(0),
        clocken0 => '1',
        wren_a => d_in0_m0_wi0_wo0_assign_sel_q_11_q(0),
        clock0 => clk,
        aclr1 => u1_m0_wo0_wi0_delayr1_replace_mem_reset0,
        clock1 => clk,
        address_b => u1_m0_wo0_wi0_delayr1_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => u1_m0_wo0_wi0_delayr1_replace_mem_iq,
        address_a => u1_m0_wo0_wi0_delayr1_replace_mem_aa,
        data_a => u1_m0_wo0_wi0_delayr1_replace_mem_ia
    );
        u1_m0_wo0_wi0_delayr1_replace_mem_q <= u1_m0_wo0_wi0_delayr1_replace_mem_iq(31 downto 0);

	--u1_m0_wo0_wi0_split1(BITSELECT,29)@11
    u1_m0_wo0_wi0_split1_in <= u1_m0_wo0_wi0_delayr1_replace_mem_q;
    u1_m0_wo0_wi0_split1_b <= u1_m0_wo0_wi0_split1_in(15 downto 0);
    u1_m0_wo0_wi0_split1_c <= u1_m0_wo0_wi0_split1_in(31 downto 16);

	--GND(CONSTANT,0)@0
    GND_q <= "0";

	--u1_m0_wo0_wi0_delayr4_nor(LOGICAL,214)
    u1_m0_wo0_wi0_delayr4_nor_a <= u1_m0_wo0_wi0_delayr1_notEnable_q;
    u1_m0_wo0_wi0_delayr4_nor_b <= u1_m0_wo0_wi0_delayr4_sticky_ena_q;
    u1_m0_wo0_wi0_delayr4_nor_q <= not (u1_m0_wo0_wi0_delayr4_nor_a or u1_m0_wo0_wi0_delayr4_nor_b);

	--u0_m0_wo0_wi0_delayr4_mem_top(CONSTANT,164)
    u0_m0_wo0_wi0_delayr4_mem_top_q <= "0111";

	--u1_m0_wo0_wi0_delayr4_cmp(LOGICAL,211)
    u1_m0_wo0_wi0_delayr4_cmp_a <= u0_m0_wo0_wi0_delayr4_mem_top_q;
    u1_m0_wo0_wi0_delayr4_cmp_b <= STD_LOGIC_VECTOR("0" & u1_m0_wo0_wi0_delayr4_replace_rdmux_q);
    u1_m0_wo0_wi0_delayr4_cmp_q <= "1" when u1_m0_wo0_wi0_delayr4_cmp_a = u1_m0_wo0_wi0_delayr4_cmp_b else "0";

	--u1_m0_wo0_wi0_delayr4_cmpReg(REG,212)
    u1_m0_wo0_wi0_delayr4_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_wi0_delayr4_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_sel_q_11_q = "1") THEN
                u1_m0_wo0_wi0_delayr4_cmpReg_q <= u1_m0_wo0_wi0_delayr4_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--u1_m0_wo0_wi0_delayr4_sticky_ena(REG,215)
    u1_m0_wo0_wi0_delayr4_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_wi0_delayr4_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u1_m0_wo0_wi0_delayr4_nor_q = "1") THEN
                u1_m0_wo0_wi0_delayr4_sticky_ena_q <= u1_m0_wo0_wi0_delayr4_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--u1_m0_wo0_wi0_delayr4_enaAnd(LOGICAL,216)
    u1_m0_wo0_wi0_delayr4_enaAnd_a <= u1_m0_wo0_wi0_delayr4_sticky_ena_q;
    u1_m0_wo0_wi0_delayr4_enaAnd_b <= d_in0_m0_wi0_wo0_assign_sel_q_11_q;
    u1_m0_wo0_wi0_delayr4_enaAnd_q <= u1_m0_wo0_wi0_delayr4_enaAnd_a and u1_m0_wo0_wi0_delayr4_enaAnd_b;

	--u1_m0_wo0_wi0_join4(BITJOIN,32)@11
    u1_m0_wo0_wi0_join4_q <= u1_m0_wo0_wi0_split4_b & u1_m0_wo0_wi0_delayr3_replace_mem_q;

	--u1_m0_wo0_wi0_delayr4_replace_rdcnt(COUNTER,206)
    -- every=1, low=0, high=7, step=1, init=1
    u1_m0_wo0_wi0_delayr4_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_wi0_delayr4_replace_rdcnt_i <= TO_UNSIGNED(1,3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_sel_q_11_q = "1") THEN
                    u1_m0_wo0_wi0_delayr4_replace_rdcnt_i <= u1_m0_wo0_wi0_delayr4_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u1_m0_wo0_wi0_delayr4_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(u1_m0_wo0_wi0_delayr4_replace_rdcnt_i,3));


	--u1_m0_wo0_wi0_delayr4_replace_rdreg(REG,207)
    u1_m0_wo0_wi0_delayr4_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_wi0_delayr4_replace_rdreg_q <= "000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_sel_q_11_q = "1") THEN
                u1_m0_wo0_wi0_delayr4_replace_rdreg_q <= u1_m0_wo0_wi0_delayr4_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--u1_m0_wo0_wi0_delayr4_replace_rdmux(MUX,208)
    u1_m0_wo0_wi0_delayr4_replace_rdmux_s <= d_in0_m0_wi0_wo0_assign_sel_q_11_q;
    u1_m0_wo0_wi0_delayr4_replace_rdmux: PROCESS (u1_m0_wo0_wi0_delayr4_replace_rdmux_s, u1_m0_wo0_wi0_delayr4_replace_rdreg_q, u1_m0_wo0_wi0_delayr4_replace_rdcnt_q)
    BEGIN
            CASE u1_m0_wo0_wi0_delayr4_replace_rdmux_s IS
                  WHEN "0" => u1_m0_wo0_wi0_delayr4_replace_rdmux_q <= u1_m0_wo0_wi0_delayr4_replace_rdreg_q;
                  WHEN "1" => u1_m0_wo0_wi0_delayr4_replace_rdmux_q <= u1_m0_wo0_wi0_delayr4_replace_rdcnt_q;
                  WHEN OTHERS => u1_m0_wo0_wi0_delayr4_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--u1_m0_wo0_wi0_delayr4_replace_mem(DUALMEM,205)
    u1_m0_wo0_wi0_delayr4_replace_mem_reset0 <= areset;
    u1_m0_wo0_wi0_delayr4_replace_mem_ia <= u1_m0_wo0_wi0_join4_q;
    u1_m0_wo0_wi0_delayr4_replace_mem_aa <= u1_m0_wo0_wi0_delayr4_replace_rdreg_q;
    u1_m0_wo0_wi0_delayr4_replace_mem_ab <= u1_m0_wo0_wi0_delayr4_replace_rdmux_q;
    u1_m0_wo0_wi0_delayr4_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 8,
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
        clocken1 => u1_m0_wo0_wi0_delayr4_enaAnd_q(0),
        clocken0 => '1',
        wren_a => d_in0_m0_wi0_wo0_assign_sel_q_11_q(0),
        clock0 => clk,
        aclr1 => u1_m0_wo0_wi0_delayr4_replace_mem_reset0,
        clock1 => clk,
        address_b => u1_m0_wo0_wi0_delayr4_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => u1_m0_wo0_wi0_delayr4_replace_mem_iq,
        address_a => u1_m0_wo0_wi0_delayr4_replace_mem_aa,
        data_a => u1_m0_wo0_wi0_delayr4_replace_mem_ia
    );
        u1_m0_wo0_wi0_delayr4_replace_mem_q <= u1_m0_wo0_wi0_delayr4_replace_mem_iq(31 downto 0);

	--u1_m0_wo0_wi0_split4(BITSELECT,33)@11
    u1_m0_wo0_wi0_split4_in <= u1_m0_wo0_wi0_delayr4_replace_mem_q;
    u1_m0_wo0_wi0_split4_b <= u1_m0_wo0_wi0_split4_in(15 downto 0);
    u1_m0_wo0_wi0_split4_c <= u1_m0_wo0_wi0_split4_in(31 downto 16);

	--d_u0_m0_wo0_memread_q_12(DELAY,113)@11
    d_u0_m0_wo0_memread_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => d_in0_m0_wi0_wo0_assign_sel_q_11_q, xout => d_u0_m0_wo0_memread_q_12_q, clk => clk, aclr => areset );

	--u1_m0_wo0_cma0(CHAINMULTADD,41)@11
    u1_m0_wo0_cma0_l(0) <= RESIZE(u1_m0_wo0_cma0_a(0),17) + RESIZE(u1_m0_wo0_cma0_b(0),17);
    u1_m0_wo0_cma0_l(1) <= RESIZE(u1_m0_wo0_cma0_a(1),17) + RESIZE(u1_m0_wo0_cma0_b(1),17);
    u1_m0_wo0_cma0_l(2) <= RESIZE(u1_m0_wo0_cma0_a(2),17) + RESIZE(u1_m0_wo0_cma0_b(2),17);
    u1_m0_wo0_cma0_l(3) <= RESIZE(u1_m0_wo0_cma0_a(3),17) + RESIZE(u1_m0_wo0_cma0_b(3),17);
--altera synthesis_off
    u1_m0_wo0_cma0_k0 <= (
        0 => TO_SIGNED(214,15),
        others => (others => '0'));
    u1_m0_wo0_cma0_k1 <= (
        0 => TO_SIGNED(-1663,15),
        others => (others => '0'));
    u1_m0_wo0_cma0_k2 <= (
        0 => TO_SIGNED(9641,15),
        others => (others => '0'));
    u1_m0_wo0_cma0_k3 <= (
        others => (others => '0'));
--altera synthesis_on
    u1_m0_wo0_cma0_r(0) <= u1_m0_wo0_cma0_k0(TO_INTEGER(u1_m0_wo0_cma0_c(0)));
    u1_m0_wo0_cma0_r(1) <= u1_m0_wo0_cma0_k1(TO_INTEGER(u1_m0_wo0_cma0_c(1)));
    u1_m0_wo0_cma0_r(2) <= u1_m0_wo0_cma0_k2(TO_INTEGER(u1_m0_wo0_cma0_c(2)));
    u1_m0_wo0_cma0_r(3) <= u1_m0_wo0_cma0_k3(TO_INTEGER(u1_m0_wo0_cma0_c(3)));
    u1_m0_wo0_cma0_p(0) <= u1_m0_wo0_cma0_l(0) * u1_m0_wo0_cma0_r(0);
    u1_m0_wo0_cma0_p(1) <= u1_m0_wo0_cma0_l(1) * u1_m0_wo0_cma0_r(1);
    u1_m0_wo0_cma0_p(2) <= u1_m0_wo0_cma0_l(2) * u1_m0_wo0_cma0_r(2);
    u1_m0_wo0_cma0_p(3) <= u1_m0_wo0_cma0_l(3) * u1_m0_wo0_cma0_r(3);
    u1_m0_wo0_cma0_w(0) <= RESIZE(u1_m0_wo0_cma0_p(0),34);
    u1_m0_wo0_cma0_w(1) <= RESIZE(u1_m0_wo0_cma0_p(1),34);
    u1_m0_wo0_cma0_w(2) <= RESIZE(u1_m0_wo0_cma0_p(2),34);
    u1_m0_wo0_cma0_w(3) <= RESIZE(u1_m0_wo0_cma0_p(3),34);
    u1_m0_wo0_cma0_x(0) <= u1_m0_wo0_cma0_w(0);
    u1_m0_wo0_cma0_x(1) <= u1_m0_wo0_cma0_w(1);
    u1_m0_wo0_cma0_x(2) <= u1_m0_wo0_cma0_w(2);
    u1_m0_wo0_cma0_x(3) <= u1_m0_wo0_cma0_w(3);
    u1_m0_wo0_cma0_y(0) <= u1_m0_wo0_cma0_s(1) + u1_m0_wo0_cma0_x(0);
    u1_m0_wo0_cma0_y(1) <= u1_m0_wo0_cma0_s(2) + u1_m0_wo0_cma0_x(1);
    u1_m0_wo0_cma0_y(2) <= u1_m0_wo0_cma0_s(3) + u1_m0_wo0_cma0_x(2);
    u1_m0_wo0_cma0_y(3) <= u1_m0_wo0_cma0_x(3);
    u1_m0_wo0_cma0_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_cma0_a <= (others => (others => '0'));
            u1_m0_wo0_cma0_b <= (others => (others => '0'));
            u1_m0_wo0_cma0_c <= (others => (others => '0'));
            u1_m0_wo0_cma0_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_sel_q_11_q = "1") THEN
                u1_m0_wo0_cma0_a(0) <= SIGNED(RESIZE(SIGNED(d_xIn_1_11_q),16));
                u1_m0_wo0_cma0_a(1) <= SIGNED(RESIZE(SIGNED(u1_m0_wo0_wi0_split1_b),16));
                u1_m0_wo0_cma0_a(2) <= SIGNED(RESIZE(SIGNED(u1_m0_wo0_wi0_split1_c),16));
                u1_m0_wo0_cma0_a(3) <= (others => '0');
                u1_m0_wo0_cma0_b(0) <= SIGNED(RESIZE(SIGNED(u1_m0_wo0_wi0_split4_c),16));
                u1_m0_wo0_cma0_b(1) <= SIGNED(RESIZE(SIGNED(u1_m0_wo0_wi0_split4_b),16));
                u1_m0_wo0_cma0_b(2) <= SIGNED(RESIZE(SIGNED(u1_m0_wo0_wi0_delayr3_replace_mem_q),16));
                u1_m0_wo0_cma0_b(3) <= (others => '0');
                u1_m0_wo0_cma0_c(0) <= UNSIGNED(RESIZE(UNSIGNED(GND_q),3));
                u1_m0_wo0_cma0_c(1) <= UNSIGNED(RESIZE(UNSIGNED(GND_q),3));
                u1_m0_wo0_cma0_c(2) <= UNSIGNED(RESIZE(UNSIGNED(GND_q),3));
                u1_m0_wo0_cma0_c(3) <= (others => '0');
            END IF;
            IF (d_u0_m0_wo0_memread_q_12_q = "1") THEN
                u1_m0_wo0_cma0_s(0) <= u1_m0_wo0_cma0_y(0);
                u1_m0_wo0_cma0_s(1) <= u1_m0_wo0_cma0_y(1);
                u1_m0_wo0_cma0_s(2) <= u1_m0_wo0_cma0_y(2);
                u1_m0_wo0_cma0_s(3) <= u1_m0_wo0_cma0_y(3);
            END IF;
        END IF;
    END PROCESS;
    u1_m0_wo0_cma0_s0 <= STD_LOGIC_VECTOR(RESIZE(u1_m0_wo0_cma0_s(0),34));
    u1_m0_wo0_cma0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_cma0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_cma0_q <= u1_m0_wo0_cma0_s0;
        END IF;
    END PROCESS;

	--u0_m0_wo0_oseq_gated_reg(REG,22)@11
    u0_m0_wo0_oseq_gated_reg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= d_in0_m0_wi0_wo0_assign_sel_q_11_q;
        END IF;
    END PROCESS;


	--d_u0_m0_wo0_oseq_gated_reg_q_13(DELAY,115)@12
    d_u0_m0_wo0_oseq_gated_reg_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_oseq_gated_reg_q, xout => d_u0_m0_wo0_oseq_gated_reg_q_13_q, clk => clk, aclr => areset );

	--d_u0_m0_wo0_oseq_gated_reg_q_14(DELAY,116)@13
    d_u0_m0_wo0_oseq_gated_reg_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => d_u0_m0_wo0_oseq_gated_reg_q_13_q, xout => d_u0_m0_wo0_oseq_gated_reg_q_14_q, clk => clk, aclr => areset );

	--out1_m0_wo0_lineup_select_seq_0(SEQUENCE,72)@13
    out1_m0_wo0_lineup_select_seq_0: PROCESS (clk, areset)
        variable out1_m0_wo0_lineup_select_seq_0_c : signed (5 downto 0);
    BEGIN
        IF (areset = '1') THEN
            out1_m0_wo0_lineup_select_seq_0_c := "000100";
            out1_m0_wo0_lineup_select_seq_0_q <= "0";
            out1_m0_wo0_lineup_select_seq_0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_oseq_gated_reg_q_13_q = "1") THEN
                IF (out1_m0_wo0_lineup_select_seq_0_c = "111101") THEN
                    out1_m0_wo0_lineup_select_seq_0_eq <= '1';
                ELSE
                    out1_m0_wo0_lineup_select_seq_0_eq <= '0';
                END IF;
                IF (out1_m0_wo0_lineup_select_seq_0_eq = '1') THEN
                    out1_m0_wo0_lineup_select_seq_0_c := out1_m0_wo0_lineup_select_seq_0_c + 7;
                ELSE
                    out1_m0_wo0_lineup_select_seq_0_c := out1_m0_wo0_lineup_select_seq_0_c - 1;
                END IF;
                out1_m0_wo0_lineup_select_seq_0_q <= std_logic_vector(out1_m0_wo0_lineup_select_seq_0_c(5 DOWNTO 5));
            END IF;
        END IF;
    END PROCESS;


	--out1_m0_wo0_lineup_select_0(LOGICAL,73)@14
    out1_m0_wo0_lineup_select_0_a <= out1_m0_wo0_lineup_select_seq_0_q;
    out1_m0_wo0_lineup_select_0_b <= d_u0_m0_wo0_oseq_gated_reg_q_14_q;
    out1_m0_wo0_lineup_select_0_q <= out1_m0_wo0_lineup_select_0_a and out1_m0_wo0_lineup_select_0_b;

	--VCC(CONSTANT,1)@0
    VCC_q <= "1";

	--out3_wo0_data_selector(SELECTOR,102)@14
    out3_wo0_data_selector: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            out3_wo0_data_selector_q <= (others => '0');
            out3_wo0_data_selector_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            out3_wo0_data_selector_q <= STD_LOGIC_VECTOR((33 downto 30 => u1_m1_wo0_mtree_mult1_0_shift0_q(29)) & u1_m1_wo0_mtree_mult1_0_shift0_q);
            out3_wo0_data_selector_v <= (others => '0');
            IF (out1_m1_wo0_lineup_select_0_q = "1") THEN
                out3_wo0_data_selector_q <= STD_LOGIC_VECTOR((33 downto 30 => u1_m1_wo0_mtree_mult1_0_shift0_q(29)) & u1_m1_wo0_mtree_mult1_0_shift0_q);
                out3_wo0_data_selector_v <= "1";
            END IF;
            IF (out1_m0_wo0_lineup_select_0_q = "1") THEN
                out3_wo0_data_selector_q <= u1_m0_wo0_cma0_q;
                out3_wo0_data_selector_v <= "1";
            END IF;
        END IF;
    END PROCESS;


	--out2_m1_wo0_lineup_1_replace_mem(DUALMEM,301)
    out2_m1_wo0_lineup_1_replace_mem_reset0 <= areset;
    out2_m1_wo0_lineup_1_replace_mem_ia <= u1_m1_wo0_mtree_mult1_0_shift0_q;
    out2_m1_wo0_lineup_1_replace_mem_aa <= u0_m1_wo0_wi0_phasedelay0_replace_rdreg_q;
    out2_m1_wo0_lineup_1_replace_mem_ab <= u0_m1_wo0_wi0_phasedelay0_replace_rdmux_q;
    out2_m1_wo0_lineup_1_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 30,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 30,
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
        clocken1 => u0_m1_wo0_wi0_phasedelay0_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => out2_m1_wo0_lineup_1_replace_mem_reset0,
        clock1 => clk,
        address_b => out2_m1_wo0_lineup_1_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => out2_m1_wo0_lineup_1_replace_mem_iq,
        address_a => out2_m1_wo0_lineup_1_replace_mem_aa,
        data_a => out2_m1_wo0_lineup_1_replace_mem_ia
    );
        out2_m1_wo0_lineup_1_replace_mem_q <= out2_m1_wo0_lineup_1_replace_mem_iq(29 downto 0);

	--out0_m1_wo0_lineup_select_seq_0(SEQUENCE,66)@12
    out0_m1_wo0_lineup_select_seq_0: PROCESS (clk, areset)
        variable out0_m1_wo0_lineup_select_seq_0_c : signed (5 downto 0);
    BEGIN
        IF (areset = '1') THEN
            out0_m1_wo0_lineup_select_seq_0_c := "000000";
            out0_m1_wo0_lineup_select_seq_0_q <= "0";
            out0_m1_wo0_lineup_select_seq_0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m1_wo0_oseq_gated_reg_q = "1") THEN
                IF (out0_m1_wo0_lineup_select_seq_0_c = "111101") THEN
                    out0_m1_wo0_lineup_select_seq_0_eq <= '1';
                ELSE
                    out0_m1_wo0_lineup_select_seq_0_eq <= '0';
                END IF;
                IF (out0_m1_wo0_lineup_select_seq_0_eq = '1') THEN
                    out0_m1_wo0_lineup_select_seq_0_c := out0_m1_wo0_lineup_select_seq_0_c + 7;
                ELSE
                    out0_m1_wo0_lineup_select_seq_0_c := out0_m1_wo0_lineup_select_seq_0_c - 1;
                END IF;
                out0_m1_wo0_lineup_select_seq_0_q <= std_logic_vector(out0_m1_wo0_lineup_select_seq_0_c(5 DOWNTO 5));
            END IF;
        END IF;
    END PROCESS;


	--out0_m1_wo0_lineup_select_0(LOGICAL,67)@13
    out0_m1_wo0_lineup_select_0_a <= out0_m1_wo0_lineup_select_seq_0_q;
    out0_m1_wo0_lineup_select_0_b <= d_u0_m1_wo0_oseq_gated_reg_q_13_q;
    out0_m1_wo0_lineup_select_0_q <= out0_m1_wo0_lineup_select_0_a and out0_m1_wo0_lineup_select_0_b;

	--out0_m1_wo0_lineup_select_delay_0(DELAY,68)@13
    out0_m1_wo0_lineup_select_delay_0 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => out0_m1_wo0_lineup_select_0_q, xout => out0_m1_wo0_lineup_select_delay_0_q, clk => clk, aclr => areset );

	--d_out0_m1_wo0_assign_sel_q_14(DELAY,121)@13
    d_out0_m1_wo0_assign_sel_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => out0_m1_wo0_lineup_select_delay_0_q, xout => d_out0_m1_wo0_assign_sel_q_14_q, clk => clk, aclr => areset );

	--out2_m0_wo0_lineup_1_replace_mem(DUALMEM,289)
    out2_m0_wo0_lineup_1_replace_mem_reset0 <= areset;
    out2_m0_wo0_lineup_1_replace_mem_ia <= u1_m0_wo0_cma0_q;
    out2_m0_wo0_lineup_1_replace_mem_aa <= u0_m1_wo0_wi0_phasedelay0_replace_rdreg_q;
    out2_m0_wo0_lineup_1_replace_mem_ab <= u0_m1_wo0_wi0_phasedelay0_replace_rdmux_q;
    out2_m0_wo0_lineup_1_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 34,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 34,
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
        clocken1 => u0_m1_wo0_wi0_phasedelay0_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => out2_m0_wo0_lineup_1_replace_mem_reset0,
        clock1 => clk,
        address_b => out2_m0_wo0_lineup_1_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => out2_m0_wo0_lineup_1_replace_mem_iq,
        address_a => out2_m0_wo0_lineup_1_replace_mem_aa,
        data_a => out2_m0_wo0_lineup_1_replace_mem_ia
    );
        out2_m0_wo0_lineup_1_replace_mem_q <= out2_m0_wo0_lineup_1_replace_mem_iq(33 downto 0);

	--out0_m0_wo0_lineup_select_seq_0(SEQUENCE,60)@12
    out0_m0_wo0_lineup_select_seq_0: PROCESS (clk, areset)
        variable out0_m0_wo0_lineup_select_seq_0_c : signed (5 downto 0);
    BEGIN
        IF (areset = '1') THEN
            out0_m0_wo0_lineup_select_seq_0_c := "000000";
            out0_m0_wo0_lineup_select_seq_0_q <= "0";
            out0_m0_wo0_lineup_select_seq_0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_oseq_gated_reg_q = "1") THEN
                IF (out0_m0_wo0_lineup_select_seq_0_c = "111101") THEN
                    out0_m0_wo0_lineup_select_seq_0_eq <= '1';
                ELSE
                    out0_m0_wo0_lineup_select_seq_0_eq <= '0';
                END IF;
                IF (out0_m0_wo0_lineup_select_seq_0_eq = '1') THEN
                    out0_m0_wo0_lineup_select_seq_0_c := out0_m0_wo0_lineup_select_seq_0_c + 7;
                ELSE
                    out0_m0_wo0_lineup_select_seq_0_c := out0_m0_wo0_lineup_select_seq_0_c - 1;
                END IF;
                out0_m0_wo0_lineup_select_seq_0_q <= std_logic_vector(out0_m0_wo0_lineup_select_seq_0_c(5 DOWNTO 5));
            END IF;
        END IF;
    END PROCESS;


	--out0_m0_wo0_lineup_select_0(LOGICAL,61)@13
    out0_m0_wo0_lineup_select_0_a <= out0_m0_wo0_lineup_select_seq_0_q;
    out0_m0_wo0_lineup_select_0_b <= d_u0_m0_wo0_oseq_gated_reg_q_13_q;
    out0_m0_wo0_lineup_select_0_q <= out0_m0_wo0_lineup_select_0_a and out0_m0_wo0_lineup_select_0_b;

	--out0_m0_wo0_lineup_select_delay_0(DELAY,62)@13
    out0_m0_wo0_lineup_select_delay_0 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => out0_m0_wo0_lineup_select_0_q, xout => out0_m0_wo0_lineup_select_delay_0_q, clk => clk, aclr => areset );

	--d_out0_m0_wo0_assign_sel_q_14(DELAY,120)@13
    d_out0_m0_wo0_assign_sel_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => out0_m0_wo0_lineup_select_delay_0_q, xout => d_out0_m0_wo0_assign_sel_q_14_q, clk => clk, aclr => areset );

	--out2_wo0_data_selector(SELECTOR,93)@14
    out2_wo0_data_selector: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            out2_wo0_data_selector_q <= (others => '0');
            out2_wo0_data_selector_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            out2_wo0_data_selector_q <= STD_LOGIC_VECTOR((33 downto 30 => out2_m1_wo0_lineup_1_replace_mem_q(29)) & out2_m1_wo0_lineup_1_replace_mem_q);
            out2_wo0_data_selector_v <= (others => '0');
            IF (d_out0_m1_wo0_assign_sel_q_14_q = "1") THEN
                out2_wo0_data_selector_q <= STD_LOGIC_VECTOR((33 downto 30 => out2_m1_wo0_lineup_1_replace_mem_q(29)) & out2_m1_wo0_lineup_1_replace_mem_q);
                out2_wo0_data_selector_v <= "1";
            END IF;
            IF (d_out0_m0_wo0_assign_sel_q_14_q = "1") THEN
                out2_wo0_data_selector_q <= out2_m0_wo0_lineup_1_replace_mem_q;
                out2_wo0_data_selector_v <= "1";
            END IF;
        END IF;
    END PROCESS;


	--u0_m1_wo0_wi0_delayr0_notEnable(LOGICAL,225)
    u0_m1_wo0_wi0_delayr0_notEnable_a <= d_in0_m0_wi0_wo0_assign_sel_q_13_q;
    u0_m1_wo0_wi0_delayr0_notEnable_q <= not u0_m1_wo0_wi0_delayr0_notEnable_a;

	--u0_m1_wo0_wi0_delayr0_nor(LOGICAL,226)
    u0_m1_wo0_wi0_delayr0_nor_a <= u0_m1_wo0_wi0_delayr0_notEnable_q;
    u0_m1_wo0_wi0_delayr0_nor_b <= u0_m1_wo0_wi0_delayr0_sticky_ena_q;
    u0_m1_wo0_wi0_delayr0_nor_q <= not (u0_m1_wo0_wi0_delayr0_nor_a or u0_m1_wo0_wi0_delayr0_nor_b);

	--u0_m1_wo0_wi0_delayr0_cmp(LOGICAL,223)
    u0_m1_wo0_wi0_delayr0_cmp_a <= u0_m1_wo0_wi0_delayr0_mem_top_q;
    u0_m1_wo0_wi0_delayr0_cmp_b <= STD_LOGIC_VECTOR("0" & u0_m1_wo0_wi0_delayr0_replace_rdmux_q);
    u0_m1_wo0_wi0_delayr0_cmp_q <= "1" when u0_m1_wo0_wi0_delayr0_cmp_a = u0_m1_wo0_wi0_delayr0_cmp_b else "0";

	--u0_m1_wo0_wi0_delayr0_cmpReg(REG,224)
    u0_m1_wo0_wi0_delayr0_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_wi0_delayr0_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_sel_q_13_q = "1") THEN
                u0_m1_wo0_wi0_delayr0_cmpReg_q <= u0_m1_wo0_wi0_delayr0_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m1_wo0_wi0_delayr0_sticky_ena(REG,227)
    u0_m1_wo0_wi0_delayr0_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_wi0_delayr0_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u0_m1_wo0_wi0_delayr0_nor_q = "1") THEN
                u0_m1_wo0_wi0_delayr0_sticky_ena_q <= u0_m1_wo0_wi0_delayr0_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m1_wo0_wi0_delayr0_enaAnd(LOGICAL,228)
    u0_m1_wo0_wi0_delayr0_enaAnd_a <= u0_m1_wo0_wi0_delayr0_sticky_ena_q;
    u0_m1_wo0_wi0_delayr0_enaAnd_b <= d_in0_m0_wi0_wo0_assign_sel_q_13_q;
    u0_m1_wo0_wi0_delayr0_enaAnd_q <= u0_m1_wo0_wi0_delayr0_enaAnd_a and u0_m1_wo0_wi0_delayr0_enaAnd_b;

	--d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem(DUALMEM,125)
    d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_reset0 <= areset;
    d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_ia <= xIn_0;
    d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_aa <= d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdreg_q;
    d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_ab <= d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux_q;
    d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_dmem : altsyncram
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
        clocken1 => d_in0_m0_wi0_wo0_assign_data_q_13_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_reset0,
        clock1 => clk,
        address_b => d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_iq,
        address_a => d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_aa,
        data_a => d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_ia
    );
        d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_q <= d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_iq(15 downto 0);

	--u0_m1_wo0_wi0_delayr0_replace_rdcnt(COUNTER,218)
    -- every=1, low=0, high=14, step=1, init=1
    u0_m1_wo0_wi0_delayr0_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_wi0_delayr0_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            u0_m1_wo0_wi0_delayr0_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_sel_q_13_q = "1") THEN
                    IF u0_m1_wo0_wi0_delayr0_replace_rdcnt_i = 13 THEN
                      u0_m1_wo0_wi0_delayr0_replace_rdcnt_eq <= '1';
                    ELSE
                      u0_m1_wo0_wi0_delayr0_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (u0_m1_wo0_wi0_delayr0_replace_rdcnt_eq = '1') THEN
                        u0_m1_wo0_wi0_delayr0_replace_rdcnt_i <= u0_m1_wo0_wi0_delayr0_replace_rdcnt_i - 14;
                    ELSE
                        u0_m1_wo0_wi0_delayr0_replace_rdcnt_i <= u0_m1_wo0_wi0_delayr0_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m1_wo0_wi0_delayr0_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(u0_m1_wo0_wi0_delayr0_replace_rdcnt_i,4));


	--u0_m1_wo0_wi0_delayr0_replace_rdreg(REG,219)
    u0_m1_wo0_wi0_delayr0_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_wi0_delayr0_replace_rdreg_q <= "0000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_sel_q_13_q = "1") THEN
                u0_m1_wo0_wi0_delayr0_replace_rdreg_q <= u0_m1_wo0_wi0_delayr0_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m1_wo0_wi0_delayr0_replace_rdmux(MUX,220)
    u0_m1_wo0_wi0_delayr0_replace_rdmux_s <= d_in0_m0_wi0_wo0_assign_sel_q_13_q;
    u0_m1_wo0_wi0_delayr0_replace_rdmux: PROCESS (u0_m1_wo0_wi0_delayr0_replace_rdmux_s, u0_m1_wo0_wi0_delayr0_replace_rdreg_q, u0_m1_wo0_wi0_delayr0_replace_rdcnt_q)
    BEGIN
            CASE u0_m1_wo0_wi0_delayr0_replace_rdmux_s IS
                  WHEN "0" => u0_m1_wo0_wi0_delayr0_replace_rdmux_q <= u0_m1_wo0_wi0_delayr0_replace_rdreg_q;
                  WHEN "1" => u0_m1_wo0_wi0_delayr0_replace_rdmux_q <= u0_m1_wo0_wi0_delayr0_replace_rdcnt_q;
                  WHEN OTHERS => u0_m1_wo0_wi0_delayr0_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--u0_m1_wo0_wi0_delayr0_replace_mem(DUALMEM,217)
    u0_m1_wo0_wi0_delayr0_replace_mem_reset0 <= areset;
    u0_m1_wo0_wi0_delayr0_replace_mem_ia <= d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_q;
    u0_m1_wo0_wi0_delayr0_replace_mem_aa <= u0_m1_wo0_wi0_delayr0_replace_rdreg_q;
    u0_m1_wo0_wi0_delayr0_replace_mem_ab <= u0_m1_wo0_wi0_delayr0_replace_rdmux_q;
    u0_m1_wo0_wi0_delayr0_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 4,
        numwords_a => 15,
        width_b => 16,
        widthad_b => 4,
        numwords_b => 15,
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
        clocken1 => u0_m1_wo0_wi0_delayr0_enaAnd_q(0),
        clocken0 => '1',
        wren_a => d_in0_m0_wi0_wo0_assign_sel_q_13_q(0),
        clock0 => clk,
        aclr1 => u0_m1_wo0_wi0_delayr0_replace_mem_reset0,
        clock1 => clk,
        address_b => u0_m1_wo0_wi0_delayr0_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => u0_m1_wo0_wi0_delayr0_replace_mem_iq,
        address_a => u0_m1_wo0_wi0_delayr0_replace_mem_aa,
        data_a => u0_m1_wo0_wi0_delayr0_replace_mem_ia
    );
        u0_m1_wo0_wi0_delayr0_replace_mem_q <= u0_m1_wo0_wi0_delayr0_replace_mem_iq(15 downto 0);

	--u0_m1_wo0_wi0_phasedelay0_replace_mem(DUALMEM,229)
    u0_m1_wo0_wi0_phasedelay0_replace_mem_reset0 <= areset;
    u0_m1_wo0_wi0_phasedelay0_replace_mem_ia <= u0_m1_wo0_wi0_delayr0_replace_mem_q;
    u0_m1_wo0_wi0_phasedelay0_replace_mem_aa <= u0_m1_wo0_wi0_phasedelay0_replace_rdreg_q;
    u0_m1_wo0_wi0_phasedelay0_replace_mem_ab <= u0_m1_wo0_wi0_phasedelay0_replace_rdmux_q;
    u0_m1_wo0_wi0_phasedelay0_replace_mem_dmem : altsyncram
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
        clocken1 => u0_m1_wo0_wi0_phasedelay0_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => u0_m1_wo0_wi0_phasedelay0_replace_mem_reset0,
        clock1 => clk,
        address_b => u0_m1_wo0_wi0_phasedelay0_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => u0_m1_wo0_wi0_phasedelay0_replace_mem_iq,
        address_a => u0_m1_wo0_wi0_phasedelay0_replace_mem_aa,
        data_a => u0_m1_wo0_wi0_phasedelay0_replace_mem_ia
    );
        u0_m1_wo0_wi0_phasedelay0_replace_mem_q <= u0_m1_wo0_wi0_phasedelay0_replace_mem_iq(15 downto 0);

	--u0_m1_wo0_mtree_mult1_0_shift0(BITSHIFT,105)@13
    u0_m1_wo0_mtree_mult1_0_shift0_q_int <= u0_m1_wo0_wi0_phasedelay0_replace_mem_q & "00000000000000";
    u0_m1_wo0_mtree_mult1_0_shift0_q <= u0_m1_wo0_mtree_mult1_0_shift0_q_int(29 downto 0);

	--d_u0_m1_wo0_mtree_mult1_0_shift0_q_14(DELAY,124)@13
    d_u0_m1_wo0_mtree_mult1_0_shift0_q_14 : dspba_delay
    GENERIC MAP ( width => 30, depth => 1 )
    PORT MAP ( xin => u0_m1_wo0_mtree_mult1_0_shift0_q, xout => d_u0_m1_wo0_mtree_mult1_0_shift0_q_14_q, clk => clk, aclr => areset );

	--u0_m0_wo0_wi0_delayr1_notEnable(LOGICAL,143)
    u0_m0_wo0_wi0_delayr1_notEnable_a <= xIn_v;
    u0_m0_wo0_wi0_delayr1_notEnable_q <= not u0_m0_wo0_wi0_delayr1_notEnable_a;

	--u0_m0_wo0_wi0_delayr3_nor(LOGICAL,156)
    u0_m0_wo0_wi0_delayr3_nor_a <= u0_m0_wo0_wi0_delayr1_notEnable_q;
    u0_m0_wo0_wi0_delayr3_nor_b <= u0_m0_wo0_wi0_delayr3_sticky_ena_q;
    u0_m0_wo0_wi0_delayr3_nor_q <= not (u0_m0_wo0_wi0_delayr3_nor_a or u0_m0_wo0_wi0_delayr3_nor_b);

	--u0_m0_wo0_wi0_delayr3_cmp(LOGICAL,153)
    u0_m0_wo0_wi0_delayr3_cmp_a <= u0_m0_wo0_wi0_delayr3_mem_top_q;
    u0_m0_wo0_wi0_delayr3_cmp_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_delayr3_replace_rdmux_q);
    u0_m0_wo0_wi0_delayr3_cmp_q <= "1" when u0_m0_wo0_wi0_delayr3_cmp_a = u0_m0_wo0_wi0_delayr3_cmp_b else "0";

	--u0_m0_wo0_wi0_delayr3_cmpReg(REG,154)
    u0_m0_wo0_wi0_delayr3_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr3_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_wi0_delayr3_cmpReg_q <= u0_m0_wo0_wi0_delayr3_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr3_sticky_ena(REG,157)
    u0_m0_wo0_wi0_delayr3_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr3_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_delayr3_nor_q = "1") THEN
                u0_m0_wo0_wi0_delayr3_sticky_ena_q <= u0_m0_wo0_wi0_delayr3_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr3_enaAnd(LOGICAL,158)
    u0_m0_wo0_wi0_delayr3_enaAnd_a <= u0_m0_wo0_wi0_delayr3_sticky_ena_q;
    u0_m0_wo0_wi0_delayr3_enaAnd_b <= xIn_v;
    u0_m0_wo0_wi0_delayr3_enaAnd_q <= u0_m0_wo0_wi0_delayr3_enaAnd_a and u0_m0_wo0_wi0_delayr3_enaAnd_b;

	--u0_m0_wo0_wi0_delayr3_replace_rdcnt(COUNTER,148)
    -- every=1, low=0, high=6, step=1, init=1
    u0_m0_wo0_wi0_delayr3_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr3_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            u0_m0_wo0_wi0_delayr3_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                    IF u0_m0_wo0_wi0_delayr3_replace_rdcnt_i = 5 THEN
                      u0_m0_wo0_wi0_delayr3_replace_rdcnt_eq <= '1';
                    ELSE
                      u0_m0_wo0_wi0_delayr3_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (u0_m0_wo0_wi0_delayr3_replace_rdcnt_eq = '1') THEN
                        u0_m0_wo0_wi0_delayr3_replace_rdcnt_i <= u0_m0_wo0_wi0_delayr3_replace_rdcnt_i - 6;
                    ELSE
                        u0_m0_wo0_wi0_delayr3_replace_rdcnt_i <= u0_m0_wo0_wi0_delayr3_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_delayr3_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_delayr3_replace_rdcnt_i,3));


	--u0_m0_wo0_wi0_delayr3_replace_rdreg(REG,149)
    u0_m0_wo0_wi0_delayr3_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr3_replace_rdreg_q <= "000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_wi0_delayr3_replace_rdreg_q <= u0_m0_wo0_wi0_delayr3_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr3_replace_rdmux(MUX,150)
    u0_m0_wo0_wi0_delayr3_replace_rdmux_s <= xIn_v;
    u0_m0_wo0_wi0_delayr3_replace_rdmux: PROCESS (u0_m0_wo0_wi0_delayr3_replace_rdmux_s, u0_m0_wo0_wi0_delayr3_replace_rdreg_q, u0_m0_wo0_wi0_delayr3_replace_rdcnt_q)
    BEGIN
            CASE u0_m0_wo0_wi0_delayr3_replace_rdmux_s IS
                  WHEN "0" => u0_m0_wo0_wi0_delayr3_replace_rdmux_q <= u0_m0_wo0_wi0_delayr3_replace_rdreg_q;
                  WHEN "1" => u0_m0_wo0_wi0_delayr3_replace_rdmux_q <= u0_m0_wo0_wi0_delayr3_replace_rdcnt_q;
                  WHEN OTHERS => u0_m0_wo0_wi0_delayr3_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr3_replace_mem(DUALMEM,147)
    u0_m0_wo0_wi0_delayr3_replace_mem_reset0 <= areset;
    u0_m0_wo0_wi0_delayr3_replace_mem_ia <= u0_m0_wo0_wi0_split1_c;
    u0_m0_wo0_wi0_delayr3_replace_mem_aa <= u0_m0_wo0_wi0_delayr3_replace_rdreg_q;
    u0_m0_wo0_wi0_delayr3_replace_mem_ab <= u0_m0_wo0_wi0_delayr3_replace_rdmux_q;
    u0_m0_wo0_wi0_delayr3_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 16,
        widthad_b => 3,
        numwords_b => 7,
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
        clocken1 => u0_m0_wo0_wi0_delayr3_enaAnd_q(0),
        clocken0 => '1',
        wren_a => xIn_v(0),
        clock0 => clk,
        aclr1 => u0_m0_wo0_wi0_delayr3_replace_mem_reset0,
        clock1 => clk,
        address_b => u0_m0_wo0_wi0_delayr3_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_wi0_delayr3_replace_mem_iq,
        address_a => u0_m0_wo0_wi0_delayr3_replace_mem_aa,
        data_a => u0_m0_wo0_wi0_delayr3_replace_mem_ia
    );
        u0_m0_wo0_wi0_delayr3_replace_mem_q <= u0_m0_wo0_wi0_delayr3_replace_mem_iq(15 downto 0);

	--u0_m0_wo0_wi0_delayr1_nor(LOGICAL,144)
    u0_m0_wo0_wi0_delayr1_nor_a <= u0_m0_wo0_wi0_delayr1_notEnable_q;
    u0_m0_wo0_wi0_delayr1_nor_b <= u0_m0_wo0_wi0_delayr1_sticky_ena_q;
    u0_m0_wo0_wi0_delayr1_nor_q <= not (u0_m0_wo0_wi0_delayr1_nor_a or u0_m0_wo0_wi0_delayr1_nor_b);

	--u0_m0_wo0_wi0_delayr1_cmp(LOGICAL,141)
    u0_m0_wo0_wi0_delayr1_cmp_a <= u0_m0_wo0_wi0_delayr1_mem_top_q;
    u0_m0_wo0_wi0_delayr1_cmp_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_delayr1_replace_rdmux_q);
    u0_m0_wo0_wi0_delayr1_cmp_q <= "1" when u0_m0_wo0_wi0_delayr1_cmp_a = u0_m0_wo0_wi0_delayr1_cmp_b else "0";

	--u0_m0_wo0_wi0_delayr1_cmpReg(REG,142)
    u0_m0_wo0_wi0_delayr1_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr1_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_wi0_delayr1_cmpReg_q <= u0_m0_wo0_wi0_delayr1_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr1_sticky_ena(REG,145)
    u0_m0_wo0_wi0_delayr1_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr1_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_delayr1_nor_q = "1") THEN
                u0_m0_wo0_wi0_delayr1_sticky_ena_q <= u0_m0_wo0_wi0_delayr1_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr1_enaAnd(LOGICAL,146)
    u0_m0_wo0_wi0_delayr1_enaAnd_a <= u0_m0_wo0_wi0_delayr1_sticky_ena_q;
    u0_m0_wo0_wi0_delayr1_enaAnd_b <= xIn_v;
    u0_m0_wo0_wi0_delayr1_enaAnd_q <= u0_m0_wo0_wi0_delayr1_enaAnd_a and u0_m0_wo0_wi0_delayr1_enaAnd_b;

	--u0_m0_wo0_wi0_join1(BITJOIN,8)@10
    u0_m0_wo0_wi0_join1_q <= u0_m0_wo0_wi0_split1_b & xIn_0;

	--u0_m0_wo0_wi0_delayr1_replace_rdcnt(COUNTER,136)
    -- every=1, low=0, high=5, step=1, init=1
    u0_m0_wo0_wi0_delayr1_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr1_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            u0_m0_wo0_wi0_delayr1_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                    IF u0_m0_wo0_wi0_delayr1_replace_rdcnt_i = 4 THEN
                      u0_m0_wo0_wi0_delayr1_replace_rdcnt_eq <= '1';
                    ELSE
                      u0_m0_wo0_wi0_delayr1_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (u0_m0_wo0_wi0_delayr1_replace_rdcnt_eq = '1') THEN
                        u0_m0_wo0_wi0_delayr1_replace_rdcnt_i <= u0_m0_wo0_wi0_delayr1_replace_rdcnt_i - 5;
                    ELSE
                        u0_m0_wo0_wi0_delayr1_replace_rdcnt_i <= u0_m0_wo0_wi0_delayr1_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_delayr1_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_delayr1_replace_rdcnt_i,3));


	--u0_m0_wo0_wi0_delayr1_replace_rdreg(REG,137)
    u0_m0_wo0_wi0_delayr1_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr1_replace_rdreg_q <= "000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_wi0_delayr1_replace_rdreg_q <= u0_m0_wo0_wi0_delayr1_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr1_replace_rdmux(MUX,138)
    u0_m0_wo0_wi0_delayr1_replace_rdmux_s <= xIn_v;
    u0_m0_wo0_wi0_delayr1_replace_rdmux: PROCESS (u0_m0_wo0_wi0_delayr1_replace_rdmux_s, u0_m0_wo0_wi0_delayr1_replace_rdreg_q, u0_m0_wo0_wi0_delayr1_replace_rdcnt_q)
    BEGIN
            CASE u0_m0_wo0_wi0_delayr1_replace_rdmux_s IS
                  WHEN "0" => u0_m0_wo0_wi0_delayr1_replace_rdmux_q <= u0_m0_wo0_wi0_delayr1_replace_rdreg_q;
                  WHEN "1" => u0_m0_wo0_wi0_delayr1_replace_rdmux_q <= u0_m0_wo0_wi0_delayr1_replace_rdcnt_q;
                  WHEN OTHERS => u0_m0_wo0_wi0_delayr1_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr1_replace_mem(DUALMEM,135)
    u0_m0_wo0_wi0_delayr1_replace_mem_reset0 <= areset;
    u0_m0_wo0_wi0_delayr1_replace_mem_ia <= u0_m0_wo0_wi0_join1_q;
    u0_m0_wo0_wi0_delayr1_replace_mem_aa <= u0_m0_wo0_wi0_delayr1_replace_rdreg_q;
    u0_m0_wo0_wi0_delayr1_replace_mem_ab <= u0_m0_wo0_wi0_delayr1_replace_rdmux_q;
    u0_m0_wo0_wi0_delayr1_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 6,
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
        clocken1 => u0_m0_wo0_wi0_delayr1_enaAnd_q(0),
        clocken0 => '1',
        wren_a => xIn_v(0),
        clock0 => clk,
        aclr1 => u0_m0_wo0_wi0_delayr1_replace_mem_reset0,
        clock1 => clk,
        address_b => u0_m0_wo0_wi0_delayr1_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_wi0_delayr1_replace_mem_iq,
        address_a => u0_m0_wo0_wi0_delayr1_replace_mem_aa,
        data_a => u0_m0_wo0_wi0_delayr1_replace_mem_ia
    );
        u0_m0_wo0_wi0_delayr1_replace_mem_q <= u0_m0_wo0_wi0_delayr1_replace_mem_iq(31 downto 0);

	--u0_m0_wo0_wi0_split1(BITSELECT,9)@10
    u0_m0_wo0_wi0_split1_in <= u0_m0_wo0_wi0_delayr1_replace_mem_q;
    u0_m0_wo0_wi0_split1_b <= u0_m0_wo0_wi0_split1_in(15 downto 0);
    u0_m0_wo0_wi0_split1_c <= u0_m0_wo0_wi0_split1_in(31 downto 16);

	--u0_m0_wo0_wi0_delayr4_nor(LOGICAL,168)
    u0_m0_wo0_wi0_delayr4_nor_a <= u0_m0_wo0_wi0_delayr1_notEnable_q;
    u0_m0_wo0_wi0_delayr4_nor_b <= u0_m0_wo0_wi0_delayr4_sticky_ena_q;
    u0_m0_wo0_wi0_delayr4_nor_q <= not (u0_m0_wo0_wi0_delayr4_nor_a or u0_m0_wo0_wi0_delayr4_nor_b);

	--u0_m0_wo0_wi0_delayr4_cmp(LOGICAL,165)
    u0_m0_wo0_wi0_delayr4_cmp_a <= u0_m0_wo0_wi0_delayr4_mem_top_q;
    u0_m0_wo0_wi0_delayr4_cmp_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_delayr4_replace_rdmux_q);
    u0_m0_wo0_wi0_delayr4_cmp_q <= "1" when u0_m0_wo0_wi0_delayr4_cmp_a = u0_m0_wo0_wi0_delayr4_cmp_b else "0";

	--u0_m0_wo0_wi0_delayr4_cmpReg(REG,166)
    u0_m0_wo0_wi0_delayr4_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr4_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_wi0_delayr4_cmpReg_q <= u0_m0_wo0_wi0_delayr4_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr4_sticky_ena(REG,169)
    u0_m0_wo0_wi0_delayr4_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr4_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_delayr4_nor_q = "1") THEN
                u0_m0_wo0_wi0_delayr4_sticky_ena_q <= u0_m0_wo0_wi0_delayr4_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr4_enaAnd(LOGICAL,170)
    u0_m0_wo0_wi0_delayr4_enaAnd_a <= u0_m0_wo0_wi0_delayr4_sticky_ena_q;
    u0_m0_wo0_wi0_delayr4_enaAnd_b <= xIn_v;
    u0_m0_wo0_wi0_delayr4_enaAnd_q <= u0_m0_wo0_wi0_delayr4_enaAnd_a and u0_m0_wo0_wi0_delayr4_enaAnd_b;

	--u0_m0_wo0_wi0_join4(BITJOIN,12)@10
    u0_m0_wo0_wi0_join4_q <= u0_m0_wo0_wi0_split4_b & u0_m0_wo0_wi0_delayr3_replace_mem_q;

	--u0_m0_wo0_wi0_delayr4_replace_rdcnt(COUNTER,160)
    -- every=1, low=0, high=7, step=1, init=1
    u0_m0_wo0_wi0_delayr4_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr4_replace_rdcnt_i <= TO_UNSIGNED(1,3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                    u0_m0_wo0_wi0_delayr4_replace_rdcnt_i <= u0_m0_wo0_wi0_delayr4_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_delayr4_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_delayr4_replace_rdcnt_i,3));


	--u0_m0_wo0_wi0_delayr4_replace_rdreg(REG,161)
    u0_m0_wo0_wi0_delayr4_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr4_replace_rdreg_q <= "000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_wi0_delayr4_replace_rdreg_q <= u0_m0_wo0_wi0_delayr4_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr4_replace_rdmux(MUX,162)
    u0_m0_wo0_wi0_delayr4_replace_rdmux_s <= xIn_v;
    u0_m0_wo0_wi0_delayr4_replace_rdmux: PROCESS (u0_m0_wo0_wi0_delayr4_replace_rdmux_s, u0_m0_wo0_wi0_delayr4_replace_rdreg_q, u0_m0_wo0_wi0_delayr4_replace_rdcnt_q)
    BEGIN
            CASE u0_m0_wo0_wi0_delayr4_replace_rdmux_s IS
                  WHEN "0" => u0_m0_wo0_wi0_delayr4_replace_rdmux_q <= u0_m0_wo0_wi0_delayr4_replace_rdreg_q;
                  WHEN "1" => u0_m0_wo0_wi0_delayr4_replace_rdmux_q <= u0_m0_wo0_wi0_delayr4_replace_rdcnt_q;
                  WHEN OTHERS => u0_m0_wo0_wi0_delayr4_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr4_replace_mem(DUALMEM,159)
    u0_m0_wo0_wi0_delayr4_replace_mem_reset0 <= areset;
    u0_m0_wo0_wi0_delayr4_replace_mem_ia <= u0_m0_wo0_wi0_join4_q;
    u0_m0_wo0_wi0_delayr4_replace_mem_aa <= u0_m0_wo0_wi0_delayr4_replace_rdreg_q;
    u0_m0_wo0_wi0_delayr4_replace_mem_ab <= u0_m0_wo0_wi0_delayr4_replace_rdmux_q;
    u0_m0_wo0_wi0_delayr4_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 8,
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
        clocken1 => u0_m0_wo0_wi0_delayr4_enaAnd_q(0),
        clocken0 => '1',
        wren_a => xIn_v(0),
        clock0 => clk,
        aclr1 => u0_m0_wo0_wi0_delayr4_replace_mem_reset0,
        clock1 => clk,
        address_b => u0_m0_wo0_wi0_delayr4_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_wi0_delayr4_replace_mem_iq,
        address_a => u0_m0_wo0_wi0_delayr4_replace_mem_aa,
        data_a => u0_m0_wo0_wi0_delayr4_replace_mem_ia
    );
        u0_m0_wo0_wi0_delayr4_replace_mem_q <= u0_m0_wo0_wi0_delayr4_replace_mem_iq(31 downto 0);

	--u0_m0_wo0_wi0_split4(BITSELECT,13)@10
    u0_m0_wo0_wi0_split4_in <= u0_m0_wo0_wi0_delayr4_replace_mem_q;
    u0_m0_wo0_wi0_split4_b <= u0_m0_wo0_wi0_split4_in(15 downto 0);
    u0_m0_wo0_wi0_split4_c <= u0_m0_wo0_wi0_split4_in(31 downto 16);

	--u0_m0_wo0_cma0(CHAINMULTADD,21)@10
    u0_m0_wo0_cma0_l(0) <= RESIZE(u0_m0_wo0_cma0_a(0),17) + RESIZE(u0_m0_wo0_cma0_b(0),17);
    u0_m0_wo0_cma0_l(1) <= RESIZE(u0_m0_wo0_cma0_a(1),17) + RESIZE(u0_m0_wo0_cma0_b(1),17);
    u0_m0_wo0_cma0_l(2) <= RESIZE(u0_m0_wo0_cma0_a(2),17) + RESIZE(u0_m0_wo0_cma0_b(2),17);
    u0_m0_wo0_cma0_l(3) <= RESIZE(u0_m0_wo0_cma0_a(3),17) + RESIZE(u0_m0_wo0_cma0_b(3),17);
--altera synthesis_off
    u0_m0_wo0_cma0_k0 <= (
        0 => TO_SIGNED(214,15),
        others => (others => '0'));
    u0_m0_wo0_cma0_k1 <= (
        0 => TO_SIGNED(-1663,15),
        others => (others => '0'));
    u0_m0_wo0_cma0_k2 <= (
        0 => TO_SIGNED(9641,15),
        others => (others => '0'));
    u0_m0_wo0_cma0_k3 <= (
        others => (others => '0'));
--altera synthesis_on
    u0_m0_wo0_cma0_r(0) <= u0_m0_wo0_cma0_k0(TO_INTEGER(u0_m0_wo0_cma0_c(0)));
    u0_m0_wo0_cma0_r(1) <= u0_m0_wo0_cma0_k1(TO_INTEGER(u0_m0_wo0_cma0_c(1)));
    u0_m0_wo0_cma0_r(2) <= u0_m0_wo0_cma0_k2(TO_INTEGER(u0_m0_wo0_cma0_c(2)));
    u0_m0_wo0_cma0_r(3) <= u0_m0_wo0_cma0_k3(TO_INTEGER(u0_m0_wo0_cma0_c(3)));
    u0_m0_wo0_cma0_p(0) <= u0_m0_wo0_cma0_l(0) * u0_m0_wo0_cma0_r(0);
    u0_m0_wo0_cma0_p(1) <= u0_m0_wo0_cma0_l(1) * u0_m0_wo0_cma0_r(1);
    u0_m0_wo0_cma0_p(2) <= u0_m0_wo0_cma0_l(2) * u0_m0_wo0_cma0_r(2);
    u0_m0_wo0_cma0_p(3) <= u0_m0_wo0_cma0_l(3) * u0_m0_wo0_cma0_r(3);
    u0_m0_wo0_cma0_w(0) <= RESIZE(u0_m0_wo0_cma0_p(0),34);
    u0_m0_wo0_cma0_w(1) <= RESIZE(u0_m0_wo0_cma0_p(1),34);
    u0_m0_wo0_cma0_w(2) <= RESIZE(u0_m0_wo0_cma0_p(2),34);
    u0_m0_wo0_cma0_w(3) <= RESIZE(u0_m0_wo0_cma0_p(3),34);
    u0_m0_wo0_cma0_x(0) <= u0_m0_wo0_cma0_w(0);
    u0_m0_wo0_cma0_x(1) <= u0_m0_wo0_cma0_w(1);
    u0_m0_wo0_cma0_x(2) <= u0_m0_wo0_cma0_w(2);
    u0_m0_wo0_cma0_x(3) <= u0_m0_wo0_cma0_w(3);
    u0_m0_wo0_cma0_y(0) <= u0_m0_wo0_cma0_s(1) + u0_m0_wo0_cma0_x(0);
    u0_m0_wo0_cma0_y(1) <= u0_m0_wo0_cma0_s(2) + u0_m0_wo0_cma0_x(1);
    u0_m0_wo0_cma0_y(2) <= u0_m0_wo0_cma0_s(3) + u0_m0_wo0_cma0_x(2);
    u0_m0_wo0_cma0_y(3) <= u0_m0_wo0_cma0_x(3);
    u0_m0_wo0_cma0_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cma0_a <= (others => (others => '0'));
            u0_m0_wo0_cma0_b <= (others => (others => '0'));
            u0_m0_wo0_cma0_c <= (others => (others => '0'));
            u0_m0_wo0_cma0_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_cma0_a(0) <= SIGNED(RESIZE(SIGNED(xIn_0),16));
                u0_m0_wo0_cma0_a(1) <= SIGNED(RESIZE(SIGNED(u0_m0_wo0_wi0_split1_b),16));
                u0_m0_wo0_cma0_a(2) <= SIGNED(RESIZE(SIGNED(u0_m0_wo0_wi0_split1_c),16));
                u0_m0_wo0_cma0_a(3) <= (others => '0');
                u0_m0_wo0_cma0_b(0) <= SIGNED(RESIZE(SIGNED(u0_m0_wo0_wi0_split4_c),16));
                u0_m0_wo0_cma0_b(1) <= SIGNED(RESIZE(SIGNED(u0_m0_wo0_wi0_split4_b),16));
                u0_m0_wo0_cma0_b(2) <= SIGNED(RESIZE(SIGNED(u0_m0_wo0_wi0_delayr3_replace_mem_q),16));
                u0_m0_wo0_cma0_b(3) <= (others => '0');
                u0_m0_wo0_cma0_c(0) <= UNSIGNED(RESIZE(UNSIGNED(GND_q),3));
                u0_m0_wo0_cma0_c(1) <= UNSIGNED(RESIZE(UNSIGNED(GND_q),3));
                u0_m0_wo0_cma0_c(2) <= UNSIGNED(RESIZE(UNSIGNED(GND_q),3));
                u0_m0_wo0_cma0_c(3) <= (others => '0');
            END IF;
            IF (d_in0_m0_wi0_wo0_assign_sel_q_11_q = "1") THEN
                u0_m0_wo0_cma0_s(0) <= u0_m0_wo0_cma0_y(0);
                u0_m0_wo0_cma0_s(1) <= u0_m0_wo0_cma0_y(1);
                u0_m0_wo0_cma0_s(2) <= u0_m0_wo0_cma0_y(2);
                u0_m0_wo0_cma0_s(3) <= u0_m0_wo0_cma0_y(3);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_cma0_s0 <= STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_cma0_s(0),34));
    u0_m0_wo0_cma0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cma0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_cma0_q <= u0_m0_wo0_cma0_s0;
        END IF;
    END PROCESS;

	--d_u0_m0_wo0_cma0_q_14(DELAY,114)@13
    d_u0_m0_wo0_cma0_q_14 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_cma0_q, xout => d_u0_m0_wo0_cma0_q_14_q, clk => clk, aclr => areset );

	--out1_wo0_data_selector(SELECTOR,80)@14
    out1_wo0_data_selector: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            out1_wo0_data_selector_q <= (others => '0');
            out1_wo0_data_selector_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            out1_wo0_data_selector_q <= STD_LOGIC_VECTOR((33 downto 30 => d_u0_m1_wo0_mtree_mult1_0_shift0_q_14_q(29)) & d_u0_m1_wo0_mtree_mult1_0_shift0_q_14_q);
            out1_wo0_data_selector_v <= (others => '0');
            IF (out1_m1_wo0_lineup_select_0_q = "1") THEN
                out1_wo0_data_selector_q <= STD_LOGIC_VECTOR((33 downto 30 => d_u0_m1_wo0_mtree_mult1_0_shift0_q_14_q(29)) & d_u0_m1_wo0_mtree_mult1_0_shift0_q_14_q);
                out1_wo0_data_selector_v <= "1";
            END IF;
            IF (out1_m0_wo0_lineup_select_0_q = "1") THEN
                out1_wo0_data_selector_q <= d_u0_m0_wo0_cma0_q_14_q;
                out1_wo0_data_selector_v <= "1";
            END IF;
        END IF;
    END PROCESS;


	--out0_m1_wo0_lineup_0_replace_mem(DUALMEM,277)
    out0_m1_wo0_lineup_0_replace_mem_reset0 <= areset;
    out0_m1_wo0_lineup_0_replace_mem_ia <= u0_m1_wo0_mtree_mult1_0_shift0_q;
    out0_m1_wo0_lineup_0_replace_mem_aa <= u0_m1_wo0_wi0_phasedelay0_replace_rdreg_q;
    out0_m1_wo0_lineup_0_replace_mem_ab <= u0_m1_wo0_wi0_phasedelay0_replace_rdmux_q;
    out0_m1_wo0_lineup_0_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 30,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 30,
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
        clocken1 => u0_m1_wo0_wi0_phasedelay0_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => out0_m1_wo0_lineup_0_replace_mem_reset0,
        clock1 => clk,
        address_b => out0_m1_wo0_lineup_0_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => out0_m1_wo0_lineup_0_replace_mem_iq,
        address_a => out0_m1_wo0_lineup_0_replace_mem_aa,
        data_a => out0_m1_wo0_lineup_0_replace_mem_ia
    );
        out0_m1_wo0_lineup_0_replace_mem_q <= out0_m1_wo0_lineup_0_replace_mem_iq(29 downto 0);

	--out0_m0_wo0_lineup_0_replace_mem(DUALMEM,265)
    out0_m0_wo0_lineup_0_replace_mem_reset0 <= areset;
    out0_m0_wo0_lineup_0_replace_mem_ia <= u0_m0_wo0_cma0_q;
    out0_m0_wo0_lineup_0_replace_mem_aa <= u0_m1_wo0_wi0_phasedelay0_replace_rdreg_q;
    out0_m0_wo0_lineup_0_replace_mem_ab <= u0_m1_wo0_wi0_phasedelay0_replace_rdmux_q;
    out0_m0_wo0_lineup_0_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 34,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 34,
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
        clocken1 => u0_m1_wo0_wi0_phasedelay0_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => out0_m0_wo0_lineup_0_replace_mem_reset0,
        clock1 => clk,
        address_b => out0_m0_wo0_lineup_0_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => out0_m0_wo0_lineup_0_replace_mem_iq,
        address_a => out0_m0_wo0_lineup_0_replace_mem_aa,
        data_a => out0_m0_wo0_lineup_0_replace_mem_ia
    );
        out0_m0_wo0_lineup_0_replace_mem_q <= out0_m0_wo0_lineup_0_replace_mem_iq(33 downto 0);

	--out0_wo0_data_selector(SELECTOR,71)@13
    out0_wo0_data_selector: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            out0_wo0_data_selector_q <= (others => '0');
            out0_wo0_data_selector_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            out0_wo0_data_selector_q <= STD_LOGIC_VECTOR((33 downto 30 => out0_m1_wo0_lineup_0_replace_mem_q(29)) & out0_m1_wo0_lineup_0_replace_mem_q);
            out0_wo0_data_selector_v <= (others => '0');
            IF (out0_m1_wo0_lineup_select_delay_0_q = "1") THEN
                out0_wo0_data_selector_q <= STD_LOGIC_VECTOR((33 downto 30 => out0_m1_wo0_lineup_0_replace_mem_q(29)) & out0_m1_wo0_lineup_0_replace_mem_q);
                out0_wo0_data_selector_v <= "1";
            END IF;
            IF (out0_m0_wo0_lineup_select_delay_0_q = "1") THEN
                out0_wo0_data_selector_q <= out0_m0_wo0_lineup_0_replace_mem_q;
                out0_wo0_data_selector_v <= "1";
            END IF;
        END IF;
    END PROCESS;


	--d_out0_wo0_data_selector_q_15(DELAY,122)@14
    d_out0_wo0_data_selector_q_15 : dspba_delay
    GENERIC MAP ( width => 34, depth => 1 )
    PORT MAP ( xin => out0_wo0_data_selector_q, xout => d_out0_wo0_data_selector_q_15_q, clk => clk, aclr => areset );

	--outchan(COUNTER,103)@14
    -- every=1, low=0, high=3, step=1, init=3
    outchan: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outchan_i <= TO_UNSIGNED(3,2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (out0_wo0_data_selector_v = "1") THEN
                    outchan_i <= outchan_i + 1;
            END IF;
        END IF;
    END PROCESS;
    outchan_q <= STD_LOGIC_VECTOR(RESIZE(outchan_i,3));


	--d_out0_wo0_data_selector_v_15(DELAY,123)@14
    d_out0_wo0_data_selector_v_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => out0_wo0_data_selector_v, xout => d_out0_wo0_data_selector_v_15_q, clk => clk, aclr => areset );

	--xOut(PORTOUT,104)@15
    xOut_v <= d_out0_wo0_data_selector_v_15_q;
    xOut_c <= STD_LOGIC_VECTOR("00000" & outchan_q);
    xOut_0 <= STD_LOGIC_VECTOR((34 downto 34 => d_out0_wo0_data_selector_q_15_q(33)) & d_out0_wo0_data_selector_q_15_q);
    xOut_1 <= STD_LOGIC_VECTOR((34 downto 34 => out1_wo0_data_selector_q(33)) & out1_wo0_data_selector_q);
    xOut_2 <= STD_LOGIC_VECTOR((34 downto 34 => out2_wo0_data_selector_q(33)) & out2_wo0_data_selector_q);
    xOut_3 <= STD_LOGIC_VECTOR((34 downto 34 => out3_wo0_data_selector_q(33)) & out3_wo0_data_selector_q);


end normal;
