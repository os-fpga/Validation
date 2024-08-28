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

-- VHDL created from DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4
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
entity DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4 is
    port (
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        xIn_p_0 : in std_logic_vector(17 downto 0);
        xIn_p_1 : in std_logic_vector(17 downto 0);
        xIn_p_2 : in std_logic_vector(17 downto 0);
        xIn_p_3 : in std_logic_vector(17 downto 0);
        xIn_p_4 : in std_logic_vector(17 downto 0);
        xIn_p_5 : in std_logic_vector(17 downto 0);
        xIn_p_6 : in std_logic_vector(17 downto 0);
        xIn_p_7 : in std_logic_vector(17 downto 0);
        xIn_p_8 : in std_logic_vector(17 downto 0);
        xIn_p_9 : in std_logic_vector(17 downto 0);
        xIn_p_10 : in std_logic_vector(17 downto 0);
        xIn_p_11 : in std_logic_vector(17 downto 0);
        xIn_p_12 : in std_logic_vector(17 downto 0);
        xIn_p_13 : in std_logic_vector(17 downto 0);
        xIn_p_14 : in std_logic_vector(17 downto 0);
        xIn_p_15 : in std_logic_vector(17 downto 0);
        xIn_s_0 : in std_logic_vector(0 downto 0);
        xIn_s_1 : in std_logic_vector(0 downto 0);
        xIn_s_2 : in std_logic_vector(0 downto 0);
        xIn_s_3 : in std_logic_vector(0 downto 0);
        xIn_s_4 : in std_logic_vector(0 downto 0);
        xIn_s_5 : in std_logic_vector(0 downto 0);
        xIn_s_6 : in std_logic_vector(0 downto 0);
        xIn_s_7 : in std_logic_vector(0 downto 0);
        xIn_s_8 : in std_logic_vector(0 downto 0);
        xIn_s_9 : in std_logic_vector(0 downto 0);
        xIn_s_10 : in std_logic_vector(0 downto 0);
        xIn_s_11 : in std_logic_vector(0 downto 0);
        xIn_s_12 : in std_logic_vector(0 downto 0);
        xIn_s_13 : in std_logic_vector(0 downto 0);
        xIn_s_14 : in std_logic_vector(0 downto 0);
        xIn_s_15 : in std_logic_vector(0 downto 0);
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
        ncoOut_v : out std_logic_vector(0 downto 0);
        ncoOut_c : out std_logic_vector(7 downto 0);
        sinOut_0 : out std_logic_vector(11 downto 0);
        sinOut_1 : out std_logic_vector(11 downto 0);
        sinOut_2 : out std_logic_vector(11 downto 0);
        sinOut_3 : out std_logic_vector(11 downto 0);
        sinOut_4 : out std_logic_vector(11 downto 0);
        sinOut_5 : out std_logic_vector(11 downto 0);
        sinOut_6 : out std_logic_vector(11 downto 0);
        sinOut_7 : out std_logic_vector(11 downto 0);
        sinOut_8 : out std_logic_vector(11 downto 0);
        sinOut_9 : out std_logic_vector(11 downto 0);
        sinOut_10 : out std_logic_vector(11 downto 0);
        sinOut_11 : out std_logic_vector(11 downto 0);
        sinOut_12 : out std_logic_vector(11 downto 0);
        sinOut_13 : out std_logic_vector(11 downto 0);
        sinOut_14 : out std_logic_vector(11 downto 0);
        sinOut_15 : out std_logic_vector(11 downto 0);
        cosOut_0 : out std_logic_vector(11 downto 0);
        cosOut_1 : out std_logic_vector(11 downto 0);
        cosOut_2 : out std_logic_vector(11 downto 0);
        cosOut_3 : out std_logic_vector(11 downto 0);
        cosOut_4 : out std_logic_vector(11 downto 0);
        cosOut_5 : out std_logic_vector(11 downto 0);
        cosOut_6 : out std_logic_vector(11 downto 0);
        cosOut_7 : out std_logic_vector(11 downto 0);
        cosOut_8 : out std_logic_vector(11 downto 0);
        cosOut_9 : out std_logic_vector(11 downto 0);
        cosOut_10 : out std_logic_vector(11 downto 0);
        cosOut_11 : out std_logic_vector(11 downto 0);
        cosOut_12 : out std_logic_vector(11 downto 0);
        cosOut_13 : out std_logic_vector(11 downto 0);
        cosOut_14 : out std_logic_vector(11 downto 0);
        cosOut_15 : out std_logic_vector(11 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
end;

architecture normal of DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal d_xIn_v_22_q : std_logic_vector (0 downto 0);
    signal d_busIn_d_11_q : std_logic_vector (31 downto 0);
    signal u0_phaseIncrRegLookup_0_e : std_logic_vector(0 downto 0);
    signal u0_phaseIncrReg_p0_q : std_logic_vector (19 downto 0);
    signal u1_phaseIncrRegLookup_0_e : std_logic_vector(0 downto 0);
    signal u1_phaseIncrReg_p0_q : std_logic_vector (19 downto 0);
    signal u2_phaseIncrRegLookup_0_e : std_logic_vector(0 downto 0);
    signal u2_phaseIncrReg_p0_q : std_logic_vector (19 downto 0);
    signal u3_phaseIncrRegLookup_0_e : std_logic_vector(0 downto 0);
    signal u3_phaseIncrReg_p0_q : std_logic_vector (19 downto 0);
    signal u4_phaseIncrRegLookup_0_e : std_logic_vector(0 downto 0);
    signal u4_phaseIncrReg_p0_q : std_logic_vector (19 downto 0);
    signal u5_phaseIncrRegLookup_0_e : std_logic_vector(0 downto 0);
    signal u5_phaseIncrReg_p0_q : std_logic_vector (19 downto 0);
    signal u6_phaseIncrRegLookup_0_e : std_logic_vector(0 downto 0);
    signal u6_phaseIncrReg_p0_q : std_logic_vector (19 downto 0);
    signal u7_phaseIncrRegLookup_0_e : std_logic_vector(0 downto 0);
    signal u7_phaseIncrReg_p0_q : std_logic_vector (19 downto 0);
    signal u8_phaseIncrRegLookup_0_e : std_logic_vector(0 downto 0);
    signal u8_phaseIncrReg_p0_q : std_logic_vector (19 downto 0);
    signal u9_phaseIncrRegLookup_0_e : std_logic_vector(0 downto 0);
    signal u9_phaseIncrReg_p0_q : std_logic_vector (19 downto 0);
    signal u10_phaseIncrRegLookup_0_e : std_logic_vector(0 downto 0);
    signal u10_phaseIncrReg_p0_q : std_logic_vector (19 downto 0);
    signal u11_phaseIncrRegLookup_0_e : std_logic_vector(0 downto 0);
    signal u11_phaseIncrReg_p0_q : std_logic_vector (19 downto 0);
    signal u12_phaseIncrRegLookup_0_e : std_logic_vector(0 downto 0);
    signal u12_phaseIncrReg_p0_q : std_logic_vector (19 downto 0);
    signal u13_phaseIncrRegLookup_0_e : std_logic_vector(0 downto 0);
    signal u13_phaseIncrReg_p0_q : std_logic_vector (19 downto 0);
    signal u14_phaseIncrRegLookup_0_e : std_logic_vector(0 downto 0);
    signal u14_phaseIncrReg_p0_q : std_logic_vector (19 downto 0);
    signal u15_phaseIncrRegLookup_0_e : std_logic_vector(0 downto 0);
    signal u15_phaseIncrReg_p0_q : std_logic_vector (19 downto 0);
    signal u0_accumAdd_b1_a : std_logic_vector(17 downto 0);
    signal u0_accumAdd_b1_b : std_logic_vector(17 downto 0);
    signal u0_accumAdd_b1_i : std_logic_vector (17 downto 0);
    signal u0_accumAdd_b1_a1 : std_logic_vector(17 downto 0);
    signal u0_accumAdd_b1_b1 : std_logic_vector(17 downto 0);
    signal u0_accumAdd_b1_o : std_logic_vector (17 downto 0);
    signal u0_accumAdd_b1_q : std_logic_vector (17 downto 0);
    signal d_u0_accumAdd_b1_q_12_q : std_logic_vector (17 downto 0);
    signal d_u0_octantBitSelect_b_20_q : std_logic_vector (2 downto 0);
    signal u0_rangeLUT_q : std_logic_vector(18 downto 0);
    signal u0_addnsubConst_q : std_logic_vector(0 downto 0);
    signal u0_rangeAddSub_a : std_logic_vector(20 downto 0);
    signal u0_rangeAddSub_b : std_logic_vector(20 downto 0);
    signal u0_rangeAddSub_o : std_logic_vector (20 downto 0);
    signal u0_rangeAddSub_cin : std_logic_vector (0 downto 0);
    signal u0_rangeAddSub_q : std_logic_vector (18 downto 0);
    signal u0_sinTable_reset0 : std_logic;
    signal u0_sinTable_iq : std_logic_vector (11 downto 0);
    signal u0_sinTable_ia : std_logic_vector (11 downto 0);
    signal u0_sinTable_ir : std_logic_vector (11 downto 0);
    signal u0_sinTable_aa : std_logic_vector (7 downto 0);
    signal u0_sinTable_ab : std_logic_vector (7 downto 0);
    signal u0_sinTable_q : std_logic_vector (11 downto 0);
    signal u0_cosTable_reset0 : std_logic;
    signal u0_cosTable_iq : std_logic_vector (11 downto 0);
    signal u0_cosTable_ia : std_logic_vector (11 downto 0);
    signal u0_cosTable_ir : std_logic_vector (11 downto 0);
    signal u0_cosTable_aa : std_logic_vector (7 downto 0);
    signal u0_cosTable_ab : std_logic_vector (7 downto 0);
    signal u0_cosTable_q : std_logic_vector (11 downto 0);
    signal u0_cm1_a : std_logic_vector(19 downto 0);
    signal u0_cm1_b : std_logic_vector(19 downto 0);
    signal u0_cm1_o : std_logic_vector (19 downto 0);
    signal u0_cm1_q : std_logic_vector (19 downto 0);
    signal u0_cm2_a : std_logic_vector(14 downto 0);
    signal u0_cm2_b : std_logic_vector(14 downto 0);
    signal u0_cm2_o : std_logic_vector (14 downto 0);
    signal u0_cm2_q : std_logic_vector (14 downto 0);
    signal u0_cm3_a : std_logic_vector(20 downto 0);
    signal u0_cm3_b : std_logic_vector(20 downto 0);
    signal u0_cm3_o : std_logic_vector (20 downto 0);
    signal u0_cm3_q : std_logic_vector (20 downto 0);
    signal u0_sinMult_a : std_logic_vector (11 downto 0);
    signal u0_sinMult_b : std_logic_vector (11 downto 0);
    signal u0_sinMult_s1 : std_logic_vector (23 downto 0);
    signal u0_sinMult_pr : UNSIGNED (23 downto 0);
    signal u0_sinMult_q : std_logic_vector (23 downto 0);
    signal u0_cosMult_a : std_logic_vector (11 downto 0);
    signal u0_cosMult_b : std_logic_vector (11 downto 0);
    signal u0_cosMult_s1 : std_logic_vector (23 downto 0);
    signal u0_cosMult_pr : UNSIGNED (23 downto 0);
    signal u0_cosMult_q : std_logic_vector (23 downto 0);
    signal u0_sin_pi_over_4_q : std_logic_vector (13 downto 0);
    signal u0_sinAdd_a : std_logic_vector(13 downto 0);
    signal u0_sinAdd_b : std_logic_vector(13 downto 0);
    signal u0_sinAdd_i : std_logic_vector (13 downto 0);
    signal u0_sinAdd_a1 : std_logic_vector(13 downto 0);
    signal u0_sinAdd_b1 : std_logic_vector(13 downto 0);
    signal u0_sinAdd_o : std_logic_vector (13 downto 0);
    signal u0_sinAdd_q : std_logic_vector (13 downto 0);
    signal u0_cosSub_a : std_logic_vector(13 downto 0);
    signal u0_cosSub_b : std_logic_vector(13 downto 0);
    signal u0_cosSub_i : std_logic_vector (13 downto 0);
    signal u0_cosSub_a1 : std_logic_vector(13 downto 0);
    signal u0_cosSub_b1 : std_logic_vector(13 downto 0);
    signal u0_cosSub_o : std_logic_vector (13 downto 0);
    signal u0_cosSub_q : std_logic_vector (13 downto 0);
    signal u0_roundedSin_in : std_logic_vector (13 downto 0);
    signal u0_roundedSin_q : std_logic_vector (11 downto 0);
    signal u0_roundedCos_in : std_logic_vector (13 downto 0);
    signal u0_roundedCos_q : std_logic_vector (11 downto 0);
    signal u0_doSwap_q : std_logic_vector(0 downto 0);
    signal u0_doSinInvert_q : std_logic_vector(0 downto 0);
    signal u0_doCosInvert_q : std_logic_vector(0 downto 0);
    signal u0_sinSwapMux_s : std_logic_vector (0 downto 0);
    signal u0_sinSwapMux_q : std_logic_vector (11 downto 0);
    signal u0_cosSwapMux_s : std_logic_vector (0 downto 0);
    signal u0_cosSwapMux_q : std_logic_vector (11 downto 0);
    signal u0_sinInvert_a : std_logic_vector(11 downto 0);
    signal u0_sinInvert_b : std_logic_vector(11 downto 0);
    signal u0_sinInvert_i : std_logic_vector (11 downto 0);
    signal u0_sinInvert_a1 : std_logic_vector(11 downto 0);
    signal u0_sinInvert_b1 : std_logic_vector(11 downto 0);
    signal u0_sinInvert_o : std_logic_vector (11 downto 0);
    signal u0_sinInvert_q : std_logic_vector (11 downto 0);
    signal u0_cosInvert_a : std_logic_vector(11 downto 0);
    signal u0_cosInvert_b : std_logic_vector(11 downto 0);
    signal u0_cosInvert_i : std_logic_vector (11 downto 0);
    signal u0_cosInvert_a1 : std_logic_vector(11 downto 0);
    signal u0_cosInvert_b1 : std_logic_vector(11 downto 0);
    signal u0_cosInvert_o : std_logic_vector (11 downto 0);
    signal u0_cosInvert_q : std_logic_vector (11 downto 0);
    signal u1_accumAdd_b1_a : std_logic_vector(17 downto 0);
    signal u1_accumAdd_b1_b : std_logic_vector(17 downto 0);
    signal u1_accumAdd_b1_i : std_logic_vector (17 downto 0);
    signal u1_accumAdd_b1_a1 : std_logic_vector(17 downto 0);
    signal u1_accumAdd_b1_b1 : std_logic_vector(17 downto 0);
    signal u1_accumAdd_b1_o : std_logic_vector (17 downto 0);
    signal u1_accumAdd_b1_q : std_logic_vector (17 downto 0);
    signal d_u1_accumAdd_b1_q_12_q : std_logic_vector (17 downto 0);
    signal d_u1_octantBitSelect_b_20_q : std_logic_vector (2 downto 0);
    signal u1_rangeLUT_q : std_logic_vector(18 downto 0);
    signal u1_addnsubConst_q : std_logic_vector(0 downto 0);
    signal u1_rangeAddSub_a : std_logic_vector(20 downto 0);
    signal u1_rangeAddSub_b : std_logic_vector(20 downto 0);
    signal u1_rangeAddSub_o : std_logic_vector (20 downto 0);
    signal u1_rangeAddSub_cin : std_logic_vector (0 downto 0);
    signal u1_rangeAddSub_q : std_logic_vector (18 downto 0);
    signal u1_sinTable_reset0 : std_logic;
    signal u1_sinTable_iq : std_logic_vector (11 downto 0);
    signal u1_sinTable_ia : std_logic_vector (11 downto 0);
    signal u1_sinTable_ir : std_logic_vector (11 downto 0);
    signal u1_sinTable_aa : std_logic_vector (7 downto 0);
    signal u1_sinTable_ab : std_logic_vector (7 downto 0);
    signal u1_sinTable_q : std_logic_vector (11 downto 0);
    signal u1_cosTable_reset0 : std_logic;
    signal u1_cosTable_iq : std_logic_vector (11 downto 0);
    signal u1_cosTable_ia : std_logic_vector (11 downto 0);
    signal u1_cosTable_ir : std_logic_vector (11 downto 0);
    signal u1_cosTable_aa : std_logic_vector (7 downto 0);
    signal u1_cosTable_ab : std_logic_vector (7 downto 0);
    signal u1_cosTable_q : std_logic_vector (11 downto 0);
    signal u1_cm1_a : std_logic_vector(19 downto 0);
    signal u1_cm1_b : std_logic_vector(19 downto 0);
    signal u1_cm1_o : std_logic_vector (19 downto 0);
    signal u1_cm1_q : std_logic_vector (19 downto 0);
    signal u1_cm2_a : std_logic_vector(14 downto 0);
    signal u1_cm2_b : std_logic_vector(14 downto 0);
    signal u1_cm2_o : std_logic_vector (14 downto 0);
    signal u1_cm2_q : std_logic_vector (14 downto 0);
    signal u1_cm3_a : std_logic_vector(20 downto 0);
    signal u1_cm3_b : std_logic_vector(20 downto 0);
    signal u1_cm3_o : std_logic_vector (20 downto 0);
    signal u1_cm3_q : std_logic_vector (20 downto 0);
    signal u1_sinMult_a : std_logic_vector (11 downto 0);
    signal u1_sinMult_b : std_logic_vector (11 downto 0);
    signal u1_sinMult_s1 : std_logic_vector (23 downto 0);
    signal u1_sinMult_pr : UNSIGNED (23 downto 0);
    signal u1_sinMult_q : std_logic_vector (23 downto 0);
    signal u1_cosMult_a : std_logic_vector (11 downto 0);
    signal u1_cosMult_b : std_logic_vector (11 downto 0);
    signal u1_cosMult_s1 : std_logic_vector (23 downto 0);
    signal u1_cosMult_pr : UNSIGNED (23 downto 0);
    signal u1_cosMult_q : std_logic_vector (23 downto 0);
    signal u1_sinAdd_a : std_logic_vector(13 downto 0);
    signal u1_sinAdd_b : std_logic_vector(13 downto 0);
    signal u1_sinAdd_i : std_logic_vector (13 downto 0);
    signal u1_sinAdd_a1 : std_logic_vector(13 downto 0);
    signal u1_sinAdd_b1 : std_logic_vector(13 downto 0);
    signal u1_sinAdd_o : std_logic_vector (13 downto 0);
    signal u1_sinAdd_q : std_logic_vector (13 downto 0);
    signal u1_cosSub_a : std_logic_vector(13 downto 0);
    signal u1_cosSub_b : std_logic_vector(13 downto 0);
    signal u1_cosSub_i : std_logic_vector (13 downto 0);
    signal u1_cosSub_a1 : std_logic_vector(13 downto 0);
    signal u1_cosSub_b1 : std_logic_vector(13 downto 0);
    signal u1_cosSub_o : std_logic_vector (13 downto 0);
    signal u1_cosSub_q : std_logic_vector (13 downto 0);
    signal u1_roundedSin_in : std_logic_vector (13 downto 0);
    signal u1_roundedSin_q : std_logic_vector (11 downto 0);
    signal u1_roundedCos_in : std_logic_vector (13 downto 0);
    signal u1_roundedCos_q : std_logic_vector (11 downto 0);
    signal u1_doSwap_q : std_logic_vector(0 downto 0);
    signal u1_doSinInvert_q : std_logic_vector(0 downto 0);
    signal u1_doCosInvert_q : std_logic_vector(0 downto 0);
    signal u1_sinSwapMux_s : std_logic_vector (0 downto 0);
    signal u1_sinSwapMux_q : std_logic_vector (11 downto 0);
    signal u1_cosSwapMux_s : std_logic_vector (0 downto 0);
    signal u1_cosSwapMux_q : std_logic_vector (11 downto 0);
    signal u1_sinInvert_a : std_logic_vector(11 downto 0);
    signal u1_sinInvert_b : std_logic_vector(11 downto 0);
    signal u1_sinInvert_i : std_logic_vector (11 downto 0);
    signal u1_sinInvert_a1 : std_logic_vector(11 downto 0);
    signal u1_sinInvert_b1 : std_logic_vector(11 downto 0);
    signal u1_sinInvert_o : std_logic_vector (11 downto 0);
    signal u1_sinInvert_q : std_logic_vector (11 downto 0);
    signal u1_cosInvert_a : std_logic_vector(11 downto 0);
    signal u1_cosInvert_b : std_logic_vector(11 downto 0);
    signal u1_cosInvert_i : std_logic_vector (11 downto 0);
    signal u1_cosInvert_a1 : std_logic_vector(11 downto 0);
    signal u1_cosInvert_b1 : std_logic_vector(11 downto 0);
    signal u1_cosInvert_o : std_logic_vector (11 downto 0);
    signal u1_cosInvert_q : std_logic_vector (11 downto 0);
    signal u2_accumAdd_b1_a : std_logic_vector(17 downto 0);
    signal u2_accumAdd_b1_b : std_logic_vector(17 downto 0);
    signal u2_accumAdd_b1_i : std_logic_vector (17 downto 0);
    signal u2_accumAdd_b1_a1 : std_logic_vector(17 downto 0);
    signal u2_accumAdd_b1_b1 : std_logic_vector(17 downto 0);
    signal u2_accumAdd_b1_o : std_logic_vector (17 downto 0);
    signal u2_accumAdd_b1_q : std_logic_vector (17 downto 0);
    signal d_u2_accumAdd_b1_q_12_q : std_logic_vector (17 downto 0);
    signal d_u2_octantBitSelect_b_20_q : std_logic_vector (2 downto 0);
    signal u2_rangeLUT_q : std_logic_vector(18 downto 0);
    signal u2_addnsubConst_q : std_logic_vector(0 downto 0);
    signal u2_rangeAddSub_a : std_logic_vector(20 downto 0);
    signal u2_rangeAddSub_b : std_logic_vector(20 downto 0);
    signal u2_rangeAddSub_o : std_logic_vector (20 downto 0);
    signal u2_rangeAddSub_cin : std_logic_vector (0 downto 0);
    signal u2_rangeAddSub_q : std_logic_vector (18 downto 0);
    signal u2_sinTable_reset0 : std_logic;
    signal u2_sinTable_iq : std_logic_vector (11 downto 0);
    signal u2_sinTable_ia : std_logic_vector (11 downto 0);
    signal u2_sinTable_ir : std_logic_vector (11 downto 0);
    signal u2_sinTable_aa : std_logic_vector (7 downto 0);
    signal u2_sinTable_ab : std_logic_vector (7 downto 0);
    signal u2_sinTable_q : std_logic_vector (11 downto 0);
    signal u2_cosTable_reset0 : std_logic;
    signal u2_cosTable_iq : std_logic_vector (11 downto 0);
    signal u2_cosTable_ia : std_logic_vector (11 downto 0);
    signal u2_cosTable_ir : std_logic_vector (11 downto 0);
    signal u2_cosTable_aa : std_logic_vector (7 downto 0);
    signal u2_cosTable_ab : std_logic_vector (7 downto 0);
    signal u2_cosTable_q : std_logic_vector (11 downto 0);
    signal u2_cm1_a : std_logic_vector(19 downto 0);
    signal u2_cm1_b : std_logic_vector(19 downto 0);
    signal u2_cm1_o : std_logic_vector (19 downto 0);
    signal u2_cm1_q : std_logic_vector (19 downto 0);
    signal u2_cm2_a : std_logic_vector(14 downto 0);
    signal u2_cm2_b : std_logic_vector(14 downto 0);
    signal u2_cm2_o : std_logic_vector (14 downto 0);
    signal u2_cm2_q : std_logic_vector (14 downto 0);
    signal u2_cm3_a : std_logic_vector(20 downto 0);
    signal u2_cm3_b : std_logic_vector(20 downto 0);
    signal u2_cm3_o : std_logic_vector (20 downto 0);
    signal u2_cm3_q : std_logic_vector (20 downto 0);
    signal u2_sinMult_a : std_logic_vector (11 downto 0);
    signal u2_sinMult_b : std_logic_vector (11 downto 0);
    signal u2_sinMult_s1 : std_logic_vector (23 downto 0);
    signal u2_sinMult_pr : UNSIGNED (23 downto 0);
    signal u2_sinMult_q : std_logic_vector (23 downto 0);
    signal u2_cosMult_a : std_logic_vector (11 downto 0);
    signal u2_cosMult_b : std_logic_vector (11 downto 0);
    signal u2_cosMult_s1 : std_logic_vector (23 downto 0);
    signal u2_cosMult_pr : UNSIGNED (23 downto 0);
    signal u2_cosMult_q : std_logic_vector (23 downto 0);
    signal u2_sinAdd_a : std_logic_vector(13 downto 0);
    signal u2_sinAdd_b : std_logic_vector(13 downto 0);
    signal u2_sinAdd_i : std_logic_vector (13 downto 0);
    signal u2_sinAdd_a1 : std_logic_vector(13 downto 0);
    signal u2_sinAdd_b1 : std_logic_vector(13 downto 0);
    signal u2_sinAdd_o : std_logic_vector (13 downto 0);
    signal u2_sinAdd_q : std_logic_vector (13 downto 0);
    signal u2_cosSub_a : std_logic_vector(13 downto 0);
    signal u2_cosSub_b : std_logic_vector(13 downto 0);
    signal u2_cosSub_i : std_logic_vector (13 downto 0);
    signal u2_cosSub_a1 : std_logic_vector(13 downto 0);
    signal u2_cosSub_b1 : std_logic_vector(13 downto 0);
    signal u2_cosSub_o : std_logic_vector (13 downto 0);
    signal u2_cosSub_q : std_logic_vector (13 downto 0);
    signal u2_roundedSin_in : std_logic_vector (13 downto 0);
    signal u2_roundedSin_q : std_logic_vector (11 downto 0);
    signal u2_roundedCos_in : std_logic_vector (13 downto 0);
    signal u2_roundedCos_q : std_logic_vector (11 downto 0);
    signal u2_doSwap_q : std_logic_vector(0 downto 0);
    signal u2_doSinInvert_q : std_logic_vector(0 downto 0);
    signal u2_doCosInvert_q : std_logic_vector(0 downto 0);
    signal u2_sinSwapMux_s : std_logic_vector (0 downto 0);
    signal u2_sinSwapMux_q : std_logic_vector (11 downto 0);
    signal u2_cosSwapMux_s : std_logic_vector (0 downto 0);
    signal u2_cosSwapMux_q : std_logic_vector (11 downto 0);
    signal u2_sinInvert_a : std_logic_vector(11 downto 0);
    signal u2_sinInvert_b : std_logic_vector(11 downto 0);
    signal u2_sinInvert_i : std_logic_vector (11 downto 0);
    signal u2_sinInvert_a1 : std_logic_vector(11 downto 0);
    signal u2_sinInvert_b1 : std_logic_vector(11 downto 0);
    signal u2_sinInvert_o : std_logic_vector (11 downto 0);
    signal u2_sinInvert_q : std_logic_vector (11 downto 0);
    signal u2_cosInvert_a : std_logic_vector(11 downto 0);
    signal u2_cosInvert_b : std_logic_vector(11 downto 0);
    signal u2_cosInvert_i : std_logic_vector (11 downto 0);
    signal u2_cosInvert_a1 : std_logic_vector(11 downto 0);
    signal u2_cosInvert_b1 : std_logic_vector(11 downto 0);
    signal u2_cosInvert_o : std_logic_vector (11 downto 0);
    signal u2_cosInvert_q : std_logic_vector (11 downto 0);
    signal u3_accumAdd_b1_a : std_logic_vector(17 downto 0);
    signal u3_accumAdd_b1_b : std_logic_vector(17 downto 0);
    signal u3_accumAdd_b1_i : std_logic_vector (17 downto 0);
    signal u3_accumAdd_b1_a1 : std_logic_vector(17 downto 0);
    signal u3_accumAdd_b1_b1 : std_logic_vector(17 downto 0);
    signal u3_accumAdd_b1_o : std_logic_vector (17 downto 0);
    signal u3_accumAdd_b1_q : std_logic_vector (17 downto 0);
    signal d_u3_accumAdd_b1_q_12_q : std_logic_vector (17 downto 0);
    signal d_u3_octantBitSelect_b_20_q : std_logic_vector (2 downto 0);
    signal u3_rangeLUT_q : std_logic_vector(18 downto 0);
    signal u3_addnsubConst_q : std_logic_vector(0 downto 0);
    signal u3_rangeAddSub_a : std_logic_vector(20 downto 0);
    signal u3_rangeAddSub_b : std_logic_vector(20 downto 0);
    signal u3_rangeAddSub_o : std_logic_vector (20 downto 0);
    signal u3_rangeAddSub_cin : std_logic_vector (0 downto 0);
    signal u3_rangeAddSub_q : std_logic_vector (18 downto 0);
    signal u3_sinTable_reset0 : std_logic;
    signal u3_sinTable_iq : std_logic_vector (11 downto 0);
    signal u3_sinTable_ia : std_logic_vector (11 downto 0);
    signal u3_sinTable_ir : std_logic_vector (11 downto 0);
    signal u3_sinTable_aa : std_logic_vector (7 downto 0);
    signal u3_sinTable_ab : std_logic_vector (7 downto 0);
    signal u3_sinTable_q : std_logic_vector (11 downto 0);
    signal u3_cosTable_reset0 : std_logic;
    signal u3_cosTable_iq : std_logic_vector (11 downto 0);
    signal u3_cosTable_ia : std_logic_vector (11 downto 0);
    signal u3_cosTable_ir : std_logic_vector (11 downto 0);
    signal u3_cosTable_aa : std_logic_vector (7 downto 0);
    signal u3_cosTable_ab : std_logic_vector (7 downto 0);
    signal u3_cosTable_q : std_logic_vector (11 downto 0);
    signal u3_cm1_a : std_logic_vector(19 downto 0);
    signal u3_cm1_b : std_logic_vector(19 downto 0);
    signal u3_cm1_o : std_logic_vector (19 downto 0);
    signal u3_cm1_q : std_logic_vector (19 downto 0);
    signal u3_cm2_a : std_logic_vector(14 downto 0);
    signal u3_cm2_b : std_logic_vector(14 downto 0);
    signal u3_cm2_o : std_logic_vector (14 downto 0);
    signal u3_cm2_q : std_logic_vector (14 downto 0);
    signal u3_cm3_a : std_logic_vector(20 downto 0);
    signal u3_cm3_b : std_logic_vector(20 downto 0);
    signal u3_cm3_o : std_logic_vector (20 downto 0);
    signal u3_cm3_q : std_logic_vector (20 downto 0);
    signal u3_sinMult_a : std_logic_vector (11 downto 0);
    signal u3_sinMult_b : std_logic_vector (11 downto 0);
    signal u3_sinMult_s1 : std_logic_vector (23 downto 0);
    signal u3_sinMult_pr : UNSIGNED (23 downto 0);
    signal u3_sinMult_q : std_logic_vector (23 downto 0);
    signal u3_cosMult_a : std_logic_vector (11 downto 0);
    signal u3_cosMult_b : std_logic_vector (11 downto 0);
    signal u3_cosMult_s1 : std_logic_vector (23 downto 0);
    signal u3_cosMult_pr : UNSIGNED (23 downto 0);
    signal u3_cosMult_q : std_logic_vector (23 downto 0);
    signal u3_sinAdd_a : std_logic_vector(13 downto 0);
    signal u3_sinAdd_b : std_logic_vector(13 downto 0);
    signal u3_sinAdd_i : std_logic_vector (13 downto 0);
    signal u3_sinAdd_a1 : std_logic_vector(13 downto 0);
    signal u3_sinAdd_b1 : std_logic_vector(13 downto 0);
    signal u3_sinAdd_o : std_logic_vector (13 downto 0);
    signal u3_sinAdd_q : std_logic_vector (13 downto 0);
    signal u3_cosSub_a : std_logic_vector(13 downto 0);
    signal u3_cosSub_b : std_logic_vector(13 downto 0);
    signal u3_cosSub_i : std_logic_vector (13 downto 0);
    signal u3_cosSub_a1 : std_logic_vector(13 downto 0);
    signal u3_cosSub_b1 : std_logic_vector(13 downto 0);
    signal u3_cosSub_o : std_logic_vector (13 downto 0);
    signal u3_cosSub_q : std_logic_vector (13 downto 0);
    signal u3_roundedSin_in : std_logic_vector (13 downto 0);
    signal u3_roundedSin_q : std_logic_vector (11 downto 0);
    signal u3_roundedCos_in : std_logic_vector (13 downto 0);
    signal u3_roundedCos_q : std_logic_vector (11 downto 0);
    signal u3_doSwap_q : std_logic_vector(0 downto 0);
    signal u3_doSinInvert_q : std_logic_vector(0 downto 0);
    signal u3_doCosInvert_q : std_logic_vector(0 downto 0);
    signal u3_sinSwapMux_s : std_logic_vector (0 downto 0);
    signal u3_sinSwapMux_q : std_logic_vector (11 downto 0);
    signal u3_cosSwapMux_s : std_logic_vector (0 downto 0);
    signal u3_cosSwapMux_q : std_logic_vector (11 downto 0);
    signal u3_sinInvert_a : std_logic_vector(11 downto 0);
    signal u3_sinInvert_b : std_logic_vector(11 downto 0);
    signal u3_sinInvert_i : std_logic_vector (11 downto 0);
    signal u3_sinInvert_a1 : std_logic_vector(11 downto 0);
    signal u3_sinInvert_b1 : std_logic_vector(11 downto 0);
    signal u3_sinInvert_o : std_logic_vector (11 downto 0);
    signal u3_sinInvert_q : std_logic_vector (11 downto 0);
    signal u3_cosInvert_a : std_logic_vector(11 downto 0);
    signal u3_cosInvert_b : std_logic_vector(11 downto 0);
    signal u3_cosInvert_i : std_logic_vector (11 downto 0);
    signal u3_cosInvert_a1 : std_logic_vector(11 downto 0);
    signal u3_cosInvert_b1 : std_logic_vector(11 downto 0);
    signal u3_cosInvert_o : std_logic_vector (11 downto 0);
    signal u3_cosInvert_q : std_logic_vector (11 downto 0);
    signal u4_accumAdd_b1_a : std_logic_vector(17 downto 0);
    signal u4_accumAdd_b1_b : std_logic_vector(17 downto 0);
    signal u4_accumAdd_b1_i : std_logic_vector (17 downto 0);
    signal u4_accumAdd_b1_a1 : std_logic_vector(17 downto 0);
    signal u4_accumAdd_b1_b1 : std_logic_vector(17 downto 0);
    signal u4_accumAdd_b1_o : std_logic_vector (17 downto 0);
    signal u4_accumAdd_b1_q : std_logic_vector (17 downto 0);
    signal d_u4_accumAdd_b1_q_12_q : std_logic_vector (17 downto 0);
    signal d_u4_octantBitSelect_b_20_q : std_logic_vector (2 downto 0);
    signal u4_rangeLUT_q : std_logic_vector(18 downto 0);
    signal u4_addnsubConst_q : std_logic_vector(0 downto 0);
    signal u4_rangeAddSub_a : std_logic_vector(20 downto 0);
    signal u4_rangeAddSub_b : std_logic_vector(20 downto 0);
    signal u4_rangeAddSub_o : std_logic_vector (20 downto 0);
    signal u4_rangeAddSub_cin : std_logic_vector (0 downto 0);
    signal u4_rangeAddSub_q : std_logic_vector (18 downto 0);
    signal u4_sinTable_reset0 : std_logic;
    signal u4_sinTable_iq : std_logic_vector (11 downto 0);
    signal u4_sinTable_ia : std_logic_vector (11 downto 0);
    signal u4_sinTable_ir : std_logic_vector (11 downto 0);
    signal u4_sinTable_aa : std_logic_vector (7 downto 0);
    signal u4_sinTable_ab : std_logic_vector (7 downto 0);
    signal u4_sinTable_q : std_logic_vector (11 downto 0);
    signal u4_cosTable_reset0 : std_logic;
    signal u4_cosTable_iq : std_logic_vector (11 downto 0);
    signal u4_cosTable_ia : std_logic_vector (11 downto 0);
    signal u4_cosTable_ir : std_logic_vector (11 downto 0);
    signal u4_cosTable_aa : std_logic_vector (7 downto 0);
    signal u4_cosTable_ab : std_logic_vector (7 downto 0);
    signal u4_cosTable_q : std_logic_vector (11 downto 0);
    signal u4_cm1_a : std_logic_vector(19 downto 0);
    signal u4_cm1_b : std_logic_vector(19 downto 0);
    signal u4_cm1_o : std_logic_vector (19 downto 0);
    signal u4_cm1_q : std_logic_vector (19 downto 0);
    signal u4_cm2_a : std_logic_vector(14 downto 0);
    signal u4_cm2_b : std_logic_vector(14 downto 0);
    signal u4_cm2_o : std_logic_vector (14 downto 0);
    signal u4_cm2_q : std_logic_vector (14 downto 0);
    signal u4_cm3_a : std_logic_vector(20 downto 0);
    signal u4_cm3_b : std_logic_vector(20 downto 0);
    signal u4_cm3_o : std_logic_vector (20 downto 0);
    signal u4_cm3_q : std_logic_vector (20 downto 0);
    signal u4_sinMult_a : std_logic_vector (11 downto 0);
    signal u4_sinMult_b : std_logic_vector (11 downto 0);
    signal u4_sinMult_s1 : std_logic_vector (23 downto 0);
    signal u4_sinMult_pr : UNSIGNED (23 downto 0);
    signal u4_sinMult_q : std_logic_vector (23 downto 0);
    signal u4_cosMult_a : std_logic_vector (11 downto 0);
    signal u4_cosMult_b : std_logic_vector (11 downto 0);
    signal u4_cosMult_s1 : std_logic_vector (23 downto 0);
    signal u4_cosMult_pr : UNSIGNED (23 downto 0);
    signal u4_cosMult_q : std_logic_vector (23 downto 0);
    signal u4_sinAdd_a : std_logic_vector(13 downto 0);
    signal u4_sinAdd_b : std_logic_vector(13 downto 0);
    signal u4_sinAdd_i : std_logic_vector (13 downto 0);
    signal u4_sinAdd_a1 : std_logic_vector(13 downto 0);
    signal u4_sinAdd_b1 : std_logic_vector(13 downto 0);
    signal u4_sinAdd_o : std_logic_vector (13 downto 0);
    signal u4_sinAdd_q : std_logic_vector (13 downto 0);
    signal u4_cosSub_a : std_logic_vector(13 downto 0);
    signal u4_cosSub_b : std_logic_vector(13 downto 0);
    signal u4_cosSub_i : std_logic_vector (13 downto 0);
    signal u4_cosSub_a1 : std_logic_vector(13 downto 0);
    signal u4_cosSub_b1 : std_logic_vector(13 downto 0);
    signal u4_cosSub_o : std_logic_vector (13 downto 0);
    signal u4_cosSub_q : std_logic_vector (13 downto 0);
    signal u4_roundedSin_in : std_logic_vector (13 downto 0);
    signal u4_roundedSin_q : std_logic_vector (11 downto 0);
    signal u4_roundedCos_in : std_logic_vector (13 downto 0);
    signal u4_roundedCos_q : std_logic_vector (11 downto 0);
    signal u4_doSwap_q : std_logic_vector(0 downto 0);
    signal u4_doSinInvert_q : std_logic_vector(0 downto 0);
    signal u4_doCosInvert_q : std_logic_vector(0 downto 0);
    signal u4_sinSwapMux_s : std_logic_vector (0 downto 0);
    signal u4_sinSwapMux_q : std_logic_vector (11 downto 0);
    signal u4_cosSwapMux_s : std_logic_vector (0 downto 0);
    signal u4_cosSwapMux_q : std_logic_vector (11 downto 0);
    signal u4_sinInvert_a : std_logic_vector(11 downto 0);
    signal u4_sinInvert_b : std_logic_vector(11 downto 0);
    signal u4_sinInvert_i : std_logic_vector (11 downto 0);
    signal u4_sinInvert_a1 : std_logic_vector(11 downto 0);
    signal u4_sinInvert_b1 : std_logic_vector(11 downto 0);
    signal u4_sinInvert_o : std_logic_vector (11 downto 0);
    signal u4_sinInvert_q : std_logic_vector (11 downto 0);
    signal u4_cosInvert_a : std_logic_vector(11 downto 0);
    signal u4_cosInvert_b : std_logic_vector(11 downto 0);
    signal u4_cosInvert_i : std_logic_vector (11 downto 0);
    signal u4_cosInvert_a1 : std_logic_vector(11 downto 0);
    signal u4_cosInvert_b1 : std_logic_vector(11 downto 0);
    signal u4_cosInvert_o : std_logic_vector (11 downto 0);
    signal u4_cosInvert_q : std_logic_vector (11 downto 0);
    signal u5_accumAdd_b1_a : std_logic_vector(17 downto 0);
    signal u5_accumAdd_b1_b : std_logic_vector(17 downto 0);
    signal u5_accumAdd_b1_i : std_logic_vector (17 downto 0);
    signal u5_accumAdd_b1_a1 : std_logic_vector(17 downto 0);
    signal u5_accumAdd_b1_b1 : std_logic_vector(17 downto 0);
    signal u5_accumAdd_b1_o : std_logic_vector (17 downto 0);
    signal u5_accumAdd_b1_q : std_logic_vector (17 downto 0);
    signal d_u5_accumAdd_b1_q_12_q : std_logic_vector (17 downto 0);
    signal d_u5_octantBitSelect_b_20_q : std_logic_vector (2 downto 0);
    signal u5_rangeLUT_q : std_logic_vector(18 downto 0);
    signal u5_addnsubConst_q : std_logic_vector(0 downto 0);
    signal u5_rangeAddSub_a : std_logic_vector(20 downto 0);
    signal u5_rangeAddSub_b : std_logic_vector(20 downto 0);
    signal u5_rangeAddSub_o : std_logic_vector (20 downto 0);
    signal u5_rangeAddSub_cin : std_logic_vector (0 downto 0);
    signal u5_rangeAddSub_q : std_logic_vector (18 downto 0);
    signal u5_sinTable_reset0 : std_logic;
    signal u5_sinTable_iq : std_logic_vector (11 downto 0);
    signal u5_sinTable_ia : std_logic_vector (11 downto 0);
    signal u5_sinTable_ir : std_logic_vector (11 downto 0);
    signal u5_sinTable_aa : std_logic_vector (7 downto 0);
    signal u5_sinTable_ab : std_logic_vector (7 downto 0);
    signal u5_sinTable_q : std_logic_vector (11 downto 0);
    signal u5_cosTable_reset0 : std_logic;
    signal u5_cosTable_iq : std_logic_vector (11 downto 0);
    signal u5_cosTable_ia : std_logic_vector (11 downto 0);
    signal u5_cosTable_ir : std_logic_vector (11 downto 0);
    signal u5_cosTable_aa : std_logic_vector (7 downto 0);
    signal u5_cosTable_ab : std_logic_vector (7 downto 0);
    signal u5_cosTable_q : std_logic_vector (11 downto 0);
    signal u5_cm1_a : std_logic_vector(19 downto 0);
    signal u5_cm1_b : std_logic_vector(19 downto 0);
    signal u5_cm1_o : std_logic_vector (19 downto 0);
    signal u5_cm1_q : std_logic_vector (19 downto 0);
    signal u5_cm2_a : std_logic_vector(14 downto 0);
    signal u5_cm2_b : std_logic_vector(14 downto 0);
    signal u5_cm2_o : std_logic_vector (14 downto 0);
    signal u5_cm2_q : std_logic_vector (14 downto 0);
    signal u5_cm3_a : std_logic_vector(20 downto 0);
    signal u5_cm3_b : std_logic_vector(20 downto 0);
    signal u5_cm3_o : std_logic_vector (20 downto 0);
    signal u5_cm3_q : std_logic_vector (20 downto 0);
    signal u5_sinMult_a : std_logic_vector (11 downto 0);
    signal u5_sinMult_b : std_logic_vector (11 downto 0);
    signal u5_sinMult_s1 : std_logic_vector (23 downto 0);
    signal u5_sinMult_pr : UNSIGNED (23 downto 0);
    signal u5_sinMult_q : std_logic_vector (23 downto 0);
    signal u5_cosMult_a : std_logic_vector (11 downto 0);
    signal u5_cosMult_b : std_logic_vector (11 downto 0);
    signal u5_cosMult_s1 : std_logic_vector (23 downto 0);
    signal u5_cosMult_pr : UNSIGNED (23 downto 0);
    signal u5_cosMult_q : std_logic_vector (23 downto 0);
    signal u5_sinAdd_a : std_logic_vector(13 downto 0);
    signal u5_sinAdd_b : std_logic_vector(13 downto 0);
    signal u5_sinAdd_i : std_logic_vector (13 downto 0);
    signal u5_sinAdd_a1 : std_logic_vector(13 downto 0);
    signal u5_sinAdd_b1 : std_logic_vector(13 downto 0);
    signal u5_sinAdd_o : std_logic_vector (13 downto 0);
    signal u5_sinAdd_q : std_logic_vector (13 downto 0);
    signal u5_cosSub_a : std_logic_vector(13 downto 0);
    signal u5_cosSub_b : std_logic_vector(13 downto 0);
    signal u5_cosSub_i : std_logic_vector (13 downto 0);
    signal u5_cosSub_a1 : std_logic_vector(13 downto 0);
    signal u5_cosSub_b1 : std_logic_vector(13 downto 0);
    signal u5_cosSub_o : std_logic_vector (13 downto 0);
    signal u5_cosSub_q : std_logic_vector (13 downto 0);
    signal u5_roundedSin_in : std_logic_vector (13 downto 0);
    signal u5_roundedSin_q : std_logic_vector (11 downto 0);
    signal u5_roundedCos_in : std_logic_vector (13 downto 0);
    signal u5_roundedCos_q : std_logic_vector (11 downto 0);
    signal u5_doSwap_q : std_logic_vector(0 downto 0);
    signal u5_doSinInvert_q : std_logic_vector(0 downto 0);
    signal u5_doCosInvert_q : std_logic_vector(0 downto 0);
    signal u5_sinSwapMux_s : std_logic_vector (0 downto 0);
    signal u5_sinSwapMux_q : std_logic_vector (11 downto 0);
    signal u5_cosSwapMux_s : std_logic_vector (0 downto 0);
    signal u5_cosSwapMux_q : std_logic_vector (11 downto 0);
    signal u5_sinInvert_a : std_logic_vector(11 downto 0);
    signal u5_sinInvert_b : std_logic_vector(11 downto 0);
    signal u5_sinInvert_i : std_logic_vector (11 downto 0);
    signal u5_sinInvert_a1 : std_logic_vector(11 downto 0);
    signal u5_sinInvert_b1 : std_logic_vector(11 downto 0);
    signal u5_sinInvert_o : std_logic_vector (11 downto 0);
    signal u5_sinInvert_q : std_logic_vector (11 downto 0);
    signal u5_cosInvert_a : std_logic_vector(11 downto 0);
    signal u5_cosInvert_b : std_logic_vector(11 downto 0);
    signal u5_cosInvert_i : std_logic_vector (11 downto 0);
    signal u5_cosInvert_a1 : std_logic_vector(11 downto 0);
    signal u5_cosInvert_b1 : std_logic_vector(11 downto 0);
    signal u5_cosInvert_o : std_logic_vector (11 downto 0);
    signal u5_cosInvert_q : std_logic_vector (11 downto 0);
    signal u6_accumAdd_b1_a : std_logic_vector(17 downto 0);
    signal u6_accumAdd_b1_b : std_logic_vector(17 downto 0);
    signal u6_accumAdd_b1_i : std_logic_vector (17 downto 0);
    signal u6_accumAdd_b1_a1 : std_logic_vector(17 downto 0);
    signal u6_accumAdd_b1_b1 : std_logic_vector(17 downto 0);
    signal u6_accumAdd_b1_o : std_logic_vector (17 downto 0);
    signal u6_accumAdd_b1_q : std_logic_vector (17 downto 0);
    signal d_u6_accumAdd_b1_q_12_q : std_logic_vector (17 downto 0);
    signal d_u6_octantBitSelect_b_20_q : std_logic_vector (2 downto 0);
    signal u6_rangeLUT_q : std_logic_vector(18 downto 0);
    signal u6_addnsubConst_q : std_logic_vector(0 downto 0);
    signal u6_rangeAddSub_a : std_logic_vector(20 downto 0);
    signal u6_rangeAddSub_b : std_logic_vector(20 downto 0);
    signal u6_rangeAddSub_o : std_logic_vector (20 downto 0);
    signal u6_rangeAddSub_cin : std_logic_vector (0 downto 0);
    signal u6_rangeAddSub_q : std_logic_vector (18 downto 0);
    signal u6_sinTable_reset0 : std_logic;
    signal u6_sinTable_iq : std_logic_vector (11 downto 0);
    signal u6_sinTable_ia : std_logic_vector (11 downto 0);
    signal u6_sinTable_ir : std_logic_vector (11 downto 0);
    signal u6_sinTable_aa : std_logic_vector (7 downto 0);
    signal u6_sinTable_ab : std_logic_vector (7 downto 0);
    signal u6_sinTable_q : std_logic_vector (11 downto 0);
    signal u6_cosTable_reset0 : std_logic;
    signal u6_cosTable_iq : std_logic_vector (11 downto 0);
    signal u6_cosTable_ia : std_logic_vector (11 downto 0);
    signal u6_cosTable_ir : std_logic_vector (11 downto 0);
    signal u6_cosTable_aa : std_logic_vector (7 downto 0);
    signal u6_cosTable_ab : std_logic_vector (7 downto 0);
    signal u6_cosTable_q : std_logic_vector (11 downto 0);
    signal u6_cm1_a : std_logic_vector(19 downto 0);
    signal u6_cm1_b : std_logic_vector(19 downto 0);
    signal u6_cm1_o : std_logic_vector (19 downto 0);
    signal u6_cm1_q : std_logic_vector (19 downto 0);
    signal u6_cm2_a : std_logic_vector(14 downto 0);
    signal u6_cm2_b : std_logic_vector(14 downto 0);
    signal u6_cm2_o : std_logic_vector (14 downto 0);
    signal u6_cm2_q : std_logic_vector (14 downto 0);
    signal u6_cm3_a : std_logic_vector(20 downto 0);
    signal u6_cm3_b : std_logic_vector(20 downto 0);
    signal u6_cm3_o : std_logic_vector (20 downto 0);
    signal u6_cm3_q : std_logic_vector (20 downto 0);
    signal u6_sinMult_a : std_logic_vector (11 downto 0);
    signal u6_sinMult_b : std_logic_vector (11 downto 0);
    signal u6_sinMult_s1 : std_logic_vector (23 downto 0);
    signal u6_sinMult_pr : UNSIGNED (23 downto 0);
    signal u6_sinMult_q : std_logic_vector (23 downto 0);
    signal u6_cosMult_a : std_logic_vector (11 downto 0);
    signal u6_cosMult_b : std_logic_vector (11 downto 0);
    signal u6_cosMult_s1 : std_logic_vector (23 downto 0);
    signal u6_cosMult_pr : UNSIGNED (23 downto 0);
    signal u6_cosMult_q : std_logic_vector (23 downto 0);
    signal u6_sinAdd_a : std_logic_vector(13 downto 0);
    signal u6_sinAdd_b : std_logic_vector(13 downto 0);
    signal u6_sinAdd_i : std_logic_vector (13 downto 0);
    signal u6_sinAdd_a1 : std_logic_vector(13 downto 0);
    signal u6_sinAdd_b1 : std_logic_vector(13 downto 0);
    signal u6_sinAdd_o : std_logic_vector (13 downto 0);
    signal u6_sinAdd_q : std_logic_vector (13 downto 0);
    signal u6_cosSub_a : std_logic_vector(13 downto 0);
    signal u6_cosSub_b : std_logic_vector(13 downto 0);
    signal u6_cosSub_i : std_logic_vector (13 downto 0);
    signal u6_cosSub_a1 : std_logic_vector(13 downto 0);
    signal u6_cosSub_b1 : std_logic_vector(13 downto 0);
    signal u6_cosSub_o : std_logic_vector (13 downto 0);
    signal u6_cosSub_q : std_logic_vector (13 downto 0);
    signal u6_roundedSin_in : std_logic_vector (13 downto 0);
    signal u6_roundedSin_q : std_logic_vector (11 downto 0);
    signal u6_roundedCos_in : std_logic_vector (13 downto 0);
    signal u6_roundedCos_q : std_logic_vector (11 downto 0);
    signal u6_doSwap_q : std_logic_vector(0 downto 0);
    signal u6_doSinInvert_q : std_logic_vector(0 downto 0);
    signal u6_doCosInvert_q : std_logic_vector(0 downto 0);
    signal u6_sinSwapMux_s : std_logic_vector (0 downto 0);
    signal u6_sinSwapMux_q : std_logic_vector (11 downto 0);
    signal u6_cosSwapMux_s : std_logic_vector (0 downto 0);
    signal u6_cosSwapMux_q : std_logic_vector (11 downto 0);
    signal u6_sinInvert_a : std_logic_vector(11 downto 0);
    signal u6_sinInvert_b : std_logic_vector(11 downto 0);
    signal u6_sinInvert_i : std_logic_vector (11 downto 0);
    signal u6_sinInvert_a1 : std_logic_vector(11 downto 0);
    signal u6_sinInvert_b1 : std_logic_vector(11 downto 0);
    signal u6_sinInvert_o : std_logic_vector (11 downto 0);
    signal u6_sinInvert_q : std_logic_vector (11 downto 0);
    signal u6_cosInvert_a : std_logic_vector(11 downto 0);
    signal u6_cosInvert_b : std_logic_vector(11 downto 0);
    signal u6_cosInvert_i : std_logic_vector (11 downto 0);
    signal u6_cosInvert_a1 : std_logic_vector(11 downto 0);
    signal u6_cosInvert_b1 : std_logic_vector(11 downto 0);
    signal u6_cosInvert_o : std_logic_vector (11 downto 0);
    signal u6_cosInvert_q : std_logic_vector (11 downto 0);
    signal u7_accumAdd_b1_a : std_logic_vector(17 downto 0);
    signal u7_accumAdd_b1_b : std_logic_vector(17 downto 0);
    signal u7_accumAdd_b1_i : std_logic_vector (17 downto 0);
    signal u7_accumAdd_b1_a1 : std_logic_vector(17 downto 0);
    signal u7_accumAdd_b1_b1 : std_logic_vector(17 downto 0);
    signal u7_accumAdd_b1_o : std_logic_vector (17 downto 0);
    signal u7_accumAdd_b1_q : std_logic_vector (17 downto 0);
    signal d_u7_accumAdd_b1_q_12_q : std_logic_vector (17 downto 0);
    signal d_u7_octantBitSelect_b_20_q : std_logic_vector (2 downto 0);
    signal u7_rangeLUT_q : std_logic_vector(18 downto 0);
    signal u7_addnsubConst_q : std_logic_vector(0 downto 0);
    signal u7_rangeAddSub_a : std_logic_vector(20 downto 0);
    signal u7_rangeAddSub_b : std_logic_vector(20 downto 0);
    signal u7_rangeAddSub_o : std_logic_vector (20 downto 0);
    signal u7_rangeAddSub_cin : std_logic_vector (0 downto 0);
    signal u7_rangeAddSub_q : std_logic_vector (18 downto 0);
    signal u7_sinTable_reset0 : std_logic;
    signal u7_sinTable_iq : std_logic_vector (11 downto 0);
    signal u7_sinTable_ia : std_logic_vector (11 downto 0);
    signal u7_sinTable_ir : std_logic_vector (11 downto 0);
    signal u7_sinTable_aa : std_logic_vector (7 downto 0);
    signal u7_sinTable_ab : std_logic_vector (7 downto 0);
    signal u7_sinTable_q : std_logic_vector (11 downto 0);
    signal u7_cosTable_reset0 : std_logic;
    signal u7_cosTable_iq : std_logic_vector (11 downto 0);
    signal u7_cosTable_ia : std_logic_vector (11 downto 0);
    signal u7_cosTable_ir : std_logic_vector (11 downto 0);
    signal u7_cosTable_aa : std_logic_vector (7 downto 0);
    signal u7_cosTable_ab : std_logic_vector (7 downto 0);
    signal u7_cosTable_q : std_logic_vector (11 downto 0);
    signal u7_cm1_a : std_logic_vector(19 downto 0);
    signal u7_cm1_b : std_logic_vector(19 downto 0);
    signal u7_cm1_o : std_logic_vector (19 downto 0);
    signal u7_cm1_q : std_logic_vector (19 downto 0);
    signal u7_cm2_a : std_logic_vector(14 downto 0);
    signal u7_cm2_b : std_logic_vector(14 downto 0);
    signal u7_cm2_o : std_logic_vector (14 downto 0);
    signal u7_cm2_q : std_logic_vector (14 downto 0);
    signal u7_cm3_a : std_logic_vector(20 downto 0);
    signal u7_cm3_b : std_logic_vector(20 downto 0);
    signal u7_cm3_o : std_logic_vector (20 downto 0);
    signal u7_cm3_q : std_logic_vector (20 downto 0);
    signal u7_sinMult_a : std_logic_vector (11 downto 0);
    signal u7_sinMult_b : std_logic_vector (11 downto 0);
    signal u7_sinMult_s1 : std_logic_vector (23 downto 0);
    signal u7_sinMult_pr : UNSIGNED (23 downto 0);
    signal u7_sinMult_q : std_logic_vector (23 downto 0);
    signal u7_cosMult_a : std_logic_vector (11 downto 0);
    signal u7_cosMult_b : std_logic_vector (11 downto 0);
    signal u7_cosMult_s1 : std_logic_vector (23 downto 0);
    signal u7_cosMult_pr : UNSIGNED (23 downto 0);
    signal u7_cosMult_q : std_logic_vector (23 downto 0);
    signal u7_sinAdd_a : std_logic_vector(13 downto 0);
    signal u7_sinAdd_b : std_logic_vector(13 downto 0);
    signal u7_sinAdd_i : std_logic_vector (13 downto 0);
    signal u7_sinAdd_a1 : std_logic_vector(13 downto 0);
    signal u7_sinAdd_b1 : std_logic_vector(13 downto 0);
    signal u7_sinAdd_o : std_logic_vector (13 downto 0);
    signal u7_sinAdd_q : std_logic_vector (13 downto 0);
    signal u7_cosSub_a : std_logic_vector(13 downto 0);
    signal u7_cosSub_b : std_logic_vector(13 downto 0);
    signal u7_cosSub_i : std_logic_vector (13 downto 0);
    signal u7_cosSub_a1 : std_logic_vector(13 downto 0);
    signal u7_cosSub_b1 : std_logic_vector(13 downto 0);
    signal u7_cosSub_o : std_logic_vector (13 downto 0);
    signal u7_cosSub_q : std_logic_vector (13 downto 0);
    signal u7_roundedSin_in : std_logic_vector (13 downto 0);
    signal u7_roundedSin_q : std_logic_vector (11 downto 0);
    signal u7_roundedCos_in : std_logic_vector (13 downto 0);
    signal u7_roundedCos_q : std_logic_vector (11 downto 0);
    signal u7_doSwap_q : std_logic_vector(0 downto 0);
    signal u7_doSinInvert_q : std_logic_vector(0 downto 0);
    signal u7_doCosInvert_q : std_logic_vector(0 downto 0);
    signal u7_sinSwapMux_s : std_logic_vector (0 downto 0);
    signal u7_sinSwapMux_q : std_logic_vector (11 downto 0);
    signal u7_cosSwapMux_s : std_logic_vector (0 downto 0);
    signal u7_cosSwapMux_q : std_logic_vector (11 downto 0);
    signal u7_sinInvert_a : std_logic_vector(11 downto 0);
    signal u7_sinInvert_b : std_logic_vector(11 downto 0);
    signal u7_sinInvert_i : std_logic_vector (11 downto 0);
    signal u7_sinInvert_a1 : std_logic_vector(11 downto 0);
    signal u7_sinInvert_b1 : std_logic_vector(11 downto 0);
    signal u7_sinInvert_o : std_logic_vector (11 downto 0);
    signal u7_sinInvert_q : std_logic_vector (11 downto 0);
    signal u7_cosInvert_a : std_logic_vector(11 downto 0);
    signal u7_cosInvert_b : std_logic_vector(11 downto 0);
    signal u7_cosInvert_i : std_logic_vector (11 downto 0);
    signal u7_cosInvert_a1 : std_logic_vector(11 downto 0);
    signal u7_cosInvert_b1 : std_logic_vector(11 downto 0);
    signal u7_cosInvert_o : std_logic_vector (11 downto 0);
    signal u7_cosInvert_q : std_logic_vector (11 downto 0);
    signal u8_accumAdd_b1_a : std_logic_vector(17 downto 0);
    signal u8_accumAdd_b1_b : std_logic_vector(17 downto 0);
    signal u8_accumAdd_b1_i : std_logic_vector (17 downto 0);
    signal u8_accumAdd_b1_a1 : std_logic_vector(17 downto 0);
    signal u8_accumAdd_b1_b1 : std_logic_vector(17 downto 0);
    signal u8_accumAdd_b1_o : std_logic_vector (17 downto 0);
    signal u8_accumAdd_b1_q : std_logic_vector (17 downto 0);
    signal d_u8_accumAdd_b1_q_12_q : std_logic_vector (17 downto 0);
    signal d_u8_octantBitSelect_b_20_q : std_logic_vector (2 downto 0);
    signal u8_rangeLUT_q : std_logic_vector(18 downto 0);
    signal u8_addnsubConst_q : std_logic_vector(0 downto 0);
    signal u8_rangeAddSub_a : std_logic_vector(20 downto 0);
    signal u8_rangeAddSub_b : std_logic_vector(20 downto 0);
    signal u8_rangeAddSub_o : std_logic_vector (20 downto 0);
    signal u8_rangeAddSub_cin : std_logic_vector (0 downto 0);
    signal u8_rangeAddSub_q : std_logic_vector (18 downto 0);
    signal u8_sinTable_reset0 : std_logic;
    signal u8_sinTable_iq : std_logic_vector (11 downto 0);
    signal u8_sinTable_ia : std_logic_vector (11 downto 0);
    signal u8_sinTable_ir : std_logic_vector (11 downto 0);
    signal u8_sinTable_aa : std_logic_vector (7 downto 0);
    signal u8_sinTable_ab : std_logic_vector (7 downto 0);
    signal u8_sinTable_q : std_logic_vector (11 downto 0);
    signal u8_cosTable_reset0 : std_logic;
    signal u8_cosTable_iq : std_logic_vector (11 downto 0);
    signal u8_cosTable_ia : std_logic_vector (11 downto 0);
    signal u8_cosTable_ir : std_logic_vector (11 downto 0);
    signal u8_cosTable_aa : std_logic_vector (7 downto 0);
    signal u8_cosTable_ab : std_logic_vector (7 downto 0);
    signal u8_cosTable_q : std_logic_vector (11 downto 0);
    signal u8_cm1_a : std_logic_vector(19 downto 0);
    signal u8_cm1_b : std_logic_vector(19 downto 0);
    signal u8_cm1_o : std_logic_vector (19 downto 0);
    signal u8_cm1_q : std_logic_vector (19 downto 0);
    signal u8_cm2_a : std_logic_vector(14 downto 0);
    signal u8_cm2_b : std_logic_vector(14 downto 0);
    signal u8_cm2_o : std_logic_vector (14 downto 0);
    signal u8_cm2_q : std_logic_vector (14 downto 0);
    signal u8_cm3_a : std_logic_vector(20 downto 0);
    signal u8_cm3_b : std_logic_vector(20 downto 0);
    signal u8_cm3_o : std_logic_vector (20 downto 0);
    signal u8_cm3_q : std_logic_vector (20 downto 0);
    signal u8_sinMult_a : std_logic_vector (11 downto 0);
    signal u8_sinMult_b : std_logic_vector (11 downto 0);
    signal u8_sinMult_s1 : std_logic_vector (23 downto 0);
    signal u8_sinMult_pr : UNSIGNED (23 downto 0);
    signal u8_sinMult_q : std_logic_vector (23 downto 0);
    signal u8_cosMult_a : std_logic_vector (11 downto 0);
    signal u8_cosMult_b : std_logic_vector (11 downto 0);
    signal u8_cosMult_s1 : std_logic_vector (23 downto 0);
    signal u8_cosMult_pr : UNSIGNED (23 downto 0);
    signal u8_cosMult_q : std_logic_vector (23 downto 0);
    signal u8_sinAdd_a : std_logic_vector(13 downto 0);
    signal u8_sinAdd_b : std_logic_vector(13 downto 0);
    signal u8_sinAdd_i : std_logic_vector (13 downto 0);
    signal u8_sinAdd_a1 : std_logic_vector(13 downto 0);
    signal u8_sinAdd_b1 : std_logic_vector(13 downto 0);
    signal u8_sinAdd_o : std_logic_vector (13 downto 0);
    signal u8_sinAdd_q : std_logic_vector (13 downto 0);
    signal u8_cosSub_a : std_logic_vector(13 downto 0);
    signal u8_cosSub_b : std_logic_vector(13 downto 0);
    signal u8_cosSub_i : std_logic_vector (13 downto 0);
    signal u8_cosSub_a1 : std_logic_vector(13 downto 0);
    signal u8_cosSub_b1 : std_logic_vector(13 downto 0);
    signal u8_cosSub_o : std_logic_vector (13 downto 0);
    signal u8_cosSub_q : std_logic_vector (13 downto 0);
    signal u8_roundedSin_in : std_logic_vector (13 downto 0);
    signal u8_roundedSin_q : std_logic_vector (11 downto 0);
    signal u8_roundedCos_in : std_logic_vector (13 downto 0);
    signal u8_roundedCos_q : std_logic_vector (11 downto 0);
    signal u8_doSwap_q : std_logic_vector(0 downto 0);
    signal u8_doSinInvert_q : std_logic_vector(0 downto 0);
    signal u8_doCosInvert_q : std_logic_vector(0 downto 0);
    signal u8_sinSwapMux_s : std_logic_vector (0 downto 0);
    signal u8_sinSwapMux_q : std_logic_vector (11 downto 0);
    signal u8_cosSwapMux_s : std_logic_vector (0 downto 0);
    signal u8_cosSwapMux_q : std_logic_vector (11 downto 0);
    signal u8_sinInvert_a : std_logic_vector(11 downto 0);
    signal u8_sinInvert_b : std_logic_vector(11 downto 0);
    signal u8_sinInvert_i : std_logic_vector (11 downto 0);
    signal u8_sinInvert_a1 : std_logic_vector(11 downto 0);
    signal u8_sinInvert_b1 : std_logic_vector(11 downto 0);
    signal u8_sinInvert_o : std_logic_vector (11 downto 0);
    signal u8_sinInvert_q : std_logic_vector (11 downto 0);
    signal u8_cosInvert_a : std_logic_vector(11 downto 0);
    signal u8_cosInvert_b : std_logic_vector(11 downto 0);
    signal u8_cosInvert_i : std_logic_vector (11 downto 0);
    signal u8_cosInvert_a1 : std_logic_vector(11 downto 0);
    signal u8_cosInvert_b1 : std_logic_vector(11 downto 0);
    signal u8_cosInvert_o : std_logic_vector (11 downto 0);
    signal u8_cosInvert_q : std_logic_vector (11 downto 0);
    signal u9_accumAdd_b1_a : std_logic_vector(17 downto 0);
    signal u9_accumAdd_b1_b : std_logic_vector(17 downto 0);
    signal u9_accumAdd_b1_i : std_logic_vector (17 downto 0);
    signal u9_accumAdd_b1_a1 : std_logic_vector(17 downto 0);
    signal u9_accumAdd_b1_b1 : std_logic_vector(17 downto 0);
    signal u9_accumAdd_b1_o : std_logic_vector (17 downto 0);
    signal u9_accumAdd_b1_q : std_logic_vector (17 downto 0);
    signal d_u9_accumAdd_b1_q_12_q : std_logic_vector (17 downto 0);
    signal d_u9_octantBitSelect_b_20_q : std_logic_vector (2 downto 0);
    signal u9_rangeLUT_q : std_logic_vector(18 downto 0);
    signal u9_addnsubConst_q : std_logic_vector(0 downto 0);
    signal u9_rangeAddSub_a : std_logic_vector(20 downto 0);
    signal u9_rangeAddSub_b : std_logic_vector(20 downto 0);
    signal u9_rangeAddSub_o : std_logic_vector (20 downto 0);
    signal u9_rangeAddSub_cin : std_logic_vector (0 downto 0);
    signal u9_rangeAddSub_q : std_logic_vector (18 downto 0);
    signal u9_sinTable_reset0 : std_logic;
    signal u9_sinTable_iq : std_logic_vector (11 downto 0);
    signal u9_sinTable_ia : std_logic_vector (11 downto 0);
    signal u9_sinTable_ir : std_logic_vector (11 downto 0);
    signal u9_sinTable_aa : std_logic_vector (7 downto 0);
    signal u9_sinTable_ab : std_logic_vector (7 downto 0);
    signal u9_sinTable_q : std_logic_vector (11 downto 0);
    signal u9_cosTable_reset0 : std_logic;
    signal u9_cosTable_iq : std_logic_vector (11 downto 0);
    signal u9_cosTable_ia : std_logic_vector (11 downto 0);
    signal u9_cosTable_ir : std_logic_vector (11 downto 0);
    signal u9_cosTable_aa : std_logic_vector (7 downto 0);
    signal u9_cosTable_ab : std_logic_vector (7 downto 0);
    signal u9_cosTable_q : std_logic_vector (11 downto 0);
    signal u9_cm1_a : std_logic_vector(19 downto 0);
    signal u9_cm1_b : std_logic_vector(19 downto 0);
    signal u9_cm1_o : std_logic_vector (19 downto 0);
    signal u9_cm1_q : std_logic_vector (19 downto 0);
    signal u9_cm2_a : std_logic_vector(14 downto 0);
    signal u9_cm2_b : std_logic_vector(14 downto 0);
    signal u9_cm2_o : std_logic_vector (14 downto 0);
    signal u9_cm2_q : std_logic_vector (14 downto 0);
    signal u9_cm3_a : std_logic_vector(20 downto 0);
    signal u9_cm3_b : std_logic_vector(20 downto 0);
    signal u9_cm3_o : std_logic_vector (20 downto 0);
    signal u9_cm3_q : std_logic_vector (20 downto 0);
    signal u9_sinMult_a : std_logic_vector (11 downto 0);
    signal u9_sinMult_b : std_logic_vector (11 downto 0);
    signal u9_sinMult_s1 : std_logic_vector (23 downto 0);
    signal u9_sinMult_pr : UNSIGNED (23 downto 0);
    signal u9_sinMult_q : std_logic_vector (23 downto 0);
    signal u9_cosMult_a : std_logic_vector (11 downto 0);
    signal u9_cosMult_b : std_logic_vector (11 downto 0);
    signal u9_cosMult_s1 : std_logic_vector (23 downto 0);
    signal u9_cosMult_pr : UNSIGNED (23 downto 0);
    signal u9_cosMult_q : std_logic_vector (23 downto 0);
    signal u9_sinAdd_a : std_logic_vector(13 downto 0);
    signal u9_sinAdd_b : std_logic_vector(13 downto 0);
    signal u9_sinAdd_i : std_logic_vector (13 downto 0);
    signal u9_sinAdd_a1 : std_logic_vector(13 downto 0);
    signal u9_sinAdd_b1 : std_logic_vector(13 downto 0);
    signal u9_sinAdd_o : std_logic_vector (13 downto 0);
    signal u9_sinAdd_q : std_logic_vector (13 downto 0);
    signal u9_cosSub_a : std_logic_vector(13 downto 0);
    signal u9_cosSub_b : std_logic_vector(13 downto 0);
    signal u9_cosSub_i : std_logic_vector (13 downto 0);
    signal u9_cosSub_a1 : std_logic_vector(13 downto 0);
    signal u9_cosSub_b1 : std_logic_vector(13 downto 0);
    signal u9_cosSub_o : std_logic_vector (13 downto 0);
    signal u9_cosSub_q : std_logic_vector (13 downto 0);
    signal u9_roundedSin_in : std_logic_vector (13 downto 0);
    signal u9_roundedSin_q : std_logic_vector (11 downto 0);
    signal u9_roundedCos_in : std_logic_vector (13 downto 0);
    signal u9_roundedCos_q : std_logic_vector (11 downto 0);
    signal u9_doSwap_q : std_logic_vector(0 downto 0);
    signal u9_doSinInvert_q : std_logic_vector(0 downto 0);
    signal u9_doCosInvert_q : std_logic_vector(0 downto 0);
    signal u9_sinSwapMux_s : std_logic_vector (0 downto 0);
    signal u9_sinSwapMux_q : std_logic_vector (11 downto 0);
    signal u9_cosSwapMux_s : std_logic_vector (0 downto 0);
    signal u9_cosSwapMux_q : std_logic_vector (11 downto 0);
    signal u9_sinInvert_a : std_logic_vector(11 downto 0);
    signal u9_sinInvert_b : std_logic_vector(11 downto 0);
    signal u9_sinInvert_i : std_logic_vector (11 downto 0);
    signal u9_sinInvert_a1 : std_logic_vector(11 downto 0);
    signal u9_sinInvert_b1 : std_logic_vector(11 downto 0);
    signal u9_sinInvert_o : std_logic_vector (11 downto 0);
    signal u9_sinInvert_q : std_logic_vector (11 downto 0);
    signal u9_cosInvert_a : std_logic_vector(11 downto 0);
    signal u9_cosInvert_b : std_logic_vector(11 downto 0);
    signal u9_cosInvert_i : std_logic_vector (11 downto 0);
    signal u9_cosInvert_a1 : std_logic_vector(11 downto 0);
    signal u9_cosInvert_b1 : std_logic_vector(11 downto 0);
    signal u9_cosInvert_o : std_logic_vector (11 downto 0);
    signal u9_cosInvert_q : std_logic_vector (11 downto 0);
    signal u10_accumAdd_b1_a : std_logic_vector(17 downto 0);
    signal u10_accumAdd_b1_b : std_logic_vector(17 downto 0);
    signal u10_accumAdd_b1_i : std_logic_vector (17 downto 0);
    signal u10_accumAdd_b1_a1 : std_logic_vector(17 downto 0);
    signal u10_accumAdd_b1_b1 : std_logic_vector(17 downto 0);
    signal u10_accumAdd_b1_o : std_logic_vector (17 downto 0);
    signal u10_accumAdd_b1_q : std_logic_vector (17 downto 0);
    signal d_u10_accumAdd_b1_q_12_q : std_logic_vector (17 downto 0);
    signal d_u10_octantBitSelect_b_20_q : std_logic_vector (2 downto 0);
    signal u10_rangeLUT_q : std_logic_vector(18 downto 0);
    signal u10_addnsubConst_q : std_logic_vector(0 downto 0);
    signal u10_rangeAddSub_a : std_logic_vector(20 downto 0);
    signal u10_rangeAddSub_b : std_logic_vector(20 downto 0);
    signal u10_rangeAddSub_o : std_logic_vector (20 downto 0);
    signal u10_rangeAddSub_cin : std_logic_vector (0 downto 0);
    signal u10_rangeAddSub_q : std_logic_vector (18 downto 0);
    signal u10_sinTable_reset0 : std_logic;
    signal u10_sinTable_iq : std_logic_vector (11 downto 0);
    signal u10_sinTable_ia : std_logic_vector (11 downto 0);
    signal u10_sinTable_ir : std_logic_vector (11 downto 0);
    signal u10_sinTable_aa : std_logic_vector (7 downto 0);
    signal u10_sinTable_ab : std_logic_vector (7 downto 0);
    signal u10_sinTable_q : std_logic_vector (11 downto 0);
    signal u10_cosTable_reset0 : std_logic;
    signal u10_cosTable_iq : std_logic_vector (11 downto 0);
    signal u10_cosTable_ia : std_logic_vector (11 downto 0);
    signal u10_cosTable_ir : std_logic_vector (11 downto 0);
    signal u10_cosTable_aa : std_logic_vector (7 downto 0);
    signal u10_cosTable_ab : std_logic_vector (7 downto 0);
    signal u10_cosTable_q : std_logic_vector (11 downto 0);
    signal u10_cm1_a : std_logic_vector(19 downto 0);
    signal u10_cm1_b : std_logic_vector(19 downto 0);
    signal u10_cm1_o : std_logic_vector (19 downto 0);
    signal u10_cm1_q : std_logic_vector (19 downto 0);
    signal u10_cm2_a : std_logic_vector(14 downto 0);
    signal u10_cm2_b : std_logic_vector(14 downto 0);
    signal u10_cm2_o : std_logic_vector (14 downto 0);
    signal u10_cm2_q : std_logic_vector (14 downto 0);
    signal u10_cm3_a : std_logic_vector(20 downto 0);
    signal u10_cm3_b : std_logic_vector(20 downto 0);
    signal u10_cm3_o : std_logic_vector (20 downto 0);
    signal u10_cm3_q : std_logic_vector (20 downto 0);
    signal u10_sinMult_a : std_logic_vector (11 downto 0);
    signal u10_sinMult_b : std_logic_vector (11 downto 0);
    signal u10_sinMult_s1 : std_logic_vector (23 downto 0);
    signal u10_sinMult_pr : UNSIGNED (23 downto 0);
    signal u10_sinMult_q : std_logic_vector (23 downto 0);
    signal u10_cosMult_a : std_logic_vector (11 downto 0);
    signal u10_cosMult_b : std_logic_vector (11 downto 0);
    signal u10_cosMult_s1 : std_logic_vector (23 downto 0);
    signal u10_cosMult_pr : UNSIGNED (23 downto 0);
    signal u10_cosMult_q : std_logic_vector (23 downto 0);
    signal u10_sinAdd_a : std_logic_vector(13 downto 0);
    signal u10_sinAdd_b : std_logic_vector(13 downto 0);
    signal u10_sinAdd_i : std_logic_vector (13 downto 0);
    signal u10_sinAdd_a1 : std_logic_vector(13 downto 0);
    signal u10_sinAdd_b1 : std_logic_vector(13 downto 0);
    signal u10_sinAdd_o : std_logic_vector (13 downto 0);
    signal u10_sinAdd_q : std_logic_vector (13 downto 0);
    signal u10_cosSub_a : std_logic_vector(13 downto 0);
    signal u10_cosSub_b : std_logic_vector(13 downto 0);
    signal u10_cosSub_i : std_logic_vector (13 downto 0);
    signal u10_cosSub_a1 : std_logic_vector(13 downto 0);
    signal u10_cosSub_b1 : std_logic_vector(13 downto 0);
    signal u10_cosSub_o : std_logic_vector (13 downto 0);
    signal u10_cosSub_q : std_logic_vector (13 downto 0);
    signal u10_roundedSin_in : std_logic_vector (13 downto 0);
    signal u10_roundedSin_q : std_logic_vector (11 downto 0);
    signal u10_roundedCos_in : std_logic_vector (13 downto 0);
    signal u10_roundedCos_q : std_logic_vector (11 downto 0);
    signal u10_doSwap_q : std_logic_vector(0 downto 0);
    signal u10_doSinInvert_q : std_logic_vector(0 downto 0);
    signal u10_doCosInvert_q : std_logic_vector(0 downto 0);
    signal u10_sinSwapMux_s : std_logic_vector (0 downto 0);
    signal u10_sinSwapMux_q : std_logic_vector (11 downto 0);
    signal u10_cosSwapMux_s : std_logic_vector (0 downto 0);
    signal u10_cosSwapMux_q : std_logic_vector (11 downto 0);
    signal u10_sinInvert_a : std_logic_vector(11 downto 0);
    signal u10_sinInvert_b : std_logic_vector(11 downto 0);
    signal u10_sinInvert_i : std_logic_vector (11 downto 0);
    signal u10_sinInvert_a1 : std_logic_vector(11 downto 0);
    signal u10_sinInvert_b1 : std_logic_vector(11 downto 0);
    signal u10_sinInvert_o : std_logic_vector (11 downto 0);
    signal u10_sinInvert_q : std_logic_vector (11 downto 0);
    signal u10_cosInvert_a : std_logic_vector(11 downto 0);
    signal u10_cosInvert_b : std_logic_vector(11 downto 0);
    signal u10_cosInvert_i : std_logic_vector (11 downto 0);
    signal u10_cosInvert_a1 : std_logic_vector(11 downto 0);
    signal u10_cosInvert_b1 : std_logic_vector(11 downto 0);
    signal u10_cosInvert_o : std_logic_vector (11 downto 0);
    signal u10_cosInvert_q : std_logic_vector (11 downto 0);
    signal u11_accumAdd_b1_a : std_logic_vector(17 downto 0);
    signal u11_accumAdd_b1_b : std_logic_vector(17 downto 0);
    signal u11_accumAdd_b1_i : std_logic_vector (17 downto 0);
    signal u11_accumAdd_b1_a1 : std_logic_vector(17 downto 0);
    signal u11_accumAdd_b1_b1 : std_logic_vector(17 downto 0);
    signal u11_accumAdd_b1_o : std_logic_vector (17 downto 0);
    signal u11_accumAdd_b1_q : std_logic_vector (17 downto 0);
    signal d_u11_accumAdd_b1_q_12_q : std_logic_vector (17 downto 0);
    signal d_u11_octantBitSelect_b_20_q : std_logic_vector (2 downto 0);
    signal u11_rangeLUT_q : std_logic_vector(18 downto 0);
    signal u11_addnsubConst_q : std_logic_vector(0 downto 0);
    signal u11_rangeAddSub_a : std_logic_vector(20 downto 0);
    signal u11_rangeAddSub_b : std_logic_vector(20 downto 0);
    signal u11_rangeAddSub_o : std_logic_vector (20 downto 0);
    signal u11_rangeAddSub_cin : std_logic_vector (0 downto 0);
    signal u11_rangeAddSub_q : std_logic_vector (18 downto 0);
    signal u11_sinTable_reset0 : std_logic;
    signal u11_sinTable_iq : std_logic_vector (11 downto 0);
    signal u11_sinTable_ia : std_logic_vector (11 downto 0);
    signal u11_sinTable_ir : std_logic_vector (11 downto 0);
    signal u11_sinTable_aa : std_logic_vector (7 downto 0);
    signal u11_sinTable_ab : std_logic_vector (7 downto 0);
    signal u11_sinTable_q : std_logic_vector (11 downto 0);
    signal u11_cosTable_reset0 : std_logic;
    signal u11_cosTable_iq : std_logic_vector (11 downto 0);
    signal u11_cosTable_ia : std_logic_vector (11 downto 0);
    signal u11_cosTable_ir : std_logic_vector (11 downto 0);
    signal u11_cosTable_aa : std_logic_vector (7 downto 0);
    signal u11_cosTable_ab : std_logic_vector (7 downto 0);
    signal u11_cosTable_q : std_logic_vector (11 downto 0);
    signal u11_cm1_a : std_logic_vector(19 downto 0);
    signal u11_cm1_b : std_logic_vector(19 downto 0);
    signal u11_cm1_o : std_logic_vector (19 downto 0);
    signal u11_cm1_q : std_logic_vector (19 downto 0);
    signal u11_cm2_a : std_logic_vector(14 downto 0);
    signal u11_cm2_b : std_logic_vector(14 downto 0);
    signal u11_cm2_o : std_logic_vector (14 downto 0);
    signal u11_cm2_q : std_logic_vector (14 downto 0);
    signal u11_cm3_a : std_logic_vector(20 downto 0);
    signal u11_cm3_b : std_logic_vector(20 downto 0);
    signal u11_cm3_o : std_logic_vector (20 downto 0);
    signal u11_cm3_q : std_logic_vector (20 downto 0);
    signal u11_sinMult_a : std_logic_vector (11 downto 0);
    signal u11_sinMult_b : std_logic_vector (11 downto 0);
    signal u11_sinMult_s1 : std_logic_vector (23 downto 0);
    signal u11_sinMult_pr : UNSIGNED (23 downto 0);
    signal u11_sinMult_q : std_logic_vector (23 downto 0);
    signal u11_cosMult_a : std_logic_vector (11 downto 0);
    signal u11_cosMult_b : std_logic_vector (11 downto 0);
    signal u11_cosMult_s1 : std_logic_vector (23 downto 0);
    signal u11_cosMult_pr : UNSIGNED (23 downto 0);
    signal u11_cosMult_q : std_logic_vector (23 downto 0);
    signal u11_sinAdd_a : std_logic_vector(13 downto 0);
    signal u11_sinAdd_b : std_logic_vector(13 downto 0);
    signal u11_sinAdd_i : std_logic_vector (13 downto 0);
    signal u11_sinAdd_a1 : std_logic_vector(13 downto 0);
    signal u11_sinAdd_b1 : std_logic_vector(13 downto 0);
    signal u11_sinAdd_o : std_logic_vector (13 downto 0);
    signal u11_sinAdd_q : std_logic_vector (13 downto 0);
    signal u11_cosSub_a : std_logic_vector(13 downto 0);
    signal u11_cosSub_b : std_logic_vector(13 downto 0);
    signal u11_cosSub_i : std_logic_vector (13 downto 0);
    signal u11_cosSub_a1 : std_logic_vector(13 downto 0);
    signal u11_cosSub_b1 : std_logic_vector(13 downto 0);
    signal u11_cosSub_o : std_logic_vector (13 downto 0);
    signal u11_cosSub_q : std_logic_vector (13 downto 0);
    signal u11_roundedSin_in : std_logic_vector (13 downto 0);
    signal u11_roundedSin_q : std_logic_vector (11 downto 0);
    signal u11_roundedCos_in : std_logic_vector (13 downto 0);
    signal u11_roundedCos_q : std_logic_vector (11 downto 0);
    signal u11_doSwap_q : std_logic_vector(0 downto 0);
    signal u11_doSinInvert_q : std_logic_vector(0 downto 0);
    signal u11_doCosInvert_q : std_logic_vector(0 downto 0);
    signal u11_sinSwapMux_s : std_logic_vector (0 downto 0);
    signal u11_sinSwapMux_q : std_logic_vector (11 downto 0);
    signal u11_cosSwapMux_s : std_logic_vector (0 downto 0);
    signal u11_cosSwapMux_q : std_logic_vector (11 downto 0);
    signal u11_sinInvert_a : std_logic_vector(11 downto 0);
    signal u11_sinInvert_b : std_logic_vector(11 downto 0);
    signal u11_sinInvert_i : std_logic_vector (11 downto 0);
    signal u11_sinInvert_a1 : std_logic_vector(11 downto 0);
    signal u11_sinInvert_b1 : std_logic_vector(11 downto 0);
    signal u11_sinInvert_o : std_logic_vector (11 downto 0);
    signal u11_sinInvert_q : std_logic_vector (11 downto 0);
    signal u11_cosInvert_a : std_logic_vector(11 downto 0);
    signal u11_cosInvert_b : std_logic_vector(11 downto 0);
    signal u11_cosInvert_i : std_logic_vector (11 downto 0);
    signal u11_cosInvert_a1 : std_logic_vector(11 downto 0);
    signal u11_cosInvert_b1 : std_logic_vector(11 downto 0);
    signal u11_cosInvert_o : std_logic_vector (11 downto 0);
    signal u11_cosInvert_q : std_logic_vector (11 downto 0);
    signal u12_accumAdd_b1_a : std_logic_vector(17 downto 0);
    signal u12_accumAdd_b1_b : std_logic_vector(17 downto 0);
    signal u12_accumAdd_b1_i : std_logic_vector (17 downto 0);
    signal u12_accumAdd_b1_a1 : std_logic_vector(17 downto 0);
    signal u12_accumAdd_b1_b1 : std_logic_vector(17 downto 0);
    signal u12_accumAdd_b1_o : std_logic_vector (17 downto 0);
    signal u12_accumAdd_b1_q : std_logic_vector (17 downto 0);
    signal d_u12_accumAdd_b1_q_12_q : std_logic_vector (17 downto 0);
    signal d_u12_octantBitSelect_b_20_q : std_logic_vector (2 downto 0);
    signal u12_rangeLUT_q : std_logic_vector(18 downto 0);
    signal u12_addnsubConst_q : std_logic_vector(0 downto 0);
    signal u12_rangeAddSub_a : std_logic_vector(20 downto 0);
    signal u12_rangeAddSub_b : std_logic_vector(20 downto 0);
    signal u12_rangeAddSub_o : std_logic_vector (20 downto 0);
    signal u12_rangeAddSub_cin : std_logic_vector (0 downto 0);
    signal u12_rangeAddSub_q : std_logic_vector (18 downto 0);
    signal u12_sinTable_reset0 : std_logic;
    signal u12_sinTable_iq : std_logic_vector (11 downto 0);
    signal u12_sinTable_ia : std_logic_vector (11 downto 0);
    signal u12_sinTable_ir : std_logic_vector (11 downto 0);
    signal u12_sinTable_aa : std_logic_vector (7 downto 0);
    signal u12_sinTable_ab : std_logic_vector (7 downto 0);
    signal u12_sinTable_q : std_logic_vector (11 downto 0);
    signal u12_cosTable_reset0 : std_logic;
    signal u12_cosTable_iq : std_logic_vector (11 downto 0);
    signal u12_cosTable_ia : std_logic_vector (11 downto 0);
    signal u12_cosTable_ir : std_logic_vector (11 downto 0);
    signal u12_cosTable_aa : std_logic_vector (7 downto 0);
    signal u12_cosTable_ab : std_logic_vector (7 downto 0);
    signal u12_cosTable_q : std_logic_vector (11 downto 0);
    signal u12_cm1_a : std_logic_vector(19 downto 0);
    signal u12_cm1_b : std_logic_vector(19 downto 0);
    signal u12_cm1_o : std_logic_vector (19 downto 0);
    signal u12_cm1_q : std_logic_vector (19 downto 0);
    signal u12_cm2_a : std_logic_vector(14 downto 0);
    signal u12_cm2_b : std_logic_vector(14 downto 0);
    signal u12_cm2_o : std_logic_vector (14 downto 0);
    signal u12_cm2_q : std_logic_vector (14 downto 0);
    signal u12_cm3_a : std_logic_vector(20 downto 0);
    signal u12_cm3_b : std_logic_vector(20 downto 0);
    signal u12_cm3_o : std_logic_vector (20 downto 0);
    signal u12_cm3_q : std_logic_vector (20 downto 0);
    signal u12_sinMult_a : std_logic_vector (11 downto 0);
    signal u12_sinMult_b : std_logic_vector (11 downto 0);
    signal u12_sinMult_s1 : std_logic_vector (23 downto 0);
    signal u12_sinMult_pr : UNSIGNED (23 downto 0);
    signal u12_sinMult_q : std_logic_vector (23 downto 0);
    signal u12_cosMult_a : std_logic_vector (11 downto 0);
    signal u12_cosMult_b : std_logic_vector (11 downto 0);
    signal u12_cosMult_s1 : std_logic_vector (23 downto 0);
    signal u12_cosMult_pr : UNSIGNED (23 downto 0);
    signal u12_cosMult_q : std_logic_vector (23 downto 0);
    signal u12_sinAdd_a : std_logic_vector(13 downto 0);
    signal u12_sinAdd_b : std_logic_vector(13 downto 0);
    signal u12_sinAdd_i : std_logic_vector (13 downto 0);
    signal u12_sinAdd_a1 : std_logic_vector(13 downto 0);
    signal u12_sinAdd_b1 : std_logic_vector(13 downto 0);
    signal u12_sinAdd_o : std_logic_vector (13 downto 0);
    signal u12_sinAdd_q : std_logic_vector (13 downto 0);
    signal u12_cosSub_a : std_logic_vector(13 downto 0);
    signal u12_cosSub_b : std_logic_vector(13 downto 0);
    signal u12_cosSub_i : std_logic_vector (13 downto 0);
    signal u12_cosSub_a1 : std_logic_vector(13 downto 0);
    signal u12_cosSub_b1 : std_logic_vector(13 downto 0);
    signal u12_cosSub_o : std_logic_vector (13 downto 0);
    signal u12_cosSub_q : std_logic_vector (13 downto 0);
    signal u12_roundedSin_in : std_logic_vector (13 downto 0);
    signal u12_roundedSin_q : std_logic_vector (11 downto 0);
    signal u12_roundedCos_in : std_logic_vector (13 downto 0);
    signal u12_roundedCos_q : std_logic_vector (11 downto 0);
    signal u12_doSwap_q : std_logic_vector(0 downto 0);
    signal u12_doSinInvert_q : std_logic_vector(0 downto 0);
    signal u12_doCosInvert_q : std_logic_vector(0 downto 0);
    signal u12_sinSwapMux_s : std_logic_vector (0 downto 0);
    signal u12_sinSwapMux_q : std_logic_vector (11 downto 0);
    signal u12_cosSwapMux_s : std_logic_vector (0 downto 0);
    signal u12_cosSwapMux_q : std_logic_vector (11 downto 0);
    signal u12_sinInvert_a : std_logic_vector(11 downto 0);
    signal u12_sinInvert_b : std_logic_vector(11 downto 0);
    signal u12_sinInvert_i : std_logic_vector (11 downto 0);
    signal u12_sinInvert_a1 : std_logic_vector(11 downto 0);
    signal u12_sinInvert_b1 : std_logic_vector(11 downto 0);
    signal u12_sinInvert_o : std_logic_vector (11 downto 0);
    signal u12_sinInvert_q : std_logic_vector (11 downto 0);
    signal u12_cosInvert_a : std_logic_vector(11 downto 0);
    signal u12_cosInvert_b : std_logic_vector(11 downto 0);
    signal u12_cosInvert_i : std_logic_vector (11 downto 0);
    signal u12_cosInvert_a1 : std_logic_vector(11 downto 0);
    signal u12_cosInvert_b1 : std_logic_vector(11 downto 0);
    signal u12_cosInvert_o : std_logic_vector (11 downto 0);
    signal u12_cosInvert_q : std_logic_vector (11 downto 0);
    signal u13_accumAdd_b1_a : std_logic_vector(17 downto 0);
    signal u13_accumAdd_b1_b : std_logic_vector(17 downto 0);
    signal u13_accumAdd_b1_i : std_logic_vector (17 downto 0);
    signal u13_accumAdd_b1_a1 : std_logic_vector(17 downto 0);
    signal u13_accumAdd_b1_b1 : std_logic_vector(17 downto 0);
    signal u13_accumAdd_b1_o : std_logic_vector (17 downto 0);
    signal u13_accumAdd_b1_q : std_logic_vector (17 downto 0);
    signal d_u13_accumAdd_b1_q_12_q : std_logic_vector (17 downto 0);
    signal d_u13_octantBitSelect_b_20_q : std_logic_vector (2 downto 0);
    signal u13_rangeLUT_q : std_logic_vector(18 downto 0);
    signal u13_addnsubConst_q : std_logic_vector(0 downto 0);
    signal u13_rangeAddSub_a : std_logic_vector(20 downto 0);
    signal u13_rangeAddSub_b : std_logic_vector(20 downto 0);
    signal u13_rangeAddSub_o : std_logic_vector (20 downto 0);
    signal u13_rangeAddSub_cin : std_logic_vector (0 downto 0);
    signal u13_rangeAddSub_q : std_logic_vector (18 downto 0);
    signal u13_sinTable_reset0 : std_logic;
    signal u13_sinTable_iq : std_logic_vector (11 downto 0);
    signal u13_sinTable_ia : std_logic_vector (11 downto 0);
    signal u13_sinTable_ir : std_logic_vector (11 downto 0);
    signal u13_sinTable_aa : std_logic_vector (7 downto 0);
    signal u13_sinTable_ab : std_logic_vector (7 downto 0);
    signal u13_sinTable_q : std_logic_vector (11 downto 0);
    signal u13_cosTable_reset0 : std_logic;
    signal u13_cosTable_iq : std_logic_vector (11 downto 0);
    signal u13_cosTable_ia : std_logic_vector (11 downto 0);
    signal u13_cosTable_ir : std_logic_vector (11 downto 0);
    signal u13_cosTable_aa : std_logic_vector (7 downto 0);
    signal u13_cosTable_ab : std_logic_vector (7 downto 0);
    signal u13_cosTable_q : std_logic_vector (11 downto 0);
    signal u13_cm1_a : std_logic_vector(19 downto 0);
    signal u13_cm1_b : std_logic_vector(19 downto 0);
    signal u13_cm1_o : std_logic_vector (19 downto 0);
    signal u13_cm1_q : std_logic_vector (19 downto 0);
    signal u13_cm2_a : std_logic_vector(14 downto 0);
    signal u13_cm2_b : std_logic_vector(14 downto 0);
    signal u13_cm2_o : std_logic_vector (14 downto 0);
    signal u13_cm2_q : std_logic_vector (14 downto 0);
    signal u13_cm3_a : std_logic_vector(20 downto 0);
    signal u13_cm3_b : std_logic_vector(20 downto 0);
    signal u13_cm3_o : std_logic_vector (20 downto 0);
    signal u13_cm3_q : std_logic_vector (20 downto 0);
    signal u13_sinMult_a : std_logic_vector (11 downto 0);
    signal u13_sinMult_b : std_logic_vector (11 downto 0);
    signal u13_sinMult_s1 : std_logic_vector (23 downto 0);
    signal u13_sinMult_pr : UNSIGNED (23 downto 0);
    signal u13_sinMult_q : std_logic_vector (23 downto 0);
    signal u13_cosMult_a : std_logic_vector (11 downto 0);
    signal u13_cosMult_b : std_logic_vector (11 downto 0);
    signal u13_cosMult_s1 : std_logic_vector (23 downto 0);
    signal u13_cosMult_pr : UNSIGNED (23 downto 0);
    signal u13_cosMult_q : std_logic_vector (23 downto 0);
    signal u13_sinAdd_a : std_logic_vector(13 downto 0);
    signal u13_sinAdd_b : std_logic_vector(13 downto 0);
    signal u13_sinAdd_i : std_logic_vector (13 downto 0);
    signal u13_sinAdd_a1 : std_logic_vector(13 downto 0);
    signal u13_sinAdd_b1 : std_logic_vector(13 downto 0);
    signal u13_sinAdd_o : std_logic_vector (13 downto 0);
    signal u13_sinAdd_q : std_logic_vector (13 downto 0);
    signal u13_cosSub_a : std_logic_vector(13 downto 0);
    signal u13_cosSub_b : std_logic_vector(13 downto 0);
    signal u13_cosSub_i : std_logic_vector (13 downto 0);
    signal u13_cosSub_a1 : std_logic_vector(13 downto 0);
    signal u13_cosSub_b1 : std_logic_vector(13 downto 0);
    signal u13_cosSub_o : std_logic_vector (13 downto 0);
    signal u13_cosSub_q : std_logic_vector (13 downto 0);
    signal u13_roundedSin_in : std_logic_vector (13 downto 0);
    signal u13_roundedSin_q : std_logic_vector (11 downto 0);
    signal u13_roundedCos_in : std_logic_vector (13 downto 0);
    signal u13_roundedCos_q : std_logic_vector (11 downto 0);
    signal u13_doSwap_q : std_logic_vector(0 downto 0);
    signal u13_doSinInvert_q : std_logic_vector(0 downto 0);
    signal u13_doCosInvert_q : std_logic_vector(0 downto 0);
    signal u13_sinSwapMux_s : std_logic_vector (0 downto 0);
    signal u13_sinSwapMux_q : std_logic_vector (11 downto 0);
    signal u13_cosSwapMux_s : std_logic_vector (0 downto 0);
    signal u13_cosSwapMux_q : std_logic_vector (11 downto 0);
    signal u13_sinInvert_a : std_logic_vector(11 downto 0);
    signal u13_sinInvert_b : std_logic_vector(11 downto 0);
    signal u13_sinInvert_i : std_logic_vector (11 downto 0);
    signal u13_sinInvert_a1 : std_logic_vector(11 downto 0);
    signal u13_sinInvert_b1 : std_logic_vector(11 downto 0);
    signal u13_sinInvert_o : std_logic_vector (11 downto 0);
    signal u13_sinInvert_q : std_logic_vector (11 downto 0);
    signal u13_cosInvert_a : std_logic_vector(11 downto 0);
    signal u13_cosInvert_b : std_logic_vector(11 downto 0);
    signal u13_cosInvert_i : std_logic_vector (11 downto 0);
    signal u13_cosInvert_a1 : std_logic_vector(11 downto 0);
    signal u13_cosInvert_b1 : std_logic_vector(11 downto 0);
    signal u13_cosInvert_o : std_logic_vector (11 downto 0);
    signal u13_cosInvert_q : std_logic_vector (11 downto 0);
    signal u14_accumAdd_b1_a : std_logic_vector(17 downto 0);
    signal u14_accumAdd_b1_b : std_logic_vector(17 downto 0);
    signal u14_accumAdd_b1_i : std_logic_vector (17 downto 0);
    signal u14_accumAdd_b1_a1 : std_logic_vector(17 downto 0);
    signal u14_accumAdd_b1_b1 : std_logic_vector(17 downto 0);
    signal u14_accumAdd_b1_o : std_logic_vector (17 downto 0);
    signal u14_accumAdd_b1_q : std_logic_vector (17 downto 0);
    signal d_u14_accumAdd_b1_q_12_q : std_logic_vector (17 downto 0);
    signal d_u14_octantBitSelect_b_20_q : std_logic_vector (2 downto 0);
    signal u14_rangeLUT_q : std_logic_vector(18 downto 0);
    signal u14_addnsubConst_q : std_logic_vector(0 downto 0);
    signal u14_rangeAddSub_a : std_logic_vector(20 downto 0);
    signal u14_rangeAddSub_b : std_logic_vector(20 downto 0);
    signal u14_rangeAddSub_o : std_logic_vector (20 downto 0);
    signal u14_rangeAddSub_cin : std_logic_vector (0 downto 0);
    signal u14_rangeAddSub_q : std_logic_vector (18 downto 0);
    signal u14_sinTable_reset0 : std_logic;
    signal u14_sinTable_iq : std_logic_vector (11 downto 0);
    signal u14_sinTable_ia : std_logic_vector (11 downto 0);
    signal u14_sinTable_ir : std_logic_vector (11 downto 0);
    signal u14_sinTable_aa : std_logic_vector (7 downto 0);
    signal u14_sinTable_ab : std_logic_vector (7 downto 0);
    signal u14_sinTable_q : std_logic_vector (11 downto 0);
    signal u14_cosTable_reset0 : std_logic;
    signal u14_cosTable_iq : std_logic_vector (11 downto 0);
    signal u14_cosTable_ia : std_logic_vector (11 downto 0);
    signal u14_cosTable_ir : std_logic_vector (11 downto 0);
    signal u14_cosTable_aa : std_logic_vector (7 downto 0);
    signal u14_cosTable_ab : std_logic_vector (7 downto 0);
    signal u14_cosTable_q : std_logic_vector (11 downto 0);
    signal u14_cm1_a : std_logic_vector(19 downto 0);
    signal u14_cm1_b : std_logic_vector(19 downto 0);
    signal u14_cm1_o : std_logic_vector (19 downto 0);
    signal u14_cm1_q : std_logic_vector (19 downto 0);
    signal u14_cm2_a : std_logic_vector(14 downto 0);
    signal u14_cm2_b : std_logic_vector(14 downto 0);
    signal u14_cm2_o : std_logic_vector (14 downto 0);
    signal u14_cm2_q : std_logic_vector (14 downto 0);
    signal u14_cm3_a : std_logic_vector(20 downto 0);
    signal u14_cm3_b : std_logic_vector(20 downto 0);
    signal u14_cm3_o : std_logic_vector (20 downto 0);
    signal u14_cm3_q : std_logic_vector (20 downto 0);
    signal u14_sinMult_a : std_logic_vector (11 downto 0);
    signal u14_sinMult_b : std_logic_vector (11 downto 0);
    signal u14_sinMult_s1 : std_logic_vector (23 downto 0);
    signal u14_sinMult_pr : UNSIGNED (23 downto 0);
    signal u14_sinMult_q : std_logic_vector (23 downto 0);
    signal u14_cosMult_a : std_logic_vector (11 downto 0);
    signal u14_cosMult_b : std_logic_vector (11 downto 0);
    signal u14_cosMult_s1 : std_logic_vector (23 downto 0);
    signal u14_cosMult_pr : UNSIGNED (23 downto 0);
    signal u14_cosMult_q : std_logic_vector (23 downto 0);
    signal u14_sinAdd_a : std_logic_vector(13 downto 0);
    signal u14_sinAdd_b : std_logic_vector(13 downto 0);
    signal u14_sinAdd_i : std_logic_vector (13 downto 0);
    signal u14_sinAdd_a1 : std_logic_vector(13 downto 0);
    signal u14_sinAdd_b1 : std_logic_vector(13 downto 0);
    signal u14_sinAdd_o : std_logic_vector (13 downto 0);
    signal u14_sinAdd_q : std_logic_vector (13 downto 0);
    signal u14_cosSub_a : std_logic_vector(13 downto 0);
    signal u14_cosSub_b : std_logic_vector(13 downto 0);
    signal u14_cosSub_i : std_logic_vector (13 downto 0);
    signal u14_cosSub_a1 : std_logic_vector(13 downto 0);
    signal u14_cosSub_b1 : std_logic_vector(13 downto 0);
    signal u14_cosSub_o : std_logic_vector (13 downto 0);
    signal u14_cosSub_q : std_logic_vector (13 downto 0);
    signal u14_roundedSin_in : std_logic_vector (13 downto 0);
    signal u14_roundedSin_q : std_logic_vector (11 downto 0);
    signal u14_roundedCos_in : std_logic_vector (13 downto 0);
    signal u14_roundedCos_q : std_logic_vector (11 downto 0);
    signal u14_doSwap_q : std_logic_vector(0 downto 0);
    signal u14_doSinInvert_q : std_logic_vector(0 downto 0);
    signal u14_doCosInvert_q : std_logic_vector(0 downto 0);
    signal u14_sinSwapMux_s : std_logic_vector (0 downto 0);
    signal u14_sinSwapMux_q : std_logic_vector (11 downto 0);
    signal u14_cosSwapMux_s : std_logic_vector (0 downto 0);
    signal u14_cosSwapMux_q : std_logic_vector (11 downto 0);
    signal u14_sinInvert_a : std_logic_vector(11 downto 0);
    signal u14_sinInvert_b : std_logic_vector(11 downto 0);
    signal u14_sinInvert_i : std_logic_vector (11 downto 0);
    signal u14_sinInvert_a1 : std_logic_vector(11 downto 0);
    signal u14_sinInvert_b1 : std_logic_vector(11 downto 0);
    signal u14_sinInvert_o : std_logic_vector (11 downto 0);
    signal u14_sinInvert_q : std_logic_vector (11 downto 0);
    signal u14_cosInvert_a : std_logic_vector(11 downto 0);
    signal u14_cosInvert_b : std_logic_vector(11 downto 0);
    signal u14_cosInvert_i : std_logic_vector (11 downto 0);
    signal u14_cosInvert_a1 : std_logic_vector(11 downto 0);
    signal u14_cosInvert_b1 : std_logic_vector(11 downto 0);
    signal u14_cosInvert_o : std_logic_vector (11 downto 0);
    signal u14_cosInvert_q : std_logic_vector (11 downto 0);
    signal u15_accumAdd_b1_a : std_logic_vector(17 downto 0);
    signal u15_accumAdd_b1_b : std_logic_vector(17 downto 0);
    signal u15_accumAdd_b1_i : std_logic_vector (17 downto 0);
    signal u15_accumAdd_b1_a1 : std_logic_vector(17 downto 0);
    signal u15_accumAdd_b1_b1 : std_logic_vector(17 downto 0);
    signal u15_accumAdd_b1_o : std_logic_vector (17 downto 0);
    signal u15_accumAdd_b1_q : std_logic_vector (17 downto 0);
    signal d_u15_accumAdd_b1_q_12_q : std_logic_vector (17 downto 0);
    signal d_u15_octantBitSelect_b_20_q : std_logic_vector (2 downto 0);
    signal u15_rangeLUT_q : std_logic_vector(18 downto 0);
    signal u15_addnsubConst_q : std_logic_vector(0 downto 0);
    signal u15_rangeAddSub_a : std_logic_vector(20 downto 0);
    signal u15_rangeAddSub_b : std_logic_vector(20 downto 0);
    signal u15_rangeAddSub_o : std_logic_vector (20 downto 0);
    signal u15_rangeAddSub_cin : std_logic_vector (0 downto 0);
    signal u15_rangeAddSub_q : std_logic_vector (18 downto 0);
    signal u15_sinTable_reset0 : std_logic;
    signal u15_sinTable_iq : std_logic_vector (11 downto 0);
    signal u15_sinTable_ia : std_logic_vector (11 downto 0);
    signal u15_sinTable_ir : std_logic_vector (11 downto 0);
    signal u15_sinTable_aa : std_logic_vector (7 downto 0);
    signal u15_sinTable_ab : std_logic_vector (7 downto 0);
    signal u15_sinTable_q : std_logic_vector (11 downto 0);
    signal u15_cosTable_reset0 : std_logic;
    signal u15_cosTable_iq : std_logic_vector (11 downto 0);
    signal u15_cosTable_ia : std_logic_vector (11 downto 0);
    signal u15_cosTable_ir : std_logic_vector (11 downto 0);
    signal u15_cosTable_aa : std_logic_vector (7 downto 0);
    signal u15_cosTable_ab : std_logic_vector (7 downto 0);
    signal u15_cosTable_q : std_logic_vector (11 downto 0);
    signal u15_cm1_a : std_logic_vector(19 downto 0);
    signal u15_cm1_b : std_logic_vector(19 downto 0);
    signal u15_cm1_o : std_logic_vector (19 downto 0);
    signal u15_cm1_q : std_logic_vector (19 downto 0);
    signal u15_cm2_a : std_logic_vector(14 downto 0);
    signal u15_cm2_b : std_logic_vector(14 downto 0);
    signal u15_cm2_o : std_logic_vector (14 downto 0);
    signal u15_cm2_q : std_logic_vector (14 downto 0);
    signal u15_cm3_a : std_logic_vector(20 downto 0);
    signal u15_cm3_b : std_logic_vector(20 downto 0);
    signal u15_cm3_o : std_logic_vector (20 downto 0);
    signal u15_cm3_q : std_logic_vector (20 downto 0);
    signal u15_sinMult_a : std_logic_vector (11 downto 0);
    signal u15_sinMult_b : std_logic_vector (11 downto 0);
    signal u15_sinMult_s1 : std_logic_vector (23 downto 0);
    signal u15_sinMult_pr : UNSIGNED (23 downto 0);
    signal u15_sinMult_q : std_logic_vector (23 downto 0);
    signal u15_cosMult_a : std_logic_vector (11 downto 0);
    signal u15_cosMult_b : std_logic_vector (11 downto 0);
    signal u15_cosMult_s1 : std_logic_vector (23 downto 0);
    signal u15_cosMult_pr : UNSIGNED (23 downto 0);
    signal u15_cosMult_q : std_logic_vector (23 downto 0);
    signal u15_sinAdd_a : std_logic_vector(13 downto 0);
    signal u15_sinAdd_b : std_logic_vector(13 downto 0);
    signal u15_sinAdd_i : std_logic_vector (13 downto 0);
    signal u15_sinAdd_a1 : std_logic_vector(13 downto 0);
    signal u15_sinAdd_b1 : std_logic_vector(13 downto 0);
    signal u15_sinAdd_o : std_logic_vector (13 downto 0);
    signal u15_sinAdd_q : std_logic_vector (13 downto 0);
    signal u15_cosSub_a : std_logic_vector(13 downto 0);
    signal u15_cosSub_b : std_logic_vector(13 downto 0);
    signal u15_cosSub_i : std_logic_vector (13 downto 0);
    signal u15_cosSub_a1 : std_logic_vector(13 downto 0);
    signal u15_cosSub_b1 : std_logic_vector(13 downto 0);
    signal u15_cosSub_o : std_logic_vector (13 downto 0);
    signal u15_cosSub_q : std_logic_vector (13 downto 0);
    signal u15_roundedSin_in : std_logic_vector (13 downto 0);
    signal u15_roundedSin_q : std_logic_vector (11 downto 0);
    signal u15_roundedCos_in : std_logic_vector (13 downto 0);
    signal u15_roundedCos_q : std_logic_vector (11 downto 0);
    signal u15_doSwap_q : std_logic_vector(0 downto 0);
    signal u15_doSinInvert_q : std_logic_vector(0 downto 0);
    signal u15_doCosInvert_q : std_logic_vector(0 downto 0);
    signal u15_sinSwapMux_s : std_logic_vector (0 downto 0);
    signal u15_sinSwapMux_q : std_logic_vector (11 downto 0);
    signal u15_cosSwapMux_s : std_logic_vector (0 downto 0);
    signal u15_cosSwapMux_q : std_logic_vector (11 downto 0);
    signal u15_sinInvert_a : std_logic_vector(11 downto 0);
    signal u15_sinInvert_b : std_logic_vector(11 downto 0);
    signal u15_sinInvert_i : std_logic_vector (11 downto 0);
    signal u15_sinInvert_a1 : std_logic_vector(11 downto 0);
    signal u15_sinInvert_b1 : std_logic_vector(11 downto 0);
    signal u15_sinInvert_o : std_logic_vector (11 downto 0);
    signal u15_sinInvert_q : std_logic_vector (11 downto 0);
    signal u15_cosInvert_a : std_logic_vector(11 downto 0);
    signal u15_cosInvert_b : std_logic_vector(11 downto 0);
    signal u15_cosInvert_i : std_logic_vector (11 downto 0);
    signal u15_cosInvert_a1 : std_logic_vector(11 downto 0);
    signal u15_cosInvert_b1 : std_logic_vector(11 downto 0);
    signal u15_cosInvert_o : std_logic_vector (11 downto 0);
    signal u15_cosInvert_q : std_logic_vector (11 downto 0);
    signal d_xIn_c_22_replace_mem_reset0 : std_logic;
    signal d_xIn_c_22_replace_mem_iq : std_logic_vector (7 downto 0);
    signal d_xIn_c_22_replace_mem_ia : std_logic_vector (7 downto 0);
    signal d_xIn_c_22_replace_mem_ir : std_logic_vector (7 downto 0);
    signal d_xIn_c_22_replace_mem_aa : std_logic_vector (3 downto 0);
    signal d_xIn_c_22_replace_mem_ab : std_logic_vector (3 downto 0);
    signal d_xIn_c_22_replace_mem_q : std_logic_vector (7 downto 0);
    signal d_xIn_c_22_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal d_xIn_c_22_replace_rdcnt_i : unsigned(3 downto 0);
    signal d_xIn_c_22_replace_rdcnt_eq : std_logic;
    signal d_xIn_c_22_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal d_xIn_c_22_mem_top_q : std_logic_vector (4 downto 0);
    signal d_xIn_c_22_cmpReg_q : std_logic_vector (0 downto 0);
    signal d_xIn_c_22_sticky_ena_q : std_logic_vector (0 downto 0);
    signal d_u0_octantBitSelect_b_19_replace_mem_reset0 : std_logic;
    signal d_u0_octantBitSelect_b_19_replace_mem_iq : std_logic_vector (2 downto 0);
    signal d_u0_octantBitSelect_b_19_replace_mem_ia : std_logic_vector (2 downto 0);
    signal d_u0_octantBitSelect_b_19_replace_mem_ir : std_logic_vector (2 downto 0);
    signal d_u0_octantBitSelect_b_19_replace_mem_aa : std_logic_vector (2 downto 0);
    signal d_u0_octantBitSelect_b_19_replace_mem_ab : std_logic_vector (2 downto 0);
    signal d_u0_octantBitSelect_b_19_replace_mem_q : std_logic_vector (2 downto 0);
    signal d_u0_octantBitSelect_b_19_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal d_u0_octantBitSelect_b_19_replace_rdcnt_i : unsigned(2 downto 0);
    signal d_u0_octantBitSelect_b_19_replace_rdcnt_eq : std_logic;
    signal d_u0_octantBitSelect_b_19_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal d_u0_octantBitSelect_b_19_mem_top_q : std_logic_vector (3 downto 0);
    signal d_u0_octantBitSelect_b_19_cmpReg_q : std_logic_vector (0 downto 0);
    signal d_u0_octantBitSelect_b_19_sticky_ena_q : std_logic_vector (0 downto 0);
    signal d_u0_rangeAddSub_q_18_replace_mem_reset0 : std_logic;
    signal d_u0_rangeAddSub_q_18_replace_mem_iq : std_logic_vector (18 downto 0);
    signal d_u0_rangeAddSub_q_18_replace_mem_ia : std_logic_vector (18 downto 0);
    signal d_u0_rangeAddSub_q_18_replace_mem_ir : std_logic_vector (18 downto 0);
    signal d_u0_rangeAddSub_q_18_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u0_rangeAddSub_q_18_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u0_rangeAddSub_q_18_replace_mem_q : std_logic_vector (18 downto 0);
    signal d_u0_rangeAddSub_q_18_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal d_u0_rangeAddSub_q_18_replace_rdcnt_i : unsigned(1 downto 0);
    signal d_u0_rangeAddSub_q_18_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal d_u0_rangeAddSub_q_18_mem_top_q : std_logic_vector (2 downto 0);
    signal d_u0_rangeAddSub_q_18_cmpReg_q : std_logic_vector (0 downto 0);
    signal d_u0_rangeAddSub_q_18_sticky_ena_q : std_logic_vector (0 downto 0);
    signal d_u0_sinTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u0_sinTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u0_sinTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u0_sinTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u0_sinTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u0_sinTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u0_sinTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u0_sinTable_q_18_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal d_u0_sinTable_q_18_replace_rdcnt_i : unsigned(0 downto 0);
    signal d_u0_sinTable_q_18_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal d_u0_sinTable_q_18_cmpReg_q : std_logic_vector (0 downto 0);
    signal d_u0_sinTable_q_18_sticky_ena_q : std_logic_vector (0 downto 0);
    signal d_u0_cosTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u0_cosTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u0_cosTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u0_cosTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u0_cosTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u0_cosTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u0_cosTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u1_octantBitSelect_b_19_replace_mem_reset0 : std_logic;
    signal d_u1_octantBitSelect_b_19_replace_mem_iq : std_logic_vector (2 downto 0);
    signal d_u1_octantBitSelect_b_19_replace_mem_ia : std_logic_vector (2 downto 0);
    signal d_u1_octantBitSelect_b_19_replace_mem_ir : std_logic_vector (2 downto 0);
    signal d_u1_octantBitSelect_b_19_replace_mem_aa : std_logic_vector (2 downto 0);
    signal d_u1_octantBitSelect_b_19_replace_mem_ab : std_logic_vector (2 downto 0);
    signal d_u1_octantBitSelect_b_19_replace_mem_q : std_logic_vector (2 downto 0);
    signal d_u1_rangeAddSub_q_18_replace_mem_reset0 : std_logic;
    signal d_u1_rangeAddSub_q_18_replace_mem_iq : std_logic_vector (18 downto 0);
    signal d_u1_rangeAddSub_q_18_replace_mem_ia : std_logic_vector (18 downto 0);
    signal d_u1_rangeAddSub_q_18_replace_mem_ir : std_logic_vector (18 downto 0);
    signal d_u1_rangeAddSub_q_18_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u1_rangeAddSub_q_18_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u1_rangeAddSub_q_18_replace_mem_q : std_logic_vector (18 downto 0);
    signal d_u1_sinTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u1_sinTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u1_sinTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u1_sinTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u1_sinTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u1_sinTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u1_sinTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u1_cosTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u1_cosTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u1_cosTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u1_cosTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u1_cosTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u1_cosTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u1_cosTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u2_octantBitSelect_b_19_replace_mem_reset0 : std_logic;
    signal d_u2_octantBitSelect_b_19_replace_mem_iq : std_logic_vector (2 downto 0);
    signal d_u2_octantBitSelect_b_19_replace_mem_ia : std_logic_vector (2 downto 0);
    signal d_u2_octantBitSelect_b_19_replace_mem_ir : std_logic_vector (2 downto 0);
    signal d_u2_octantBitSelect_b_19_replace_mem_aa : std_logic_vector (2 downto 0);
    signal d_u2_octantBitSelect_b_19_replace_mem_ab : std_logic_vector (2 downto 0);
    signal d_u2_octantBitSelect_b_19_replace_mem_q : std_logic_vector (2 downto 0);
    signal d_u2_rangeAddSub_q_18_replace_mem_reset0 : std_logic;
    signal d_u2_rangeAddSub_q_18_replace_mem_iq : std_logic_vector (18 downto 0);
    signal d_u2_rangeAddSub_q_18_replace_mem_ia : std_logic_vector (18 downto 0);
    signal d_u2_rangeAddSub_q_18_replace_mem_ir : std_logic_vector (18 downto 0);
    signal d_u2_rangeAddSub_q_18_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u2_rangeAddSub_q_18_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u2_rangeAddSub_q_18_replace_mem_q : std_logic_vector (18 downto 0);
    signal d_u2_sinTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u2_sinTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u2_sinTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u2_sinTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u2_sinTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u2_sinTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u2_sinTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u2_cosTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u2_cosTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u2_cosTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u2_cosTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u2_cosTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u2_cosTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u2_cosTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u3_octantBitSelect_b_19_replace_mem_reset0 : std_logic;
    signal d_u3_octantBitSelect_b_19_replace_mem_iq : std_logic_vector (2 downto 0);
    signal d_u3_octantBitSelect_b_19_replace_mem_ia : std_logic_vector (2 downto 0);
    signal d_u3_octantBitSelect_b_19_replace_mem_ir : std_logic_vector (2 downto 0);
    signal d_u3_octantBitSelect_b_19_replace_mem_aa : std_logic_vector (2 downto 0);
    signal d_u3_octantBitSelect_b_19_replace_mem_ab : std_logic_vector (2 downto 0);
    signal d_u3_octantBitSelect_b_19_replace_mem_q : std_logic_vector (2 downto 0);
    signal d_u3_rangeAddSub_q_18_replace_mem_reset0 : std_logic;
    signal d_u3_rangeAddSub_q_18_replace_mem_iq : std_logic_vector (18 downto 0);
    signal d_u3_rangeAddSub_q_18_replace_mem_ia : std_logic_vector (18 downto 0);
    signal d_u3_rangeAddSub_q_18_replace_mem_ir : std_logic_vector (18 downto 0);
    signal d_u3_rangeAddSub_q_18_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u3_rangeAddSub_q_18_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u3_rangeAddSub_q_18_replace_mem_q : std_logic_vector (18 downto 0);
    signal d_u3_sinTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u3_sinTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u3_sinTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u3_sinTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u3_sinTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u3_sinTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u3_sinTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u3_cosTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u3_cosTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u3_cosTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u3_cosTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u3_cosTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u3_cosTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u3_cosTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u4_octantBitSelect_b_19_replace_mem_reset0 : std_logic;
    signal d_u4_octantBitSelect_b_19_replace_mem_iq : std_logic_vector (2 downto 0);
    signal d_u4_octantBitSelect_b_19_replace_mem_ia : std_logic_vector (2 downto 0);
    signal d_u4_octantBitSelect_b_19_replace_mem_ir : std_logic_vector (2 downto 0);
    signal d_u4_octantBitSelect_b_19_replace_mem_aa : std_logic_vector (2 downto 0);
    signal d_u4_octantBitSelect_b_19_replace_mem_ab : std_logic_vector (2 downto 0);
    signal d_u4_octantBitSelect_b_19_replace_mem_q : std_logic_vector (2 downto 0);
    signal d_u4_rangeAddSub_q_18_replace_mem_reset0 : std_logic;
    signal d_u4_rangeAddSub_q_18_replace_mem_iq : std_logic_vector (18 downto 0);
    signal d_u4_rangeAddSub_q_18_replace_mem_ia : std_logic_vector (18 downto 0);
    signal d_u4_rangeAddSub_q_18_replace_mem_ir : std_logic_vector (18 downto 0);
    signal d_u4_rangeAddSub_q_18_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u4_rangeAddSub_q_18_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u4_rangeAddSub_q_18_replace_mem_q : std_logic_vector (18 downto 0);
    signal d_u4_sinTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u4_sinTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u4_sinTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u4_sinTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u4_sinTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u4_sinTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u4_sinTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u4_cosTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u4_cosTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u4_cosTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u4_cosTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u4_cosTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u4_cosTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u4_cosTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u5_octantBitSelect_b_19_replace_mem_reset0 : std_logic;
    signal d_u5_octantBitSelect_b_19_replace_mem_iq : std_logic_vector (2 downto 0);
    signal d_u5_octantBitSelect_b_19_replace_mem_ia : std_logic_vector (2 downto 0);
    signal d_u5_octantBitSelect_b_19_replace_mem_ir : std_logic_vector (2 downto 0);
    signal d_u5_octantBitSelect_b_19_replace_mem_aa : std_logic_vector (2 downto 0);
    signal d_u5_octantBitSelect_b_19_replace_mem_ab : std_logic_vector (2 downto 0);
    signal d_u5_octantBitSelect_b_19_replace_mem_q : std_logic_vector (2 downto 0);
    signal d_u5_rangeAddSub_q_18_replace_mem_reset0 : std_logic;
    signal d_u5_rangeAddSub_q_18_replace_mem_iq : std_logic_vector (18 downto 0);
    signal d_u5_rangeAddSub_q_18_replace_mem_ia : std_logic_vector (18 downto 0);
    signal d_u5_rangeAddSub_q_18_replace_mem_ir : std_logic_vector (18 downto 0);
    signal d_u5_rangeAddSub_q_18_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u5_rangeAddSub_q_18_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u5_rangeAddSub_q_18_replace_mem_q : std_logic_vector (18 downto 0);
    signal d_u5_sinTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u5_sinTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u5_sinTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u5_sinTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u5_sinTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u5_sinTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u5_sinTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u5_cosTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u5_cosTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u5_cosTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u5_cosTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u5_cosTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u5_cosTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u5_cosTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u6_octantBitSelect_b_19_replace_mem_reset0 : std_logic;
    signal d_u6_octantBitSelect_b_19_replace_mem_iq : std_logic_vector (2 downto 0);
    signal d_u6_octantBitSelect_b_19_replace_mem_ia : std_logic_vector (2 downto 0);
    signal d_u6_octantBitSelect_b_19_replace_mem_ir : std_logic_vector (2 downto 0);
    signal d_u6_octantBitSelect_b_19_replace_mem_aa : std_logic_vector (2 downto 0);
    signal d_u6_octantBitSelect_b_19_replace_mem_ab : std_logic_vector (2 downto 0);
    signal d_u6_octantBitSelect_b_19_replace_mem_q : std_logic_vector (2 downto 0);
    signal d_u6_rangeAddSub_q_18_replace_mem_reset0 : std_logic;
    signal d_u6_rangeAddSub_q_18_replace_mem_iq : std_logic_vector (18 downto 0);
    signal d_u6_rangeAddSub_q_18_replace_mem_ia : std_logic_vector (18 downto 0);
    signal d_u6_rangeAddSub_q_18_replace_mem_ir : std_logic_vector (18 downto 0);
    signal d_u6_rangeAddSub_q_18_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u6_rangeAddSub_q_18_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u6_rangeAddSub_q_18_replace_mem_q : std_logic_vector (18 downto 0);
    signal d_u6_sinTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u6_sinTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u6_sinTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u6_sinTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u6_sinTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u6_sinTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u6_sinTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u6_cosTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u6_cosTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u6_cosTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u6_cosTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u6_cosTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u6_cosTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u6_cosTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u7_octantBitSelect_b_19_replace_mem_reset0 : std_logic;
    signal d_u7_octantBitSelect_b_19_replace_mem_iq : std_logic_vector (2 downto 0);
    signal d_u7_octantBitSelect_b_19_replace_mem_ia : std_logic_vector (2 downto 0);
    signal d_u7_octantBitSelect_b_19_replace_mem_ir : std_logic_vector (2 downto 0);
    signal d_u7_octantBitSelect_b_19_replace_mem_aa : std_logic_vector (2 downto 0);
    signal d_u7_octantBitSelect_b_19_replace_mem_ab : std_logic_vector (2 downto 0);
    signal d_u7_octantBitSelect_b_19_replace_mem_q : std_logic_vector (2 downto 0);
    signal d_u7_rangeAddSub_q_18_replace_mem_reset0 : std_logic;
    signal d_u7_rangeAddSub_q_18_replace_mem_iq : std_logic_vector (18 downto 0);
    signal d_u7_rangeAddSub_q_18_replace_mem_ia : std_logic_vector (18 downto 0);
    signal d_u7_rangeAddSub_q_18_replace_mem_ir : std_logic_vector (18 downto 0);
    signal d_u7_rangeAddSub_q_18_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u7_rangeAddSub_q_18_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u7_rangeAddSub_q_18_replace_mem_q : std_logic_vector (18 downto 0);
    signal d_u7_sinTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u7_sinTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u7_sinTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u7_sinTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u7_sinTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u7_sinTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u7_sinTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u7_cosTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u7_cosTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u7_cosTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u7_cosTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u7_cosTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u7_cosTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u7_cosTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u8_octantBitSelect_b_19_replace_mem_reset0 : std_logic;
    signal d_u8_octantBitSelect_b_19_replace_mem_iq : std_logic_vector (2 downto 0);
    signal d_u8_octantBitSelect_b_19_replace_mem_ia : std_logic_vector (2 downto 0);
    signal d_u8_octantBitSelect_b_19_replace_mem_ir : std_logic_vector (2 downto 0);
    signal d_u8_octantBitSelect_b_19_replace_mem_aa : std_logic_vector (2 downto 0);
    signal d_u8_octantBitSelect_b_19_replace_mem_ab : std_logic_vector (2 downto 0);
    signal d_u8_octantBitSelect_b_19_replace_mem_q : std_logic_vector (2 downto 0);
    signal d_u8_rangeAddSub_q_18_replace_mem_reset0 : std_logic;
    signal d_u8_rangeAddSub_q_18_replace_mem_iq : std_logic_vector (18 downto 0);
    signal d_u8_rangeAddSub_q_18_replace_mem_ia : std_logic_vector (18 downto 0);
    signal d_u8_rangeAddSub_q_18_replace_mem_ir : std_logic_vector (18 downto 0);
    signal d_u8_rangeAddSub_q_18_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u8_rangeAddSub_q_18_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u8_rangeAddSub_q_18_replace_mem_q : std_logic_vector (18 downto 0);
    signal d_u8_sinTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u8_sinTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u8_sinTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u8_sinTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u8_sinTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u8_sinTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u8_sinTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u8_cosTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u8_cosTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u8_cosTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u8_cosTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u8_cosTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u8_cosTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u8_cosTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u9_octantBitSelect_b_19_replace_mem_reset0 : std_logic;
    signal d_u9_octantBitSelect_b_19_replace_mem_iq : std_logic_vector (2 downto 0);
    signal d_u9_octantBitSelect_b_19_replace_mem_ia : std_logic_vector (2 downto 0);
    signal d_u9_octantBitSelect_b_19_replace_mem_ir : std_logic_vector (2 downto 0);
    signal d_u9_octantBitSelect_b_19_replace_mem_aa : std_logic_vector (2 downto 0);
    signal d_u9_octantBitSelect_b_19_replace_mem_ab : std_logic_vector (2 downto 0);
    signal d_u9_octantBitSelect_b_19_replace_mem_q : std_logic_vector (2 downto 0);
    signal d_u9_rangeAddSub_q_18_replace_mem_reset0 : std_logic;
    signal d_u9_rangeAddSub_q_18_replace_mem_iq : std_logic_vector (18 downto 0);
    signal d_u9_rangeAddSub_q_18_replace_mem_ia : std_logic_vector (18 downto 0);
    signal d_u9_rangeAddSub_q_18_replace_mem_ir : std_logic_vector (18 downto 0);
    signal d_u9_rangeAddSub_q_18_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u9_rangeAddSub_q_18_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u9_rangeAddSub_q_18_replace_mem_q : std_logic_vector (18 downto 0);
    signal d_u9_sinTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u9_sinTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u9_sinTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u9_sinTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u9_sinTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u9_sinTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u9_sinTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u9_cosTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u9_cosTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u9_cosTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u9_cosTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u9_cosTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u9_cosTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u9_cosTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u10_octantBitSelect_b_19_replace_mem_reset0 : std_logic;
    signal d_u10_octantBitSelect_b_19_replace_mem_iq : std_logic_vector (2 downto 0);
    signal d_u10_octantBitSelect_b_19_replace_mem_ia : std_logic_vector (2 downto 0);
    signal d_u10_octantBitSelect_b_19_replace_mem_ir : std_logic_vector (2 downto 0);
    signal d_u10_octantBitSelect_b_19_replace_mem_aa : std_logic_vector (2 downto 0);
    signal d_u10_octantBitSelect_b_19_replace_mem_ab : std_logic_vector (2 downto 0);
    signal d_u10_octantBitSelect_b_19_replace_mem_q : std_logic_vector (2 downto 0);
    signal d_u10_rangeAddSub_q_18_replace_mem_reset0 : std_logic;
    signal d_u10_rangeAddSub_q_18_replace_mem_iq : std_logic_vector (18 downto 0);
    signal d_u10_rangeAddSub_q_18_replace_mem_ia : std_logic_vector (18 downto 0);
    signal d_u10_rangeAddSub_q_18_replace_mem_ir : std_logic_vector (18 downto 0);
    signal d_u10_rangeAddSub_q_18_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u10_rangeAddSub_q_18_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u10_rangeAddSub_q_18_replace_mem_q : std_logic_vector (18 downto 0);
    signal d_u10_sinTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u10_sinTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u10_sinTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u10_sinTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u10_sinTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u10_sinTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u10_sinTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u10_cosTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u10_cosTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u10_cosTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u10_cosTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u10_cosTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u10_cosTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u10_cosTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u11_octantBitSelect_b_19_replace_mem_reset0 : std_logic;
    signal d_u11_octantBitSelect_b_19_replace_mem_iq : std_logic_vector (2 downto 0);
    signal d_u11_octantBitSelect_b_19_replace_mem_ia : std_logic_vector (2 downto 0);
    signal d_u11_octantBitSelect_b_19_replace_mem_ir : std_logic_vector (2 downto 0);
    signal d_u11_octantBitSelect_b_19_replace_mem_aa : std_logic_vector (2 downto 0);
    signal d_u11_octantBitSelect_b_19_replace_mem_ab : std_logic_vector (2 downto 0);
    signal d_u11_octantBitSelect_b_19_replace_mem_q : std_logic_vector (2 downto 0);
    signal d_u11_rangeAddSub_q_18_replace_mem_reset0 : std_logic;
    signal d_u11_rangeAddSub_q_18_replace_mem_iq : std_logic_vector (18 downto 0);
    signal d_u11_rangeAddSub_q_18_replace_mem_ia : std_logic_vector (18 downto 0);
    signal d_u11_rangeAddSub_q_18_replace_mem_ir : std_logic_vector (18 downto 0);
    signal d_u11_rangeAddSub_q_18_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u11_rangeAddSub_q_18_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u11_rangeAddSub_q_18_replace_mem_q : std_logic_vector (18 downto 0);
    signal d_u11_sinTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u11_sinTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u11_sinTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u11_sinTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u11_sinTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u11_sinTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u11_sinTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u11_cosTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u11_cosTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u11_cosTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u11_cosTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u11_cosTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u11_cosTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u11_cosTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u12_octantBitSelect_b_19_replace_mem_reset0 : std_logic;
    signal d_u12_octantBitSelect_b_19_replace_mem_iq : std_logic_vector (2 downto 0);
    signal d_u12_octantBitSelect_b_19_replace_mem_ia : std_logic_vector (2 downto 0);
    signal d_u12_octantBitSelect_b_19_replace_mem_ir : std_logic_vector (2 downto 0);
    signal d_u12_octantBitSelect_b_19_replace_mem_aa : std_logic_vector (2 downto 0);
    signal d_u12_octantBitSelect_b_19_replace_mem_ab : std_logic_vector (2 downto 0);
    signal d_u12_octantBitSelect_b_19_replace_mem_q : std_logic_vector (2 downto 0);
    signal d_u12_rangeAddSub_q_18_replace_mem_reset0 : std_logic;
    signal d_u12_rangeAddSub_q_18_replace_mem_iq : std_logic_vector (18 downto 0);
    signal d_u12_rangeAddSub_q_18_replace_mem_ia : std_logic_vector (18 downto 0);
    signal d_u12_rangeAddSub_q_18_replace_mem_ir : std_logic_vector (18 downto 0);
    signal d_u12_rangeAddSub_q_18_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u12_rangeAddSub_q_18_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u12_rangeAddSub_q_18_replace_mem_q : std_logic_vector (18 downto 0);
    signal d_u12_sinTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u12_sinTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u12_sinTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u12_sinTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u12_sinTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u12_sinTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u12_sinTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u12_cosTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u12_cosTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u12_cosTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u12_cosTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u12_cosTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u12_cosTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u12_cosTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u13_octantBitSelect_b_19_replace_mem_reset0 : std_logic;
    signal d_u13_octantBitSelect_b_19_replace_mem_iq : std_logic_vector (2 downto 0);
    signal d_u13_octantBitSelect_b_19_replace_mem_ia : std_logic_vector (2 downto 0);
    signal d_u13_octantBitSelect_b_19_replace_mem_ir : std_logic_vector (2 downto 0);
    signal d_u13_octantBitSelect_b_19_replace_mem_aa : std_logic_vector (2 downto 0);
    signal d_u13_octantBitSelect_b_19_replace_mem_ab : std_logic_vector (2 downto 0);
    signal d_u13_octantBitSelect_b_19_replace_mem_q : std_logic_vector (2 downto 0);
    signal d_u13_rangeAddSub_q_18_replace_mem_reset0 : std_logic;
    signal d_u13_rangeAddSub_q_18_replace_mem_iq : std_logic_vector (18 downto 0);
    signal d_u13_rangeAddSub_q_18_replace_mem_ia : std_logic_vector (18 downto 0);
    signal d_u13_rangeAddSub_q_18_replace_mem_ir : std_logic_vector (18 downto 0);
    signal d_u13_rangeAddSub_q_18_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u13_rangeAddSub_q_18_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u13_rangeAddSub_q_18_replace_mem_q : std_logic_vector (18 downto 0);
    signal d_u13_sinTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u13_sinTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u13_sinTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u13_sinTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u13_sinTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u13_sinTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u13_sinTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u13_cosTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u13_cosTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u13_cosTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u13_cosTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u13_cosTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u13_cosTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u13_cosTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u14_octantBitSelect_b_19_replace_mem_reset0 : std_logic;
    signal d_u14_octantBitSelect_b_19_replace_mem_iq : std_logic_vector (2 downto 0);
    signal d_u14_octantBitSelect_b_19_replace_mem_ia : std_logic_vector (2 downto 0);
    signal d_u14_octantBitSelect_b_19_replace_mem_ir : std_logic_vector (2 downto 0);
    signal d_u14_octantBitSelect_b_19_replace_mem_aa : std_logic_vector (2 downto 0);
    signal d_u14_octantBitSelect_b_19_replace_mem_ab : std_logic_vector (2 downto 0);
    signal d_u14_octantBitSelect_b_19_replace_mem_q : std_logic_vector (2 downto 0);
    signal d_u14_rangeAddSub_q_18_replace_mem_reset0 : std_logic;
    signal d_u14_rangeAddSub_q_18_replace_mem_iq : std_logic_vector (18 downto 0);
    signal d_u14_rangeAddSub_q_18_replace_mem_ia : std_logic_vector (18 downto 0);
    signal d_u14_rangeAddSub_q_18_replace_mem_ir : std_logic_vector (18 downto 0);
    signal d_u14_rangeAddSub_q_18_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u14_rangeAddSub_q_18_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u14_rangeAddSub_q_18_replace_mem_q : std_logic_vector (18 downto 0);
    signal d_u14_sinTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u14_sinTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u14_sinTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u14_sinTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u14_sinTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u14_sinTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u14_sinTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u14_cosTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u14_cosTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u14_cosTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u14_cosTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u14_cosTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u14_cosTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u14_cosTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u15_octantBitSelect_b_19_replace_mem_reset0 : std_logic;
    signal d_u15_octantBitSelect_b_19_replace_mem_iq : std_logic_vector (2 downto 0);
    signal d_u15_octantBitSelect_b_19_replace_mem_ia : std_logic_vector (2 downto 0);
    signal d_u15_octantBitSelect_b_19_replace_mem_ir : std_logic_vector (2 downto 0);
    signal d_u15_octantBitSelect_b_19_replace_mem_aa : std_logic_vector (2 downto 0);
    signal d_u15_octantBitSelect_b_19_replace_mem_ab : std_logic_vector (2 downto 0);
    signal d_u15_octantBitSelect_b_19_replace_mem_q : std_logic_vector (2 downto 0);
    signal d_u15_rangeAddSub_q_18_replace_mem_reset0 : std_logic;
    signal d_u15_rangeAddSub_q_18_replace_mem_iq : std_logic_vector (18 downto 0);
    signal d_u15_rangeAddSub_q_18_replace_mem_ia : std_logic_vector (18 downto 0);
    signal d_u15_rangeAddSub_q_18_replace_mem_ir : std_logic_vector (18 downto 0);
    signal d_u15_rangeAddSub_q_18_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u15_rangeAddSub_q_18_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u15_rangeAddSub_q_18_replace_mem_q : std_logic_vector (18 downto 0);
    signal d_u15_sinTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u15_sinTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u15_sinTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u15_sinTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u15_sinTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u15_sinTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u15_sinTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_u15_cosTable_q_18_replace_mem_reset0 : std_logic;
    signal d_u15_cosTable_q_18_replace_mem_iq : std_logic_vector (11 downto 0);
    signal d_u15_cosTable_q_18_replace_mem_ia : std_logic_vector (11 downto 0);
    signal d_u15_cosTable_q_18_replace_mem_ir : std_logic_vector (11 downto 0);
    signal d_u15_cosTable_q_18_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u15_cosTable_q_18_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u15_cosTable_q_18_replace_mem_q : std_logic_vector (11 downto 0);
    signal d_xIn_c_22_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal d_xIn_c_22_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal d_xIn_c_22_notEnable_a : std_logic_vector(0 downto 0);
    signal d_xIn_c_22_notEnable_q : std_logic_vector(0 downto 0);
    signal d_xIn_c_22_enaAnd_a : std_logic_vector(0 downto 0);
    signal d_xIn_c_22_enaAnd_b : std_logic_vector(0 downto 0);
    signal d_xIn_c_22_enaAnd_q : std_logic_vector(0 downto 0);
    signal d_u0_octantBitSelect_b_19_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal d_u0_octantBitSelect_b_19_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal d_u0_octantBitSelect_b_19_enaAnd_a : std_logic_vector(0 downto 0);
    signal d_u0_octantBitSelect_b_19_enaAnd_b : std_logic_vector(0 downto 0);
    signal d_u0_octantBitSelect_b_19_enaAnd_q : std_logic_vector(0 downto 0);
    signal d_u0_rangeAddSub_q_18_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal d_u0_rangeAddSub_q_18_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal d_u0_rangeAddSub_q_18_enaAnd_a : std_logic_vector(0 downto 0);
    signal d_u0_rangeAddSub_q_18_enaAnd_b : std_logic_vector(0 downto 0);
    signal d_u0_rangeAddSub_q_18_enaAnd_q : std_logic_vector(0 downto 0);
    signal d_u0_sinTable_q_18_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal d_u0_sinTable_q_18_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal d_u0_sinTable_q_18_enaAnd_a : std_logic_vector(0 downto 0);
    signal d_u0_sinTable_q_18_enaAnd_b : std_logic_vector(0 downto 0);
    signal d_u0_sinTable_q_18_enaAnd_q : std_logic_vector(0 downto 0);
    signal u0_invertSin_in : std_logic_vector (19 downto 0);
    signal u0_invertSin_b : std_logic_vector (0 downto 0);
    signal u0_invertCos_in : std_logic_vector (18 downto 0);
    signal u0_invertCos_b : std_logic_vector (0 downto 0);
    signal u1_invertSin_in : std_logic_vector (19 downto 0);
    signal u1_invertSin_b : std_logic_vector (0 downto 0);
    signal u1_invertCos_in : std_logic_vector (18 downto 0);
    signal u1_invertCos_b : std_logic_vector (0 downto 0);
    signal u2_invertSin_in : std_logic_vector (19 downto 0);
    signal u2_invertSin_b : std_logic_vector (0 downto 0);
    signal u2_invertCos_in : std_logic_vector (18 downto 0);
    signal u2_invertCos_b : std_logic_vector (0 downto 0);
    signal u3_invertSin_in : std_logic_vector (19 downto 0);
    signal u3_invertSin_b : std_logic_vector (0 downto 0);
    signal u3_invertCos_in : std_logic_vector (18 downto 0);
    signal u3_invertCos_b : std_logic_vector (0 downto 0);
    signal u4_invertSin_in : std_logic_vector (19 downto 0);
    signal u4_invertSin_b : std_logic_vector (0 downto 0);
    signal u4_invertCos_in : std_logic_vector (18 downto 0);
    signal u4_invertCos_b : std_logic_vector (0 downto 0);
    signal u5_invertSin_in : std_logic_vector (19 downto 0);
    signal u5_invertSin_b : std_logic_vector (0 downto 0);
    signal u5_invertCos_in : std_logic_vector (18 downto 0);
    signal u5_invertCos_b : std_logic_vector (0 downto 0);
    signal u6_invertSin_in : std_logic_vector (19 downto 0);
    signal u6_invertSin_b : std_logic_vector (0 downto 0);
    signal u6_invertCos_in : std_logic_vector (18 downto 0);
    signal u6_invertCos_b : std_logic_vector (0 downto 0);
    signal u7_invertSin_in : std_logic_vector (19 downto 0);
    signal u7_invertSin_b : std_logic_vector (0 downto 0);
    signal u7_invertCos_in : std_logic_vector (18 downto 0);
    signal u7_invertCos_b : std_logic_vector (0 downto 0);
    signal u8_invertSin_in : std_logic_vector (19 downto 0);
    signal u8_invertSin_b : std_logic_vector (0 downto 0);
    signal u8_invertCos_in : std_logic_vector (18 downto 0);
    signal u8_invertCos_b : std_logic_vector (0 downto 0);
    signal u9_invertSin_in : std_logic_vector (19 downto 0);
    signal u9_invertSin_b : std_logic_vector (0 downto 0);
    signal u9_invertCos_in : std_logic_vector (18 downto 0);
    signal u9_invertCos_b : std_logic_vector (0 downto 0);
    signal u10_invertSin_in : std_logic_vector (19 downto 0);
    signal u10_invertSin_b : std_logic_vector (0 downto 0);
    signal u10_invertCos_in : std_logic_vector (18 downto 0);
    signal u10_invertCos_b : std_logic_vector (0 downto 0);
    signal u11_invertSin_in : std_logic_vector (19 downto 0);
    signal u11_invertSin_b : std_logic_vector (0 downto 0);
    signal u11_invertCos_in : std_logic_vector (18 downto 0);
    signal u11_invertCos_b : std_logic_vector (0 downto 0);
    signal u12_invertSin_in : std_logic_vector (19 downto 0);
    signal u12_invertSin_b : std_logic_vector (0 downto 0);
    signal u12_invertCos_in : std_logic_vector (18 downto 0);
    signal u12_invertCos_b : std_logic_vector (0 downto 0);
    signal u13_invertSin_in : std_logic_vector (19 downto 0);
    signal u13_invertSin_b : std_logic_vector (0 downto 0);
    signal u13_invertCos_in : std_logic_vector (18 downto 0);
    signal u13_invertCos_b : std_logic_vector (0 downto 0);
    signal u14_invertSin_in : std_logic_vector (19 downto 0);
    signal u14_invertSin_b : std_logic_vector (0 downto 0);
    signal u14_invertCos_in : std_logic_vector (18 downto 0);
    signal u14_invertCos_b : std_logic_vector (0 downto 0);
    signal u15_invertSin_in : std_logic_vector (19 downto 0);
    signal u15_invertSin_b : std_logic_vector (0 downto 0);
    signal u15_invertCos_in : std_logic_vector (18 downto 0);
    signal u15_invertCos_b : std_logic_vector (0 downto 0);
    signal u0_octantBitSelect_in : std_logic_vector (17 downto 0);
    signal u0_octantBitSelect_b : std_logic_vector (2 downto 0);
    signal u0_sinJoin_q : std_logic_vector (3 downto 0);
    signal u0_cosJoin_q : std_logic_vector (3 downto 0);
    signal u0_alphaBitSelect_in : std_logic_vector (14 downto 0);
    signal u0_alphaBitSelect_b : std_logic_vector (7 downto 0);
    signal u0_betaBitSelect_in : std_logic_vector (6 downto 0);
    signal u0_betaBitSelect_b : std_logic_vector (6 downto 0);
    signal u0_beta_times_4_shift_q_int : std_logic_vector (19 downto 0);
    signal u0_beta_times_4_shift_q : std_logic_vector (19 downto 0);
    signal u1_octantBitSelect_in : std_logic_vector (17 downto 0);
    signal u1_octantBitSelect_b : std_logic_vector (2 downto 0);
    signal u1_sinJoin_q : std_logic_vector (3 downto 0);
    signal u1_cosJoin_q : std_logic_vector (3 downto 0);
    signal u1_alphaBitSelect_in : std_logic_vector (14 downto 0);
    signal u1_alphaBitSelect_b : std_logic_vector (7 downto 0);
    signal u1_betaBitSelect_in : std_logic_vector (6 downto 0);
    signal u1_betaBitSelect_b : std_logic_vector (6 downto 0);
    signal u1_beta_times_4_shift_q_int : std_logic_vector (19 downto 0);
    signal u1_beta_times_4_shift_q : std_logic_vector (19 downto 0);
    signal u2_octantBitSelect_in : std_logic_vector (17 downto 0);
    signal u2_octantBitSelect_b : std_logic_vector (2 downto 0);
    signal u2_sinJoin_q : std_logic_vector (3 downto 0);
    signal u2_cosJoin_q : std_logic_vector (3 downto 0);
    signal u2_alphaBitSelect_in : std_logic_vector (14 downto 0);
    signal u2_alphaBitSelect_b : std_logic_vector (7 downto 0);
    signal u2_betaBitSelect_in : std_logic_vector (6 downto 0);
    signal u2_betaBitSelect_b : std_logic_vector (6 downto 0);
    signal u2_beta_times_4_shift_q_int : std_logic_vector (19 downto 0);
    signal u2_beta_times_4_shift_q : std_logic_vector (19 downto 0);
    signal u3_octantBitSelect_in : std_logic_vector (17 downto 0);
    signal u3_octantBitSelect_b : std_logic_vector (2 downto 0);
    signal u3_sinJoin_q : std_logic_vector (3 downto 0);
    signal u3_cosJoin_q : std_logic_vector (3 downto 0);
    signal u3_alphaBitSelect_in : std_logic_vector (14 downto 0);
    signal u3_alphaBitSelect_b : std_logic_vector (7 downto 0);
    signal u3_betaBitSelect_in : std_logic_vector (6 downto 0);
    signal u3_betaBitSelect_b : std_logic_vector (6 downto 0);
    signal u3_beta_times_4_shift_q_int : std_logic_vector (19 downto 0);
    signal u3_beta_times_4_shift_q : std_logic_vector (19 downto 0);
    signal u4_octantBitSelect_in : std_logic_vector (17 downto 0);
    signal u4_octantBitSelect_b : std_logic_vector (2 downto 0);
    signal u4_sinJoin_q : std_logic_vector (3 downto 0);
    signal u4_cosJoin_q : std_logic_vector (3 downto 0);
    signal u4_alphaBitSelect_in : std_logic_vector (14 downto 0);
    signal u4_alphaBitSelect_b : std_logic_vector (7 downto 0);
    signal u4_betaBitSelect_in : std_logic_vector (6 downto 0);
    signal u4_betaBitSelect_b : std_logic_vector (6 downto 0);
    signal u4_beta_times_4_shift_q_int : std_logic_vector (19 downto 0);
    signal u4_beta_times_4_shift_q : std_logic_vector (19 downto 0);
    signal u5_octantBitSelect_in : std_logic_vector (17 downto 0);
    signal u5_octantBitSelect_b : std_logic_vector (2 downto 0);
    signal u5_sinJoin_q : std_logic_vector (3 downto 0);
    signal u5_cosJoin_q : std_logic_vector (3 downto 0);
    signal u5_alphaBitSelect_in : std_logic_vector (14 downto 0);
    signal u5_alphaBitSelect_b : std_logic_vector (7 downto 0);
    signal u5_betaBitSelect_in : std_logic_vector (6 downto 0);
    signal u5_betaBitSelect_b : std_logic_vector (6 downto 0);
    signal u5_beta_times_4_shift_q_int : std_logic_vector (19 downto 0);
    signal u5_beta_times_4_shift_q : std_logic_vector (19 downto 0);
    signal u6_octantBitSelect_in : std_logic_vector (17 downto 0);
    signal u6_octantBitSelect_b : std_logic_vector (2 downto 0);
    signal u6_sinJoin_q : std_logic_vector (3 downto 0);
    signal u6_cosJoin_q : std_logic_vector (3 downto 0);
    signal u6_alphaBitSelect_in : std_logic_vector (14 downto 0);
    signal u6_alphaBitSelect_b : std_logic_vector (7 downto 0);
    signal u6_betaBitSelect_in : std_logic_vector (6 downto 0);
    signal u6_betaBitSelect_b : std_logic_vector (6 downto 0);
    signal u6_beta_times_4_shift_q_int : std_logic_vector (19 downto 0);
    signal u6_beta_times_4_shift_q : std_logic_vector (19 downto 0);
    signal u7_octantBitSelect_in : std_logic_vector (17 downto 0);
    signal u7_octantBitSelect_b : std_logic_vector (2 downto 0);
    signal u7_sinJoin_q : std_logic_vector (3 downto 0);
    signal u7_cosJoin_q : std_logic_vector (3 downto 0);
    signal u7_alphaBitSelect_in : std_logic_vector (14 downto 0);
    signal u7_alphaBitSelect_b : std_logic_vector (7 downto 0);
    signal u7_betaBitSelect_in : std_logic_vector (6 downto 0);
    signal u7_betaBitSelect_b : std_logic_vector (6 downto 0);
    signal u7_beta_times_4_shift_q_int : std_logic_vector (19 downto 0);
    signal u7_beta_times_4_shift_q : std_logic_vector (19 downto 0);
    signal u8_octantBitSelect_in : std_logic_vector (17 downto 0);
    signal u8_octantBitSelect_b : std_logic_vector (2 downto 0);
    signal u8_sinJoin_q : std_logic_vector (3 downto 0);
    signal u8_cosJoin_q : std_logic_vector (3 downto 0);
    signal u8_alphaBitSelect_in : std_logic_vector (14 downto 0);
    signal u8_alphaBitSelect_b : std_logic_vector (7 downto 0);
    signal u8_betaBitSelect_in : std_logic_vector (6 downto 0);
    signal u8_betaBitSelect_b : std_logic_vector (6 downto 0);
    signal u8_beta_times_4_shift_q_int : std_logic_vector (19 downto 0);
    signal u8_beta_times_4_shift_q : std_logic_vector (19 downto 0);
    signal u9_octantBitSelect_in : std_logic_vector (17 downto 0);
    signal u9_octantBitSelect_b : std_logic_vector (2 downto 0);
    signal u9_sinJoin_q : std_logic_vector (3 downto 0);
    signal u9_cosJoin_q : std_logic_vector (3 downto 0);
    signal u9_alphaBitSelect_in : std_logic_vector (14 downto 0);
    signal u9_alphaBitSelect_b : std_logic_vector (7 downto 0);
    signal u9_betaBitSelect_in : std_logic_vector (6 downto 0);
    signal u9_betaBitSelect_b : std_logic_vector (6 downto 0);
    signal u9_beta_times_4_shift_q_int : std_logic_vector (19 downto 0);
    signal u9_beta_times_4_shift_q : std_logic_vector (19 downto 0);
    signal u10_octantBitSelect_in : std_logic_vector (17 downto 0);
    signal u10_octantBitSelect_b : std_logic_vector (2 downto 0);
    signal u10_sinJoin_q : std_logic_vector (3 downto 0);
    signal u10_cosJoin_q : std_logic_vector (3 downto 0);
    signal u10_alphaBitSelect_in : std_logic_vector (14 downto 0);
    signal u10_alphaBitSelect_b : std_logic_vector (7 downto 0);
    signal u10_betaBitSelect_in : std_logic_vector (6 downto 0);
    signal u10_betaBitSelect_b : std_logic_vector (6 downto 0);
    signal u10_beta_times_4_shift_q_int : std_logic_vector (19 downto 0);
    signal u10_beta_times_4_shift_q : std_logic_vector (19 downto 0);
    signal u11_octantBitSelect_in : std_logic_vector (17 downto 0);
    signal u11_octantBitSelect_b : std_logic_vector (2 downto 0);
    signal u11_sinJoin_q : std_logic_vector (3 downto 0);
    signal u11_cosJoin_q : std_logic_vector (3 downto 0);
    signal u11_alphaBitSelect_in : std_logic_vector (14 downto 0);
    signal u11_alphaBitSelect_b : std_logic_vector (7 downto 0);
    signal u11_betaBitSelect_in : std_logic_vector (6 downto 0);
    signal u11_betaBitSelect_b : std_logic_vector (6 downto 0);
    signal u11_beta_times_4_shift_q_int : std_logic_vector (19 downto 0);
    signal u11_beta_times_4_shift_q : std_logic_vector (19 downto 0);
    signal u12_octantBitSelect_in : std_logic_vector (17 downto 0);
    signal u12_octantBitSelect_b : std_logic_vector (2 downto 0);
    signal u12_sinJoin_q : std_logic_vector (3 downto 0);
    signal u12_cosJoin_q : std_logic_vector (3 downto 0);
    signal u12_alphaBitSelect_in : std_logic_vector (14 downto 0);
    signal u12_alphaBitSelect_b : std_logic_vector (7 downto 0);
    signal u12_betaBitSelect_in : std_logic_vector (6 downto 0);
    signal u12_betaBitSelect_b : std_logic_vector (6 downto 0);
    signal u12_beta_times_4_shift_q_int : std_logic_vector (19 downto 0);
    signal u12_beta_times_4_shift_q : std_logic_vector (19 downto 0);
    signal u13_octantBitSelect_in : std_logic_vector (17 downto 0);
    signal u13_octantBitSelect_b : std_logic_vector (2 downto 0);
    signal u13_sinJoin_q : std_logic_vector (3 downto 0);
    signal u13_cosJoin_q : std_logic_vector (3 downto 0);
    signal u13_alphaBitSelect_in : std_logic_vector (14 downto 0);
    signal u13_alphaBitSelect_b : std_logic_vector (7 downto 0);
    signal u13_betaBitSelect_in : std_logic_vector (6 downto 0);
    signal u13_betaBitSelect_b : std_logic_vector (6 downto 0);
    signal u13_beta_times_4_shift_q_int : std_logic_vector (19 downto 0);
    signal u13_beta_times_4_shift_q : std_logic_vector (19 downto 0);
    signal u14_octantBitSelect_in : std_logic_vector (17 downto 0);
    signal u14_octantBitSelect_b : std_logic_vector (2 downto 0);
    signal u14_sinJoin_q : std_logic_vector (3 downto 0);
    signal u14_cosJoin_q : std_logic_vector (3 downto 0);
    signal u14_alphaBitSelect_in : std_logic_vector (14 downto 0);
    signal u14_alphaBitSelect_b : std_logic_vector (7 downto 0);
    signal u14_betaBitSelect_in : std_logic_vector (6 downto 0);
    signal u14_betaBitSelect_b : std_logic_vector (6 downto 0);
    signal u14_beta_times_4_shift_q_int : std_logic_vector (19 downto 0);
    signal u14_beta_times_4_shift_q : std_logic_vector (19 downto 0);
    signal u15_octantBitSelect_in : std_logic_vector (17 downto 0);
    signal u15_octantBitSelect_b : std_logic_vector (2 downto 0);
    signal u15_sinJoin_q : std_logic_vector (3 downto 0);
    signal u15_cosJoin_q : std_logic_vector (3 downto 0);
    signal u15_alphaBitSelect_in : std_logic_vector (14 downto 0);
    signal u15_alphaBitSelect_b : std_logic_vector (7 downto 0);
    signal u15_betaBitSelect_in : std_logic_vector (6 downto 0);
    signal u15_betaBitSelect_b : std_logic_vector (6 downto 0);
    signal u15_beta_times_4_shift_q_int : std_logic_vector (19 downto 0);
    signal u15_beta_times_4_shift_q : std_logic_vector (19 downto 0);
    signal d_xIn_c_22_cmp_a : std_logic_vector(4 downto 0);
    signal d_xIn_c_22_cmp_b : std_logic_vector(4 downto 0);
    signal d_xIn_c_22_cmp_q : std_logic_vector(0 downto 0);
    signal d_xIn_c_22_nor_a : std_logic_vector(0 downto 0);
    signal d_xIn_c_22_nor_b : std_logic_vector(0 downto 0);
    signal d_xIn_c_22_nor_q : std_logic_vector(0 downto 0);
    signal d_u0_octantBitSelect_b_19_cmp_a : std_logic_vector(3 downto 0);
    signal d_u0_octantBitSelect_b_19_cmp_b : std_logic_vector(3 downto 0);
    signal d_u0_octantBitSelect_b_19_cmp_q : std_logic_vector(0 downto 0);
    signal d_u0_octantBitSelect_b_19_nor_a : std_logic_vector(0 downto 0);
    signal d_u0_octantBitSelect_b_19_nor_b : std_logic_vector(0 downto 0);
    signal d_u0_octantBitSelect_b_19_nor_q : std_logic_vector(0 downto 0);
    signal u0_alphaOverflowBitSelect_in : std_logic_vector (15 downto 0);
    signal u0_alphaOverflowBitSelect_b : std_logic_vector (0 downto 0);
    signal d_u0_rangeAddSub_q_18_cmp_a : std_logic_vector(2 downto 0);
    signal d_u0_rangeAddSub_q_18_cmp_b : std_logic_vector(2 downto 0);
    signal d_u0_rangeAddSub_q_18_cmp_q : std_logic_vector(0 downto 0);
    signal d_u0_rangeAddSub_q_18_nor_a : std_logic_vector(0 downto 0);
    signal d_u0_rangeAddSub_q_18_nor_b : std_logic_vector(0 downto 0);
    signal d_u0_rangeAddSub_q_18_nor_q : std_logic_vector(0 downto 0);
    signal u0_lsSinTable_q_int : std_logic_vector (31 downto 0);
    signal u0_lsSinTable_q : std_logic_vector (31 downto 0);
    signal d_u0_sinTable_q_18_nor_a : std_logic_vector(0 downto 0);
    signal d_u0_sinTable_q_18_nor_b : std_logic_vector(0 downto 0);
    signal d_u0_sinTable_q_18_nor_q : std_logic_vector(0 downto 0);
    signal u0_lsCosTable_q_int : std_logic_vector (31 downto 0);
    signal u0_lsCosTable_q : std_logic_vector (31 downto 0);
    signal u1_alphaOverflowBitSelect_in : std_logic_vector (15 downto 0);
    signal u1_alphaOverflowBitSelect_b : std_logic_vector (0 downto 0);
    signal u1_lsSinTable_q_int : std_logic_vector (31 downto 0);
    signal u1_lsSinTable_q : std_logic_vector (31 downto 0);
    signal u1_lsCosTable_q_int : std_logic_vector (31 downto 0);
    signal u1_lsCosTable_q : std_logic_vector (31 downto 0);
    signal u2_alphaOverflowBitSelect_in : std_logic_vector (15 downto 0);
    signal u2_alphaOverflowBitSelect_b : std_logic_vector (0 downto 0);
    signal u2_lsSinTable_q_int : std_logic_vector (31 downto 0);
    signal u2_lsSinTable_q : std_logic_vector (31 downto 0);
    signal u2_lsCosTable_q_int : std_logic_vector (31 downto 0);
    signal u2_lsCosTable_q : std_logic_vector (31 downto 0);
    signal u3_alphaOverflowBitSelect_in : std_logic_vector (15 downto 0);
    signal u3_alphaOverflowBitSelect_b : std_logic_vector (0 downto 0);
    signal u3_lsSinTable_q_int : std_logic_vector (31 downto 0);
    signal u3_lsSinTable_q : std_logic_vector (31 downto 0);
    signal u3_lsCosTable_q_int : std_logic_vector (31 downto 0);
    signal u3_lsCosTable_q : std_logic_vector (31 downto 0);
    signal u4_alphaOverflowBitSelect_in : std_logic_vector (15 downto 0);
    signal u4_alphaOverflowBitSelect_b : std_logic_vector (0 downto 0);
    signal u4_lsSinTable_q_int : std_logic_vector (31 downto 0);
    signal u4_lsSinTable_q : std_logic_vector (31 downto 0);
    signal u4_lsCosTable_q_int : std_logic_vector (31 downto 0);
    signal u4_lsCosTable_q : std_logic_vector (31 downto 0);
    signal u5_alphaOverflowBitSelect_in : std_logic_vector (15 downto 0);
    signal u5_alphaOverflowBitSelect_b : std_logic_vector (0 downto 0);
    signal u5_lsSinTable_q_int : std_logic_vector (31 downto 0);
    signal u5_lsSinTable_q : std_logic_vector (31 downto 0);
    signal u5_lsCosTable_q_int : std_logic_vector (31 downto 0);
    signal u5_lsCosTable_q : std_logic_vector (31 downto 0);
    signal u6_alphaOverflowBitSelect_in : std_logic_vector (15 downto 0);
    signal u6_alphaOverflowBitSelect_b : std_logic_vector (0 downto 0);
    signal u6_lsSinTable_q_int : std_logic_vector (31 downto 0);
    signal u6_lsSinTable_q : std_logic_vector (31 downto 0);
    signal u6_lsCosTable_q_int : std_logic_vector (31 downto 0);
    signal u6_lsCosTable_q : std_logic_vector (31 downto 0);
    signal u7_alphaOverflowBitSelect_in : std_logic_vector (15 downto 0);
    signal u7_alphaOverflowBitSelect_b : std_logic_vector (0 downto 0);
    signal u7_lsSinTable_q_int : std_logic_vector (31 downto 0);
    signal u7_lsSinTable_q : std_logic_vector (31 downto 0);
    signal u7_lsCosTable_q_int : std_logic_vector (31 downto 0);
    signal u7_lsCosTable_q : std_logic_vector (31 downto 0);
    signal u8_alphaOverflowBitSelect_in : std_logic_vector (15 downto 0);
    signal u8_alphaOverflowBitSelect_b : std_logic_vector (0 downto 0);
    signal u8_lsSinTable_q_int : std_logic_vector (31 downto 0);
    signal u8_lsSinTable_q : std_logic_vector (31 downto 0);
    signal u8_lsCosTable_q_int : std_logic_vector (31 downto 0);
    signal u8_lsCosTable_q : std_logic_vector (31 downto 0);
    signal u9_alphaOverflowBitSelect_in : std_logic_vector (15 downto 0);
    signal u9_alphaOverflowBitSelect_b : std_logic_vector (0 downto 0);
    signal u9_lsSinTable_q_int : std_logic_vector (31 downto 0);
    signal u9_lsSinTable_q : std_logic_vector (31 downto 0);
    signal u9_lsCosTable_q_int : std_logic_vector (31 downto 0);
    signal u9_lsCosTable_q : std_logic_vector (31 downto 0);
    signal u10_alphaOverflowBitSelect_in : std_logic_vector (15 downto 0);
    signal u10_alphaOverflowBitSelect_b : std_logic_vector (0 downto 0);
    signal u10_lsSinTable_q_int : std_logic_vector (31 downto 0);
    signal u10_lsSinTable_q : std_logic_vector (31 downto 0);
    signal u10_lsCosTable_q_int : std_logic_vector (31 downto 0);
    signal u10_lsCosTable_q : std_logic_vector (31 downto 0);
    signal u11_alphaOverflowBitSelect_in : std_logic_vector (15 downto 0);
    signal u11_alphaOverflowBitSelect_b : std_logic_vector (0 downto 0);
    signal u11_lsSinTable_q_int : std_logic_vector (31 downto 0);
    signal u11_lsSinTable_q : std_logic_vector (31 downto 0);
    signal u11_lsCosTable_q_int : std_logic_vector (31 downto 0);
    signal u11_lsCosTable_q : std_logic_vector (31 downto 0);
    signal u12_alphaOverflowBitSelect_in : std_logic_vector (15 downto 0);
    signal u12_alphaOverflowBitSelect_b : std_logic_vector (0 downto 0);
    signal u12_lsSinTable_q_int : std_logic_vector (31 downto 0);
    signal u12_lsSinTable_q : std_logic_vector (31 downto 0);
    signal u12_lsCosTable_q_int : std_logic_vector (31 downto 0);
    signal u12_lsCosTable_q : std_logic_vector (31 downto 0);
    signal u13_alphaOverflowBitSelect_in : std_logic_vector (15 downto 0);
    signal u13_alphaOverflowBitSelect_b : std_logic_vector (0 downto 0);
    signal u13_lsSinTable_q_int : std_logic_vector (31 downto 0);
    signal u13_lsSinTable_q : std_logic_vector (31 downto 0);
    signal u13_lsCosTable_q_int : std_logic_vector (31 downto 0);
    signal u13_lsCosTable_q : std_logic_vector (31 downto 0);
    signal u14_alphaOverflowBitSelect_in : std_logic_vector (15 downto 0);
    signal u14_alphaOverflowBitSelect_b : std_logic_vector (0 downto 0);
    signal u14_lsSinTable_q_int : std_logic_vector (31 downto 0);
    signal u14_lsSinTable_q : std_logic_vector (31 downto 0);
    signal u14_lsCosTable_q_int : std_logic_vector (31 downto 0);
    signal u14_lsCosTable_q : std_logic_vector (31 downto 0);
    signal u15_alphaOverflowBitSelect_in : std_logic_vector (15 downto 0);
    signal u15_alphaOverflowBitSelect_b : std_logic_vector (0 downto 0);
    signal u15_lsSinTable_q_int : std_logic_vector (31 downto 0);
    signal u15_lsSinTable_q : std_logic_vector (31 downto 0);
    signal u15_lsCosTable_q_int : std_logic_vector (31 downto 0);
    signal u15_lsCosTable_q : std_logic_vector (31 downto 0);
    signal u0_ls12_q_int : std_logic_vector (18 downto 0);
    signal u0_ls12_q : std_logic_vector (18 downto 0);
    signal u0_ls10_q_int : std_logic_vector (16 downto 0);
    signal u0_ls10_q : std_logic_vector (16 downto 0);
    signal u0_ls7_q_int : std_logic_vector (13 downto 0);
    signal u0_ls7_q : std_logic_vector (13 downto 0);
    signal u0_ls4_q_int : std_logic_vector (10 downto 0);
    signal u0_ls4_q : std_logic_vector (10 downto 0);
    signal u0_beta_times_pi_over_4_shifted_in : std_logic_vector (17 downto 0);
    signal u0_beta_times_pi_over_4_shifted_b : std_logic_vector (11 downto 0);
    signal u1_ls12_q_int : std_logic_vector (18 downto 0);
    signal u1_ls12_q : std_logic_vector (18 downto 0);
    signal u1_ls10_q_int : std_logic_vector (16 downto 0);
    signal u1_ls10_q : std_logic_vector (16 downto 0);
    signal u1_ls7_q_int : std_logic_vector (13 downto 0);
    signal u1_ls7_q : std_logic_vector (13 downto 0);
    signal u1_ls4_q_int : std_logic_vector (10 downto 0);
    signal u1_ls4_q : std_logic_vector (10 downto 0);
    signal u1_beta_times_pi_over_4_shifted_in : std_logic_vector (17 downto 0);
    signal u1_beta_times_pi_over_4_shifted_b : std_logic_vector (11 downto 0);
    signal u2_ls12_q_int : std_logic_vector (18 downto 0);
    signal u2_ls12_q : std_logic_vector (18 downto 0);
    signal u2_ls10_q_int : std_logic_vector (16 downto 0);
    signal u2_ls10_q : std_logic_vector (16 downto 0);
    signal u2_ls7_q_int : std_logic_vector (13 downto 0);
    signal u2_ls7_q : std_logic_vector (13 downto 0);
    signal u2_ls4_q_int : std_logic_vector (10 downto 0);
    signal u2_ls4_q : std_logic_vector (10 downto 0);
    signal u2_beta_times_pi_over_4_shifted_in : std_logic_vector (17 downto 0);
    signal u2_beta_times_pi_over_4_shifted_b : std_logic_vector (11 downto 0);
    signal u3_ls12_q_int : std_logic_vector (18 downto 0);
    signal u3_ls12_q : std_logic_vector (18 downto 0);
    signal u3_ls10_q_int : std_logic_vector (16 downto 0);
    signal u3_ls10_q : std_logic_vector (16 downto 0);
    signal u3_ls7_q_int : std_logic_vector (13 downto 0);
    signal u3_ls7_q : std_logic_vector (13 downto 0);
    signal u3_ls4_q_int : std_logic_vector (10 downto 0);
    signal u3_ls4_q : std_logic_vector (10 downto 0);
    signal u3_beta_times_pi_over_4_shifted_in : std_logic_vector (17 downto 0);
    signal u3_beta_times_pi_over_4_shifted_b : std_logic_vector (11 downto 0);
    signal u4_ls12_q_int : std_logic_vector (18 downto 0);
    signal u4_ls12_q : std_logic_vector (18 downto 0);
    signal u4_ls10_q_int : std_logic_vector (16 downto 0);
    signal u4_ls10_q : std_logic_vector (16 downto 0);
    signal u4_ls7_q_int : std_logic_vector (13 downto 0);
    signal u4_ls7_q : std_logic_vector (13 downto 0);
    signal u4_ls4_q_int : std_logic_vector (10 downto 0);
    signal u4_ls4_q : std_logic_vector (10 downto 0);
    signal u4_beta_times_pi_over_4_shifted_in : std_logic_vector (17 downto 0);
    signal u4_beta_times_pi_over_4_shifted_b : std_logic_vector (11 downto 0);
    signal u5_ls12_q_int : std_logic_vector (18 downto 0);
    signal u5_ls12_q : std_logic_vector (18 downto 0);
    signal u5_ls10_q_int : std_logic_vector (16 downto 0);
    signal u5_ls10_q : std_logic_vector (16 downto 0);
    signal u5_ls7_q_int : std_logic_vector (13 downto 0);
    signal u5_ls7_q : std_logic_vector (13 downto 0);
    signal u5_ls4_q_int : std_logic_vector (10 downto 0);
    signal u5_ls4_q : std_logic_vector (10 downto 0);
    signal u5_beta_times_pi_over_4_shifted_in : std_logic_vector (17 downto 0);
    signal u5_beta_times_pi_over_4_shifted_b : std_logic_vector (11 downto 0);
    signal u6_ls12_q_int : std_logic_vector (18 downto 0);
    signal u6_ls12_q : std_logic_vector (18 downto 0);
    signal u6_ls10_q_int : std_logic_vector (16 downto 0);
    signal u6_ls10_q : std_logic_vector (16 downto 0);
    signal u6_ls7_q_int : std_logic_vector (13 downto 0);
    signal u6_ls7_q : std_logic_vector (13 downto 0);
    signal u6_ls4_q_int : std_logic_vector (10 downto 0);
    signal u6_ls4_q : std_logic_vector (10 downto 0);
    signal u6_beta_times_pi_over_4_shifted_in : std_logic_vector (17 downto 0);
    signal u6_beta_times_pi_over_4_shifted_b : std_logic_vector (11 downto 0);
    signal u7_ls12_q_int : std_logic_vector (18 downto 0);
    signal u7_ls12_q : std_logic_vector (18 downto 0);
    signal u7_ls10_q_int : std_logic_vector (16 downto 0);
    signal u7_ls10_q : std_logic_vector (16 downto 0);
    signal u7_ls7_q_int : std_logic_vector (13 downto 0);
    signal u7_ls7_q : std_logic_vector (13 downto 0);
    signal u7_ls4_q_int : std_logic_vector (10 downto 0);
    signal u7_ls4_q : std_logic_vector (10 downto 0);
    signal u7_beta_times_pi_over_4_shifted_in : std_logic_vector (17 downto 0);
    signal u7_beta_times_pi_over_4_shifted_b : std_logic_vector (11 downto 0);
    signal u8_ls12_q_int : std_logic_vector (18 downto 0);
    signal u8_ls12_q : std_logic_vector (18 downto 0);
    signal u8_ls10_q_int : std_logic_vector (16 downto 0);
    signal u8_ls10_q : std_logic_vector (16 downto 0);
    signal u8_ls7_q_int : std_logic_vector (13 downto 0);
    signal u8_ls7_q : std_logic_vector (13 downto 0);
    signal u8_ls4_q_int : std_logic_vector (10 downto 0);
    signal u8_ls4_q : std_logic_vector (10 downto 0);
    signal u8_beta_times_pi_over_4_shifted_in : std_logic_vector (17 downto 0);
    signal u8_beta_times_pi_over_4_shifted_b : std_logic_vector (11 downto 0);
    signal u9_ls12_q_int : std_logic_vector (18 downto 0);
    signal u9_ls12_q : std_logic_vector (18 downto 0);
    signal u9_ls10_q_int : std_logic_vector (16 downto 0);
    signal u9_ls10_q : std_logic_vector (16 downto 0);
    signal u9_ls7_q_int : std_logic_vector (13 downto 0);
    signal u9_ls7_q : std_logic_vector (13 downto 0);
    signal u9_ls4_q_int : std_logic_vector (10 downto 0);
    signal u9_ls4_q : std_logic_vector (10 downto 0);
    signal u9_beta_times_pi_over_4_shifted_in : std_logic_vector (17 downto 0);
    signal u9_beta_times_pi_over_4_shifted_b : std_logic_vector (11 downto 0);
    signal u10_ls12_q_int : std_logic_vector (18 downto 0);
    signal u10_ls12_q : std_logic_vector (18 downto 0);
    signal u10_ls10_q_int : std_logic_vector (16 downto 0);
    signal u10_ls10_q : std_logic_vector (16 downto 0);
    signal u10_ls7_q_int : std_logic_vector (13 downto 0);
    signal u10_ls7_q : std_logic_vector (13 downto 0);
    signal u10_ls4_q_int : std_logic_vector (10 downto 0);
    signal u10_ls4_q : std_logic_vector (10 downto 0);
    signal u10_beta_times_pi_over_4_shifted_in : std_logic_vector (17 downto 0);
    signal u10_beta_times_pi_over_4_shifted_b : std_logic_vector (11 downto 0);
    signal u11_ls12_q_int : std_logic_vector (18 downto 0);
    signal u11_ls12_q : std_logic_vector (18 downto 0);
    signal u11_ls10_q_int : std_logic_vector (16 downto 0);
    signal u11_ls10_q : std_logic_vector (16 downto 0);
    signal u11_ls7_q_int : std_logic_vector (13 downto 0);
    signal u11_ls7_q : std_logic_vector (13 downto 0);
    signal u11_ls4_q_int : std_logic_vector (10 downto 0);
    signal u11_ls4_q : std_logic_vector (10 downto 0);
    signal u11_beta_times_pi_over_4_shifted_in : std_logic_vector (17 downto 0);
    signal u11_beta_times_pi_over_4_shifted_b : std_logic_vector (11 downto 0);
    signal u12_ls12_q_int : std_logic_vector (18 downto 0);
    signal u12_ls12_q : std_logic_vector (18 downto 0);
    signal u12_ls10_q_int : std_logic_vector (16 downto 0);
    signal u12_ls10_q : std_logic_vector (16 downto 0);
    signal u12_ls7_q_int : std_logic_vector (13 downto 0);
    signal u12_ls7_q : std_logic_vector (13 downto 0);
    signal u12_ls4_q_int : std_logic_vector (10 downto 0);
    signal u12_ls4_q : std_logic_vector (10 downto 0);
    signal u12_beta_times_pi_over_4_shifted_in : std_logic_vector (17 downto 0);
    signal u12_beta_times_pi_over_4_shifted_b : std_logic_vector (11 downto 0);
    signal u13_ls12_q_int : std_logic_vector (18 downto 0);
    signal u13_ls12_q : std_logic_vector (18 downto 0);
    signal u13_ls10_q_int : std_logic_vector (16 downto 0);
    signal u13_ls10_q : std_logic_vector (16 downto 0);
    signal u13_ls7_q_int : std_logic_vector (13 downto 0);
    signal u13_ls7_q : std_logic_vector (13 downto 0);
    signal u13_ls4_q_int : std_logic_vector (10 downto 0);
    signal u13_ls4_q : std_logic_vector (10 downto 0);
    signal u13_beta_times_pi_over_4_shifted_in : std_logic_vector (17 downto 0);
    signal u13_beta_times_pi_over_4_shifted_b : std_logic_vector (11 downto 0);
    signal u14_ls12_q_int : std_logic_vector (18 downto 0);
    signal u14_ls12_q : std_logic_vector (18 downto 0);
    signal u14_ls10_q_int : std_logic_vector (16 downto 0);
    signal u14_ls10_q : std_logic_vector (16 downto 0);
    signal u14_ls7_q_int : std_logic_vector (13 downto 0);
    signal u14_ls7_q : std_logic_vector (13 downto 0);
    signal u14_ls4_q_int : std_logic_vector (10 downto 0);
    signal u14_ls4_q : std_logic_vector (10 downto 0);
    signal u14_beta_times_pi_over_4_shifted_in : std_logic_vector (17 downto 0);
    signal u14_beta_times_pi_over_4_shifted_b : std_logic_vector (11 downto 0);
    signal u15_ls12_q_int : std_logic_vector (18 downto 0);
    signal u15_ls12_q : std_logic_vector (18 downto 0);
    signal u15_ls10_q_int : std_logic_vector (16 downto 0);
    signal u15_ls10_q : std_logic_vector (16 downto 0);
    signal u15_ls7_q_int : std_logic_vector (13 downto 0);
    signal u15_ls7_q : std_logic_vector (13 downto 0);
    signal u15_ls4_q_int : std_logic_vector (10 downto 0);
    signal u15_ls4_q : std_logic_vector (10 downto 0);
    signal u15_beta_times_pi_over_4_shifted_in : std_logic_vector (17 downto 0);
    signal u15_beta_times_pi_over_4_shifted_b : std_logic_vector (11 downto 0);
begin


	--busIn(BUSIN,3)@10

	--u15_phaseIncrRegLookup_0(LOOKUP,34)@10
    u15_phaseIncrRegLookup_0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u15_phaseIncrRegLookup_0_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_a) IS
                WHEN "010010111111" =>                     u15_phaseIncrRegLookup_0_e <= busIn_w;
                WHEN OTHERS =>
                    u15_phaseIncrRegLookup_0_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--d_busIn_d_11(DELAY,695)@10
    d_busIn_d_11 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => busIn_d, xout => d_busIn_d_11_q, clk => bus_clk, aclr => bus_areset );

	--u15_phaseIncrReg_p0(REG,35)@11
    u15_phaseIncrReg_p0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u15_phaseIncrReg_p0_q <= "01000110000000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (u15_phaseIncrRegLookup_0_e = "1") THEN
                u15_phaseIncrReg_p0_q <= d_busIn_d_11_q(19 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u15_invertCos(BITSELECT,685)@20
    u15_invertCos_in <= u15_phaseIncrReg_p0_q(18 downto 0);
    u15_invertCos_b <= u15_invertCos_in(18 downto 18);

	--d_xIn_c_22_notEnable(LOGICAL,800)
    d_xIn_c_22_notEnable_a <= VCC_q;
    d_xIn_c_22_notEnable_q <= not d_xIn_c_22_notEnable_a;

	--d_u0_octantBitSelect_b_19_nor(LOGICAL,813)
    d_u0_octantBitSelect_b_19_nor_a <= d_xIn_c_22_notEnable_q;
    d_u0_octantBitSelect_b_19_nor_b <= d_u0_octantBitSelect_b_19_sticky_ena_q;
    d_u0_octantBitSelect_b_19_nor_q <= not (d_u0_octantBitSelect_b_19_nor_a or d_u0_octantBitSelect_b_19_nor_b);

	--d_u0_octantBitSelect_b_19_mem_top(CONSTANT,809)
    d_u0_octantBitSelect_b_19_mem_top_q <= "0110";

	--d_u0_octantBitSelect_b_19_cmp(LOGICAL,810)
    d_u0_octantBitSelect_b_19_cmp_a <= d_u0_octantBitSelect_b_19_mem_top_q;
    d_u0_octantBitSelect_b_19_cmp_b <= STD_LOGIC_VECTOR("0" & d_u0_octantBitSelect_b_19_replace_rdmux_q);
    d_u0_octantBitSelect_b_19_cmp_q <= "1" when d_u0_octantBitSelect_b_19_cmp_a = d_u0_octantBitSelect_b_19_cmp_b else "0";

	--d_u0_octantBitSelect_b_19_cmpReg(REG,811)
    d_u0_octantBitSelect_b_19_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_octantBitSelect_b_19_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_octantBitSelect_b_19_cmpReg_q <= d_u0_octantBitSelect_b_19_cmp_q;
        END IF;
    END PROCESS;


	--d_u0_octantBitSelect_b_19_sticky_ena(REG,814)
    d_u0_octantBitSelect_b_19_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_octantBitSelect_b_19_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_u0_octantBitSelect_b_19_nor_q = "1") THEN
                d_u0_octantBitSelect_b_19_sticky_ena_q <= d_u0_octantBitSelect_b_19_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--d_u0_octantBitSelect_b_19_enaAnd(LOGICAL,815)
    d_u0_octantBitSelect_b_19_enaAnd_a <= d_u0_octantBitSelect_b_19_sticky_ena_q;
    d_u0_octantBitSelect_b_19_enaAnd_b <= VCC_q;
    d_u0_octantBitSelect_b_19_enaAnd_q <= d_u0_octantBitSelect_b_19_enaAnd_a and d_u0_octantBitSelect_b_19_enaAnd_b;

	--xIn(PORTIN,2)@10

	--u15_accumAdd_b1(ADD,651)@10
    u15_accumAdd_b1_a <= u15_accumAdd_b1_q;
    u15_accumAdd_b1_b <= u15_phaseIncrReg_p0_q(17 downto 0);
    u15_accumAdd_b1_i <= xIn_p_15;
    u15_accumAdd_b1_a1 <= u15_accumAdd_b1_i WHEN (xIn_s_15 = "1") ELSE u15_accumAdd_b1_a;
    u15_accumAdd_b1_b1 <= (others => '0') WHEN (xIn_s_15 = "1") ELSE u15_accumAdd_b1_b;
    u15_accumAdd_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_accumAdd_b1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u15_accumAdd_b1_o <= STD_LOGIC_VECTOR(UNSIGNED(u15_accumAdd_b1_a1) + UNSIGNED(u15_accumAdd_b1_b1));
            END IF;
        END IF;
    END PROCESS;
    u15_accumAdd_b1_q <= u15_accumAdd_b1_o(17 downto 0);


	--u15_octantBitSelect(BITSELECT,653)@11
    u15_octantBitSelect_in <= u15_accumAdd_b1_q;
    u15_octantBitSelect_b <= u15_octantBitSelect_in(17 downto 15);

	--d_u0_octantBitSelect_b_19_replace_rdcnt(COUNTER,805)
    -- every=1, low=0, high=6, step=1, init=1
    d_u0_octantBitSelect_b_19_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_octantBitSelect_b_19_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            d_u0_octantBitSelect_b_19_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF d_u0_octantBitSelect_b_19_replace_rdcnt_i = 5 THEN
                  d_u0_octantBitSelect_b_19_replace_rdcnt_eq <= '1';
                ELSE
                  d_u0_octantBitSelect_b_19_replace_rdcnt_eq <= '0';
                END IF;
                IF (d_u0_octantBitSelect_b_19_replace_rdcnt_eq = '1') THEN
                    d_u0_octantBitSelect_b_19_replace_rdcnt_i <= d_u0_octantBitSelect_b_19_replace_rdcnt_i - 6;
                ELSE
                    d_u0_octantBitSelect_b_19_replace_rdcnt_i <= d_u0_octantBitSelect_b_19_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    d_u0_octantBitSelect_b_19_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(d_u0_octantBitSelect_b_19_replace_rdcnt_i,3));


	--d_u0_octantBitSelect_b_19_replace_rdreg(REG,806)
    d_u0_octantBitSelect_b_19_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_octantBitSelect_b_19_replace_rdreg_q <= "000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_octantBitSelect_b_19_replace_rdreg_q <= d_u0_octantBitSelect_b_19_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--d_u0_octantBitSelect_b_19_replace_rdmux(MUX,807)
    d_u0_octantBitSelect_b_19_replace_rdmux_s <= VCC_q;
    d_u0_octantBitSelect_b_19_replace_rdmux: PROCESS (d_u0_octantBitSelect_b_19_replace_rdmux_s, d_u0_octantBitSelect_b_19_replace_rdreg_q, d_u0_octantBitSelect_b_19_replace_rdcnt_q)
    BEGIN
            CASE d_u0_octantBitSelect_b_19_replace_rdmux_s IS
                  WHEN "0" => d_u0_octantBitSelect_b_19_replace_rdmux_q <= d_u0_octantBitSelect_b_19_replace_rdreg_q;
                  WHEN "1" => d_u0_octantBitSelect_b_19_replace_rdmux_q <= d_u0_octantBitSelect_b_19_replace_rdcnt_q;
                  WHEN OTHERS => d_u0_octantBitSelect_b_19_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--d_u15_octantBitSelect_b_19_replace_mem(DUALMEM,1464)
    d_u15_octantBitSelect_b_19_replace_mem_reset0 <= areset;
    d_u15_octantBitSelect_b_19_replace_mem_ia <= u15_octantBitSelect_b;
    d_u15_octantBitSelect_b_19_replace_mem_aa <= d_u0_octantBitSelect_b_19_replace_rdreg_q;
    d_u15_octantBitSelect_b_19_replace_mem_ab <= d_u0_octantBitSelect_b_19_replace_rdmux_q;
    d_u15_octantBitSelect_b_19_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 3,
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
        clocken1 => d_u0_octantBitSelect_b_19_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u15_octantBitSelect_b_19_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u15_octantBitSelect_b_19_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u15_octantBitSelect_b_19_replace_mem_iq,
        address_a => d_u15_octantBitSelect_b_19_replace_mem_aa,
        data_a => d_u15_octantBitSelect_b_19_replace_mem_ia
    );
        d_u15_octantBitSelect_b_19_replace_mem_q <= d_u15_octantBitSelect_b_19_replace_mem_iq(2 downto 0);

	--d_u15_octantBitSelect_b_20(DELAY,788)@19
    d_u15_octantBitSelect_b_20 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => d_u15_octantBitSelect_b_19_replace_mem_q, xout => d_u15_octantBitSelect_b_20_q, clk => clk, aclr => areset );

	--u15_cosJoin(BITJOIN,686)@20
    u15_cosJoin_q <= u15_invertCos_b & d_u15_octantBitSelect_b_20_q;

	--u15_doCosInvert(LOOKUP,687)@20
    u15_doCosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_doCosInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u15_cosJoin_q) IS
                WHEN "0000" =>  u15_doCosInvert_q <= "1";
                WHEN "0001" =>  u15_doCosInvert_q <= "1";
                WHEN "0010" =>  u15_doCosInvert_q <= "0";
                WHEN "0011" =>  u15_doCosInvert_q <= "0";
                WHEN "0100" =>  u15_doCosInvert_q <= "0";
                WHEN "0101" =>  u15_doCosInvert_q <= "0";
                WHEN "0110" =>  u15_doCosInvert_q <= "1";
                WHEN "0111" =>  u15_doCosInvert_q <= "1";
                WHEN "1000" =>  u15_doCosInvert_q <= "0";
                WHEN "1001" =>  u15_doCosInvert_q <= "0";
                WHEN "1010" =>  u15_doCosInvert_q <= "1";
                WHEN "1011" =>  u15_doCosInvert_q <= "1";
                WHEN "1100" =>  u15_doCosInvert_q <= "1";
                WHEN "1101" =>  u15_doCosInvert_q <= "1";
                WHEN "1110" =>  u15_doCosInvert_q <= "0";
                WHEN "1111" =>  u15_doCosInvert_q <= "0";
                WHEN OTHERS =>
                    u15_doCosInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--VCC(CONSTANT,1)@0
    VCC_q <= "1";

	--u0_sin_pi_over_4(CONSTANT,60)@0
    u0_sin_pi_over_4_q <= "01011010011111";

	--d_u0_rangeAddSub_q_18_nor(LOGICAL,825)
    d_u0_rangeAddSub_q_18_nor_a <= d_xIn_c_22_notEnable_q;
    d_u0_rangeAddSub_q_18_nor_b <= d_u0_rangeAddSub_q_18_sticky_ena_q;
    d_u0_rangeAddSub_q_18_nor_q <= not (d_u0_rangeAddSub_q_18_nor_a or d_u0_rangeAddSub_q_18_nor_b);

	--d_u0_rangeAddSub_q_18_mem_top(CONSTANT,821)
    d_u0_rangeAddSub_q_18_mem_top_q <= "011";

	--d_u0_rangeAddSub_q_18_cmp(LOGICAL,822)
    d_u0_rangeAddSub_q_18_cmp_a <= d_u0_rangeAddSub_q_18_mem_top_q;
    d_u0_rangeAddSub_q_18_cmp_b <= STD_LOGIC_VECTOR("0" & d_u0_rangeAddSub_q_18_replace_rdmux_q);
    d_u0_rangeAddSub_q_18_cmp_q <= "1" when d_u0_rangeAddSub_q_18_cmp_a = d_u0_rangeAddSub_q_18_cmp_b else "0";

	--d_u0_rangeAddSub_q_18_cmpReg(REG,823)
    d_u0_rangeAddSub_q_18_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_rangeAddSub_q_18_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_rangeAddSub_q_18_cmpReg_q <= d_u0_rangeAddSub_q_18_cmp_q;
        END IF;
    END PROCESS;


	--d_u0_rangeAddSub_q_18_sticky_ena(REG,826)
    d_u0_rangeAddSub_q_18_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_rangeAddSub_q_18_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_u0_rangeAddSub_q_18_nor_q = "1") THEN
                d_u0_rangeAddSub_q_18_sticky_ena_q <= d_u0_rangeAddSub_q_18_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--d_u0_rangeAddSub_q_18_enaAnd(LOGICAL,827)
    d_u0_rangeAddSub_q_18_enaAnd_a <= d_u0_rangeAddSub_q_18_sticky_ena_q;
    d_u0_rangeAddSub_q_18_enaAnd_b <= VCC_q;
    d_u0_rangeAddSub_q_18_enaAnd_q <= d_u0_rangeAddSub_q_18_enaAnd_a and d_u0_rangeAddSub_q_18_enaAnd_b;

	--u15_addnsubConst(LOOKUP,655)@11
    u15_addnsubConst: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_addnsubConst_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u15_octantBitSelect_b) IS
                WHEN "000" =>  u15_addnsubConst_q <= "1";
                WHEN "001" =>  u15_addnsubConst_q <= "0";
                WHEN "010" =>  u15_addnsubConst_q <= "1";
                WHEN "011" =>  u15_addnsubConst_q <= "0";
                WHEN "100" =>  u15_addnsubConst_q <= "1";
                WHEN "101" =>  u15_addnsubConst_q <= "0";
                WHEN "110" =>  u15_addnsubConst_q <= "1";
                WHEN "111" =>  u15_addnsubConst_q <= "0";
                WHEN OTHERS =>
                    u15_addnsubConst_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--d_u15_accumAdd_b1_q_12(DELAY,786)@11
    d_u15_accumAdd_b1_q_12 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => u15_accumAdd_b1_q, xout => d_u15_accumAdd_b1_q_12_q, clk => clk, aclr => areset );

	--u15_rangeLUT(LOOKUP,654)@11
    u15_rangeLUT: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_rangeLUT_q <= "0000000000000000000";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u15_octantBitSelect_b) IS
                WHEN "000" =>  u15_rangeLUT_q <= "0000000000000000000";
                WHEN "001" =>  u15_rangeLUT_q <= "0010000000000000000";
                WHEN "010" =>  u15_rangeLUT_q <= "1110000000000000000";
                WHEN "011" =>  u15_rangeLUT_q <= "0100000000000000000";
                WHEN "100" =>  u15_rangeLUT_q <= "1100000000000000000";
                WHEN "101" =>  u15_rangeLUT_q <= "0110000000000000000";
                WHEN "110" =>  u15_rangeLUT_q <= "1010000000000000000";
                WHEN "111" =>  u15_rangeLUT_q <= "1100000000000000000";
                WHEN OTHERS =>
                    u15_rangeLUT_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u15_rangeAddSub(ADDSUB,656)@12
    u15_rangeAddSub_cin <= GND_q;
    u15_rangeAddSub_a <= STD_LOGIC_VECTOR("0" & u15_rangeLUT_q) & u15_addnsubConst_q(0);
    u15_rangeAddSub_b <= STD_LOGIC_VECTOR("00" & d_u15_accumAdd_b1_q_12_q) & u15_rangeAddSub_cin(0);
    u15_rangeAddSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_rangeAddSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u15_addnsubConst_q = "1") THEN
                u15_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u15_rangeAddSub_a) + UNSIGNED(u15_rangeAddSub_b));
            ELSE
                u15_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u15_rangeAddSub_a) - UNSIGNED(u15_rangeAddSub_b));
            END IF;
        END IF;
    END PROCESS;
    u15_rangeAddSub_q <= u15_rangeAddSub_o(19 downto 1);


	--d_u0_rangeAddSub_q_18_replace_rdcnt(COUNTER,817)
    -- every=1, low=0, high=3, step=1, init=1
    d_u0_rangeAddSub_q_18_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_rangeAddSub_q_18_replace_rdcnt_i <= TO_UNSIGNED(1,2);
        ELSIF (clk'EVENT AND clk = '1') THEN
                d_u0_rangeAddSub_q_18_replace_rdcnt_i <= d_u0_rangeAddSub_q_18_replace_rdcnt_i + 1;
        END IF;
    END PROCESS;
    d_u0_rangeAddSub_q_18_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(d_u0_rangeAddSub_q_18_replace_rdcnt_i,2));


	--d_u0_rangeAddSub_q_18_replace_rdreg(REG,818)
    d_u0_rangeAddSub_q_18_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_rangeAddSub_q_18_replace_rdreg_q <= "00";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_rangeAddSub_q_18_replace_rdreg_q <= d_u0_rangeAddSub_q_18_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--d_u0_rangeAddSub_q_18_replace_rdmux(MUX,819)
    d_u0_rangeAddSub_q_18_replace_rdmux_s <= VCC_q;
    d_u0_rangeAddSub_q_18_replace_rdmux: PROCESS (d_u0_rangeAddSub_q_18_replace_rdmux_s, d_u0_rangeAddSub_q_18_replace_rdreg_q, d_u0_rangeAddSub_q_18_replace_rdcnt_q)
    BEGIN
            CASE d_u0_rangeAddSub_q_18_replace_rdmux_s IS
                  WHEN "0" => d_u0_rangeAddSub_q_18_replace_rdmux_q <= d_u0_rangeAddSub_q_18_replace_rdreg_q;
                  WHEN "1" => d_u0_rangeAddSub_q_18_replace_rdmux_q <= d_u0_rangeAddSub_q_18_replace_rdcnt_q;
                  WHEN OTHERS => d_u0_rangeAddSub_q_18_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--d_u15_rangeAddSub_q_18_replace_mem(DUALMEM,1476)
    d_u15_rangeAddSub_q_18_replace_mem_reset0 <= areset;
    d_u15_rangeAddSub_q_18_replace_mem_ia <= u15_rangeAddSub_q;
    d_u15_rangeAddSub_q_18_replace_mem_aa <= d_u0_rangeAddSub_q_18_replace_rdreg_q;
    d_u15_rangeAddSub_q_18_replace_mem_ab <= d_u0_rangeAddSub_q_18_replace_rdmux_q;
    d_u15_rangeAddSub_q_18_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 19,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 19,
        widthad_b => 2,
        numwords_b => 4,
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
        clocken1 => d_u0_rangeAddSub_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u15_rangeAddSub_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u15_rangeAddSub_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u15_rangeAddSub_q_18_replace_mem_iq,
        address_a => d_u15_rangeAddSub_q_18_replace_mem_aa,
        data_a => d_u15_rangeAddSub_q_18_replace_mem_ia
    );
        d_u15_rangeAddSub_q_18_replace_mem_q <= d_u15_rangeAddSub_q_18_replace_mem_iq(18 downto 0);

	--u15_alphaOverflowBitSelect(BITSELECT,658)@18
    u15_alphaOverflowBitSelect_in <= d_u15_rangeAddSub_q_18_replace_mem_q(15 downto 0);
    u15_alphaOverflowBitSelect_b <= u15_alphaOverflowBitSelect_in(15 downto 15);

	--u15_betaBitSelect(BITSELECT,659)@13
    u15_betaBitSelect_in <= u15_rangeAddSub_q(6 downto 0);
    u15_betaBitSelect_b <= u15_betaBitSelect_in(6 downto 0);

	--u15_ls4(BITSHIFT,666)@13
    u15_ls4_q_int <= u15_betaBitSelect_b & "0000";
    u15_ls4_q <= u15_ls4_q_int(10 downto 0);

	--u15_ls7(BITSHIFT,665)@13
    u15_ls7_q_int <= u15_betaBitSelect_b & "0000000";
    u15_ls7_q <= u15_ls7_q_int(13 downto 0);

	--u15_cm2(ADD,667)@13
    u15_cm2_a <= STD_LOGIC_VECTOR("0" & u15_ls7_q);
    u15_cm2_b <= STD_LOGIC_VECTOR("0000" & u15_ls4_q);
    u15_cm2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_cm2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u15_cm2_o <= STD_LOGIC_VECTOR(UNSIGNED(u15_cm2_a) + UNSIGNED(u15_cm2_b));
        END IF;
    END PROCESS;
    u15_cm2_q <= u15_cm2_o(14 downto 0);


	--u15_ls10(BITSHIFT,663)@13
    u15_ls10_q_int <= u15_betaBitSelect_b & "0000000000";
    u15_ls10_q <= u15_ls10_q_int(16 downto 0);

	--u15_ls12(BITSHIFT,662)@13
    u15_ls12_q_int <= u15_betaBitSelect_b & "000000000000";
    u15_ls12_q <= u15_ls12_q_int(18 downto 0);

	--u15_cm1(SUB,664)@13
    u15_cm1_a <= STD_LOGIC_VECTOR("0" & u15_ls12_q);
    u15_cm1_b <= STD_LOGIC_VECTOR("000" & u15_ls10_q);
    u15_cm1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_cm1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u15_cm1_o <= STD_LOGIC_VECTOR(UNSIGNED(u15_cm1_a) - UNSIGNED(u15_cm1_b));
        END IF;
    END PROCESS;
    u15_cm1_q <= u15_cm1_o(19 downto 0);


	--u15_cm3(ADD,668)@14
    u15_cm3_a <= STD_LOGIC_VECTOR("0" & u15_cm1_q);
    u15_cm3_b <= STD_LOGIC_VECTOR("000000" & u15_cm2_q);
    u15_cm3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_cm3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u15_cm3_o <= STD_LOGIC_VECTOR(UNSIGNED(u15_cm3_a) + UNSIGNED(u15_cm3_b));
        END IF;
    END PROCESS;
    u15_cm3_q <= u15_cm3_o(20 downto 0);


	--u15_beta_times_4_shift(BITSHIFT,669)@15
    u15_beta_times_4_shift_q_int <= u15_cm3_q(20 downto 1);
    u15_beta_times_4_shift_q <= u15_beta_times_4_shift_q_int(19 downto 0);

	--u15_beta_times_pi_over_4_shifted(BITSELECT,670)@15
    u15_beta_times_pi_over_4_shifted_in <= u15_beta_times_4_shift_q(17 downto 0);
    u15_beta_times_pi_over_4_shifted_b <= u15_beta_times_pi_over_4_shifted_in(17 downto 6);

	--u15_alphaBitSelect(BITSELECT,657)@13
    u15_alphaBitSelect_in <= u15_rangeAddSub_q(14 downto 0);
    u15_alphaBitSelect_b <= u15_alphaBitSelect_in(14 downto 7);

	--u15_cosTable(DUALMEM,661)@13
    u15_cosTable_reset0 <= areset;
    u15_cosTable_ia <= (others => '0');
    u15_cosTable_aa <= (others => '0');
    u15_cosTable_ab <= u15_alphaBitSelect_b;
    u15_cosTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u15_cosTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u15_cosTable_reset0,
        clock0 => clk,
        address_b => u15_cosTable_ab,
        -- data_b => (others => '0'),
        q_b => u15_cosTable_iq,
        address_a => u15_cosTable_aa,
        data_a => u15_cosTable_ia
    );
        u15_cosTable_q <= u15_cosTable_iq(11 downto 0);

	--u15_cosMult(MULT,672)@15
    u15_cosMult_pr <= UNSIGNED(u15_cosMult_a) * UNSIGNED(u15_cosMult_b);
    u15_cosMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_cosMult_a <= (others => '0');
            u15_cosMult_b <= (others => '0');
            u15_cosMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u15_cosMult_a <= u15_cosTable_q;
            u15_cosMult_b <= u15_beta_times_pi_over_4_shifted_b;
            u15_cosMult_s1 <= STD_LOGIC_VECTOR(u15_cosMult_pr);
        END IF;
    END PROCESS;
    u15_cosMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_cosMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u15_cosMult_q <= u15_cosMult_s1;
        END IF;
    END PROCESS;

	--d_u0_sinTable_q_18_nor(LOGICAL,835)
    d_u0_sinTable_q_18_nor_a <= d_xIn_c_22_notEnable_q;
    d_u0_sinTable_q_18_nor_b <= d_u0_sinTable_q_18_sticky_ena_q;
    d_u0_sinTable_q_18_nor_q <= not (d_u0_sinTable_q_18_nor_a or d_u0_sinTable_q_18_nor_b);

	--d_u0_sinTable_q_18_cmpReg(REG,833)
    d_u0_sinTable_q_18_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_sinTable_q_18_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_sinTable_q_18_cmpReg_q <= VCC_q;
        END IF;
    END PROCESS;


	--d_u0_sinTable_q_18_sticky_ena(REG,836)
    d_u0_sinTable_q_18_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_sinTable_q_18_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_u0_sinTable_q_18_nor_q = "1") THEN
                d_u0_sinTable_q_18_sticky_ena_q <= d_u0_sinTable_q_18_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--d_u0_sinTable_q_18_enaAnd(LOGICAL,837)
    d_u0_sinTable_q_18_enaAnd_a <= d_u0_sinTable_q_18_sticky_ena_q;
    d_u0_sinTable_q_18_enaAnd_b <= VCC_q;
    d_u0_sinTable_q_18_enaAnd_q <= d_u0_sinTable_q_18_enaAnd_a and d_u0_sinTable_q_18_enaAnd_b;

	--u15_sinTable(DUALMEM,660)@13
    u15_sinTable_reset0 <= areset;
    u15_sinTable_ia <= (others => '0');
    u15_sinTable_aa <= (others => '0');
    u15_sinTable_ab <= u15_alphaBitSelect_b;
    u15_sinTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u15_sinTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u15_sinTable_reset0,
        clock0 => clk,
        address_b => u15_sinTable_ab,
        -- data_b => (others => '0'),
        q_b => u15_sinTable_iq,
        address_a => u15_sinTable_aa,
        data_a => u15_sinTable_ia
    );
        u15_sinTable_q <= u15_sinTable_iq(11 downto 0);

	--d_u0_sinTable_q_18_replace_rdcnt(COUNTER,829)
    -- every=1, low=0, high=1, step=1, init=1
    d_u0_sinTable_q_18_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_sinTable_q_18_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
                d_u0_sinTable_q_18_replace_rdcnt_i <= d_u0_sinTable_q_18_replace_rdcnt_i + 1;
        END IF;
    END PROCESS;
    d_u0_sinTable_q_18_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(d_u0_sinTable_q_18_replace_rdcnt_i,1));


	--d_u0_sinTable_q_18_replace_rdreg(REG,830)
    d_u0_sinTable_q_18_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_sinTable_q_18_replace_rdreg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_sinTable_q_18_replace_rdreg_q <= d_u0_sinTable_q_18_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--d_u0_sinTable_q_18_replace_rdmux(MUX,831)
    d_u0_sinTable_q_18_replace_rdmux_s <= VCC_q;
    d_u0_sinTable_q_18_replace_rdmux: PROCESS (d_u0_sinTable_q_18_replace_rdmux_s, d_u0_sinTable_q_18_replace_rdreg_q, d_u0_sinTable_q_18_replace_rdcnt_q)
    BEGIN
            CASE d_u0_sinTable_q_18_replace_rdmux_s IS
                  WHEN "0" => d_u0_sinTable_q_18_replace_rdmux_q <= d_u0_sinTable_q_18_replace_rdreg_q;
                  WHEN "1" => d_u0_sinTable_q_18_replace_rdmux_q <= d_u0_sinTable_q_18_replace_rdcnt_q;
                  WHEN OTHERS => d_u0_sinTable_q_18_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--d_u15_sinTable_q_18_replace_mem(DUALMEM,1488)
    d_u15_sinTable_q_18_replace_mem_reset0 <= areset;
    d_u15_sinTable_q_18_replace_mem_ia <= u15_sinTable_q;
    d_u15_sinTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u15_sinTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u15_sinTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u15_sinTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u15_sinTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u15_sinTable_q_18_replace_mem_iq,
        address_a => d_u15_sinTable_q_18_replace_mem_aa,
        data_a => d_u15_sinTable_q_18_replace_mem_ia
    );
        d_u15_sinTable_q_18_replace_mem_q <= d_u15_sinTable_q_18_replace_mem_iq(11 downto 0);

	--u15_lsSinTable(BITSHIFT,673)@18
    u15_lsSinTable_q_int <= d_u15_sinTable_q_18_replace_mem_q & "00000000000000000000";
    u15_lsSinTable_q <= u15_lsSinTable_q_int(31 downto 0);

	--u15_sinAdd(ADD,677)@18
    u15_sinAdd_a <= u15_lsSinTable_q(31 downto 18);
    u15_sinAdd_b <= STD_LOGIC_VECTOR("00000000" & u15_cosMult_q(23 downto 18));
    u15_sinAdd_i <= u0_sin_pi_over_4_q;
    u15_sinAdd_a1 <= u15_sinAdd_i WHEN (u15_alphaOverflowBitSelect_b = "1") ELSE u15_sinAdd_a;
    u15_sinAdd_b1 <= (others => '0') WHEN (u15_alphaOverflowBitSelect_b = "1") ELSE u15_sinAdd_b;
    u15_sinAdd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_sinAdd_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u15_sinAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(u15_sinAdd_a1) + UNSIGNED(u15_sinAdd_b1));
        END IF;
    END PROCESS;
    u15_sinAdd_q <= u15_sinAdd_o(13 downto 0);


	--u15_roundedSin(ROUND,679)@19
    u15_roundedSin_in <= u15_sinAdd_q;
    u15_roundedSin: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_roundedSin_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u15_roundedSin_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u15_roundedSin_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u15_roundedSin_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u15_sinMult(MULT,671)@15
    u15_sinMult_pr <= UNSIGNED(u15_sinMult_a) * UNSIGNED(u15_sinMult_b);
    u15_sinMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_sinMult_a <= (others => '0');
            u15_sinMult_b <= (others => '0');
            u15_sinMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u15_sinMult_a <= u15_sinTable_q;
            u15_sinMult_b <= u15_beta_times_pi_over_4_shifted_b;
            u15_sinMult_s1 <= STD_LOGIC_VECTOR(u15_sinMult_pr);
        END IF;
    END PROCESS;
    u15_sinMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_sinMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u15_sinMult_q <= u15_sinMult_s1;
        END IF;
    END PROCESS;

	--d_u15_cosTable_q_18_replace_mem(DUALMEM,1498)
    d_u15_cosTable_q_18_replace_mem_reset0 <= areset;
    d_u15_cosTable_q_18_replace_mem_ia <= u15_cosTable_q;
    d_u15_cosTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u15_cosTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u15_cosTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u15_cosTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u15_cosTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u15_cosTable_q_18_replace_mem_iq,
        address_a => d_u15_cosTable_q_18_replace_mem_aa,
        data_a => d_u15_cosTable_q_18_replace_mem_ia
    );
        d_u15_cosTable_q_18_replace_mem_q <= d_u15_cosTable_q_18_replace_mem_iq(11 downto 0);

	--u15_lsCosTable(BITSHIFT,674)@18
    u15_lsCosTable_q_int <= d_u15_cosTable_q_18_replace_mem_q & "00000000000000000000";
    u15_lsCosTable_q <= u15_lsCosTable_q_int(31 downto 0);

	--u15_cosSub(SUB,678)@18
    u15_cosSub_a <= u15_lsCosTable_q(31 downto 18);
    u15_cosSub_b <= STD_LOGIC_VECTOR("00000000" & u15_sinMult_q(23 downto 18));
    u15_cosSub_i <= u0_sin_pi_over_4_q;
    u15_cosSub_a1 <= u15_cosSub_i WHEN (u15_alphaOverflowBitSelect_b = "1") ELSE u15_cosSub_a;
    u15_cosSub_b1 <= (others => '0') WHEN (u15_alphaOverflowBitSelect_b = "1") ELSE u15_cosSub_b;
    u15_cosSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_cosSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u15_cosSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u15_cosSub_a1) - UNSIGNED(u15_cosSub_b1));
        END IF;
    END PROCESS;
    u15_cosSub_q <= u15_cosSub_o(13 downto 0);


	--u15_roundedCos(ROUND,680)@19
    u15_roundedCos_in <= u15_cosSub_q;
    u15_roundedCos: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_roundedCos_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u15_roundedCos_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u15_roundedCos_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u15_roundedCos_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u15_doSwap(LOOKUP,681)@19
    u15_doSwap: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_doSwap_q <= "0";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (d_u15_octantBitSelect_b_19_replace_mem_q) IS
                WHEN "000" =>  u15_doSwap_q <= "0";
                WHEN "001" =>  u15_doSwap_q <= "1";
                WHEN "010" =>  u15_doSwap_q <= "1";
                WHEN "011" =>  u15_doSwap_q <= "0";
                WHEN "100" =>  u15_doSwap_q <= "0";
                WHEN "101" =>  u15_doSwap_q <= "1";
                WHEN "110" =>  u15_doSwap_q <= "1";
                WHEN "111" =>  u15_doSwap_q <= "0";
                WHEN OTHERS =>
                    u15_doSwap_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u15_cosSwapMux(MUX,689)@20
    u15_cosSwapMux_s <= u15_doSwap_q;
    u15_cosSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_cosSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u15_cosSwapMux_s IS
                      WHEN "0" => u15_cosSwapMux_q <= u15_roundedCos_q;
                      WHEN "1" => u15_cosSwapMux_q <= u15_roundedSin_q;
                      WHEN OTHERS => u15_cosSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--GND(CONSTANT,0)@0
    GND_q <= "0";

	--u15_cosInvert(SUB,691)@21
    u15_cosInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u15_cosInvert_b <= u15_cosSwapMux_q;
    u15_cosInvert_i <= u15_cosInvert_b;
    u15_cosInvert_a1 <= u15_cosInvert_i WHEN (u15_doCosInvert_q = "1") ELSE u15_cosInvert_a;
    u15_cosInvert_b1 <= (others => '0') WHEN (u15_doCosInvert_q = "1") ELSE u15_cosInvert_b;
    u15_cosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_cosInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u15_cosInvert_o <= STD_LOGIC_VECTOR(SIGNED(u15_cosInvert_a1) - SIGNED(u15_cosInvert_b1));
        END IF;
    END PROCESS;
    u15_cosInvert_q <= u15_cosInvert_o(11 downto 0);


	--u14_phaseIncrRegLookup_0(LOOKUP,32)@10
    u14_phaseIncrRegLookup_0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u14_phaseIncrRegLookup_0_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_a) IS
                WHEN "010010111110" =>                     u14_phaseIncrRegLookup_0_e <= busIn_w;
                WHEN OTHERS =>
                    u14_phaseIncrRegLookup_0_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u14_phaseIncrReg_p0(REG,33)@11
    u14_phaseIncrReg_p0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u14_phaseIncrReg_p0_q <= "01000110000000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (u14_phaseIncrRegLookup_0_e = "1") THEN
                u14_phaseIncrReg_p0_q <= d_busIn_d_11_q(19 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u14_invertCos(BITSELECT,644)@20
    u14_invertCos_in <= u14_phaseIncrReg_p0_q(18 downto 0);
    u14_invertCos_b <= u14_invertCos_in(18 downto 18);

	--u14_accumAdd_b1(ADD,610)@10
    u14_accumAdd_b1_a <= u14_accumAdd_b1_q;
    u14_accumAdd_b1_b <= u14_phaseIncrReg_p0_q(17 downto 0);
    u14_accumAdd_b1_i <= xIn_p_14;
    u14_accumAdd_b1_a1 <= u14_accumAdd_b1_i WHEN (xIn_s_14 = "1") ELSE u14_accumAdd_b1_a;
    u14_accumAdd_b1_b1 <= (others => '0') WHEN (xIn_s_14 = "1") ELSE u14_accumAdd_b1_b;
    u14_accumAdd_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_accumAdd_b1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u14_accumAdd_b1_o <= STD_LOGIC_VECTOR(UNSIGNED(u14_accumAdd_b1_a1) + UNSIGNED(u14_accumAdd_b1_b1));
            END IF;
        END IF;
    END PROCESS;
    u14_accumAdd_b1_q <= u14_accumAdd_b1_o(17 downto 0);


	--u14_octantBitSelect(BITSELECT,612)@11
    u14_octantBitSelect_in <= u14_accumAdd_b1_q;
    u14_octantBitSelect_b <= u14_octantBitSelect_in(17 downto 15);

	--d_u14_octantBitSelect_b_19_replace_mem(DUALMEM,1420)
    d_u14_octantBitSelect_b_19_replace_mem_reset0 <= areset;
    d_u14_octantBitSelect_b_19_replace_mem_ia <= u14_octantBitSelect_b;
    d_u14_octantBitSelect_b_19_replace_mem_aa <= d_u0_octantBitSelect_b_19_replace_rdreg_q;
    d_u14_octantBitSelect_b_19_replace_mem_ab <= d_u0_octantBitSelect_b_19_replace_rdmux_q;
    d_u14_octantBitSelect_b_19_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 3,
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
        clocken1 => d_u0_octantBitSelect_b_19_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u14_octantBitSelect_b_19_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u14_octantBitSelect_b_19_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u14_octantBitSelect_b_19_replace_mem_iq,
        address_a => d_u14_octantBitSelect_b_19_replace_mem_aa,
        data_a => d_u14_octantBitSelect_b_19_replace_mem_ia
    );
        d_u14_octantBitSelect_b_19_replace_mem_q <= d_u14_octantBitSelect_b_19_replace_mem_iq(2 downto 0);

	--d_u14_octantBitSelect_b_20(DELAY,782)@19
    d_u14_octantBitSelect_b_20 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => d_u14_octantBitSelect_b_19_replace_mem_q, xout => d_u14_octantBitSelect_b_20_q, clk => clk, aclr => areset );

	--u14_cosJoin(BITJOIN,645)@20
    u14_cosJoin_q <= u14_invertCos_b & d_u14_octantBitSelect_b_20_q;

	--u14_doCosInvert(LOOKUP,646)@20
    u14_doCosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_doCosInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u14_cosJoin_q) IS
                WHEN "0000" =>  u14_doCosInvert_q <= "1";
                WHEN "0001" =>  u14_doCosInvert_q <= "1";
                WHEN "0010" =>  u14_doCosInvert_q <= "0";
                WHEN "0011" =>  u14_doCosInvert_q <= "0";
                WHEN "0100" =>  u14_doCosInvert_q <= "0";
                WHEN "0101" =>  u14_doCosInvert_q <= "0";
                WHEN "0110" =>  u14_doCosInvert_q <= "1";
                WHEN "0111" =>  u14_doCosInvert_q <= "1";
                WHEN "1000" =>  u14_doCosInvert_q <= "0";
                WHEN "1001" =>  u14_doCosInvert_q <= "0";
                WHEN "1010" =>  u14_doCosInvert_q <= "1";
                WHEN "1011" =>  u14_doCosInvert_q <= "1";
                WHEN "1100" =>  u14_doCosInvert_q <= "1";
                WHEN "1101" =>  u14_doCosInvert_q <= "1";
                WHEN "1110" =>  u14_doCosInvert_q <= "0";
                WHEN "1111" =>  u14_doCosInvert_q <= "0";
                WHEN OTHERS =>
                    u14_doCosInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u14_addnsubConst(LOOKUP,614)@11
    u14_addnsubConst: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_addnsubConst_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u14_octantBitSelect_b) IS
                WHEN "000" =>  u14_addnsubConst_q <= "1";
                WHEN "001" =>  u14_addnsubConst_q <= "0";
                WHEN "010" =>  u14_addnsubConst_q <= "1";
                WHEN "011" =>  u14_addnsubConst_q <= "0";
                WHEN "100" =>  u14_addnsubConst_q <= "1";
                WHEN "101" =>  u14_addnsubConst_q <= "0";
                WHEN "110" =>  u14_addnsubConst_q <= "1";
                WHEN "111" =>  u14_addnsubConst_q <= "0";
                WHEN OTHERS =>
                    u14_addnsubConst_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--d_u14_accumAdd_b1_q_12(DELAY,780)@11
    d_u14_accumAdd_b1_q_12 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => u14_accumAdd_b1_q, xout => d_u14_accumAdd_b1_q_12_q, clk => clk, aclr => areset );

	--u14_rangeLUT(LOOKUP,613)@11
    u14_rangeLUT: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_rangeLUT_q <= "0000000000000000000";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u14_octantBitSelect_b) IS
                WHEN "000" =>  u14_rangeLUT_q <= "0000000000000000000";
                WHEN "001" =>  u14_rangeLUT_q <= "0010000000000000000";
                WHEN "010" =>  u14_rangeLUT_q <= "1110000000000000000";
                WHEN "011" =>  u14_rangeLUT_q <= "0100000000000000000";
                WHEN "100" =>  u14_rangeLUT_q <= "1100000000000000000";
                WHEN "101" =>  u14_rangeLUT_q <= "0110000000000000000";
                WHEN "110" =>  u14_rangeLUT_q <= "1010000000000000000";
                WHEN "111" =>  u14_rangeLUT_q <= "1100000000000000000";
                WHEN OTHERS =>
                    u14_rangeLUT_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u14_rangeAddSub(ADDSUB,615)@12
    u14_rangeAddSub_cin <= GND_q;
    u14_rangeAddSub_a <= STD_LOGIC_VECTOR("0" & u14_rangeLUT_q) & u14_addnsubConst_q(0);
    u14_rangeAddSub_b <= STD_LOGIC_VECTOR("00" & d_u14_accumAdd_b1_q_12_q) & u14_rangeAddSub_cin(0);
    u14_rangeAddSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_rangeAddSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u14_addnsubConst_q = "1") THEN
                u14_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u14_rangeAddSub_a) + UNSIGNED(u14_rangeAddSub_b));
            ELSE
                u14_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u14_rangeAddSub_a) - UNSIGNED(u14_rangeAddSub_b));
            END IF;
        END IF;
    END PROCESS;
    u14_rangeAddSub_q <= u14_rangeAddSub_o(19 downto 1);


	--d_u14_rangeAddSub_q_18_replace_mem(DUALMEM,1432)
    d_u14_rangeAddSub_q_18_replace_mem_reset0 <= areset;
    d_u14_rangeAddSub_q_18_replace_mem_ia <= u14_rangeAddSub_q;
    d_u14_rangeAddSub_q_18_replace_mem_aa <= d_u0_rangeAddSub_q_18_replace_rdreg_q;
    d_u14_rangeAddSub_q_18_replace_mem_ab <= d_u0_rangeAddSub_q_18_replace_rdmux_q;
    d_u14_rangeAddSub_q_18_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 19,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 19,
        widthad_b => 2,
        numwords_b => 4,
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
        clocken1 => d_u0_rangeAddSub_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u14_rangeAddSub_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u14_rangeAddSub_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u14_rangeAddSub_q_18_replace_mem_iq,
        address_a => d_u14_rangeAddSub_q_18_replace_mem_aa,
        data_a => d_u14_rangeAddSub_q_18_replace_mem_ia
    );
        d_u14_rangeAddSub_q_18_replace_mem_q <= d_u14_rangeAddSub_q_18_replace_mem_iq(18 downto 0);

	--u14_alphaOverflowBitSelect(BITSELECT,617)@18
    u14_alphaOverflowBitSelect_in <= d_u14_rangeAddSub_q_18_replace_mem_q(15 downto 0);
    u14_alphaOverflowBitSelect_b <= u14_alphaOverflowBitSelect_in(15 downto 15);

	--u14_betaBitSelect(BITSELECT,618)@13
    u14_betaBitSelect_in <= u14_rangeAddSub_q(6 downto 0);
    u14_betaBitSelect_b <= u14_betaBitSelect_in(6 downto 0);

	--u14_ls4(BITSHIFT,625)@13
    u14_ls4_q_int <= u14_betaBitSelect_b & "0000";
    u14_ls4_q <= u14_ls4_q_int(10 downto 0);

	--u14_ls7(BITSHIFT,624)@13
    u14_ls7_q_int <= u14_betaBitSelect_b & "0000000";
    u14_ls7_q <= u14_ls7_q_int(13 downto 0);

	--u14_cm2(ADD,626)@13
    u14_cm2_a <= STD_LOGIC_VECTOR("0" & u14_ls7_q);
    u14_cm2_b <= STD_LOGIC_VECTOR("0000" & u14_ls4_q);
    u14_cm2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_cm2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u14_cm2_o <= STD_LOGIC_VECTOR(UNSIGNED(u14_cm2_a) + UNSIGNED(u14_cm2_b));
        END IF;
    END PROCESS;
    u14_cm2_q <= u14_cm2_o(14 downto 0);


	--u14_ls10(BITSHIFT,622)@13
    u14_ls10_q_int <= u14_betaBitSelect_b & "0000000000";
    u14_ls10_q <= u14_ls10_q_int(16 downto 0);

	--u14_ls12(BITSHIFT,621)@13
    u14_ls12_q_int <= u14_betaBitSelect_b & "000000000000";
    u14_ls12_q <= u14_ls12_q_int(18 downto 0);

	--u14_cm1(SUB,623)@13
    u14_cm1_a <= STD_LOGIC_VECTOR("0" & u14_ls12_q);
    u14_cm1_b <= STD_LOGIC_VECTOR("000" & u14_ls10_q);
    u14_cm1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_cm1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u14_cm1_o <= STD_LOGIC_VECTOR(UNSIGNED(u14_cm1_a) - UNSIGNED(u14_cm1_b));
        END IF;
    END PROCESS;
    u14_cm1_q <= u14_cm1_o(19 downto 0);


	--u14_cm3(ADD,627)@14
    u14_cm3_a <= STD_LOGIC_VECTOR("0" & u14_cm1_q);
    u14_cm3_b <= STD_LOGIC_VECTOR("000000" & u14_cm2_q);
    u14_cm3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_cm3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u14_cm3_o <= STD_LOGIC_VECTOR(UNSIGNED(u14_cm3_a) + UNSIGNED(u14_cm3_b));
        END IF;
    END PROCESS;
    u14_cm3_q <= u14_cm3_o(20 downto 0);


	--u14_beta_times_4_shift(BITSHIFT,628)@15
    u14_beta_times_4_shift_q_int <= u14_cm3_q(20 downto 1);
    u14_beta_times_4_shift_q <= u14_beta_times_4_shift_q_int(19 downto 0);

	--u14_beta_times_pi_over_4_shifted(BITSELECT,629)@15
    u14_beta_times_pi_over_4_shifted_in <= u14_beta_times_4_shift_q(17 downto 0);
    u14_beta_times_pi_over_4_shifted_b <= u14_beta_times_pi_over_4_shifted_in(17 downto 6);

	--u14_alphaBitSelect(BITSELECT,616)@13
    u14_alphaBitSelect_in <= u14_rangeAddSub_q(14 downto 0);
    u14_alphaBitSelect_b <= u14_alphaBitSelect_in(14 downto 7);

	--u14_cosTable(DUALMEM,620)@13
    u14_cosTable_reset0 <= areset;
    u14_cosTable_ia <= (others => '0');
    u14_cosTable_aa <= (others => '0');
    u14_cosTable_ab <= u14_alphaBitSelect_b;
    u14_cosTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u14_cosTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u14_cosTable_reset0,
        clock0 => clk,
        address_b => u14_cosTable_ab,
        -- data_b => (others => '0'),
        q_b => u14_cosTable_iq,
        address_a => u14_cosTable_aa,
        data_a => u14_cosTable_ia
    );
        u14_cosTable_q <= u14_cosTable_iq(11 downto 0);

	--u14_cosMult(MULT,631)@15
    u14_cosMult_pr <= UNSIGNED(u14_cosMult_a) * UNSIGNED(u14_cosMult_b);
    u14_cosMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_cosMult_a <= (others => '0');
            u14_cosMult_b <= (others => '0');
            u14_cosMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u14_cosMult_a <= u14_cosTable_q;
            u14_cosMult_b <= u14_beta_times_pi_over_4_shifted_b;
            u14_cosMult_s1 <= STD_LOGIC_VECTOR(u14_cosMult_pr);
        END IF;
    END PROCESS;
    u14_cosMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_cosMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u14_cosMult_q <= u14_cosMult_s1;
        END IF;
    END PROCESS;

	--u14_sinTable(DUALMEM,619)@13
    u14_sinTable_reset0 <= areset;
    u14_sinTable_ia <= (others => '0');
    u14_sinTable_aa <= (others => '0');
    u14_sinTable_ab <= u14_alphaBitSelect_b;
    u14_sinTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u14_sinTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u14_sinTable_reset0,
        clock0 => clk,
        address_b => u14_sinTable_ab,
        -- data_b => (others => '0'),
        q_b => u14_sinTable_iq,
        address_a => u14_sinTable_aa,
        data_a => u14_sinTable_ia
    );
        u14_sinTable_q <= u14_sinTable_iq(11 downto 0);

	--d_u14_sinTable_q_18_replace_mem(DUALMEM,1444)
    d_u14_sinTable_q_18_replace_mem_reset0 <= areset;
    d_u14_sinTable_q_18_replace_mem_ia <= u14_sinTable_q;
    d_u14_sinTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u14_sinTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u14_sinTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u14_sinTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u14_sinTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u14_sinTable_q_18_replace_mem_iq,
        address_a => d_u14_sinTable_q_18_replace_mem_aa,
        data_a => d_u14_sinTable_q_18_replace_mem_ia
    );
        d_u14_sinTable_q_18_replace_mem_q <= d_u14_sinTable_q_18_replace_mem_iq(11 downto 0);

	--u14_lsSinTable(BITSHIFT,632)@18
    u14_lsSinTable_q_int <= d_u14_sinTable_q_18_replace_mem_q & "00000000000000000000";
    u14_lsSinTable_q <= u14_lsSinTable_q_int(31 downto 0);

	--u14_sinAdd(ADD,636)@18
    u14_sinAdd_a <= u14_lsSinTable_q(31 downto 18);
    u14_sinAdd_b <= STD_LOGIC_VECTOR("00000000" & u14_cosMult_q(23 downto 18));
    u14_sinAdd_i <= u0_sin_pi_over_4_q;
    u14_sinAdd_a1 <= u14_sinAdd_i WHEN (u14_alphaOverflowBitSelect_b = "1") ELSE u14_sinAdd_a;
    u14_sinAdd_b1 <= (others => '0') WHEN (u14_alphaOverflowBitSelect_b = "1") ELSE u14_sinAdd_b;
    u14_sinAdd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_sinAdd_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u14_sinAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(u14_sinAdd_a1) + UNSIGNED(u14_sinAdd_b1));
        END IF;
    END PROCESS;
    u14_sinAdd_q <= u14_sinAdd_o(13 downto 0);


	--u14_roundedSin(ROUND,638)@19
    u14_roundedSin_in <= u14_sinAdd_q;
    u14_roundedSin: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_roundedSin_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u14_roundedSin_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u14_roundedSin_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u14_roundedSin_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u14_sinMult(MULT,630)@15
    u14_sinMult_pr <= UNSIGNED(u14_sinMult_a) * UNSIGNED(u14_sinMult_b);
    u14_sinMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_sinMult_a <= (others => '0');
            u14_sinMult_b <= (others => '0');
            u14_sinMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u14_sinMult_a <= u14_sinTable_q;
            u14_sinMult_b <= u14_beta_times_pi_over_4_shifted_b;
            u14_sinMult_s1 <= STD_LOGIC_VECTOR(u14_sinMult_pr);
        END IF;
    END PROCESS;
    u14_sinMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_sinMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u14_sinMult_q <= u14_sinMult_s1;
        END IF;
    END PROCESS;

	--d_u14_cosTable_q_18_replace_mem(DUALMEM,1454)
    d_u14_cosTable_q_18_replace_mem_reset0 <= areset;
    d_u14_cosTable_q_18_replace_mem_ia <= u14_cosTable_q;
    d_u14_cosTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u14_cosTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u14_cosTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u14_cosTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u14_cosTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u14_cosTable_q_18_replace_mem_iq,
        address_a => d_u14_cosTable_q_18_replace_mem_aa,
        data_a => d_u14_cosTable_q_18_replace_mem_ia
    );
        d_u14_cosTable_q_18_replace_mem_q <= d_u14_cosTable_q_18_replace_mem_iq(11 downto 0);

	--u14_lsCosTable(BITSHIFT,633)@18
    u14_lsCosTable_q_int <= d_u14_cosTable_q_18_replace_mem_q & "00000000000000000000";
    u14_lsCosTable_q <= u14_lsCosTable_q_int(31 downto 0);

	--u14_cosSub(SUB,637)@18
    u14_cosSub_a <= u14_lsCosTable_q(31 downto 18);
    u14_cosSub_b <= STD_LOGIC_VECTOR("00000000" & u14_sinMult_q(23 downto 18));
    u14_cosSub_i <= u0_sin_pi_over_4_q;
    u14_cosSub_a1 <= u14_cosSub_i WHEN (u14_alphaOverflowBitSelect_b = "1") ELSE u14_cosSub_a;
    u14_cosSub_b1 <= (others => '0') WHEN (u14_alphaOverflowBitSelect_b = "1") ELSE u14_cosSub_b;
    u14_cosSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_cosSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u14_cosSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u14_cosSub_a1) - UNSIGNED(u14_cosSub_b1));
        END IF;
    END PROCESS;
    u14_cosSub_q <= u14_cosSub_o(13 downto 0);


	--u14_roundedCos(ROUND,639)@19
    u14_roundedCos_in <= u14_cosSub_q;
    u14_roundedCos: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_roundedCos_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u14_roundedCos_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u14_roundedCos_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u14_roundedCos_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u14_doSwap(LOOKUP,640)@19
    u14_doSwap: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_doSwap_q <= "0";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (d_u14_octantBitSelect_b_19_replace_mem_q) IS
                WHEN "000" =>  u14_doSwap_q <= "0";
                WHEN "001" =>  u14_doSwap_q <= "1";
                WHEN "010" =>  u14_doSwap_q <= "1";
                WHEN "011" =>  u14_doSwap_q <= "0";
                WHEN "100" =>  u14_doSwap_q <= "0";
                WHEN "101" =>  u14_doSwap_q <= "1";
                WHEN "110" =>  u14_doSwap_q <= "1";
                WHEN "111" =>  u14_doSwap_q <= "0";
                WHEN OTHERS =>
                    u14_doSwap_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u14_cosSwapMux(MUX,648)@20
    u14_cosSwapMux_s <= u14_doSwap_q;
    u14_cosSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_cosSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u14_cosSwapMux_s IS
                      WHEN "0" => u14_cosSwapMux_q <= u14_roundedCos_q;
                      WHEN "1" => u14_cosSwapMux_q <= u14_roundedSin_q;
                      WHEN OTHERS => u14_cosSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u14_cosInvert(SUB,650)@21
    u14_cosInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u14_cosInvert_b <= u14_cosSwapMux_q;
    u14_cosInvert_i <= u14_cosInvert_b;
    u14_cosInvert_a1 <= u14_cosInvert_i WHEN (u14_doCosInvert_q = "1") ELSE u14_cosInvert_a;
    u14_cosInvert_b1 <= (others => '0') WHEN (u14_doCosInvert_q = "1") ELSE u14_cosInvert_b;
    u14_cosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_cosInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u14_cosInvert_o <= STD_LOGIC_VECTOR(SIGNED(u14_cosInvert_a1) - SIGNED(u14_cosInvert_b1));
        END IF;
    END PROCESS;
    u14_cosInvert_q <= u14_cosInvert_o(11 downto 0);


	--u13_phaseIncrRegLookup_0(LOOKUP,30)@10
    u13_phaseIncrRegLookup_0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u13_phaseIncrRegLookup_0_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_a) IS
                WHEN "010010111101" =>                     u13_phaseIncrRegLookup_0_e <= busIn_w;
                WHEN OTHERS =>
                    u13_phaseIncrRegLookup_0_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u13_phaseIncrReg_p0(REG,31)@11
    u13_phaseIncrReg_p0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u13_phaseIncrReg_p0_q <= "01000110000000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (u13_phaseIncrRegLookup_0_e = "1") THEN
                u13_phaseIncrReg_p0_q <= d_busIn_d_11_q(19 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u13_invertCos(BITSELECT,603)@20
    u13_invertCos_in <= u13_phaseIncrReg_p0_q(18 downto 0);
    u13_invertCos_b <= u13_invertCos_in(18 downto 18);

	--u13_accumAdd_b1(ADD,569)@10
    u13_accumAdd_b1_a <= u13_accumAdd_b1_q;
    u13_accumAdd_b1_b <= u13_phaseIncrReg_p0_q(17 downto 0);
    u13_accumAdd_b1_i <= xIn_p_13;
    u13_accumAdd_b1_a1 <= u13_accumAdd_b1_i WHEN (xIn_s_13 = "1") ELSE u13_accumAdd_b1_a;
    u13_accumAdd_b1_b1 <= (others => '0') WHEN (xIn_s_13 = "1") ELSE u13_accumAdd_b1_b;
    u13_accumAdd_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_accumAdd_b1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u13_accumAdd_b1_o <= STD_LOGIC_VECTOR(UNSIGNED(u13_accumAdd_b1_a1) + UNSIGNED(u13_accumAdd_b1_b1));
            END IF;
        END IF;
    END PROCESS;
    u13_accumAdd_b1_q <= u13_accumAdd_b1_o(17 downto 0);


	--u13_octantBitSelect(BITSELECT,571)@11
    u13_octantBitSelect_in <= u13_accumAdd_b1_q;
    u13_octantBitSelect_b <= u13_octantBitSelect_in(17 downto 15);

	--d_u13_octantBitSelect_b_19_replace_mem(DUALMEM,1376)
    d_u13_octantBitSelect_b_19_replace_mem_reset0 <= areset;
    d_u13_octantBitSelect_b_19_replace_mem_ia <= u13_octantBitSelect_b;
    d_u13_octantBitSelect_b_19_replace_mem_aa <= d_u0_octantBitSelect_b_19_replace_rdreg_q;
    d_u13_octantBitSelect_b_19_replace_mem_ab <= d_u0_octantBitSelect_b_19_replace_rdmux_q;
    d_u13_octantBitSelect_b_19_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 3,
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
        clocken1 => d_u0_octantBitSelect_b_19_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u13_octantBitSelect_b_19_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u13_octantBitSelect_b_19_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u13_octantBitSelect_b_19_replace_mem_iq,
        address_a => d_u13_octantBitSelect_b_19_replace_mem_aa,
        data_a => d_u13_octantBitSelect_b_19_replace_mem_ia
    );
        d_u13_octantBitSelect_b_19_replace_mem_q <= d_u13_octantBitSelect_b_19_replace_mem_iq(2 downto 0);

	--d_u13_octantBitSelect_b_20(DELAY,776)@19
    d_u13_octantBitSelect_b_20 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => d_u13_octantBitSelect_b_19_replace_mem_q, xout => d_u13_octantBitSelect_b_20_q, clk => clk, aclr => areset );

	--u13_cosJoin(BITJOIN,604)@20
    u13_cosJoin_q <= u13_invertCos_b & d_u13_octantBitSelect_b_20_q;

	--u13_doCosInvert(LOOKUP,605)@20
    u13_doCosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_doCosInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u13_cosJoin_q) IS
                WHEN "0000" =>  u13_doCosInvert_q <= "1";
                WHEN "0001" =>  u13_doCosInvert_q <= "1";
                WHEN "0010" =>  u13_doCosInvert_q <= "0";
                WHEN "0011" =>  u13_doCosInvert_q <= "0";
                WHEN "0100" =>  u13_doCosInvert_q <= "0";
                WHEN "0101" =>  u13_doCosInvert_q <= "0";
                WHEN "0110" =>  u13_doCosInvert_q <= "1";
                WHEN "0111" =>  u13_doCosInvert_q <= "1";
                WHEN "1000" =>  u13_doCosInvert_q <= "0";
                WHEN "1001" =>  u13_doCosInvert_q <= "0";
                WHEN "1010" =>  u13_doCosInvert_q <= "1";
                WHEN "1011" =>  u13_doCosInvert_q <= "1";
                WHEN "1100" =>  u13_doCosInvert_q <= "1";
                WHEN "1101" =>  u13_doCosInvert_q <= "1";
                WHEN "1110" =>  u13_doCosInvert_q <= "0";
                WHEN "1111" =>  u13_doCosInvert_q <= "0";
                WHEN OTHERS =>
                    u13_doCosInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u13_addnsubConst(LOOKUP,573)@11
    u13_addnsubConst: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_addnsubConst_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u13_octantBitSelect_b) IS
                WHEN "000" =>  u13_addnsubConst_q <= "1";
                WHEN "001" =>  u13_addnsubConst_q <= "0";
                WHEN "010" =>  u13_addnsubConst_q <= "1";
                WHEN "011" =>  u13_addnsubConst_q <= "0";
                WHEN "100" =>  u13_addnsubConst_q <= "1";
                WHEN "101" =>  u13_addnsubConst_q <= "0";
                WHEN "110" =>  u13_addnsubConst_q <= "1";
                WHEN "111" =>  u13_addnsubConst_q <= "0";
                WHEN OTHERS =>
                    u13_addnsubConst_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--d_u13_accumAdd_b1_q_12(DELAY,774)@11
    d_u13_accumAdd_b1_q_12 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => u13_accumAdd_b1_q, xout => d_u13_accumAdd_b1_q_12_q, clk => clk, aclr => areset );

	--u13_rangeLUT(LOOKUP,572)@11
    u13_rangeLUT: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_rangeLUT_q <= "0000000000000000000";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u13_octantBitSelect_b) IS
                WHEN "000" =>  u13_rangeLUT_q <= "0000000000000000000";
                WHEN "001" =>  u13_rangeLUT_q <= "0010000000000000000";
                WHEN "010" =>  u13_rangeLUT_q <= "1110000000000000000";
                WHEN "011" =>  u13_rangeLUT_q <= "0100000000000000000";
                WHEN "100" =>  u13_rangeLUT_q <= "1100000000000000000";
                WHEN "101" =>  u13_rangeLUT_q <= "0110000000000000000";
                WHEN "110" =>  u13_rangeLUT_q <= "1010000000000000000";
                WHEN "111" =>  u13_rangeLUT_q <= "1100000000000000000";
                WHEN OTHERS =>
                    u13_rangeLUT_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u13_rangeAddSub(ADDSUB,574)@12
    u13_rangeAddSub_cin <= GND_q;
    u13_rangeAddSub_a <= STD_LOGIC_VECTOR("0" & u13_rangeLUT_q) & u13_addnsubConst_q(0);
    u13_rangeAddSub_b <= STD_LOGIC_VECTOR("00" & d_u13_accumAdd_b1_q_12_q) & u13_rangeAddSub_cin(0);
    u13_rangeAddSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_rangeAddSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u13_addnsubConst_q = "1") THEN
                u13_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u13_rangeAddSub_a) + UNSIGNED(u13_rangeAddSub_b));
            ELSE
                u13_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u13_rangeAddSub_a) - UNSIGNED(u13_rangeAddSub_b));
            END IF;
        END IF;
    END PROCESS;
    u13_rangeAddSub_q <= u13_rangeAddSub_o(19 downto 1);


	--d_u13_rangeAddSub_q_18_replace_mem(DUALMEM,1388)
    d_u13_rangeAddSub_q_18_replace_mem_reset0 <= areset;
    d_u13_rangeAddSub_q_18_replace_mem_ia <= u13_rangeAddSub_q;
    d_u13_rangeAddSub_q_18_replace_mem_aa <= d_u0_rangeAddSub_q_18_replace_rdreg_q;
    d_u13_rangeAddSub_q_18_replace_mem_ab <= d_u0_rangeAddSub_q_18_replace_rdmux_q;
    d_u13_rangeAddSub_q_18_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 19,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 19,
        widthad_b => 2,
        numwords_b => 4,
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
        clocken1 => d_u0_rangeAddSub_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u13_rangeAddSub_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u13_rangeAddSub_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u13_rangeAddSub_q_18_replace_mem_iq,
        address_a => d_u13_rangeAddSub_q_18_replace_mem_aa,
        data_a => d_u13_rangeAddSub_q_18_replace_mem_ia
    );
        d_u13_rangeAddSub_q_18_replace_mem_q <= d_u13_rangeAddSub_q_18_replace_mem_iq(18 downto 0);

	--u13_alphaOverflowBitSelect(BITSELECT,576)@18
    u13_alphaOverflowBitSelect_in <= d_u13_rangeAddSub_q_18_replace_mem_q(15 downto 0);
    u13_alphaOverflowBitSelect_b <= u13_alphaOverflowBitSelect_in(15 downto 15);

	--u13_betaBitSelect(BITSELECT,577)@13
    u13_betaBitSelect_in <= u13_rangeAddSub_q(6 downto 0);
    u13_betaBitSelect_b <= u13_betaBitSelect_in(6 downto 0);

	--u13_ls4(BITSHIFT,584)@13
    u13_ls4_q_int <= u13_betaBitSelect_b & "0000";
    u13_ls4_q <= u13_ls4_q_int(10 downto 0);

	--u13_ls7(BITSHIFT,583)@13
    u13_ls7_q_int <= u13_betaBitSelect_b & "0000000";
    u13_ls7_q <= u13_ls7_q_int(13 downto 0);

	--u13_cm2(ADD,585)@13
    u13_cm2_a <= STD_LOGIC_VECTOR("0" & u13_ls7_q);
    u13_cm2_b <= STD_LOGIC_VECTOR("0000" & u13_ls4_q);
    u13_cm2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_cm2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u13_cm2_o <= STD_LOGIC_VECTOR(UNSIGNED(u13_cm2_a) + UNSIGNED(u13_cm2_b));
        END IF;
    END PROCESS;
    u13_cm2_q <= u13_cm2_o(14 downto 0);


	--u13_ls10(BITSHIFT,581)@13
    u13_ls10_q_int <= u13_betaBitSelect_b & "0000000000";
    u13_ls10_q <= u13_ls10_q_int(16 downto 0);

	--u13_ls12(BITSHIFT,580)@13
    u13_ls12_q_int <= u13_betaBitSelect_b & "000000000000";
    u13_ls12_q <= u13_ls12_q_int(18 downto 0);

	--u13_cm1(SUB,582)@13
    u13_cm1_a <= STD_LOGIC_VECTOR("0" & u13_ls12_q);
    u13_cm1_b <= STD_LOGIC_VECTOR("000" & u13_ls10_q);
    u13_cm1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_cm1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u13_cm1_o <= STD_LOGIC_VECTOR(UNSIGNED(u13_cm1_a) - UNSIGNED(u13_cm1_b));
        END IF;
    END PROCESS;
    u13_cm1_q <= u13_cm1_o(19 downto 0);


	--u13_cm3(ADD,586)@14
    u13_cm3_a <= STD_LOGIC_VECTOR("0" & u13_cm1_q);
    u13_cm3_b <= STD_LOGIC_VECTOR("000000" & u13_cm2_q);
    u13_cm3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_cm3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u13_cm3_o <= STD_LOGIC_VECTOR(UNSIGNED(u13_cm3_a) + UNSIGNED(u13_cm3_b));
        END IF;
    END PROCESS;
    u13_cm3_q <= u13_cm3_o(20 downto 0);


	--u13_beta_times_4_shift(BITSHIFT,587)@15
    u13_beta_times_4_shift_q_int <= u13_cm3_q(20 downto 1);
    u13_beta_times_4_shift_q <= u13_beta_times_4_shift_q_int(19 downto 0);

	--u13_beta_times_pi_over_4_shifted(BITSELECT,588)@15
    u13_beta_times_pi_over_4_shifted_in <= u13_beta_times_4_shift_q(17 downto 0);
    u13_beta_times_pi_over_4_shifted_b <= u13_beta_times_pi_over_4_shifted_in(17 downto 6);

	--u13_alphaBitSelect(BITSELECT,575)@13
    u13_alphaBitSelect_in <= u13_rangeAddSub_q(14 downto 0);
    u13_alphaBitSelect_b <= u13_alphaBitSelect_in(14 downto 7);

	--u13_cosTable(DUALMEM,579)@13
    u13_cosTable_reset0 <= areset;
    u13_cosTable_ia <= (others => '0');
    u13_cosTable_aa <= (others => '0');
    u13_cosTable_ab <= u13_alphaBitSelect_b;
    u13_cosTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u13_cosTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u13_cosTable_reset0,
        clock0 => clk,
        address_b => u13_cosTable_ab,
        -- data_b => (others => '0'),
        q_b => u13_cosTable_iq,
        address_a => u13_cosTable_aa,
        data_a => u13_cosTable_ia
    );
        u13_cosTable_q <= u13_cosTable_iq(11 downto 0);

	--u13_cosMult(MULT,590)@15
    u13_cosMult_pr <= UNSIGNED(u13_cosMult_a) * UNSIGNED(u13_cosMult_b);
    u13_cosMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_cosMult_a <= (others => '0');
            u13_cosMult_b <= (others => '0');
            u13_cosMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u13_cosMult_a <= u13_cosTable_q;
            u13_cosMult_b <= u13_beta_times_pi_over_4_shifted_b;
            u13_cosMult_s1 <= STD_LOGIC_VECTOR(u13_cosMult_pr);
        END IF;
    END PROCESS;
    u13_cosMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_cosMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u13_cosMult_q <= u13_cosMult_s1;
        END IF;
    END PROCESS;

	--u13_sinTable(DUALMEM,578)@13
    u13_sinTable_reset0 <= areset;
    u13_sinTable_ia <= (others => '0');
    u13_sinTable_aa <= (others => '0');
    u13_sinTable_ab <= u13_alphaBitSelect_b;
    u13_sinTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u13_sinTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u13_sinTable_reset0,
        clock0 => clk,
        address_b => u13_sinTable_ab,
        -- data_b => (others => '0'),
        q_b => u13_sinTable_iq,
        address_a => u13_sinTable_aa,
        data_a => u13_sinTable_ia
    );
        u13_sinTable_q <= u13_sinTable_iq(11 downto 0);

	--d_u13_sinTable_q_18_replace_mem(DUALMEM,1400)
    d_u13_sinTable_q_18_replace_mem_reset0 <= areset;
    d_u13_sinTable_q_18_replace_mem_ia <= u13_sinTable_q;
    d_u13_sinTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u13_sinTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u13_sinTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u13_sinTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u13_sinTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u13_sinTable_q_18_replace_mem_iq,
        address_a => d_u13_sinTable_q_18_replace_mem_aa,
        data_a => d_u13_sinTable_q_18_replace_mem_ia
    );
        d_u13_sinTable_q_18_replace_mem_q <= d_u13_sinTable_q_18_replace_mem_iq(11 downto 0);

	--u13_lsSinTable(BITSHIFT,591)@18
    u13_lsSinTable_q_int <= d_u13_sinTable_q_18_replace_mem_q & "00000000000000000000";
    u13_lsSinTable_q <= u13_lsSinTable_q_int(31 downto 0);

	--u13_sinAdd(ADD,595)@18
    u13_sinAdd_a <= u13_lsSinTable_q(31 downto 18);
    u13_sinAdd_b <= STD_LOGIC_VECTOR("00000000" & u13_cosMult_q(23 downto 18));
    u13_sinAdd_i <= u0_sin_pi_over_4_q;
    u13_sinAdd_a1 <= u13_sinAdd_i WHEN (u13_alphaOverflowBitSelect_b = "1") ELSE u13_sinAdd_a;
    u13_sinAdd_b1 <= (others => '0') WHEN (u13_alphaOverflowBitSelect_b = "1") ELSE u13_sinAdd_b;
    u13_sinAdd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_sinAdd_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u13_sinAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(u13_sinAdd_a1) + UNSIGNED(u13_sinAdd_b1));
        END IF;
    END PROCESS;
    u13_sinAdd_q <= u13_sinAdd_o(13 downto 0);


	--u13_roundedSin(ROUND,597)@19
    u13_roundedSin_in <= u13_sinAdd_q;
    u13_roundedSin: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_roundedSin_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u13_roundedSin_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u13_roundedSin_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u13_roundedSin_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u13_sinMult(MULT,589)@15
    u13_sinMult_pr <= UNSIGNED(u13_sinMult_a) * UNSIGNED(u13_sinMult_b);
    u13_sinMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_sinMult_a <= (others => '0');
            u13_sinMult_b <= (others => '0');
            u13_sinMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u13_sinMult_a <= u13_sinTable_q;
            u13_sinMult_b <= u13_beta_times_pi_over_4_shifted_b;
            u13_sinMult_s1 <= STD_LOGIC_VECTOR(u13_sinMult_pr);
        END IF;
    END PROCESS;
    u13_sinMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_sinMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u13_sinMult_q <= u13_sinMult_s1;
        END IF;
    END PROCESS;

	--d_u13_cosTable_q_18_replace_mem(DUALMEM,1410)
    d_u13_cosTable_q_18_replace_mem_reset0 <= areset;
    d_u13_cosTable_q_18_replace_mem_ia <= u13_cosTable_q;
    d_u13_cosTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u13_cosTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u13_cosTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u13_cosTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u13_cosTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u13_cosTable_q_18_replace_mem_iq,
        address_a => d_u13_cosTable_q_18_replace_mem_aa,
        data_a => d_u13_cosTable_q_18_replace_mem_ia
    );
        d_u13_cosTable_q_18_replace_mem_q <= d_u13_cosTable_q_18_replace_mem_iq(11 downto 0);

	--u13_lsCosTable(BITSHIFT,592)@18
    u13_lsCosTable_q_int <= d_u13_cosTable_q_18_replace_mem_q & "00000000000000000000";
    u13_lsCosTable_q <= u13_lsCosTable_q_int(31 downto 0);

	--u13_cosSub(SUB,596)@18
    u13_cosSub_a <= u13_lsCosTable_q(31 downto 18);
    u13_cosSub_b <= STD_LOGIC_VECTOR("00000000" & u13_sinMult_q(23 downto 18));
    u13_cosSub_i <= u0_sin_pi_over_4_q;
    u13_cosSub_a1 <= u13_cosSub_i WHEN (u13_alphaOverflowBitSelect_b = "1") ELSE u13_cosSub_a;
    u13_cosSub_b1 <= (others => '0') WHEN (u13_alphaOverflowBitSelect_b = "1") ELSE u13_cosSub_b;
    u13_cosSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_cosSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u13_cosSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u13_cosSub_a1) - UNSIGNED(u13_cosSub_b1));
        END IF;
    END PROCESS;
    u13_cosSub_q <= u13_cosSub_o(13 downto 0);


	--u13_roundedCos(ROUND,598)@19
    u13_roundedCos_in <= u13_cosSub_q;
    u13_roundedCos: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_roundedCos_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u13_roundedCos_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u13_roundedCos_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u13_roundedCos_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u13_doSwap(LOOKUP,599)@19
    u13_doSwap: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_doSwap_q <= "0";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (d_u13_octantBitSelect_b_19_replace_mem_q) IS
                WHEN "000" =>  u13_doSwap_q <= "0";
                WHEN "001" =>  u13_doSwap_q <= "1";
                WHEN "010" =>  u13_doSwap_q <= "1";
                WHEN "011" =>  u13_doSwap_q <= "0";
                WHEN "100" =>  u13_doSwap_q <= "0";
                WHEN "101" =>  u13_doSwap_q <= "1";
                WHEN "110" =>  u13_doSwap_q <= "1";
                WHEN "111" =>  u13_doSwap_q <= "0";
                WHEN OTHERS =>
                    u13_doSwap_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u13_cosSwapMux(MUX,607)@20
    u13_cosSwapMux_s <= u13_doSwap_q;
    u13_cosSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_cosSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u13_cosSwapMux_s IS
                      WHEN "0" => u13_cosSwapMux_q <= u13_roundedCos_q;
                      WHEN "1" => u13_cosSwapMux_q <= u13_roundedSin_q;
                      WHEN OTHERS => u13_cosSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u13_cosInvert(SUB,609)@21
    u13_cosInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u13_cosInvert_b <= u13_cosSwapMux_q;
    u13_cosInvert_i <= u13_cosInvert_b;
    u13_cosInvert_a1 <= u13_cosInvert_i WHEN (u13_doCosInvert_q = "1") ELSE u13_cosInvert_a;
    u13_cosInvert_b1 <= (others => '0') WHEN (u13_doCosInvert_q = "1") ELSE u13_cosInvert_b;
    u13_cosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_cosInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u13_cosInvert_o <= STD_LOGIC_VECTOR(SIGNED(u13_cosInvert_a1) - SIGNED(u13_cosInvert_b1));
        END IF;
    END PROCESS;
    u13_cosInvert_q <= u13_cosInvert_o(11 downto 0);


	--u12_phaseIncrRegLookup_0(LOOKUP,28)@10
    u12_phaseIncrRegLookup_0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u12_phaseIncrRegLookup_0_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_a) IS
                WHEN "010010111100" =>                     u12_phaseIncrRegLookup_0_e <= busIn_w;
                WHEN OTHERS =>
                    u12_phaseIncrRegLookup_0_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u12_phaseIncrReg_p0(REG,29)@11
    u12_phaseIncrReg_p0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u12_phaseIncrReg_p0_q <= "01000110000000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (u12_phaseIncrRegLookup_0_e = "1") THEN
                u12_phaseIncrReg_p0_q <= d_busIn_d_11_q(19 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u12_invertCos(BITSELECT,562)@20
    u12_invertCos_in <= u12_phaseIncrReg_p0_q(18 downto 0);
    u12_invertCos_b <= u12_invertCos_in(18 downto 18);

	--u12_accumAdd_b1(ADD,528)@10
    u12_accumAdd_b1_a <= u12_accumAdd_b1_q;
    u12_accumAdd_b1_b <= u12_phaseIncrReg_p0_q(17 downto 0);
    u12_accumAdd_b1_i <= xIn_p_12;
    u12_accumAdd_b1_a1 <= u12_accumAdd_b1_i WHEN (xIn_s_12 = "1") ELSE u12_accumAdd_b1_a;
    u12_accumAdd_b1_b1 <= (others => '0') WHEN (xIn_s_12 = "1") ELSE u12_accumAdd_b1_b;
    u12_accumAdd_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_accumAdd_b1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u12_accumAdd_b1_o <= STD_LOGIC_VECTOR(UNSIGNED(u12_accumAdd_b1_a1) + UNSIGNED(u12_accumAdd_b1_b1));
            END IF;
        END IF;
    END PROCESS;
    u12_accumAdd_b1_q <= u12_accumAdd_b1_o(17 downto 0);


	--u12_octantBitSelect(BITSELECT,530)@11
    u12_octantBitSelect_in <= u12_accumAdd_b1_q;
    u12_octantBitSelect_b <= u12_octantBitSelect_in(17 downto 15);

	--d_u12_octantBitSelect_b_19_replace_mem(DUALMEM,1332)
    d_u12_octantBitSelect_b_19_replace_mem_reset0 <= areset;
    d_u12_octantBitSelect_b_19_replace_mem_ia <= u12_octantBitSelect_b;
    d_u12_octantBitSelect_b_19_replace_mem_aa <= d_u0_octantBitSelect_b_19_replace_rdreg_q;
    d_u12_octantBitSelect_b_19_replace_mem_ab <= d_u0_octantBitSelect_b_19_replace_rdmux_q;
    d_u12_octantBitSelect_b_19_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 3,
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
        clocken1 => d_u0_octantBitSelect_b_19_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u12_octantBitSelect_b_19_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u12_octantBitSelect_b_19_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u12_octantBitSelect_b_19_replace_mem_iq,
        address_a => d_u12_octantBitSelect_b_19_replace_mem_aa,
        data_a => d_u12_octantBitSelect_b_19_replace_mem_ia
    );
        d_u12_octantBitSelect_b_19_replace_mem_q <= d_u12_octantBitSelect_b_19_replace_mem_iq(2 downto 0);

	--d_u12_octantBitSelect_b_20(DELAY,770)@19
    d_u12_octantBitSelect_b_20 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => d_u12_octantBitSelect_b_19_replace_mem_q, xout => d_u12_octantBitSelect_b_20_q, clk => clk, aclr => areset );

	--u12_cosJoin(BITJOIN,563)@20
    u12_cosJoin_q <= u12_invertCos_b & d_u12_octantBitSelect_b_20_q;

	--u12_doCosInvert(LOOKUP,564)@20
    u12_doCosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_doCosInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u12_cosJoin_q) IS
                WHEN "0000" =>  u12_doCosInvert_q <= "1";
                WHEN "0001" =>  u12_doCosInvert_q <= "1";
                WHEN "0010" =>  u12_doCosInvert_q <= "0";
                WHEN "0011" =>  u12_doCosInvert_q <= "0";
                WHEN "0100" =>  u12_doCosInvert_q <= "0";
                WHEN "0101" =>  u12_doCosInvert_q <= "0";
                WHEN "0110" =>  u12_doCosInvert_q <= "1";
                WHEN "0111" =>  u12_doCosInvert_q <= "1";
                WHEN "1000" =>  u12_doCosInvert_q <= "0";
                WHEN "1001" =>  u12_doCosInvert_q <= "0";
                WHEN "1010" =>  u12_doCosInvert_q <= "1";
                WHEN "1011" =>  u12_doCosInvert_q <= "1";
                WHEN "1100" =>  u12_doCosInvert_q <= "1";
                WHEN "1101" =>  u12_doCosInvert_q <= "1";
                WHEN "1110" =>  u12_doCosInvert_q <= "0";
                WHEN "1111" =>  u12_doCosInvert_q <= "0";
                WHEN OTHERS =>
                    u12_doCosInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u12_addnsubConst(LOOKUP,532)@11
    u12_addnsubConst: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_addnsubConst_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u12_octantBitSelect_b) IS
                WHEN "000" =>  u12_addnsubConst_q <= "1";
                WHEN "001" =>  u12_addnsubConst_q <= "0";
                WHEN "010" =>  u12_addnsubConst_q <= "1";
                WHEN "011" =>  u12_addnsubConst_q <= "0";
                WHEN "100" =>  u12_addnsubConst_q <= "1";
                WHEN "101" =>  u12_addnsubConst_q <= "0";
                WHEN "110" =>  u12_addnsubConst_q <= "1";
                WHEN "111" =>  u12_addnsubConst_q <= "0";
                WHEN OTHERS =>
                    u12_addnsubConst_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--d_u12_accumAdd_b1_q_12(DELAY,768)@11
    d_u12_accumAdd_b1_q_12 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => u12_accumAdd_b1_q, xout => d_u12_accumAdd_b1_q_12_q, clk => clk, aclr => areset );

	--u12_rangeLUT(LOOKUP,531)@11
    u12_rangeLUT: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_rangeLUT_q <= "0000000000000000000";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u12_octantBitSelect_b) IS
                WHEN "000" =>  u12_rangeLUT_q <= "0000000000000000000";
                WHEN "001" =>  u12_rangeLUT_q <= "0010000000000000000";
                WHEN "010" =>  u12_rangeLUT_q <= "1110000000000000000";
                WHEN "011" =>  u12_rangeLUT_q <= "0100000000000000000";
                WHEN "100" =>  u12_rangeLUT_q <= "1100000000000000000";
                WHEN "101" =>  u12_rangeLUT_q <= "0110000000000000000";
                WHEN "110" =>  u12_rangeLUT_q <= "1010000000000000000";
                WHEN "111" =>  u12_rangeLUT_q <= "1100000000000000000";
                WHEN OTHERS =>
                    u12_rangeLUT_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u12_rangeAddSub(ADDSUB,533)@12
    u12_rangeAddSub_cin <= GND_q;
    u12_rangeAddSub_a <= STD_LOGIC_VECTOR("0" & u12_rangeLUT_q) & u12_addnsubConst_q(0);
    u12_rangeAddSub_b <= STD_LOGIC_VECTOR("00" & d_u12_accumAdd_b1_q_12_q) & u12_rangeAddSub_cin(0);
    u12_rangeAddSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_rangeAddSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u12_addnsubConst_q = "1") THEN
                u12_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u12_rangeAddSub_a) + UNSIGNED(u12_rangeAddSub_b));
            ELSE
                u12_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u12_rangeAddSub_a) - UNSIGNED(u12_rangeAddSub_b));
            END IF;
        END IF;
    END PROCESS;
    u12_rangeAddSub_q <= u12_rangeAddSub_o(19 downto 1);


	--d_u12_rangeAddSub_q_18_replace_mem(DUALMEM,1344)
    d_u12_rangeAddSub_q_18_replace_mem_reset0 <= areset;
    d_u12_rangeAddSub_q_18_replace_mem_ia <= u12_rangeAddSub_q;
    d_u12_rangeAddSub_q_18_replace_mem_aa <= d_u0_rangeAddSub_q_18_replace_rdreg_q;
    d_u12_rangeAddSub_q_18_replace_mem_ab <= d_u0_rangeAddSub_q_18_replace_rdmux_q;
    d_u12_rangeAddSub_q_18_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 19,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 19,
        widthad_b => 2,
        numwords_b => 4,
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
        clocken1 => d_u0_rangeAddSub_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u12_rangeAddSub_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u12_rangeAddSub_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u12_rangeAddSub_q_18_replace_mem_iq,
        address_a => d_u12_rangeAddSub_q_18_replace_mem_aa,
        data_a => d_u12_rangeAddSub_q_18_replace_mem_ia
    );
        d_u12_rangeAddSub_q_18_replace_mem_q <= d_u12_rangeAddSub_q_18_replace_mem_iq(18 downto 0);

	--u12_alphaOverflowBitSelect(BITSELECT,535)@18
    u12_alphaOverflowBitSelect_in <= d_u12_rangeAddSub_q_18_replace_mem_q(15 downto 0);
    u12_alphaOverflowBitSelect_b <= u12_alphaOverflowBitSelect_in(15 downto 15);

	--u12_betaBitSelect(BITSELECT,536)@13
    u12_betaBitSelect_in <= u12_rangeAddSub_q(6 downto 0);
    u12_betaBitSelect_b <= u12_betaBitSelect_in(6 downto 0);

	--u12_ls4(BITSHIFT,543)@13
    u12_ls4_q_int <= u12_betaBitSelect_b & "0000";
    u12_ls4_q <= u12_ls4_q_int(10 downto 0);

	--u12_ls7(BITSHIFT,542)@13
    u12_ls7_q_int <= u12_betaBitSelect_b & "0000000";
    u12_ls7_q <= u12_ls7_q_int(13 downto 0);

	--u12_cm2(ADD,544)@13
    u12_cm2_a <= STD_LOGIC_VECTOR("0" & u12_ls7_q);
    u12_cm2_b <= STD_LOGIC_VECTOR("0000" & u12_ls4_q);
    u12_cm2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_cm2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u12_cm2_o <= STD_LOGIC_VECTOR(UNSIGNED(u12_cm2_a) + UNSIGNED(u12_cm2_b));
        END IF;
    END PROCESS;
    u12_cm2_q <= u12_cm2_o(14 downto 0);


	--u12_ls10(BITSHIFT,540)@13
    u12_ls10_q_int <= u12_betaBitSelect_b & "0000000000";
    u12_ls10_q <= u12_ls10_q_int(16 downto 0);

	--u12_ls12(BITSHIFT,539)@13
    u12_ls12_q_int <= u12_betaBitSelect_b & "000000000000";
    u12_ls12_q <= u12_ls12_q_int(18 downto 0);

	--u12_cm1(SUB,541)@13
    u12_cm1_a <= STD_LOGIC_VECTOR("0" & u12_ls12_q);
    u12_cm1_b <= STD_LOGIC_VECTOR("000" & u12_ls10_q);
    u12_cm1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_cm1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u12_cm1_o <= STD_LOGIC_VECTOR(UNSIGNED(u12_cm1_a) - UNSIGNED(u12_cm1_b));
        END IF;
    END PROCESS;
    u12_cm1_q <= u12_cm1_o(19 downto 0);


	--u12_cm3(ADD,545)@14
    u12_cm3_a <= STD_LOGIC_VECTOR("0" & u12_cm1_q);
    u12_cm3_b <= STD_LOGIC_VECTOR("000000" & u12_cm2_q);
    u12_cm3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_cm3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u12_cm3_o <= STD_LOGIC_VECTOR(UNSIGNED(u12_cm3_a) + UNSIGNED(u12_cm3_b));
        END IF;
    END PROCESS;
    u12_cm3_q <= u12_cm3_o(20 downto 0);


	--u12_beta_times_4_shift(BITSHIFT,546)@15
    u12_beta_times_4_shift_q_int <= u12_cm3_q(20 downto 1);
    u12_beta_times_4_shift_q <= u12_beta_times_4_shift_q_int(19 downto 0);

	--u12_beta_times_pi_over_4_shifted(BITSELECT,547)@15
    u12_beta_times_pi_over_4_shifted_in <= u12_beta_times_4_shift_q(17 downto 0);
    u12_beta_times_pi_over_4_shifted_b <= u12_beta_times_pi_over_4_shifted_in(17 downto 6);

	--u12_alphaBitSelect(BITSELECT,534)@13
    u12_alphaBitSelect_in <= u12_rangeAddSub_q(14 downto 0);
    u12_alphaBitSelect_b <= u12_alphaBitSelect_in(14 downto 7);

	--u12_cosTable(DUALMEM,538)@13
    u12_cosTable_reset0 <= areset;
    u12_cosTable_ia <= (others => '0');
    u12_cosTable_aa <= (others => '0');
    u12_cosTable_ab <= u12_alphaBitSelect_b;
    u12_cosTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u12_cosTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u12_cosTable_reset0,
        clock0 => clk,
        address_b => u12_cosTable_ab,
        -- data_b => (others => '0'),
        q_b => u12_cosTable_iq,
        address_a => u12_cosTable_aa,
        data_a => u12_cosTable_ia
    );
        u12_cosTable_q <= u12_cosTable_iq(11 downto 0);

	--u12_cosMult(MULT,549)@15
    u12_cosMult_pr <= UNSIGNED(u12_cosMult_a) * UNSIGNED(u12_cosMult_b);
    u12_cosMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_cosMult_a <= (others => '0');
            u12_cosMult_b <= (others => '0');
            u12_cosMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u12_cosMult_a <= u12_cosTable_q;
            u12_cosMult_b <= u12_beta_times_pi_over_4_shifted_b;
            u12_cosMult_s1 <= STD_LOGIC_VECTOR(u12_cosMult_pr);
        END IF;
    END PROCESS;
    u12_cosMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_cosMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u12_cosMult_q <= u12_cosMult_s1;
        END IF;
    END PROCESS;

	--u12_sinTable(DUALMEM,537)@13
    u12_sinTable_reset0 <= areset;
    u12_sinTable_ia <= (others => '0');
    u12_sinTable_aa <= (others => '0');
    u12_sinTable_ab <= u12_alphaBitSelect_b;
    u12_sinTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u12_sinTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u12_sinTable_reset0,
        clock0 => clk,
        address_b => u12_sinTable_ab,
        -- data_b => (others => '0'),
        q_b => u12_sinTable_iq,
        address_a => u12_sinTable_aa,
        data_a => u12_sinTable_ia
    );
        u12_sinTable_q <= u12_sinTable_iq(11 downto 0);

	--d_u12_sinTable_q_18_replace_mem(DUALMEM,1356)
    d_u12_sinTable_q_18_replace_mem_reset0 <= areset;
    d_u12_sinTable_q_18_replace_mem_ia <= u12_sinTable_q;
    d_u12_sinTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u12_sinTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u12_sinTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u12_sinTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u12_sinTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u12_sinTable_q_18_replace_mem_iq,
        address_a => d_u12_sinTable_q_18_replace_mem_aa,
        data_a => d_u12_sinTable_q_18_replace_mem_ia
    );
        d_u12_sinTable_q_18_replace_mem_q <= d_u12_sinTable_q_18_replace_mem_iq(11 downto 0);

	--u12_lsSinTable(BITSHIFT,550)@18
    u12_lsSinTable_q_int <= d_u12_sinTable_q_18_replace_mem_q & "00000000000000000000";
    u12_lsSinTable_q <= u12_lsSinTable_q_int(31 downto 0);

	--u12_sinAdd(ADD,554)@18
    u12_sinAdd_a <= u12_lsSinTable_q(31 downto 18);
    u12_sinAdd_b <= STD_LOGIC_VECTOR("00000000" & u12_cosMult_q(23 downto 18));
    u12_sinAdd_i <= u0_sin_pi_over_4_q;
    u12_sinAdd_a1 <= u12_sinAdd_i WHEN (u12_alphaOverflowBitSelect_b = "1") ELSE u12_sinAdd_a;
    u12_sinAdd_b1 <= (others => '0') WHEN (u12_alphaOverflowBitSelect_b = "1") ELSE u12_sinAdd_b;
    u12_sinAdd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_sinAdd_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u12_sinAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(u12_sinAdd_a1) + UNSIGNED(u12_sinAdd_b1));
        END IF;
    END PROCESS;
    u12_sinAdd_q <= u12_sinAdd_o(13 downto 0);


	--u12_roundedSin(ROUND,556)@19
    u12_roundedSin_in <= u12_sinAdd_q;
    u12_roundedSin: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_roundedSin_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u12_roundedSin_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u12_roundedSin_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u12_roundedSin_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u12_sinMult(MULT,548)@15
    u12_sinMult_pr <= UNSIGNED(u12_sinMult_a) * UNSIGNED(u12_sinMult_b);
    u12_sinMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_sinMult_a <= (others => '0');
            u12_sinMult_b <= (others => '0');
            u12_sinMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u12_sinMult_a <= u12_sinTable_q;
            u12_sinMult_b <= u12_beta_times_pi_over_4_shifted_b;
            u12_sinMult_s1 <= STD_LOGIC_VECTOR(u12_sinMult_pr);
        END IF;
    END PROCESS;
    u12_sinMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_sinMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u12_sinMult_q <= u12_sinMult_s1;
        END IF;
    END PROCESS;

	--d_u12_cosTable_q_18_replace_mem(DUALMEM,1366)
    d_u12_cosTable_q_18_replace_mem_reset0 <= areset;
    d_u12_cosTable_q_18_replace_mem_ia <= u12_cosTable_q;
    d_u12_cosTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u12_cosTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u12_cosTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u12_cosTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u12_cosTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u12_cosTable_q_18_replace_mem_iq,
        address_a => d_u12_cosTable_q_18_replace_mem_aa,
        data_a => d_u12_cosTable_q_18_replace_mem_ia
    );
        d_u12_cosTable_q_18_replace_mem_q <= d_u12_cosTable_q_18_replace_mem_iq(11 downto 0);

	--u12_lsCosTable(BITSHIFT,551)@18
    u12_lsCosTable_q_int <= d_u12_cosTable_q_18_replace_mem_q & "00000000000000000000";
    u12_lsCosTable_q <= u12_lsCosTable_q_int(31 downto 0);

	--u12_cosSub(SUB,555)@18
    u12_cosSub_a <= u12_lsCosTable_q(31 downto 18);
    u12_cosSub_b <= STD_LOGIC_VECTOR("00000000" & u12_sinMult_q(23 downto 18));
    u12_cosSub_i <= u0_sin_pi_over_4_q;
    u12_cosSub_a1 <= u12_cosSub_i WHEN (u12_alphaOverflowBitSelect_b = "1") ELSE u12_cosSub_a;
    u12_cosSub_b1 <= (others => '0') WHEN (u12_alphaOverflowBitSelect_b = "1") ELSE u12_cosSub_b;
    u12_cosSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_cosSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u12_cosSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u12_cosSub_a1) - UNSIGNED(u12_cosSub_b1));
        END IF;
    END PROCESS;
    u12_cosSub_q <= u12_cosSub_o(13 downto 0);


	--u12_roundedCos(ROUND,557)@19
    u12_roundedCos_in <= u12_cosSub_q;
    u12_roundedCos: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_roundedCos_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u12_roundedCos_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u12_roundedCos_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u12_roundedCos_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u12_doSwap(LOOKUP,558)@19
    u12_doSwap: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_doSwap_q <= "0";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (d_u12_octantBitSelect_b_19_replace_mem_q) IS
                WHEN "000" =>  u12_doSwap_q <= "0";
                WHEN "001" =>  u12_doSwap_q <= "1";
                WHEN "010" =>  u12_doSwap_q <= "1";
                WHEN "011" =>  u12_doSwap_q <= "0";
                WHEN "100" =>  u12_doSwap_q <= "0";
                WHEN "101" =>  u12_doSwap_q <= "1";
                WHEN "110" =>  u12_doSwap_q <= "1";
                WHEN "111" =>  u12_doSwap_q <= "0";
                WHEN OTHERS =>
                    u12_doSwap_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u12_cosSwapMux(MUX,566)@20
    u12_cosSwapMux_s <= u12_doSwap_q;
    u12_cosSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_cosSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u12_cosSwapMux_s IS
                      WHEN "0" => u12_cosSwapMux_q <= u12_roundedCos_q;
                      WHEN "1" => u12_cosSwapMux_q <= u12_roundedSin_q;
                      WHEN OTHERS => u12_cosSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u12_cosInvert(SUB,568)@21
    u12_cosInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u12_cosInvert_b <= u12_cosSwapMux_q;
    u12_cosInvert_i <= u12_cosInvert_b;
    u12_cosInvert_a1 <= u12_cosInvert_i WHEN (u12_doCosInvert_q = "1") ELSE u12_cosInvert_a;
    u12_cosInvert_b1 <= (others => '0') WHEN (u12_doCosInvert_q = "1") ELSE u12_cosInvert_b;
    u12_cosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_cosInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u12_cosInvert_o <= STD_LOGIC_VECTOR(SIGNED(u12_cosInvert_a1) - SIGNED(u12_cosInvert_b1));
        END IF;
    END PROCESS;
    u12_cosInvert_q <= u12_cosInvert_o(11 downto 0);


	--u11_phaseIncrRegLookup_0(LOOKUP,26)@10
    u11_phaseIncrRegLookup_0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u11_phaseIncrRegLookup_0_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_a) IS
                WHEN "010010111011" =>                     u11_phaseIncrRegLookup_0_e <= busIn_w;
                WHEN OTHERS =>
                    u11_phaseIncrRegLookup_0_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u11_phaseIncrReg_p0(REG,27)@11
    u11_phaseIncrReg_p0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u11_phaseIncrReg_p0_q <= "01000110000000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (u11_phaseIncrRegLookup_0_e = "1") THEN
                u11_phaseIncrReg_p0_q <= d_busIn_d_11_q(19 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u11_invertCos(BITSELECT,521)@20
    u11_invertCos_in <= u11_phaseIncrReg_p0_q(18 downto 0);
    u11_invertCos_b <= u11_invertCos_in(18 downto 18);

	--u11_accumAdd_b1(ADD,487)@10
    u11_accumAdd_b1_a <= u11_accumAdd_b1_q;
    u11_accumAdd_b1_b <= u11_phaseIncrReg_p0_q(17 downto 0);
    u11_accumAdd_b1_i <= xIn_p_11;
    u11_accumAdd_b1_a1 <= u11_accumAdd_b1_i WHEN (xIn_s_11 = "1") ELSE u11_accumAdd_b1_a;
    u11_accumAdd_b1_b1 <= (others => '0') WHEN (xIn_s_11 = "1") ELSE u11_accumAdd_b1_b;
    u11_accumAdd_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_accumAdd_b1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u11_accumAdd_b1_o <= STD_LOGIC_VECTOR(UNSIGNED(u11_accumAdd_b1_a1) + UNSIGNED(u11_accumAdd_b1_b1));
            END IF;
        END IF;
    END PROCESS;
    u11_accumAdd_b1_q <= u11_accumAdd_b1_o(17 downto 0);


	--u11_octantBitSelect(BITSELECT,489)@11
    u11_octantBitSelect_in <= u11_accumAdd_b1_q;
    u11_octantBitSelect_b <= u11_octantBitSelect_in(17 downto 15);

	--d_u11_octantBitSelect_b_19_replace_mem(DUALMEM,1288)
    d_u11_octantBitSelect_b_19_replace_mem_reset0 <= areset;
    d_u11_octantBitSelect_b_19_replace_mem_ia <= u11_octantBitSelect_b;
    d_u11_octantBitSelect_b_19_replace_mem_aa <= d_u0_octantBitSelect_b_19_replace_rdreg_q;
    d_u11_octantBitSelect_b_19_replace_mem_ab <= d_u0_octantBitSelect_b_19_replace_rdmux_q;
    d_u11_octantBitSelect_b_19_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 3,
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
        clocken1 => d_u0_octantBitSelect_b_19_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u11_octantBitSelect_b_19_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u11_octantBitSelect_b_19_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u11_octantBitSelect_b_19_replace_mem_iq,
        address_a => d_u11_octantBitSelect_b_19_replace_mem_aa,
        data_a => d_u11_octantBitSelect_b_19_replace_mem_ia
    );
        d_u11_octantBitSelect_b_19_replace_mem_q <= d_u11_octantBitSelect_b_19_replace_mem_iq(2 downto 0);

	--d_u11_octantBitSelect_b_20(DELAY,764)@19
    d_u11_octantBitSelect_b_20 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => d_u11_octantBitSelect_b_19_replace_mem_q, xout => d_u11_octantBitSelect_b_20_q, clk => clk, aclr => areset );

	--u11_cosJoin(BITJOIN,522)@20
    u11_cosJoin_q <= u11_invertCos_b & d_u11_octantBitSelect_b_20_q;

	--u11_doCosInvert(LOOKUP,523)@20
    u11_doCosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_doCosInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u11_cosJoin_q) IS
                WHEN "0000" =>  u11_doCosInvert_q <= "1";
                WHEN "0001" =>  u11_doCosInvert_q <= "1";
                WHEN "0010" =>  u11_doCosInvert_q <= "0";
                WHEN "0011" =>  u11_doCosInvert_q <= "0";
                WHEN "0100" =>  u11_doCosInvert_q <= "0";
                WHEN "0101" =>  u11_doCosInvert_q <= "0";
                WHEN "0110" =>  u11_doCosInvert_q <= "1";
                WHEN "0111" =>  u11_doCosInvert_q <= "1";
                WHEN "1000" =>  u11_doCosInvert_q <= "0";
                WHEN "1001" =>  u11_doCosInvert_q <= "0";
                WHEN "1010" =>  u11_doCosInvert_q <= "1";
                WHEN "1011" =>  u11_doCosInvert_q <= "1";
                WHEN "1100" =>  u11_doCosInvert_q <= "1";
                WHEN "1101" =>  u11_doCosInvert_q <= "1";
                WHEN "1110" =>  u11_doCosInvert_q <= "0";
                WHEN "1111" =>  u11_doCosInvert_q <= "0";
                WHEN OTHERS =>
                    u11_doCosInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u11_addnsubConst(LOOKUP,491)@11
    u11_addnsubConst: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_addnsubConst_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u11_octantBitSelect_b) IS
                WHEN "000" =>  u11_addnsubConst_q <= "1";
                WHEN "001" =>  u11_addnsubConst_q <= "0";
                WHEN "010" =>  u11_addnsubConst_q <= "1";
                WHEN "011" =>  u11_addnsubConst_q <= "0";
                WHEN "100" =>  u11_addnsubConst_q <= "1";
                WHEN "101" =>  u11_addnsubConst_q <= "0";
                WHEN "110" =>  u11_addnsubConst_q <= "1";
                WHEN "111" =>  u11_addnsubConst_q <= "0";
                WHEN OTHERS =>
                    u11_addnsubConst_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--d_u11_accumAdd_b1_q_12(DELAY,762)@11
    d_u11_accumAdd_b1_q_12 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => u11_accumAdd_b1_q, xout => d_u11_accumAdd_b1_q_12_q, clk => clk, aclr => areset );

	--u11_rangeLUT(LOOKUP,490)@11
    u11_rangeLUT: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_rangeLUT_q <= "0000000000000000000";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u11_octantBitSelect_b) IS
                WHEN "000" =>  u11_rangeLUT_q <= "0000000000000000000";
                WHEN "001" =>  u11_rangeLUT_q <= "0010000000000000000";
                WHEN "010" =>  u11_rangeLUT_q <= "1110000000000000000";
                WHEN "011" =>  u11_rangeLUT_q <= "0100000000000000000";
                WHEN "100" =>  u11_rangeLUT_q <= "1100000000000000000";
                WHEN "101" =>  u11_rangeLUT_q <= "0110000000000000000";
                WHEN "110" =>  u11_rangeLUT_q <= "1010000000000000000";
                WHEN "111" =>  u11_rangeLUT_q <= "1100000000000000000";
                WHEN OTHERS =>
                    u11_rangeLUT_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u11_rangeAddSub(ADDSUB,492)@12
    u11_rangeAddSub_cin <= GND_q;
    u11_rangeAddSub_a <= STD_LOGIC_VECTOR("0" & u11_rangeLUT_q) & u11_addnsubConst_q(0);
    u11_rangeAddSub_b <= STD_LOGIC_VECTOR("00" & d_u11_accumAdd_b1_q_12_q) & u11_rangeAddSub_cin(0);
    u11_rangeAddSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_rangeAddSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u11_addnsubConst_q = "1") THEN
                u11_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u11_rangeAddSub_a) + UNSIGNED(u11_rangeAddSub_b));
            ELSE
                u11_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u11_rangeAddSub_a) - UNSIGNED(u11_rangeAddSub_b));
            END IF;
        END IF;
    END PROCESS;
    u11_rangeAddSub_q <= u11_rangeAddSub_o(19 downto 1);


	--d_u11_rangeAddSub_q_18_replace_mem(DUALMEM,1300)
    d_u11_rangeAddSub_q_18_replace_mem_reset0 <= areset;
    d_u11_rangeAddSub_q_18_replace_mem_ia <= u11_rangeAddSub_q;
    d_u11_rangeAddSub_q_18_replace_mem_aa <= d_u0_rangeAddSub_q_18_replace_rdreg_q;
    d_u11_rangeAddSub_q_18_replace_mem_ab <= d_u0_rangeAddSub_q_18_replace_rdmux_q;
    d_u11_rangeAddSub_q_18_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 19,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 19,
        widthad_b => 2,
        numwords_b => 4,
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
        clocken1 => d_u0_rangeAddSub_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u11_rangeAddSub_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u11_rangeAddSub_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u11_rangeAddSub_q_18_replace_mem_iq,
        address_a => d_u11_rangeAddSub_q_18_replace_mem_aa,
        data_a => d_u11_rangeAddSub_q_18_replace_mem_ia
    );
        d_u11_rangeAddSub_q_18_replace_mem_q <= d_u11_rangeAddSub_q_18_replace_mem_iq(18 downto 0);

	--u11_alphaOverflowBitSelect(BITSELECT,494)@18
    u11_alphaOverflowBitSelect_in <= d_u11_rangeAddSub_q_18_replace_mem_q(15 downto 0);
    u11_alphaOverflowBitSelect_b <= u11_alphaOverflowBitSelect_in(15 downto 15);

	--u11_betaBitSelect(BITSELECT,495)@13
    u11_betaBitSelect_in <= u11_rangeAddSub_q(6 downto 0);
    u11_betaBitSelect_b <= u11_betaBitSelect_in(6 downto 0);

	--u11_ls4(BITSHIFT,502)@13
    u11_ls4_q_int <= u11_betaBitSelect_b & "0000";
    u11_ls4_q <= u11_ls4_q_int(10 downto 0);

	--u11_ls7(BITSHIFT,501)@13
    u11_ls7_q_int <= u11_betaBitSelect_b & "0000000";
    u11_ls7_q <= u11_ls7_q_int(13 downto 0);

	--u11_cm2(ADD,503)@13
    u11_cm2_a <= STD_LOGIC_VECTOR("0" & u11_ls7_q);
    u11_cm2_b <= STD_LOGIC_VECTOR("0000" & u11_ls4_q);
    u11_cm2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_cm2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u11_cm2_o <= STD_LOGIC_VECTOR(UNSIGNED(u11_cm2_a) + UNSIGNED(u11_cm2_b));
        END IF;
    END PROCESS;
    u11_cm2_q <= u11_cm2_o(14 downto 0);


	--u11_ls10(BITSHIFT,499)@13
    u11_ls10_q_int <= u11_betaBitSelect_b & "0000000000";
    u11_ls10_q <= u11_ls10_q_int(16 downto 0);

	--u11_ls12(BITSHIFT,498)@13
    u11_ls12_q_int <= u11_betaBitSelect_b & "000000000000";
    u11_ls12_q <= u11_ls12_q_int(18 downto 0);

	--u11_cm1(SUB,500)@13
    u11_cm1_a <= STD_LOGIC_VECTOR("0" & u11_ls12_q);
    u11_cm1_b <= STD_LOGIC_VECTOR("000" & u11_ls10_q);
    u11_cm1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_cm1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u11_cm1_o <= STD_LOGIC_VECTOR(UNSIGNED(u11_cm1_a) - UNSIGNED(u11_cm1_b));
        END IF;
    END PROCESS;
    u11_cm1_q <= u11_cm1_o(19 downto 0);


	--u11_cm3(ADD,504)@14
    u11_cm3_a <= STD_LOGIC_VECTOR("0" & u11_cm1_q);
    u11_cm3_b <= STD_LOGIC_VECTOR("000000" & u11_cm2_q);
    u11_cm3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_cm3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u11_cm3_o <= STD_LOGIC_VECTOR(UNSIGNED(u11_cm3_a) + UNSIGNED(u11_cm3_b));
        END IF;
    END PROCESS;
    u11_cm3_q <= u11_cm3_o(20 downto 0);


	--u11_beta_times_4_shift(BITSHIFT,505)@15
    u11_beta_times_4_shift_q_int <= u11_cm3_q(20 downto 1);
    u11_beta_times_4_shift_q <= u11_beta_times_4_shift_q_int(19 downto 0);

	--u11_beta_times_pi_over_4_shifted(BITSELECT,506)@15
    u11_beta_times_pi_over_4_shifted_in <= u11_beta_times_4_shift_q(17 downto 0);
    u11_beta_times_pi_over_4_shifted_b <= u11_beta_times_pi_over_4_shifted_in(17 downto 6);

	--u11_alphaBitSelect(BITSELECT,493)@13
    u11_alphaBitSelect_in <= u11_rangeAddSub_q(14 downto 0);
    u11_alphaBitSelect_b <= u11_alphaBitSelect_in(14 downto 7);

	--u11_cosTable(DUALMEM,497)@13
    u11_cosTable_reset0 <= areset;
    u11_cosTable_ia <= (others => '0');
    u11_cosTable_aa <= (others => '0');
    u11_cosTable_ab <= u11_alphaBitSelect_b;
    u11_cosTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u11_cosTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u11_cosTable_reset0,
        clock0 => clk,
        address_b => u11_cosTable_ab,
        -- data_b => (others => '0'),
        q_b => u11_cosTable_iq,
        address_a => u11_cosTable_aa,
        data_a => u11_cosTable_ia
    );
        u11_cosTable_q <= u11_cosTable_iq(11 downto 0);

	--u11_cosMult(MULT,508)@15
    u11_cosMult_pr <= UNSIGNED(u11_cosMult_a) * UNSIGNED(u11_cosMult_b);
    u11_cosMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_cosMult_a <= (others => '0');
            u11_cosMult_b <= (others => '0');
            u11_cosMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u11_cosMult_a <= u11_cosTable_q;
            u11_cosMult_b <= u11_beta_times_pi_over_4_shifted_b;
            u11_cosMult_s1 <= STD_LOGIC_VECTOR(u11_cosMult_pr);
        END IF;
    END PROCESS;
    u11_cosMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_cosMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u11_cosMult_q <= u11_cosMult_s1;
        END IF;
    END PROCESS;

	--u11_sinTable(DUALMEM,496)@13
    u11_sinTable_reset0 <= areset;
    u11_sinTable_ia <= (others => '0');
    u11_sinTable_aa <= (others => '0');
    u11_sinTable_ab <= u11_alphaBitSelect_b;
    u11_sinTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u11_sinTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u11_sinTable_reset0,
        clock0 => clk,
        address_b => u11_sinTable_ab,
        -- data_b => (others => '0'),
        q_b => u11_sinTable_iq,
        address_a => u11_sinTable_aa,
        data_a => u11_sinTable_ia
    );
        u11_sinTable_q <= u11_sinTable_iq(11 downto 0);

	--d_u11_sinTable_q_18_replace_mem(DUALMEM,1312)
    d_u11_sinTable_q_18_replace_mem_reset0 <= areset;
    d_u11_sinTable_q_18_replace_mem_ia <= u11_sinTable_q;
    d_u11_sinTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u11_sinTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u11_sinTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u11_sinTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u11_sinTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u11_sinTable_q_18_replace_mem_iq,
        address_a => d_u11_sinTable_q_18_replace_mem_aa,
        data_a => d_u11_sinTable_q_18_replace_mem_ia
    );
        d_u11_sinTable_q_18_replace_mem_q <= d_u11_sinTable_q_18_replace_mem_iq(11 downto 0);

	--u11_lsSinTable(BITSHIFT,509)@18
    u11_lsSinTable_q_int <= d_u11_sinTable_q_18_replace_mem_q & "00000000000000000000";
    u11_lsSinTable_q <= u11_lsSinTable_q_int(31 downto 0);

	--u11_sinAdd(ADD,513)@18
    u11_sinAdd_a <= u11_lsSinTable_q(31 downto 18);
    u11_sinAdd_b <= STD_LOGIC_VECTOR("00000000" & u11_cosMult_q(23 downto 18));
    u11_sinAdd_i <= u0_sin_pi_over_4_q;
    u11_sinAdd_a1 <= u11_sinAdd_i WHEN (u11_alphaOverflowBitSelect_b = "1") ELSE u11_sinAdd_a;
    u11_sinAdd_b1 <= (others => '0') WHEN (u11_alphaOverflowBitSelect_b = "1") ELSE u11_sinAdd_b;
    u11_sinAdd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_sinAdd_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u11_sinAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(u11_sinAdd_a1) + UNSIGNED(u11_sinAdd_b1));
        END IF;
    END PROCESS;
    u11_sinAdd_q <= u11_sinAdd_o(13 downto 0);


	--u11_roundedSin(ROUND,515)@19
    u11_roundedSin_in <= u11_sinAdd_q;
    u11_roundedSin: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_roundedSin_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u11_roundedSin_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u11_roundedSin_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u11_roundedSin_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u11_sinMult(MULT,507)@15
    u11_sinMult_pr <= UNSIGNED(u11_sinMult_a) * UNSIGNED(u11_sinMult_b);
    u11_sinMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_sinMult_a <= (others => '0');
            u11_sinMult_b <= (others => '0');
            u11_sinMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u11_sinMult_a <= u11_sinTable_q;
            u11_sinMult_b <= u11_beta_times_pi_over_4_shifted_b;
            u11_sinMult_s1 <= STD_LOGIC_VECTOR(u11_sinMult_pr);
        END IF;
    END PROCESS;
    u11_sinMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_sinMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u11_sinMult_q <= u11_sinMult_s1;
        END IF;
    END PROCESS;

	--d_u11_cosTable_q_18_replace_mem(DUALMEM,1322)
    d_u11_cosTable_q_18_replace_mem_reset0 <= areset;
    d_u11_cosTable_q_18_replace_mem_ia <= u11_cosTable_q;
    d_u11_cosTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u11_cosTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u11_cosTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u11_cosTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u11_cosTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u11_cosTable_q_18_replace_mem_iq,
        address_a => d_u11_cosTable_q_18_replace_mem_aa,
        data_a => d_u11_cosTable_q_18_replace_mem_ia
    );
        d_u11_cosTable_q_18_replace_mem_q <= d_u11_cosTable_q_18_replace_mem_iq(11 downto 0);

	--u11_lsCosTable(BITSHIFT,510)@18
    u11_lsCosTable_q_int <= d_u11_cosTable_q_18_replace_mem_q & "00000000000000000000";
    u11_lsCosTable_q <= u11_lsCosTable_q_int(31 downto 0);

	--u11_cosSub(SUB,514)@18
    u11_cosSub_a <= u11_lsCosTable_q(31 downto 18);
    u11_cosSub_b <= STD_LOGIC_VECTOR("00000000" & u11_sinMult_q(23 downto 18));
    u11_cosSub_i <= u0_sin_pi_over_4_q;
    u11_cosSub_a1 <= u11_cosSub_i WHEN (u11_alphaOverflowBitSelect_b = "1") ELSE u11_cosSub_a;
    u11_cosSub_b1 <= (others => '0') WHEN (u11_alphaOverflowBitSelect_b = "1") ELSE u11_cosSub_b;
    u11_cosSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_cosSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u11_cosSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u11_cosSub_a1) - UNSIGNED(u11_cosSub_b1));
        END IF;
    END PROCESS;
    u11_cosSub_q <= u11_cosSub_o(13 downto 0);


	--u11_roundedCos(ROUND,516)@19
    u11_roundedCos_in <= u11_cosSub_q;
    u11_roundedCos: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_roundedCos_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u11_roundedCos_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u11_roundedCos_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u11_roundedCos_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u11_doSwap(LOOKUP,517)@19
    u11_doSwap: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_doSwap_q <= "0";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (d_u11_octantBitSelect_b_19_replace_mem_q) IS
                WHEN "000" =>  u11_doSwap_q <= "0";
                WHEN "001" =>  u11_doSwap_q <= "1";
                WHEN "010" =>  u11_doSwap_q <= "1";
                WHEN "011" =>  u11_doSwap_q <= "0";
                WHEN "100" =>  u11_doSwap_q <= "0";
                WHEN "101" =>  u11_doSwap_q <= "1";
                WHEN "110" =>  u11_doSwap_q <= "1";
                WHEN "111" =>  u11_doSwap_q <= "0";
                WHEN OTHERS =>
                    u11_doSwap_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u11_cosSwapMux(MUX,525)@20
    u11_cosSwapMux_s <= u11_doSwap_q;
    u11_cosSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_cosSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u11_cosSwapMux_s IS
                      WHEN "0" => u11_cosSwapMux_q <= u11_roundedCos_q;
                      WHEN "1" => u11_cosSwapMux_q <= u11_roundedSin_q;
                      WHEN OTHERS => u11_cosSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u11_cosInvert(SUB,527)@21
    u11_cosInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u11_cosInvert_b <= u11_cosSwapMux_q;
    u11_cosInvert_i <= u11_cosInvert_b;
    u11_cosInvert_a1 <= u11_cosInvert_i WHEN (u11_doCosInvert_q = "1") ELSE u11_cosInvert_a;
    u11_cosInvert_b1 <= (others => '0') WHEN (u11_doCosInvert_q = "1") ELSE u11_cosInvert_b;
    u11_cosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_cosInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u11_cosInvert_o <= STD_LOGIC_VECTOR(SIGNED(u11_cosInvert_a1) - SIGNED(u11_cosInvert_b1));
        END IF;
    END PROCESS;
    u11_cosInvert_q <= u11_cosInvert_o(11 downto 0);


	--u10_phaseIncrRegLookup_0(LOOKUP,24)@10
    u10_phaseIncrRegLookup_0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u10_phaseIncrRegLookup_0_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_a) IS
                WHEN "010010111010" =>                     u10_phaseIncrRegLookup_0_e <= busIn_w;
                WHEN OTHERS =>
                    u10_phaseIncrRegLookup_0_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u10_phaseIncrReg_p0(REG,25)@11
    u10_phaseIncrReg_p0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u10_phaseIncrReg_p0_q <= "01000110000000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (u10_phaseIncrRegLookup_0_e = "1") THEN
                u10_phaseIncrReg_p0_q <= d_busIn_d_11_q(19 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u10_invertCos(BITSELECT,480)@20
    u10_invertCos_in <= u10_phaseIncrReg_p0_q(18 downto 0);
    u10_invertCos_b <= u10_invertCos_in(18 downto 18);

	--u10_accumAdd_b1(ADD,446)@10
    u10_accumAdd_b1_a <= u10_accumAdd_b1_q;
    u10_accumAdd_b1_b <= u10_phaseIncrReg_p0_q(17 downto 0);
    u10_accumAdd_b1_i <= xIn_p_10;
    u10_accumAdd_b1_a1 <= u10_accumAdd_b1_i WHEN (xIn_s_10 = "1") ELSE u10_accumAdd_b1_a;
    u10_accumAdd_b1_b1 <= (others => '0') WHEN (xIn_s_10 = "1") ELSE u10_accumAdd_b1_b;
    u10_accumAdd_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_accumAdd_b1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u10_accumAdd_b1_o <= STD_LOGIC_VECTOR(UNSIGNED(u10_accumAdd_b1_a1) + UNSIGNED(u10_accumAdd_b1_b1));
            END IF;
        END IF;
    END PROCESS;
    u10_accumAdd_b1_q <= u10_accumAdd_b1_o(17 downto 0);


	--u10_octantBitSelect(BITSELECT,448)@11
    u10_octantBitSelect_in <= u10_accumAdd_b1_q;
    u10_octantBitSelect_b <= u10_octantBitSelect_in(17 downto 15);

	--d_u10_octantBitSelect_b_19_replace_mem(DUALMEM,1244)
    d_u10_octantBitSelect_b_19_replace_mem_reset0 <= areset;
    d_u10_octantBitSelect_b_19_replace_mem_ia <= u10_octantBitSelect_b;
    d_u10_octantBitSelect_b_19_replace_mem_aa <= d_u0_octantBitSelect_b_19_replace_rdreg_q;
    d_u10_octantBitSelect_b_19_replace_mem_ab <= d_u0_octantBitSelect_b_19_replace_rdmux_q;
    d_u10_octantBitSelect_b_19_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 3,
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
        clocken1 => d_u0_octantBitSelect_b_19_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u10_octantBitSelect_b_19_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u10_octantBitSelect_b_19_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u10_octantBitSelect_b_19_replace_mem_iq,
        address_a => d_u10_octantBitSelect_b_19_replace_mem_aa,
        data_a => d_u10_octantBitSelect_b_19_replace_mem_ia
    );
        d_u10_octantBitSelect_b_19_replace_mem_q <= d_u10_octantBitSelect_b_19_replace_mem_iq(2 downto 0);

	--d_u10_octantBitSelect_b_20(DELAY,758)@19
    d_u10_octantBitSelect_b_20 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => d_u10_octantBitSelect_b_19_replace_mem_q, xout => d_u10_octantBitSelect_b_20_q, clk => clk, aclr => areset );

	--u10_cosJoin(BITJOIN,481)@20
    u10_cosJoin_q <= u10_invertCos_b & d_u10_octantBitSelect_b_20_q;

	--u10_doCosInvert(LOOKUP,482)@20
    u10_doCosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_doCosInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u10_cosJoin_q) IS
                WHEN "0000" =>  u10_doCosInvert_q <= "1";
                WHEN "0001" =>  u10_doCosInvert_q <= "1";
                WHEN "0010" =>  u10_doCosInvert_q <= "0";
                WHEN "0011" =>  u10_doCosInvert_q <= "0";
                WHEN "0100" =>  u10_doCosInvert_q <= "0";
                WHEN "0101" =>  u10_doCosInvert_q <= "0";
                WHEN "0110" =>  u10_doCosInvert_q <= "1";
                WHEN "0111" =>  u10_doCosInvert_q <= "1";
                WHEN "1000" =>  u10_doCosInvert_q <= "0";
                WHEN "1001" =>  u10_doCosInvert_q <= "0";
                WHEN "1010" =>  u10_doCosInvert_q <= "1";
                WHEN "1011" =>  u10_doCosInvert_q <= "1";
                WHEN "1100" =>  u10_doCosInvert_q <= "1";
                WHEN "1101" =>  u10_doCosInvert_q <= "1";
                WHEN "1110" =>  u10_doCosInvert_q <= "0";
                WHEN "1111" =>  u10_doCosInvert_q <= "0";
                WHEN OTHERS =>
                    u10_doCosInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u10_addnsubConst(LOOKUP,450)@11
    u10_addnsubConst: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_addnsubConst_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u10_octantBitSelect_b) IS
                WHEN "000" =>  u10_addnsubConst_q <= "1";
                WHEN "001" =>  u10_addnsubConst_q <= "0";
                WHEN "010" =>  u10_addnsubConst_q <= "1";
                WHEN "011" =>  u10_addnsubConst_q <= "0";
                WHEN "100" =>  u10_addnsubConst_q <= "1";
                WHEN "101" =>  u10_addnsubConst_q <= "0";
                WHEN "110" =>  u10_addnsubConst_q <= "1";
                WHEN "111" =>  u10_addnsubConst_q <= "0";
                WHEN OTHERS =>
                    u10_addnsubConst_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--d_u10_accumAdd_b1_q_12(DELAY,756)@11
    d_u10_accumAdd_b1_q_12 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => u10_accumAdd_b1_q, xout => d_u10_accumAdd_b1_q_12_q, clk => clk, aclr => areset );

	--u10_rangeLUT(LOOKUP,449)@11
    u10_rangeLUT: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_rangeLUT_q <= "0000000000000000000";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u10_octantBitSelect_b) IS
                WHEN "000" =>  u10_rangeLUT_q <= "0000000000000000000";
                WHEN "001" =>  u10_rangeLUT_q <= "0010000000000000000";
                WHEN "010" =>  u10_rangeLUT_q <= "1110000000000000000";
                WHEN "011" =>  u10_rangeLUT_q <= "0100000000000000000";
                WHEN "100" =>  u10_rangeLUT_q <= "1100000000000000000";
                WHEN "101" =>  u10_rangeLUT_q <= "0110000000000000000";
                WHEN "110" =>  u10_rangeLUT_q <= "1010000000000000000";
                WHEN "111" =>  u10_rangeLUT_q <= "1100000000000000000";
                WHEN OTHERS =>
                    u10_rangeLUT_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u10_rangeAddSub(ADDSUB,451)@12
    u10_rangeAddSub_cin <= GND_q;
    u10_rangeAddSub_a <= STD_LOGIC_VECTOR("0" & u10_rangeLUT_q) & u10_addnsubConst_q(0);
    u10_rangeAddSub_b <= STD_LOGIC_VECTOR("00" & d_u10_accumAdd_b1_q_12_q) & u10_rangeAddSub_cin(0);
    u10_rangeAddSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_rangeAddSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u10_addnsubConst_q = "1") THEN
                u10_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u10_rangeAddSub_a) + UNSIGNED(u10_rangeAddSub_b));
            ELSE
                u10_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u10_rangeAddSub_a) - UNSIGNED(u10_rangeAddSub_b));
            END IF;
        END IF;
    END PROCESS;
    u10_rangeAddSub_q <= u10_rangeAddSub_o(19 downto 1);


	--d_u10_rangeAddSub_q_18_replace_mem(DUALMEM,1256)
    d_u10_rangeAddSub_q_18_replace_mem_reset0 <= areset;
    d_u10_rangeAddSub_q_18_replace_mem_ia <= u10_rangeAddSub_q;
    d_u10_rangeAddSub_q_18_replace_mem_aa <= d_u0_rangeAddSub_q_18_replace_rdreg_q;
    d_u10_rangeAddSub_q_18_replace_mem_ab <= d_u0_rangeAddSub_q_18_replace_rdmux_q;
    d_u10_rangeAddSub_q_18_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 19,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 19,
        widthad_b => 2,
        numwords_b => 4,
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
        clocken1 => d_u0_rangeAddSub_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u10_rangeAddSub_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u10_rangeAddSub_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u10_rangeAddSub_q_18_replace_mem_iq,
        address_a => d_u10_rangeAddSub_q_18_replace_mem_aa,
        data_a => d_u10_rangeAddSub_q_18_replace_mem_ia
    );
        d_u10_rangeAddSub_q_18_replace_mem_q <= d_u10_rangeAddSub_q_18_replace_mem_iq(18 downto 0);

	--u10_alphaOverflowBitSelect(BITSELECT,453)@18
    u10_alphaOverflowBitSelect_in <= d_u10_rangeAddSub_q_18_replace_mem_q(15 downto 0);
    u10_alphaOverflowBitSelect_b <= u10_alphaOverflowBitSelect_in(15 downto 15);

	--u10_betaBitSelect(BITSELECT,454)@13
    u10_betaBitSelect_in <= u10_rangeAddSub_q(6 downto 0);
    u10_betaBitSelect_b <= u10_betaBitSelect_in(6 downto 0);

	--u10_ls4(BITSHIFT,461)@13
    u10_ls4_q_int <= u10_betaBitSelect_b & "0000";
    u10_ls4_q <= u10_ls4_q_int(10 downto 0);

	--u10_ls7(BITSHIFT,460)@13
    u10_ls7_q_int <= u10_betaBitSelect_b & "0000000";
    u10_ls7_q <= u10_ls7_q_int(13 downto 0);

	--u10_cm2(ADD,462)@13
    u10_cm2_a <= STD_LOGIC_VECTOR("0" & u10_ls7_q);
    u10_cm2_b <= STD_LOGIC_VECTOR("0000" & u10_ls4_q);
    u10_cm2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_cm2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u10_cm2_o <= STD_LOGIC_VECTOR(UNSIGNED(u10_cm2_a) + UNSIGNED(u10_cm2_b));
        END IF;
    END PROCESS;
    u10_cm2_q <= u10_cm2_o(14 downto 0);


	--u10_ls10(BITSHIFT,458)@13
    u10_ls10_q_int <= u10_betaBitSelect_b & "0000000000";
    u10_ls10_q <= u10_ls10_q_int(16 downto 0);

	--u10_ls12(BITSHIFT,457)@13
    u10_ls12_q_int <= u10_betaBitSelect_b & "000000000000";
    u10_ls12_q <= u10_ls12_q_int(18 downto 0);

	--u10_cm1(SUB,459)@13
    u10_cm1_a <= STD_LOGIC_VECTOR("0" & u10_ls12_q);
    u10_cm1_b <= STD_LOGIC_VECTOR("000" & u10_ls10_q);
    u10_cm1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_cm1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u10_cm1_o <= STD_LOGIC_VECTOR(UNSIGNED(u10_cm1_a) - UNSIGNED(u10_cm1_b));
        END IF;
    END PROCESS;
    u10_cm1_q <= u10_cm1_o(19 downto 0);


	--u10_cm3(ADD,463)@14
    u10_cm3_a <= STD_LOGIC_VECTOR("0" & u10_cm1_q);
    u10_cm3_b <= STD_LOGIC_VECTOR("000000" & u10_cm2_q);
    u10_cm3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_cm3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u10_cm3_o <= STD_LOGIC_VECTOR(UNSIGNED(u10_cm3_a) + UNSIGNED(u10_cm3_b));
        END IF;
    END PROCESS;
    u10_cm3_q <= u10_cm3_o(20 downto 0);


	--u10_beta_times_4_shift(BITSHIFT,464)@15
    u10_beta_times_4_shift_q_int <= u10_cm3_q(20 downto 1);
    u10_beta_times_4_shift_q <= u10_beta_times_4_shift_q_int(19 downto 0);

	--u10_beta_times_pi_over_4_shifted(BITSELECT,465)@15
    u10_beta_times_pi_over_4_shifted_in <= u10_beta_times_4_shift_q(17 downto 0);
    u10_beta_times_pi_over_4_shifted_b <= u10_beta_times_pi_over_4_shifted_in(17 downto 6);

	--u10_alphaBitSelect(BITSELECT,452)@13
    u10_alphaBitSelect_in <= u10_rangeAddSub_q(14 downto 0);
    u10_alphaBitSelect_b <= u10_alphaBitSelect_in(14 downto 7);

	--u10_cosTable(DUALMEM,456)@13
    u10_cosTable_reset0 <= areset;
    u10_cosTable_ia <= (others => '0');
    u10_cosTable_aa <= (others => '0');
    u10_cosTable_ab <= u10_alphaBitSelect_b;
    u10_cosTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u10_cosTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u10_cosTable_reset0,
        clock0 => clk,
        address_b => u10_cosTable_ab,
        -- data_b => (others => '0'),
        q_b => u10_cosTable_iq,
        address_a => u10_cosTable_aa,
        data_a => u10_cosTable_ia
    );
        u10_cosTable_q <= u10_cosTable_iq(11 downto 0);

	--u10_cosMult(MULT,467)@15
    u10_cosMult_pr <= UNSIGNED(u10_cosMult_a) * UNSIGNED(u10_cosMult_b);
    u10_cosMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_cosMult_a <= (others => '0');
            u10_cosMult_b <= (others => '0');
            u10_cosMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u10_cosMult_a <= u10_cosTable_q;
            u10_cosMult_b <= u10_beta_times_pi_over_4_shifted_b;
            u10_cosMult_s1 <= STD_LOGIC_VECTOR(u10_cosMult_pr);
        END IF;
    END PROCESS;
    u10_cosMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_cosMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u10_cosMult_q <= u10_cosMult_s1;
        END IF;
    END PROCESS;

	--u10_sinTable(DUALMEM,455)@13
    u10_sinTable_reset0 <= areset;
    u10_sinTable_ia <= (others => '0');
    u10_sinTable_aa <= (others => '0');
    u10_sinTable_ab <= u10_alphaBitSelect_b;
    u10_sinTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u10_sinTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u10_sinTable_reset0,
        clock0 => clk,
        address_b => u10_sinTable_ab,
        -- data_b => (others => '0'),
        q_b => u10_sinTable_iq,
        address_a => u10_sinTable_aa,
        data_a => u10_sinTable_ia
    );
        u10_sinTable_q <= u10_sinTable_iq(11 downto 0);

	--d_u10_sinTable_q_18_replace_mem(DUALMEM,1268)
    d_u10_sinTable_q_18_replace_mem_reset0 <= areset;
    d_u10_sinTable_q_18_replace_mem_ia <= u10_sinTable_q;
    d_u10_sinTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u10_sinTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u10_sinTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u10_sinTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u10_sinTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u10_sinTable_q_18_replace_mem_iq,
        address_a => d_u10_sinTable_q_18_replace_mem_aa,
        data_a => d_u10_sinTable_q_18_replace_mem_ia
    );
        d_u10_sinTable_q_18_replace_mem_q <= d_u10_sinTable_q_18_replace_mem_iq(11 downto 0);

	--u10_lsSinTable(BITSHIFT,468)@18
    u10_lsSinTable_q_int <= d_u10_sinTable_q_18_replace_mem_q & "00000000000000000000";
    u10_lsSinTable_q <= u10_lsSinTable_q_int(31 downto 0);

	--u10_sinAdd(ADD,472)@18
    u10_sinAdd_a <= u10_lsSinTable_q(31 downto 18);
    u10_sinAdd_b <= STD_LOGIC_VECTOR("00000000" & u10_cosMult_q(23 downto 18));
    u10_sinAdd_i <= u0_sin_pi_over_4_q;
    u10_sinAdd_a1 <= u10_sinAdd_i WHEN (u10_alphaOverflowBitSelect_b = "1") ELSE u10_sinAdd_a;
    u10_sinAdd_b1 <= (others => '0') WHEN (u10_alphaOverflowBitSelect_b = "1") ELSE u10_sinAdd_b;
    u10_sinAdd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_sinAdd_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u10_sinAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(u10_sinAdd_a1) + UNSIGNED(u10_sinAdd_b1));
        END IF;
    END PROCESS;
    u10_sinAdd_q <= u10_sinAdd_o(13 downto 0);


	--u10_roundedSin(ROUND,474)@19
    u10_roundedSin_in <= u10_sinAdd_q;
    u10_roundedSin: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_roundedSin_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u10_roundedSin_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u10_roundedSin_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u10_roundedSin_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u10_sinMult(MULT,466)@15
    u10_sinMult_pr <= UNSIGNED(u10_sinMult_a) * UNSIGNED(u10_sinMult_b);
    u10_sinMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_sinMult_a <= (others => '0');
            u10_sinMult_b <= (others => '0');
            u10_sinMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u10_sinMult_a <= u10_sinTable_q;
            u10_sinMult_b <= u10_beta_times_pi_over_4_shifted_b;
            u10_sinMult_s1 <= STD_LOGIC_VECTOR(u10_sinMult_pr);
        END IF;
    END PROCESS;
    u10_sinMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_sinMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u10_sinMult_q <= u10_sinMult_s1;
        END IF;
    END PROCESS;

	--d_u10_cosTable_q_18_replace_mem(DUALMEM,1278)
    d_u10_cosTable_q_18_replace_mem_reset0 <= areset;
    d_u10_cosTable_q_18_replace_mem_ia <= u10_cosTable_q;
    d_u10_cosTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u10_cosTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u10_cosTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u10_cosTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u10_cosTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u10_cosTable_q_18_replace_mem_iq,
        address_a => d_u10_cosTable_q_18_replace_mem_aa,
        data_a => d_u10_cosTable_q_18_replace_mem_ia
    );
        d_u10_cosTable_q_18_replace_mem_q <= d_u10_cosTable_q_18_replace_mem_iq(11 downto 0);

	--u10_lsCosTable(BITSHIFT,469)@18
    u10_lsCosTable_q_int <= d_u10_cosTable_q_18_replace_mem_q & "00000000000000000000";
    u10_lsCosTable_q <= u10_lsCosTable_q_int(31 downto 0);

	--u10_cosSub(SUB,473)@18
    u10_cosSub_a <= u10_lsCosTable_q(31 downto 18);
    u10_cosSub_b <= STD_LOGIC_VECTOR("00000000" & u10_sinMult_q(23 downto 18));
    u10_cosSub_i <= u0_sin_pi_over_4_q;
    u10_cosSub_a1 <= u10_cosSub_i WHEN (u10_alphaOverflowBitSelect_b = "1") ELSE u10_cosSub_a;
    u10_cosSub_b1 <= (others => '0') WHEN (u10_alphaOverflowBitSelect_b = "1") ELSE u10_cosSub_b;
    u10_cosSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_cosSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u10_cosSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u10_cosSub_a1) - UNSIGNED(u10_cosSub_b1));
        END IF;
    END PROCESS;
    u10_cosSub_q <= u10_cosSub_o(13 downto 0);


	--u10_roundedCos(ROUND,475)@19
    u10_roundedCos_in <= u10_cosSub_q;
    u10_roundedCos: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_roundedCos_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u10_roundedCos_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u10_roundedCos_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u10_roundedCos_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u10_doSwap(LOOKUP,476)@19
    u10_doSwap: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_doSwap_q <= "0";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (d_u10_octantBitSelect_b_19_replace_mem_q) IS
                WHEN "000" =>  u10_doSwap_q <= "0";
                WHEN "001" =>  u10_doSwap_q <= "1";
                WHEN "010" =>  u10_doSwap_q <= "1";
                WHEN "011" =>  u10_doSwap_q <= "0";
                WHEN "100" =>  u10_doSwap_q <= "0";
                WHEN "101" =>  u10_doSwap_q <= "1";
                WHEN "110" =>  u10_doSwap_q <= "1";
                WHEN "111" =>  u10_doSwap_q <= "0";
                WHEN OTHERS =>
                    u10_doSwap_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u10_cosSwapMux(MUX,484)@20
    u10_cosSwapMux_s <= u10_doSwap_q;
    u10_cosSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_cosSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u10_cosSwapMux_s IS
                      WHEN "0" => u10_cosSwapMux_q <= u10_roundedCos_q;
                      WHEN "1" => u10_cosSwapMux_q <= u10_roundedSin_q;
                      WHEN OTHERS => u10_cosSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u10_cosInvert(SUB,486)@21
    u10_cosInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u10_cosInvert_b <= u10_cosSwapMux_q;
    u10_cosInvert_i <= u10_cosInvert_b;
    u10_cosInvert_a1 <= u10_cosInvert_i WHEN (u10_doCosInvert_q = "1") ELSE u10_cosInvert_a;
    u10_cosInvert_b1 <= (others => '0') WHEN (u10_doCosInvert_q = "1") ELSE u10_cosInvert_b;
    u10_cosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_cosInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u10_cosInvert_o <= STD_LOGIC_VECTOR(SIGNED(u10_cosInvert_a1) - SIGNED(u10_cosInvert_b1));
        END IF;
    END PROCESS;
    u10_cosInvert_q <= u10_cosInvert_o(11 downto 0);


	--u9_phaseIncrRegLookup_0(LOOKUP,22)@10
    u9_phaseIncrRegLookup_0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u9_phaseIncrRegLookup_0_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_a) IS
                WHEN "010010111001" =>                     u9_phaseIncrRegLookup_0_e <= busIn_w;
                WHEN OTHERS =>
                    u9_phaseIncrRegLookup_0_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u9_phaseIncrReg_p0(REG,23)@11
    u9_phaseIncrReg_p0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u9_phaseIncrReg_p0_q <= "01000110000000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (u9_phaseIncrRegLookup_0_e = "1") THEN
                u9_phaseIncrReg_p0_q <= d_busIn_d_11_q(19 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u9_invertCos(BITSELECT,439)@20
    u9_invertCos_in <= u9_phaseIncrReg_p0_q(18 downto 0);
    u9_invertCos_b <= u9_invertCos_in(18 downto 18);

	--u9_accumAdd_b1(ADD,405)@10
    u9_accumAdd_b1_a <= u9_accumAdd_b1_q;
    u9_accumAdd_b1_b <= u9_phaseIncrReg_p0_q(17 downto 0);
    u9_accumAdd_b1_i <= xIn_p_9;
    u9_accumAdd_b1_a1 <= u9_accumAdd_b1_i WHEN (xIn_s_9 = "1") ELSE u9_accumAdd_b1_a;
    u9_accumAdd_b1_b1 <= (others => '0') WHEN (xIn_s_9 = "1") ELSE u9_accumAdd_b1_b;
    u9_accumAdd_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_accumAdd_b1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u9_accumAdd_b1_o <= STD_LOGIC_VECTOR(UNSIGNED(u9_accumAdd_b1_a1) + UNSIGNED(u9_accumAdd_b1_b1));
            END IF;
        END IF;
    END PROCESS;
    u9_accumAdd_b1_q <= u9_accumAdd_b1_o(17 downto 0);


	--u9_octantBitSelect(BITSELECT,407)@11
    u9_octantBitSelect_in <= u9_accumAdd_b1_q;
    u9_octantBitSelect_b <= u9_octantBitSelect_in(17 downto 15);

	--d_u9_octantBitSelect_b_19_replace_mem(DUALMEM,1200)
    d_u9_octantBitSelect_b_19_replace_mem_reset0 <= areset;
    d_u9_octantBitSelect_b_19_replace_mem_ia <= u9_octantBitSelect_b;
    d_u9_octantBitSelect_b_19_replace_mem_aa <= d_u0_octantBitSelect_b_19_replace_rdreg_q;
    d_u9_octantBitSelect_b_19_replace_mem_ab <= d_u0_octantBitSelect_b_19_replace_rdmux_q;
    d_u9_octantBitSelect_b_19_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 3,
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
        clocken1 => d_u0_octantBitSelect_b_19_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u9_octantBitSelect_b_19_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u9_octantBitSelect_b_19_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u9_octantBitSelect_b_19_replace_mem_iq,
        address_a => d_u9_octantBitSelect_b_19_replace_mem_aa,
        data_a => d_u9_octantBitSelect_b_19_replace_mem_ia
    );
        d_u9_octantBitSelect_b_19_replace_mem_q <= d_u9_octantBitSelect_b_19_replace_mem_iq(2 downto 0);

	--d_u9_octantBitSelect_b_20(DELAY,752)@19
    d_u9_octantBitSelect_b_20 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => d_u9_octantBitSelect_b_19_replace_mem_q, xout => d_u9_octantBitSelect_b_20_q, clk => clk, aclr => areset );

	--u9_cosJoin(BITJOIN,440)@20
    u9_cosJoin_q <= u9_invertCos_b & d_u9_octantBitSelect_b_20_q;

	--u9_doCosInvert(LOOKUP,441)@20
    u9_doCosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_doCosInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u9_cosJoin_q) IS
                WHEN "0000" =>  u9_doCosInvert_q <= "1";
                WHEN "0001" =>  u9_doCosInvert_q <= "1";
                WHEN "0010" =>  u9_doCosInvert_q <= "0";
                WHEN "0011" =>  u9_doCosInvert_q <= "0";
                WHEN "0100" =>  u9_doCosInvert_q <= "0";
                WHEN "0101" =>  u9_doCosInvert_q <= "0";
                WHEN "0110" =>  u9_doCosInvert_q <= "1";
                WHEN "0111" =>  u9_doCosInvert_q <= "1";
                WHEN "1000" =>  u9_doCosInvert_q <= "0";
                WHEN "1001" =>  u9_doCosInvert_q <= "0";
                WHEN "1010" =>  u9_doCosInvert_q <= "1";
                WHEN "1011" =>  u9_doCosInvert_q <= "1";
                WHEN "1100" =>  u9_doCosInvert_q <= "1";
                WHEN "1101" =>  u9_doCosInvert_q <= "1";
                WHEN "1110" =>  u9_doCosInvert_q <= "0";
                WHEN "1111" =>  u9_doCosInvert_q <= "0";
                WHEN OTHERS =>
                    u9_doCosInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u9_addnsubConst(LOOKUP,409)@11
    u9_addnsubConst: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_addnsubConst_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u9_octantBitSelect_b) IS
                WHEN "000" =>  u9_addnsubConst_q <= "1";
                WHEN "001" =>  u9_addnsubConst_q <= "0";
                WHEN "010" =>  u9_addnsubConst_q <= "1";
                WHEN "011" =>  u9_addnsubConst_q <= "0";
                WHEN "100" =>  u9_addnsubConst_q <= "1";
                WHEN "101" =>  u9_addnsubConst_q <= "0";
                WHEN "110" =>  u9_addnsubConst_q <= "1";
                WHEN "111" =>  u9_addnsubConst_q <= "0";
                WHEN OTHERS =>
                    u9_addnsubConst_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--d_u9_accumAdd_b1_q_12(DELAY,750)@11
    d_u9_accumAdd_b1_q_12 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => u9_accumAdd_b1_q, xout => d_u9_accumAdd_b1_q_12_q, clk => clk, aclr => areset );

	--u9_rangeLUT(LOOKUP,408)@11
    u9_rangeLUT: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_rangeLUT_q <= "0000000000000000000";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u9_octantBitSelect_b) IS
                WHEN "000" =>  u9_rangeLUT_q <= "0000000000000000000";
                WHEN "001" =>  u9_rangeLUT_q <= "0010000000000000000";
                WHEN "010" =>  u9_rangeLUT_q <= "1110000000000000000";
                WHEN "011" =>  u9_rangeLUT_q <= "0100000000000000000";
                WHEN "100" =>  u9_rangeLUT_q <= "1100000000000000000";
                WHEN "101" =>  u9_rangeLUT_q <= "0110000000000000000";
                WHEN "110" =>  u9_rangeLUT_q <= "1010000000000000000";
                WHEN "111" =>  u9_rangeLUT_q <= "1100000000000000000";
                WHEN OTHERS =>
                    u9_rangeLUT_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u9_rangeAddSub(ADDSUB,410)@12
    u9_rangeAddSub_cin <= GND_q;
    u9_rangeAddSub_a <= STD_LOGIC_VECTOR("0" & u9_rangeLUT_q) & u9_addnsubConst_q(0);
    u9_rangeAddSub_b <= STD_LOGIC_VECTOR("00" & d_u9_accumAdd_b1_q_12_q) & u9_rangeAddSub_cin(0);
    u9_rangeAddSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_rangeAddSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u9_addnsubConst_q = "1") THEN
                u9_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u9_rangeAddSub_a) + UNSIGNED(u9_rangeAddSub_b));
            ELSE
                u9_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u9_rangeAddSub_a) - UNSIGNED(u9_rangeAddSub_b));
            END IF;
        END IF;
    END PROCESS;
    u9_rangeAddSub_q <= u9_rangeAddSub_o(19 downto 1);


	--d_u9_rangeAddSub_q_18_replace_mem(DUALMEM,1212)
    d_u9_rangeAddSub_q_18_replace_mem_reset0 <= areset;
    d_u9_rangeAddSub_q_18_replace_mem_ia <= u9_rangeAddSub_q;
    d_u9_rangeAddSub_q_18_replace_mem_aa <= d_u0_rangeAddSub_q_18_replace_rdreg_q;
    d_u9_rangeAddSub_q_18_replace_mem_ab <= d_u0_rangeAddSub_q_18_replace_rdmux_q;
    d_u9_rangeAddSub_q_18_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 19,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 19,
        widthad_b => 2,
        numwords_b => 4,
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
        clocken1 => d_u0_rangeAddSub_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u9_rangeAddSub_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u9_rangeAddSub_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u9_rangeAddSub_q_18_replace_mem_iq,
        address_a => d_u9_rangeAddSub_q_18_replace_mem_aa,
        data_a => d_u9_rangeAddSub_q_18_replace_mem_ia
    );
        d_u9_rangeAddSub_q_18_replace_mem_q <= d_u9_rangeAddSub_q_18_replace_mem_iq(18 downto 0);

	--u9_alphaOverflowBitSelect(BITSELECT,412)@18
    u9_alphaOverflowBitSelect_in <= d_u9_rangeAddSub_q_18_replace_mem_q(15 downto 0);
    u9_alphaOverflowBitSelect_b <= u9_alphaOverflowBitSelect_in(15 downto 15);

	--u9_betaBitSelect(BITSELECT,413)@13
    u9_betaBitSelect_in <= u9_rangeAddSub_q(6 downto 0);
    u9_betaBitSelect_b <= u9_betaBitSelect_in(6 downto 0);

	--u9_ls4(BITSHIFT,420)@13
    u9_ls4_q_int <= u9_betaBitSelect_b & "0000";
    u9_ls4_q <= u9_ls4_q_int(10 downto 0);

	--u9_ls7(BITSHIFT,419)@13
    u9_ls7_q_int <= u9_betaBitSelect_b & "0000000";
    u9_ls7_q <= u9_ls7_q_int(13 downto 0);

	--u9_cm2(ADD,421)@13
    u9_cm2_a <= STD_LOGIC_VECTOR("0" & u9_ls7_q);
    u9_cm2_b <= STD_LOGIC_VECTOR("0000" & u9_ls4_q);
    u9_cm2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_cm2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u9_cm2_o <= STD_LOGIC_VECTOR(UNSIGNED(u9_cm2_a) + UNSIGNED(u9_cm2_b));
        END IF;
    END PROCESS;
    u9_cm2_q <= u9_cm2_o(14 downto 0);


	--u9_ls10(BITSHIFT,417)@13
    u9_ls10_q_int <= u9_betaBitSelect_b & "0000000000";
    u9_ls10_q <= u9_ls10_q_int(16 downto 0);

	--u9_ls12(BITSHIFT,416)@13
    u9_ls12_q_int <= u9_betaBitSelect_b & "000000000000";
    u9_ls12_q <= u9_ls12_q_int(18 downto 0);

	--u9_cm1(SUB,418)@13
    u9_cm1_a <= STD_LOGIC_VECTOR("0" & u9_ls12_q);
    u9_cm1_b <= STD_LOGIC_VECTOR("000" & u9_ls10_q);
    u9_cm1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_cm1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u9_cm1_o <= STD_LOGIC_VECTOR(UNSIGNED(u9_cm1_a) - UNSIGNED(u9_cm1_b));
        END IF;
    END PROCESS;
    u9_cm1_q <= u9_cm1_o(19 downto 0);


	--u9_cm3(ADD,422)@14
    u9_cm3_a <= STD_LOGIC_VECTOR("0" & u9_cm1_q);
    u9_cm3_b <= STD_LOGIC_VECTOR("000000" & u9_cm2_q);
    u9_cm3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_cm3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u9_cm3_o <= STD_LOGIC_VECTOR(UNSIGNED(u9_cm3_a) + UNSIGNED(u9_cm3_b));
        END IF;
    END PROCESS;
    u9_cm3_q <= u9_cm3_o(20 downto 0);


	--u9_beta_times_4_shift(BITSHIFT,423)@15
    u9_beta_times_4_shift_q_int <= u9_cm3_q(20 downto 1);
    u9_beta_times_4_shift_q <= u9_beta_times_4_shift_q_int(19 downto 0);

	--u9_beta_times_pi_over_4_shifted(BITSELECT,424)@15
    u9_beta_times_pi_over_4_shifted_in <= u9_beta_times_4_shift_q(17 downto 0);
    u9_beta_times_pi_over_4_shifted_b <= u9_beta_times_pi_over_4_shifted_in(17 downto 6);

	--u9_alphaBitSelect(BITSELECT,411)@13
    u9_alphaBitSelect_in <= u9_rangeAddSub_q(14 downto 0);
    u9_alphaBitSelect_b <= u9_alphaBitSelect_in(14 downto 7);

	--u9_cosTable(DUALMEM,415)@13
    u9_cosTable_reset0 <= areset;
    u9_cosTable_ia <= (others => '0');
    u9_cosTable_aa <= (others => '0');
    u9_cosTable_ab <= u9_alphaBitSelect_b;
    u9_cosTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u9_cosTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u9_cosTable_reset0,
        clock0 => clk,
        address_b => u9_cosTable_ab,
        -- data_b => (others => '0'),
        q_b => u9_cosTable_iq,
        address_a => u9_cosTable_aa,
        data_a => u9_cosTable_ia
    );
        u9_cosTable_q <= u9_cosTable_iq(11 downto 0);

	--u9_cosMult(MULT,426)@15
    u9_cosMult_pr <= UNSIGNED(u9_cosMult_a) * UNSIGNED(u9_cosMult_b);
    u9_cosMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_cosMult_a <= (others => '0');
            u9_cosMult_b <= (others => '0');
            u9_cosMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u9_cosMult_a <= u9_cosTable_q;
            u9_cosMult_b <= u9_beta_times_pi_over_4_shifted_b;
            u9_cosMult_s1 <= STD_LOGIC_VECTOR(u9_cosMult_pr);
        END IF;
    END PROCESS;
    u9_cosMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_cosMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u9_cosMult_q <= u9_cosMult_s1;
        END IF;
    END PROCESS;

	--u9_sinTable(DUALMEM,414)@13
    u9_sinTable_reset0 <= areset;
    u9_sinTable_ia <= (others => '0');
    u9_sinTable_aa <= (others => '0');
    u9_sinTable_ab <= u9_alphaBitSelect_b;
    u9_sinTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u9_sinTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u9_sinTable_reset0,
        clock0 => clk,
        address_b => u9_sinTable_ab,
        -- data_b => (others => '0'),
        q_b => u9_sinTable_iq,
        address_a => u9_sinTable_aa,
        data_a => u9_sinTable_ia
    );
        u9_sinTable_q <= u9_sinTable_iq(11 downto 0);

	--d_u9_sinTable_q_18_replace_mem(DUALMEM,1224)
    d_u9_sinTable_q_18_replace_mem_reset0 <= areset;
    d_u9_sinTable_q_18_replace_mem_ia <= u9_sinTable_q;
    d_u9_sinTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u9_sinTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u9_sinTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u9_sinTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u9_sinTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u9_sinTable_q_18_replace_mem_iq,
        address_a => d_u9_sinTable_q_18_replace_mem_aa,
        data_a => d_u9_sinTable_q_18_replace_mem_ia
    );
        d_u9_sinTable_q_18_replace_mem_q <= d_u9_sinTable_q_18_replace_mem_iq(11 downto 0);

	--u9_lsSinTable(BITSHIFT,427)@18
    u9_lsSinTable_q_int <= d_u9_sinTable_q_18_replace_mem_q & "00000000000000000000";
    u9_lsSinTable_q <= u9_lsSinTable_q_int(31 downto 0);

	--u9_sinAdd(ADD,431)@18
    u9_sinAdd_a <= u9_lsSinTable_q(31 downto 18);
    u9_sinAdd_b <= STD_LOGIC_VECTOR("00000000" & u9_cosMult_q(23 downto 18));
    u9_sinAdd_i <= u0_sin_pi_over_4_q;
    u9_sinAdd_a1 <= u9_sinAdd_i WHEN (u9_alphaOverflowBitSelect_b = "1") ELSE u9_sinAdd_a;
    u9_sinAdd_b1 <= (others => '0') WHEN (u9_alphaOverflowBitSelect_b = "1") ELSE u9_sinAdd_b;
    u9_sinAdd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_sinAdd_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u9_sinAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(u9_sinAdd_a1) + UNSIGNED(u9_sinAdd_b1));
        END IF;
    END PROCESS;
    u9_sinAdd_q <= u9_sinAdd_o(13 downto 0);


	--u9_roundedSin(ROUND,433)@19
    u9_roundedSin_in <= u9_sinAdd_q;
    u9_roundedSin: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_roundedSin_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u9_roundedSin_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u9_roundedSin_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u9_roundedSin_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u9_sinMult(MULT,425)@15
    u9_sinMult_pr <= UNSIGNED(u9_sinMult_a) * UNSIGNED(u9_sinMult_b);
    u9_sinMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_sinMult_a <= (others => '0');
            u9_sinMult_b <= (others => '0');
            u9_sinMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u9_sinMult_a <= u9_sinTable_q;
            u9_sinMult_b <= u9_beta_times_pi_over_4_shifted_b;
            u9_sinMult_s1 <= STD_LOGIC_VECTOR(u9_sinMult_pr);
        END IF;
    END PROCESS;
    u9_sinMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_sinMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u9_sinMult_q <= u9_sinMult_s1;
        END IF;
    END PROCESS;

	--d_u9_cosTable_q_18_replace_mem(DUALMEM,1234)
    d_u9_cosTable_q_18_replace_mem_reset0 <= areset;
    d_u9_cosTable_q_18_replace_mem_ia <= u9_cosTable_q;
    d_u9_cosTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u9_cosTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u9_cosTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u9_cosTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u9_cosTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u9_cosTable_q_18_replace_mem_iq,
        address_a => d_u9_cosTable_q_18_replace_mem_aa,
        data_a => d_u9_cosTable_q_18_replace_mem_ia
    );
        d_u9_cosTable_q_18_replace_mem_q <= d_u9_cosTable_q_18_replace_mem_iq(11 downto 0);

	--u9_lsCosTable(BITSHIFT,428)@18
    u9_lsCosTable_q_int <= d_u9_cosTable_q_18_replace_mem_q & "00000000000000000000";
    u9_lsCosTable_q <= u9_lsCosTable_q_int(31 downto 0);

	--u9_cosSub(SUB,432)@18
    u9_cosSub_a <= u9_lsCosTable_q(31 downto 18);
    u9_cosSub_b <= STD_LOGIC_VECTOR("00000000" & u9_sinMult_q(23 downto 18));
    u9_cosSub_i <= u0_sin_pi_over_4_q;
    u9_cosSub_a1 <= u9_cosSub_i WHEN (u9_alphaOverflowBitSelect_b = "1") ELSE u9_cosSub_a;
    u9_cosSub_b1 <= (others => '0') WHEN (u9_alphaOverflowBitSelect_b = "1") ELSE u9_cosSub_b;
    u9_cosSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_cosSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u9_cosSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u9_cosSub_a1) - UNSIGNED(u9_cosSub_b1));
        END IF;
    END PROCESS;
    u9_cosSub_q <= u9_cosSub_o(13 downto 0);


	--u9_roundedCos(ROUND,434)@19
    u9_roundedCos_in <= u9_cosSub_q;
    u9_roundedCos: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_roundedCos_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u9_roundedCos_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u9_roundedCos_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u9_roundedCos_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u9_doSwap(LOOKUP,435)@19
    u9_doSwap: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_doSwap_q <= "0";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (d_u9_octantBitSelect_b_19_replace_mem_q) IS
                WHEN "000" =>  u9_doSwap_q <= "0";
                WHEN "001" =>  u9_doSwap_q <= "1";
                WHEN "010" =>  u9_doSwap_q <= "1";
                WHEN "011" =>  u9_doSwap_q <= "0";
                WHEN "100" =>  u9_doSwap_q <= "0";
                WHEN "101" =>  u9_doSwap_q <= "1";
                WHEN "110" =>  u9_doSwap_q <= "1";
                WHEN "111" =>  u9_doSwap_q <= "0";
                WHEN OTHERS =>
                    u9_doSwap_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u9_cosSwapMux(MUX,443)@20
    u9_cosSwapMux_s <= u9_doSwap_q;
    u9_cosSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_cosSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u9_cosSwapMux_s IS
                      WHEN "0" => u9_cosSwapMux_q <= u9_roundedCos_q;
                      WHEN "1" => u9_cosSwapMux_q <= u9_roundedSin_q;
                      WHEN OTHERS => u9_cosSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u9_cosInvert(SUB,445)@21
    u9_cosInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u9_cosInvert_b <= u9_cosSwapMux_q;
    u9_cosInvert_i <= u9_cosInvert_b;
    u9_cosInvert_a1 <= u9_cosInvert_i WHEN (u9_doCosInvert_q = "1") ELSE u9_cosInvert_a;
    u9_cosInvert_b1 <= (others => '0') WHEN (u9_doCosInvert_q = "1") ELSE u9_cosInvert_b;
    u9_cosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_cosInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u9_cosInvert_o <= STD_LOGIC_VECTOR(SIGNED(u9_cosInvert_a1) - SIGNED(u9_cosInvert_b1));
        END IF;
    END PROCESS;
    u9_cosInvert_q <= u9_cosInvert_o(11 downto 0);


	--u8_phaseIncrRegLookup_0(LOOKUP,20)@10
    u8_phaseIncrRegLookup_0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u8_phaseIncrRegLookup_0_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_a) IS
                WHEN "010010111000" =>                     u8_phaseIncrRegLookup_0_e <= busIn_w;
                WHEN OTHERS =>
                    u8_phaseIncrRegLookup_0_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u8_phaseIncrReg_p0(REG,21)@11
    u8_phaseIncrReg_p0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u8_phaseIncrReg_p0_q <= "01000110000000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (u8_phaseIncrRegLookup_0_e = "1") THEN
                u8_phaseIncrReg_p0_q <= d_busIn_d_11_q(19 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u8_invertCos(BITSELECT,398)@20
    u8_invertCos_in <= u8_phaseIncrReg_p0_q(18 downto 0);
    u8_invertCos_b <= u8_invertCos_in(18 downto 18);

	--u8_accumAdd_b1(ADD,364)@10
    u8_accumAdd_b1_a <= u8_accumAdd_b1_q;
    u8_accumAdd_b1_b <= u8_phaseIncrReg_p0_q(17 downto 0);
    u8_accumAdd_b1_i <= xIn_p_8;
    u8_accumAdd_b1_a1 <= u8_accumAdd_b1_i WHEN (xIn_s_8 = "1") ELSE u8_accumAdd_b1_a;
    u8_accumAdd_b1_b1 <= (others => '0') WHEN (xIn_s_8 = "1") ELSE u8_accumAdd_b1_b;
    u8_accumAdd_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_accumAdd_b1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u8_accumAdd_b1_o <= STD_LOGIC_VECTOR(UNSIGNED(u8_accumAdd_b1_a1) + UNSIGNED(u8_accumAdd_b1_b1));
            END IF;
        END IF;
    END PROCESS;
    u8_accumAdd_b1_q <= u8_accumAdd_b1_o(17 downto 0);


	--u8_octantBitSelect(BITSELECT,366)@11
    u8_octantBitSelect_in <= u8_accumAdd_b1_q;
    u8_octantBitSelect_b <= u8_octantBitSelect_in(17 downto 15);

	--d_u8_octantBitSelect_b_19_replace_mem(DUALMEM,1156)
    d_u8_octantBitSelect_b_19_replace_mem_reset0 <= areset;
    d_u8_octantBitSelect_b_19_replace_mem_ia <= u8_octantBitSelect_b;
    d_u8_octantBitSelect_b_19_replace_mem_aa <= d_u0_octantBitSelect_b_19_replace_rdreg_q;
    d_u8_octantBitSelect_b_19_replace_mem_ab <= d_u0_octantBitSelect_b_19_replace_rdmux_q;
    d_u8_octantBitSelect_b_19_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 3,
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
        clocken1 => d_u0_octantBitSelect_b_19_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u8_octantBitSelect_b_19_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u8_octantBitSelect_b_19_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u8_octantBitSelect_b_19_replace_mem_iq,
        address_a => d_u8_octantBitSelect_b_19_replace_mem_aa,
        data_a => d_u8_octantBitSelect_b_19_replace_mem_ia
    );
        d_u8_octantBitSelect_b_19_replace_mem_q <= d_u8_octantBitSelect_b_19_replace_mem_iq(2 downto 0);

	--d_u8_octantBitSelect_b_20(DELAY,746)@19
    d_u8_octantBitSelect_b_20 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => d_u8_octantBitSelect_b_19_replace_mem_q, xout => d_u8_octantBitSelect_b_20_q, clk => clk, aclr => areset );

	--u8_cosJoin(BITJOIN,399)@20
    u8_cosJoin_q <= u8_invertCos_b & d_u8_octantBitSelect_b_20_q;

	--u8_doCosInvert(LOOKUP,400)@20
    u8_doCosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_doCosInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u8_cosJoin_q) IS
                WHEN "0000" =>  u8_doCosInvert_q <= "1";
                WHEN "0001" =>  u8_doCosInvert_q <= "1";
                WHEN "0010" =>  u8_doCosInvert_q <= "0";
                WHEN "0011" =>  u8_doCosInvert_q <= "0";
                WHEN "0100" =>  u8_doCosInvert_q <= "0";
                WHEN "0101" =>  u8_doCosInvert_q <= "0";
                WHEN "0110" =>  u8_doCosInvert_q <= "1";
                WHEN "0111" =>  u8_doCosInvert_q <= "1";
                WHEN "1000" =>  u8_doCosInvert_q <= "0";
                WHEN "1001" =>  u8_doCosInvert_q <= "0";
                WHEN "1010" =>  u8_doCosInvert_q <= "1";
                WHEN "1011" =>  u8_doCosInvert_q <= "1";
                WHEN "1100" =>  u8_doCosInvert_q <= "1";
                WHEN "1101" =>  u8_doCosInvert_q <= "1";
                WHEN "1110" =>  u8_doCosInvert_q <= "0";
                WHEN "1111" =>  u8_doCosInvert_q <= "0";
                WHEN OTHERS =>
                    u8_doCosInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u8_addnsubConst(LOOKUP,368)@11
    u8_addnsubConst: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_addnsubConst_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u8_octantBitSelect_b) IS
                WHEN "000" =>  u8_addnsubConst_q <= "1";
                WHEN "001" =>  u8_addnsubConst_q <= "0";
                WHEN "010" =>  u8_addnsubConst_q <= "1";
                WHEN "011" =>  u8_addnsubConst_q <= "0";
                WHEN "100" =>  u8_addnsubConst_q <= "1";
                WHEN "101" =>  u8_addnsubConst_q <= "0";
                WHEN "110" =>  u8_addnsubConst_q <= "1";
                WHEN "111" =>  u8_addnsubConst_q <= "0";
                WHEN OTHERS =>
                    u8_addnsubConst_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--d_u8_accumAdd_b1_q_12(DELAY,744)@11
    d_u8_accumAdd_b1_q_12 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => u8_accumAdd_b1_q, xout => d_u8_accumAdd_b1_q_12_q, clk => clk, aclr => areset );

	--u8_rangeLUT(LOOKUP,367)@11
    u8_rangeLUT: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_rangeLUT_q <= "0000000000000000000";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u8_octantBitSelect_b) IS
                WHEN "000" =>  u8_rangeLUT_q <= "0000000000000000000";
                WHEN "001" =>  u8_rangeLUT_q <= "0010000000000000000";
                WHEN "010" =>  u8_rangeLUT_q <= "1110000000000000000";
                WHEN "011" =>  u8_rangeLUT_q <= "0100000000000000000";
                WHEN "100" =>  u8_rangeLUT_q <= "1100000000000000000";
                WHEN "101" =>  u8_rangeLUT_q <= "0110000000000000000";
                WHEN "110" =>  u8_rangeLUT_q <= "1010000000000000000";
                WHEN "111" =>  u8_rangeLUT_q <= "1100000000000000000";
                WHEN OTHERS =>
                    u8_rangeLUT_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u8_rangeAddSub(ADDSUB,369)@12
    u8_rangeAddSub_cin <= GND_q;
    u8_rangeAddSub_a <= STD_LOGIC_VECTOR("0" & u8_rangeLUT_q) & u8_addnsubConst_q(0);
    u8_rangeAddSub_b <= STD_LOGIC_VECTOR("00" & d_u8_accumAdd_b1_q_12_q) & u8_rangeAddSub_cin(0);
    u8_rangeAddSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_rangeAddSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u8_addnsubConst_q = "1") THEN
                u8_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u8_rangeAddSub_a) + UNSIGNED(u8_rangeAddSub_b));
            ELSE
                u8_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u8_rangeAddSub_a) - UNSIGNED(u8_rangeAddSub_b));
            END IF;
        END IF;
    END PROCESS;
    u8_rangeAddSub_q <= u8_rangeAddSub_o(19 downto 1);


	--d_u8_rangeAddSub_q_18_replace_mem(DUALMEM,1168)
    d_u8_rangeAddSub_q_18_replace_mem_reset0 <= areset;
    d_u8_rangeAddSub_q_18_replace_mem_ia <= u8_rangeAddSub_q;
    d_u8_rangeAddSub_q_18_replace_mem_aa <= d_u0_rangeAddSub_q_18_replace_rdreg_q;
    d_u8_rangeAddSub_q_18_replace_mem_ab <= d_u0_rangeAddSub_q_18_replace_rdmux_q;
    d_u8_rangeAddSub_q_18_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 19,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 19,
        widthad_b => 2,
        numwords_b => 4,
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
        clocken1 => d_u0_rangeAddSub_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u8_rangeAddSub_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u8_rangeAddSub_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u8_rangeAddSub_q_18_replace_mem_iq,
        address_a => d_u8_rangeAddSub_q_18_replace_mem_aa,
        data_a => d_u8_rangeAddSub_q_18_replace_mem_ia
    );
        d_u8_rangeAddSub_q_18_replace_mem_q <= d_u8_rangeAddSub_q_18_replace_mem_iq(18 downto 0);

	--u8_alphaOverflowBitSelect(BITSELECT,371)@18
    u8_alphaOverflowBitSelect_in <= d_u8_rangeAddSub_q_18_replace_mem_q(15 downto 0);
    u8_alphaOverflowBitSelect_b <= u8_alphaOverflowBitSelect_in(15 downto 15);

	--u8_betaBitSelect(BITSELECT,372)@13
    u8_betaBitSelect_in <= u8_rangeAddSub_q(6 downto 0);
    u8_betaBitSelect_b <= u8_betaBitSelect_in(6 downto 0);

	--u8_ls4(BITSHIFT,379)@13
    u8_ls4_q_int <= u8_betaBitSelect_b & "0000";
    u8_ls4_q <= u8_ls4_q_int(10 downto 0);

	--u8_ls7(BITSHIFT,378)@13
    u8_ls7_q_int <= u8_betaBitSelect_b & "0000000";
    u8_ls7_q <= u8_ls7_q_int(13 downto 0);

	--u8_cm2(ADD,380)@13
    u8_cm2_a <= STD_LOGIC_VECTOR("0" & u8_ls7_q);
    u8_cm2_b <= STD_LOGIC_VECTOR("0000" & u8_ls4_q);
    u8_cm2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_cm2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u8_cm2_o <= STD_LOGIC_VECTOR(UNSIGNED(u8_cm2_a) + UNSIGNED(u8_cm2_b));
        END IF;
    END PROCESS;
    u8_cm2_q <= u8_cm2_o(14 downto 0);


	--u8_ls10(BITSHIFT,376)@13
    u8_ls10_q_int <= u8_betaBitSelect_b & "0000000000";
    u8_ls10_q <= u8_ls10_q_int(16 downto 0);

	--u8_ls12(BITSHIFT,375)@13
    u8_ls12_q_int <= u8_betaBitSelect_b & "000000000000";
    u8_ls12_q <= u8_ls12_q_int(18 downto 0);

	--u8_cm1(SUB,377)@13
    u8_cm1_a <= STD_LOGIC_VECTOR("0" & u8_ls12_q);
    u8_cm1_b <= STD_LOGIC_VECTOR("000" & u8_ls10_q);
    u8_cm1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_cm1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u8_cm1_o <= STD_LOGIC_VECTOR(UNSIGNED(u8_cm1_a) - UNSIGNED(u8_cm1_b));
        END IF;
    END PROCESS;
    u8_cm1_q <= u8_cm1_o(19 downto 0);


	--u8_cm3(ADD,381)@14
    u8_cm3_a <= STD_LOGIC_VECTOR("0" & u8_cm1_q);
    u8_cm3_b <= STD_LOGIC_VECTOR("000000" & u8_cm2_q);
    u8_cm3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_cm3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u8_cm3_o <= STD_LOGIC_VECTOR(UNSIGNED(u8_cm3_a) + UNSIGNED(u8_cm3_b));
        END IF;
    END PROCESS;
    u8_cm3_q <= u8_cm3_o(20 downto 0);


	--u8_beta_times_4_shift(BITSHIFT,382)@15
    u8_beta_times_4_shift_q_int <= u8_cm3_q(20 downto 1);
    u8_beta_times_4_shift_q <= u8_beta_times_4_shift_q_int(19 downto 0);

	--u8_beta_times_pi_over_4_shifted(BITSELECT,383)@15
    u8_beta_times_pi_over_4_shifted_in <= u8_beta_times_4_shift_q(17 downto 0);
    u8_beta_times_pi_over_4_shifted_b <= u8_beta_times_pi_over_4_shifted_in(17 downto 6);

	--u8_alphaBitSelect(BITSELECT,370)@13
    u8_alphaBitSelect_in <= u8_rangeAddSub_q(14 downto 0);
    u8_alphaBitSelect_b <= u8_alphaBitSelect_in(14 downto 7);

	--u8_cosTable(DUALMEM,374)@13
    u8_cosTable_reset0 <= areset;
    u8_cosTable_ia <= (others => '0');
    u8_cosTable_aa <= (others => '0');
    u8_cosTable_ab <= u8_alphaBitSelect_b;
    u8_cosTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u8_cosTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u8_cosTable_reset0,
        clock0 => clk,
        address_b => u8_cosTable_ab,
        -- data_b => (others => '0'),
        q_b => u8_cosTable_iq,
        address_a => u8_cosTable_aa,
        data_a => u8_cosTable_ia
    );
        u8_cosTable_q <= u8_cosTable_iq(11 downto 0);

	--u8_cosMult(MULT,385)@15
    u8_cosMult_pr <= UNSIGNED(u8_cosMult_a) * UNSIGNED(u8_cosMult_b);
    u8_cosMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_cosMult_a <= (others => '0');
            u8_cosMult_b <= (others => '0');
            u8_cosMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u8_cosMult_a <= u8_cosTable_q;
            u8_cosMult_b <= u8_beta_times_pi_over_4_shifted_b;
            u8_cosMult_s1 <= STD_LOGIC_VECTOR(u8_cosMult_pr);
        END IF;
    END PROCESS;
    u8_cosMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_cosMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u8_cosMult_q <= u8_cosMult_s1;
        END IF;
    END PROCESS;

	--u8_sinTable(DUALMEM,373)@13
    u8_sinTable_reset0 <= areset;
    u8_sinTable_ia <= (others => '0');
    u8_sinTable_aa <= (others => '0');
    u8_sinTable_ab <= u8_alphaBitSelect_b;
    u8_sinTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u8_sinTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u8_sinTable_reset0,
        clock0 => clk,
        address_b => u8_sinTable_ab,
        -- data_b => (others => '0'),
        q_b => u8_sinTable_iq,
        address_a => u8_sinTable_aa,
        data_a => u8_sinTable_ia
    );
        u8_sinTable_q <= u8_sinTable_iq(11 downto 0);

	--d_u8_sinTable_q_18_replace_mem(DUALMEM,1180)
    d_u8_sinTable_q_18_replace_mem_reset0 <= areset;
    d_u8_sinTable_q_18_replace_mem_ia <= u8_sinTable_q;
    d_u8_sinTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u8_sinTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u8_sinTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u8_sinTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u8_sinTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u8_sinTable_q_18_replace_mem_iq,
        address_a => d_u8_sinTable_q_18_replace_mem_aa,
        data_a => d_u8_sinTable_q_18_replace_mem_ia
    );
        d_u8_sinTable_q_18_replace_mem_q <= d_u8_sinTable_q_18_replace_mem_iq(11 downto 0);

	--u8_lsSinTable(BITSHIFT,386)@18
    u8_lsSinTable_q_int <= d_u8_sinTable_q_18_replace_mem_q & "00000000000000000000";
    u8_lsSinTable_q <= u8_lsSinTable_q_int(31 downto 0);

	--u8_sinAdd(ADD,390)@18
    u8_sinAdd_a <= u8_lsSinTable_q(31 downto 18);
    u8_sinAdd_b <= STD_LOGIC_VECTOR("00000000" & u8_cosMult_q(23 downto 18));
    u8_sinAdd_i <= u0_sin_pi_over_4_q;
    u8_sinAdd_a1 <= u8_sinAdd_i WHEN (u8_alphaOverflowBitSelect_b = "1") ELSE u8_sinAdd_a;
    u8_sinAdd_b1 <= (others => '0') WHEN (u8_alphaOverflowBitSelect_b = "1") ELSE u8_sinAdd_b;
    u8_sinAdd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_sinAdd_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u8_sinAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(u8_sinAdd_a1) + UNSIGNED(u8_sinAdd_b1));
        END IF;
    END PROCESS;
    u8_sinAdd_q <= u8_sinAdd_o(13 downto 0);


	--u8_roundedSin(ROUND,392)@19
    u8_roundedSin_in <= u8_sinAdd_q;
    u8_roundedSin: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_roundedSin_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u8_roundedSin_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u8_roundedSin_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u8_roundedSin_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u8_sinMult(MULT,384)@15
    u8_sinMult_pr <= UNSIGNED(u8_sinMult_a) * UNSIGNED(u8_sinMult_b);
    u8_sinMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_sinMult_a <= (others => '0');
            u8_sinMult_b <= (others => '0');
            u8_sinMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u8_sinMult_a <= u8_sinTable_q;
            u8_sinMult_b <= u8_beta_times_pi_over_4_shifted_b;
            u8_sinMult_s1 <= STD_LOGIC_VECTOR(u8_sinMult_pr);
        END IF;
    END PROCESS;
    u8_sinMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_sinMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u8_sinMult_q <= u8_sinMult_s1;
        END IF;
    END PROCESS;

	--d_u8_cosTable_q_18_replace_mem(DUALMEM,1190)
    d_u8_cosTable_q_18_replace_mem_reset0 <= areset;
    d_u8_cosTable_q_18_replace_mem_ia <= u8_cosTable_q;
    d_u8_cosTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u8_cosTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u8_cosTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u8_cosTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u8_cosTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u8_cosTable_q_18_replace_mem_iq,
        address_a => d_u8_cosTable_q_18_replace_mem_aa,
        data_a => d_u8_cosTable_q_18_replace_mem_ia
    );
        d_u8_cosTable_q_18_replace_mem_q <= d_u8_cosTable_q_18_replace_mem_iq(11 downto 0);

	--u8_lsCosTable(BITSHIFT,387)@18
    u8_lsCosTable_q_int <= d_u8_cosTable_q_18_replace_mem_q & "00000000000000000000";
    u8_lsCosTable_q <= u8_lsCosTable_q_int(31 downto 0);

	--u8_cosSub(SUB,391)@18
    u8_cosSub_a <= u8_lsCosTable_q(31 downto 18);
    u8_cosSub_b <= STD_LOGIC_VECTOR("00000000" & u8_sinMult_q(23 downto 18));
    u8_cosSub_i <= u0_sin_pi_over_4_q;
    u8_cosSub_a1 <= u8_cosSub_i WHEN (u8_alphaOverflowBitSelect_b = "1") ELSE u8_cosSub_a;
    u8_cosSub_b1 <= (others => '0') WHEN (u8_alphaOverflowBitSelect_b = "1") ELSE u8_cosSub_b;
    u8_cosSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_cosSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u8_cosSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u8_cosSub_a1) - UNSIGNED(u8_cosSub_b1));
        END IF;
    END PROCESS;
    u8_cosSub_q <= u8_cosSub_o(13 downto 0);


	--u8_roundedCos(ROUND,393)@19
    u8_roundedCos_in <= u8_cosSub_q;
    u8_roundedCos: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_roundedCos_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u8_roundedCos_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u8_roundedCos_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u8_roundedCos_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u8_doSwap(LOOKUP,394)@19
    u8_doSwap: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_doSwap_q <= "0";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (d_u8_octantBitSelect_b_19_replace_mem_q) IS
                WHEN "000" =>  u8_doSwap_q <= "0";
                WHEN "001" =>  u8_doSwap_q <= "1";
                WHEN "010" =>  u8_doSwap_q <= "1";
                WHEN "011" =>  u8_doSwap_q <= "0";
                WHEN "100" =>  u8_doSwap_q <= "0";
                WHEN "101" =>  u8_doSwap_q <= "1";
                WHEN "110" =>  u8_doSwap_q <= "1";
                WHEN "111" =>  u8_doSwap_q <= "0";
                WHEN OTHERS =>
                    u8_doSwap_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u8_cosSwapMux(MUX,402)@20
    u8_cosSwapMux_s <= u8_doSwap_q;
    u8_cosSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_cosSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u8_cosSwapMux_s IS
                      WHEN "0" => u8_cosSwapMux_q <= u8_roundedCos_q;
                      WHEN "1" => u8_cosSwapMux_q <= u8_roundedSin_q;
                      WHEN OTHERS => u8_cosSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u8_cosInvert(SUB,404)@21
    u8_cosInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u8_cosInvert_b <= u8_cosSwapMux_q;
    u8_cosInvert_i <= u8_cosInvert_b;
    u8_cosInvert_a1 <= u8_cosInvert_i WHEN (u8_doCosInvert_q = "1") ELSE u8_cosInvert_a;
    u8_cosInvert_b1 <= (others => '0') WHEN (u8_doCosInvert_q = "1") ELSE u8_cosInvert_b;
    u8_cosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_cosInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u8_cosInvert_o <= STD_LOGIC_VECTOR(SIGNED(u8_cosInvert_a1) - SIGNED(u8_cosInvert_b1));
        END IF;
    END PROCESS;
    u8_cosInvert_q <= u8_cosInvert_o(11 downto 0);


	--u7_phaseIncrRegLookup_0(LOOKUP,18)@10
    u7_phaseIncrRegLookup_0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u7_phaseIncrRegLookup_0_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_a) IS
                WHEN "010010110111" =>                     u7_phaseIncrRegLookup_0_e <= busIn_w;
                WHEN OTHERS =>
                    u7_phaseIncrRegLookup_0_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u7_phaseIncrReg_p0(REG,19)@11
    u7_phaseIncrReg_p0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u7_phaseIncrReg_p0_q <= "01000110000000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (u7_phaseIncrRegLookup_0_e = "1") THEN
                u7_phaseIncrReg_p0_q <= d_busIn_d_11_q(19 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u7_invertCos(BITSELECT,357)@20
    u7_invertCos_in <= u7_phaseIncrReg_p0_q(18 downto 0);
    u7_invertCos_b <= u7_invertCos_in(18 downto 18);

	--u7_accumAdd_b1(ADD,323)@10
    u7_accumAdd_b1_a <= u7_accumAdd_b1_q;
    u7_accumAdd_b1_b <= u7_phaseIncrReg_p0_q(17 downto 0);
    u7_accumAdd_b1_i <= xIn_p_7;
    u7_accumAdd_b1_a1 <= u7_accumAdd_b1_i WHEN (xIn_s_7 = "1") ELSE u7_accumAdd_b1_a;
    u7_accumAdd_b1_b1 <= (others => '0') WHEN (xIn_s_7 = "1") ELSE u7_accumAdd_b1_b;
    u7_accumAdd_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_accumAdd_b1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u7_accumAdd_b1_o <= STD_LOGIC_VECTOR(UNSIGNED(u7_accumAdd_b1_a1) + UNSIGNED(u7_accumAdd_b1_b1));
            END IF;
        END IF;
    END PROCESS;
    u7_accumAdd_b1_q <= u7_accumAdd_b1_o(17 downto 0);


	--u7_octantBitSelect(BITSELECT,325)@11
    u7_octantBitSelect_in <= u7_accumAdd_b1_q;
    u7_octantBitSelect_b <= u7_octantBitSelect_in(17 downto 15);

	--d_u7_octantBitSelect_b_19_replace_mem(DUALMEM,1112)
    d_u7_octantBitSelect_b_19_replace_mem_reset0 <= areset;
    d_u7_octantBitSelect_b_19_replace_mem_ia <= u7_octantBitSelect_b;
    d_u7_octantBitSelect_b_19_replace_mem_aa <= d_u0_octantBitSelect_b_19_replace_rdreg_q;
    d_u7_octantBitSelect_b_19_replace_mem_ab <= d_u0_octantBitSelect_b_19_replace_rdmux_q;
    d_u7_octantBitSelect_b_19_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 3,
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
        clocken1 => d_u0_octantBitSelect_b_19_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u7_octantBitSelect_b_19_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u7_octantBitSelect_b_19_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u7_octantBitSelect_b_19_replace_mem_iq,
        address_a => d_u7_octantBitSelect_b_19_replace_mem_aa,
        data_a => d_u7_octantBitSelect_b_19_replace_mem_ia
    );
        d_u7_octantBitSelect_b_19_replace_mem_q <= d_u7_octantBitSelect_b_19_replace_mem_iq(2 downto 0);

	--d_u7_octantBitSelect_b_20(DELAY,740)@19
    d_u7_octantBitSelect_b_20 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => d_u7_octantBitSelect_b_19_replace_mem_q, xout => d_u7_octantBitSelect_b_20_q, clk => clk, aclr => areset );

	--u7_cosJoin(BITJOIN,358)@20
    u7_cosJoin_q <= u7_invertCos_b & d_u7_octantBitSelect_b_20_q;

	--u7_doCosInvert(LOOKUP,359)@20
    u7_doCosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_doCosInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u7_cosJoin_q) IS
                WHEN "0000" =>  u7_doCosInvert_q <= "1";
                WHEN "0001" =>  u7_doCosInvert_q <= "1";
                WHEN "0010" =>  u7_doCosInvert_q <= "0";
                WHEN "0011" =>  u7_doCosInvert_q <= "0";
                WHEN "0100" =>  u7_doCosInvert_q <= "0";
                WHEN "0101" =>  u7_doCosInvert_q <= "0";
                WHEN "0110" =>  u7_doCosInvert_q <= "1";
                WHEN "0111" =>  u7_doCosInvert_q <= "1";
                WHEN "1000" =>  u7_doCosInvert_q <= "0";
                WHEN "1001" =>  u7_doCosInvert_q <= "0";
                WHEN "1010" =>  u7_doCosInvert_q <= "1";
                WHEN "1011" =>  u7_doCosInvert_q <= "1";
                WHEN "1100" =>  u7_doCosInvert_q <= "1";
                WHEN "1101" =>  u7_doCosInvert_q <= "1";
                WHEN "1110" =>  u7_doCosInvert_q <= "0";
                WHEN "1111" =>  u7_doCosInvert_q <= "0";
                WHEN OTHERS =>
                    u7_doCosInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u7_addnsubConst(LOOKUP,327)@11
    u7_addnsubConst: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_addnsubConst_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u7_octantBitSelect_b) IS
                WHEN "000" =>  u7_addnsubConst_q <= "1";
                WHEN "001" =>  u7_addnsubConst_q <= "0";
                WHEN "010" =>  u7_addnsubConst_q <= "1";
                WHEN "011" =>  u7_addnsubConst_q <= "0";
                WHEN "100" =>  u7_addnsubConst_q <= "1";
                WHEN "101" =>  u7_addnsubConst_q <= "0";
                WHEN "110" =>  u7_addnsubConst_q <= "1";
                WHEN "111" =>  u7_addnsubConst_q <= "0";
                WHEN OTHERS =>
                    u7_addnsubConst_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--d_u7_accumAdd_b1_q_12(DELAY,738)@11
    d_u7_accumAdd_b1_q_12 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => u7_accumAdd_b1_q, xout => d_u7_accumAdd_b1_q_12_q, clk => clk, aclr => areset );

	--u7_rangeLUT(LOOKUP,326)@11
    u7_rangeLUT: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_rangeLUT_q <= "0000000000000000000";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u7_octantBitSelect_b) IS
                WHEN "000" =>  u7_rangeLUT_q <= "0000000000000000000";
                WHEN "001" =>  u7_rangeLUT_q <= "0010000000000000000";
                WHEN "010" =>  u7_rangeLUT_q <= "1110000000000000000";
                WHEN "011" =>  u7_rangeLUT_q <= "0100000000000000000";
                WHEN "100" =>  u7_rangeLUT_q <= "1100000000000000000";
                WHEN "101" =>  u7_rangeLUT_q <= "0110000000000000000";
                WHEN "110" =>  u7_rangeLUT_q <= "1010000000000000000";
                WHEN "111" =>  u7_rangeLUT_q <= "1100000000000000000";
                WHEN OTHERS =>
                    u7_rangeLUT_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u7_rangeAddSub(ADDSUB,328)@12
    u7_rangeAddSub_cin <= GND_q;
    u7_rangeAddSub_a <= STD_LOGIC_VECTOR("0" & u7_rangeLUT_q) & u7_addnsubConst_q(0);
    u7_rangeAddSub_b <= STD_LOGIC_VECTOR("00" & d_u7_accumAdd_b1_q_12_q) & u7_rangeAddSub_cin(0);
    u7_rangeAddSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_rangeAddSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u7_addnsubConst_q = "1") THEN
                u7_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u7_rangeAddSub_a) + UNSIGNED(u7_rangeAddSub_b));
            ELSE
                u7_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u7_rangeAddSub_a) - UNSIGNED(u7_rangeAddSub_b));
            END IF;
        END IF;
    END PROCESS;
    u7_rangeAddSub_q <= u7_rangeAddSub_o(19 downto 1);


	--d_u7_rangeAddSub_q_18_replace_mem(DUALMEM,1124)
    d_u7_rangeAddSub_q_18_replace_mem_reset0 <= areset;
    d_u7_rangeAddSub_q_18_replace_mem_ia <= u7_rangeAddSub_q;
    d_u7_rangeAddSub_q_18_replace_mem_aa <= d_u0_rangeAddSub_q_18_replace_rdreg_q;
    d_u7_rangeAddSub_q_18_replace_mem_ab <= d_u0_rangeAddSub_q_18_replace_rdmux_q;
    d_u7_rangeAddSub_q_18_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 19,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 19,
        widthad_b => 2,
        numwords_b => 4,
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
        clocken1 => d_u0_rangeAddSub_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u7_rangeAddSub_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u7_rangeAddSub_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u7_rangeAddSub_q_18_replace_mem_iq,
        address_a => d_u7_rangeAddSub_q_18_replace_mem_aa,
        data_a => d_u7_rangeAddSub_q_18_replace_mem_ia
    );
        d_u7_rangeAddSub_q_18_replace_mem_q <= d_u7_rangeAddSub_q_18_replace_mem_iq(18 downto 0);

	--u7_alphaOverflowBitSelect(BITSELECT,330)@18
    u7_alphaOverflowBitSelect_in <= d_u7_rangeAddSub_q_18_replace_mem_q(15 downto 0);
    u7_alphaOverflowBitSelect_b <= u7_alphaOverflowBitSelect_in(15 downto 15);

	--u7_betaBitSelect(BITSELECT,331)@13
    u7_betaBitSelect_in <= u7_rangeAddSub_q(6 downto 0);
    u7_betaBitSelect_b <= u7_betaBitSelect_in(6 downto 0);

	--u7_ls4(BITSHIFT,338)@13
    u7_ls4_q_int <= u7_betaBitSelect_b & "0000";
    u7_ls4_q <= u7_ls4_q_int(10 downto 0);

	--u7_ls7(BITSHIFT,337)@13
    u7_ls7_q_int <= u7_betaBitSelect_b & "0000000";
    u7_ls7_q <= u7_ls7_q_int(13 downto 0);

	--u7_cm2(ADD,339)@13
    u7_cm2_a <= STD_LOGIC_VECTOR("0" & u7_ls7_q);
    u7_cm2_b <= STD_LOGIC_VECTOR("0000" & u7_ls4_q);
    u7_cm2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_cm2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u7_cm2_o <= STD_LOGIC_VECTOR(UNSIGNED(u7_cm2_a) + UNSIGNED(u7_cm2_b));
        END IF;
    END PROCESS;
    u7_cm2_q <= u7_cm2_o(14 downto 0);


	--u7_ls10(BITSHIFT,335)@13
    u7_ls10_q_int <= u7_betaBitSelect_b & "0000000000";
    u7_ls10_q <= u7_ls10_q_int(16 downto 0);

	--u7_ls12(BITSHIFT,334)@13
    u7_ls12_q_int <= u7_betaBitSelect_b & "000000000000";
    u7_ls12_q <= u7_ls12_q_int(18 downto 0);

	--u7_cm1(SUB,336)@13
    u7_cm1_a <= STD_LOGIC_VECTOR("0" & u7_ls12_q);
    u7_cm1_b <= STD_LOGIC_VECTOR("000" & u7_ls10_q);
    u7_cm1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_cm1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u7_cm1_o <= STD_LOGIC_VECTOR(UNSIGNED(u7_cm1_a) - UNSIGNED(u7_cm1_b));
        END IF;
    END PROCESS;
    u7_cm1_q <= u7_cm1_o(19 downto 0);


	--u7_cm3(ADD,340)@14
    u7_cm3_a <= STD_LOGIC_VECTOR("0" & u7_cm1_q);
    u7_cm3_b <= STD_LOGIC_VECTOR("000000" & u7_cm2_q);
    u7_cm3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_cm3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u7_cm3_o <= STD_LOGIC_VECTOR(UNSIGNED(u7_cm3_a) + UNSIGNED(u7_cm3_b));
        END IF;
    END PROCESS;
    u7_cm3_q <= u7_cm3_o(20 downto 0);


	--u7_beta_times_4_shift(BITSHIFT,341)@15
    u7_beta_times_4_shift_q_int <= u7_cm3_q(20 downto 1);
    u7_beta_times_4_shift_q <= u7_beta_times_4_shift_q_int(19 downto 0);

	--u7_beta_times_pi_over_4_shifted(BITSELECT,342)@15
    u7_beta_times_pi_over_4_shifted_in <= u7_beta_times_4_shift_q(17 downto 0);
    u7_beta_times_pi_over_4_shifted_b <= u7_beta_times_pi_over_4_shifted_in(17 downto 6);

	--u7_alphaBitSelect(BITSELECT,329)@13
    u7_alphaBitSelect_in <= u7_rangeAddSub_q(14 downto 0);
    u7_alphaBitSelect_b <= u7_alphaBitSelect_in(14 downto 7);

	--u7_cosTable(DUALMEM,333)@13
    u7_cosTable_reset0 <= areset;
    u7_cosTable_ia <= (others => '0');
    u7_cosTable_aa <= (others => '0');
    u7_cosTable_ab <= u7_alphaBitSelect_b;
    u7_cosTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u7_cosTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u7_cosTable_reset0,
        clock0 => clk,
        address_b => u7_cosTable_ab,
        -- data_b => (others => '0'),
        q_b => u7_cosTable_iq,
        address_a => u7_cosTable_aa,
        data_a => u7_cosTable_ia
    );
        u7_cosTable_q <= u7_cosTable_iq(11 downto 0);

	--u7_cosMult(MULT,344)@15
    u7_cosMult_pr <= UNSIGNED(u7_cosMult_a) * UNSIGNED(u7_cosMult_b);
    u7_cosMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_cosMult_a <= (others => '0');
            u7_cosMult_b <= (others => '0');
            u7_cosMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u7_cosMult_a <= u7_cosTable_q;
            u7_cosMult_b <= u7_beta_times_pi_over_4_shifted_b;
            u7_cosMult_s1 <= STD_LOGIC_VECTOR(u7_cosMult_pr);
        END IF;
    END PROCESS;
    u7_cosMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_cosMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u7_cosMult_q <= u7_cosMult_s1;
        END IF;
    END PROCESS;

	--u7_sinTable(DUALMEM,332)@13
    u7_sinTable_reset0 <= areset;
    u7_sinTable_ia <= (others => '0');
    u7_sinTable_aa <= (others => '0');
    u7_sinTable_ab <= u7_alphaBitSelect_b;
    u7_sinTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u7_sinTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u7_sinTable_reset0,
        clock0 => clk,
        address_b => u7_sinTable_ab,
        -- data_b => (others => '0'),
        q_b => u7_sinTable_iq,
        address_a => u7_sinTable_aa,
        data_a => u7_sinTable_ia
    );
        u7_sinTable_q <= u7_sinTable_iq(11 downto 0);

	--d_u7_sinTable_q_18_replace_mem(DUALMEM,1136)
    d_u7_sinTable_q_18_replace_mem_reset0 <= areset;
    d_u7_sinTable_q_18_replace_mem_ia <= u7_sinTable_q;
    d_u7_sinTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u7_sinTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u7_sinTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u7_sinTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u7_sinTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u7_sinTable_q_18_replace_mem_iq,
        address_a => d_u7_sinTable_q_18_replace_mem_aa,
        data_a => d_u7_sinTable_q_18_replace_mem_ia
    );
        d_u7_sinTable_q_18_replace_mem_q <= d_u7_sinTable_q_18_replace_mem_iq(11 downto 0);

	--u7_lsSinTable(BITSHIFT,345)@18
    u7_lsSinTable_q_int <= d_u7_sinTable_q_18_replace_mem_q & "00000000000000000000";
    u7_lsSinTable_q <= u7_lsSinTable_q_int(31 downto 0);

	--u7_sinAdd(ADD,349)@18
    u7_sinAdd_a <= u7_lsSinTable_q(31 downto 18);
    u7_sinAdd_b <= STD_LOGIC_VECTOR("00000000" & u7_cosMult_q(23 downto 18));
    u7_sinAdd_i <= u0_sin_pi_over_4_q;
    u7_sinAdd_a1 <= u7_sinAdd_i WHEN (u7_alphaOverflowBitSelect_b = "1") ELSE u7_sinAdd_a;
    u7_sinAdd_b1 <= (others => '0') WHEN (u7_alphaOverflowBitSelect_b = "1") ELSE u7_sinAdd_b;
    u7_sinAdd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_sinAdd_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u7_sinAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(u7_sinAdd_a1) + UNSIGNED(u7_sinAdd_b1));
        END IF;
    END PROCESS;
    u7_sinAdd_q <= u7_sinAdd_o(13 downto 0);


	--u7_roundedSin(ROUND,351)@19
    u7_roundedSin_in <= u7_sinAdd_q;
    u7_roundedSin: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_roundedSin_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u7_roundedSin_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u7_roundedSin_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u7_roundedSin_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u7_sinMult(MULT,343)@15
    u7_sinMult_pr <= UNSIGNED(u7_sinMult_a) * UNSIGNED(u7_sinMult_b);
    u7_sinMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_sinMult_a <= (others => '0');
            u7_sinMult_b <= (others => '0');
            u7_sinMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u7_sinMult_a <= u7_sinTable_q;
            u7_sinMult_b <= u7_beta_times_pi_over_4_shifted_b;
            u7_sinMult_s1 <= STD_LOGIC_VECTOR(u7_sinMult_pr);
        END IF;
    END PROCESS;
    u7_sinMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_sinMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u7_sinMult_q <= u7_sinMult_s1;
        END IF;
    END PROCESS;

	--d_u7_cosTable_q_18_replace_mem(DUALMEM,1146)
    d_u7_cosTable_q_18_replace_mem_reset0 <= areset;
    d_u7_cosTable_q_18_replace_mem_ia <= u7_cosTable_q;
    d_u7_cosTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u7_cosTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u7_cosTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u7_cosTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u7_cosTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u7_cosTable_q_18_replace_mem_iq,
        address_a => d_u7_cosTable_q_18_replace_mem_aa,
        data_a => d_u7_cosTable_q_18_replace_mem_ia
    );
        d_u7_cosTable_q_18_replace_mem_q <= d_u7_cosTable_q_18_replace_mem_iq(11 downto 0);

	--u7_lsCosTable(BITSHIFT,346)@18
    u7_lsCosTable_q_int <= d_u7_cosTable_q_18_replace_mem_q & "00000000000000000000";
    u7_lsCosTable_q <= u7_lsCosTable_q_int(31 downto 0);

	--u7_cosSub(SUB,350)@18
    u7_cosSub_a <= u7_lsCosTable_q(31 downto 18);
    u7_cosSub_b <= STD_LOGIC_VECTOR("00000000" & u7_sinMult_q(23 downto 18));
    u7_cosSub_i <= u0_sin_pi_over_4_q;
    u7_cosSub_a1 <= u7_cosSub_i WHEN (u7_alphaOverflowBitSelect_b = "1") ELSE u7_cosSub_a;
    u7_cosSub_b1 <= (others => '0') WHEN (u7_alphaOverflowBitSelect_b = "1") ELSE u7_cosSub_b;
    u7_cosSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_cosSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u7_cosSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u7_cosSub_a1) - UNSIGNED(u7_cosSub_b1));
        END IF;
    END PROCESS;
    u7_cosSub_q <= u7_cosSub_o(13 downto 0);


	--u7_roundedCos(ROUND,352)@19
    u7_roundedCos_in <= u7_cosSub_q;
    u7_roundedCos: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_roundedCos_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u7_roundedCos_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u7_roundedCos_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u7_roundedCos_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u7_doSwap(LOOKUP,353)@19
    u7_doSwap: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_doSwap_q <= "0";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (d_u7_octantBitSelect_b_19_replace_mem_q) IS
                WHEN "000" =>  u7_doSwap_q <= "0";
                WHEN "001" =>  u7_doSwap_q <= "1";
                WHEN "010" =>  u7_doSwap_q <= "1";
                WHEN "011" =>  u7_doSwap_q <= "0";
                WHEN "100" =>  u7_doSwap_q <= "0";
                WHEN "101" =>  u7_doSwap_q <= "1";
                WHEN "110" =>  u7_doSwap_q <= "1";
                WHEN "111" =>  u7_doSwap_q <= "0";
                WHEN OTHERS =>
                    u7_doSwap_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u7_cosSwapMux(MUX,361)@20
    u7_cosSwapMux_s <= u7_doSwap_q;
    u7_cosSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_cosSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u7_cosSwapMux_s IS
                      WHEN "0" => u7_cosSwapMux_q <= u7_roundedCos_q;
                      WHEN "1" => u7_cosSwapMux_q <= u7_roundedSin_q;
                      WHEN OTHERS => u7_cosSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u7_cosInvert(SUB,363)@21
    u7_cosInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u7_cosInvert_b <= u7_cosSwapMux_q;
    u7_cosInvert_i <= u7_cosInvert_b;
    u7_cosInvert_a1 <= u7_cosInvert_i WHEN (u7_doCosInvert_q = "1") ELSE u7_cosInvert_a;
    u7_cosInvert_b1 <= (others => '0') WHEN (u7_doCosInvert_q = "1") ELSE u7_cosInvert_b;
    u7_cosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_cosInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u7_cosInvert_o <= STD_LOGIC_VECTOR(SIGNED(u7_cosInvert_a1) - SIGNED(u7_cosInvert_b1));
        END IF;
    END PROCESS;
    u7_cosInvert_q <= u7_cosInvert_o(11 downto 0);


	--u6_phaseIncrRegLookup_0(LOOKUP,16)@10
    u6_phaseIncrRegLookup_0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u6_phaseIncrRegLookup_0_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_a) IS
                WHEN "010010110110" =>                     u6_phaseIncrRegLookup_0_e <= busIn_w;
                WHEN OTHERS =>
                    u6_phaseIncrRegLookup_0_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u6_phaseIncrReg_p0(REG,17)@11
    u6_phaseIncrReg_p0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u6_phaseIncrReg_p0_q <= "01000110000000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (u6_phaseIncrRegLookup_0_e = "1") THEN
                u6_phaseIncrReg_p0_q <= d_busIn_d_11_q(19 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u6_invertCos(BITSELECT,316)@20
    u6_invertCos_in <= u6_phaseIncrReg_p0_q(18 downto 0);
    u6_invertCos_b <= u6_invertCos_in(18 downto 18);

	--u6_accumAdd_b1(ADD,282)@10
    u6_accumAdd_b1_a <= u6_accumAdd_b1_q;
    u6_accumAdd_b1_b <= u6_phaseIncrReg_p0_q(17 downto 0);
    u6_accumAdd_b1_i <= xIn_p_6;
    u6_accumAdd_b1_a1 <= u6_accumAdd_b1_i WHEN (xIn_s_6 = "1") ELSE u6_accumAdd_b1_a;
    u6_accumAdd_b1_b1 <= (others => '0') WHEN (xIn_s_6 = "1") ELSE u6_accumAdd_b1_b;
    u6_accumAdd_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_accumAdd_b1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u6_accumAdd_b1_o <= STD_LOGIC_VECTOR(UNSIGNED(u6_accumAdd_b1_a1) + UNSIGNED(u6_accumAdd_b1_b1));
            END IF;
        END IF;
    END PROCESS;
    u6_accumAdd_b1_q <= u6_accumAdd_b1_o(17 downto 0);


	--u6_octantBitSelect(BITSELECT,284)@11
    u6_octantBitSelect_in <= u6_accumAdd_b1_q;
    u6_octantBitSelect_b <= u6_octantBitSelect_in(17 downto 15);

	--d_u6_octantBitSelect_b_19_replace_mem(DUALMEM,1068)
    d_u6_octantBitSelect_b_19_replace_mem_reset0 <= areset;
    d_u6_octantBitSelect_b_19_replace_mem_ia <= u6_octantBitSelect_b;
    d_u6_octantBitSelect_b_19_replace_mem_aa <= d_u0_octantBitSelect_b_19_replace_rdreg_q;
    d_u6_octantBitSelect_b_19_replace_mem_ab <= d_u0_octantBitSelect_b_19_replace_rdmux_q;
    d_u6_octantBitSelect_b_19_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 3,
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
        clocken1 => d_u0_octantBitSelect_b_19_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u6_octantBitSelect_b_19_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u6_octantBitSelect_b_19_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u6_octantBitSelect_b_19_replace_mem_iq,
        address_a => d_u6_octantBitSelect_b_19_replace_mem_aa,
        data_a => d_u6_octantBitSelect_b_19_replace_mem_ia
    );
        d_u6_octantBitSelect_b_19_replace_mem_q <= d_u6_octantBitSelect_b_19_replace_mem_iq(2 downto 0);

	--d_u6_octantBitSelect_b_20(DELAY,734)@19
    d_u6_octantBitSelect_b_20 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => d_u6_octantBitSelect_b_19_replace_mem_q, xout => d_u6_octantBitSelect_b_20_q, clk => clk, aclr => areset );

	--u6_cosJoin(BITJOIN,317)@20
    u6_cosJoin_q <= u6_invertCos_b & d_u6_octantBitSelect_b_20_q;

	--u6_doCosInvert(LOOKUP,318)@20
    u6_doCosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_doCosInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u6_cosJoin_q) IS
                WHEN "0000" =>  u6_doCosInvert_q <= "1";
                WHEN "0001" =>  u6_doCosInvert_q <= "1";
                WHEN "0010" =>  u6_doCosInvert_q <= "0";
                WHEN "0011" =>  u6_doCosInvert_q <= "0";
                WHEN "0100" =>  u6_doCosInvert_q <= "0";
                WHEN "0101" =>  u6_doCosInvert_q <= "0";
                WHEN "0110" =>  u6_doCosInvert_q <= "1";
                WHEN "0111" =>  u6_doCosInvert_q <= "1";
                WHEN "1000" =>  u6_doCosInvert_q <= "0";
                WHEN "1001" =>  u6_doCosInvert_q <= "0";
                WHEN "1010" =>  u6_doCosInvert_q <= "1";
                WHEN "1011" =>  u6_doCosInvert_q <= "1";
                WHEN "1100" =>  u6_doCosInvert_q <= "1";
                WHEN "1101" =>  u6_doCosInvert_q <= "1";
                WHEN "1110" =>  u6_doCosInvert_q <= "0";
                WHEN "1111" =>  u6_doCosInvert_q <= "0";
                WHEN OTHERS =>
                    u6_doCosInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u6_addnsubConst(LOOKUP,286)@11
    u6_addnsubConst: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_addnsubConst_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u6_octantBitSelect_b) IS
                WHEN "000" =>  u6_addnsubConst_q <= "1";
                WHEN "001" =>  u6_addnsubConst_q <= "0";
                WHEN "010" =>  u6_addnsubConst_q <= "1";
                WHEN "011" =>  u6_addnsubConst_q <= "0";
                WHEN "100" =>  u6_addnsubConst_q <= "1";
                WHEN "101" =>  u6_addnsubConst_q <= "0";
                WHEN "110" =>  u6_addnsubConst_q <= "1";
                WHEN "111" =>  u6_addnsubConst_q <= "0";
                WHEN OTHERS =>
                    u6_addnsubConst_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--d_u6_accumAdd_b1_q_12(DELAY,732)@11
    d_u6_accumAdd_b1_q_12 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => u6_accumAdd_b1_q, xout => d_u6_accumAdd_b1_q_12_q, clk => clk, aclr => areset );

	--u6_rangeLUT(LOOKUP,285)@11
    u6_rangeLUT: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_rangeLUT_q <= "0000000000000000000";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u6_octantBitSelect_b) IS
                WHEN "000" =>  u6_rangeLUT_q <= "0000000000000000000";
                WHEN "001" =>  u6_rangeLUT_q <= "0010000000000000000";
                WHEN "010" =>  u6_rangeLUT_q <= "1110000000000000000";
                WHEN "011" =>  u6_rangeLUT_q <= "0100000000000000000";
                WHEN "100" =>  u6_rangeLUT_q <= "1100000000000000000";
                WHEN "101" =>  u6_rangeLUT_q <= "0110000000000000000";
                WHEN "110" =>  u6_rangeLUT_q <= "1010000000000000000";
                WHEN "111" =>  u6_rangeLUT_q <= "1100000000000000000";
                WHEN OTHERS =>
                    u6_rangeLUT_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u6_rangeAddSub(ADDSUB,287)@12
    u6_rangeAddSub_cin <= GND_q;
    u6_rangeAddSub_a <= STD_LOGIC_VECTOR("0" & u6_rangeLUT_q) & u6_addnsubConst_q(0);
    u6_rangeAddSub_b <= STD_LOGIC_VECTOR("00" & d_u6_accumAdd_b1_q_12_q) & u6_rangeAddSub_cin(0);
    u6_rangeAddSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_rangeAddSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u6_addnsubConst_q = "1") THEN
                u6_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u6_rangeAddSub_a) + UNSIGNED(u6_rangeAddSub_b));
            ELSE
                u6_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u6_rangeAddSub_a) - UNSIGNED(u6_rangeAddSub_b));
            END IF;
        END IF;
    END PROCESS;
    u6_rangeAddSub_q <= u6_rangeAddSub_o(19 downto 1);


	--d_u6_rangeAddSub_q_18_replace_mem(DUALMEM,1080)
    d_u6_rangeAddSub_q_18_replace_mem_reset0 <= areset;
    d_u6_rangeAddSub_q_18_replace_mem_ia <= u6_rangeAddSub_q;
    d_u6_rangeAddSub_q_18_replace_mem_aa <= d_u0_rangeAddSub_q_18_replace_rdreg_q;
    d_u6_rangeAddSub_q_18_replace_mem_ab <= d_u0_rangeAddSub_q_18_replace_rdmux_q;
    d_u6_rangeAddSub_q_18_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 19,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 19,
        widthad_b => 2,
        numwords_b => 4,
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
        clocken1 => d_u0_rangeAddSub_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u6_rangeAddSub_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u6_rangeAddSub_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u6_rangeAddSub_q_18_replace_mem_iq,
        address_a => d_u6_rangeAddSub_q_18_replace_mem_aa,
        data_a => d_u6_rangeAddSub_q_18_replace_mem_ia
    );
        d_u6_rangeAddSub_q_18_replace_mem_q <= d_u6_rangeAddSub_q_18_replace_mem_iq(18 downto 0);

	--u6_alphaOverflowBitSelect(BITSELECT,289)@18
    u6_alphaOverflowBitSelect_in <= d_u6_rangeAddSub_q_18_replace_mem_q(15 downto 0);
    u6_alphaOverflowBitSelect_b <= u6_alphaOverflowBitSelect_in(15 downto 15);

	--u6_betaBitSelect(BITSELECT,290)@13
    u6_betaBitSelect_in <= u6_rangeAddSub_q(6 downto 0);
    u6_betaBitSelect_b <= u6_betaBitSelect_in(6 downto 0);

	--u6_ls4(BITSHIFT,297)@13
    u6_ls4_q_int <= u6_betaBitSelect_b & "0000";
    u6_ls4_q <= u6_ls4_q_int(10 downto 0);

	--u6_ls7(BITSHIFT,296)@13
    u6_ls7_q_int <= u6_betaBitSelect_b & "0000000";
    u6_ls7_q <= u6_ls7_q_int(13 downto 0);

	--u6_cm2(ADD,298)@13
    u6_cm2_a <= STD_LOGIC_VECTOR("0" & u6_ls7_q);
    u6_cm2_b <= STD_LOGIC_VECTOR("0000" & u6_ls4_q);
    u6_cm2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_cm2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u6_cm2_o <= STD_LOGIC_VECTOR(UNSIGNED(u6_cm2_a) + UNSIGNED(u6_cm2_b));
        END IF;
    END PROCESS;
    u6_cm2_q <= u6_cm2_o(14 downto 0);


	--u6_ls10(BITSHIFT,294)@13
    u6_ls10_q_int <= u6_betaBitSelect_b & "0000000000";
    u6_ls10_q <= u6_ls10_q_int(16 downto 0);

	--u6_ls12(BITSHIFT,293)@13
    u6_ls12_q_int <= u6_betaBitSelect_b & "000000000000";
    u6_ls12_q <= u6_ls12_q_int(18 downto 0);

	--u6_cm1(SUB,295)@13
    u6_cm1_a <= STD_LOGIC_VECTOR("0" & u6_ls12_q);
    u6_cm1_b <= STD_LOGIC_VECTOR("000" & u6_ls10_q);
    u6_cm1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_cm1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u6_cm1_o <= STD_LOGIC_VECTOR(UNSIGNED(u6_cm1_a) - UNSIGNED(u6_cm1_b));
        END IF;
    END PROCESS;
    u6_cm1_q <= u6_cm1_o(19 downto 0);


	--u6_cm3(ADD,299)@14
    u6_cm3_a <= STD_LOGIC_VECTOR("0" & u6_cm1_q);
    u6_cm3_b <= STD_LOGIC_VECTOR("000000" & u6_cm2_q);
    u6_cm3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_cm3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u6_cm3_o <= STD_LOGIC_VECTOR(UNSIGNED(u6_cm3_a) + UNSIGNED(u6_cm3_b));
        END IF;
    END PROCESS;
    u6_cm3_q <= u6_cm3_o(20 downto 0);


	--u6_beta_times_4_shift(BITSHIFT,300)@15
    u6_beta_times_4_shift_q_int <= u6_cm3_q(20 downto 1);
    u6_beta_times_4_shift_q <= u6_beta_times_4_shift_q_int(19 downto 0);

	--u6_beta_times_pi_over_4_shifted(BITSELECT,301)@15
    u6_beta_times_pi_over_4_shifted_in <= u6_beta_times_4_shift_q(17 downto 0);
    u6_beta_times_pi_over_4_shifted_b <= u6_beta_times_pi_over_4_shifted_in(17 downto 6);

	--u6_alphaBitSelect(BITSELECT,288)@13
    u6_alphaBitSelect_in <= u6_rangeAddSub_q(14 downto 0);
    u6_alphaBitSelect_b <= u6_alphaBitSelect_in(14 downto 7);

	--u6_cosTable(DUALMEM,292)@13
    u6_cosTable_reset0 <= areset;
    u6_cosTable_ia <= (others => '0');
    u6_cosTable_aa <= (others => '0');
    u6_cosTable_ab <= u6_alphaBitSelect_b;
    u6_cosTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u6_cosTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u6_cosTable_reset0,
        clock0 => clk,
        address_b => u6_cosTable_ab,
        -- data_b => (others => '0'),
        q_b => u6_cosTable_iq,
        address_a => u6_cosTable_aa,
        data_a => u6_cosTable_ia
    );
        u6_cosTable_q <= u6_cosTable_iq(11 downto 0);

	--u6_cosMult(MULT,303)@15
    u6_cosMult_pr <= UNSIGNED(u6_cosMult_a) * UNSIGNED(u6_cosMult_b);
    u6_cosMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_cosMult_a <= (others => '0');
            u6_cosMult_b <= (others => '0');
            u6_cosMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u6_cosMult_a <= u6_cosTable_q;
            u6_cosMult_b <= u6_beta_times_pi_over_4_shifted_b;
            u6_cosMult_s1 <= STD_LOGIC_VECTOR(u6_cosMult_pr);
        END IF;
    END PROCESS;
    u6_cosMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_cosMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u6_cosMult_q <= u6_cosMult_s1;
        END IF;
    END PROCESS;

	--u6_sinTable(DUALMEM,291)@13
    u6_sinTable_reset0 <= areset;
    u6_sinTable_ia <= (others => '0');
    u6_sinTable_aa <= (others => '0');
    u6_sinTable_ab <= u6_alphaBitSelect_b;
    u6_sinTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u6_sinTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u6_sinTable_reset0,
        clock0 => clk,
        address_b => u6_sinTable_ab,
        -- data_b => (others => '0'),
        q_b => u6_sinTable_iq,
        address_a => u6_sinTable_aa,
        data_a => u6_sinTable_ia
    );
        u6_sinTable_q <= u6_sinTable_iq(11 downto 0);

	--d_u6_sinTable_q_18_replace_mem(DUALMEM,1092)
    d_u6_sinTable_q_18_replace_mem_reset0 <= areset;
    d_u6_sinTable_q_18_replace_mem_ia <= u6_sinTable_q;
    d_u6_sinTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u6_sinTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u6_sinTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u6_sinTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u6_sinTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u6_sinTable_q_18_replace_mem_iq,
        address_a => d_u6_sinTable_q_18_replace_mem_aa,
        data_a => d_u6_sinTable_q_18_replace_mem_ia
    );
        d_u6_sinTable_q_18_replace_mem_q <= d_u6_sinTable_q_18_replace_mem_iq(11 downto 0);

	--u6_lsSinTable(BITSHIFT,304)@18
    u6_lsSinTable_q_int <= d_u6_sinTable_q_18_replace_mem_q & "00000000000000000000";
    u6_lsSinTable_q <= u6_lsSinTable_q_int(31 downto 0);

	--u6_sinAdd(ADD,308)@18
    u6_sinAdd_a <= u6_lsSinTable_q(31 downto 18);
    u6_sinAdd_b <= STD_LOGIC_VECTOR("00000000" & u6_cosMult_q(23 downto 18));
    u6_sinAdd_i <= u0_sin_pi_over_4_q;
    u6_sinAdd_a1 <= u6_sinAdd_i WHEN (u6_alphaOverflowBitSelect_b = "1") ELSE u6_sinAdd_a;
    u6_sinAdd_b1 <= (others => '0') WHEN (u6_alphaOverflowBitSelect_b = "1") ELSE u6_sinAdd_b;
    u6_sinAdd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_sinAdd_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u6_sinAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(u6_sinAdd_a1) + UNSIGNED(u6_sinAdd_b1));
        END IF;
    END PROCESS;
    u6_sinAdd_q <= u6_sinAdd_o(13 downto 0);


	--u6_roundedSin(ROUND,310)@19
    u6_roundedSin_in <= u6_sinAdd_q;
    u6_roundedSin: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_roundedSin_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u6_roundedSin_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u6_roundedSin_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u6_roundedSin_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u6_sinMult(MULT,302)@15
    u6_sinMult_pr <= UNSIGNED(u6_sinMult_a) * UNSIGNED(u6_sinMult_b);
    u6_sinMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_sinMult_a <= (others => '0');
            u6_sinMult_b <= (others => '0');
            u6_sinMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u6_sinMult_a <= u6_sinTable_q;
            u6_sinMult_b <= u6_beta_times_pi_over_4_shifted_b;
            u6_sinMult_s1 <= STD_LOGIC_VECTOR(u6_sinMult_pr);
        END IF;
    END PROCESS;
    u6_sinMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_sinMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u6_sinMult_q <= u6_sinMult_s1;
        END IF;
    END PROCESS;

	--d_u6_cosTable_q_18_replace_mem(DUALMEM,1102)
    d_u6_cosTable_q_18_replace_mem_reset0 <= areset;
    d_u6_cosTable_q_18_replace_mem_ia <= u6_cosTable_q;
    d_u6_cosTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u6_cosTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u6_cosTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u6_cosTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u6_cosTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u6_cosTable_q_18_replace_mem_iq,
        address_a => d_u6_cosTable_q_18_replace_mem_aa,
        data_a => d_u6_cosTable_q_18_replace_mem_ia
    );
        d_u6_cosTable_q_18_replace_mem_q <= d_u6_cosTable_q_18_replace_mem_iq(11 downto 0);

	--u6_lsCosTable(BITSHIFT,305)@18
    u6_lsCosTable_q_int <= d_u6_cosTable_q_18_replace_mem_q & "00000000000000000000";
    u6_lsCosTable_q <= u6_lsCosTable_q_int(31 downto 0);

	--u6_cosSub(SUB,309)@18
    u6_cosSub_a <= u6_lsCosTable_q(31 downto 18);
    u6_cosSub_b <= STD_LOGIC_VECTOR("00000000" & u6_sinMult_q(23 downto 18));
    u6_cosSub_i <= u0_sin_pi_over_4_q;
    u6_cosSub_a1 <= u6_cosSub_i WHEN (u6_alphaOverflowBitSelect_b = "1") ELSE u6_cosSub_a;
    u6_cosSub_b1 <= (others => '0') WHEN (u6_alphaOverflowBitSelect_b = "1") ELSE u6_cosSub_b;
    u6_cosSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_cosSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u6_cosSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u6_cosSub_a1) - UNSIGNED(u6_cosSub_b1));
        END IF;
    END PROCESS;
    u6_cosSub_q <= u6_cosSub_o(13 downto 0);


	--u6_roundedCos(ROUND,311)@19
    u6_roundedCos_in <= u6_cosSub_q;
    u6_roundedCos: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_roundedCos_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u6_roundedCos_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u6_roundedCos_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u6_roundedCos_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u6_doSwap(LOOKUP,312)@19
    u6_doSwap: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_doSwap_q <= "0";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (d_u6_octantBitSelect_b_19_replace_mem_q) IS
                WHEN "000" =>  u6_doSwap_q <= "0";
                WHEN "001" =>  u6_doSwap_q <= "1";
                WHEN "010" =>  u6_doSwap_q <= "1";
                WHEN "011" =>  u6_doSwap_q <= "0";
                WHEN "100" =>  u6_doSwap_q <= "0";
                WHEN "101" =>  u6_doSwap_q <= "1";
                WHEN "110" =>  u6_doSwap_q <= "1";
                WHEN "111" =>  u6_doSwap_q <= "0";
                WHEN OTHERS =>
                    u6_doSwap_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u6_cosSwapMux(MUX,320)@20
    u6_cosSwapMux_s <= u6_doSwap_q;
    u6_cosSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_cosSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u6_cosSwapMux_s IS
                      WHEN "0" => u6_cosSwapMux_q <= u6_roundedCos_q;
                      WHEN "1" => u6_cosSwapMux_q <= u6_roundedSin_q;
                      WHEN OTHERS => u6_cosSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u6_cosInvert(SUB,322)@21
    u6_cosInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u6_cosInvert_b <= u6_cosSwapMux_q;
    u6_cosInvert_i <= u6_cosInvert_b;
    u6_cosInvert_a1 <= u6_cosInvert_i WHEN (u6_doCosInvert_q = "1") ELSE u6_cosInvert_a;
    u6_cosInvert_b1 <= (others => '0') WHEN (u6_doCosInvert_q = "1") ELSE u6_cosInvert_b;
    u6_cosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_cosInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u6_cosInvert_o <= STD_LOGIC_VECTOR(SIGNED(u6_cosInvert_a1) - SIGNED(u6_cosInvert_b1));
        END IF;
    END PROCESS;
    u6_cosInvert_q <= u6_cosInvert_o(11 downto 0);


	--u5_phaseIncrRegLookup_0(LOOKUP,14)@10
    u5_phaseIncrRegLookup_0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u5_phaseIncrRegLookup_0_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_a) IS
                WHEN "010010110101" =>                     u5_phaseIncrRegLookup_0_e <= busIn_w;
                WHEN OTHERS =>
                    u5_phaseIncrRegLookup_0_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u5_phaseIncrReg_p0(REG,15)@11
    u5_phaseIncrReg_p0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u5_phaseIncrReg_p0_q <= "01000110000000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (u5_phaseIncrRegLookup_0_e = "1") THEN
                u5_phaseIncrReg_p0_q <= d_busIn_d_11_q(19 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u5_invertCos(BITSELECT,275)@20
    u5_invertCos_in <= u5_phaseIncrReg_p0_q(18 downto 0);
    u5_invertCos_b <= u5_invertCos_in(18 downto 18);

	--u5_accumAdd_b1(ADD,241)@10
    u5_accumAdd_b1_a <= u5_accumAdd_b1_q;
    u5_accumAdd_b1_b <= u5_phaseIncrReg_p0_q(17 downto 0);
    u5_accumAdd_b1_i <= xIn_p_5;
    u5_accumAdd_b1_a1 <= u5_accumAdd_b1_i WHEN (xIn_s_5 = "1") ELSE u5_accumAdd_b1_a;
    u5_accumAdd_b1_b1 <= (others => '0') WHEN (xIn_s_5 = "1") ELSE u5_accumAdd_b1_b;
    u5_accumAdd_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_accumAdd_b1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u5_accumAdd_b1_o <= STD_LOGIC_VECTOR(UNSIGNED(u5_accumAdd_b1_a1) + UNSIGNED(u5_accumAdd_b1_b1));
            END IF;
        END IF;
    END PROCESS;
    u5_accumAdd_b1_q <= u5_accumAdd_b1_o(17 downto 0);


	--u5_octantBitSelect(BITSELECT,243)@11
    u5_octantBitSelect_in <= u5_accumAdd_b1_q;
    u5_octantBitSelect_b <= u5_octantBitSelect_in(17 downto 15);

	--d_u5_octantBitSelect_b_19_replace_mem(DUALMEM,1024)
    d_u5_octantBitSelect_b_19_replace_mem_reset0 <= areset;
    d_u5_octantBitSelect_b_19_replace_mem_ia <= u5_octantBitSelect_b;
    d_u5_octantBitSelect_b_19_replace_mem_aa <= d_u0_octantBitSelect_b_19_replace_rdreg_q;
    d_u5_octantBitSelect_b_19_replace_mem_ab <= d_u0_octantBitSelect_b_19_replace_rdmux_q;
    d_u5_octantBitSelect_b_19_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 3,
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
        clocken1 => d_u0_octantBitSelect_b_19_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u5_octantBitSelect_b_19_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u5_octantBitSelect_b_19_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u5_octantBitSelect_b_19_replace_mem_iq,
        address_a => d_u5_octantBitSelect_b_19_replace_mem_aa,
        data_a => d_u5_octantBitSelect_b_19_replace_mem_ia
    );
        d_u5_octantBitSelect_b_19_replace_mem_q <= d_u5_octantBitSelect_b_19_replace_mem_iq(2 downto 0);

	--d_u5_octantBitSelect_b_20(DELAY,728)@19
    d_u5_octantBitSelect_b_20 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => d_u5_octantBitSelect_b_19_replace_mem_q, xout => d_u5_octantBitSelect_b_20_q, clk => clk, aclr => areset );

	--u5_cosJoin(BITJOIN,276)@20
    u5_cosJoin_q <= u5_invertCos_b & d_u5_octantBitSelect_b_20_q;

	--u5_doCosInvert(LOOKUP,277)@20
    u5_doCosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_doCosInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u5_cosJoin_q) IS
                WHEN "0000" =>  u5_doCosInvert_q <= "1";
                WHEN "0001" =>  u5_doCosInvert_q <= "1";
                WHEN "0010" =>  u5_doCosInvert_q <= "0";
                WHEN "0011" =>  u5_doCosInvert_q <= "0";
                WHEN "0100" =>  u5_doCosInvert_q <= "0";
                WHEN "0101" =>  u5_doCosInvert_q <= "0";
                WHEN "0110" =>  u5_doCosInvert_q <= "1";
                WHEN "0111" =>  u5_doCosInvert_q <= "1";
                WHEN "1000" =>  u5_doCosInvert_q <= "0";
                WHEN "1001" =>  u5_doCosInvert_q <= "0";
                WHEN "1010" =>  u5_doCosInvert_q <= "1";
                WHEN "1011" =>  u5_doCosInvert_q <= "1";
                WHEN "1100" =>  u5_doCosInvert_q <= "1";
                WHEN "1101" =>  u5_doCosInvert_q <= "1";
                WHEN "1110" =>  u5_doCosInvert_q <= "0";
                WHEN "1111" =>  u5_doCosInvert_q <= "0";
                WHEN OTHERS =>
                    u5_doCosInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u5_addnsubConst(LOOKUP,245)@11
    u5_addnsubConst: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_addnsubConst_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u5_octantBitSelect_b) IS
                WHEN "000" =>  u5_addnsubConst_q <= "1";
                WHEN "001" =>  u5_addnsubConst_q <= "0";
                WHEN "010" =>  u5_addnsubConst_q <= "1";
                WHEN "011" =>  u5_addnsubConst_q <= "0";
                WHEN "100" =>  u5_addnsubConst_q <= "1";
                WHEN "101" =>  u5_addnsubConst_q <= "0";
                WHEN "110" =>  u5_addnsubConst_q <= "1";
                WHEN "111" =>  u5_addnsubConst_q <= "0";
                WHEN OTHERS =>
                    u5_addnsubConst_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--d_u5_accumAdd_b1_q_12(DELAY,726)@11
    d_u5_accumAdd_b1_q_12 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => u5_accumAdd_b1_q, xout => d_u5_accumAdd_b1_q_12_q, clk => clk, aclr => areset );

	--u5_rangeLUT(LOOKUP,244)@11
    u5_rangeLUT: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_rangeLUT_q <= "0000000000000000000";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u5_octantBitSelect_b) IS
                WHEN "000" =>  u5_rangeLUT_q <= "0000000000000000000";
                WHEN "001" =>  u5_rangeLUT_q <= "0010000000000000000";
                WHEN "010" =>  u5_rangeLUT_q <= "1110000000000000000";
                WHEN "011" =>  u5_rangeLUT_q <= "0100000000000000000";
                WHEN "100" =>  u5_rangeLUT_q <= "1100000000000000000";
                WHEN "101" =>  u5_rangeLUT_q <= "0110000000000000000";
                WHEN "110" =>  u5_rangeLUT_q <= "1010000000000000000";
                WHEN "111" =>  u5_rangeLUT_q <= "1100000000000000000";
                WHEN OTHERS =>
                    u5_rangeLUT_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u5_rangeAddSub(ADDSUB,246)@12
    u5_rangeAddSub_cin <= GND_q;
    u5_rangeAddSub_a <= STD_LOGIC_VECTOR("0" & u5_rangeLUT_q) & u5_addnsubConst_q(0);
    u5_rangeAddSub_b <= STD_LOGIC_VECTOR("00" & d_u5_accumAdd_b1_q_12_q) & u5_rangeAddSub_cin(0);
    u5_rangeAddSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_rangeAddSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u5_addnsubConst_q = "1") THEN
                u5_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u5_rangeAddSub_a) + UNSIGNED(u5_rangeAddSub_b));
            ELSE
                u5_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u5_rangeAddSub_a) - UNSIGNED(u5_rangeAddSub_b));
            END IF;
        END IF;
    END PROCESS;
    u5_rangeAddSub_q <= u5_rangeAddSub_o(19 downto 1);


	--d_u5_rangeAddSub_q_18_replace_mem(DUALMEM,1036)
    d_u5_rangeAddSub_q_18_replace_mem_reset0 <= areset;
    d_u5_rangeAddSub_q_18_replace_mem_ia <= u5_rangeAddSub_q;
    d_u5_rangeAddSub_q_18_replace_mem_aa <= d_u0_rangeAddSub_q_18_replace_rdreg_q;
    d_u5_rangeAddSub_q_18_replace_mem_ab <= d_u0_rangeAddSub_q_18_replace_rdmux_q;
    d_u5_rangeAddSub_q_18_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 19,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 19,
        widthad_b => 2,
        numwords_b => 4,
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
        clocken1 => d_u0_rangeAddSub_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u5_rangeAddSub_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u5_rangeAddSub_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u5_rangeAddSub_q_18_replace_mem_iq,
        address_a => d_u5_rangeAddSub_q_18_replace_mem_aa,
        data_a => d_u5_rangeAddSub_q_18_replace_mem_ia
    );
        d_u5_rangeAddSub_q_18_replace_mem_q <= d_u5_rangeAddSub_q_18_replace_mem_iq(18 downto 0);

	--u5_alphaOverflowBitSelect(BITSELECT,248)@18
    u5_alphaOverflowBitSelect_in <= d_u5_rangeAddSub_q_18_replace_mem_q(15 downto 0);
    u5_alphaOverflowBitSelect_b <= u5_alphaOverflowBitSelect_in(15 downto 15);

	--u5_betaBitSelect(BITSELECT,249)@13
    u5_betaBitSelect_in <= u5_rangeAddSub_q(6 downto 0);
    u5_betaBitSelect_b <= u5_betaBitSelect_in(6 downto 0);

	--u5_ls4(BITSHIFT,256)@13
    u5_ls4_q_int <= u5_betaBitSelect_b & "0000";
    u5_ls4_q <= u5_ls4_q_int(10 downto 0);

	--u5_ls7(BITSHIFT,255)@13
    u5_ls7_q_int <= u5_betaBitSelect_b & "0000000";
    u5_ls7_q <= u5_ls7_q_int(13 downto 0);

	--u5_cm2(ADD,257)@13
    u5_cm2_a <= STD_LOGIC_VECTOR("0" & u5_ls7_q);
    u5_cm2_b <= STD_LOGIC_VECTOR("0000" & u5_ls4_q);
    u5_cm2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_cm2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u5_cm2_o <= STD_LOGIC_VECTOR(UNSIGNED(u5_cm2_a) + UNSIGNED(u5_cm2_b));
        END IF;
    END PROCESS;
    u5_cm2_q <= u5_cm2_o(14 downto 0);


	--u5_ls10(BITSHIFT,253)@13
    u5_ls10_q_int <= u5_betaBitSelect_b & "0000000000";
    u5_ls10_q <= u5_ls10_q_int(16 downto 0);

	--u5_ls12(BITSHIFT,252)@13
    u5_ls12_q_int <= u5_betaBitSelect_b & "000000000000";
    u5_ls12_q <= u5_ls12_q_int(18 downto 0);

	--u5_cm1(SUB,254)@13
    u5_cm1_a <= STD_LOGIC_VECTOR("0" & u5_ls12_q);
    u5_cm1_b <= STD_LOGIC_VECTOR("000" & u5_ls10_q);
    u5_cm1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_cm1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u5_cm1_o <= STD_LOGIC_VECTOR(UNSIGNED(u5_cm1_a) - UNSIGNED(u5_cm1_b));
        END IF;
    END PROCESS;
    u5_cm1_q <= u5_cm1_o(19 downto 0);


	--u5_cm3(ADD,258)@14
    u5_cm3_a <= STD_LOGIC_VECTOR("0" & u5_cm1_q);
    u5_cm3_b <= STD_LOGIC_VECTOR("000000" & u5_cm2_q);
    u5_cm3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_cm3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u5_cm3_o <= STD_LOGIC_VECTOR(UNSIGNED(u5_cm3_a) + UNSIGNED(u5_cm3_b));
        END IF;
    END PROCESS;
    u5_cm3_q <= u5_cm3_o(20 downto 0);


	--u5_beta_times_4_shift(BITSHIFT,259)@15
    u5_beta_times_4_shift_q_int <= u5_cm3_q(20 downto 1);
    u5_beta_times_4_shift_q <= u5_beta_times_4_shift_q_int(19 downto 0);

	--u5_beta_times_pi_over_4_shifted(BITSELECT,260)@15
    u5_beta_times_pi_over_4_shifted_in <= u5_beta_times_4_shift_q(17 downto 0);
    u5_beta_times_pi_over_4_shifted_b <= u5_beta_times_pi_over_4_shifted_in(17 downto 6);

	--u5_alphaBitSelect(BITSELECT,247)@13
    u5_alphaBitSelect_in <= u5_rangeAddSub_q(14 downto 0);
    u5_alphaBitSelect_b <= u5_alphaBitSelect_in(14 downto 7);

	--u5_cosTable(DUALMEM,251)@13
    u5_cosTable_reset0 <= areset;
    u5_cosTable_ia <= (others => '0');
    u5_cosTable_aa <= (others => '0');
    u5_cosTable_ab <= u5_alphaBitSelect_b;
    u5_cosTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u5_cosTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u5_cosTable_reset0,
        clock0 => clk,
        address_b => u5_cosTable_ab,
        -- data_b => (others => '0'),
        q_b => u5_cosTable_iq,
        address_a => u5_cosTable_aa,
        data_a => u5_cosTable_ia
    );
        u5_cosTable_q <= u5_cosTable_iq(11 downto 0);

	--u5_cosMult(MULT,262)@15
    u5_cosMult_pr <= UNSIGNED(u5_cosMult_a) * UNSIGNED(u5_cosMult_b);
    u5_cosMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_cosMult_a <= (others => '0');
            u5_cosMult_b <= (others => '0');
            u5_cosMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u5_cosMult_a <= u5_cosTable_q;
            u5_cosMult_b <= u5_beta_times_pi_over_4_shifted_b;
            u5_cosMult_s1 <= STD_LOGIC_VECTOR(u5_cosMult_pr);
        END IF;
    END PROCESS;
    u5_cosMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_cosMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u5_cosMult_q <= u5_cosMult_s1;
        END IF;
    END PROCESS;

	--u5_sinTable(DUALMEM,250)@13
    u5_sinTable_reset0 <= areset;
    u5_sinTable_ia <= (others => '0');
    u5_sinTable_aa <= (others => '0');
    u5_sinTable_ab <= u5_alphaBitSelect_b;
    u5_sinTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u5_sinTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u5_sinTable_reset0,
        clock0 => clk,
        address_b => u5_sinTable_ab,
        -- data_b => (others => '0'),
        q_b => u5_sinTable_iq,
        address_a => u5_sinTable_aa,
        data_a => u5_sinTable_ia
    );
        u5_sinTable_q <= u5_sinTable_iq(11 downto 0);

	--d_u5_sinTable_q_18_replace_mem(DUALMEM,1048)
    d_u5_sinTable_q_18_replace_mem_reset0 <= areset;
    d_u5_sinTable_q_18_replace_mem_ia <= u5_sinTable_q;
    d_u5_sinTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u5_sinTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u5_sinTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u5_sinTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u5_sinTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u5_sinTable_q_18_replace_mem_iq,
        address_a => d_u5_sinTable_q_18_replace_mem_aa,
        data_a => d_u5_sinTable_q_18_replace_mem_ia
    );
        d_u5_sinTable_q_18_replace_mem_q <= d_u5_sinTable_q_18_replace_mem_iq(11 downto 0);

	--u5_lsSinTable(BITSHIFT,263)@18
    u5_lsSinTable_q_int <= d_u5_sinTable_q_18_replace_mem_q & "00000000000000000000";
    u5_lsSinTable_q <= u5_lsSinTable_q_int(31 downto 0);

	--u5_sinAdd(ADD,267)@18
    u5_sinAdd_a <= u5_lsSinTable_q(31 downto 18);
    u5_sinAdd_b <= STD_LOGIC_VECTOR("00000000" & u5_cosMult_q(23 downto 18));
    u5_sinAdd_i <= u0_sin_pi_over_4_q;
    u5_sinAdd_a1 <= u5_sinAdd_i WHEN (u5_alphaOverflowBitSelect_b = "1") ELSE u5_sinAdd_a;
    u5_sinAdd_b1 <= (others => '0') WHEN (u5_alphaOverflowBitSelect_b = "1") ELSE u5_sinAdd_b;
    u5_sinAdd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_sinAdd_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u5_sinAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(u5_sinAdd_a1) + UNSIGNED(u5_sinAdd_b1));
        END IF;
    END PROCESS;
    u5_sinAdd_q <= u5_sinAdd_o(13 downto 0);


	--u5_roundedSin(ROUND,269)@19
    u5_roundedSin_in <= u5_sinAdd_q;
    u5_roundedSin: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_roundedSin_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u5_roundedSin_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u5_roundedSin_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u5_roundedSin_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u5_sinMult(MULT,261)@15
    u5_sinMult_pr <= UNSIGNED(u5_sinMult_a) * UNSIGNED(u5_sinMult_b);
    u5_sinMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_sinMult_a <= (others => '0');
            u5_sinMult_b <= (others => '0');
            u5_sinMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u5_sinMult_a <= u5_sinTable_q;
            u5_sinMult_b <= u5_beta_times_pi_over_4_shifted_b;
            u5_sinMult_s1 <= STD_LOGIC_VECTOR(u5_sinMult_pr);
        END IF;
    END PROCESS;
    u5_sinMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_sinMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u5_sinMult_q <= u5_sinMult_s1;
        END IF;
    END PROCESS;

	--d_u5_cosTable_q_18_replace_mem(DUALMEM,1058)
    d_u5_cosTable_q_18_replace_mem_reset0 <= areset;
    d_u5_cosTable_q_18_replace_mem_ia <= u5_cosTable_q;
    d_u5_cosTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u5_cosTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u5_cosTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u5_cosTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u5_cosTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u5_cosTable_q_18_replace_mem_iq,
        address_a => d_u5_cosTable_q_18_replace_mem_aa,
        data_a => d_u5_cosTable_q_18_replace_mem_ia
    );
        d_u5_cosTable_q_18_replace_mem_q <= d_u5_cosTable_q_18_replace_mem_iq(11 downto 0);

	--u5_lsCosTable(BITSHIFT,264)@18
    u5_lsCosTable_q_int <= d_u5_cosTable_q_18_replace_mem_q & "00000000000000000000";
    u5_lsCosTable_q <= u5_lsCosTable_q_int(31 downto 0);

	--u5_cosSub(SUB,268)@18
    u5_cosSub_a <= u5_lsCosTable_q(31 downto 18);
    u5_cosSub_b <= STD_LOGIC_VECTOR("00000000" & u5_sinMult_q(23 downto 18));
    u5_cosSub_i <= u0_sin_pi_over_4_q;
    u5_cosSub_a1 <= u5_cosSub_i WHEN (u5_alphaOverflowBitSelect_b = "1") ELSE u5_cosSub_a;
    u5_cosSub_b1 <= (others => '0') WHEN (u5_alphaOverflowBitSelect_b = "1") ELSE u5_cosSub_b;
    u5_cosSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_cosSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u5_cosSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u5_cosSub_a1) - UNSIGNED(u5_cosSub_b1));
        END IF;
    END PROCESS;
    u5_cosSub_q <= u5_cosSub_o(13 downto 0);


	--u5_roundedCos(ROUND,270)@19
    u5_roundedCos_in <= u5_cosSub_q;
    u5_roundedCos: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_roundedCos_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u5_roundedCos_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u5_roundedCos_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u5_roundedCos_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u5_doSwap(LOOKUP,271)@19
    u5_doSwap: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_doSwap_q <= "0";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (d_u5_octantBitSelect_b_19_replace_mem_q) IS
                WHEN "000" =>  u5_doSwap_q <= "0";
                WHEN "001" =>  u5_doSwap_q <= "1";
                WHEN "010" =>  u5_doSwap_q <= "1";
                WHEN "011" =>  u5_doSwap_q <= "0";
                WHEN "100" =>  u5_doSwap_q <= "0";
                WHEN "101" =>  u5_doSwap_q <= "1";
                WHEN "110" =>  u5_doSwap_q <= "1";
                WHEN "111" =>  u5_doSwap_q <= "0";
                WHEN OTHERS =>
                    u5_doSwap_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u5_cosSwapMux(MUX,279)@20
    u5_cosSwapMux_s <= u5_doSwap_q;
    u5_cosSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_cosSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u5_cosSwapMux_s IS
                      WHEN "0" => u5_cosSwapMux_q <= u5_roundedCos_q;
                      WHEN "1" => u5_cosSwapMux_q <= u5_roundedSin_q;
                      WHEN OTHERS => u5_cosSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u5_cosInvert(SUB,281)@21
    u5_cosInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u5_cosInvert_b <= u5_cosSwapMux_q;
    u5_cosInvert_i <= u5_cosInvert_b;
    u5_cosInvert_a1 <= u5_cosInvert_i WHEN (u5_doCosInvert_q = "1") ELSE u5_cosInvert_a;
    u5_cosInvert_b1 <= (others => '0') WHEN (u5_doCosInvert_q = "1") ELSE u5_cosInvert_b;
    u5_cosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_cosInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u5_cosInvert_o <= STD_LOGIC_VECTOR(SIGNED(u5_cosInvert_a1) - SIGNED(u5_cosInvert_b1));
        END IF;
    END PROCESS;
    u5_cosInvert_q <= u5_cosInvert_o(11 downto 0);


	--u4_phaseIncrRegLookup_0(LOOKUP,12)@10
    u4_phaseIncrRegLookup_0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u4_phaseIncrRegLookup_0_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_a) IS
                WHEN "010010110100" =>                     u4_phaseIncrRegLookup_0_e <= busIn_w;
                WHEN OTHERS =>
                    u4_phaseIncrRegLookup_0_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u4_phaseIncrReg_p0(REG,13)@11
    u4_phaseIncrReg_p0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u4_phaseIncrReg_p0_q <= "01000110000000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (u4_phaseIncrRegLookup_0_e = "1") THEN
                u4_phaseIncrReg_p0_q <= d_busIn_d_11_q(19 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u4_invertCos(BITSELECT,234)@20
    u4_invertCos_in <= u4_phaseIncrReg_p0_q(18 downto 0);
    u4_invertCos_b <= u4_invertCos_in(18 downto 18);

	--u4_accumAdd_b1(ADD,200)@10
    u4_accumAdd_b1_a <= u4_accumAdd_b1_q;
    u4_accumAdd_b1_b <= u4_phaseIncrReg_p0_q(17 downto 0);
    u4_accumAdd_b1_i <= xIn_p_4;
    u4_accumAdd_b1_a1 <= u4_accumAdd_b1_i WHEN (xIn_s_4 = "1") ELSE u4_accumAdd_b1_a;
    u4_accumAdd_b1_b1 <= (others => '0') WHEN (xIn_s_4 = "1") ELSE u4_accumAdd_b1_b;
    u4_accumAdd_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_accumAdd_b1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u4_accumAdd_b1_o <= STD_LOGIC_VECTOR(UNSIGNED(u4_accumAdd_b1_a1) + UNSIGNED(u4_accumAdd_b1_b1));
            END IF;
        END IF;
    END PROCESS;
    u4_accumAdd_b1_q <= u4_accumAdd_b1_o(17 downto 0);


	--u4_octantBitSelect(BITSELECT,202)@11
    u4_octantBitSelect_in <= u4_accumAdd_b1_q;
    u4_octantBitSelect_b <= u4_octantBitSelect_in(17 downto 15);

	--d_u4_octantBitSelect_b_19_replace_mem(DUALMEM,980)
    d_u4_octantBitSelect_b_19_replace_mem_reset0 <= areset;
    d_u4_octantBitSelect_b_19_replace_mem_ia <= u4_octantBitSelect_b;
    d_u4_octantBitSelect_b_19_replace_mem_aa <= d_u0_octantBitSelect_b_19_replace_rdreg_q;
    d_u4_octantBitSelect_b_19_replace_mem_ab <= d_u0_octantBitSelect_b_19_replace_rdmux_q;
    d_u4_octantBitSelect_b_19_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 3,
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
        clocken1 => d_u0_octantBitSelect_b_19_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u4_octantBitSelect_b_19_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u4_octantBitSelect_b_19_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u4_octantBitSelect_b_19_replace_mem_iq,
        address_a => d_u4_octantBitSelect_b_19_replace_mem_aa,
        data_a => d_u4_octantBitSelect_b_19_replace_mem_ia
    );
        d_u4_octantBitSelect_b_19_replace_mem_q <= d_u4_octantBitSelect_b_19_replace_mem_iq(2 downto 0);

	--d_u4_octantBitSelect_b_20(DELAY,722)@19
    d_u4_octantBitSelect_b_20 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => d_u4_octantBitSelect_b_19_replace_mem_q, xout => d_u4_octantBitSelect_b_20_q, clk => clk, aclr => areset );

	--u4_cosJoin(BITJOIN,235)@20
    u4_cosJoin_q <= u4_invertCos_b & d_u4_octantBitSelect_b_20_q;

	--u4_doCosInvert(LOOKUP,236)@20
    u4_doCosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_doCosInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u4_cosJoin_q) IS
                WHEN "0000" =>  u4_doCosInvert_q <= "1";
                WHEN "0001" =>  u4_doCosInvert_q <= "1";
                WHEN "0010" =>  u4_doCosInvert_q <= "0";
                WHEN "0011" =>  u4_doCosInvert_q <= "0";
                WHEN "0100" =>  u4_doCosInvert_q <= "0";
                WHEN "0101" =>  u4_doCosInvert_q <= "0";
                WHEN "0110" =>  u4_doCosInvert_q <= "1";
                WHEN "0111" =>  u4_doCosInvert_q <= "1";
                WHEN "1000" =>  u4_doCosInvert_q <= "0";
                WHEN "1001" =>  u4_doCosInvert_q <= "0";
                WHEN "1010" =>  u4_doCosInvert_q <= "1";
                WHEN "1011" =>  u4_doCosInvert_q <= "1";
                WHEN "1100" =>  u4_doCosInvert_q <= "1";
                WHEN "1101" =>  u4_doCosInvert_q <= "1";
                WHEN "1110" =>  u4_doCosInvert_q <= "0";
                WHEN "1111" =>  u4_doCosInvert_q <= "0";
                WHEN OTHERS =>
                    u4_doCosInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u4_addnsubConst(LOOKUP,204)@11
    u4_addnsubConst: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_addnsubConst_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u4_octantBitSelect_b) IS
                WHEN "000" =>  u4_addnsubConst_q <= "1";
                WHEN "001" =>  u4_addnsubConst_q <= "0";
                WHEN "010" =>  u4_addnsubConst_q <= "1";
                WHEN "011" =>  u4_addnsubConst_q <= "0";
                WHEN "100" =>  u4_addnsubConst_q <= "1";
                WHEN "101" =>  u4_addnsubConst_q <= "0";
                WHEN "110" =>  u4_addnsubConst_q <= "1";
                WHEN "111" =>  u4_addnsubConst_q <= "0";
                WHEN OTHERS =>
                    u4_addnsubConst_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--d_u4_accumAdd_b1_q_12(DELAY,720)@11
    d_u4_accumAdd_b1_q_12 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => u4_accumAdd_b1_q, xout => d_u4_accumAdd_b1_q_12_q, clk => clk, aclr => areset );

	--u4_rangeLUT(LOOKUP,203)@11
    u4_rangeLUT: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_rangeLUT_q <= "0000000000000000000";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u4_octantBitSelect_b) IS
                WHEN "000" =>  u4_rangeLUT_q <= "0000000000000000000";
                WHEN "001" =>  u4_rangeLUT_q <= "0010000000000000000";
                WHEN "010" =>  u4_rangeLUT_q <= "1110000000000000000";
                WHEN "011" =>  u4_rangeLUT_q <= "0100000000000000000";
                WHEN "100" =>  u4_rangeLUT_q <= "1100000000000000000";
                WHEN "101" =>  u4_rangeLUT_q <= "0110000000000000000";
                WHEN "110" =>  u4_rangeLUT_q <= "1010000000000000000";
                WHEN "111" =>  u4_rangeLUT_q <= "1100000000000000000";
                WHEN OTHERS =>
                    u4_rangeLUT_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u4_rangeAddSub(ADDSUB,205)@12
    u4_rangeAddSub_cin <= GND_q;
    u4_rangeAddSub_a <= STD_LOGIC_VECTOR("0" & u4_rangeLUT_q) & u4_addnsubConst_q(0);
    u4_rangeAddSub_b <= STD_LOGIC_VECTOR("00" & d_u4_accumAdd_b1_q_12_q) & u4_rangeAddSub_cin(0);
    u4_rangeAddSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_rangeAddSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u4_addnsubConst_q = "1") THEN
                u4_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u4_rangeAddSub_a) + UNSIGNED(u4_rangeAddSub_b));
            ELSE
                u4_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u4_rangeAddSub_a) - UNSIGNED(u4_rangeAddSub_b));
            END IF;
        END IF;
    END PROCESS;
    u4_rangeAddSub_q <= u4_rangeAddSub_o(19 downto 1);


	--d_u4_rangeAddSub_q_18_replace_mem(DUALMEM,992)
    d_u4_rangeAddSub_q_18_replace_mem_reset0 <= areset;
    d_u4_rangeAddSub_q_18_replace_mem_ia <= u4_rangeAddSub_q;
    d_u4_rangeAddSub_q_18_replace_mem_aa <= d_u0_rangeAddSub_q_18_replace_rdreg_q;
    d_u4_rangeAddSub_q_18_replace_mem_ab <= d_u0_rangeAddSub_q_18_replace_rdmux_q;
    d_u4_rangeAddSub_q_18_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 19,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 19,
        widthad_b => 2,
        numwords_b => 4,
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
        clocken1 => d_u0_rangeAddSub_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u4_rangeAddSub_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u4_rangeAddSub_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u4_rangeAddSub_q_18_replace_mem_iq,
        address_a => d_u4_rangeAddSub_q_18_replace_mem_aa,
        data_a => d_u4_rangeAddSub_q_18_replace_mem_ia
    );
        d_u4_rangeAddSub_q_18_replace_mem_q <= d_u4_rangeAddSub_q_18_replace_mem_iq(18 downto 0);

	--u4_alphaOverflowBitSelect(BITSELECT,207)@18
    u4_alphaOverflowBitSelect_in <= d_u4_rangeAddSub_q_18_replace_mem_q(15 downto 0);
    u4_alphaOverflowBitSelect_b <= u4_alphaOverflowBitSelect_in(15 downto 15);

	--u4_betaBitSelect(BITSELECT,208)@13
    u4_betaBitSelect_in <= u4_rangeAddSub_q(6 downto 0);
    u4_betaBitSelect_b <= u4_betaBitSelect_in(6 downto 0);

	--u4_ls4(BITSHIFT,215)@13
    u4_ls4_q_int <= u4_betaBitSelect_b & "0000";
    u4_ls4_q <= u4_ls4_q_int(10 downto 0);

	--u4_ls7(BITSHIFT,214)@13
    u4_ls7_q_int <= u4_betaBitSelect_b & "0000000";
    u4_ls7_q <= u4_ls7_q_int(13 downto 0);

	--u4_cm2(ADD,216)@13
    u4_cm2_a <= STD_LOGIC_VECTOR("0" & u4_ls7_q);
    u4_cm2_b <= STD_LOGIC_VECTOR("0000" & u4_ls4_q);
    u4_cm2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_cm2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u4_cm2_o <= STD_LOGIC_VECTOR(UNSIGNED(u4_cm2_a) + UNSIGNED(u4_cm2_b));
        END IF;
    END PROCESS;
    u4_cm2_q <= u4_cm2_o(14 downto 0);


	--u4_ls10(BITSHIFT,212)@13
    u4_ls10_q_int <= u4_betaBitSelect_b & "0000000000";
    u4_ls10_q <= u4_ls10_q_int(16 downto 0);

	--u4_ls12(BITSHIFT,211)@13
    u4_ls12_q_int <= u4_betaBitSelect_b & "000000000000";
    u4_ls12_q <= u4_ls12_q_int(18 downto 0);

	--u4_cm1(SUB,213)@13
    u4_cm1_a <= STD_LOGIC_VECTOR("0" & u4_ls12_q);
    u4_cm1_b <= STD_LOGIC_VECTOR("000" & u4_ls10_q);
    u4_cm1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_cm1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u4_cm1_o <= STD_LOGIC_VECTOR(UNSIGNED(u4_cm1_a) - UNSIGNED(u4_cm1_b));
        END IF;
    END PROCESS;
    u4_cm1_q <= u4_cm1_o(19 downto 0);


	--u4_cm3(ADD,217)@14
    u4_cm3_a <= STD_LOGIC_VECTOR("0" & u4_cm1_q);
    u4_cm3_b <= STD_LOGIC_VECTOR("000000" & u4_cm2_q);
    u4_cm3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_cm3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u4_cm3_o <= STD_LOGIC_VECTOR(UNSIGNED(u4_cm3_a) + UNSIGNED(u4_cm3_b));
        END IF;
    END PROCESS;
    u4_cm3_q <= u4_cm3_o(20 downto 0);


	--u4_beta_times_4_shift(BITSHIFT,218)@15
    u4_beta_times_4_shift_q_int <= u4_cm3_q(20 downto 1);
    u4_beta_times_4_shift_q <= u4_beta_times_4_shift_q_int(19 downto 0);

	--u4_beta_times_pi_over_4_shifted(BITSELECT,219)@15
    u4_beta_times_pi_over_4_shifted_in <= u4_beta_times_4_shift_q(17 downto 0);
    u4_beta_times_pi_over_4_shifted_b <= u4_beta_times_pi_over_4_shifted_in(17 downto 6);

	--u4_alphaBitSelect(BITSELECT,206)@13
    u4_alphaBitSelect_in <= u4_rangeAddSub_q(14 downto 0);
    u4_alphaBitSelect_b <= u4_alphaBitSelect_in(14 downto 7);

	--u4_cosTable(DUALMEM,210)@13
    u4_cosTable_reset0 <= areset;
    u4_cosTable_ia <= (others => '0');
    u4_cosTable_aa <= (others => '0');
    u4_cosTable_ab <= u4_alphaBitSelect_b;
    u4_cosTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u4_cosTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u4_cosTable_reset0,
        clock0 => clk,
        address_b => u4_cosTable_ab,
        -- data_b => (others => '0'),
        q_b => u4_cosTable_iq,
        address_a => u4_cosTable_aa,
        data_a => u4_cosTable_ia
    );
        u4_cosTable_q <= u4_cosTable_iq(11 downto 0);

	--u4_cosMult(MULT,221)@15
    u4_cosMult_pr <= UNSIGNED(u4_cosMult_a) * UNSIGNED(u4_cosMult_b);
    u4_cosMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_cosMult_a <= (others => '0');
            u4_cosMult_b <= (others => '0');
            u4_cosMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u4_cosMult_a <= u4_cosTable_q;
            u4_cosMult_b <= u4_beta_times_pi_over_4_shifted_b;
            u4_cosMult_s1 <= STD_LOGIC_VECTOR(u4_cosMult_pr);
        END IF;
    END PROCESS;
    u4_cosMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_cosMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u4_cosMult_q <= u4_cosMult_s1;
        END IF;
    END PROCESS;

	--u4_sinTable(DUALMEM,209)@13
    u4_sinTable_reset0 <= areset;
    u4_sinTable_ia <= (others => '0');
    u4_sinTable_aa <= (others => '0');
    u4_sinTable_ab <= u4_alphaBitSelect_b;
    u4_sinTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u4_sinTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u4_sinTable_reset0,
        clock0 => clk,
        address_b => u4_sinTable_ab,
        -- data_b => (others => '0'),
        q_b => u4_sinTable_iq,
        address_a => u4_sinTable_aa,
        data_a => u4_sinTable_ia
    );
        u4_sinTable_q <= u4_sinTable_iq(11 downto 0);

	--d_u4_sinTable_q_18_replace_mem(DUALMEM,1004)
    d_u4_sinTable_q_18_replace_mem_reset0 <= areset;
    d_u4_sinTable_q_18_replace_mem_ia <= u4_sinTable_q;
    d_u4_sinTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u4_sinTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u4_sinTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u4_sinTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u4_sinTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u4_sinTable_q_18_replace_mem_iq,
        address_a => d_u4_sinTable_q_18_replace_mem_aa,
        data_a => d_u4_sinTable_q_18_replace_mem_ia
    );
        d_u4_sinTable_q_18_replace_mem_q <= d_u4_sinTable_q_18_replace_mem_iq(11 downto 0);

	--u4_lsSinTable(BITSHIFT,222)@18
    u4_lsSinTable_q_int <= d_u4_sinTable_q_18_replace_mem_q & "00000000000000000000";
    u4_lsSinTable_q <= u4_lsSinTable_q_int(31 downto 0);

	--u4_sinAdd(ADD,226)@18
    u4_sinAdd_a <= u4_lsSinTable_q(31 downto 18);
    u4_sinAdd_b <= STD_LOGIC_VECTOR("00000000" & u4_cosMult_q(23 downto 18));
    u4_sinAdd_i <= u0_sin_pi_over_4_q;
    u4_sinAdd_a1 <= u4_sinAdd_i WHEN (u4_alphaOverflowBitSelect_b = "1") ELSE u4_sinAdd_a;
    u4_sinAdd_b1 <= (others => '0') WHEN (u4_alphaOverflowBitSelect_b = "1") ELSE u4_sinAdd_b;
    u4_sinAdd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_sinAdd_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u4_sinAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(u4_sinAdd_a1) + UNSIGNED(u4_sinAdd_b1));
        END IF;
    END PROCESS;
    u4_sinAdd_q <= u4_sinAdd_o(13 downto 0);


	--u4_roundedSin(ROUND,228)@19
    u4_roundedSin_in <= u4_sinAdd_q;
    u4_roundedSin: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_roundedSin_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u4_roundedSin_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u4_roundedSin_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u4_roundedSin_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u4_sinMult(MULT,220)@15
    u4_sinMult_pr <= UNSIGNED(u4_sinMult_a) * UNSIGNED(u4_sinMult_b);
    u4_sinMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_sinMult_a <= (others => '0');
            u4_sinMult_b <= (others => '0');
            u4_sinMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u4_sinMult_a <= u4_sinTable_q;
            u4_sinMult_b <= u4_beta_times_pi_over_4_shifted_b;
            u4_sinMult_s1 <= STD_LOGIC_VECTOR(u4_sinMult_pr);
        END IF;
    END PROCESS;
    u4_sinMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_sinMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u4_sinMult_q <= u4_sinMult_s1;
        END IF;
    END PROCESS;

	--d_u4_cosTable_q_18_replace_mem(DUALMEM,1014)
    d_u4_cosTable_q_18_replace_mem_reset0 <= areset;
    d_u4_cosTable_q_18_replace_mem_ia <= u4_cosTable_q;
    d_u4_cosTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u4_cosTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u4_cosTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u4_cosTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u4_cosTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u4_cosTable_q_18_replace_mem_iq,
        address_a => d_u4_cosTable_q_18_replace_mem_aa,
        data_a => d_u4_cosTable_q_18_replace_mem_ia
    );
        d_u4_cosTable_q_18_replace_mem_q <= d_u4_cosTable_q_18_replace_mem_iq(11 downto 0);

	--u4_lsCosTable(BITSHIFT,223)@18
    u4_lsCosTable_q_int <= d_u4_cosTable_q_18_replace_mem_q & "00000000000000000000";
    u4_lsCosTable_q <= u4_lsCosTable_q_int(31 downto 0);

	--u4_cosSub(SUB,227)@18
    u4_cosSub_a <= u4_lsCosTable_q(31 downto 18);
    u4_cosSub_b <= STD_LOGIC_VECTOR("00000000" & u4_sinMult_q(23 downto 18));
    u4_cosSub_i <= u0_sin_pi_over_4_q;
    u4_cosSub_a1 <= u4_cosSub_i WHEN (u4_alphaOverflowBitSelect_b = "1") ELSE u4_cosSub_a;
    u4_cosSub_b1 <= (others => '0') WHEN (u4_alphaOverflowBitSelect_b = "1") ELSE u4_cosSub_b;
    u4_cosSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_cosSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u4_cosSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u4_cosSub_a1) - UNSIGNED(u4_cosSub_b1));
        END IF;
    END PROCESS;
    u4_cosSub_q <= u4_cosSub_o(13 downto 0);


	--u4_roundedCos(ROUND,229)@19
    u4_roundedCos_in <= u4_cosSub_q;
    u4_roundedCos: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_roundedCos_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u4_roundedCos_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u4_roundedCos_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u4_roundedCos_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u4_doSwap(LOOKUP,230)@19
    u4_doSwap: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_doSwap_q <= "0";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (d_u4_octantBitSelect_b_19_replace_mem_q) IS
                WHEN "000" =>  u4_doSwap_q <= "0";
                WHEN "001" =>  u4_doSwap_q <= "1";
                WHEN "010" =>  u4_doSwap_q <= "1";
                WHEN "011" =>  u4_doSwap_q <= "0";
                WHEN "100" =>  u4_doSwap_q <= "0";
                WHEN "101" =>  u4_doSwap_q <= "1";
                WHEN "110" =>  u4_doSwap_q <= "1";
                WHEN "111" =>  u4_doSwap_q <= "0";
                WHEN OTHERS =>
                    u4_doSwap_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u4_cosSwapMux(MUX,238)@20
    u4_cosSwapMux_s <= u4_doSwap_q;
    u4_cosSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_cosSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u4_cosSwapMux_s IS
                      WHEN "0" => u4_cosSwapMux_q <= u4_roundedCos_q;
                      WHEN "1" => u4_cosSwapMux_q <= u4_roundedSin_q;
                      WHEN OTHERS => u4_cosSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u4_cosInvert(SUB,240)@21
    u4_cosInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u4_cosInvert_b <= u4_cosSwapMux_q;
    u4_cosInvert_i <= u4_cosInvert_b;
    u4_cosInvert_a1 <= u4_cosInvert_i WHEN (u4_doCosInvert_q = "1") ELSE u4_cosInvert_a;
    u4_cosInvert_b1 <= (others => '0') WHEN (u4_doCosInvert_q = "1") ELSE u4_cosInvert_b;
    u4_cosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_cosInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u4_cosInvert_o <= STD_LOGIC_VECTOR(SIGNED(u4_cosInvert_a1) - SIGNED(u4_cosInvert_b1));
        END IF;
    END PROCESS;
    u4_cosInvert_q <= u4_cosInvert_o(11 downto 0);


	--u3_phaseIncrRegLookup_0(LOOKUP,10)@10
    u3_phaseIncrRegLookup_0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u3_phaseIncrRegLookup_0_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_a) IS
                WHEN "010010110011" =>                     u3_phaseIncrRegLookup_0_e <= busIn_w;
                WHEN OTHERS =>
                    u3_phaseIncrRegLookup_0_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u3_phaseIncrReg_p0(REG,11)@11
    u3_phaseIncrReg_p0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u3_phaseIncrReg_p0_q <= "01000110000000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (u3_phaseIncrRegLookup_0_e = "1") THEN
                u3_phaseIncrReg_p0_q <= d_busIn_d_11_q(19 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u3_invertCos(BITSELECT,193)@20
    u3_invertCos_in <= u3_phaseIncrReg_p0_q(18 downto 0);
    u3_invertCos_b <= u3_invertCos_in(18 downto 18);

	--u3_accumAdd_b1(ADD,159)@10
    u3_accumAdd_b1_a <= u3_accumAdd_b1_q;
    u3_accumAdd_b1_b <= u3_phaseIncrReg_p0_q(17 downto 0);
    u3_accumAdd_b1_i <= xIn_p_3;
    u3_accumAdd_b1_a1 <= u3_accumAdd_b1_i WHEN (xIn_s_3 = "1") ELSE u3_accumAdd_b1_a;
    u3_accumAdd_b1_b1 <= (others => '0') WHEN (xIn_s_3 = "1") ELSE u3_accumAdd_b1_b;
    u3_accumAdd_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_accumAdd_b1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u3_accumAdd_b1_o <= STD_LOGIC_VECTOR(UNSIGNED(u3_accumAdd_b1_a1) + UNSIGNED(u3_accumAdd_b1_b1));
            END IF;
        END IF;
    END PROCESS;
    u3_accumAdd_b1_q <= u3_accumAdd_b1_o(17 downto 0);


	--u3_octantBitSelect(BITSELECT,161)@11
    u3_octantBitSelect_in <= u3_accumAdd_b1_q;
    u3_octantBitSelect_b <= u3_octantBitSelect_in(17 downto 15);

	--d_u3_octantBitSelect_b_19_replace_mem(DUALMEM,936)
    d_u3_octantBitSelect_b_19_replace_mem_reset0 <= areset;
    d_u3_octantBitSelect_b_19_replace_mem_ia <= u3_octantBitSelect_b;
    d_u3_octantBitSelect_b_19_replace_mem_aa <= d_u0_octantBitSelect_b_19_replace_rdreg_q;
    d_u3_octantBitSelect_b_19_replace_mem_ab <= d_u0_octantBitSelect_b_19_replace_rdmux_q;
    d_u3_octantBitSelect_b_19_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 3,
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
        clocken1 => d_u0_octantBitSelect_b_19_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u3_octantBitSelect_b_19_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u3_octantBitSelect_b_19_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u3_octantBitSelect_b_19_replace_mem_iq,
        address_a => d_u3_octantBitSelect_b_19_replace_mem_aa,
        data_a => d_u3_octantBitSelect_b_19_replace_mem_ia
    );
        d_u3_octantBitSelect_b_19_replace_mem_q <= d_u3_octantBitSelect_b_19_replace_mem_iq(2 downto 0);

	--d_u3_octantBitSelect_b_20(DELAY,716)@19
    d_u3_octantBitSelect_b_20 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => d_u3_octantBitSelect_b_19_replace_mem_q, xout => d_u3_octantBitSelect_b_20_q, clk => clk, aclr => areset );

	--u3_cosJoin(BITJOIN,194)@20
    u3_cosJoin_q <= u3_invertCos_b & d_u3_octantBitSelect_b_20_q;

	--u3_doCosInvert(LOOKUP,195)@20
    u3_doCosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_doCosInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u3_cosJoin_q) IS
                WHEN "0000" =>  u3_doCosInvert_q <= "1";
                WHEN "0001" =>  u3_doCosInvert_q <= "1";
                WHEN "0010" =>  u3_doCosInvert_q <= "0";
                WHEN "0011" =>  u3_doCosInvert_q <= "0";
                WHEN "0100" =>  u3_doCosInvert_q <= "0";
                WHEN "0101" =>  u3_doCosInvert_q <= "0";
                WHEN "0110" =>  u3_doCosInvert_q <= "1";
                WHEN "0111" =>  u3_doCosInvert_q <= "1";
                WHEN "1000" =>  u3_doCosInvert_q <= "0";
                WHEN "1001" =>  u3_doCosInvert_q <= "0";
                WHEN "1010" =>  u3_doCosInvert_q <= "1";
                WHEN "1011" =>  u3_doCosInvert_q <= "1";
                WHEN "1100" =>  u3_doCosInvert_q <= "1";
                WHEN "1101" =>  u3_doCosInvert_q <= "1";
                WHEN "1110" =>  u3_doCosInvert_q <= "0";
                WHEN "1111" =>  u3_doCosInvert_q <= "0";
                WHEN OTHERS =>
                    u3_doCosInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u3_addnsubConst(LOOKUP,163)@11
    u3_addnsubConst: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_addnsubConst_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u3_octantBitSelect_b) IS
                WHEN "000" =>  u3_addnsubConst_q <= "1";
                WHEN "001" =>  u3_addnsubConst_q <= "0";
                WHEN "010" =>  u3_addnsubConst_q <= "1";
                WHEN "011" =>  u3_addnsubConst_q <= "0";
                WHEN "100" =>  u3_addnsubConst_q <= "1";
                WHEN "101" =>  u3_addnsubConst_q <= "0";
                WHEN "110" =>  u3_addnsubConst_q <= "1";
                WHEN "111" =>  u3_addnsubConst_q <= "0";
                WHEN OTHERS =>
                    u3_addnsubConst_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--d_u3_accumAdd_b1_q_12(DELAY,714)@11
    d_u3_accumAdd_b1_q_12 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => u3_accumAdd_b1_q, xout => d_u3_accumAdd_b1_q_12_q, clk => clk, aclr => areset );

	--u3_rangeLUT(LOOKUP,162)@11
    u3_rangeLUT: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_rangeLUT_q <= "0000000000000000000";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u3_octantBitSelect_b) IS
                WHEN "000" =>  u3_rangeLUT_q <= "0000000000000000000";
                WHEN "001" =>  u3_rangeLUT_q <= "0010000000000000000";
                WHEN "010" =>  u3_rangeLUT_q <= "1110000000000000000";
                WHEN "011" =>  u3_rangeLUT_q <= "0100000000000000000";
                WHEN "100" =>  u3_rangeLUT_q <= "1100000000000000000";
                WHEN "101" =>  u3_rangeLUT_q <= "0110000000000000000";
                WHEN "110" =>  u3_rangeLUT_q <= "1010000000000000000";
                WHEN "111" =>  u3_rangeLUT_q <= "1100000000000000000";
                WHEN OTHERS =>
                    u3_rangeLUT_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u3_rangeAddSub(ADDSUB,164)@12
    u3_rangeAddSub_cin <= GND_q;
    u3_rangeAddSub_a <= STD_LOGIC_VECTOR("0" & u3_rangeLUT_q) & u3_addnsubConst_q(0);
    u3_rangeAddSub_b <= STD_LOGIC_VECTOR("00" & d_u3_accumAdd_b1_q_12_q) & u3_rangeAddSub_cin(0);
    u3_rangeAddSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_rangeAddSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u3_addnsubConst_q = "1") THEN
                u3_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u3_rangeAddSub_a) + UNSIGNED(u3_rangeAddSub_b));
            ELSE
                u3_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u3_rangeAddSub_a) - UNSIGNED(u3_rangeAddSub_b));
            END IF;
        END IF;
    END PROCESS;
    u3_rangeAddSub_q <= u3_rangeAddSub_o(19 downto 1);


	--d_u3_rangeAddSub_q_18_replace_mem(DUALMEM,948)
    d_u3_rangeAddSub_q_18_replace_mem_reset0 <= areset;
    d_u3_rangeAddSub_q_18_replace_mem_ia <= u3_rangeAddSub_q;
    d_u3_rangeAddSub_q_18_replace_mem_aa <= d_u0_rangeAddSub_q_18_replace_rdreg_q;
    d_u3_rangeAddSub_q_18_replace_mem_ab <= d_u0_rangeAddSub_q_18_replace_rdmux_q;
    d_u3_rangeAddSub_q_18_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 19,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 19,
        widthad_b => 2,
        numwords_b => 4,
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
        clocken1 => d_u0_rangeAddSub_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u3_rangeAddSub_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u3_rangeAddSub_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u3_rangeAddSub_q_18_replace_mem_iq,
        address_a => d_u3_rangeAddSub_q_18_replace_mem_aa,
        data_a => d_u3_rangeAddSub_q_18_replace_mem_ia
    );
        d_u3_rangeAddSub_q_18_replace_mem_q <= d_u3_rangeAddSub_q_18_replace_mem_iq(18 downto 0);

	--u3_alphaOverflowBitSelect(BITSELECT,166)@18
    u3_alphaOverflowBitSelect_in <= d_u3_rangeAddSub_q_18_replace_mem_q(15 downto 0);
    u3_alphaOverflowBitSelect_b <= u3_alphaOverflowBitSelect_in(15 downto 15);

	--u3_betaBitSelect(BITSELECT,167)@13
    u3_betaBitSelect_in <= u3_rangeAddSub_q(6 downto 0);
    u3_betaBitSelect_b <= u3_betaBitSelect_in(6 downto 0);

	--u3_ls4(BITSHIFT,174)@13
    u3_ls4_q_int <= u3_betaBitSelect_b & "0000";
    u3_ls4_q <= u3_ls4_q_int(10 downto 0);

	--u3_ls7(BITSHIFT,173)@13
    u3_ls7_q_int <= u3_betaBitSelect_b & "0000000";
    u3_ls7_q <= u3_ls7_q_int(13 downto 0);

	--u3_cm2(ADD,175)@13
    u3_cm2_a <= STD_LOGIC_VECTOR("0" & u3_ls7_q);
    u3_cm2_b <= STD_LOGIC_VECTOR("0000" & u3_ls4_q);
    u3_cm2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_cm2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_cm2_o <= STD_LOGIC_VECTOR(UNSIGNED(u3_cm2_a) + UNSIGNED(u3_cm2_b));
        END IF;
    END PROCESS;
    u3_cm2_q <= u3_cm2_o(14 downto 0);


	--u3_ls10(BITSHIFT,171)@13
    u3_ls10_q_int <= u3_betaBitSelect_b & "0000000000";
    u3_ls10_q <= u3_ls10_q_int(16 downto 0);

	--u3_ls12(BITSHIFT,170)@13
    u3_ls12_q_int <= u3_betaBitSelect_b & "000000000000";
    u3_ls12_q <= u3_ls12_q_int(18 downto 0);

	--u3_cm1(SUB,172)@13
    u3_cm1_a <= STD_LOGIC_VECTOR("0" & u3_ls12_q);
    u3_cm1_b <= STD_LOGIC_VECTOR("000" & u3_ls10_q);
    u3_cm1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_cm1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_cm1_o <= STD_LOGIC_VECTOR(UNSIGNED(u3_cm1_a) - UNSIGNED(u3_cm1_b));
        END IF;
    END PROCESS;
    u3_cm1_q <= u3_cm1_o(19 downto 0);


	--u3_cm3(ADD,176)@14
    u3_cm3_a <= STD_LOGIC_VECTOR("0" & u3_cm1_q);
    u3_cm3_b <= STD_LOGIC_VECTOR("000000" & u3_cm2_q);
    u3_cm3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_cm3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_cm3_o <= STD_LOGIC_VECTOR(UNSIGNED(u3_cm3_a) + UNSIGNED(u3_cm3_b));
        END IF;
    END PROCESS;
    u3_cm3_q <= u3_cm3_o(20 downto 0);


	--u3_beta_times_4_shift(BITSHIFT,177)@15
    u3_beta_times_4_shift_q_int <= u3_cm3_q(20 downto 1);
    u3_beta_times_4_shift_q <= u3_beta_times_4_shift_q_int(19 downto 0);

	--u3_beta_times_pi_over_4_shifted(BITSELECT,178)@15
    u3_beta_times_pi_over_4_shifted_in <= u3_beta_times_4_shift_q(17 downto 0);
    u3_beta_times_pi_over_4_shifted_b <= u3_beta_times_pi_over_4_shifted_in(17 downto 6);

	--u3_alphaBitSelect(BITSELECT,165)@13
    u3_alphaBitSelect_in <= u3_rangeAddSub_q(14 downto 0);
    u3_alphaBitSelect_b <= u3_alphaBitSelect_in(14 downto 7);

	--u3_cosTable(DUALMEM,169)@13
    u3_cosTable_reset0 <= areset;
    u3_cosTable_ia <= (others => '0');
    u3_cosTable_aa <= (others => '0');
    u3_cosTable_ab <= u3_alphaBitSelect_b;
    u3_cosTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u3_cosTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u3_cosTable_reset0,
        clock0 => clk,
        address_b => u3_cosTable_ab,
        -- data_b => (others => '0'),
        q_b => u3_cosTable_iq,
        address_a => u3_cosTable_aa,
        data_a => u3_cosTable_ia
    );
        u3_cosTable_q <= u3_cosTable_iq(11 downto 0);

	--u3_cosMult(MULT,180)@15
    u3_cosMult_pr <= UNSIGNED(u3_cosMult_a) * UNSIGNED(u3_cosMult_b);
    u3_cosMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_cosMult_a <= (others => '0');
            u3_cosMult_b <= (others => '0');
            u3_cosMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_cosMult_a <= u3_cosTable_q;
            u3_cosMult_b <= u3_beta_times_pi_over_4_shifted_b;
            u3_cosMult_s1 <= STD_LOGIC_VECTOR(u3_cosMult_pr);
        END IF;
    END PROCESS;
    u3_cosMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_cosMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_cosMult_q <= u3_cosMult_s1;
        END IF;
    END PROCESS;

	--u3_sinTable(DUALMEM,168)@13
    u3_sinTable_reset0 <= areset;
    u3_sinTable_ia <= (others => '0');
    u3_sinTable_aa <= (others => '0');
    u3_sinTable_ab <= u3_alphaBitSelect_b;
    u3_sinTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u3_sinTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u3_sinTable_reset0,
        clock0 => clk,
        address_b => u3_sinTable_ab,
        -- data_b => (others => '0'),
        q_b => u3_sinTable_iq,
        address_a => u3_sinTable_aa,
        data_a => u3_sinTable_ia
    );
        u3_sinTable_q <= u3_sinTable_iq(11 downto 0);

	--d_u3_sinTable_q_18_replace_mem(DUALMEM,960)
    d_u3_sinTable_q_18_replace_mem_reset0 <= areset;
    d_u3_sinTable_q_18_replace_mem_ia <= u3_sinTable_q;
    d_u3_sinTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u3_sinTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u3_sinTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u3_sinTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u3_sinTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u3_sinTable_q_18_replace_mem_iq,
        address_a => d_u3_sinTable_q_18_replace_mem_aa,
        data_a => d_u3_sinTable_q_18_replace_mem_ia
    );
        d_u3_sinTable_q_18_replace_mem_q <= d_u3_sinTable_q_18_replace_mem_iq(11 downto 0);

	--u3_lsSinTable(BITSHIFT,181)@18
    u3_lsSinTable_q_int <= d_u3_sinTable_q_18_replace_mem_q & "00000000000000000000";
    u3_lsSinTable_q <= u3_lsSinTable_q_int(31 downto 0);

	--u3_sinAdd(ADD,185)@18
    u3_sinAdd_a <= u3_lsSinTable_q(31 downto 18);
    u3_sinAdd_b <= STD_LOGIC_VECTOR("00000000" & u3_cosMult_q(23 downto 18));
    u3_sinAdd_i <= u0_sin_pi_over_4_q;
    u3_sinAdd_a1 <= u3_sinAdd_i WHEN (u3_alphaOverflowBitSelect_b = "1") ELSE u3_sinAdd_a;
    u3_sinAdd_b1 <= (others => '0') WHEN (u3_alphaOverflowBitSelect_b = "1") ELSE u3_sinAdd_b;
    u3_sinAdd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_sinAdd_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_sinAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(u3_sinAdd_a1) + UNSIGNED(u3_sinAdd_b1));
        END IF;
    END PROCESS;
    u3_sinAdd_q <= u3_sinAdd_o(13 downto 0);


	--u3_roundedSin(ROUND,187)@19
    u3_roundedSin_in <= u3_sinAdd_q;
    u3_roundedSin: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_roundedSin_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_roundedSin_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u3_roundedSin_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u3_roundedSin_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u3_sinMult(MULT,179)@15
    u3_sinMult_pr <= UNSIGNED(u3_sinMult_a) * UNSIGNED(u3_sinMult_b);
    u3_sinMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_sinMult_a <= (others => '0');
            u3_sinMult_b <= (others => '0');
            u3_sinMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_sinMult_a <= u3_sinTable_q;
            u3_sinMult_b <= u3_beta_times_pi_over_4_shifted_b;
            u3_sinMult_s1 <= STD_LOGIC_VECTOR(u3_sinMult_pr);
        END IF;
    END PROCESS;
    u3_sinMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_sinMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_sinMult_q <= u3_sinMult_s1;
        END IF;
    END PROCESS;

	--d_u3_cosTable_q_18_replace_mem(DUALMEM,970)
    d_u3_cosTable_q_18_replace_mem_reset0 <= areset;
    d_u3_cosTable_q_18_replace_mem_ia <= u3_cosTable_q;
    d_u3_cosTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u3_cosTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u3_cosTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u3_cosTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u3_cosTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u3_cosTable_q_18_replace_mem_iq,
        address_a => d_u3_cosTable_q_18_replace_mem_aa,
        data_a => d_u3_cosTable_q_18_replace_mem_ia
    );
        d_u3_cosTable_q_18_replace_mem_q <= d_u3_cosTable_q_18_replace_mem_iq(11 downto 0);

	--u3_lsCosTable(BITSHIFT,182)@18
    u3_lsCosTable_q_int <= d_u3_cosTable_q_18_replace_mem_q & "00000000000000000000";
    u3_lsCosTable_q <= u3_lsCosTable_q_int(31 downto 0);

	--u3_cosSub(SUB,186)@18
    u3_cosSub_a <= u3_lsCosTable_q(31 downto 18);
    u3_cosSub_b <= STD_LOGIC_VECTOR("00000000" & u3_sinMult_q(23 downto 18));
    u3_cosSub_i <= u0_sin_pi_over_4_q;
    u3_cosSub_a1 <= u3_cosSub_i WHEN (u3_alphaOverflowBitSelect_b = "1") ELSE u3_cosSub_a;
    u3_cosSub_b1 <= (others => '0') WHEN (u3_alphaOverflowBitSelect_b = "1") ELSE u3_cosSub_b;
    u3_cosSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_cosSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_cosSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u3_cosSub_a1) - UNSIGNED(u3_cosSub_b1));
        END IF;
    END PROCESS;
    u3_cosSub_q <= u3_cosSub_o(13 downto 0);


	--u3_roundedCos(ROUND,188)@19
    u3_roundedCos_in <= u3_cosSub_q;
    u3_roundedCos: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_roundedCos_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_roundedCos_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u3_roundedCos_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u3_roundedCos_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u3_doSwap(LOOKUP,189)@19
    u3_doSwap: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_doSwap_q <= "0";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (d_u3_octantBitSelect_b_19_replace_mem_q) IS
                WHEN "000" =>  u3_doSwap_q <= "0";
                WHEN "001" =>  u3_doSwap_q <= "1";
                WHEN "010" =>  u3_doSwap_q <= "1";
                WHEN "011" =>  u3_doSwap_q <= "0";
                WHEN "100" =>  u3_doSwap_q <= "0";
                WHEN "101" =>  u3_doSwap_q <= "1";
                WHEN "110" =>  u3_doSwap_q <= "1";
                WHEN "111" =>  u3_doSwap_q <= "0";
                WHEN OTHERS =>
                    u3_doSwap_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u3_cosSwapMux(MUX,197)@20
    u3_cosSwapMux_s <= u3_doSwap_q;
    u3_cosSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_cosSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u3_cosSwapMux_s IS
                      WHEN "0" => u3_cosSwapMux_q <= u3_roundedCos_q;
                      WHEN "1" => u3_cosSwapMux_q <= u3_roundedSin_q;
                      WHEN OTHERS => u3_cosSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u3_cosInvert(SUB,199)@21
    u3_cosInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u3_cosInvert_b <= u3_cosSwapMux_q;
    u3_cosInvert_i <= u3_cosInvert_b;
    u3_cosInvert_a1 <= u3_cosInvert_i WHEN (u3_doCosInvert_q = "1") ELSE u3_cosInvert_a;
    u3_cosInvert_b1 <= (others => '0') WHEN (u3_doCosInvert_q = "1") ELSE u3_cosInvert_b;
    u3_cosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_cosInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_cosInvert_o <= STD_LOGIC_VECTOR(SIGNED(u3_cosInvert_a1) - SIGNED(u3_cosInvert_b1));
        END IF;
    END PROCESS;
    u3_cosInvert_q <= u3_cosInvert_o(11 downto 0);


	--u2_phaseIncrRegLookup_0(LOOKUP,8)@10
    u2_phaseIncrRegLookup_0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u2_phaseIncrRegLookup_0_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_a) IS
                WHEN "010010110010" =>                     u2_phaseIncrRegLookup_0_e <= busIn_w;
                WHEN OTHERS =>
                    u2_phaseIncrRegLookup_0_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u2_phaseIncrReg_p0(REG,9)@11
    u2_phaseIncrReg_p0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u2_phaseIncrReg_p0_q <= "01000110000000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (u2_phaseIncrRegLookup_0_e = "1") THEN
                u2_phaseIncrReg_p0_q <= d_busIn_d_11_q(19 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u2_invertCos(BITSELECT,152)@20
    u2_invertCos_in <= u2_phaseIncrReg_p0_q(18 downto 0);
    u2_invertCos_b <= u2_invertCos_in(18 downto 18);

	--u2_accumAdd_b1(ADD,118)@10
    u2_accumAdd_b1_a <= u2_accumAdd_b1_q;
    u2_accumAdd_b1_b <= u2_phaseIncrReg_p0_q(17 downto 0);
    u2_accumAdd_b1_i <= xIn_p_2;
    u2_accumAdd_b1_a1 <= u2_accumAdd_b1_i WHEN (xIn_s_2 = "1") ELSE u2_accumAdd_b1_a;
    u2_accumAdd_b1_b1 <= (others => '0') WHEN (xIn_s_2 = "1") ELSE u2_accumAdd_b1_b;
    u2_accumAdd_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_accumAdd_b1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u2_accumAdd_b1_o <= STD_LOGIC_VECTOR(UNSIGNED(u2_accumAdd_b1_a1) + UNSIGNED(u2_accumAdd_b1_b1));
            END IF;
        END IF;
    END PROCESS;
    u2_accumAdd_b1_q <= u2_accumAdd_b1_o(17 downto 0);


	--u2_octantBitSelect(BITSELECT,120)@11
    u2_octantBitSelect_in <= u2_accumAdd_b1_q;
    u2_octantBitSelect_b <= u2_octantBitSelect_in(17 downto 15);

	--d_u2_octantBitSelect_b_19_replace_mem(DUALMEM,892)
    d_u2_octantBitSelect_b_19_replace_mem_reset0 <= areset;
    d_u2_octantBitSelect_b_19_replace_mem_ia <= u2_octantBitSelect_b;
    d_u2_octantBitSelect_b_19_replace_mem_aa <= d_u0_octantBitSelect_b_19_replace_rdreg_q;
    d_u2_octantBitSelect_b_19_replace_mem_ab <= d_u0_octantBitSelect_b_19_replace_rdmux_q;
    d_u2_octantBitSelect_b_19_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 3,
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
        clocken1 => d_u0_octantBitSelect_b_19_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u2_octantBitSelect_b_19_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u2_octantBitSelect_b_19_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u2_octantBitSelect_b_19_replace_mem_iq,
        address_a => d_u2_octantBitSelect_b_19_replace_mem_aa,
        data_a => d_u2_octantBitSelect_b_19_replace_mem_ia
    );
        d_u2_octantBitSelect_b_19_replace_mem_q <= d_u2_octantBitSelect_b_19_replace_mem_iq(2 downto 0);

	--d_u2_octantBitSelect_b_20(DELAY,710)@19
    d_u2_octantBitSelect_b_20 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => d_u2_octantBitSelect_b_19_replace_mem_q, xout => d_u2_octantBitSelect_b_20_q, clk => clk, aclr => areset );

	--u2_cosJoin(BITJOIN,153)@20
    u2_cosJoin_q <= u2_invertCos_b & d_u2_octantBitSelect_b_20_q;

	--u2_doCosInvert(LOOKUP,154)@20
    u2_doCosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_doCosInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u2_cosJoin_q) IS
                WHEN "0000" =>  u2_doCosInvert_q <= "1";
                WHEN "0001" =>  u2_doCosInvert_q <= "1";
                WHEN "0010" =>  u2_doCosInvert_q <= "0";
                WHEN "0011" =>  u2_doCosInvert_q <= "0";
                WHEN "0100" =>  u2_doCosInvert_q <= "0";
                WHEN "0101" =>  u2_doCosInvert_q <= "0";
                WHEN "0110" =>  u2_doCosInvert_q <= "1";
                WHEN "0111" =>  u2_doCosInvert_q <= "1";
                WHEN "1000" =>  u2_doCosInvert_q <= "0";
                WHEN "1001" =>  u2_doCosInvert_q <= "0";
                WHEN "1010" =>  u2_doCosInvert_q <= "1";
                WHEN "1011" =>  u2_doCosInvert_q <= "1";
                WHEN "1100" =>  u2_doCosInvert_q <= "1";
                WHEN "1101" =>  u2_doCosInvert_q <= "1";
                WHEN "1110" =>  u2_doCosInvert_q <= "0";
                WHEN "1111" =>  u2_doCosInvert_q <= "0";
                WHEN OTHERS =>
                    u2_doCosInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u2_addnsubConst(LOOKUP,122)@11
    u2_addnsubConst: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_addnsubConst_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u2_octantBitSelect_b) IS
                WHEN "000" =>  u2_addnsubConst_q <= "1";
                WHEN "001" =>  u2_addnsubConst_q <= "0";
                WHEN "010" =>  u2_addnsubConst_q <= "1";
                WHEN "011" =>  u2_addnsubConst_q <= "0";
                WHEN "100" =>  u2_addnsubConst_q <= "1";
                WHEN "101" =>  u2_addnsubConst_q <= "0";
                WHEN "110" =>  u2_addnsubConst_q <= "1";
                WHEN "111" =>  u2_addnsubConst_q <= "0";
                WHEN OTHERS =>
                    u2_addnsubConst_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--d_u2_accumAdd_b1_q_12(DELAY,708)@11
    d_u2_accumAdd_b1_q_12 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => u2_accumAdd_b1_q, xout => d_u2_accumAdd_b1_q_12_q, clk => clk, aclr => areset );

	--u2_rangeLUT(LOOKUP,121)@11
    u2_rangeLUT: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_rangeLUT_q <= "0000000000000000000";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u2_octantBitSelect_b) IS
                WHEN "000" =>  u2_rangeLUT_q <= "0000000000000000000";
                WHEN "001" =>  u2_rangeLUT_q <= "0010000000000000000";
                WHEN "010" =>  u2_rangeLUT_q <= "1110000000000000000";
                WHEN "011" =>  u2_rangeLUT_q <= "0100000000000000000";
                WHEN "100" =>  u2_rangeLUT_q <= "1100000000000000000";
                WHEN "101" =>  u2_rangeLUT_q <= "0110000000000000000";
                WHEN "110" =>  u2_rangeLUT_q <= "1010000000000000000";
                WHEN "111" =>  u2_rangeLUT_q <= "1100000000000000000";
                WHEN OTHERS =>
                    u2_rangeLUT_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u2_rangeAddSub(ADDSUB,123)@12
    u2_rangeAddSub_cin <= GND_q;
    u2_rangeAddSub_a <= STD_LOGIC_VECTOR("0" & u2_rangeLUT_q) & u2_addnsubConst_q(0);
    u2_rangeAddSub_b <= STD_LOGIC_VECTOR("00" & d_u2_accumAdd_b1_q_12_q) & u2_rangeAddSub_cin(0);
    u2_rangeAddSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_rangeAddSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u2_addnsubConst_q = "1") THEN
                u2_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u2_rangeAddSub_a) + UNSIGNED(u2_rangeAddSub_b));
            ELSE
                u2_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u2_rangeAddSub_a) - UNSIGNED(u2_rangeAddSub_b));
            END IF;
        END IF;
    END PROCESS;
    u2_rangeAddSub_q <= u2_rangeAddSub_o(19 downto 1);


	--d_u2_rangeAddSub_q_18_replace_mem(DUALMEM,904)
    d_u2_rangeAddSub_q_18_replace_mem_reset0 <= areset;
    d_u2_rangeAddSub_q_18_replace_mem_ia <= u2_rangeAddSub_q;
    d_u2_rangeAddSub_q_18_replace_mem_aa <= d_u0_rangeAddSub_q_18_replace_rdreg_q;
    d_u2_rangeAddSub_q_18_replace_mem_ab <= d_u0_rangeAddSub_q_18_replace_rdmux_q;
    d_u2_rangeAddSub_q_18_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 19,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 19,
        widthad_b => 2,
        numwords_b => 4,
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
        clocken1 => d_u0_rangeAddSub_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u2_rangeAddSub_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u2_rangeAddSub_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u2_rangeAddSub_q_18_replace_mem_iq,
        address_a => d_u2_rangeAddSub_q_18_replace_mem_aa,
        data_a => d_u2_rangeAddSub_q_18_replace_mem_ia
    );
        d_u2_rangeAddSub_q_18_replace_mem_q <= d_u2_rangeAddSub_q_18_replace_mem_iq(18 downto 0);

	--u2_alphaOverflowBitSelect(BITSELECT,125)@18
    u2_alphaOverflowBitSelect_in <= d_u2_rangeAddSub_q_18_replace_mem_q(15 downto 0);
    u2_alphaOverflowBitSelect_b <= u2_alphaOverflowBitSelect_in(15 downto 15);

	--u2_betaBitSelect(BITSELECT,126)@13
    u2_betaBitSelect_in <= u2_rangeAddSub_q(6 downto 0);
    u2_betaBitSelect_b <= u2_betaBitSelect_in(6 downto 0);

	--u2_ls4(BITSHIFT,133)@13
    u2_ls4_q_int <= u2_betaBitSelect_b & "0000";
    u2_ls4_q <= u2_ls4_q_int(10 downto 0);

	--u2_ls7(BITSHIFT,132)@13
    u2_ls7_q_int <= u2_betaBitSelect_b & "0000000";
    u2_ls7_q <= u2_ls7_q_int(13 downto 0);

	--u2_cm2(ADD,134)@13
    u2_cm2_a <= STD_LOGIC_VECTOR("0" & u2_ls7_q);
    u2_cm2_b <= STD_LOGIC_VECTOR("0000" & u2_ls4_q);
    u2_cm2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_cm2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_cm2_o <= STD_LOGIC_VECTOR(UNSIGNED(u2_cm2_a) + UNSIGNED(u2_cm2_b));
        END IF;
    END PROCESS;
    u2_cm2_q <= u2_cm2_o(14 downto 0);


	--u2_ls10(BITSHIFT,130)@13
    u2_ls10_q_int <= u2_betaBitSelect_b & "0000000000";
    u2_ls10_q <= u2_ls10_q_int(16 downto 0);

	--u2_ls12(BITSHIFT,129)@13
    u2_ls12_q_int <= u2_betaBitSelect_b & "000000000000";
    u2_ls12_q <= u2_ls12_q_int(18 downto 0);

	--u2_cm1(SUB,131)@13
    u2_cm1_a <= STD_LOGIC_VECTOR("0" & u2_ls12_q);
    u2_cm1_b <= STD_LOGIC_VECTOR("000" & u2_ls10_q);
    u2_cm1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_cm1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_cm1_o <= STD_LOGIC_VECTOR(UNSIGNED(u2_cm1_a) - UNSIGNED(u2_cm1_b));
        END IF;
    END PROCESS;
    u2_cm1_q <= u2_cm1_o(19 downto 0);


	--u2_cm3(ADD,135)@14
    u2_cm3_a <= STD_LOGIC_VECTOR("0" & u2_cm1_q);
    u2_cm3_b <= STD_LOGIC_VECTOR("000000" & u2_cm2_q);
    u2_cm3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_cm3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_cm3_o <= STD_LOGIC_VECTOR(UNSIGNED(u2_cm3_a) + UNSIGNED(u2_cm3_b));
        END IF;
    END PROCESS;
    u2_cm3_q <= u2_cm3_o(20 downto 0);


	--u2_beta_times_4_shift(BITSHIFT,136)@15
    u2_beta_times_4_shift_q_int <= u2_cm3_q(20 downto 1);
    u2_beta_times_4_shift_q <= u2_beta_times_4_shift_q_int(19 downto 0);

	--u2_beta_times_pi_over_4_shifted(BITSELECT,137)@15
    u2_beta_times_pi_over_4_shifted_in <= u2_beta_times_4_shift_q(17 downto 0);
    u2_beta_times_pi_over_4_shifted_b <= u2_beta_times_pi_over_4_shifted_in(17 downto 6);

	--u2_alphaBitSelect(BITSELECT,124)@13
    u2_alphaBitSelect_in <= u2_rangeAddSub_q(14 downto 0);
    u2_alphaBitSelect_b <= u2_alphaBitSelect_in(14 downto 7);

	--u2_cosTable(DUALMEM,128)@13
    u2_cosTable_reset0 <= areset;
    u2_cosTable_ia <= (others => '0');
    u2_cosTable_aa <= (others => '0');
    u2_cosTable_ab <= u2_alphaBitSelect_b;
    u2_cosTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u2_cosTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u2_cosTable_reset0,
        clock0 => clk,
        address_b => u2_cosTable_ab,
        -- data_b => (others => '0'),
        q_b => u2_cosTable_iq,
        address_a => u2_cosTable_aa,
        data_a => u2_cosTable_ia
    );
        u2_cosTable_q <= u2_cosTable_iq(11 downto 0);

	--u2_cosMult(MULT,139)@15
    u2_cosMult_pr <= UNSIGNED(u2_cosMult_a) * UNSIGNED(u2_cosMult_b);
    u2_cosMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_cosMult_a <= (others => '0');
            u2_cosMult_b <= (others => '0');
            u2_cosMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_cosMult_a <= u2_cosTable_q;
            u2_cosMult_b <= u2_beta_times_pi_over_4_shifted_b;
            u2_cosMult_s1 <= STD_LOGIC_VECTOR(u2_cosMult_pr);
        END IF;
    END PROCESS;
    u2_cosMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_cosMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_cosMult_q <= u2_cosMult_s1;
        END IF;
    END PROCESS;

	--u2_sinTable(DUALMEM,127)@13
    u2_sinTable_reset0 <= areset;
    u2_sinTable_ia <= (others => '0');
    u2_sinTable_aa <= (others => '0');
    u2_sinTable_ab <= u2_alphaBitSelect_b;
    u2_sinTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u2_sinTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u2_sinTable_reset0,
        clock0 => clk,
        address_b => u2_sinTable_ab,
        -- data_b => (others => '0'),
        q_b => u2_sinTable_iq,
        address_a => u2_sinTable_aa,
        data_a => u2_sinTable_ia
    );
        u2_sinTable_q <= u2_sinTable_iq(11 downto 0);

	--d_u2_sinTable_q_18_replace_mem(DUALMEM,916)
    d_u2_sinTable_q_18_replace_mem_reset0 <= areset;
    d_u2_sinTable_q_18_replace_mem_ia <= u2_sinTable_q;
    d_u2_sinTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u2_sinTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u2_sinTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u2_sinTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u2_sinTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u2_sinTable_q_18_replace_mem_iq,
        address_a => d_u2_sinTable_q_18_replace_mem_aa,
        data_a => d_u2_sinTable_q_18_replace_mem_ia
    );
        d_u2_sinTable_q_18_replace_mem_q <= d_u2_sinTable_q_18_replace_mem_iq(11 downto 0);

	--u2_lsSinTable(BITSHIFT,140)@18
    u2_lsSinTable_q_int <= d_u2_sinTable_q_18_replace_mem_q & "00000000000000000000";
    u2_lsSinTable_q <= u2_lsSinTable_q_int(31 downto 0);

	--u2_sinAdd(ADD,144)@18
    u2_sinAdd_a <= u2_lsSinTable_q(31 downto 18);
    u2_sinAdd_b <= STD_LOGIC_VECTOR("00000000" & u2_cosMult_q(23 downto 18));
    u2_sinAdd_i <= u0_sin_pi_over_4_q;
    u2_sinAdd_a1 <= u2_sinAdd_i WHEN (u2_alphaOverflowBitSelect_b = "1") ELSE u2_sinAdd_a;
    u2_sinAdd_b1 <= (others => '0') WHEN (u2_alphaOverflowBitSelect_b = "1") ELSE u2_sinAdd_b;
    u2_sinAdd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_sinAdd_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_sinAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(u2_sinAdd_a1) + UNSIGNED(u2_sinAdd_b1));
        END IF;
    END PROCESS;
    u2_sinAdd_q <= u2_sinAdd_o(13 downto 0);


	--u2_roundedSin(ROUND,146)@19
    u2_roundedSin_in <= u2_sinAdd_q;
    u2_roundedSin: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_roundedSin_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_roundedSin_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u2_roundedSin_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u2_roundedSin_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u2_sinMult(MULT,138)@15
    u2_sinMult_pr <= UNSIGNED(u2_sinMult_a) * UNSIGNED(u2_sinMult_b);
    u2_sinMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_sinMult_a <= (others => '0');
            u2_sinMult_b <= (others => '0');
            u2_sinMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_sinMult_a <= u2_sinTable_q;
            u2_sinMult_b <= u2_beta_times_pi_over_4_shifted_b;
            u2_sinMult_s1 <= STD_LOGIC_VECTOR(u2_sinMult_pr);
        END IF;
    END PROCESS;
    u2_sinMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_sinMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_sinMult_q <= u2_sinMult_s1;
        END IF;
    END PROCESS;

	--d_u2_cosTable_q_18_replace_mem(DUALMEM,926)
    d_u2_cosTable_q_18_replace_mem_reset0 <= areset;
    d_u2_cosTable_q_18_replace_mem_ia <= u2_cosTable_q;
    d_u2_cosTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u2_cosTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u2_cosTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u2_cosTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u2_cosTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u2_cosTable_q_18_replace_mem_iq,
        address_a => d_u2_cosTable_q_18_replace_mem_aa,
        data_a => d_u2_cosTable_q_18_replace_mem_ia
    );
        d_u2_cosTable_q_18_replace_mem_q <= d_u2_cosTable_q_18_replace_mem_iq(11 downto 0);

	--u2_lsCosTable(BITSHIFT,141)@18
    u2_lsCosTable_q_int <= d_u2_cosTable_q_18_replace_mem_q & "00000000000000000000";
    u2_lsCosTable_q <= u2_lsCosTable_q_int(31 downto 0);

	--u2_cosSub(SUB,145)@18
    u2_cosSub_a <= u2_lsCosTable_q(31 downto 18);
    u2_cosSub_b <= STD_LOGIC_VECTOR("00000000" & u2_sinMult_q(23 downto 18));
    u2_cosSub_i <= u0_sin_pi_over_4_q;
    u2_cosSub_a1 <= u2_cosSub_i WHEN (u2_alphaOverflowBitSelect_b = "1") ELSE u2_cosSub_a;
    u2_cosSub_b1 <= (others => '0') WHEN (u2_alphaOverflowBitSelect_b = "1") ELSE u2_cosSub_b;
    u2_cosSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_cosSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_cosSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u2_cosSub_a1) - UNSIGNED(u2_cosSub_b1));
        END IF;
    END PROCESS;
    u2_cosSub_q <= u2_cosSub_o(13 downto 0);


	--u2_roundedCos(ROUND,147)@19
    u2_roundedCos_in <= u2_cosSub_q;
    u2_roundedCos: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_roundedCos_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_roundedCos_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u2_roundedCos_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u2_roundedCos_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u2_doSwap(LOOKUP,148)@19
    u2_doSwap: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_doSwap_q <= "0";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (d_u2_octantBitSelect_b_19_replace_mem_q) IS
                WHEN "000" =>  u2_doSwap_q <= "0";
                WHEN "001" =>  u2_doSwap_q <= "1";
                WHEN "010" =>  u2_doSwap_q <= "1";
                WHEN "011" =>  u2_doSwap_q <= "0";
                WHEN "100" =>  u2_doSwap_q <= "0";
                WHEN "101" =>  u2_doSwap_q <= "1";
                WHEN "110" =>  u2_doSwap_q <= "1";
                WHEN "111" =>  u2_doSwap_q <= "0";
                WHEN OTHERS =>
                    u2_doSwap_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u2_cosSwapMux(MUX,156)@20
    u2_cosSwapMux_s <= u2_doSwap_q;
    u2_cosSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_cosSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u2_cosSwapMux_s IS
                      WHEN "0" => u2_cosSwapMux_q <= u2_roundedCos_q;
                      WHEN "1" => u2_cosSwapMux_q <= u2_roundedSin_q;
                      WHEN OTHERS => u2_cosSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u2_cosInvert(SUB,158)@21
    u2_cosInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u2_cosInvert_b <= u2_cosSwapMux_q;
    u2_cosInvert_i <= u2_cosInvert_b;
    u2_cosInvert_a1 <= u2_cosInvert_i WHEN (u2_doCosInvert_q = "1") ELSE u2_cosInvert_a;
    u2_cosInvert_b1 <= (others => '0') WHEN (u2_doCosInvert_q = "1") ELSE u2_cosInvert_b;
    u2_cosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_cosInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_cosInvert_o <= STD_LOGIC_VECTOR(SIGNED(u2_cosInvert_a1) - SIGNED(u2_cosInvert_b1));
        END IF;
    END PROCESS;
    u2_cosInvert_q <= u2_cosInvert_o(11 downto 0);


	--u1_phaseIncrRegLookup_0(LOOKUP,6)@10
    u1_phaseIncrRegLookup_0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u1_phaseIncrRegLookup_0_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_a) IS
                WHEN "010010110001" =>                     u1_phaseIncrRegLookup_0_e <= busIn_w;
                WHEN OTHERS =>
                    u1_phaseIncrRegLookup_0_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u1_phaseIncrReg_p0(REG,7)@11
    u1_phaseIncrReg_p0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u1_phaseIncrReg_p0_q <= "01000110000000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (u1_phaseIncrRegLookup_0_e = "1") THEN
                u1_phaseIncrReg_p0_q <= d_busIn_d_11_q(19 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u1_invertCos(BITSELECT,111)@20
    u1_invertCos_in <= u1_phaseIncrReg_p0_q(18 downto 0);
    u1_invertCos_b <= u1_invertCos_in(18 downto 18);

	--u1_accumAdd_b1(ADD,77)@10
    u1_accumAdd_b1_a <= u1_accumAdd_b1_q;
    u1_accumAdd_b1_b <= u1_phaseIncrReg_p0_q(17 downto 0);
    u1_accumAdd_b1_i <= xIn_p_1;
    u1_accumAdd_b1_a1 <= u1_accumAdd_b1_i WHEN (xIn_s_1 = "1") ELSE u1_accumAdd_b1_a;
    u1_accumAdd_b1_b1 <= (others => '0') WHEN (xIn_s_1 = "1") ELSE u1_accumAdd_b1_b;
    u1_accumAdd_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_accumAdd_b1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u1_accumAdd_b1_o <= STD_LOGIC_VECTOR(UNSIGNED(u1_accumAdd_b1_a1) + UNSIGNED(u1_accumAdd_b1_b1));
            END IF;
        END IF;
    END PROCESS;
    u1_accumAdd_b1_q <= u1_accumAdd_b1_o(17 downto 0);


	--u1_octantBitSelect(BITSELECT,79)@11
    u1_octantBitSelect_in <= u1_accumAdd_b1_q;
    u1_octantBitSelect_b <= u1_octantBitSelect_in(17 downto 15);

	--d_u1_octantBitSelect_b_19_replace_mem(DUALMEM,848)
    d_u1_octantBitSelect_b_19_replace_mem_reset0 <= areset;
    d_u1_octantBitSelect_b_19_replace_mem_ia <= u1_octantBitSelect_b;
    d_u1_octantBitSelect_b_19_replace_mem_aa <= d_u0_octantBitSelect_b_19_replace_rdreg_q;
    d_u1_octantBitSelect_b_19_replace_mem_ab <= d_u0_octantBitSelect_b_19_replace_rdmux_q;
    d_u1_octantBitSelect_b_19_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 3,
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
        clocken1 => d_u0_octantBitSelect_b_19_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u1_octantBitSelect_b_19_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u1_octantBitSelect_b_19_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u1_octantBitSelect_b_19_replace_mem_iq,
        address_a => d_u1_octantBitSelect_b_19_replace_mem_aa,
        data_a => d_u1_octantBitSelect_b_19_replace_mem_ia
    );
        d_u1_octantBitSelect_b_19_replace_mem_q <= d_u1_octantBitSelect_b_19_replace_mem_iq(2 downto 0);

	--d_u1_octantBitSelect_b_20(DELAY,704)@19
    d_u1_octantBitSelect_b_20 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => d_u1_octantBitSelect_b_19_replace_mem_q, xout => d_u1_octantBitSelect_b_20_q, clk => clk, aclr => areset );

	--u1_cosJoin(BITJOIN,112)@20
    u1_cosJoin_q <= u1_invertCos_b & d_u1_octantBitSelect_b_20_q;

	--u1_doCosInvert(LOOKUP,113)@20
    u1_doCosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_doCosInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u1_cosJoin_q) IS
                WHEN "0000" =>  u1_doCosInvert_q <= "1";
                WHEN "0001" =>  u1_doCosInvert_q <= "1";
                WHEN "0010" =>  u1_doCosInvert_q <= "0";
                WHEN "0011" =>  u1_doCosInvert_q <= "0";
                WHEN "0100" =>  u1_doCosInvert_q <= "0";
                WHEN "0101" =>  u1_doCosInvert_q <= "0";
                WHEN "0110" =>  u1_doCosInvert_q <= "1";
                WHEN "0111" =>  u1_doCosInvert_q <= "1";
                WHEN "1000" =>  u1_doCosInvert_q <= "0";
                WHEN "1001" =>  u1_doCosInvert_q <= "0";
                WHEN "1010" =>  u1_doCosInvert_q <= "1";
                WHEN "1011" =>  u1_doCosInvert_q <= "1";
                WHEN "1100" =>  u1_doCosInvert_q <= "1";
                WHEN "1101" =>  u1_doCosInvert_q <= "1";
                WHEN "1110" =>  u1_doCosInvert_q <= "0";
                WHEN "1111" =>  u1_doCosInvert_q <= "0";
                WHEN OTHERS =>
                    u1_doCosInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u1_addnsubConst(LOOKUP,81)@11
    u1_addnsubConst: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_addnsubConst_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u1_octantBitSelect_b) IS
                WHEN "000" =>  u1_addnsubConst_q <= "1";
                WHEN "001" =>  u1_addnsubConst_q <= "0";
                WHEN "010" =>  u1_addnsubConst_q <= "1";
                WHEN "011" =>  u1_addnsubConst_q <= "0";
                WHEN "100" =>  u1_addnsubConst_q <= "1";
                WHEN "101" =>  u1_addnsubConst_q <= "0";
                WHEN "110" =>  u1_addnsubConst_q <= "1";
                WHEN "111" =>  u1_addnsubConst_q <= "0";
                WHEN OTHERS =>
                    u1_addnsubConst_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--d_u1_accumAdd_b1_q_12(DELAY,702)@11
    d_u1_accumAdd_b1_q_12 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => u1_accumAdd_b1_q, xout => d_u1_accumAdd_b1_q_12_q, clk => clk, aclr => areset );

	--u1_rangeLUT(LOOKUP,80)@11
    u1_rangeLUT: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_rangeLUT_q <= "0000000000000000000";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u1_octantBitSelect_b) IS
                WHEN "000" =>  u1_rangeLUT_q <= "0000000000000000000";
                WHEN "001" =>  u1_rangeLUT_q <= "0010000000000000000";
                WHEN "010" =>  u1_rangeLUT_q <= "1110000000000000000";
                WHEN "011" =>  u1_rangeLUT_q <= "0100000000000000000";
                WHEN "100" =>  u1_rangeLUT_q <= "1100000000000000000";
                WHEN "101" =>  u1_rangeLUT_q <= "0110000000000000000";
                WHEN "110" =>  u1_rangeLUT_q <= "1010000000000000000";
                WHEN "111" =>  u1_rangeLUT_q <= "1100000000000000000";
                WHEN OTHERS =>
                    u1_rangeLUT_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u1_rangeAddSub(ADDSUB,82)@12
    u1_rangeAddSub_cin <= GND_q;
    u1_rangeAddSub_a <= STD_LOGIC_VECTOR("0" & u1_rangeLUT_q) & u1_addnsubConst_q(0);
    u1_rangeAddSub_b <= STD_LOGIC_VECTOR("00" & d_u1_accumAdd_b1_q_12_q) & u1_rangeAddSub_cin(0);
    u1_rangeAddSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_rangeAddSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u1_addnsubConst_q = "1") THEN
                u1_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u1_rangeAddSub_a) + UNSIGNED(u1_rangeAddSub_b));
            ELSE
                u1_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u1_rangeAddSub_a) - UNSIGNED(u1_rangeAddSub_b));
            END IF;
        END IF;
    END PROCESS;
    u1_rangeAddSub_q <= u1_rangeAddSub_o(19 downto 1);


	--d_u1_rangeAddSub_q_18_replace_mem(DUALMEM,860)
    d_u1_rangeAddSub_q_18_replace_mem_reset0 <= areset;
    d_u1_rangeAddSub_q_18_replace_mem_ia <= u1_rangeAddSub_q;
    d_u1_rangeAddSub_q_18_replace_mem_aa <= d_u0_rangeAddSub_q_18_replace_rdreg_q;
    d_u1_rangeAddSub_q_18_replace_mem_ab <= d_u0_rangeAddSub_q_18_replace_rdmux_q;
    d_u1_rangeAddSub_q_18_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 19,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 19,
        widthad_b => 2,
        numwords_b => 4,
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
        clocken1 => d_u0_rangeAddSub_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u1_rangeAddSub_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u1_rangeAddSub_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u1_rangeAddSub_q_18_replace_mem_iq,
        address_a => d_u1_rangeAddSub_q_18_replace_mem_aa,
        data_a => d_u1_rangeAddSub_q_18_replace_mem_ia
    );
        d_u1_rangeAddSub_q_18_replace_mem_q <= d_u1_rangeAddSub_q_18_replace_mem_iq(18 downto 0);

	--u1_alphaOverflowBitSelect(BITSELECT,84)@18
    u1_alphaOverflowBitSelect_in <= d_u1_rangeAddSub_q_18_replace_mem_q(15 downto 0);
    u1_alphaOverflowBitSelect_b <= u1_alphaOverflowBitSelect_in(15 downto 15);

	--u1_betaBitSelect(BITSELECT,85)@13
    u1_betaBitSelect_in <= u1_rangeAddSub_q(6 downto 0);
    u1_betaBitSelect_b <= u1_betaBitSelect_in(6 downto 0);

	--u1_ls4(BITSHIFT,92)@13
    u1_ls4_q_int <= u1_betaBitSelect_b & "0000";
    u1_ls4_q <= u1_ls4_q_int(10 downto 0);

	--u1_ls7(BITSHIFT,91)@13
    u1_ls7_q_int <= u1_betaBitSelect_b & "0000000";
    u1_ls7_q <= u1_ls7_q_int(13 downto 0);

	--u1_cm2(ADD,93)@13
    u1_cm2_a <= STD_LOGIC_VECTOR("0" & u1_ls7_q);
    u1_cm2_b <= STD_LOGIC_VECTOR("0000" & u1_ls4_q);
    u1_cm2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_cm2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_cm2_o <= STD_LOGIC_VECTOR(UNSIGNED(u1_cm2_a) + UNSIGNED(u1_cm2_b));
        END IF;
    END PROCESS;
    u1_cm2_q <= u1_cm2_o(14 downto 0);


	--u1_ls10(BITSHIFT,89)@13
    u1_ls10_q_int <= u1_betaBitSelect_b & "0000000000";
    u1_ls10_q <= u1_ls10_q_int(16 downto 0);

	--u1_ls12(BITSHIFT,88)@13
    u1_ls12_q_int <= u1_betaBitSelect_b & "000000000000";
    u1_ls12_q <= u1_ls12_q_int(18 downto 0);

	--u1_cm1(SUB,90)@13
    u1_cm1_a <= STD_LOGIC_VECTOR("0" & u1_ls12_q);
    u1_cm1_b <= STD_LOGIC_VECTOR("000" & u1_ls10_q);
    u1_cm1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_cm1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_cm1_o <= STD_LOGIC_VECTOR(UNSIGNED(u1_cm1_a) - UNSIGNED(u1_cm1_b));
        END IF;
    END PROCESS;
    u1_cm1_q <= u1_cm1_o(19 downto 0);


	--u1_cm3(ADD,94)@14
    u1_cm3_a <= STD_LOGIC_VECTOR("0" & u1_cm1_q);
    u1_cm3_b <= STD_LOGIC_VECTOR("000000" & u1_cm2_q);
    u1_cm3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_cm3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_cm3_o <= STD_LOGIC_VECTOR(UNSIGNED(u1_cm3_a) + UNSIGNED(u1_cm3_b));
        END IF;
    END PROCESS;
    u1_cm3_q <= u1_cm3_o(20 downto 0);


	--u1_beta_times_4_shift(BITSHIFT,95)@15
    u1_beta_times_4_shift_q_int <= u1_cm3_q(20 downto 1);
    u1_beta_times_4_shift_q <= u1_beta_times_4_shift_q_int(19 downto 0);

	--u1_beta_times_pi_over_4_shifted(BITSELECT,96)@15
    u1_beta_times_pi_over_4_shifted_in <= u1_beta_times_4_shift_q(17 downto 0);
    u1_beta_times_pi_over_4_shifted_b <= u1_beta_times_pi_over_4_shifted_in(17 downto 6);

	--u1_alphaBitSelect(BITSELECT,83)@13
    u1_alphaBitSelect_in <= u1_rangeAddSub_q(14 downto 0);
    u1_alphaBitSelect_b <= u1_alphaBitSelect_in(14 downto 7);

	--u1_cosTable(DUALMEM,87)@13
    u1_cosTable_reset0 <= areset;
    u1_cosTable_ia <= (others => '0');
    u1_cosTable_aa <= (others => '0');
    u1_cosTable_ab <= u1_alphaBitSelect_b;
    u1_cosTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u1_cosTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u1_cosTable_reset0,
        clock0 => clk,
        address_b => u1_cosTable_ab,
        -- data_b => (others => '0'),
        q_b => u1_cosTable_iq,
        address_a => u1_cosTable_aa,
        data_a => u1_cosTable_ia
    );
        u1_cosTable_q <= u1_cosTable_iq(11 downto 0);

	--u1_cosMult(MULT,98)@15
    u1_cosMult_pr <= UNSIGNED(u1_cosMult_a) * UNSIGNED(u1_cosMult_b);
    u1_cosMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_cosMult_a <= (others => '0');
            u1_cosMult_b <= (others => '0');
            u1_cosMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_cosMult_a <= u1_cosTable_q;
            u1_cosMult_b <= u1_beta_times_pi_over_4_shifted_b;
            u1_cosMult_s1 <= STD_LOGIC_VECTOR(u1_cosMult_pr);
        END IF;
    END PROCESS;
    u1_cosMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_cosMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_cosMult_q <= u1_cosMult_s1;
        END IF;
    END PROCESS;

	--u1_sinTable(DUALMEM,86)@13
    u1_sinTable_reset0 <= areset;
    u1_sinTable_ia <= (others => '0');
    u1_sinTable_aa <= (others => '0');
    u1_sinTable_ab <= u1_alphaBitSelect_b;
    u1_sinTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u1_sinTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u1_sinTable_reset0,
        clock0 => clk,
        address_b => u1_sinTable_ab,
        -- data_b => (others => '0'),
        q_b => u1_sinTable_iq,
        address_a => u1_sinTable_aa,
        data_a => u1_sinTable_ia
    );
        u1_sinTable_q <= u1_sinTable_iq(11 downto 0);

	--d_u1_sinTable_q_18_replace_mem(DUALMEM,872)
    d_u1_sinTable_q_18_replace_mem_reset0 <= areset;
    d_u1_sinTable_q_18_replace_mem_ia <= u1_sinTable_q;
    d_u1_sinTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u1_sinTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u1_sinTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u1_sinTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u1_sinTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u1_sinTable_q_18_replace_mem_iq,
        address_a => d_u1_sinTable_q_18_replace_mem_aa,
        data_a => d_u1_sinTable_q_18_replace_mem_ia
    );
        d_u1_sinTable_q_18_replace_mem_q <= d_u1_sinTable_q_18_replace_mem_iq(11 downto 0);

	--u1_lsSinTable(BITSHIFT,99)@18
    u1_lsSinTable_q_int <= d_u1_sinTable_q_18_replace_mem_q & "00000000000000000000";
    u1_lsSinTable_q <= u1_lsSinTable_q_int(31 downto 0);

	--u1_sinAdd(ADD,103)@18
    u1_sinAdd_a <= u1_lsSinTable_q(31 downto 18);
    u1_sinAdd_b <= STD_LOGIC_VECTOR("00000000" & u1_cosMult_q(23 downto 18));
    u1_sinAdd_i <= u0_sin_pi_over_4_q;
    u1_sinAdd_a1 <= u1_sinAdd_i WHEN (u1_alphaOverflowBitSelect_b = "1") ELSE u1_sinAdd_a;
    u1_sinAdd_b1 <= (others => '0') WHEN (u1_alphaOverflowBitSelect_b = "1") ELSE u1_sinAdd_b;
    u1_sinAdd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_sinAdd_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_sinAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(u1_sinAdd_a1) + UNSIGNED(u1_sinAdd_b1));
        END IF;
    END PROCESS;
    u1_sinAdd_q <= u1_sinAdd_o(13 downto 0);


	--u1_roundedSin(ROUND,105)@19
    u1_roundedSin_in <= u1_sinAdd_q;
    u1_roundedSin: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_roundedSin_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_roundedSin_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u1_roundedSin_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u1_roundedSin_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u1_sinMult(MULT,97)@15
    u1_sinMult_pr <= UNSIGNED(u1_sinMult_a) * UNSIGNED(u1_sinMult_b);
    u1_sinMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_sinMult_a <= (others => '0');
            u1_sinMult_b <= (others => '0');
            u1_sinMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_sinMult_a <= u1_sinTable_q;
            u1_sinMult_b <= u1_beta_times_pi_over_4_shifted_b;
            u1_sinMult_s1 <= STD_LOGIC_VECTOR(u1_sinMult_pr);
        END IF;
    END PROCESS;
    u1_sinMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_sinMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_sinMult_q <= u1_sinMult_s1;
        END IF;
    END PROCESS;

	--d_u1_cosTable_q_18_replace_mem(DUALMEM,882)
    d_u1_cosTable_q_18_replace_mem_reset0 <= areset;
    d_u1_cosTable_q_18_replace_mem_ia <= u1_cosTable_q;
    d_u1_cosTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u1_cosTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u1_cosTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u1_cosTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u1_cosTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u1_cosTable_q_18_replace_mem_iq,
        address_a => d_u1_cosTable_q_18_replace_mem_aa,
        data_a => d_u1_cosTable_q_18_replace_mem_ia
    );
        d_u1_cosTable_q_18_replace_mem_q <= d_u1_cosTable_q_18_replace_mem_iq(11 downto 0);

	--u1_lsCosTable(BITSHIFT,100)@18
    u1_lsCosTable_q_int <= d_u1_cosTable_q_18_replace_mem_q & "00000000000000000000";
    u1_lsCosTable_q <= u1_lsCosTable_q_int(31 downto 0);

	--u1_cosSub(SUB,104)@18
    u1_cosSub_a <= u1_lsCosTable_q(31 downto 18);
    u1_cosSub_b <= STD_LOGIC_VECTOR("00000000" & u1_sinMult_q(23 downto 18));
    u1_cosSub_i <= u0_sin_pi_over_4_q;
    u1_cosSub_a1 <= u1_cosSub_i WHEN (u1_alphaOverflowBitSelect_b = "1") ELSE u1_cosSub_a;
    u1_cosSub_b1 <= (others => '0') WHEN (u1_alphaOverflowBitSelect_b = "1") ELSE u1_cosSub_b;
    u1_cosSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_cosSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_cosSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u1_cosSub_a1) - UNSIGNED(u1_cosSub_b1));
        END IF;
    END PROCESS;
    u1_cosSub_q <= u1_cosSub_o(13 downto 0);


	--u1_roundedCos(ROUND,106)@19
    u1_roundedCos_in <= u1_cosSub_q;
    u1_roundedCos: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_roundedCos_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_roundedCos_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u1_roundedCos_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u1_roundedCos_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u1_doSwap(LOOKUP,107)@19
    u1_doSwap: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_doSwap_q <= "0";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (d_u1_octantBitSelect_b_19_replace_mem_q) IS
                WHEN "000" =>  u1_doSwap_q <= "0";
                WHEN "001" =>  u1_doSwap_q <= "1";
                WHEN "010" =>  u1_doSwap_q <= "1";
                WHEN "011" =>  u1_doSwap_q <= "0";
                WHEN "100" =>  u1_doSwap_q <= "0";
                WHEN "101" =>  u1_doSwap_q <= "1";
                WHEN "110" =>  u1_doSwap_q <= "1";
                WHEN "111" =>  u1_doSwap_q <= "0";
                WHEN OTHERS =>
                    u1_doSwap_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u1_cosSwapMux(MUX,115)@20
    u1_cosSwapMux_s <= u1_doSwap_q;
    u1_cosSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_cosSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u1_cosSwapMux_s IS
                      WHEN "0" => u1_cosSwapMux_q <= u1_roundedCos_q;
                      WHEN "1" => u1_cosSwapMux_q <= u1_roundedSin_q;
                      WHEN OTHERS => u1_cosSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u1_cosInvert(SUB,117)@21
    u1_cosInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u1_cosInvert_b <= u1_cosSwapMux_q;
    u1_cosInvert_i <= u1_cosInvert_b;
    u1_cosInvert_a1 <= u1_cosInvert_i WHEN (u1_doCosInvert_q = "1") ELSE u1_cosInvert_a;
    u1_cosInvert_b1 <= (others => '0') WHEN (u1_doCosInvert_q = "1") ELSE u1_cosInvert_b;
    u1_cosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_cosInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_cosInvert_o <= STD_LOGIC_VECTOR(SIGNED(u1_cosInvert_a1) - SIGNED(u1_cosInvert_b1));
        END IF;
    END PROCESS;
    u1_cosInvert_q <= u1_cosInvert_o(11 downto 0);


	--u0_phaseIncrRegLookup_0(LOOKUP,4)@10
    u0_phaseIncrRegLookup_0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u0_phaseIncrRegLookup_0_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_a) IS
                WHEN "010010110000" =>                     u0_phaseIncrRegLookup_0_e <= busIn_w;
                WHEN OTHERS =>
                    u0_phaseIncrRegLookup_0_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--u0_phaseIncrReg_p0(REG,5)@11
    u0_phaseIncrReg_p0: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u0_phaseIncrReg_p0_q <= "01000110000000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (u0_phaseIncrRegLookup_0_e = "1") THEN
                u0_phaseIncrReg_p0_q <= d_busIn_d_11_q(19 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u0_invertCos(BITSELECT,70)@20
    u0_invertCos_in <= u0_phaseIncrReg_p0_q(18 downto 0);
    u0_invertCos_b <= u0_invertCos_in(18 downto 18);

	--u0_accumAdd_b1(ADD,36)@10
    u0_accumAdd_b1_a <= u0_accumAdd_b1_q;
    u0_accumAdd_b1_b <= u0_phaseIncrReg_p0_q(17 downto 0);
    u0_accumAdd_b1_i <= xIn_p_0;
    u0_accumAdd_b1_a1 <= u0_accumAdd_b1_i WHEN (xIn_s_0 = "1") ELSE u0_accumAdd_b1_a;
    u0_accumAdd_b1_b1 <= (others => '0') WHEN (xIn_s_0 = "1") ELSE u0_accumAdd_b1_b;
    u0_accumAdd_b1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_accumAdd_b1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_accumAdd_b1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_accumAdd_b1_a1) + UNSIGNED(u0_accumAdd_b1_b1));
            END IF;
        END IF;
    END PROCESS;
    u0_accumAdd_b1_q <= u0_accumAdd_b1_o(17 downto 0);


	--u0_octantBitSelect(BITSELECT,38)@11
    u0_octantBitSelect_in <= u0_accumAdd_b1_q;
    u0_octantBitSelect_b <= u0_octantBitSelect_in(17 downto 15);

	--d_u0_octantBitSelect_b_19_replace_mem(DUALMEM,804)
    d_u0_octantBitSelect_b_19_replace_mem_reset0 <= areset;
    d_u0_octantBitSelect_b_19_replace_mem_ia <= u0_octantBitSelect_b;
    d_u0_octantBitSelect_b_19_replace_mem_aa <= d_u0_octantBitSelect_b_19_replace_rdreg_q;
    d_u0_octantBitSelect_b_19_replace_mem_ab <= d_u0_octantBitSelect_b_19_replace_rdmux_q;
    d_u0_octantBitSelect_b_19_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 3,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 3,
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
        clocken1 => d_u0_octantBitSelect_b_19_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u0_octantBitSelect_b_19_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u0_octantBitSelect_b_19_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u0_octantBitSelect_b_19_replace_mem_iq,
        address_a => d_u0_octantBitSelect_b_19_replace_mem_aa,
        data_a => d_u0_octantBitSelect_b_19_replace_mem_ia
    );
        d_u0_octantBitSelect_b_19_replace_mem_q <= d_u0_octantBitSelect_b_19_replace_mem_iq(2 downto 0);

	--d_u0_octantBitSelect_b_20(DELAY,698)@19
    d_u0_octantBitSelect_b_20 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => d_u0_octantBitSelect_b_19_replace_mem_q, xout => d_u0_octantBitSelect_b_20_q, clk => clk, aclr => areset );

	--u0_cosJoin(BITJOIN,71)@20
    u0_cosJoin_q <= u0_invertCos_b & d_u0_octantBitSelect_b_20_q;

	--u0_doCosInvert(LOOKUP,72)@20
    u0_doCosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_doCosInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u0_cosJoin_q) IS
                WHEN "0000" =>  u0_doCosInvert_q <= "1";
                WHEN "0001" =>  u0_doCosInvert_q <= "1";
                WHEN "0010" =>  u0_doCosInvert_q <= "0";
                WHEN "0011" =>  u0_doCosInvert_q <= "0";
                WHEN "0100" =>  u0_doCosInvert_q <= "0";
                WHEN "0101" =>  u0_doCosInvert_q <= "0";
                WHEN "0110" =>  u0_doCosInvert_q <= "1";
                WHEN "0111" =>  u0_doCosInvert_q <= "1";
                WHEN "1000" =>  u0_doCosInvert_q <= "0";
                WHEN "1001" =>  u0_doCosInvert_q <= "0";
                WHEN "1010" =>  u0_doCosInvert_q <= "1";
                WHEN "1011" =>  u0_doCosInvert_q <= "1";
                WHEN "1100" =>  u0_doCosInvert_q <= "1";
                WHEN "1101" =>  u0_doCosInvert_q <= "1";
                WHEN "1110" =>  u0_doCosInvert_q <= "0";
                WHEN "1111" =>  u0_doCosInvert_q <= "0";
                WHEN OTHERS =>
                    u0_doCosInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u0_addnsubConst(LOOKUP,40)@11
    u0_addnsubConst: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_addnsubConst_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u0_octantBitSelect_b) IS
                WHEN "000" =>  u0_addnsubConst_q <= "1";
                WHEN "001" =>  u0_addnsubConst_q <= "0";
                WHEN "010" =>  u0_addnsubConst_q <= "1";
                WHEN "011" =>  u0_addnsubConst_q <= "0";
                WHEN "100" =>  u0_addnsubConst_q <= "1";
                WHEN "101" =>  u0_addnsubConst_q <= "0";
                WHEN "110" =>  u0_addnsubConst_q <= "1";
                WHEN "111" =>  u0_addnsubConst_q <= "0";
                WHEN OTHERS =>
                    u0_addnsubConst_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--d_u0_accumAdd_b1_q_12(DELAY,696)@11
    d_u0_accumAdd_b1_q_12 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => u0_accumAdd_b1_q, xout => d_u0_accumAdd_b1_q_12_q, clk => clk, aclr => areset );

	--u0_rangeLUT(LOOKUP,39)@11
    u0_rangeLUT: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_rangeLUT_q <= "0000000000000000000";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u0_octantBitSelect_b) IS
                WHEN "000" =>  u0_rangeLUT_q <= "0000000000000000000";
                WHEN "001" =>  u0_rangeLUT_q <= "0010000000000000000";
                WHEN "010" =>  u0_rangeLUT_q <= "1110000000000000000";
                WHEN "011" =>  u0_rangeLUT_q <= "0100000000000000000";
                WHEN "100" =>  u0_rangeLUT_q <= "1100000000000000000";
                WHEN "101" =>  u0_rangeLUT_q <= "0110000000000000000";
                WHEN "110" =>  u0_rangeLUT_q <= "1010000000000000000";
                WHEN "111" =>  u0_rangeLUT_q <= "1100000000000000000";
                WHEN OTHERS =>
                    u0_rangeLUT_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u0_rangeAddSub(ADDSUB,41)@12
    u0_rangeAddSub_cin <= GND_q;
    u0_rangeAddSub_a <= STD_LOGIC_VECTOR("0" & u0_rangeLUT_q) & u0_addnsubConst_q(0);
    u0_rangeAddSub_b <= STD_LOGIC_VECTOR("00" & d_u0_accumAdd_b1_q_12_q) & u0_rangeAddSub_cin(0);
    u0_rangeAddSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_rangeAddSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u0_addnsubConst_q = "1") THEN
                u0_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_rangeAddSub_a) + UNSIGNED(u0_rangeAddSub_b));
            ELSE
                u0_rangeAddSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_rangeAddSub_a) - UNSIGNED(u0_rangeAddSub_b));
            END IF;
        END IF;
    END PROCESS;
    u0_rangeAddSub_q <= u0_rangeAddSub_o(19 downto 1);


	--d_u0_rangeAddSub_q_18_replace_mem(DUALMEM,816)
    d_u0_rangeAddSub_q_18_replace_mem_reset0 <= areset;
    d_u0_rangeAddSub_q_18_replace_mem_ia <= u0_rangeAddSub_q;
    d_u0_rangeAddSub_q_18_replace_mem_aa <= d_u0_rangeAddSub_q_18_replace_rdreg_q;
    d_u0_rangeAddSub_q_18_replace_mem_ab <= d_u0_rangeAddSub_q_18_replace_rdmux_q;
    d_u0_rangeAddSub_q_18_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 19,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 19,
        widthad_b => 2,
        numwords_b => 4,
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
        clocken1 => d_u0_rangeAddSub_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u0_rangeAddSub_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u0_rangeAddSub_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u0_rangeAddSub_q_18_replace_mem_iq,
        address_a => d_u0_rangeAddSub_q_18_replace_mem_aa,
        data_a => d_u0_rangeAddSub_q_18_replace_mem_ia
    );
        d_u0_rangeAddSub_q_18_replace_mem_q <= d_u0_rangeAddSub_q_18_replace_mem_iq(18 downto 0);

	--u0_alphaOverflowBitSelect(BITSELECT,43)@18
    u0_alphaOverflowBitSelect_in <= d_u0_rangeAddSub_q_18_replace_mem_q(15 downto 0);
    u0_alphaOverflowBitSelect_b <= u0_alphaOverflowBitSelect_in(15 downto 15);

	--u0_betaBitSelect(BITSELECT,44)@13
    u0_betaBitSelect_in <= u0_rangeAddSub_q(6 downto 0);
    u0_betaBitSelect_b <= u0_betaBitSelect_in(6 downto 0);

	--u0_ls4(BITSHIFT,51)@13
    u0_ls4_q_int <= u0_betaBitSelect_b & "0000";
    u0_ls4_q <= u0_ls4_q_int(10 downto 0);

	--u0_ls7(BITSHIFT,50)@13
    u0_ls7_q_int <= u0_betaBitSelect_b & "0000000";
    u0_ls7_q <= u0_ls7_q_int(13 downto 0);

	--u0_cm2(ADD,52)@13
    u0_cm2_a <= STD_LOGIC_VECTOR("0" & u0_ls7_q);
    u0_cm2_b <= STD_LOGIC_VECTOR("0000" & u0_ls4_q);
    u0_cm2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_cm2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_cm2_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_cm2_a) + UNSIGNED(u0_cm2_b));
        END IF;
    END PROCESS;
    u0_cm2_q <= u0_cm2_o(14 downto 0);


	--u0_ls10(BITSHIFT,48)@13
    u0_ls10_q_int <= u0_betaBitSelect_b & "0000000000";
    u0_ls10_q <= u0_ls10_q_int(16 downto 0);

	--u0_ls12(BITSHIFT,47)@13
    u0_ls12_q_int <= u0_betaBitSelect_b & "000000000000";
    u0_ls12_q <= u0_ls12_q_int(18 downto 0);

	--u0_cm1(SUB,49)@13
    u0_cm1_a <= STD_LOGIC_VECTOR("0" & u0_ls12_q);
    u0_cm1_b <= STD_LOGIC_VECTOR("000" & u0_ls10_q);
    u0_cm1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_cm1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_cm1_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_cm1_a) - UNSIGNED(u0_cm1_b));
        END IF;
    END PROCESS;
    u0_cm1_q <= u0_cm1_o(19 downto 0);


	--u0_cm3(ADD,53)@14
    u0_cm3_a <= STD_LOGIC_VECTOR("0" & u0_cm1_q);
    u0_cm3_b <= STD_LOGIC_VECTOR("000000" & u0_cm2_q);
    u0_cm3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_cm3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_cm3_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_cm3_a) + UNSIGNED(u0_cm3_b));
        END IF;
    END PROCESS;
    u0_cm3_q <= u0_cm3_o(20 downto 0);


	--u0_beta_times_4_shift(BITSHIFT,54)@15
    u0_beta_times_4_shift_q_int <= u0_cm3_q(20 downto 1);
    u0_beta_times_4_shift_q <= u0_beta_times_4_shift_q_int(19 downto 0);

	--u0_beta_times_pi_over_4_shifted(BITSELECT,55)@15
    u0_beta_times_pi_over_4_shifted_in <= u0_beta_times_4_shift_q(17 downto 0);
    u0_beta_times_pi_over_4_shifted_b <= u0_beta_times_pi_over_4_shifted_in(17 downto 6);

	--u0_alphaBitSelect(BITSELECT,42)@13
    u0_alphaBitSelect_in <= u0_rangeAddSub_q(14 downto 0);
    u0_alphaBitSelect_b <= u0_alphaBitSelect_in(14 downto 7);

	--u0_cosTable(DUALMEM,46)@13
    u0_cosTable_reset0 <= areset;
    u0_cosTable_ia <= (others => '0');
    u0_cosTable_aa <= (others => '0');
    u0_cosTable_ab <= u0_alphaBitSelect_b;
    u0_cosTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u0_cosTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u0_cosTable_reset0,
        clock0 => clk,
        address_b => u0_cosTable_ab,
        -- data_b => (others => '0'),
        q_b => u0_cosTable_iq,
        address_a => u0_cosTable_aa,
        data_a => u0_cosTable_ia
    );
        u0_cosTable_q <= u0_cosTable_iq(11 downto 0);

	--u0_cosMult(MULT,57)@15
    u0_cosMult_pr <= UNSIGNED(u0_cosMult_a) * UNSIGNED(u0_cosMult_b);
    u0_cosMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_cosMult_a <= (others => '0');
            u0_cosMult_b <= (others => '0');
            u0_cosMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_cosMult_a <= u0_cosTable_q;
            u0_cosMult_b <= u0_beta_times_pi_over_4_shifted_b;
            u0_cosMult_s1 <= STD_LOGIC_VECTOR(u0_cosMult_pr);
        END IF;
    END PROCESS;
    u0_cosMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_cosMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_cosMult_q <= u0_cosMult_s1;
        END IF;
    END PROCESS;

	--u0_sinTable(DUALMEM,45)@13
    u0_sinTable_reset0 <= areset;
    u0_sinTable_ia <= (others => '0');
    u0_sinTable_aa <= (others => '0');
    u0_sinTable_ab <= u0_alphaBitSelect_b;
    u0_sinTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/RF_carrier4/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_RF_carrier4_u0_sinTable.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken0 => '1',
        wren_a => '0',
        aclr0 => u0_sinTable_reset0,
        clock0 => clk,
        address_b => u0_sinTable_ab,
        -- data_b => (others => '0'),
        q_b => u0_sinTable_iq,
        address_a => u0_sinTable_aa,
        data_a => u0_sinTable_ia
    );
        u0_sinTable_q <= u0_sinTable_iq(11 downto 0);

	--d_u0_sinTable_q_18_replace_mem(DUALMEM,828)
    d_u0_sinTable_q_18_replace_mem_reset0 <= areset;
    d_u0_sinTable_q_18_replace_mem_ia <= u0_sinTable_q;
    d_u0_sinTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u0_sinTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u0_sinTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u0_sinTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u0_sinTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u0_sinTable_q_18_replace_mem_iq,
        address_a => d_u0_sinTable_q_18_replace_mem_aa,
        data_a => d_u0_sinTable_q_18_replace_mem_ia
    );
        d_u0_sinTable_q_18_replace_mem_q <= d_u0_sinTable_q_18_replace_mem_iq(11 downto 0);

	--u0_lsSinTable(BITSHIFT,58)@18
    u0_lsSinTable_q_int <= d_u0_sinTable_q_18_replace_mem_q & "00000000000000000000";
    u0_lsSinTable_q <= u0_lsSinTable_q_int(31 downto 0);

	--u0_sinAdd(ADD,62)@18
    u0_sinAdd_a <= u0_lsSinTable_q(31 downto 18);
    u0_sinAdd_b <= STD_LOGIC_VECTOR("00000000" & u0_cosMult_q(23 downto 18));
    u0_sinAdd_i <= u0_sin_pi_over_4_q;
    u0_sinAdd_a1 <= u0_sinAdd_i WHEN (u0_alphaOverflowBitSelect_b = "1") ELSE u0_sinAdd_a;
    u0_sinAdd_b1 <= (others => '0') WHEN (u0_alphaOverflowBitSelect_b = "1") ELSE u0_sinAdd_b;
    u0_sinAdd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_sinAdd_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_sinAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_sinAdd_a1) + UNSIGNED(u0_sinAdd_b1));
        END IF;
    END PROCESS;
    u0_sinAdd_q <= u0_sinAdd_o(13 downto 0);


	--u0_roundedSin(ROUND,64)@19
    u0_roundedSin_in <= u0_sinAdd_q;
    u0_roundedSin: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_roundedSin_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_roundedSin_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_roundedSin_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u0_roundedSin_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u0_sinMult(MULT,56)@15
    u0_sinMult_pr <= UNSIGNED(u0_sinMult_a) * UNSIGNED(u0_sinMult_b);
    u0_sinMult_component: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_sinMult_a <= (others => '0');
            u0_sinMult_b <= (others => '0');
            u0_sinMult_s1 <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_sinMult_a <= u0_sinTable_q;
            u0_sinMult_b <= u0_beta_times_pi_over_4_shifted_b;
            u0_sinMult_s1 <= STD_LOGIC_VECTOR(u0_sinMult_pr);
        END IF;
    END PROCESS;
    u0_sinMult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_sinMult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_sinMult_q <= u0_sinMult_s1;
        END IF;
    END PROCESS;

	--d_u0_cosTable_q_18_replace_mem(DUALMEM,838)
    d_u0_cosTable_q_18_replace_mem_reset0 <= areset;
    d_u0_cosTable_q_18_replace_mem_ia <= u0_cosTable_q;
    d_u0_cosTable_q_18_replace_mem_aa <= d_u0_sinTable_q_18_replace_rdreg_q;
    d_u0_cosTable_q_18_replace_mem_ab <= d_u0_sinTable_q_18_replace_rdmux_q;
    d_u0_cosTable_q_18_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_18_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u0_cosTable_q_18_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u0_cosTable_q_18_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u0_cosTable_q_18_replace_mem_iq,
        address_a => d_u0_cosTable_q_18_replace_mem_aa,
        data_a => d_u0_cosTable_q_18_replace_mem_ia
    );
        d_u0_cosTable_q_18_replace_mem_q <= d_u0_cosTable_q_18_replace_mem_iq(11 downto 0);

	--u0_lsCosTable(BITSHIFT,59)@18
    u0_lsCosTable_q_int <= d_u0_cosTable_q_18_replace_mem_q & "00000000000000000000";
    u0_lsCosTable_q <= u0_lsCosTable_q_int(31 downto 0);

	--u0_cosSub(SUB,63)@18
    u0_cosSub_a <= u0_lsCosTable_q(31 downto 18);
    u0_cosSub_b <= STD_LOGIC_VECTOR("00000000" & u0_sinMult_q(23 downto 18));
    u0_cosSub_i <= u0_sin_pi_over_4_q;
    u0_cosSub_a1 <= u0_cosSub_i WHEN (u0_alphaOverflowBitSelect_b = "1") ELSE u0_cosSub_a;
    u0_cosSub_b1 <= (others => '0') WHEN (u0_alphaOverflowBitSelect_b = "1") ELSE u0_cosSub_b;
    u0_cosSub: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_cosSub_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_cosSub_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_cosSub_a1) - UNSIGNED(u0_cosSub_b1));
        END IF;
    END PROCESS;
    u0_cosSub_q <= u0_cosSub_o(13 downto 0);


	--u0_roundedCos(ROUND,65)@19
    u0_roundedCos_in <= u0_cosSub_q;
    u0_roundedCos: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_roundedCos_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_roundedCos_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_roundedCos_in(13 downto 2)), 12) + SIGNED(STD_LOGIC_VECTOR'("00000000000" & u0_roundedCos_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u0_doSwap(LOOKUP,66)@19
    u0_doSwap: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_doSwap_q <= "0";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (d_u0_octantBitSelect_b_19_replace_mem_q) IS
                WHEN "000" =>  u0_doSwap_q <= "0";
                WHEN "001" =>  u0_doSwap_q <= "1";
                WHEN "010" =>  u0_doSwap_q <= "1";
                WHEN "011" =>  u0_doSwap_q <= "0";
                WHEN "100" =>  u0_doSwap_q <= "0";
                WHEN "101" =>  u0_doSwap_q <= "1";
                WHEN "110" =>  u0_doSwap_q <= "1";
                WHEN "111" =>  u0_doSwap_q <= "0";
                WHEN OTHERS =>
                    u0_doSwap_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u0_cosSwapMux(MUX,74)@20
    u0_cosSwapMux_s <= u0_doSwap_q;
    u0_cosSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_cosSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u0_cosSwapMux_s IS
                      WHEN "0" => u0_cosSwapMux_q <= u0_roundedCos_q;
                      WHEN "1" => u0_cosSwapMux_q <= u0_roundedSin_q;
                      WHEN OTHERS => u0_cosSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u0_cosInvert(SUB,76)@21
    u0_cosInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u0_cosInvert_b <= u0_cosSwapMux_q;
    u0_cosInvert_i <= u0_cosInvert_b;
    u0_cosInvert_a1 <= u0_cosInvert_i WHEN (u0_doCosInvert_q = "1") ELSE u0_cosInvert_a;
    u0_cosInvert_b1 <= (others => '0') WHEN (u0_doCosInvert_q = "1") ELSE u0_cosInvert_b;
    u0_cosInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_cosInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_cosInvert_o <= STD_LOGIC_VECTOR(SIGNED(u0_cosInvert_a1) - SIGNED(u0_cosInvert_b1));
        END IF;
    END PROCESS;
    u0_cosInvert_q <= u0_cosInvert_o(11 downto 0);


	--u15_invertSin(BITSELECT,682)@20
    u15_invertSin_in <= u15_phaseIncrReg_p0_q;
    u15_invertSin_b <= u15_invertSin_in(19 downto 19);

	--u15_sinJoin(BITJOIN,683)@20
    u15_sinJoin_q <= u15_invertSin_b & d_u15_octantBitSelect_b_20_q;

	--u15_doSinInvert(LOOKUP,684)@20
    u15_doSinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_doSinInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u15_sinJoin_q) IS
                WHEN "0000" =>  u15_doSinInvert_q <= "1";
                WHEN "0001" =>  u15_doSinInvert_q <= "1";
                WHEN "0010" =>  u15_doSinInvert_q <= "1";
                WHEN "0011" =>  u15_doSinInvert_q <= "1";
                WHEN "0100" =>  u15_doSinInvert_q <= "0";
                WHEN "0101" =>  u15_doSinInvert_q <= "0";
                WHEN "0110" =>  u15_doSinInvert_q <= "0";
                WHEN "0111" =>  u15_doSinInvert_q <= "0";
                WHEN "1000" =>  u15_doSinInvert_q <= "0";
                WHEN "1001" =>  u15_doSinInvert_q <= "0";
                WHEN "1010" =>  u15_doSinInvert_q <= "0";
                WHEN "1011" =>  u15_doSinInvert_q <= "0";
                WHEN "1100" =>  u15_doSinInvert_q <= "1";
                WHEN "1101" =>  u15_doSinInvert_q <= "1";
                WHEN "1110" =>  u15_doSinInvert_q <= "1";
                WHEN "1111" =>  u15_doSinInvert_q <= "1";
                WHEN OTHERS =>
                    u15_doSinInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u15_sinSwapMux(MUX,688)@20
    u15_sinSwapMux_s <= u15_doSwap_q;
    u15_sinSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_sinSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u15_sinSwapMux_s IS
                      WHEN "0" => u15_sinSwapMux_q <= u15_roundedSin_q;
                      WHEN "1" => u15_sinSwapMux_q <= u15_roundedCos_q;
                      WHEN OTHERS => u15_sinSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u15_sinInvert(SUB,690)@21
    u15_sinInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u15_sinInvert_b <= u15_sinSwapMux_q;
    u15_sinInvert_i <= u15_sinInvert_b;
    u15_sinInvert_a1 <= u15_sinInvert_i WHEN (u15_doSinInvert_q = "1") ELSE u15_sinInvert_a;
    u15_sinInvert_b1 <= (others => '0') WHEN (u15_doSinInvert_q = "1") ELSE u15_sinInvert_b;
    u15_sinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_sinInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u15_sinInvert_o <= STD_LOGIC_VECTOR(SIGNED(u15_sinInvert_a1) - SIGNED(u15_sinInvert_b1));
        END IF;
    END PROCESS;
    u15_sinInvert_q <= u15_sinInvert_o(11 downto 0);


	--u14_invertSin(BITSELECT,641)@20
    u14_invertSin_in <= u14_phaseIncrReg_p0_q;
    u14_invertSin_b <= u14_invertSin_in(19 downto 19);

	--u14_sinJoin(BITJOIN,642)@20
    u14_sinJoin_q <= u14_invertSin_b & d_u14_octantBitSelect_b_20_q;

	--u14_doSinInvert(LOOKUP,643)@20
    u14_doSinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_doSinInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u14_sinJoin_q) IS
                WHEN "0000" =>  u14_doSinInvert_q <= "1";
                WHEN "0001" =>  u14_doSinInvert_q <= "1";
                WHEN "0010" =>  u14_doSinInvert_q <= "1";
                WHEN "0011" =>  u14_doSinInvert_q <= "1";
                WHEN "0100" =>  u14_doSinInvert_q <= "0";
                WHEN "0101" =>  u14_doSinInvert_q <= "0";
                WHEN "0110" =>  u14_doSinInvert_q <= "0";
                WHEN "0111" =>  u14_doSinInvert_q <= "0";
                WHEN "1000" =>  u14_doSinInvert_q <= "0";
                WHEN "1001" =>  u14_doSinInvert_q <= "0";
                WHEN "1010" =>  u14_doSinInvert_q <= "0";
                WHEN "1011" =>  u14_doSinInvert_q <= "0";
                WHEN "1100" =>  u14_doSinInvert_q <= "1";
                WHEN "1101" =>  u14_doSinInvert_q <= "1";
                WHEN "1110" =>  u14_doSinInvert_q <= "1";
                WHEN "1111" =>  u14_doSinInvert_q <= "1";
                WHEN OTHERS =>
                    u14_doSinInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u14_sinSwapMux(MUX,647)@20
    u14_sinSwapMux_s <= u14_doSwap_q;
    u14_sinSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_sinSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u14_sinSwapMux_s IS
                      WHEN "0" => u14_sinSwapMux_q <= u14_roundedSin_q;
                      WHEN "1" => u14_sinSwapMux_q <= u14_roundedCos_q;
                      WHEN OTHERS => u14_sinSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u14_sinInvert(SUB,649)@21
    u14_sinInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u14_sinInvert_b <= u14_sinSwapMux_q;
    u14_sinInvert_i <= u14_sinInvert_b;
    u14_sinInvert_a1 <= u14_sinInvert_i WHEN (u14_doSinInvert_q = "1") ELSE u14_sinInvert_a;
    u14_sinInvert_b1 <= (others => '0') WHEN (u14_doSinInvert_q = "1") ELSE u14_sinInvert_b;
    u14_sinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_sinInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u14_sinInvert_o <= STD_LOGIC_VECTOR(SIGNED(u14_sinInvert_a1) - SIGNED(u14_sinInvert_b1));
        END IF;
    END PROCESS;
    u14_sinInvert_q <= u14_sinInvert_o(11 downto 0);


	--u13_invertSin(BITSELECT,600)@20
    u13_invertSin_in <= u13_phaseIncrReg_p0_q;
    u13_invertSin_b <= u13_invertSin_in(19 downto 19);

	--u13_sinJoin(BITJOIN,601)@20
    u13_sinJoin_q <= u13_invertSin_b & d_u13_octantBitSelect_b_20_q;

	--u13_doSinInvert(LOOKUP,602)@20
    u13_doSinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_doSinInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u13_sinJoin_q) IS
                WHEN "0000" =>  u13_doSinInvert_q <= "1";
                WHEN "0001" =>  u13_doSinInvert_q <= "1";
                WHEN "0010" =>  u13_doSinInvert_q <= "1";
                WHEN "0011" =>  u13_doSinInvert_q <= "1";
                WHEN "0100" =>  u13_doSinInvert_q <= "0";
                WHEN "0101" =>  u13_doSinInvert_q <= "0";
                WHEN "0110" =>  u13_doSinInvert_q <= "0";
                WHEN "0111" =>  u13_doSinInvert_q <= "0";
                WHEN "1000" =>  u13_doSinInvert_q <= "0";
                WHEN "1001" =>  u13_doSinInvert_q <= "0";
                WHEN "1010" =>  u13_doSinInvert_q <= "0";
                WHEN "1011" =>  u13_doSinInvert_q <= "0";
                WHEN "1100" =>  u13_doSinInvert_q <= "1";
                WHEN "1101" =>  u13_doSinInvert_q <= "1";
                WHEN "1110" =>  u13_doSinInvert_q <= "1";
                WHEN "1111" =>  u13_doSinInvert_q <= "1";
                WHEN OTHERS =>
                    u13_doSinInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u13_sinSwapMux(MUX,606)@20
    u13_sinSwapMux_s <= u13_doSwap_q;
    u13_sinSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_sinSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u13_sinSwapMux_s IS
                      WHEN "0" => u13_sinSwapMux_q <= u13_roundedSin_q;
                      WHEN "1" => u13_sinSwapMux_q <= u13_roundedCos_q;
                      WHEN OTHERS => u13_sinSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u13_sinInvert(SUB,608)@21
    u13_sinInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u13_sinInvert_b <= u13_sinSwapMux_q;
    u13_sinInvert_i <= u13_sinInvert_b;
    u13_sinInvert_a1 <= u13_sinInvert_i WHEN (u13_doSinInvert_q = "1") ELSE u13_sinInvert_a;
    u13_sinInvert_b1 <= (others => '0') WHEN (u13_doSinInvert_q = "1") ELSE u13_sinInvert_b;
    u13_sinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_sinInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u13_sinInvert_o <= STD_LOGIC_VECTOR(SIGNED(u13_sinInvert_a1) - SIGNED(u13_sinInvert_b1));
        END IF;
    END PROCESS;
    u13_sinInvert_q <= u13_sinInvert_o(11 downto 0);


	--u12_invertSin(BITSELECT,559)@20
    u12_invertSin_in <= u12_phaseIncrReg_p0_q;
    u12_invertSin_b <= u12_invertSin_in(19 downto 19);

	--u12_sinJoin(BITJOIN,560)@20
    u12_sinJoin_q <= u12_invertSin_b & d_u12_octantBitSelect_b_20_q;

	--u12_doSinInvert(LOOKUP,561)@20
    u12_doSinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_doSinInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u12_sinJoin_q) IS
                WHEN "0000" =>  u12_doSinInvert_q <= "1";
                WHEN "0001" =>  u12_doSinInvert_q <= "1";
                WHEN "0010" =>  u12_doSinInvert_q <= "1";
                WHEN "0011" =>  u12_doSinInvert_q <= "1";
                WHEN "0100" =>  u12_doSinInvert_q <= "0";
                WHEN "0101" =>  u12_doSinInvert_q <= "0";
                WHEN "0110" =>  u12_doSinInvert_q <= "0";
                WHEN "0111" =>  u12_doSinInvert_q <= "0";
                WHEN "1000" =>  u12_doSinInvert_q <= "0";
                WHEN "1001" =>  u12_doSinInvert_q <= "0";
                WHEN "1010" =>  u12_doSinInvert_q <= "0";
                WHEN "1011" =>  u12_doSinInvert_q <= "0";
                WHEN "1100" =>  u12_doSinInvert_q <= "1";
                WHEN "1101" =>  u12_doSinInvert_q <= "1";
                WHEN "1110" =>  u12_doSinInvert_q <= "1";
                WHEN "1111" =>  u12_doSinInvert_q <= "1";
                WHEN OTHERS =>
                    u12_doSinInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u12_sinSwapMux(MUX,565)@20
    u12_sinSwapMux_s <= u12_doSwap_q;
    u12_sinSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_sinSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u12_sinSwapMux_s IS
                      WHEN "0" => u12_sinSwapMux_q <= u12_roundedSin_q;
                      WHEN "1" => u12_sinSwapMux_q <= u12_roundedCos_q;
                      WHEN OTHERS => u12_sinSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u12_sinInvert(SUB,567)@21
    u12_sinInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u12_sinInvert_b <= u12_sinSwapMux_q;
    u12_sinInvert_i <= u12_sinInvert_b;
    u12_sinInvert_a1 <= u12_sinInvert_i WHEN (u12_doSinInvert_q = "1") ELSE u12_sinInvert_a;
    u12_sinInvert_b1 <= (others => '0') WHEN (u12_doSinInvert_q = "1") ELSE u12_sinInvert_b;
    u12_sinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_sinInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u12_sinInvert_o <= STD_LOGIC_VECTOR(SIGNED(u12_sinInvert_a1) - SIGNED(u12_sinInvert_b1));
        END IF;
    END PROCESS;
    u12_sinInvert_q <= u12_sinInvert_o(11 downto 0);


	--u11_invertSin(BITSELECT,518)@20
    u11_invertSin_in <= u11_phaseIncrReg_p0_q;
    u11_invertSin_b <= u11_invertSin_in(19 downto 19);

	--u11_sinJoin(BITJOIN,519)@20
    u11_sinJoin_q <= u11_invertSin_b & d_u11_octantBitSelect_b_20_q;

	--u11_doSinInvert(LOOKUP,520)@20
    u11_doSinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_doSinInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u11_sinJoin_q) IS
                WHEN "0000" =>  u11_doSinInvert_q <= "1";
                WHEN "0001" =>  u11_doSinInvert_q <= "1";
                WHEN "0010" =>  u11_doSinInvert_q <= "1";
                WHEN "0011" =>  u11_doSinInvert_q <= "1";
                WHEN "0100" =>  u11_doSinInvert_q <= "0";
                WHEN "0101" =>  u11_doSinInvert_q <= "0";
                WHEN "0110" =>  u11_doSinInvert_q <= "0";
                WHEN "0111" =>  u11_doSinInvert_q <= "0";
                WHEN "1000" =>  u11_doSinInvert_q <= "0";
                WHEN "1001" =>  u11_doSinInvert_q <= "0";
                WHEN "1010" =>  u11_doSinInvert_q <= "0";
                WHEN "1011" =>  u11_doSinInvert_q <= "0";
                WHEN "1100" =>  u11_doSinInvert_q <= "1";
                WHEN "1101" =>  u11_doSinInvert_q <= "1";
                WHEN "1110" =>  u11_doSinInvert_q <= "1";
                WHEN "1111" =>  u11_doSinInvert_q <= "1";
                WHEN OTHERS =>
                    u11_doSinInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u11_sinSwapMux(MUX,524)@20
    u11_sinSwapMux_s <= u11_doSwap_q;
    u11_sinSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_sinSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u11_sinSwapMux_s IS
                      WHEN "0" => u11_sinSwapMux_q <= u11_roundedSin_q;
                      WHEN "1" => u11_sinSwapMux_q <= u11_roundedCos_q;
                      WHEN OTHERS => u11_sinSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u11_sinInvert(SUB,526)@21
    u11_sinInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u11_sinInvert_b <= u11_sinSwapMux_q;
    u11_sinInvert_i <= u11_sinInvert_b;
    u11_sinInvert_a1 <= u11_sinInvert_i WHEN (u11_doSinInvert_q = "1") ELSE u11_sinInvert_a;
    u11_sinInvert_b1 <= (others => '0') WHEN (u11_doSinInvert_q = "1") ELSE u11_sinInvert_b;
    u11_sinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_sinInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u11_sinInvert_o <= STD_LOGIC_VECTOR(SIGNED(u11_sinInvert_a1) - SIGNED(u11_sinInvert_b1));
        END IF;
    END PROCESS;
    u11_sinInvert_q <= u11_sinInvert_o(11 downto 0);


	--u10_invertSin(BITSELECT,477)@20
    u10_invertSin_in <= u10_phaseIncrReg_p0_q;
    u10_invertSin_b <= u10_invertSin_in(19 downto 19);

	--u10_sinJoin(BITJOIN,478)@20
    u10_sinJoin_q <= u10_invertSin_b & d_u10_octantBitSelect_b_20_q;

	--u10_doSinInvert(LOOKUP,479)@20
    u10_doSinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_doSinInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u10_sinJoin_q) IS
                WHEN "0000" =>  u10_doSinInvert_q <= "1";
                WHEN "0001" =>  u10_doSinInvert_q <= "1";
                WHEN "0010" =>  u10_doSinInvert_q <= "1";
                WHEN "0011" =>  u10_doSinInvert_q <= "1";
                WHEN "0100" =>  u10_doSinInvert_q <= "0";
                WHEN "0101" =>  u10_doSinInvert_q <= "0";
                WHEN "0110" =>  u10_doSinInvert_q <= "0";
                WHEN "0111" =>  u10_doSinInvert_q <= "0";
                WHEN "1000" =>  u10_doSinInvert_q <= "0";
                WHEN "1001" =>  u10_doSinInvert_q <= "0";
                WHEN "1010" =>  u10_doSinInvert_q <= "0";
                WHEN "1011" =>  u10_doSinInvert_q <= "0";
                WHEN "1100" =>  u10_doSinInvert_q <= "1";
                WHEN "1101" =>  u10_doSinInvert_q <= "1";
                WHEN "1110" =>  u10_doSinInvert_q <= "1";
                WHEN "1111" =>  u10_doSinInvert_q <= "1";
                WHEN OTHERS =>
                    u10_doSinInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u10_sinSwapMux(MUX,483)@20
    u10_sinSwapMux_s <= u10_doSwap_q;
    u10_sinSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_sinSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u10_sinSwapMux_s IS
                      WHEN "0" => u10_sinSwapMux_q <= u10_roundedSin_q;
                      WHEN "1" => u10_sinSwapMux_q <= u10_roundedCos_q;
                      WHEN OTHERS => u10_sinSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u10_sinInvert(SUB,485)@21
    u10_sinInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u10_sinInvert_b <= u10_sinSwapMux_q;
    u10_sinInvert_i <= u10_sinInvert_b;
    u10_sinInvert_a1 <= u10_sinInvert_i WHEN (u10_doSinInvert_q = "1") ELSE u10_sinInvert_a;
    u10_sinInvert_b1 <= (others => '0') WHEN (u10_doSinInvert_q = "1") ELSE u10_sinInvert_b;
    u10_sinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_sinInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u10_sinInvert_o <= STD_LOGIC_VECTOR(SIGNED(u10_sinInvert_a1) - SIGNED(u10_sinInvert_b1));
        END IF;
    END PROCESS;
    u10_sinInvert_q <= u10_sinInvert_o(11 downto 0);


	--u9_invertSin(BITSELECT,436)@20
    u9_invertSin_in <= u9_phaseIncrReg_p0_q;
    u9_invertSin_b <= u9_invertSin_in(19 downto 19);

	--u9_sinJoin(BITJOIN,437)@20
    u9_sinJoin_q <= u9_invertSin_b & d_u9_octantBitSelect_b_20_q;

	--u9_doSinInvert(LOOKUP,438)@20
    u9_doSinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_doSinInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u9_sinJoin_q) IS
                WHEN "0000" =>  u9_doSinInvert_q <= "1";
                WHEN "0001" =>  u9_doSinInvert_q <= "1";
                WHEN "0010" =>  u9_doSinInvert_q <= "1";
                WHEN "0011" =>  u9_doSinInvert_q <= "1";
                WHEN "0100" =>  u9_doSinInvert_q <= "0";
                WHEN "0101" =>  u9_doSinInvert_q <= "0";
                WHEN "0110" =>  u9_doSinInvert_q <= "0";
                WHEN "0111" =>  u9_doSinInvert_q <= "0";
                WHEN "1000" =>  u9_doSinInvert_q <= "0";
                WHEN "1001" =>  u9_doSinInvert_q <= "0";
                WHEN "1010" =>  u9_doSinInvert_q <= "0";
                WHEN "1011" =>  u9_doSinInvert_q <= "0";
                WHEN "1100" =>  u9_doSinInvert_q <= "1";
                WHEN "1101" =>  u9_doSinInvert_q <= "1";
                WHEN "1110" =>  u9_doSinInvert_q <= "1";
                WHEN "1111" =>  u9_doSinInvert_q <= "1";
                WHEN OTHERS =>
                    u9_doSinInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u9_sinSwapMux(MUX,442)@20
    u9_sinSwapMux_s <= u9_doSwap_q;
    u9_sinSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_sinSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u9_sinSwapMux_s IS
                      WHEN "0" => u9_sinSwapMux_q <= u9_roundedSin_q;
                      WHEN "1" => u9_sinSwapMux_q <= u9_roundedCos_q;
                      WHEN OTHERS => u9_sinSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u9_sinInvert(SUB,444)@21
    u9_sinInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u9_sinInvert_b <= u9_sinSwapMux_q;
    u9_sinInvert_i <= u9_sinInvert_b;
    u9_sinInvert_a1 <= u9_sinInvert_i WHEN (u9_doSinInvert_q = "1") ELSE u9_sinInvert_a;
    u9_sinInvert_b1 <= (others => '0') WHEN (u9_doSinInvert_q = "1") ELSE u9_sinInvert_b;
    u9_sinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_sinInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u9_sinInvert_o <= STD_LOGIC_VECTOR(SIGNED(u9_sinInvert_a1) - SIGNED(u9_sinInvert_b1));
        END IF;
    END PROCESS;
    u9_sinInvert_q <= u9_sinInvert_o(11 downto 0);


	--u8_invertSin(BITSELECT,395)@20
    u8_invertSin_in <= u8_phaseIncrReg_p0_q;
    u8_invertSin_b <= u8_invertSin_in(19 downto 19);

	--u8_sinJoin(BITJOIN,396)@20
    u8_sinJoin_q <= u8_invertSin_b & d_u8_octantBitSelect_b_20_q;

	--u8_doSinInvert(LOOKUP,397)@20
    u8_doSinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_doSinInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u8_sinJoin_q) IS
                WHEN "0000" =>  u8_doSinInvert_q <= "1";
                WHEN "0001" =>  u8_doSinInvert_q <= "1";
                WHEN "0010" =>  u8_doSinInvert_q <= "1";
                WHEN "0011" =>  u8_doSinInvert_q <= "1";
                WHEN "0100" =>  u8_doSinInvert_q <= "0";
                WHEN "0101" =>  u8_doSinInvert_q <= "0";
                WHEN "0110" =>  u8_doSinInvert_q <= "0";
                WHEN "0111" =>  u8_doSinInvert_q <= "0";
                WHEN "1000" =>  u8_doSinInvert_q <= "0";
                WHEN "1001" =>  u8_doSinInvert_q <= "0";
                WHEN "1010" =>  u8_doSinInvert_q <= "0";
                WHEN "1011" =>  u8_doSinInvert_q <= "0";
                WHEN "1100" =>  u8_doSinInvert_q <= "1";
                WHEN "1101" =>  u8_doSinInvert_q <= "1";
                WHEN "1110" =>  u8_doSinInvert_q <= "1";
                WHEN "1111" =>  u8_doSinInvert_q <= "1";
                WHEN OTHERS =>
                    u8_doSinInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u8_sinSwapMux(MUX,401)@20
    u8_sinSwapMux_s <= u8_doSwap_q;
    u8_sinSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_sinSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u8_sinSwapMux_s IS
                      WHEN "0" => u8_sinSwapMux_q <= u8_roundedSin_q;
                      WHEN "1" => u8_sinSwapMux_q <= u8_roundedCos_q;
                      WHEN OTHERS => u8_sinSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u8_sinInvert(SUB,403)@21
    u8_sinInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u8_sinInvert_b <= u8_sinSwapMux_q;
    u8_sinInvert_i <= u8_sinInvert_b;
    u8_sinInvert_a1 <= u8_sinInvert_i WHEN (u8_doSinInvert_q = "1") ELSE u8_sinInvert_a;
    u8_sinInvert_b1 <= (others => '0') WHEN (u8_doSinInvert_q = "1") ELSE u8_sinInvert_b;
    u8_sinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_sinInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u8_sinInvert_o <= STD_LOGIC_VECTOR(SIGNED(u8_sinInvert_a1) - SIGNED(u8_sinInvert_b1));
        END IF;
    END PROCESS;
    u8_sinInvert_q <= u8_sinInvert_o(11 downto 0);


	--u7_invertSin(BITSELECT,354)@20
    u7_invertSin_in <= u7_phaseIncrReg_p0_q;
    u7_invertSin_b <= u7_invertSin_in(19 downto 19);

	--u7_sinJoin(BITJOIN,355)@20
    u7_sinJoin_q <= u7_invertSin_b & d_u7_octantBitSelect_b_20_q;

	--u7_doSinInvert(LOOKUP,356)@20
    u7_doSinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_doSinInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u7_sinJoin_q) IS
                WHEN "0000" =>  u7_doSinInvert_q <= "1";
                WHEN "0001" =>  u7_doSinInvert_q <= "1";
                WHEN "0010" =>  u7_doSinInvert_q <= "1";
                WHEN "0011" =>  u7_doSinInvert_q <= "1";
                WHEN "0100" =>  u7_doSinInvert_q <= "0";
                WHEN "0101" =>  u7_doSinInvert_q <= "0";
                WHEN "0110" =>  u7_doSinInvert_q <= "0";
                WHEN "0111" =>  u7_doSinInvert_q <= "0";
                WHEN "1000" =>  u7_doSinInvert_q <= "0";
                WHEN "1001" =>  u7_doSinInvert_q <= "0";
                WHEN "1010" =>  u7_doSinInvert_q <= "0";
                WHEN "1011" =>  u7_doSinInvert_q <= "0";
                WHEN "1100" =>  u7_doSinInvert_q <= "1";
                WHEN "1101" =>  u7_doSinInvert_q <= "1";
                WHEN "1110" =>  u7_doSinInvert_q <= "1";
                WHEN "1111" =>  u7_doSinInvert_q <= "1";
                WHEN OTHERS =>
                    u7_doSinInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u7_sinSwapMux(MUX,360)@20
    u7_sinSwapMux_s <= u7_doSwap_q;
    u7_sinSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_sinSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u7_sinSwapMux_s IS
                      WHEN "0" => u7_sinSwapMux_q <= u7_roundedSin_q;
                      WHEN "1" => u7_sinSwapMux_q <= u7_roundedCos_q;
                      WHEN OTHERS => u7_sinSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u7_sinInvert(SUB,362)@21
    u7_sinInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u7_sinInvert_b <= u7_sinSwapMux_q;
    u7_sinInvert_i <= u7_sinInvert_b;
    u7_sinInvert_a1 <= u7_sinInvert_i WHEN (u7_doSinInvert_q = "1") ELSE u7_sinInvert_a;
    u7_sinInvert_b1 <= (others => '0') WHEN (u7_doSinInvert_q = "1") ELSE u7_sinInvert_b;
    u7_sinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_sinInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u7_sinInvert_o <= STD_LOGIC_VECTOR(SIGNED(u7_sinInvert_a1) - SIGNED(u7_sinInvert_b1));
        END IF;
    END PROCESS;
    u7_sinInvert_q <= u7_sinInvert_o(11 downto 0);


	--u6_invertSin(BITSELECT,313)@20
    u6_invertSin_in <= u6_phaseIncrReg_p0_q;
    u6_invertSin_b <= u6_invertSin_in(19 downto 19);

	--u6_sinJoin(BITJOIN,314)@20
    u6_sinJoin_q <= u6_invertSin_b & d_u6_octantBitSelect_b_20_q;

	--u6_doSinInvert(LOOKUP,315)@20
    u6_doSinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_doSinInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u6_sinJoin_q) IS
                WHEN "0000" =>  u6_doSinInvert_q <= "1";
                WHEN "0001" =>  u6_doSinInvert_q <= "1";
                WHEN "0010" =>  u6_doSinInvert_q <= "1";
                WHEN "0011" =>  u6_doSinInvert_q <= "1";
                WHEN "0100" =>  u6_doSinInvert_q <= "0";
                WHEN "0101" =>  u6_doSinInvert_q <= "0";
                WHEN "0110" =>  u6_doSinInvert_q <= "0";
                WHEN "0111" =>  u6_doSinInvert_q <= "0";
                WHEN "1000" =>  u6_doSinInvert_q <= "0";
                WHEN "1001" =>  u6_doSinInvert_q <= "0";
                WHEN "1010" =>  u6_doSinInvert_q <= "0";
                WHEN "1011" =>  u6_doSinInvert_q <= "0";
                WHEN "1100" =>  u6_doSinInvert_q <= "1";
                WHEN "1101" =>  u6_doSinInvert_q <= "1";
                WHEN "1110" =>  u6_doSinInvert_q <= "1";
                WHEN "1111" =>  u6_doSinInvert_q <= "1";
                WHEN OTHERS =>
                    u6_doSinInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u6_sinSwapMux(MUX,319)@20
    u6_sinSwapMux_s <= u6_doSwap_q;
    u6_sinSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_sinSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u6_sinSwapMux_s IS
                      WHEN "0" => u6_sinSwapMux_q <= u6_roundedSin_q;
                      WHEN "1" => u6_sinSwapMux_q <= u6_roundedCos_q;
                      WHEN OTHERS => u6_sinSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u6_sinInvert(SUB,321)@21
    u6_sinInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u6_sinInvert_b <= u6_sinSwapMux_q;
    u6_sinInvert_i <= u6_sinInvert_b;
    u6_sinInvert_a1 <= u6_sinInvert_i WHEN (u6_doSinInvert_q = "1") ELSE u6_sinInvert_a;
    u6_sinInvert_b1 <= (others => '0') WHEN (u6_doSinInvert_q = "1") ELSE u6_sinInvert_b;
    u6_sinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_sinInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u6_sinInvert_o <= STD_LOGIC_VECTOR(SIGNED(u6_sinInvert_a1) - SIGNED(u6_sinInvert_b1));
        END IF;
    END PROCESS;
    u6_sinInvert_q <= u6_sinInvert_o(11 downto 0);


	--u5_invertSin(BITSELECT,272)@20
    u5_invertSin_in <= u5_phaseIncrReg_p0_q;
    u5_invertSin_b <= u5_invertSin_in(19 downto 19);

	--u5_sinJoin(BITJOIN,273)@20
    u5_sinJoin_q <= u5_invertSin_b & d_u5_octantBitSelect_b_20_q;

	--u5_doSinInvert(LOOKUP,274)@20
    u5_doSinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_doSinInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u5_sinJoin_q) IS
                WHEN "0000" =>  u5_doSinInvert_q <= "1";
                WHEN "0001" =>  u5_doSinInvert_q <= "1";
                WHEN "0010" =>  u5_doSinInvert_q <= "1";
                WHEN "0011" =>  u5_doSinInvert_q <= "1";
                WHEN "0100" =>  u5_doSinInvert_q <= "0";
                WHEN "0101" =>  u5_doSinInvert_q <= "0";
                WHEN "0110" =>  u5_doSinInvert_q <= "0";
                WHEN "0111" =>  u5_doSinInvert_q <= "0";
                WHEN "1000" =>  u5_doSinInvert_q <= "0";
                WHEN "1001" =>  u5_doSinInvert_q <= "0";
                WHEN "1010" =>  u5_doSinInvert_q <= "0";
                WHEN "1011" =>  u5_doSinInvert_q <= "0";
                WHEN "1100" =>  u5_doSinInvert_q <= "1";
                WHEN "1101" =>  u5_doSinInvert_q <= "1";
                WHEN "1110" =>  u5_doSinInvert_q <= "1";
                WHEN "1111" =>  u5_doSinInvert_q <= "1";
                WHEN OTHERS =>
                    u5_doSinInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u5_sinSwapMux(MUX,278)@20
    u5_sinSwapMux_s <= u5_doSwap_q;
    u5_sinSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_sinSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u5_sinSwapMux_s IS
                      WHEN "0" => u5_sinSwapMux_q <= u5_roundedSin_q;
                      WHEN "1" => u5_sinSwapMux_q <= u5_roundedCos_q;
                      WHEN OTHERS => u5_sinSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u5_sinInvert(SUB,280)@21
    u5_sinInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u5_sinInvert_b <= u5_sinSwapMux_q;
    u5_sinInvert_i <= u5_sinInvert_b;
    u5_sinInvert_a1 <= u5_sinInvert_i WHEN (u5_doSinInvert_q = "1") ELSE u5_sinInvert_a;
    u5_sinInvert_b1 <= (others => '0') WHEN (u5_doSinInvert_q = "1") ELSE u5_sinInvert_b;
    u5_sinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_sinInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u5_sinInvert_o <= STD_LOGIC_VECTOR(SIGNED(u5_sinInvert_a1) - SIGNED(u5_sinInvert_b1));
        END IF;
    END PROCESS;
    u5_sinInvert_q <= u5_sinInvert_o(11 downto 0);


	--u4_invertSin(BITSELECT,231)@20
    u4_invertSin_in <= u4_phaseIncrReg_p0_q;
    u4_invertSin_b <= u4_invertSin_in(19 downto 19);

	--u4_sinJoin(BITJOIN,232)@20
    u4_sinJoin_q <= u4_invertSin_b & d_u4_octantBitSelect_b_20_q;

	--u4_doSinInvert(LOOKUP,233)@20
    u4_doSinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_doSinInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u4_sinJoin_q) IS
                WHEN "0000" =>  u4_doSinInvert_q <= "1";
                WHEN "0001" =>  u4_doSinInvert_q <= "1";
                WHEN "0010" =>  u4_doSinInvert_q <= "1";
                WHEN "0011" =>  u4_doSinInvert_q <= "1";
                WHEN "0100" =>  u4_doSinInvert_q <= "0";
                WHEN "0101" =>  u4_doSinInvert_q <= "0";
                WHEN "0110" =>  u4_doSinInvert_q <= "0";
                WHEN "0111" =>  u4_doSinInvert_q <= "0";
                WHEN "1000" =>  u4_doSinInvert_q <= "0";
                WHEN "1001" =>  u4_doSinInvert_q <= "0";
                WHEN "1010" =>  u4_doSinInvert_q <= "0";
                WHEN "1011" =>  u4_doSinInvert_q <= "0";
                WHEN "1100" =>  u4_doSinInvert_q <= "1";
                WHEN "1101" =>  u4_doSinInvert_q <= "1";
                WHEN "1110" =>  u4_doSinInvert_q <= "1";
                WHEN "1111" =>  u4_doSinInvert_q <= "1";
                WHEN OTHERS =>
                    u4_doSinInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u4_sinSwapMux(MUX,237)@20
    u4_sinSwapMux_s <= u4_doSwap_q;
    u4_sinSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_sinSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u4_sinSwapMux_s IS
                      WHEN "0" => u4_sinSwapMux_q <= u4_roundedSin_q;
                      WHEN "1" => u4_sinSwapMux_q <= u4_roundedCos_q;
                      WHEN OTHERS => u4_sinSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u4_sinInvert(SUB,239)@21
    u4_sinInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u4_sinInvert_b <= u4_sinSwapMux_q;
    u4_sinInvert_i <= u4_sinInvert_b;
    u4_sinInvert_a1 <= u4_sinInvert_i WHEN (u4_doSinInvert_q = "1") ELSE u4_sinInvert_a;
    u4_sinInvert_b1 <= (others => '0') WHEN (u4_doSinInvert_q = "1") ELSE u4_sinInvert_b;
    u4_sinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_sinInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u4_sinInvert_o <= STD_LOGIC_VECTOR(SIGNED(u4_sinInvert_a1) - SIGNED(u4_sinInvert_b1));
        END IF;
    END PROCESS;
    u4_sinInvert_q <= u4_sinInvert_o(11 downto 0);


	--u3_invertSin(BITSELECT,190)@20
    u3_invertSin_in <= u3_phaseIncrReg_p0_q;
    u3_invertSin_b <= u3_invertSin_in(19 downto 19);

	--u3_sinJoin(BITJOIN,191)@20
    u3_sinJoin_q <= u3_invertSin_b & d_u3_octantBitSelect_b_20_q;

	--u3_doSinInvert(LOOKUP,192)@20
    u3_doSinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_doSinInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u3_sinJoin_q) IS
                WHEN "0000" =>  u3_doSinInvert_q <= "1";
                WHEN "0001" =>  u3_doSinInvert_q <= "1";
                WHEN "0010" =>  u3_doSinInvert_q <= "1";
                WHEN "0011" =>  u3_doSinInvert_q <= "1";
                WHEN "0100" =>  u3_doSinInvert_q <= "0";
                WHEN "0101" =>  u3_doSinInvert_q <= "0";
                WHEN "0110" =>  u3_doSinInvert_q <= "0";
                WHEN "0111" =>  u3_doSinInvert_q <= "0";
                WHEN "1000" =>  u3_doSinInvert_q <= "0";
                WHEN "1001" =>  u3_doSinInvert_q <= "0";
                WHEN "1010" =>  u3_doSinInvert_q <= "0";
                WHEN "1011" =>  u3_doSinInvert_q <= "0";
                WHEN "1100" =>  u3_doSinInvert_q <= "1";
                WHEN "1101" =>  u3_doSinInvert_q <= "1";
                WHEN "1110" =>  u3_doSinInvert_q <= "1";
                WHEN "1111" =>  u3_doSinInvert_q <= "1";
                WHEN OTHERS =>
                    u3_doSinInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u3_sinSwapMux(MUX,196)@20
    u3_sinSwapMux_s <= u3_doSwap_q;
    u3_sinSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_sinSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u3_sinSwapMux_s IS
                      WHEN "0" => u3_sinSwapMux_q <= u3_roundedSin_q;
                      WHEN "1" => u3_sinSwapMux_q <= u3_roundedCos_q;
                      WHEN OTHERS => u3_sinSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u3_sinInvert(SUB,198)@21
    u3_sinInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u3_sinInvert_b <= u3_sinSwapMux_q;
    u3_sinInvert_i <= u3_sinInvert_b;
    u3_sinInvert_a1 <= u3_sinInvert_i WHEN (u3_doSinInvert_q = "1") ELSE u3_sinInvert_a;
    u3_sinInvert_b1 <= (others => '0') WHEN (u3_doSinInvert_q = "1") ELSE u3_sinInvert_b;
    u3_sinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_sinInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_sinInvert_o <= STD_LOGIC_VECTOR(SIGNED(u3_sinInvert_a1) - SIGNED(u3_sinInvert_b1));
        END IF;
    END PROCESS;
    u3_sinInvert_q <= u3_sinInvert_o(11 downto 0);


	--u2_invertSin(BITSELECT,149)@20
    u2_invertSin_in <= u2_phaseIncrReg_p0_q;
    u2_invertSin_b <= u2_invertSin_in(19 downto 19);

	--u2_sinJoin(BITJOIN,150)@20
    u2_sinJoin_q <= u2_invertSin_b & d_u2_octantBitSelect_b_20_q;

	--u2_doSinInvert(LOOKUP,151)@20
    u2_doSinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_doSinInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u2_sinJoin_q) IS
                WHEN "0000" =>  u2_doSinInvert_q <= "1";
                WHEN "0001" =>  u2_doSinInvert_q <= "1";
                WHEN "0010" =>  u2_doSinInvert_q <= "1";
                WHEN "0011" =>  u2_doSinInvert_q <= "1";
                WHEN "0100" =>  u2_doSinInvert_q <= "0";
                WHEN "0101" =>  u2_doSinInvert_q <= "0";
                WHEN "0110" =>  u2_doSinInvert_q <= "0";
                WHEN "0111" =>  u2_doSinInvert_q <= "0";
                WHEN "1000" =>  u2_doSinInvert_q <= "0";
                WHEN "1001" =>  u2_doSinInvert_q <= "0";
                WHEN "1010" =>  u2_doSinInvert_q <= "0";
                WHEN "1011" =>  u2_doSinInvert_q <= "0";
                WHEN "1100" =>  u2_doSinInvert_q <= "1";
                WHEN "1101" =>  u2_doSinInvert_q <= "1";
                WHEN "1110" =>  u2_doSinInvert_q <= "1";
                WHEN "1111" =>  u2_doSinInvert_q <= "1";
                WHEN OTHERS =>
                    u2_doSinInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u2_sinSwapMux(MUX,155)@20
    u2_sinSwapMux_s <= u2_doSwap_q;
    u2_sinSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_sinSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u2_sinSwapMux_s IS
                      WHEN "0" => u2_sinSwapMux_q <= u2_roundedSin_q;
                      WHEN "1" => u2_sinSwapMux_q <= u2_roundedCos_q;
                      WHEN OTHERS => u2_sinSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u2_sinInvert(SUB,157)@21
    u2_sinInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u2_sinInvert_b <= u2_sinSwapMux_q;
    u2_sinInvert_i <= u2_sinInvert_b;
    u2_sinInvert_a1 <= u2_sinInvert_i WHEN (u2_doSinInvert_q = "1") ELSE u2_sinInvert_a;
    u2_sinInvert_b1 <= (others => '0') WHEN (u2_doSinInvert_q = "1") ELSE u2_sinInvert_b;
    u2_sinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_sinInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_sinInvert_o <= STD_LOGIC_VECTOR(SIGNED(u2_sinInvert_a1) - SIGNED(u2_sinInvert_b1));
        END IF;
    END PROCESS;
    u2_sinInvert_q <= u2_sinInvert_o(11 downto 0);


	--u1_invertSin(BITSELECT,108)@20
    u1_invertSin_in <= u1_phaseIncrReg_p0_q;
    u1_invertSin_b <= u1_invertSin_in(19 downto 19);

	--u1_sinJoin(BITJOIN,109)@20
    u1_sinJoin_q <= u1_invertSin_b & d_u1_octantBitSelect_b_20_q;

	--u1_doSinInvert(LOOKUP,110)@20
    u1_doSinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_doSinInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u1_sinJoin_q) IS
                WHEN "0000" =>  u1_doSinInvert_q <= "1";
                WHEN "0001" =>  u1_doSinInvert_q <= "1";
                WHEN "0010" =>  u1_doSinInvert_q <= "1";
                WHEN "0011" =>  u1_doSinInvert_q <= "1";
                WHEN "0100" =>  u1_doSinInvert_q <= "0";
                WHEN "0101" =>  u1_doSinInvert_q <= "0";
                WHEN "0110" =>  u1_doSinInvert_q <= "0";
                WHEN "0111" =>  u1_doSinInvert_q <= "0";
                WHEN "1000" =>  u1_doSinInvert_q <= "0";
                WHEN "1001" =>  u1_doSinInvert_q <= "0";
                WHEN "1010" =>  u1_doSinInvert_q <= "0";
                WHEN "1011" =>  u1_doSinInvert_q <= "0";
                WHEN "1100" =>  u1_doSinInvert_q <= "1";
                WHEN "1101" =>  u1_doSinInvert_q <= "1";
                WHEN "1110" =>  u1_doSinInvert_q <= "1";
                WHEN "1111" =>  u1_doSinInvert_q <= "1";
                WHEN OTHERS =>
                    u1_doSinInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u1_sinSwapMux(MUX,114)@20
    u1_sinSwapMux_s <= u1_doSwap_q;
    u1_sinSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_sinSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u1_sinSwapMux_s IS
                      WHEN "0" => u1_sinSwapMux_q <= u1_roundedSin_q;
                      WHEN "1" => u1_sinSwapMux_q <= u1_roundedCos_q;
                      WHEN OTHERS => u1_sinSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u1_sinInvert(SUB,116)@21
    u1_sinInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u1_sinInvert_b <= u1_sinSwapMux_q;
    u1_sinInvert_i <= u1_sinInvert_b;
    u1_sinInvert_a1 <= u1_sinInvert_i WHEN (u1_doSinInvert_q = "1") ELSE u1_sinInvert_a;
    u1_sinInvert_b1 <= (others => '0') WHEN (u1_doSinInvert_q = "1") ELSE u1_sinInvert_b;
    u1_sinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_sinInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_sinInvert_o <= STD_LOGIC_VECTOR(SIGNED(u1_sinInvert_a1) - SIGNED(u1_sinInvert_b1));
        END IF;
    END PROCESS;
    u1_sinInvert_q <= u1_sinInvert_o(11 downto 0);


	--u0_invertSin(BITSELECT,67)@20
    u0_invertSin_in <= u0_phaseIncrReg_p0_q;
    u0_invertSin_b <= u0_invertSin_in(19 downto 19);

	--u0_sinJoin(BITJOIN,68)@20
    u0_sinJoin_q <= u0_invertSin_b & d_u0_octantBitSelect_b_20_q;

	--u0_doSinInvert(LOOKUP,69)@20
    u0_doSinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_doSinInvert_q <= "1";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (u0_sinJoin_q) IS
                WHEN "0000" =>  u0_doSinInvert_q <= "1";
                WHEN "0001" =>  u0_doSinInvert_q <= "1";
                WHEN "0010" =>  u0_doSinInvert_q <= "1";
                WHEN "0011" =>  u0_doSinInvert_q <= "1";
                WHEN "0100" =>  u0_doSinInvert_q <= "0";
                WHEN "0101" =>  u0_doSinInvert_q <= "0";
                WHEN "0110" =>  u0_doSinInvert_q <= "0";
                WHEN "0111" =>  u0_doSinInvert_q <= "0";
                WHEN "1000" =>  u0_doSinInvert_q <= "0";
                WHEN "1001" =>  u0_doSinInvert_q <= "0";
                WHEN "1010" =>  u0_doSinInvert_q <= "0";
                WHEN "1011" =>  u0_doSinInvert_q <= "0";
                WHEN "1100" =>  u0_doSinInvert_q <= "1";
                WHEN "1101" =>  u0_doSinInvert_q <= "1";
                WHEN "1110" =>  u0_doSinInvert_q <= "1";
                WHEN "1111" =>  u0_doSinInvert_q <= "1";
                WHEN OTHERS =>
                    u0_doSinInvert_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;


	--u0_sinSwapMux(MUX,73)@20
    u0_sinSwapMux_s <= u0_doSwap_q;
    u0_sinSwapMux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_sinSwapMux_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE u0_sinSwapMux_s IS
                      WHEN "0" => u0_sinSwapMux_q <= u0_roundedSin_q;
                      WHEN "1" => u0_sinSwapMux_q <= u0_roundedCos_q;
                      WHEN OTHERS => u0_sinSwapMux_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--u0_sinInvert(SUB,75)@21
    u0_sinInvert_a <= STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q);
    u0_sinInvert_b <= u0_sinSwapMux_q;
    u0_sinInvert_i <= u0_sinInvert_b;
    u0_sinInvert_a1 <= u0_sinInvert_i WHEN (u0_doSinInvert_q = "1") ELSE u0_sinInvert_a;
    u0_sinInvert_b1 <= (others => '0') WHEN (u0_doSinInvert_q = "1") ELSE u0_sinInvert_b;
    u0_sinInvert: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_sinInvert_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_sinInvert_o <= STD_LOGIC_VECTOR(SIGNED(u0_sinInvert_a1) - SIGNED(u0_sinInvert_b1));
        END IF;
    END PROCESS;
    u0_sinInvert_q <= u0_sinInvert_o(11 downto 0);


	--d_xIn_c_22_nor(LOGICAL,801)
    d_xIn_c_22_nor_a <= d_xIn_c_22_notEnable_q;
    d_xIn_c_22_nor_b <= d_xIn_c_22_sticky_ena_q;
    d_xIn_c_22_nor_q <= not (d_xIn_c_22_nor_a or d_xIn_c_22_nor_b);

	--d_xIn_c_22_mem_top(CONSTANT,797)
    d_xIn_c_22_mem_top_q <= "01010";

	--d_xIn_c_22_cmp(LOGICAL,798)
    d_xIn_c_22_cmp_a <= d_xIn_c_22_mem_top_q;
    d_xIn_c_22_cmp_b <= STD_LOGIC_VECTOR("0" & d_xIn_c_22_replace_rdmux_q);
    d_xIn_c_22_cmp_q <= "1" when d_xIn_c_22_cmp_a = d_xIn_c_22_cmp_b else "0";

	--d_xIn_c_22_cmpReg(REG,799)
    d_xIn_c_22_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_c_22_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_xIn_c_22_cmpReg_q <= d_xIn_c_22_cmp_q;
        END IF;
    END PROCESS;


	--d_xIn_c_22_sticky_ena(REG,802)
    d_xIn_c_22_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_c_22_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_xIn_c_22_nor_q = "1") THEN
                d_xIn_c_22_sticky_ena_q <= d_xIn_c_22_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--d_xIn_c_22_enaAnd(LOGICAL,803)
    d_xIn_c_22_enaAnd_a <= d_xIn_c_22_sticky_ena_q;
    d_xIn_c_22_enaAnd_b <= VCC_q;
    d_xIn_c_22_enaAnd_q <= d_xIn_c_22_enaAnd_a and d_xIn_c_22_enaAnd_b;

	--d_xIn_c_22_replace_rdcnt(COUNTER,793)
    -- every=1, low=0, high=10, step=1, init=1
    d_xIn_c_22_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_c_22_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            d_xIn_c_22_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF d_xIn_c_22_replace_rdcnt_i = 9 THEN
                  d_xIn_c_22_replace_rdcnt_eq <= '1';
                ELSE
                  d_xIn_c_22_replace_rdcnt_eq <= '0';
                END IF;
                IF (d_xIn_c_22_replace_rdcnt_eq = '1') THEN
                    d_xIn_c_22_replace_rdcnt_i <= d_xIn_c_22_replace_rdcnt_i - 10;
                ELSE
                    d_xIn_c_22_replace_rdcnt_i <= d_xIn_c_22_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    d_xIn_c_22_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(d_xIn_c_22_replace_rdcnt_i,4));


	--d_xIn_c_22_replace_rdreg(REG,794)
    d_xIn_c_22_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_c_22_replace_rdreg_q <= "0000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_xIn_c_22_replace_rdreg_q <= d_xIn_c_22_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--d_xIn_c_22_replace_rdmux(MUX,795)
    d_xIn_c_22_replace_rdmux_s <= VCC_q;
    d_xIn_c_22_replace_rdmux: PROCESS (d_xIn_c_22_replace_rdmux_s, d_xIn_c_22_replace_rdreg_q, d_xIn_c_22_replace_rdcnt_q)
    BEGIN
            CASE d_xIn_c_22_replace_rdmux_s IS
                  WHEN "0" => d_xIn_c_22_replace_rdmux_q <= d_xIn_c_22_replace_rdreg_q;
                  WHEN "1" => d_xIn_c_22_replace_rdmux_q <= d_xIn_c_22_replace_rdcnt_q;
                  WHEN OTHERS => d_xIn_c_22_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--d_xIn_c_22_replace_mem(DUALMEM,792)
    d_xIn_c_22_replace_mem_reset0 <= areset;
    d_xIn_c_22_replace_mem_ia <= xIn_c;
    d_xIn_c_22_replace_mem_aa <= d_xIn_c_22_replace_rdreg_q;
    d_xIn_c_22_replace_mem_ab <= d_xIn_c_22_replace_rdmux_q;
    d_xIn_c_22_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 4,
        numwords_a => 11,
        width_b => 8,
        widthad_b => 4,
        numwords_b => 11,
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
        clocken1 => d_xIn_c_22_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_xIn_c_22_replace_mem_reset0,
        clock1 => clk,
        address_b => d_xIn_c_22_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_xIn_c_22_replace_mem_iq,
        address_a => d_xIn_c_22_replace_mem_aa,
        data_a => d_xIn_c_22_replace_mem_ia
    );
        d_xIn_c_22_replace_mem_q <= d_xIn_c_22_replace_mem_iq(7 downto 0);

	--d_xIn_v_22(DELAY,693)@10
    d_xIn_v_22 : dspba_delay
    GENERIC MAP ( width => 1, depth => 12 )
    PORT MAP ( xin => xIn_v, xout => d_xIn_v_22_q, clk => clk, aclr => areset );

	--ncoOut(PORTOUT,692)@22
    ncoOut_v <= d_xIn_v_22_q;
    ncoOut_c <= d_xIn_c_22_replace_mem_q;
    sinOut_0 <= u0_sinInvert_q;
    sinOut_1 <= u1_sinInvert_q;
    sinOut_2 <= u2_sinInvert_q;
    sinOut_3 <= u3_sinInvert_q;
    sinOut_4 <= u4_sinInvert_q;
    sinOut_5 <= u5_sinInvert_q;
    sinOut_6 <= u6_sinInvert_q;
    sinOut_7 <= u7_sinInvert_q;
    sinOut_8 <= u8_sinInvert_q;
    sinOut_9 <= u9_sinInvert_q;
    sinOut_10 <= u10_sinInvert_q;
    sinOut_11 <= u11_sinInvert_q;
    sinOut_12 <= u12_sinInvert_q;
    sinOut_13 <= u13_sinInvert_q;
    sinOut_14 <= u14_sinInvert_q;
    sinOut_15 <= u15_sinInvert_q;
    cosOut_0 <= u0_cosInvert_q;
    cosOut_1 <= u1_cosInvert_q;
    cosOut_2 <= u2_cosInvert_q;
    cosOut_3 <= u3_cosInvert_q;
    cosOut_4 <= u4_cosInvert_q;
    cosOut_5 <= u5_cosInvert_q;
    cosOut_6 <= u6_cosInvert_q;
    cosOut_7 <= u7_cosInvert_q;
    cosOut_8 <= u8_cosInvert_q;
    cosOut_9 <= u9_cosInvert_q;
    cosOut_10 <= u10_cosInvert_q;
    cosOut_11 <= u11_cosInvert_q;
    cosOut_12 <= u12_cosInvert_q;
    cosOut_13 <= u13_cosInvert_q;
    cosOut_14 <= u14_cosInvert_q;
    cosOut_15 <= u15_cosInvert_q;


end normal;
