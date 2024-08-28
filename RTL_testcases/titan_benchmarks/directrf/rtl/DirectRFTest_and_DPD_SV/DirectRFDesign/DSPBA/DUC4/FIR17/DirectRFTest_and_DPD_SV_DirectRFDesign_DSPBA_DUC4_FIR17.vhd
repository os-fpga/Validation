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

-- VHDL created from DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR17
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
entity DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR17 is
    port (
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        xIn_0 : in std_logic_vector(11 downto 0);
        xOut_v : out std_logic_vector(0 downto 0);
        xOut_c : out std_logic_vector(7 downto 0);
        xOut_0 : out std_logic_vector(30 downto 0);
        xOut_1 : out std_logic_vector(30 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR17 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_sel_q_11_q : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_sel_q_13_q : std_logic_vector (0 downto 0);
    type u0_m0_wo0_cma0_a_type is array(0 to 3) of SIGNED(11 downto 0);
    signal u0_m0_wo0_cma0_a : u0_m0_wo0_cma0_a_type;
    type u0_m0_wo0_cma0_b_type is array(0 to 3) of SIGNED(11 downto 0);
    signal u0_m0_wo0_cma0_b : u0_m0_wo0_cma0_b_type;
    type u0_m0_wo0_cma0_c_type is array(0 to 3) of UNSIGNED(2 downto 0);
    signal u0_m0_wo0_cma0_c : u0_m0_wo0_cma0_c_type;
    type u0_m0_wo0_cma0_l_type is array(0 to 3) of SIGNED(12 downto 0);
    signal u0_m0_wo0_cma0_l : u0_m0_wo0_cma0_l_type;
    type u0_m0_wo0_cma0_r_type is array(0 to 3) of SIGNED(14 downto 0);
    signal u0_m0_wo0_cma0_r : u0_m0_wo0_cma0_r_type;
    type u0_m0_wo0_cma0_p_type is array(0 to 3) of SIGNED(27 downto 0);
    signal u0_m0_wo0_cma0_p : u0_m0_wo0_cma0_p_type;
    type u0_m0_wo0_cma0_w_type is array(0 to 3) of SIGNED(29 downto 0);
    signal u0_m0_wo0_cma0_w : u0_m0_wo0_cma0_w_type;
    type u0_m0_wo0_cma0_x_type is array(0 to 3) of SIGNED(29 downto 0);
    signal u0_m0_wo0_cma0_x : u0_m0_wo0_cma0_x_type;
    type u0_m0_wo0_cma0_y_type is array(0 to 3) of SIGNED(29 downto 0);
    signal u0_m0_wo0_cma0_y : u0_m0_wo0_cma0_y_type;
    type u0_m0_wo0_cma0_romtype is array(0 to 7) of SIGNED(14 downto 0);
    signal u0_m0_wo0_cma0_k0 : u0_m0_wo0_cma0_romtype := (
        0 => TO_SIGNED(-74,15),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k1 : u0_m0_wo0_cma0_romtype := (
        0 => TO_SIGNED(533,15),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k2 : u0_m0_wo0_cma0_romtype := (
        0 => TO_SIGNED(-2186,15),
        others => (others => '0'));
    signal u0_m0_wo0_cma0_k3 : u0_m0_wo0_cma0_romtype := (
        0 => TO_SIGNED(9919,15),
        others => (others => '0'));
    type u0_m0_wo0_cma0_s_type is array(0 to 3) of SIGNED(29 downto 0);
    signal u0_m0_wo0_cma0_s : u0_m0_wo0_cma0_s_type;
    signal u0_m0_wo0_cma0_s0 : std_logic_vector(29 downto 0);
    signal u0_m0_wo0_cma0_q : std_logic_vector (29 downto 0);
    signal d_u0_m0_wo0_cma0_q_14_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_oseq_gated_reg_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_oseq_gated_reg_q_13_q : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_oseq_gated_reg_q_14_q : std_logic_vector (0 downto 0);
    signal u0_m1_wo0_memread_q : std_logic_vector (0 downto 0);
    signal u0_m1_wo0_oseq_gated_reg_q : std_logic_vector (0 downto 0);
    signal d_u0_m1_wo0_oseq_gated_reg_q_13_q : std_logic_vector (0 downto 0);
    signal d_u0_m1_wo0_oseq_gated_reg_q_14_q : std_logic_vector (0 downto 0);
    signal out0_m0_wo0_lineup_select_seq_0_q : std_logic_vector(0 downto 0);
    signal out0_m0_wo0_lineup_select_seq_0_eq : std_logic;
    signal out0_m0_wo0_lineup_select_delay_0_q : std_logic_vector (0 downto 0);
    signal out0_m1_wo0_lineup_select_seq_0_q : std_logic_vector(0 downto 0);
    signal out0_m1_wo0_lineup_select_seq_0_eq : std_logic;
    signal out0_m1_wo0_lineup_select_delay_0_q : std_logic_vector (0 downto 0);
    signal out0_wo0_data_selector_q : std_logic_vector (29 downto 0);
    signal out0_wo0_data_selector_v : std_logic_vector (0 downto 0);
    signal d_out0_wo0_data_selector_v_15_q : std_logic_vector (0 downto 0);
    signal d_out0_wo0_data_selector_q_15_q : std_logic_vector (29 downto 0);
    signal out1_m0_wo0_lineup_select_seq_0_q : std_logic_vector(0 downto 0);
    signal out1_m0_wo0_lineup_select_seq_0_eq : std_logic;
    signal out1_m1_wo0_lineup_select_seq_0_q : std_logic_vector(0 downto 0);
    signal out1_m1_wo0_lineup_select_seq_0_eq : std_logic;
    signal out1_wo0_data_selector_q : std_logic_vector (29 downto 0);
    signal out1_wo0_data_selector_v : std_logic_vector (0 downto 0);
    signal outchan_q : std_logic_vector(3 downto 0);
    signal outchan_i : unsigned(2 downto 0);
    signal d_u0_m1_wo0_mtree_mult1_0_shift0_q_14_q : std_logic_vector (25 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_reset0 : std_logic;
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdcnt_i : unsigned(0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_cmpReg_q : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_sticky_ena_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_mem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_delayr1_replace_mem_iq : std_logic_vector (35 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_mem_ia : std_logic_vector (35 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_mem_ir : std_logic_vector (35 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_mem_aa : std_logic_vector (3 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_mem_ab : std_logic_vector (3 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_mem_q : std_logic_vector (35 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_rdcnt_i : unsigned(3 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_rdcnt_eq : std_logic;
    signal u0_m0_wo0_wi0_delayr1_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal u0_m0_wo0_wi0_delayr1_mem_top_q : std_logic_vector (4 downto 0);
    signal u0_m0_wo0_wi0_delayr1_cmpReg_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_sticky_ena_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr4_replace_mem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_delayr4_replace_mem_iq : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_wi0_delayr4_replace_mem_ia : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_wi0_delayr4_replace_mem_ir : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_wi0_delayr4_replace_mem_aa : std_logic_vector (3 downto 0);
    signal u0_m0_wo0_wi0_delayr4_replace_mem_ab : std_logic_vector (3 downto 0);
    signal u0_m0_wo0_wi0_delayr4_replace_mem_q : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_wi0_delayr4_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal u0_m0_wo0_wi0_delayr4_replace_rdcnt_i : unsigned(3 downto 0);
    signal u0_m0_wo0_wi0_delayr4_replace_rdcnt_eq : std_logic;
    signal u0_m0_wo0_wi0_delayr4_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal u0_m0_wo0_wi0_delayr4_mem_top_q : std_logic_vector (4 downto 0);
    signal u0_m0_wo0_wi0_delayr4_cmpReg_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr4_sticky_ena_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr5_replace_mem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_delayr5_replace_mem_iq : std_logic_vector (35 downto 0);
    signal u0_m0_wo0_wi0_delayr5_replace_mem_ia : std_logic_vector (35 downto 0);
    signal u0_m0_wo0_wi0_delayr5_replace_mem_ir : std_logic_vector (35 downto 0);
    signal u0_m0_wo0_wi0_delayr5_replace_mem_aa : std_logic_vector (3 downto 0);
    signal u0_m0_wo0_wi0_delayr5_replace_mem_ab : std_logic_vector (3 downto 0);
    signal u0_m0_wo0_wi0_delayr5_replace_mem_q : std_logic_vector (35 downto 0);
    signal u0_m0_wo0_wi0_delayr5_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal u0_m0_wo0_wi0_delayr5_replace_rdcnt_i : unsigned(3 downto 0);
    signal u0_m0_wo0_wi0_delayr5_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal u0_m0_wo0_wi0_delayr5_mem_top_q : std_logic_vector (4 downto 0);
    signal u0_m0_wo0_wi0_delayr5_cmpReg_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr5_sticky_ena_q : std_logic_vector (0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_replace_mem_reset0 : std_logic;
    signal u0_m1_wo0_wi0_delayr0_replace_mem_iq : std_logic_vector (11 downto 0);
    signal u0_m1_wo0_wi0_delayr0_replace_mem_ia : std_logic_vector (11 downto 0);
    signal u0_m1_wo0_wi0_delayr0_replace_mem_ir : std_logic_vector (11 downto 0);
    signal u0_m1_wo0_wi0_delayr0_replace_mem_aa : std_logic_vector (5 downto 0);
    signal u0_m1_wo0_wi0_delayr0_replace_mem_ab : std_logic_vector (5 downto 0);
    signal u0_m1_wo0_wi0_delayr0_replace_mem_q : std_logic_vector (11 downto 0);
    signal u0_m1_wo0_wi0_delayr0_replace_rdcnt_q : std_logic_vector(5 downto 0);
    signal u0_m1_wo0_wi0_delayr0_replace_rdcnt_i : unsigned(5 downto 0);
    signal u0_m1_wo0_wi0_delayr0_replace_rdcnt_eq : std_logic;
    signal u0_m1_wo0_wi0_delayr0_replace_rdreg_q : std_logic_vector (5 downto 0);
    signal u0_m1_wo0_wi0_delayr0_mem_top_q : std_logic_vector (6 downto 0);
    signal u0_m1_wo0_wi0_delayr0_cmpReg_q : std_logic_vector (0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_sticky_ena_q : std_logic_vector (0 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_replace_mem_reset0 : std_logic;
    signal u0_m1_wo0_wi0_phasedelay0_replace_mem_iq : std_logic_vector (11 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_replace_mem_ia : std_logic_vector (11 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_replace_mem_ir : std_logic_vector (11 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_replace_mem_aa : std_logic_vector (2 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_replace_mem_ab : std_logic_vector (2 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_replace_mem_q : std_logic_vector (11 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_i : unsigned(2 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_eq : std_logic;
    signal u0_m1_wo0_wi0_phasedelay0_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_mem_top_q : std_logic_vector (3 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_cmpReg_q : std_logic_vector (0 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_sticky_ena_q : std_logic_vector (0 downto 0);
    signal out0_m0_wo0_lineup_0_replace_mem_reset0 : std_logic;
    signal out0_m0_wo0_lineup_0_replace_mem_iq : std_logic_vector (29 downto 0);
    signal out0_m0_wo0_lineup_0_replace_mem_ia : std_logic_vector (29 downto 0);
    signal out0_m0_wo0_lineup_0_replace_mem_ir : std_logic_vector (29 downto 0);
    signal out0_m0_wo0_lineup_0_replace_mem_aa : std_logic_vector (2 downto 0);
    signal out0_m0_wo0_lineup_0_replace_mem_ab : std_logic_vector (2 downto 0);
    signal out0_m0_wo0_lineup_0_replace_mem_q : std_logic_vector (29 downto 0);
    signal out0_m1_wo0_lineup_0_replace_mem_reset0 : std_logic;
    signal out0_m1_wo0_lineup_0_replace_mem_iq : std_logic_vector (25 downto 0);
    signal out0_m1_wo0_lineup_0_replace_mem_ia : std_logic_vector (25 downto 0);
    signal out0_m1_wo0_lineup_0_replace_mem_ir : std_logic_vector (25 downto 0);
    signal out0_m1_wo0_lineup_0_replace_mem_aa : std_logic_vector (2 downto 0);
    signal out0_m1_wo0_lineup_0_replace_mem_ab : std_logic_vector (2 downto 0);
    signal out0_m1_wo0_lineup_0_replace_mem_q : std_logic_vector (25 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_notEnable_a : std_logic_vector(0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_notEnable_q : std_logic_vector(0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_enaAnd_a : std_logic_vector(0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_enaAnd_b : std_logic_vector(0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_data_q_13_enaAnd_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal u0_m0_wo0_wi0_delayr4_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr4_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal u0_m0_wo0_wi0_delayr5_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi0_delayr5_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal u0_m1_wo0_wi0_delayr0_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_replace_rdmux_q : std_logic_vector (5 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_enaAnd_a : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_enaAnd_b : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_enaAnd_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_notEnable_a : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_notEnable_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_enaAnd_a : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_enaAnd_b : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_enaAnd_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr4_enaAnd_a : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr4_enaAnd_b : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr4_enaAnd_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr5_enaAnd_a : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr5_enaAnd_b : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr5_enaAnd_q : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_notEnable_a : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_notEnable_q : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_enaAnd_a : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_enaAnd_b : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_enaAnd_q : std_logic_vector(0 downto 0);
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
    signal u0_m0_wo0_wi0_split1_in : std_logic_vector (35 downto 0);
    signal u0_m0_wo0_wi0_split1_b : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_wi0_split1_c : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_wi0_split1_d : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_wi0_delayr1_cmp_a : std_logic_vector(4 downto 0);
    signal u0_m0_wo0_wi0_delayr1_cmp_b : std_logic_vector(4 downto 0);
    signal u0_m0_wo0_wi0_delayr1_cmp_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_nor_a : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_nor_b : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr1_nor_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr4_cmp_a : std_logic_vector(4 downto 0);
    signal u0_m0_wo0_wi0_delayr4_cmp_b : std_logic_vector(4 downto 0);
    signal u0_m0_wo0_wi0_delayr4_cmp_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr4_nor_a : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr4_nor_b : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr4_nor_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_split5_in : std_logic_vector (35 downto 0);
    signal u0_m0_wo0_wi0_split5_b : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_wi0_split5_c : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_wi0_split5_d : std_logic_vector (11 downto 0);
    signal u0_m0_wo0_wi0_delayr5_cmp_a : std_logic_vector(4 downto 0);
    signal u0_m0_wo0_wi0_delayr5_cmp_b : std_logic_vector(4 downto 0);
    signal u0_m0_wo0_wi0_delayr5_cmp_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr5_nor_a : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr5_nor_b : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_delayr5_nor_q : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_cmp_a : std_logic_vector(6 downto 0);
    signal u0_m1_wo0_wi0_delayr0_cmp_b : std_logic_vector(6 downto 0);
    signal u0_m1_wo0_wi0_delayr0_cmp_q : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_nor_a : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_nor_b : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_delayr0_nor_q : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_mtree_mult1_0_shift0_q_int : std_logic_vector (25 downto 0);
    signal u0_m1_wo0_mtree_mult1_0_shift0_q : std_logic_vector (25 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_cmp_a : std_logic_vector(3 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_cmp_b : std_logic_vector(3 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_cmp_q : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_nor_a : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_nor_b : std_logic_vector(0 downto 0);
    signal u0_m1_wo0_wi0_phasedelay0_nor_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_wi0_join1_q : std_logic_vector (35 downto 0);
    signal u0_m0_wo0_wi0_join5_q : std_logic_vector (35 downto 0);
begin


	--d_in0_m0_wi0_wo0_assign_data_q_13_notEnable(LOGICAL,76)
    d_in0_m0_wi0_wo0_assign_data_q_13_notEnable_a <= VCC_q;
    d_in0_m0_wi0_wo0_assign_data_q_13_notEnable_q <= not d_in0_m0_wi0_wo0_assign_data_q_13_notEnable_a;

	--u0_m1_wo0_wi0_phasedelay0_nor(LOGICAL,137)
    u0_m1_wo0_wi0_phasedelay0_nor_a <= d_in0_m0_wi0_wo0_assign_data_q_13_notEnable_q;
    u0_m1_wo0_wi0_phasedelay0_nor_b <= u0_m1_wo0_wi0_phasedelay0_sticky_ena_q;
    u0_m1_wo0_wi0_phasedelay0_nor_q <= not (u0_m1_wo0_wi0_phasedelay0_nor_a or u0_m1_wo0_wi0_phasedelay0_nor_b);

	--u0_m1_wo0_wi0_phasedelay0_mem_top(CONSTANT,133)
    u0_m1_wo0_wi0_phasedelay0_mem_top_q <= "0110";

	--u0_m1_wo0_wi0_phasedelay0_cmp(LOGICAL,134)
    u0_m1_wo0_wi0_phasedelay0_cmp_a <= u0_m1_wo0_wi0_phasedelay0_mem_top_q;
    u0_m1_wo0_wi0_phasedelay0_cmp_b <= STD_LOGIC_VECTOR("0" & u0_m1_wo0_wi0_phasedelay0_replace_rdmux_q);
    u0_m1_wo0_wi0_phasedelay0_cmp_q <= "1" when u0_m1_wo0_wi0_phasedelay0_cmp_a = u0_m1_wo0_wi0_phasedelay0_cmp_b else "0";

	--u0_m1_wo0_wi0_phasedelay0_cmpReg(REG,135)
    u0_m1_wo0_wi0_phasedelay0_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_wi0_phasedelay0_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m1_wo0_wi0_phasedelay0_cmpReg_q <= u0_m1_wo0_wi0_phasedelay0_cmp_q;
        END IF;
    END PROCESS;


	--u0_m1_wo0_wi0_phasedelay0_sticky_ena(REG,138)
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


	--u0_m1_wo0_wi0_phasedelay0_enaAnd(LOGICAL,139)
    u0_m1_wo0_wi0_phasedelay0_enaAnd_a <= u0_m1_wo0_wi0_phasedelay0_sticky_ena_q;
    u0_m1_wo0_wi0_phasedelay0_enaAnd_b <= VCC_q;
    u0_m1_wo0_wi0_phasedelay0_enaAnd_q <= u0_m1_wo0_wi0_phasedelay0_enaAnd_a and u0_m1_wo0_wi0_phasedelay0_enaAnd_b;

	--u0_m1_wo0_wi0_delayr0_notEnable(LOGICAL,124)
    u0_m1_wo0_wi0_delayr0_notEnable_a <= d_in0_m0_wi0_wo0_assign_sel_q_13_q;
    u0_m1_wo0_wi0_delayr0_notEnable_q <= not u0_m1_wo0_wi0_delayr0_notEnable_a;

	--u0_m1_wo0_wi0_delayr0_nor(LOGICAL,125)
    u0_m1_wo0_wi0_delayr0_nor_a <= u0_m1_wo0_wi0_delayr0_notEnable_q;
    u0_m1_wo0_wi0_delayr0_nor_b <= u0_m1_wo0_wi0_delayr0_sticky_ena_q;
    u0_m1_wo0_wi0_delayr0_nor_q <= not (u0_m1_wo0_wi0_delayr0_nor_a or u0_m1_wo0_wi0_delayr0_nor_b);

	--u0_m1_wo0_wi0_delayr0_mem_top(CONSTANT,121)
    u0_m1_wo0_wi0_delayr0_mem_top_q <= "0101110";

	--u0_m1_wo0_wi0_delayr0_cmp(LOGICAL,122)
    u0_m1_wo0_wi0_delayr0_cmp_a <= u0_m1_wo0_wi0_delayr0_mem_top_q;
    u0_m1_wo0_wi0_delayr0_cmp_b <= STD_LOGIC_VECTOR("0" & u0_m1_wo0_wi0_delayr0_replace_rdmux_q);
    u0_m1_wo0_wi0_delayr0_cmp_q <= "1" when u0_m1_wo0_wi0_delayr0_cmp_a = u0_m1_wo0_wi0_delayr0_cmp_b else "0";

	--u0_m1_wo0_wi0_delayr0_cmpReg(REG,123)
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


	--u0_m1_wo0_wi0_delayr0_sticky_ena(REG,126)
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


	--u0_m1_wo0_wi0_delayr0_enaAnd(LOGICAL,127)
    u0_m1_wo0_wi0_delayr0_enaAnd_a <= u0_m1_wo0_wi0_delayr0_sticky_ena_q;
    u0_m1_wo0_wi0_delayr0_enaAnd_b <= d_in0_m0_wi0_wo0_assign_sel_q_13_q;
    u0_m1_wo0_wi0_delayr0_enaAnd_q <= u0_m1_wo0_wi0_delayr0_enaAnd_a and u0_m1_wo0_wi0_delayr0_enaAnd_b;

	--d_in0_m0_wi0_wo0_assign_data_q_13_nor(LOGICAL,77)
    d_in0_m0_wi0_wo0_assign_data_q_13_nor_a <= d_in0_m0_wi0_wo0_assign_data_q_13_notEnable_q;
    d_in0_m0_wi0_wo0_assign_data_q_13_nor_b <= d_in0_m0_wi0_wo0_assign_data_q_13_sticky_ena_q;
    d_in0_m0_wi0_wo0_assign_data_q_13_nor_q <= not (d_in0_m0_wi0_wo0_assign_data_q_13_nor_a or d_in0_m0_wi0_wo0_assign_data_q_13_nor_b);

	--d_in0_m0_wi0_wo0_assign_data_q_13_cmpReg(REG,75)
    d_in0_m0_wi0_wo0_assign_data_q_13_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_in0_m0_wi0_wo0_assign_data_q_13_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_in0_m0_wi0_wo0_assign_data_q_13_cmpReg_q <= VCC_q;
        END IF;
    END PROCESS;


	--d_in0_m0_wi0_wo0_assign_data_q_13_sticky_ena(REG,78)
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


	--d_in0_m0_wi0_wo0_assign_data_q_13_enaAnd(LOGICAL,79)
    d_in0_m0_wi0_wo0_assign_data_q_13_enaAnd_a <= d_in0_m0_wi0_wo0_assign_data_q_13_sticky_ena_q;
    d_in0_m0_wi0_wo0_assign_data_q_13_enaAnd_b <= VCC_q;
    d_in0_m0_wi0_wo0_assign_data_q_13_enaAnd_q <= d_in0_m0_wi0_wo0_assign_data_q_13_enaAnd_a and d_in0_m0_wi0_wo0_assign_data_q_13_enaAnd_b;

	--xIn(PORTIN,2)@10

	--d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdcnt(COUNTER,71)
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


	--d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdreg(REG,72)
    d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdreg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdreg_q <= d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux(MUX,73)
    d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux_s <= VCC_q;
    d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux: PROCESS (d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux_s, d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdreg_q, d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdcnt_q)
    BEGIN
            CASE d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux_s IS
                  WHEN "0" => d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux_q <= d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdreg_q;
                  WHEN "1" => d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux_q <= d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdcnt_q;
                  WHEN OTHERS => d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem(DUALMEM,70)
    d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_reset0 <= areset;
    d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_ia <= xIn_0;
    d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_aa <= d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdreg_q;
    d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_ab <= d_in0_m0_wi0_wo0_assign_data_q_13_replace_rdmux_q;
    d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 12,
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
        d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_q <= d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_iq(11 downto 0);

	--u0_m1_wo0_wi0_delayr0_replace_rdcnt(COUNTER,117)
    -- every=1, low=0, high=46, step=1, init=1
    u0_m1_wo0_wi0_delayr0_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_wi0_delayr0_replace_rdcnt_i <= TO_UNSIGNED(1,6);
            u0_m1_wo0_wi0_delayr0_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_sel_q_13_q = "1") THEN
                    IF u0_m1_wo0_wi0_delayr0_replace_rdcnt_i = 45 THEN
                      u0_m1_wo0_wi0_delayr0_replace_rdcnt_eq <= '1';
                    ELSE
                      u0_m1_wo0_wi0_delayr0_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (u0_m1_wo0_wi0_delayr0_replace_rdcnt_eq = '1') THEN
                        u0_m1_wo0_wi0_delayr0_replace_rdcnt_i <= u0_m1_wo0_wi0_delayr0_replace_rdcnt_i - 46;
                    ELSE
                        u0_m1_wo0_wi0_delayr0_replace_rdcnt_i <= u0_m1_wo0_wi0_delayr0_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m1_wo0_wi0_delayr0_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(u0_m1_wo0_wi0_delayr0_replace_rdcnt_i,6));


	--u0_m1_wo0_wi0_delayr0_replace_rdreg(REG,118)
    u0_m1_wo0_wi0_delayr0_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_wi0_delayr0_replace_rdreg_q <= "000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_sel_q_13_q = "1") THEN
                u0_m1_wo0_wi0_delayr0_replace_rdreg_q <= u0_m1_wo0_wi0_delayr0_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--d_in0_m0_wi0_wo0_assign_sel_q_11(DELAY,59)@10
    d_in0_m0_wi0_wo0_assign_sel_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => xIn_v, xout => d_in0_m0_wi0_wo0_assign_sel_q_11_q, clk => clk, aclr => areset );

	--d_in0_m0_wi0_wo0_assign_sel_q_13(DELAY,60)@11
    d_in0_m0_wi0_wo0_assign_sel_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => d_in0_m0_wi0_wo0_assign_sel_q_11_q, xout => d_in0_m0_wi0_wo0_assign_sel_q_13_q, clk => clk, aclr => areset );

	--u0_m1_wo0_wi0_delayr0_replace_rdmux(MUX,119)
    u0_m1_wo0_wi0_delayr0_replace_rdmux_s <= d_in0_m0_wi0_wo0_assign_sel_q_13_q;
    u0_m1_wo0_wi0_delayr0_replace_rdmux: PROCESS (u0_m1_wo0_wi0_delayr0_replace_rdmux_s, u0_m1_wo0_wi0_delayr0_replace_rdreg_q, u0_m1_wo0_wi0_delayr0_replace_rdcnt_q)
    BEGIN
            CASE u0_m1_wo0_wi0_delayr0_replace_rdmux_s IS
                  WHEN "0" => u0_m1_wo0_wi0_delayr0_replace_rdmux_q <= u0_m1_wo0_wi0_delayr0_replace_rdreg_q;
                  WHEN "1" => u0_m1_wo0_wi0_delayr0_replace_rdmux_q <= u0_m1_wo0_wi0_delayr0_replace_rdcnt_q;
                  WHEN OTHERS => u0_m1_wo0_wi0_delayr0_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--u0_m1_wo0_wi0_delayr0_replace_mem(DUALMEM,116)
    u0_m1_wo0_wi0_delayr0_replace_mem_reset0 <= areset;
    u0_m1_wo0_wi0_delayr0_replace_mem_ia <= d_in0_m0_wi0_wo0_assign_data_q_13_replace_mem_q;
    u0_m1_wo0_wi0_delayr0_replace_mem_aa <= u0_m1_wo0_wi0_delayr0_replace_rdreg_q;
    u0_m1_wo0_wi0_delayr0_replace_mem_ab <= u0_m1_wo0_wi0_delayr0_replace_rdmux_q;
    u0_m1_wo0_wi0_delayr0_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 6,
        numwords_a => 47,
        width_b => 12,
        widthad_b => 6,
        numwords_b => 47,
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
        u0_m1_wo0_wi0_delayr0_replace_mem_q <= u0_m1_wo0_wi0_delayr0_replace_mem_iq(11 downto 0);

	--u0_m1_wo0_wi0_phasedelay0_replace_rdcnt(COUNTER,129)
    -- every=1, low=0, high=6, step=1, init=1
    u0_m1_wo0_wi0_phasedelay0_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_i = 5 THEN
                  u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_eq <= '1';
                ELSE
                  u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_eq <= '0';
                END IF;
                IF (u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_eq = '1') THEN
                    u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_i <= u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_i - 6;
                ELSE
                    u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_i <= u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_i,3));


	--u0_m1_wo0_wi0_phasedelay0_replace_rdreg(REG,130)
    u0_m1_wo0_wi0_phasedelay0_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_wi0_phasedelay0_replace_rdreg_q <= "000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m1_wo0_wi0_phasedelay0_replace_rdreg_q <= u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--u0_m1_wo0_wi0_phasedelay0_replace_rdmux(MUX,131)
    u0_m1_wo0_wi0_phasedelay0_replace_rdmux_s <= VCC_q;
    u0_m1_wo0_wi0_phasedelay0_replace_rdmux: PROCESS (u0_m1_wo0_wi0_phasedelay0_replace_rdmux_s, u0_m1_wo0_wi0_phasedelay0_replace_rdreg_q, u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_q)
    BEGIN
            CASE u0_m1_wo0_wi0_phasedelay0_replace_rdmux_s IS
                  WHEN "0" => u0_m1_wo0_wi0_phasedelay0_replace_rdmux_q <= u0_m1_wo0_wi0_phasedelay0_replace_rdreg_q;
                  WHEN "1" => u0_m1_wo0_wi0_phasedelay0_replace_rdmux_q <= u0_m1_wo0_wi0_phasedelay0_replace_rdcnt_q;
                  WHEN OTHERS => u0_m1_wo0_wi0_phasedelay0_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--u0_m1_wo0_wi0_phasedelay0_replace_mem(DUALMEM,128)
    u0_m1_wo0_wi0_phasedelay0_replace_mem_reset0 <= areset;
    u0_m1_wo0_wi0_phasedelay0_replace_mem_ia <= u0_m1_wo0_wi0_delayr0_replace_mem_q;
    u0_m1_wo0_wi0_phasedelay0_replace_mem_aa <= u0_m1_wo0_wi0_phasedelay0_replace_rdreg_q;
    u0_m1_wo0_wi0_phasedelay0_replace_mem_ab <= u0_m1_wo0_wi0_phasedelay0_replace_rdmux_q;
    u0_m1_wo0_wi0_phasedelay0_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 12,
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
        u0_m1_wo0_wi0_phasedelay0_replace_mem_q <= u0_m1_wo0_wi0_phasedelay0_replace_mem_iq(11 downto 0);

	--u0_m1_wo0_mtree_mult1_0_shift0(BITSHIFT,57)@13
    u0_m1_wo0_mtree_mult1_0_shift0_q_int <= u0_m1_wo0_wi0_phasedelay0_replace_mem_q & "00000000000000";
    u0_m1_wo0_mtree_mult1_0_shift0_q <= u0_m1_wo0_mtree_mult1_0_shift0_q_int(25 downto 0);

	--d_u0_m1_wo0_mtree_mult1_0_shift0_q_14(DELAY,69)@13
    d_u0_m1_wo0_mtree_mult1_0_shift0_q_14 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1 )
    PORT MAP ( xin => u0_m1_wo0_mtree_mult1_0_shift0_q, xout => d_u0_m1_wo0_mtree_mult1_0_shift0_q_14_q, clk => clk, aclr => areset );

	--u0_m1_wo0_memread(DELAY,27)@11
    u0_m1_wo0_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 8 )
    PORT MAP ( xin => d_in0_m0_wi0_wo0_assign_sel_q_11_q, xout => u0_m1_wo0_memread_q, clk => clk, aclr => areset );

	--u0_m1_wo0_oseq_gated_reg(REG,32)@11
    u0_m1_wo0_oseq_gated_reg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m1_wo0_oseq_gated_reg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m1_wo0_oseq_gated_reg_q <= u0_m1_wo0_memread_q;
        END IF;
    END PROCESS;


	--d_u0_m1_wo0_oseq_gated_reg_q_13(DELAY,65)@12
    d_u0_m1_wo0_oseq_gated_reg_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => u0_m1_wo0_oseq_gated_reg_q, xout => d_u0_m1_wo0_oseq_gated_reg_q_13_q, clk => clk, aclr => areset );

	--d_u0_m1_wo0_oseq_gated_reg_q_14(DELAY,66)@13
    d_u0_m1_wo0_oseq_gated_reg_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => d_u0_m1_wo0_oseq_gated_reg_q_13_q, xout => d_u0_m1_wo0_oseq_gated_reg_q_14_q, clk => clk, aclr => areset );

	--out1_m1_wo0_lineup_select_seq_0(SEQUENCE,50)@13
    out1_m1_wo0_lineup_select_seq_0: PROCESS (clk, areset)
        variable out1_m1_wo0_lineup_select_seq_0_c : signed (6 downto 0);
    BEGIN
        IF (areset = '1') THEN
            out1_m1_wo0_lineup_select_seq_0_c := "0001000";
            out1_m1_wo0_lineup_select_seq_0_q <= "0";
            out1_m1_wo0_lineup_select_seq_0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m1_wo0_oseq_gated_reg_q_13_q = "1") THEN
                IF (out1_m1_wo0_lineup_select_seq_0_c = "1111001") THEN
                    out1_m1_wo0_lineup_select_seq_0_eq <= '1';
                ELSE
                    out1_m1_wo0_lineup_select_seq_0_eq <= '0';
                END IF;
                IF (out1_m1_wo0_lineup_select_seq_0_eq = '1') THEN
                    out1_m1_wo0_lineup_select_seq_0_c := out1_m1_wo0_lineup_select_seq_0_c + 15;
                ELSE
                    out1_m1_wo0_lineup_select_seq_0_c := out1_m1_wo0_lineup_select_seq_0_c - 1;
                END IF;
                out1_m1_wo0_lineup_select_seq_0_q <= std_logic_vector(out1_m1_wo0_lineup_select_seq_0_c(6 DOWNTO 6));
            END IF;
        END IF;
    END PROCESS;


	--out1_m1_wo0_lineup_select_0(LOGICAL,51)@14
    out1_m1_wo0_lineup_select_0_a <= out1_m1_wo0_lineup_select_seq_0_q;
    out1_m1_wo0_lineup_select_0_b <= d_u0_m1_wo0_oseq_gated_reg_q_14_q;
    out1_m1_wo0_lineup_select_0_q <= out1_m1_wo0_lineup_select_0_a and out1_m1_wo0_lineup_select_0_b;

	--u0_m0_wo0_wi0_delayr1_notEnable(LOGICAL,88)
    u0_m0_wo0_wi0_delayr1_notEnable_a <= xIn_v;
    u0_m0_wo0_wi0_delayr1_notEnable_q <= not u0_m0_wo0_wi0_delayr1_notEnable_a;

	--u0_m0_wo0_wi0_delayr4_nor(LOGICAL,101)
    u0_m0_wo0_wi0_delayr4_nor_a <= u0_m0_wo0_wi0_delayr1_notEnable_q;
    u0_m0_wo0_wi0_delayr4_nor_b <= u0_m0_wo0_wi0_delayr4_sticky_ena_q;
    u0_m0_wo0_wi0_delayr4_nor_q <= not (u0_m0_wo0_wi0_delayr4_nor_a or u0_m0_wo0_wi0_delayr4_nor_b);

	--u0_m0_wo0_wi0_delayr4_mem_top(CONSTANT,97)
    u0_m0_wo0_wi0_delayr4_mem_top_q <= "01110";

	--u0_m0_wo0_wi0_delayr4_cmp(LOGICAL,98)
    u0_m0_wo0_wi0_delayr4_cmp_a <= u0_m0_wo0_wi0_delayr4_mem_top_q;
    u0_m0_wo0_wi0_delayr4_cmp_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_delayr4_replace_rdmux_q);
    u0_m0_wo0_wi0_delayr4_cmp_q <= "1" when u0_m0_wo0_wi0_delayr4_cmp_a = u0_m0_wo0_wi0_delayr4_cmp_b else "0";

	--u0_m0_wo0_wi0_delayr4_cmpReg(REG,99)
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


	--u0_m0_wo0_wi0_delayr4_sticky_ena(REG,102)
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


	--u0_m0_wo0_wi0_delayr4_enaAnd(LOGICAL,103)
    u0_m0_wo0_wi0_delayr4_enaAnd_a <= u0_m0_wo0_wi0_delayr4_sticky_ena_q;
    u0_m0_wo0_wi0_delayr4_enaAnd_b <= xIn_v;
    u0_m0_wo0_wi0_delayr4_enaAnd_q <= u0_m0_wo0_wi0_delayr4_enaAnd_a and u0_m0_wo0_wi0_delayr4_enaAnd_b;

	--u0_m0_wo0_wi0_delayr4_replace_rdcnt(COUNTER,93)
    -- every=1, low=0, high=14, step=1, init=1
    u0_m0_wo0_wi0_delayr4_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr4_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            u0_m0_wo0_wi0_delayr4_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                    IF u0_m0_wo0_wi0_delayr4_replace_rdcnt_i = 13 THEN
                      u0_m0_wo0_wi0_delayr4_replace_rdcnt_eq <= '1';
                    ELSE
                      u0_m0_wo0_wi0_delayr4_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (u0_m0_wo0_wi0_delayr4_replace_rdcnt_eq = '1') THEN
                        u0_m0_wo0_wi0_delayr4_replace_rdcnt_i <= u0_m0_wo0_wi0_delayr4_replace_rdcnt_i - 14;
                    ELSE
                        u0_m0_wo0_wi0_delayr4_replace_rdcnt_i <= u0_m0_wo0_wi0_delayr4_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_delayr4_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_delayr4_replace_rdcnt_i,4));


	--u0_m0_wo0_wi0_delayr4_replace_rdreg(REG,94)
    u0_m0_wo0_wi0_delayr4_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr4_replace_rdreg_q <= "0000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_wi0_delayr4_replace_rdreg_q <= u0_m0_wo0_wi0_delayr4_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr4_replace_rdmux(MUX,95)
    u0_m0_wo0_wi0_delayr4_replace_rdmux_s <= xIn_v;
    u0_m0_wo0_wi0_delayr4_replace_rdmux: PROCESS (u0_m0_wo0_wi0_delayr4_replace_rdmux_s, u0_m0_wo0_wi0_delayr4_replace_rdreg_q, u0_m0_wo0_wi0_delayr4_replace_rdcnt_q)
    BEGIN
            CASE u0_m0_wo0_wi0_delayr4_replace_rdmux_s IS
                  WHEN "0" => u0_m0_wo0_wi0_delayr4_replace_rdmux_q <= u0_m0_wo0_wi0_delayr4_replace_rdreg_q;
                  WHEN "1" => u0_m0_wo0_wi0_delayr4_replace_rdmux_q <= u0_m0_wo0_wi0_delayr4_replace_rdcnt_q;
                  WHEN OTHERS => u0_m0_wo0_wi0_delayr4_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr4_replace_mem(DUALMEM,92)
    u0_m0_wo0_wi0_delayr4_replace_mem_reset0 <= areset;
    u0_m0_wo0_wi0_delayr4_replace_mem_ia <= u0_m0_wo0_wi0_split1_d;
    u0_m0_wo0_wi0_delayr4_replace_mem_aa <= u0_m0_wo0_wi0_delayr4_replace_rdreg_q;
    u0_m0_wo0_wi0_delayr4_replace_mem_ab <= u0_m0_wo0_wi0_delayr4_replace_rdmux_q;
    u0_m0_wo0_wi0_delayr4_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 4,
        numwords_a => 15,
        width_b => 12,
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
        u0_m0_wo0_wi0_delayr4_replace_mem_q <= u0_m0_wo0_wi0_delayr4_replace_mem_iq(11 downto 0);

	--u0_m0_wo0_wi0_delayr1_nor(LOGICAL,89)
    u0_m0_wo0_wi0_delayr1_nor_a <= u0_m0_wo0_wi0_delayr1_notEnable_q;
    u0_m0_wo0_wi0_delayr1_nor_b <= u0_m0_wo0_wi0_delayr1_sticky_ena_q;
    u0_m0_wo0_wi0_delayr1_nor_q <= not (u0_m0_wo0_wi0_delayr1_nor_a or u0_m0_wo0_wi0_delayr1_nor_b);

	--u0_m0_wo0_wi0_delayr1_mem_top(CONSTANT,85)
    u0_m0_wo0_wi0_delayr1_mem_top_q <= "01101";

	--u0_m0_wo0_wi0_delayr1_cmp(LOGICAL,86)
    u0_m0_wo0_wi0_delayr1_cmp_a <= u0_m0_wo0_wi0_delayr1_mem_top_q;
    u0_m0_wo0_wi0_delayr1_cmp_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_delayr1_replace_rdmux_q);
    u0_m0_wo0_wi0_delayr1_cmp_q <= "1" when u0_m0_wo0_wi0_delayr1_cmp_a = u0_m0_wo0_wi0_delayr1_cmp_b else "0";

	--u0_m0_wo0_wi0_delayr1_cmpReg(REG,87)
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


	--u0_m0_wo0_wi0_delayr1_sticky_ena(REG,90)
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


	--u0_m0_wo0_wi0_delayr1_enaAnd(LOGICAL,91)
    u0_m0_wo0_wi0_delayr1_enaAnd_a <= u0_m0_wo0_wi0_delayr1_sticky_ena_q;
    u0_m0_wo0_wi0_delayr1_enaAnd_b <= xIn_v;
    u0_m0_wo0_wi0_delayr1_enaAnd_q <= u0_m0_wo0_wi0_delayr1_enaAnd_a and u0_m0_wo0_wi0_delayr1_enaAnd_b;

	--u0_m0_wo0_wi0_join1(BITJOIN,8)@10
    u0_m0_wo0_wi0_join1_q <= u0_m0_wo0_wi0_split1_c & u0_m0_wo0_wi0_split1_b & xIn_0;

	--u0_m0_wo0_wi0_delayr1_replace_rdcnt(COUNTER,81)
    -- every=1, low=0, high=13, step=1, init=1
    u0_m0_wo0_wi0_delayr1_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr1_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            u0_m0_wo0_wi0_delayr1_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                    IF u0_m0_wo0_wi0_delayr1_replace_rdcnt_i = 12 THEN
                      u0_m0_wo0_wi0_delayr1_replace_rdcnt_eq <= '1';
                    ELSE
                      u0_m0_wo0_wi0_delayr1_replace_rdcnt_eq <= '0';
                    END IF;
                    IF (u0_m0_wo0_wi0_delayr1_replace_rdcnt_eq = '1') THEN
                        u0_m0_wo0_wi0_delayr1_replace_rdcnt_i <= u0_m0_wo0_wi0_delayr1_replace_rdcnt_i - 13;
                    ELSE
                        u0_m0_wo0_wi0_delayr1_replace_rdcnt_i <= u0_m0_wo0_wi0_delayr1_replace_rdcnt_i + 1;
                    END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_delayr1_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_delayr1_replace_rdcnt_i,4));


	--u0_m0_wo0_wi0_delayr1_replace_rdreg(REG,82)
    u0_m0_wo0_wi0_delayr1_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr1_replace_rdreg_q <= "0000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_wi0_delayr1_replace_rdreg_q <= u0_m0_wo0_wi0_delayr1_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr1_replace_rdmux(MUX,83)
    u0_m0_wo0_wi0_delayr1_replace_rdmux_s <= xIn_v;
    u0_m0_wo0_wi0_delayr1_replace_rdmux: PROCESS (u0_m0_wo0_wi0_delayr1_replace_rdmux_s, u0_m0_wo0_wi0_delayr1_replace_rdreg_q, u0_m0_wo0_wi0_delayr1_replace_rdcnt_q)
    BEGIN
            CASE u0_m0_wo0_wi0_delayr1_replace_rdmux_s IS
                  WHEN "0" => u0_m0_wo0_wi0_delayr1_replace_rdmux_q <= u0_m0_wo0_wi0_delayr1_replace_rdreg_q;
                  WHEN "1" => u0_m0_wo0_wi0_delayr1_replace_rdmux_q <= u0_m0_wo0_wi0_delayr1_replace_rdcnt_q;
                  WHEN OTHERS => u0_m0_wo0_wi0_delayr1_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr1_replace_mem(DUALMEM,80)
    u0_m0_wo0_wi0_delayr1_replace_mem_reset0 <= areset;
    u0_m0_wo0_wi0_delayr1_replace_mem_ia <= u0_m0_wo0_wi0_join1_q;
    u0_m0_wo0_wi0_delayr1_replace_mem_aa <= u0_m0_wo0_wi0_delayr1_replace_rdreg_q;
    u0_m0_wo0_wi0_delayr1_replace_mem_ab <= u0_m0_wo0_wi0_delayr1_replace_rdmux_q;
    u0_m0_wo0_wi0_delayr1_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 36,
        widthad_a => 4,
        numwords_a => 14,
        width_b => 36,
        widthad_b => 4,
        numwords_b => 14,
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
        u0_m0_wo0_wi0_delayr1_replace_mem_q <= u0_m0_wo0_wi0_delayr1_replace_mem_iq(35 downto 0);

	--u0_m0_wo0_wi0_split1(BITSELECT,9)@10
    u0_m0_wo0_wi0_split1_in <= u0_m0_wo0_wi0_delayr1_replace_mem_q;
    u0_m0_wo0_wi0_split1_b <= u0_m0_wo0_wi0_split1_in(11 downto 0);
    u0_m0_wo0_wi0_split1_c <= u0_m0_wo0_wi0_split1_in(23 downto 12);
    u0_m0_wo0_wi0_split1_d <= u0_m0_wo0_wi0_split1_in(35 downto 24);

	--GND(CONSTANT,0)@0
    GND_q <= "0";

	--u0_m0_wo0_wi0_delayr5_nor(LOGICAL,113)
    u0_m0_wo0_wi0_delayr5_nor_a <= u0_m0_wo0_wi0_delayr1_notEnable_q;
    u0_m0_wo0_wi0_delayr5_nor_b <= u0_m0_wo0_wi0_delayr5_sticky_ena_q;
    u0_m0_wo0_wi0_delayr5_nor_q <= not (u0_m0_wo0_wi0_delayr5_nor_a or u0_m0_wo0_wi0_delayr5_nor_b);

	--u0_m0_wo0_wi0_delayr5_mem_top(CONSTANT,109)
    u0_m0_wo0_wi0_delayr5_mem_top_q <= "01111";

	--u0_m0_wo0_wi0_delayr5_cmp(LOGICAL,110)
    u0_m0_wo0_wi0_delayr5_cmp_a <= u0_m0_wo0_wi0_delayr5_mem_top_q;
    u0_m0_wo0_wi0_delayr5_cmp_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_delayr5_replace_rdmux_q);
    u0_m0_wo0_wi0_delayr5_cmp_q <= "1" when u0_m0_wo0_wi0_delayr5_cmp_a = u0_m0_wo0_wi0_delayr5_cmp_b else "0";

	--u0_m0_wo0_wi0_delayr5_cmpReg(REG,111)
    u0_m0_wo0_wi0_delayr5_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr5_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_wi0_delayr5_cmpReg_q <= u0_m0_wo0_wi0_delayr5_cmp_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr5_sticky_ena(REG,114)
    u0_m0_wo0_wi0_delayr5_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr5_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_delayr5_nor_q = "1") THEN
                u0_m0_wo0_wi0_delayr5_sticky_ena_q <= u0_m0_wo0_wi0_delayr5_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr5_enaAnd(LOGICAL,115)
    u0_m0_wo0_wi0_delayr5_enaAnd_a <= u0_m0_wo0_wi0_delayr5_sticky_ena_q;
    u0_m0_wo0_wi0_delayr5_enaAnd_b <= xIn_v;
    u0_m0_wo0_wi0_delayr5_enaAnd_q <= u0_m0_wo0_wi0_delayr5_enaAnd_a and u0_m0_wo0_wi0_delayr5_enaAnd_b;

	--u0_m0_wo0_wi0_join5(BITJOIN,12)@10
    u0_m0_wo0_wi0_join5_q <= u0_m0_wo0_wi0_split5_c & u0_m0_wo0_wi0_split5_b & u0_m0_wo0_wi0_delayr4_replace_mem_q;

	--u0_m0_wo0_wi0_delayr5_replace_rdcnt(COUNTER,105)
    -- every=1, low=0, high=15, step=1, init=1
    u0_m0_wo0_wi0_delayr5_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr5_replace_rdcnt_i <= TO_UNSIGNED(1,4);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                    u0_m0_wo0_wi0_delayr5_replace_rdcnt_i <= u0_m0_wo0_wi0_delayr5_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_delayr5_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_delayr5_replace_rdcnt_i,4));


	--u0_m0_wo0_wi0_delayr5_replace_rdreg(REG,106)
    u0_m0_wo0_wi0_delayr5_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_delayr5_replace_rdreg_q <= "0000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_m0_wo0_wi0_delayr5_replace_rdreg_q <= u0_m0_wo0_wi0_delayr5_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr5_replace_rdmux(MUX,107)
    u0_m0_wo0_wi0_delayr5_replace_rdmux_s <= xIn_v;
    u0_m0_wo0_wi0_delayr5_replace_rdmux: PROCESS (u0_m0_wo0_wi0_delayr5_replace_rdmux_s, u0_m0_wo0_wi0_delayr5_replace_rdreg_q, u0_m0_wo0_wi0_delayr5_replace_rdcnt_q)
    BEGIN
            CASE u0_m0_wo0_wi0_delayr5_replace_rdmux_s IS
                  WHEN "0" => u0_m0_wo0_wi0_delayr5_replace_rdmux_q <= u0_m0_wo0_wi0_delayr5_replace_rdreg_q;
                  WHEN "1" => u0_m0_wo0_wi0_delayr5_replace_rdmux_q <= u0_m0_wo0_wi0_delayr5_replace_rdcnt_q;
                  WHEN OTHERS => u0_m0_wo0_wi0_delayr5_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--u0_m0_wo0_wi0_delayr5_replace_mem(DUALMEM,104)
    u0_m0_wo0_wi0_delayr5_replace_mem_reset0 <= areset;
    u0_m0_wo0_wi0_delayr5_replace_mem_ia <= u0_m0_wo0_wi0_join5_q;
    u0_m0_wo0_wi0_delayr5_replace_mem_aa <= u0_m0_wo0_wi0_delayr5_replace_rdreg_q;
    u0_m0_wo0_wi0_delayr5_replace_mem_ab <= u0_m0_wo0_wi0_delayr5_replace_rdmux_q;
    u0_m0_wo0_wi0_delayr5_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 36,
        widthad_a => 4,
        numwords_a => 16,
        width_b => 36,
        widthad_b => 4,
        numwords_b => 16,
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
        clocken1 => u0_m0_wo0_wi0_delayr5_enaAnd_q(0),
        clocken0 => '1',
        wren_a => xIn_v(0),
        clock0 => clk,
        aclr1 => u0_m0_wo0_wi0_delayr5_replace_mem_reset0,
        clock1 => clk,
        address_b => u0_m0_wo0_wi0_delayr5_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => u0_m0_wo0_wi0_delayr5_replace_mem_iq,
        address_a => u0_m0_wo0_wi0_delayr5_replace_mem_aa,
        data_a => u0_m0_wo0_wi0_delayr5_replace_mem_ia
    );
        u0_m0_wo0_wi0_delayr5_replace_mem_q <= u0_m0_wo0_wi0_delayr5_replace_mem_iq(35 downto 0);

	--u0_m0_wo0_wi0_split5(BITSELECT,13)@10
    u0_m0_wo0_wi0_split5_in <= u0_m0_wo0_wi0_delayr5_replace_mem_q;
    u0_m0_wo0_wi0_split5_b <= u0_m0_wo0_wi0_split5_in(11 downto 0);
    u0_m0_wo0_wi0_split5_c <= u0_m0_wo0_wi0_split5_in(23 downto 12);
    u0_m0_wo0_wi0_split5_d <= u0_m0_wo0_wi0_split5_in(35 downto 24);

	--u0_m0_wo0_cma0(CHAINMULTADD,23)@10
    u0_m0_wo0_cma0_l(0) <= RESIZE(u0_m0_wo0_cma0_a(0),13) + RESIZE(u0_m0_wo0_cma0_b(0),13);
    u0_m0_wo0_cma0_l(1) <= RESIZE(u0_m0_wo0_cma0_a(1),13) + RESIZE(u0_m0_wo0_cma0_b(1),13);
    u0_m0_wo0_cma0_l(2) <= RESIZE(u0_m0_wo0_cma0_a(2),13) + RESIZE(u0_m0_wo0_cma0_b(2),13);
    u0_m0_wo0_cma0_l(3) <= RESIZE(u0_m0_wo0_cma0_a(3),13) + RESIZE(u0_m0_wo0_cma0_b(3),13);
--altera synthesis_off
    u0_m0_wo0_cma0_k0 <= (
        0 => TO_SIGNED(-74,15),
        others => (others => '0'));
    u0_m0_wo0_cma0_k1 <= (
        0 => TO_SIGNED(533,15),
        others => (others => '0'));
    u0_m0_wo0_cma0_k2 <= (
        0 => TO_SIGNED(-2186,15),
        others => (others => '0'));
    u0_m0_wo0_cma0_k3 <= (
        0 => TO_SIGNED(9919,15),
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
    u0_m0_wo0_cma0_w(0) <= RESIZE(u0_m0_wo0_cma0_p(0),30);
    u0_m0_wo0_cma0_w(1) <= RESIZE(u0_m0_wo0_cma0_p(1),30);
    u0_m0_wo0_cma0_w(2) <= RESIZE(u0_m0_wo0_cma0_p(2),30);
    u0_m0_wo0_cma0_w(3) <= RESIZE(u0_m0_wo0_cma0_p(3),30);
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
                u0_m0_wo0_cma0_a(0) <= SIGNED(RESIZE(SIGNED(xIn_0),12));
                u0_m0_wo0_cma0_a(1) <= SIGNED(RESIZE(SIGNED(u0_m0_wo0_wi0_split1_b),12));
                u0_m0_wo0_cma0_a(2) <= SIGNED(RESIZE(SIGNED(u0_m0_wo0_wi0_split1_c),12));
                u0_m0_wo0_cma0_a(3) <= SIGNED(RESIZE(SIGNED(u0_m0_wo0_wi0_split1_d),12));
                u0_m0_wo0_cma0_b(0) <= SIGNED(RESIZE(SIGNED(u0_m0_wo0_wi0_split5_d),12));
                u0_m0_wo0_cma0_b(1) <= SIGNED(RESIZE(SIGNED(u0_m0_wo0_wi0_split5_c),12));
                u0_m0_wo0_cma0_b(2) <= SIGNED(RESIZE(SIGNED(u0_m0_wo0_wi0_split5_b),12));
                u0_m0_wo0_cma0_b(3) <= SIGNED(RESIZE(SIGNED(u0_m0_wo0_wi0_delayr4_replace_mem_q),12));
                u0_m0_wo0_cma0_c(0) <= UNSIGNED(RESIZE(UNSIGNED(GND_q),3));
                u0_m0_wo0_cma0_c(1) <= UNSIGNED(RESIZE(UNSIGNED(GND_q),3));
                u0_m0_wo0_cma0_c(2) <= UNSIGNED(RESIZE(UNSIGNED(GND_q),3));
                u0_m0_wo0_cma0_c(3) <= UNSIGNED(RESIZE(UNSIGNED(GND_q),3));
            END IF;
            IF (d_in0_m0_wi0_wo0_assign_sel_q_11_q = "1") THEN
                u0_m0_wo0_cma0_s(0) <= u0_m0_wo0_cma0_y(0);
                u0_m0_wo0_cma0_s(1) <= u0_m0_wo0_cma0_y(1);
                u0_m0_wo0_cma0_s(2) <= u0_m0_wo0_cma0_y(2);
                u0_m0_wo0_cma0_s(3) <= u0_m0_wo0_cma0_y(3);
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_cma0_s0 <= STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_cma0_s(0),30));
    u0_m0_wo0_cma0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cma0_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_cma0_q <= u0_m0_wo0_cma0_s0;
        END IF;
    END PROCESS;

	--d_u0_m0_wo0_cma0_q_14(DELAY,62)@13
    d_u0_m0_wo0_cma0_q_14 : dspba_delay
    GENERIC MAP ( width => 30, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_cma0_q, xout => d_u0_m0_wo0_cma0_q_14_q, clk => clk, aclr => areset );

	--u0_m0_wo0_oseq_gated_reg(REG,24)@11
    u0_m0_wo0_oseq_gated_reg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= d_in0_m0_wi0_wo0_assign_sel_q_11_q;
        END IF;
    END PROCESS;


	--d_u0_m0_wo0_oseq_gated_reg_q_13(DELAY,63)@12
    d_u0_m0_wo0_oseq_gated_reg_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_oseq_gated_reg_q, xout => d_u0_m0_wo0_oseq_gated_reg_q_13_q, clk => clk, aclr => areset );

	--d_u0_m0_wo0_oseq_gated_reg_q_14(DELAY,64)@13
    d_u0_m0_wo0_oseq_gated_reg_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => d_u0_m0_wo0_oseq_gated_reg_q_13_q, xout => d_u0_m0_wo0_oseq_gated_reg_q_14_q, clk => clk, aclr => areset );

	--out1_m0_wo0_lineup_select_seq_0(SEQUENCE,46)@13
    out1_m0_wo0_lineup_select_seq_0: PROCESS (clk, areset)
        variable out1_m0_wo0_lineup_select_seq_0_c : signed (6 downto 0);
    BEGIN
        IF (areset = '1') THEN
            out1_m0_wo0_lineup_select_seq_0_c := "0001000";
            out1_m0_wo0_lineup_select_seq_0_q <= "0";
            out1_m0_wo0_lineup_select_seq_0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_oseq_gated_reg_q_13_q = "1") THEN
                IF (out1_m0_wo0_lineup_select_seq_0_c = "1111001") THEN
                    out1_m0_wo0_lineup_select_seq_0_eq <= '1';
                ELSE
                    out1_m0_wo0_lineup_select_seq_0_eq <= '0';
                END IF;
                IF (out1_m0_wo0_lineup_select_seq_0_eq = '1') THEN
                    out1_m0_wo0_lineup_select_seq_0_c := out1_m0_wo0_lineup_select_seq_0_c + 15;
                ELSE
                    out1_m0_wo0_lineup_select_seq_0_c := out1_m0_wo0_lineup_select_seq_0_c - 1;
                END IF;
                out1_m0_wo0_lineup_select_seq_0_q <= std_logic_vector(out1_m0_wo0_lineup_select_seq_0_c(6 DOWNTO 6));
            END IF;
        END IF;
    END PROCESS;


	--out1_m0_wo0_lineup_select_0(LOGICAL,47)@14
    out1_m0_wo0_lineup_select_0_a <= out1_m0_wo0_lineup_select_seq_0_q;
    out1_m0_wo0_lineup_select_0_b <= d_u0_m0_wo0_oseq_gated_reg_q_14_q;
    out1_m0_wo0_lineup_select_0_q <= out1_m0_wo0_lineup_select_0_a and out1_m0_wo0_lineup_select_0_b;

	--VCC(CONSTANT,1)@0
    VCC_q <= "1";

	--out1_wo0_data_selector(SELECTOR,54)@14
    out1_wo0_data_selector: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            out1_wo0_data_selector_q <= (others => '0');
            out1_wo0_data_selector_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            out1_wo0_data_selector_q <= STD_LOGIC_VECTOR((29 downto 26 => d_u0_m1_wo0_mtree_mult1_0_shift0_q_14_q(25)) & d_u0_m1_wo0_mtree_mult1_0_shift0_q_14_q);
            out1_wo0_data_selector_v <= (others => '0');
            IF (out1_m1_wo0_lineup_select_0_q = "1") THEN
                out1_wo0_data_selector_q <= STD_LOGIC_VECTOR((29 downto 26 => d_u0_m1_wo0_mtree_mult1_0_shift0_q_14_q(25)) & d_u0_m1_wo0_mtree_mult1_0_shift0_q_14_q);
                out1_wo0_data_selector_v <= "1";
            END IF;
            IF (out1_m0_wo0_lineup_select_0_q = "1") THEN
                out1_wo0_data_selector_q <= d_u0_m0_wo0_cma0_q_14_q;
                out1_wo0_data_selector_v <= "1";
            END IF;
        END IF;
    END PROCESS;


	--out0_m1_wo0_lineup_0_replace_mem(DUALMEM,152)
    out0_m1_wo0_lineup_0_replace_mem_reset0 <= areset;
    out0_m1_wo0_lineup_0_replace_mem_ia <= u0_m1_wo0_mtree_mult1_0_shift0_q;
    out0_m1_wo0_lineup_0_replace_mem_aa <= u0_m1_wo0_wi0_phasedelay0_replace_rdreg_q;
    out0_m1_wo0_lineup_0_replace_mem_ab <= u0_m1_wo0_wi0_phasedelay0_replace_rdmux_q;
    out0_m1_wo0_lineup_0_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 26,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 26,
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
        out0_m1_wo0_lineup_0_replace_mem_q <= out0_m1_wo0_lineup_0_replace_mem_iq(25 downto 0);

	--out0_m1_wo0_lineup_select_seq_0(SEQUENCE,40)@12
    out0_m1_wo0_lineup_select_seq_0: PROCESS (clk, areset)
        variable out0_m1_wo0_lineup_select_seq_0_c : signed (6 downto 0);
    BEGIN
        IF (areset = '1') THEN
            out0_m1_wo0_lineup_select_seq_0_c := "0000000";
            out0_m1_wo0_lineup_select_seq_0_q <= "0";
            out0_m1_wo0_lineup_select_seq_0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m1_wo0_oseq_gated_reg_q = "1") THEN
                IF (out0_m1_wo0_lineup_select_seq_0_c = "1111001") THEN
                    out0_m1_wo0_lineup_select_seq_0_eq <= '1';
                ELSE
                    out0_m1_wo0_lineup_select_seq_0_eq <= '0';
                END IF;
                IF (out0_m1_wo0_lineup_select_seq_0_eq = '1') THEN
                    out0_m1_wo0_lineup_select_seq_0_c := out0_m1_wo0_lineup_select_seq_0_c + 15;
                ELSE
                    out0_m1_wo0_lineup_select_seq_0_c := out0_m1_wo0_lineup_select_seq_0_c - 1;
                END IF;
                out0_m1_wo0_lineup_select_seq_0_q <= std_logic_vector(out0_m1_wo0_lineup_select_seq_0_c(6 DOWNTO 6));
            END IF;
        END IF;
    END PROCESS;


	--out0_m1_wo0_lineup_select_0(LOGICAL,41)@13
    out0_m1_wo0_lineup_select_0_a <= out0_m1_wo0_lineup_select_seq_0_q;
    out0_m1_wo0_lineup_select_0_b <= d_u0_m1_wo0_oseq_gated_reg_q_13_q;
    out0_m1_wo0_lineup_select_0_q <= out0_m1_wo0_lineup_select_0_a and out0_m1_wo0_lineup_select_0_b;

	--out0_m1_wo0_lineup_select_delay_0(DELAY,42)@13
    out0_m1_wo0_lineup_select_delay_0 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8 )
    PORT MAP ( xin => out0_m1_wo0_lineup_select_0_q, xout => out0_m1_wo0_lineup_select_delay_0_q, clk => clk, aclr => areset );

	--out0_m0_wo0_lineup_0_replace_mem(DUALMEM,140)
    out0_m0_wo0_lineup_0_replace_mem_reset0 <= areset;
    out0_m0_wo0_lineup_0_replace_mem_ia <= u0_m0_wo0_cma0_q;
    out0_m0_wo0_lineup_0_replace_mem_aa <= u0_m1_wo0_wi0_phasedelay0_replace_rdreg_q;
    out0_m0_wo0_lineup_0_replace_mem_ab <= u0_m1_wo0_wi0_phasedelay0_replace_rdmux_q;
    out0_m0_wo0_lineup_0_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 30,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 30,
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
        out0_m0_wo0_lineup_0_replace_mem_q <= out0_m0_wo0_lineup_0_replace_mem_iq(29 downto 0);

	--out0_m0_wo0_lineup_select_seq_0(SEQUENCE,34)@12
    out0_m0_wo0_lineup_select_seq_0: PROCESS (clk, areset)
        variable out0_m0_wo0_lineup_select_seq_0_c : signed (6 downto 0);
    BEGIN
        IF (areset = '1') THEN
            out0_m0_wo0_lineup_select_seq_0_c := "0000000";
            out0_m0_wo0_lineup_select_seq_0_q <= "0";
            out0_m0_wo0_lineup_select_seq_0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_oseq_gated_reg_q = "1") THEN
                IF (out0_m0_wo0_lineup_select_seq_0_c = "1111001") THEN
                    out0_m0_wo0_lineup_select_seq_0_eq <= '1';
                ELSE
                    out0_m0_wo0_lineup_select_seq_0_eq <= '0';
                END IF;
                IF (out0_m0_wo0_lineup_select_seq_0_eq = '1') THEN
                    out0_m0_wo0_lineup_select_seq_0_c := out0_m0_wo0_lineup_select_seq_0_c + 15;
                ELSE
                    out0_m0_wo0_lineup_select_seq_0_c := out0_m0_wo0_lineup_select_seq_0_c - 1;
                END IF;
                out0_m0_wo0_lineup_select_seq_0_q <= std_logic_vector(out0_m0_wo0_lineup_select_seq_0_c(6 DOWNTO 6));
            END IF;
        END IF;
    END PROCESS;


	--out0_m0_wo0_lineup_select_0(LOGICAL,35)@13
    out0_m0_wo0_lineup_select_0_a <= out0_m0_wo0_lineup_select_seq_0_q;
    out0_m0_wo0_lineup_select_0_b <= d_u0_m0_wo0_oseq_gated_reg_q_13_q;
    out0_m0_wo0_lineup_select_0_q <= out0_m0_wo0_lineup_select_0_a and out0_m0_wo0_lineup_select_0_b;

	--out0_m0_wo0_lineup_select_delay_0(DELAY,36)@13
    out0_m0_wo0_lineup_select_delay_0 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8 )
    PORT MAP ( xin => out0_m0_wo0_lineup_select_0_q, xout => out0_m0_wo0_lineup_select_delay_0_q, clk => clk, aclr => areset );

	--out0_wo0_data_selector(SELECTOR,45)@13
    out0_wo0_data_selector: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            out0_wo0_data_selector_q <= (others => '0');
            out0_wo0_data_selector_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            out0_wo0_data_selector_q <= STD_LOGIC_VECTOR((29 downto 26 => out0_m1_wo0_lineup_0_replace_mem_q(25)) & out0_m1_wo0_lineup_0_replace_mem_q);
            out0_wo0_data_selector_v <= (others => '0');
            IF (out0_m1_wo0_lineup_select_delay_0_q = "1") THEN
                out0_wo0_data_selector_q <= STD_LOGIC_VECTOR((29 downto 26 => out0_m1_wo0_lineup_0_replace_mem_q(25)) & out0_m1_wo0_lineup_0_replace_mem_q);
                out0_wo0_data_selector_v <= "1";
            END IF;
            IF (out0_m0_wo0_lineup_select_delay_0_q = "1") THEN
                out0_wo0_data_selector_q <= out0_m0_wo0_lineup_0_replace_mem_q;
                out0_wo0_data_selector_v <= "1";
            END IF;
        END IF;
    END PROCESS;


	--d_out0_wo0_data_selector_q_15(DELAY,67)@14
    d_out0_wo0_data_selector_q_15 : dspba_delay
    GENERIC MAP ( width => 30, depth => 1 )
    PORT MAP ( xin => out0_wo0_data_selector_q, xout => d_out0_wo0_data_selector_q_15_q, clk => clk, aclr => areset );

	--outchan(COUNTER,55)@14
    -- every=1, low=0, high=7, step=1, init=7
    outchan: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outchan_i <= TO_UNSIGNED(7,3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (out0_wo0_data_selector_v = "1") THEN
                    outchan_i <= outchan_i + 1;
            END IF;
        END IF;
    END PROCESS;
    outchan_q <= STD_LOGIC_VECTOR(RESIZE(outchan_i,4));


	--d_out0_wo0_data_selector_v_15(DELAY,68)@14
    d_out0_wo0_data_selector_v_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => out0_wo0_data_selector_v, xout => d_out0_wo0_data_selector_v_15_q, clk => clk, aclr => areset );

	--xOut(PORTOUT,56)@15
    xOut_v <= d_out0_wo0_data_selector_v_15_q;
    xOut_c <= STD_LOGIC_VECTOR("0000" & outchan_q);
    xOut_0 <= STD_LOGIC_VECTOR((30 downto 30 => d_out0_wo0_data_selector_q_15_q(29)) & d_out0_wo0_data_selector_q_15_q);
    xOut_1 <= STD_LOGIC_VECTOR((30 downto 30 => out1_wo0_data_selector_q(29)) & out1_wo0_data_selector_q);


end normal;
