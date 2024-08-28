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

-- VHDL created from DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_NCO_FDD3
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
entity DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_NCO_FDD3 is
    port (
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        xIn_p_0 : in std_logic_vector(17 downto 0);
        xIn_s_0 : in std_logic_vector(0 downto 0);
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
        ncoOut_v : out std_logic_vector(0 downto 0);
        ncoOut_c : out std_logic_vector(7 downto 0);
        sinOut_0 : out std_logic_vector(15 downto 0);
        cosOut_0 : out std_logic_vector(15 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
end;

architecture normal of DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_NCO_FDD3 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal d_xIn_s_0_12_q : std_logic_vector (0 downto 0);
    signal d_xIn_p_0_12_q : std_logic_vector (17 downto 0);
    signal d_xIn_v_12_q : std_logic_vector (0 downto 0);
    signal d_xIn_v_24_q : std_logic_vector (0 downto 0);
    signal d_busIn_d_11_q : std_logic_vector (31 downto 0);
    signal u0_phaseIncrMemLookup_q : std_logic_vector(1 downto 0);
    signal u0_phaseIncrMemLookup_e : std_logic_vector(0 downto 0);
    signal u0_phaseIncrMem_reset0 : std_logic;
    signal u0_phaseIncrMem_reset1 : std_logic;
    signal u0_phaseIncrMem_iq : std_logic_vector (19 downto 0);
    signal u0_phaseIncrMem_ia : std_logic_vector (19 downto 0);
    signal u0_phaseIncrMem_ir : std_logic_vector (19 downto 0);
    signal u0_phaseIncrMem_aa : std_logic_vector (1 downto 0);
    signal u0_phaseIncrMem_ab : std_logic_vector (1 downto 0);
    signal u0_phaseIncrMem_q : std_logic_vector (19 downto 0);
    signal u0_accumAdd_b4_a : std_logic_vector(17 downto 0);
    signal u0_accumAdd_b4_b : std_logic_vector(17 downto 0);
    signal u0_accumAdd_b4_i : std_logic_vector (17 downto 0);
    signal u0_accumAdd_b4_a1 : std_logic_vector(17 downto 0);
    signal u0_accumAdd_b4_b1 : std_logic_vector(17 downto 0);
    signal u0_accumAdd_b4_o : std_logic_vector (17 downto 0);
    signal u0_accumAdd_b4_q : std_logic_vector (17 downto 0);
    signal d_u0_accumAdd_b4_q_14_q : std_logic_vector (17 downto 0);
    signal d_u0_octantBitSelect_b_22_q : std_logic_vector (2 downto 0);
    signal u0_rangeLUT_q : std_logic_vector(18 downto 0);
    signal u0_addnsubConst_q : std_logic_vector(0 downto 0);
    signal u0_rangeAddSub_a : std_logic_vector(20 downto 0);
    signal u0_rangeAddSub_b : std_logic_vector(20 downto 0);
    signal u0_rangeAddSub_o : std_logic_vector (20 downto 0);
    signal u0_rangeAddSub_cin : std_logic_vector (0 downto 0);
    signal u0_rangeAddSub_q : std_logic_vector (18 downto 0);
    signal u0_sinTable_reset0 : std_logic;
    signal u0_sinTable_iq : std_logic_vector (15 downto 0);
    signal u0_sinTable_ia : std_logic_vector (15 downto 0);
    signal u0_sinTable_ir : std_logic_vector (15 downto 0);
    signal u0_sinTable_aa : std_logic_vector (7 downto 0);
    signal u0_sinTable_ab : std_logic_vector (7 downto 0);
    signal u0_sinTable_q : std_logic_vector (15 downto 0);
    signal u0_cosTable_reset0 : std_logic;
    signal u0_cosTable_iq : std_logic_vector (15 downto 0);
    signal u0_cosTable_ia : std_logic_vector (15 downto 0);
    signal u0_cosTable_ir : std_logic_vector (15 downto 0);
    signal u0_cosTable_aa : std_logic_vector (7 downto 0);
    signal u0_cosTable_ab : std_logic_vector (7 downto 0);
    signal u0_cosTable_q : std_logic_vector (15 downto 0);
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
    signal u0_sinMult_a : std_logic_vector (15 downto 0);
    signal u0_sinMult_b : std_logic_vector (15 downto 0);
    signal u0_sinMult_s1 : std_logic_vector (31 downto 0);
    signal u0_sinMult_pr : UNSIGNED (31 downto 0);
    signal u0_sinMult_q : std_logic_vector (31 downto 0);
    signal u0_cosMult_a : std_logic_vector (15 downto 0);
    signal u0_cosMult_b : std_logic_vector (15 downto 0);
    signal u0_cosMult_s1 : std_logic_vector (31 downto 0);
    signal u0_cosMult_pr : UNSIGNED (31 downto 0);
    signal u0_cosMult_q : std_logic_vector (31 downto 0);
    signal u0_sin_pi_over_4_q : std_logic_vector (17 downto 0);
    signal u0_sinAdd_a : std_logic_vector(17 downto 0);
    signal u0_sinAdd_b : std_logic_vector(17 downto 0);
    signal u0_sinAdd_i : std_logic_vector (17 downto 0);
    signal u0_sinAdd_a1 : std_logic_vector(17 downto 0);
    signal u0_sinAdd_b1 : std_logic_vector(17 downto 0);
    signal u0_sinAdd_o : std_logic_vector (17 downto 0);
    signal u0_sinAdd_q : std_logic_vector (17 downto 0);
    signal u0_cosSub_a : std_logic_vector(17 downto 0);
    signal u0_cosSub_b : std_logic_vector(17 downto 0);
    signal u0_cosSub_i : std_logic_vector (17 downto 0);
    signal u0_cosSub_a1 : std_logic_vector(17 downto 0);
    signal u0_cosSub_b1 : std_logic_vector(17 downto 0);
    signal u0_cosSub_o : std_logic_vector (17 downto 0);
    signal u0_cosSub_q : std_logic_vector (17 downto 0);
    signal u0_roundedSin_in : std_logic_vector (17 downto 0);
    signal u0_roundedSin_q : std_logic_vector (15 downto 0);
    signal u0_roundedCos_in : std_logic_vector (17 downto 0);
    signal u0_roundedCos_q : std_logic_vector (15 downto 0);
    signal u0_doSwap_q : std_logic_vector(0 downto 0);
    signal u0_doSinInvert_q : std_logic_vector(0 downto 0);
    signal u0_doCosInvert_q : std_logic_vector(0 downto 0);
    signal u0_sinSwapMux_s : std_logic_vector (0 downto 0);
    signal u0_sinSwapMux_q : std_logic_vector (15 downto 0);
    signal u0_cosSwapMux_s : std_logic_vector (0 downto 0);
    signal u0_cosSwapMux_q : std_logic_vector (15 downto 0);
    signal u0_sinInvert_a : std_logic_vector(15 downto 0);
    signal u0_sinInvert_b : std_logic_vector(15 downto 0);
    signal u0_sinInvert_i : std_logic_vector (15 downto 0);
    signal u0_sinInvert_a1 : std_logic_vector(15 downto 0);
    signal u0_sinInvert_b1 : std_logic_vector(15 downto 0);
    signal u0_sinInvert_o : std_logic_vector (15 downto 0);
    signal u0_sinInvert_q : std_logic_vector (15 downto 0);
    signal u0_cosInvert_a : std_logic_vector(15 downto 0);
    signal u0_cosInvert_b : std_logic_vector(15 downto 0);
    signal u0_cosInvert_i : std_logic_vector (15 downto 0);
    signal u0_cosInvert_a1 : std_logic_vector(15 downto 0);
    signal u0_cosInvert_b1 : std_logic_vector(15 downto 0);
    signal u0_cosInvert_o : std_logic_vector (15 downto 0);
    signal u0_cosInvert_q : std_logic_vector (15 downto 0);
    signal d_xIn_c_24_replace_mem_reset0 : std_logic;
    signal d_xIn_c_24_replace_mem_iq : std_logic_vector (7 downto 0);
    signal d_xIn_c_24_replace_mem_ia : std_logic_vector (7 downto 0);
    signal d_xIn_c_24_replace_mem_ir : std_logic_vector (7 downto 0);
    signal d_xIn_c_24_replace_mem_aa : std_logic_vector (3 downto 0);
    signal d_xIn_c_24_replace_mem_ab : std_logic_vector (3 downto 0);
    signal d_xIn_c_24_replace_mem_q : std_logic_vector (7 downto 0);
    signal d_xIn_c_24_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal d_xIn_c_24_replace_rdcnt_i : unsigned(3 downto 0);
    signal d_xIn_c_24_replace_rdcnt_eq : std_logic;
    signal d_xIn_c_24_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal d_xIn_c_24_mem_top_q : std_logic_vector (4 downto 0);
    signal d_xIn_c_24_cmpReg_q : std_logic_vector (0 downto 0);
    signal d_xIn_c_24_sticky_ena_q : std_logic_vector (0 downto 0);
    signal d_u0_phaseIncrMem_q_22_replace_mem_reset0 : std_logic;
    signal d_u0_phaseIncrMem_q_22_replace_mem_iq : std_logic_vector (19 downto 0);
    signal d_u0_phaseIncrMem_q_22_replace_mem_ia : std_logic_vector (19 downto 0);
    signal d_u0_phaseIncrMem_q_22_replace_mem_ir : std_logic_vector (19 downto 0);
    signal d_u0_phaseIncrMem_q_22_replace_mem_aa : std_logic_vector (3 downto 0);
    signal d_u0_phaseIncrMem_q_22_replace_mem_ab : std_logic_vector (3 downto 0);
    signal d_u0_phaseIncrMem_q_22_replace_mem_q : std_logic_vector (19 downto 0);
    signal d_u0_phaseIncrMem_q_22_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal d_u0_phaseIncrMem_q_22_replace_rdcnt_i : unsigned(3 downto 0);
    signal d_u0_phaseIncrMem_q_22_replace_rdcnt_eq : std_logic;
    signal d_u0_phaseIncrMem_q_22_replace_rdreg_q : std_logic_vector (3 downto 0);
    signal d_u0_phaseIncrMem_q_22_mem_top_q : std_logic_vector (4 downto 0);
    signal d_u0_phaseIncrMem_q_22_cmpReg_q : std_logic_vector (0 downto 0);
    signal d_u0_phaseIncrMem_q_22_sticky_ena_q : std_logic_vector (0 downto 0);
    signal u0_accumLast_b4_replace_mem_reset0 : std_logic;
    signal u0_accumLast_b4_replace_mem_iq : std_logic_vector (17 downto 0);
    signal u0_accumLast_b4_replace_mem_ia : std_logic_vector (17 downto 0);
    signal u0_accumLast_b4_replace_mem_ir : std_logic_vector (17 downto 0);
    signal u0_accumLast_b4_replace_mem_aa : std_logic_vector (0 downto 0);
    signal u0_accumLast_b4_replace_mem_ab : std_logic_vector (0 downto 0);
    signal u0_accumLast_b4_replace_mem_q : std_logic_vector (17 downto 0);
    signal u0_accumLast_b4_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal u0_accumLast_b4_replace_rdcnt_i : unsigned(0 downto 0);
    signal u0_accumLast_b4_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal u0_accumLast_b4_cmpReg_q : std_logic_vector (0 downto 0);
    signal u0_accumLast_b4_sticky_ena_q : std_logic_vector (0 downto 0);
    signal d_u0_octantBitSelect_b_21_replace_mem_reset0 : std_logic;
    signal d_u0_octantBitSelect_b_21_replace_mem_iq : std_logic_vector (2 downto 0);
    signal d_u0_octantBitSelect_b_21_replace_mem_ia : std_logic_vector (2 downto 0);
    signal d_u0_octantBitSelect_b_21_replace_mem_ir : std_logic_vector (2 downto 0);
    signal d_u0_octantBitSelect_b_21_replace_mem_aa : std_logic_vector (2 downto 0);
    signal d_u0_octantBitSelect_b_21_replace_mem_ab : std_logic_vector (2 downto 0);
    signal d_u0_octantBitSelect_b_21_replace_mem_q : std_logic_vector (2 downto 0);
    signal d_u0_octantBitSelect_b_21_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal d_u0_octantBitSelect_b_21_replace_rdcnt_i : unsigned(2 downto 0);
    signal d_u0_octantBitSelect_b_21_replace_rdcnt_eq : std_logic;
    signal d_u0_octantBitSelect_b_21_replace_rdreg_q : std_logic_vector (2 downto 0);
    signal d_u0_octantBitSelect_b_21_mem_top_q : std_logic_vector (3 downto 0);
    signal d_u0_octantBitSelect_b_21_cmpReg_q : std_logic_vector (0 downto 0);
    signal d_u0_octantBitSelect_b_21_sticky_ena_q : std_logic_vector (0 downto 0);
    signal d_u0_rangeAddSub_q_20_replace_mem_reset0 : std_logic;
    signal d_u0_rangeAddSub_q_20_replace_mem_iq : std_logic_vector (18 downto 0);
    signal d_u0_rangeAddSub_q_20_replace_mem_ia : std_logic_vector (18 downto 0);
    signal d_u0_rangeAddSub_q_20_replace_mem_ir : std_logic_vector (18 downto 0);
    signal d_u0_rangeAddSub_q_20_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u0_rangeAddSub_q_20_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u0_rangeAddSub_q_20_replace_mem_q : std_logic_vector (18 downto 0);
    signal d_u0_rangeAddSub_q_20_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal d_u0_rangeAddSub_q_20_replace_rdcnt_i : unsigned(1 downto 0);
    signal d_u0_rangeAddSub_q_20_replace_rdreg_q : std_logic_vector (1 downto 0);
    signal d_u0_rangeAddSub_q_20_mem_top_q : std_logic_vector (2 downto 0);
    signal d_u0_rangeAddSub_q_20_cmpReg_q : std_logic_vector (0 downto 0);
    signal d_u0_rangeAddSub_q_20_sticky_ena_q : std_logic_vector (0 downto 0);
    signal d_u0_sinTable_q_20_replace_mem_reset0 : std_logic;
    signal d_u0_sinTable_q_20_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u0_sinTable_q_20_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u0_sinTable_q_20_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u0_sinTable_q_20_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u0_sinTable_q_20_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u0_sinTable_q_20_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u0_sinTable_q_20_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal d_u0_sinTable_q_20_replace_rdcnt_i : unsigned(0 downto 0);
    signal d_u0_sinTable_q_20_replace_rdreg_q : std_logic_vector (0 downto 0);
    signal d_u0_sinTable_q_20_cmpReg_q : std_logic_vector (0 downto 0);
    signal d_u0_sinTable_q_20_sticky_ena_q : std_logic_vector (0 downto 0);
    signal d_u0_cosTable_q_20_replace_mem_reset0 : std_logic;
    signal d_u0_cosTable_q_20_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u0_cosTable_q_20_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u0_cosTable_q_20_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u0_cosTable_q_20_replace_mem_aa : std_logic_vector (0 downto 0);
    signal d_u0_cosTable_q_20_replace_mem_ab : std_logic_vector (0 downto 0);
    signal d_u0_cosTable_q_20_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_xIn_c_24_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal d_xIn_c_24_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal d_xIn_c_24_notEnable_a : std_logic_vector(0 downto 0);
    signal d_xIn_c_24_notEnable_q : std_logic_vector(0 downto 0);
    signal d_xIn_c_24_enaAnd_a : std_logic_vector(0 downto 0);
    signal d_xIn_c_24_enaAnd_b : std_logic_vector(0 downto 0);
    signal d_xIn_c_24_enaAnd_q : std_logic_vector(0 downto 0);
    signal d_u0_phaseIncrMem_q_22_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal d_u0_phaseIncrMem_q_22_replace_rdmux_q : std_logic_vector (3 downto 0);
    signal d_u0_phaseIncrMem_q_22_enaAnd_a : std_logic_vector(0 downto 0);
    signal d_u0_phaseIncrMem_q_22_enaAnd_b : std_logic_vector(0 downto 0);
    signal d_u0_phaseIncrMem_q_22_enaAnd_q : std_logic_vector(0 downto 0);
    signal u0_accumLast_b4_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal u0_accumLast_b4_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal d_u0_octantBitSelect_b_21_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal d_u0_octantBitSelect_b_21_replace_rdmux_q : std_logic_vector (2 downto 0);
    signal d_u0_octantBitSelect_b_21_enaAnd_a : std_logic_vector(0 downto 0);
    signal d_u0_octantBitSelect_b_21_enaAnd_b : std_logic_vector(0 downto 0);
    signal d_u0_octantBitSelect_b_21_enaAnd_q : std_logic_vector(0 downto 0);
    signal d_u0_rangeAddSub_q_20_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal d_u0_rangeAddSub_q_20_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal d_u0_rangeAddSub_q_20_enaAnd_a : std_logic_vector(0 downto 0);
    signal d_u0_rangeAddSub_q_20_enaAnd_b : std_logic_vector(0 downto 0);
    signal d_u0_rangeAddSub_q_20_enaAnd_q : std_logic_vector(0 downto 0);
    signal d_u0_sinTable_q_20_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal d_u0_sinTable_q_20_replace_rdmux_q : std_logic_vector (0 downto 0);
    signal d_u0_sinTable_q_20_enaAnd_a : std_logic_vector(0 downto 0);
    signal d_u0_sinTable_q_20_enaAnd_b : std_logic_vector(0 downto 0);
    signal d_u0_sinTable_q_20_enaAnd_q : std_logic_vector(0 downto 0);
    signal u0_accumLast_b4_notEnable_a : std_logic_vector(0 downto 0);
    signal u0_accumLast_b4_notEnable_q : std_logic_vector(0 downto 0);
    signal u0_accumLast_b4_enaAnd_a : std_logic_vector(0 downto 0);
    signal u0_accumLast_b4_enaAnd_b : std_logic_vector(0 downto 0);
    signal u0_accumLast_b4_enaAnd_q : std_logic_vector(0 downto 0);
    signal u0_octantBitSelect_in : std_logic_vector (17 downto 0);
    signal u0_octantBitSelect_b : std_logic_vector (2 downto 0);
    signal u0_alphaBitSelect_in : std_logic_vector (14 downto 0);
    signal u0_alphaBitSelect_b : std_logic_vector (7 downto 0);
    signal u0_betaBitSelect_in : std_logic_vector (6 downto 0);
    signal u0_betaBitSelect_b : std_logic_vector (6 downto 0);
    signal u0_beta_times_4_shift_q_int : std_logic_vector (23 downto 0);
    signal u0_beta_times_4_shift_q : std_logic_vector (23 downto 0);
    signal d_xIn_c_24_cmp_a : std_logic_vector(4 downto 0);
    signal d_xIn_c_24_cmp_b : std_logic_vector(4 downto 0);
    signal d_xIn_c_24_cmp_q : std_logic_vector(0 downto 0);
    signal d_xIn_c_24_nor_a : std_logic_vector(0 downto 0);
    signal d_xIn_c_24_nor_b : std_logic_vector(0 downto 0);
    signal d_xIn_c_24_nor_q : std_logic_vector(0 downto 0);
    signal u0_invertSin_in : std_logic_vector (19 downto 0);
    signal u0_invertSin_b : std_logic_vector (0 downto 0);
    signal u0_invertCos_in : std_logic_vector (18 downto 0);
    signal u0_invertCos_b : std_logic_vector (0 downto 0);
    signal d_u0_phaseIncrMem_q_22_cmp_a : std_logic_vector(4 downto 0);
    signal d_u0_phaseIncrMem_q_22_cmp_b : std_logic_vector(4 downto 0);
    signal d_u0_phaseIncrMem_q_22_cmp_q : std_logic_vector(0 downto 0);
    signal d_u0_phaseIncrMem_q_22_nor_a : std_logic_vector(0 downto 0);
    signal d_u0_phaseIncrMem_q_22_nor_b : std_logic_vector(0 downto 0);
    signal d_u0_phaseIncrMem_q_22_nor_q : std_logic_vector(0 downto 0);
    signal u0_accumLast_b4_nor_a : std_logic_vector(0 downto 0);
    signal u0_accumLast_b4_nor_b : std_logic_vector(0 downto 0);
    signal u0_accumLast_b4_nor_q : std_logic_vector(0 downto 0);
    signal d_u0_octantBitSelect_b_21_cmp_a : std_logic_vector(3 downto 0);
    signal d_u0_octantBitSelect_b_21_cmp_b : std_logic_vector(3 downto 0);
    signal d_u0_octantBitSelect_b_21_cmp_q : std_logic_vector(0 downto 0);
    signal d_u0_octantBitSelect_b_21_nor_a : std_logic_vector(0 downto 0);
    signal d_u0_octantBitSelect_b_21_nor_b : std_logic_vector(0 downto 0);
    signal d_u0_octantBitSelect_b_21_nor_q : std_logic_vector(0 downto 0);
    signal u0_alphaOverflowBitSelect_in : std_logic_vector (15 downto 0);
    signal u0_alphaOverflowBitSelect_b : std_logic_vector (0 downto 0);
    signal d_u0_rangeAddSub_q_20_cmp_a : std_logic_vector(2 downto 0);
    signal d_u0_rangeAddSub_q_20_cmp_b : std_logic_vector(2 downto 0);
    signal d_u0_rangeAddSub_q_20_cmp_q : std_logic_vector(0 downto 0);
    signal d_u0_rangeAddSub_q_20_nor_a : std_logic_vector(0 downto 0);
    signal d_u0_rangeAddSub_q_20_nor_b : std_logic_vector(0 downto 0);
    signal d_u0_rangeAddSub_q_20_nor_q : std_logic_vector(0 downto 0);
    signal u0_lsSinTable_q_int : std_logic_vector (39 downto 0);
    signal u0_lsSinTable_q : std_logic_vector (39 downto 0);
    signal d_u0_sinTable_q_20_nor_a : std_logic_vector(0 downto 0);
    signal d_u0_sinTable_q_20_nor_b : std_logic_vector(0 downto 0);
    signal d_u0_sinTable_q_20_nor_q : std_logic_vector(0 downto 0);
    signal u0_lsCosTable_q_int : std_logic_vector (39 downto 0);
    signal u0_lsCosTable_q : std_logic_vector (39 downto 0);
    signal u0_ls12_q_int : std_logic_vector (18 downto 0);
    signal u0_ls12_q : std_logic_vector (18 downto 0);
    signal u0_ls10_q_int : std_logic_vector (16 downto 0);
    signal u0_ls10_q : std_logic_vector (16 downto 0);
    signal u0_ls7_q_int : std_logic_vector (13 downto 0);
    signal u0_ls7_q : std_logic_vector (13 downto 0);
    signal u0_ls4_q_int : std_logic_vector (10 downto 0);
    signal u0_ls4_q : std_logic_vector (10 downto 0);
    signal u0_beta_times_pi_over_4_shifted_in : std_logic_vector (21 downto 0);
    signal u0_beta_times_pi_over_4_shifted_b : std_logic_vector (15 downto 0);
    signal u0_sinJoin_q : std_logic_vector (3 downto 0);
    signal u0_cosJoin_q : std_logic_vector (3 downto 0);
begin


	--d_xIn_c_24_notEnable(LOGICAL,70)
    d_xIn_c_24_notEnable_a <= VCC_q;
    d_xIn_c_24_notEnable_q <= not d_xIn_c_24_notEnable_a;

	--d_u0_phaseIncrMem_q_22_nor(LOGICAL,83)
    d_u0_phaseIncrMem_q_22_nor_a <= d_xIn_c_24_notEnable_q;
    d_u0_phaseIncrMem_q_22_nor_b <= d_u0_phaseIncrMem_q_22_sticky_ena_q;
    d_u0_phaseIncrMem_q_22_nor_q <= not (d_u0_phaseIncrMem_q_22_nor_a or d_u0_phaseIncrMem_q_22_nor_b);

	--d_u0_phaseIncrMem_q_22_mem_top(CONSTANT,79)
    d_u0_phaseIncrMem_q_22_mem_top_q <= "01000";

	--d_u0_phaseIncrMem_q_22_cmp(LOGICAL,80)
    d_u0_phaseIncrMem_q_22_cmp_a <= d_u0_phaseIncrMem_q_22_mem_top_q;
    d_u0_phaseIncrMem_q_22_cmp_b <= STD_LOGIC_VECTOR("0" & d_u0_phaseIncrMem_q_22_replace_rdmux_q);
    d_u0_phaseIncrMem_q_22_cmp_q <= "1" when d_u0_phaseIncrMem_q_22_cmp_a = d_u0_phaseIncrMem_q_22_cmp_b else "0";

	--d_u0_phaseIncrMem_q_22_cmpReg(REG,81)
    d_u0_phaseIncrMem_q_22_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_phaseIncrMem_q_22_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_phaseIncrMem_q_22_cmpReg_q <= d_u0_phaseIncrMem_q_22_cmp_q;
        END IF;
    END PROCESS;


	--d_u0_phaseIncrMem_q_22_sticky_ena(REG,84)
    d_u0_phaseIncrMem_q_22_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_phaseIncrMem_q_22_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_u0_phaseIncrMem_q_22_nor_q = "1") THEN
                d_u0_phaseIncrMem_q_22_sticky_ena_q <= d_u0_phaseIncrMem_q_22_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--d_u0_phaseIncrMem_q_22_enaAnd(LOGICAL,85)
    d_u0_phaseIncrMem_q_22_enaAnd_a <= d_u0_phaseIncrMem_q_22_sticky_ena_q;
    d_u0_phaseIncrMem_q_22_enaAnd_b <= VCC_q;
    d_u0_phaseIncrMem_q_22_enaAnd_q <= d_u0_phaseIncrMem_q_22_enaAnd_a and d_u0_phaseIncrMem_q_22_enaAnd_b;

	--busIn(BUSIN,3)@10

	--d_busIn_d_11(DELAY,54)@10
    d_busIn_d_11 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => busIn_d, xout => d_busIn_d_11_q, clk => bus_clk, aclr => bus_areset );

	--u0_phaseIncrMemLookup(LOOKUP,4)@10
    u0_phaseIncrMemLookup: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            u0_phaseIncrMemLookup_q <= "00";
            u0_phaseIncrMemLookup_e <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            CASE (busIn_a) IS
                WHEN "000110100100" =>  u0_phaseIncrMemLookup_q <= "00";
                    u0_phaseIncrMemLookup_e <= busIn_w;
                WHEN "000110100101" =>  u0_phaseIncrMemLookup_q <= "01";
                    u0_phaseIncrMemLookup_e <= busIn_w;
                WHEN "000110100110" =>  u0_phaseIncrMemLookup_q <= "10";
                    u0_phaseIncrMemLookup_e <= busIn_w;
                WHEN "000110100111" =>  u0_phaseIncrMemLookup_q <= "11";
                    u0_phaseIncrMemLookup_e <= busIn_w;
                WHEN OTHERS =>
                    u0_phaseIncrMemLookup_q <= (others => '-');
                    u0_phaseIncrMemLookup_e <= "0";
            END CASE;
        END IF;
    END PROCESS;


	--xIn(PORTIN,2)@10

	--u0_phaseIncrMem(DUALMEM,6)@10
    u0_phaseIncrMem_reset0 <= bus_areset;
    u0_phaseIncrMem_reset1 <= areset;
    u0_phaseIncrMem_ia <= d_busIn_d_11_q(19 downto 0);
    u0_phaseIncrMem_aa <= u0_phaseIncrMemLookup_q;
    u0_phaseIncrMem_ab <= xIn_c(1 downto 0);
    u0_phaseIncrMem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 20,
        widthad_a => 2,
        numwords_a => 4,
        width_b => 20,
        widthad_b => 2,
        numwords_b => 4,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK1",
        wrcontrol_wraddress_reg_b => "CLOCK1",
        rdcontrol_reg_b => "CLOCK1",
        byteena_reg_b => "CLOCK1",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        address_reg_b => "CLOCK1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/NCO_FDD3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_NCO_FDD3_u0_phaseIncrMem.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix V"
    )
    PORT MAP (
        clocken1 => '1',
        clocken0 => '1',
        wren_a => u0_phaseIncrMemLookup_e(0),
        clock0 => bus_clk,
        aclr1 => u0_phaseIncrMem_reset1,
        clock1 => clk,
        address_b => u0_phaseIncrMem_ab,
        -- data_b => (others => '0'),
        q_b => u0_phaseIncrMem_iq,
        address_a => u0_phaseIncrMem_aa,
        data_a => u0_phaseIncrMem_ia
    );
        u0_phaseIncrMem_q <= u0_phaseIncrMem_iq(19 downto 0);

	--d_u0_phaseIncrMem_q_22_replace_rdcnt(COUNTER,75)
    -- every=1, low=0, high=8, step=1, init=1
    d_u0_phaseIncrMem_q_22_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_phaseIncrMem_q_22_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            d_u0_phaseIncrMem_q_22_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF d_u0_phaseIncrMem_q_22_replace_rdcnt_i = 7 THEN
                  d_u0_phaseIncrMem_q_22_replace_rdcnt_eq <= '1';
                ELSE
                  d_u0_phaseIncrMem_q_22_replace_rdcnt_eq <= '0';
                END IF;
                IF (d_u0_phaseIncrMem_q_22_replace_rdcnt_eq = '1') THEN
                    d_u0_phaseIncrMem_q_22_replace_rdcnt_i <= d_u0_phaseIncrMem_q_22_replace_rdcnt_i - 8;
                ELSE
                    d_u0_phaseIncrMem_q_22_replace_rdcnt_i <= d_u0_phaseIncrMem_q_22_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    d_u0_phaseIncrMem_q_22_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(d_u0_phaseIncrMem_q_22_replace_rdcnt_i,4));


	--d_u0_phaseIncrMem_q_22_replace_rdreg(REG,76)
    d_u0_phaseIncrMem_q_22_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_phaseIncrMem_q_22_replace_rdreg_q <= "0000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_phaseIncrMem_q_22_replace_rdreg_q <= d_u0_phaseIncrMem_q_22_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--d_u0_phaseIncrMem_q_22_replace_rdmux(MUX,77)
    d_u0_phaseIncrMem_q_22_replace_rdmux_s <= VCC_q;
    d_u0_phaseIncrMem_q_22_replace_rdmux: PROCESS (d_u0_phaseIncrMem_q_22_replace_rdmux_s, d_u0_phaseIncrMem_q_22_replace_rdreg_q, d_u0_phaseIncrMem_q_22_replace_rdcnt_q)
    BEGIN
            CASE d_u0_phaseIncrMem_q_22_replace_rdmux_s IS
                  WHEN "0" => d_u0_phaseIncrMem_q_22_replace_rdmux_q <= d_u0_phaseIncrMem_q_22_replace_rdreg_q;
                  WHEN "1" => d_u0_phaseIncrMem_q_22_replace_rdmux_q <= d_u0_phaseIncrMem_q_22_replace_rdcnt_q;
                  WHEN OTHERS => d_u0_phaseIncrMem_q_22_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--d_u0_phaseIncrMem_q_22_replace_mem(DUALMEM,74)
    d_u0_phaseIncrMem_q_22_replace_mem_reset0 <= areset;
    d_u0_phaseIncrMem_q_22_replace_mem_ia <= u0_phaseIncrMem_q;
    d_u0_phaseIncrMem_q_22_replace_mem_aa <= d_u0_phaseIncrMem_q_22_replace_rdreg_q;
    d_u0_phaseIncrMem_q_22_replace_mem_ab <= d_u0_phaseIncrMem_q_22_replace_rdmux_q;
    d_u0_phaseIncrMem_q_22_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 20,
        widthad_a => 4,
        numwords_a => 9,
        width_b => 20,
        widthad_b => 4,
        numwords_b => 9,
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
        clocken1 => d_u0_phaseIncrMem_q_22_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u0_phaseIncrMem_q_22_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u0_phaseIncrMem_q_22_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u0_phaseIncrMem_q_22_replace_mem_iq,
        address_a => d_u0_phaseIncrMem_q_22_replace_mem_aa,
        data_a => d_u0_phaseIncrMem_q_22_replace_mem_ia
    );
        d_u0_phaseIncrMem_q_22_replace_mem_q <= d_u0_phaseIncrMem_q_22_replace_mem_iq(19 downto 0);

	--u0_invertCos(BITSELECT,41)@22
    u0_invertCos_in <= d_u0_phaseIncrMem_q_22_replace_mem_q(18 downto 0);
    u0_invertCos_b <= u0_invertCos_in(18 downto 18);

	--d_u0_octantBitSelect_b_21_nor(LOGICAL,105)
    d_u0_octantBitSelect_b_21_nor_a <= d_xIn_c_24_notEnable_q;
    d_u0_octantBitSelect_b_21_nor_b <= d_u0_octantBitSelect_b_21_sticky_ena_q;
    d_u0_octantBitSelect_b_21_nor_q <= not (d_u0_octantBitSelect_b_21_nor_a or d_u0_octantBitSelect_b_21_nor_b);

	--d_u0_octantBitSelect_b_21_mem_top(CONSTANT,101)
    d_u0_octantBitSelect_b_21_mem_top_q <= "0110";

	--d_u0_octantBitSelect_b_21_cmp(LOGICAL,102)
    d_u0_octantBitSelect_b_21_cmp_a <= d_u0_octantBitSelect_b_21_mem_top_q;
    d_u0_octantBitSelect_b_21_cmp_b <= STD_LOGIC_VECTOR("0" & d_u0_octantBitSelect_b_21_replace_rdmux_q);
    d_u0_octantBitSelect_b_21_cmp_q <= "1" when d_u0_octantBitSelect_b_21_cmp_a = d_u0_octantBitSelect_b_21_cmp_b else "0";

	--d_u0_octantBitSelect_b_21_cmpReg(REG,103)
    d_u0_octantBitSelect_b_21_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_octantBitSelect_b_21_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_octantBitSelect_b_21_cmpReg_q <= d_u0_octantBitSelect_b_21_cmp_q;
        END IF;
    END PROCESS;


	--d_u0_octantBitSelect_b_21_sticky_ena(REG,106)
    d_u0_octantBitSelect_b_21_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_octantBitSelect_b_21_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_u0_octantBitSelect_b_21_nor_q = "1") THEN
                d_u0_octantBitSelect_b_21_sticky_ena_q <= d_u0_octantBitSelect_b_21_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--d_u0_octantBitSelect_b_21_enaAnd(LOGICAL,107)
    d_u0_octantBitSelect_b_21_enaAnd_a <= d_u0_octantBitSelect_b_21_sticky_ena_q;
    d_u0_octantBitSelect_b_21_enaAnd_b <= VCC_q;
    d_u0_octantBitSelect_b_21_enaAnd_q <= d_u0_octantBitSelect_b_21_enaAnd_a and d_u0_octantBitSelect_b_21_enaAnd_b;

	--d_xIn_p_0_12(DELAY,52)@10
    d_xIn_p_0_12 : dspba_delay
    GENERIC MAP ( width => 18, depth => 2 )
    PORT MAP ( xin => xIn_p_0, xout => d_xIn_p_0_12_q, clk => clk, aclr => areset );

	--d_xIn_s_0_12(DELAY,53)@10
    d_xIn_s_0_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => xIn_s_0, xout => d_xIn_s_0_12_q, clk => clk, aclr => areset );

	--d_xIn_v_12(DELAY,49)@10
    d_xIn_v_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => xIn_v, xout => d_xIn_v_12_q, clk => clk, aclr => areset );

	--u0_accumLast_b4_notEnable(LOGICAL,92)
    u0_accumLast_b4_notEnable_a <= d_xIn_v_12_q;
    u0_accumLast_b4_notEnable_q <= not u0_accumLast_b4_notEnable_a;

	--u0_accumLast_b4_nor(LOGICAL,93)
    u0_accumLast_b4_nor_a <= u0_accumLast_b4_notEnable_q;
    u0_accumLast_b4_nor_b <= u0_accumLast_b4_sticky_ena_q;
    u0_accumLast_b4_nor_q <= not (u0_accumLast_b4_nor_a or u0_accumLast_b4_nor_b);

	--u0_accumLast_b4_cmpReg(REG,91)
    u0_accumLast_b4_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_accumLast_b4_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_xIn_v_12_q = "1") THEN
                u0_accumLast_b4_cmpReg_q <= VCC_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_accumLast_b4_sticky_ena(REG,94)
    u0_accumLast_b4_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_accumLast_b4_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (u0_accumLast_b4_nor_q = "1") THEN
                u0_accumLast_b4_sticky_ena_q <= u0_accumLast_b4_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_accumLast_b4_enaAnd(LOGICAL,95)
    u0_accumLast_b4_enaAnd_a <= u0_accumLast_b4_sticky_ena_q;
    u0_accumLast_b4_enaAnd_b <= d_xIn_v_12_q;
    u0_accumLast_b4_enaAnd_q <= u0_accumLast_b4_enaAnd_a and u0_accumLast_b4_enaAnd_b;

	--u0_accumLast_b4_replace_rdcnt(COUNTER,87)
    -- every=1, low=0, high=1, step=1, init=1
    u0_accumLast_b4_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_accumLast_b4_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_xIn_v_12_q = "1") THEN
                    u0_accumLast_b4_replace_rdcnt_i <= u0_accumLast_b4_replace_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_accumLast_b4_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(u0_accumLast_b4_replace_rdcnt_i,1));


	--u0_accumLast_b4_replace_rdreg(REG,88)
    u0_accumLast_b4_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_accumLast_b4_replace_rdreg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_xIn_v_12_q = "1") THEN
                u0_accumLast_b4_replace_rdreg_q <= u0_accumLast_b4_replace_rdcnt_q;
            END IF;
        END IF;
    END PROCESS;


	--u0_accumLast_b4_replace_rdmux(MUX,89)
    u0_accumLast_b4_replace_rdmux_s <= d_xIn_v_12_q;
    u0_accumLast_b4_replace_rdmux: PROCESS (u0_accumLast_b4_replace_rdmux_s, u0_accumLast_b4_replace_rdreg_q, u0_accumLast_b4_replace_rdcnt_q)
    BEGIN
            CASE u0_accumLast_b4_replace_rdmux_s IS
                  WHEN "0" => u0_accumLast_b4_replace_rdmux_q <= u0_accumLast_b4_replace_rdreg_q;
                  WHEN "1" => u0_accumLast_b4_replace_rdmux_q <= u0_accumLast_b4_replace_rdcnt_q;
                  WHEN OTHERS => u0_accumLast_b4_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--u0_accumLast_b4_replace_mem(DUALMEM,86)
    u0_accumLast_b4_replace_mem_reset0 <= areset;
    u0_accumLast_b4_replace_mem_ia <= u0_accumAdd_b4_q;
    u0_accumLast_b4_replace_mem_aa <= u0_accumLast_b4_replace_rdreg_q;
    u0_accumLast_b4_replace_mem_ab <= u0_accumLast_b4_replace_rdmux_q;
    u0_accumLast_b4_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 18,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 18,
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
        clocken1 => u0_accumLast_b4_enaAnd_q(0),
        clocken0 => '1',
        wren_a => d_xIn_v_12_q(0),
        clock0 => clk,
        aclr1 => u0_accumLast_b4_replace_mem_reset0,
        clock1 => clk,
        address_b => u0_accumLast_b4_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => u0_accumLast_b4_replace_mem_iq,
        address_a => u0_accumLast_b4_replace_mem_aa,
        data_a => u0_accumLast_b4_replace_mem_ia
    );
        u0_accumLast_b4_replace_mem_q <= u0_accumLast_b4_replace_mem_iq(17 downto 0);

	--u0_accumAdd_b4(ADD,7)@12
    u0_accumAdd_b4_a <= u0_accumLast_b4_replace_mem_q;
    u0_accumAdd_b4_b <= u0_phaseIncrMem_q(17 downto 0);
    u0_accumAdd_b4_i <= d_xIn_p_0_12_q;
    u0_accumAdd_b4_a1 <= u0_accumAdd_b4_i WHEN (d_xIn_s_0_12_q = "1") ELSE u0_accumAdd_b4_a;
    u0_accumAdd_b4_b1 <= (others => '0') WHEN (d_xIn_s_0_12_q = "1") ELSE u0_accumAdd_b4_b;
    u0_accumAdd_b4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_accumAdd_b4_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_xIn_v_12_q = "1") THEN
                u0_accumAdd_b4_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_accumAdd_b4_a1) + UNSIGNED(u0_accumAdd_b4_b1));
            END IF;
        END IF;
    END PROCESS;
    u0_accumAdd_b4_q <= u0_accumAdd_b4_o(17 downto 0);


	--u0_octantBitSelect(BITSELECT,9)@13
    u0_octantBitSelect_in <= u0_accumAdd_b4_q;
    u0_octantBitSelect_b <= u0_octantBitSelect_in(17 downto 15);

	--d_u0_octantBitSelect_b_21_replace_rdcnt(COUNTER,97)
    -- every=1, low=0, high=6, step=1, init=1
    d_u0_octantBitSelect_b_21_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_octantBitSelect_b_21_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            d_u0_octantBitSelect_b_21_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF d_u0_octantBitSelect_b_21_replace_rdcnt_i = 5 THEN
                  d_u0_octantBitSelect_b_21_replace_rdcnt_eq <= '1';
                ELSE
                  d_u0_octantBitSelect_b_21_replace_rdcnt_eq <= '0';
                END IF;
                IF (d_u0_octantBitSelect_b_21_replace_rdcnt_eq = '1') THEN
                    d_u0_octantBitSelect_b_21_replace_rdcnt_i <= d_u0_octantBitSelect_b_21_replace_rdcnt_i - 6;
                ELSE
                    d_u0_octantBitSelect_b_21_replace_rdcnt_i <= d_u0_octantBitSelect_b_21_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    d_u0_octantBitSelect_b_21_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(d_u0_octantBitSelect_b_21_replace_rdcnt_i,3));


	--d_u0_octantBitSelect_b_21_replace_rdreg(REG,98)
    d_u0_octantBitSelect_b_21_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_octantBitSelect_b_21_replace_rdreg_q <= "000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_octantBitSelect_b_21_replace_rdreg_q <= d_u0_octantBitSelect_b_21_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--d_u0_octantBitSelect_b_21_replace_rdmux(MUX,99)
    d_u0_octantBitSelect_b_21_replace_rdmux_s <= VCC_q;
    d_u0_octantBitSelect_b_21_replace_rdmux: PROCESS (d_u0_octantBitSelect_b_21_replace_rdmux_s, d_u0_octantBitSelect_b_21_replace_rdreg_q, d_u0_octantBitSelect_b_21_replace_rdcnt_q)
    BEGIN
            CASE d_u0_octantBitSelect_b_21_replace_rdmux_s IS
                  WHEN "0" => d_u0_octantBitSelect_b_21_replace_rdmux_q <= d_u0_octantBitSelect_b_21_replace_rdreg_q;
                  WHEN "1" => d_u0_octantBitSelect_b_21_replace_rdmux_q <= d_u0_octantBitSelect_b_21_replace_rdcnt_q;
                  WHEN OTHERS => d_u0_octantBitSelect_b_21_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--d_u0_octantBitSelect_b_21_replace_mem(DUALMEM,96)
    d_u0_octantBitSelect_b_21_replace_mem_reset0 <= areset;
    d_u0_octantBitSelect_b_21_replace_mem_ia <= u0_octantBitSelect_b;
    d_u0_octantBitSelect_b_21_replace_mem_aa <= d_u0_octantBitSelect_b_21_replace_rdreg_q;
    d_u0_octantBitSelect_b_21_replace_mem_ab <= d_u0_octantBitSelect_b_21_replace_rdmux_q;
    d_u0_octantBitSelect_b_21_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_octantBitSelect_b_21_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u0_octantBitSelect_b_21_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u0_octantBitSelect_b_21_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u0_octantBitSelect_b_21_replace_mem_iq,
        address_a => d_u0_octantBitSelect_b_21_replace_mem_aa,
        data_a => d_u0_octantBitSelect_b_21_replace_mem_ia
    );
        d_u0_octantBitSelect_b_21_replace_mem_q <= d_u0_octantBitSelect_b_21_replace_mem_iq(2 downto 0);

	--d_u0_octantBitSelect_b_22(DELAY,58)@21
    d_u0_octantBitSelect_b_22 : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => d_u0_octantBitSelect_b_21_replace_mem_q, xout => d_u0_octantBitSelect_b_22_q, clk => clk, aclr => areset );

	--u0_cosJoin(BITJOIN,42)@22
    u0_cosJoin_q <= u0_invertCos_b & d_u0_octantBitSelect_b_22_q;

	--u0_doCosInvert(LOOKUP,43)@22
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


	--VCC(CONSTANT,1)@0
    VCC_q <= "1";

	--u0_sin_pi_over_4(CONSTANT,31)@0
    u0_sin_pi_over_4_q <= "010110101000001000";

	--d_u0_rangeAddSub_q_20_nor(LOGICAL,117)
    d_u0_rangeAddSub_q_20_nor_a <= d_xIn_c_24_notEnable_q;
    d_u0_rangeAddSub_q_20_nor_b <= d_u0_rangeAddSub_q_20_sticky_ena_q;
    d_u0_rangeAddSub_q_20_nor_q <= not (d_u0_rangeAddSub_q_20_nor_a or d_u0_rangeAddSub_q_20_nor_b);

	--d_u0_rangeAddSub_q_20_mem_top(CONSTANT,113)
    d_u0_rangeAddSub_q_20_mem_top_q <= "011";

	--d_u0_rangeAddSub_q_20_cmp(LOGICAL,114)
    d_u0_rangeAddSub_q_20_cmp_a <= d_u0_rangeAddSub_q_20_mem_top_q;
    d_u0_rangeAddSub_q_20_cmp_b <= STD_LOGIC_VECTOR("0" & d_u0_rangeAddSub_q_20_replace_rdmux_q);
    d_u0_rangeAddSub_q_20_cmp_q <= "1" when d_u0_rangeAddSub_q_20_cmp_a = d_u0_rangeAddSub_q_20_cmp_b else "0";

	--d_u0_rangeAddSub_q_20_cmpReg(REG,115)
    d_u0_rangeAddSub_q_20_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_rangeAddSub_q_20_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_rangeAddSub_q_20_cmpReg_q <= d_u0_rangeAddSub_q_20_cmp_q;
        END IF;
    END PROCESS;


	--d_u0_rangeAddSub_q_20_sticky_ena(REG,118)
    d_u0_rangeAddSub_q_20_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_rangeAddSub_q_20_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_u0_rangeAddSub_q_20_nor_q = "1") THEN
                d_u0_rangeAddSub_q_20_sticky_ena_q <= d_u0_rangeAddSub_q_20_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--d_u0_rangeAddSub_q_20_enaAnd(LOGICAL,119)
    d_u0_rangeAddSub_q_20_enaAnd_a <= d_u0_rangeAddSub_q_20_sticky_ena_q;
    d_u0_rangeAddSub_q_20_enaAnd_b <= VCC_q;
    d_u0_rangeAddSub_q_20_enaAnd_q <= d_u0_rangeAddSub_q_20_enaAnd_a and d_u0_rangeAddSub_q_20_enaAnd_b;

	--u0_addnsubConst(LOOKUP,11)@13
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


	--d_u0_accumAdd_b4_q_14(DELAY,56)@13
    d_u0_accumAdd_b4_q_14 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1 )
    PORT MAP ( xin => u0_accumAdd_b4_q, xout => d_u0_accumAdd_b4_q_14_q, clk => clk, aclr => areset );

	--u0_rangeLUT(LOOKUP,10)@13
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


	--u0_rangeAddSub(ADDSUB,12)@14
    u0_rangeAddSub_cin <= GND_q;
    u0_rangeAddSub_a <= STD_LOGIC_VECTOR("0" & u0_rangeLUT_q) & u0_addnsubConst_q(0);
    u0_rangeAddSub_b <= STD_LOGIC_VECTOR("00" & d_u0_accumAdd_b4_q_14_q) & u0_rangeAddSub_cin(0);
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


	--d_u0_rangeAddSub_q_20_replace_rdcnt(COUNTER,109)
    -- every=1, low=0, high=3, step=1, init=1
    d_u0_rangeAddSub_q_20_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_rangeAddSub_q_20_replace_rdcnt_i <= TO_UNSIGNED(1,2);
        ELSIF (clk'EVENT AND clk = '1') THEN
                d_u0_rangeAddSub_q_20_replace_rdcnt_i <= d_u0_rangeAddSub_q_20_replace_rdcnt_i + 1;
        END IF;
    END PROCESS;
    d_u0_rangeAddSub_q_20_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(d_u0_rangeAddSub_q_20_replace_rdcnt_i,2));


	--d_u0_rangeAddSub_q_20_replace_rdreg(REG,110)
    d_u0_rangeAddSub_q_20_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_rangeAddSub_q_20_replace_rdreg_q <= "00";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_rangeAddSub_q_20_replace_rdreg_q <= d_u0_rangeAddSub_q_20_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--d_u0_rangeAddSub_q_20_replace_rdmux(MUX,111)
    d_u0_rangeAddSub_q_20_replace_rdmux_s <= VCC_q;
    d_u0_rangeAddSub_q_20_replace_rdmux: PROCESS (d_u0_rangeAddSub_q_20_replace_rdmux_s, d_u0_rangeAddSub_q_20_replace_rdreg_q, d_u0_rangeAddSub_q_20_replace_rdcnt_q)
    BEGIN
            CASE d_u0_rangeAddSub_q_20_replace_rdmux_s IS
                  WHEN "0" => d_u0_rangeAddSub_q_20_replace_rdmux_q <= d_u0_rangeAddSub_q_20_replace_rdreg_q;
                  WHEN "1" => d_u0_rangeAddSub_q_20_replace_rdmux_q <= d_u0_rangeAddSub_q_20_replace_rdcnt_q;
                  WHEN OTHERS => d_u0_rangeAddSub_q_20_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--d_u0_rangeAddSub_q_20_replace_mem(DUALMEM,108)
    d_u0_rangeAddSub_q_20_replace_mem_reset0 <= areset;
    d_u0_rangeAddSub_q_20_replace_mem_ia <= u0_rangeAddSub_q;
    d_u0_rangeAddSub_q_20_replace_mem_aa <= d_u0_rangeAddSub_q_20_replace_rdreg_q;
    d_u0_rangeAddSub_q_20_replace_mem_ab <= d_u0_rangeAddSub_q_20_replace_rdmux_q;
    d_u0_rangeAddSub_q_20_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_rangeAddSub_q_20_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u0_rangeAddSub_q_20_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u0_rangeAddSub_q_20_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u0_rangeAddSub_q_20_replace_mem_iq,
        address_a => d_u0_rangeAddSub_q_20_replace_mem_aa,
        data_a => d_u0_rangeAddSub_q_20_replace_mem_ia
    );
        d_u0_rangeAddSub_q_20_replace_mem_q <= d_u0_rangeAddSub_q_20_replace_mem_iq(18 downto 0);

	--u0_alphaOverflowBitSelect(BITSELECT,14)@20
    u0_alphaOverflowBitSelect_in <= d_u0_rangeAddSub_q_20_replace_mem_q(15 downto 0);
    u0_alphaOverflowBitSelect_b <= u0_alphaOverflowBitSelect_in(15 downto 15);

	--u0_betaBitSelect(BITSELECT,15)@15
    u0_betaBitSelect_in <= u0_rangeAddSub_q(6 downto 0);
    u0_betaBitSelect_b <= u0_betaBitSelect_in(6 downto 0);

	--u0_ls4(BITSHIFT,22)@15
    u0_ls4_q_int <= u0_betaBitSelect_b & "0000";
    u0_ls4_q <= u0_ls4_q_int(10 downto 0);

	--u0_ls7(BITSHIFT,21)@15
    u0_ls7_q_int <= u0_betaBitSelect_b & "0000000";
    u0_ls7_q <= u0_ls7_q_int(13 downto 0);

	--u0_cm2(ADD,23)@15
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


	--u0_ls10(BITSHIFT,19)@15
    u0_ls10_q_int <= u0_betaBitSelect_b & "0000000000";
    u0_ls10_q <= u0_ls10_q_int(16 downto 0);

	--u0_ls12(BITSHIFT,18)@15
    u0_ls12_q_int <= u0_betaBitSelect_b & "000000000000";
    u0_ls12_q <= u0_ls12_q_int(18 downto 0);

	--u0_cm1(SUB,20)@15
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


	--u0_cm3(ADD,24)@16
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


	--u0_beta_times_4_shift(BITSHIFT,25)@17
    u0_beta_times_4_shift_q_int <= u0_cm3_q & "000";
    u0_beta_times_4_shift_q <= u0_beta_times_4_shift_q_int(23 downto 0);

	--u0_beta_times_pi_over_4_shifted(BITSELECT,26)@17
    u0_beta_times_pi_over_4_shifted_in <= u0_beta_times_4_shift_q(21 downto 0);
    u0_beta_times_pi_over_4_shifted_b <= u0_beta_times_pi_over_4_shifted_in(21 downto 6);

	--u0_alphaBitSelect(BITSELECT,13)@15
    u0_alphaBitSelect_in <= u0_rangeAddSub_q(14 downto 0);
    u0_alphaBitSelect_b <= u0_alphaBitSelect_in(14 downto 7);

	--u0_cosTable(DUALMEM,17)@15
    u0_cosTable_reset0 <= areset;
    u0_cosTable_ia <= (others => '0');
    u0_cosTable_aa <= (others => '0');
    u0_cosTable_ab <= u0_alphaBitSelect_b;
    u0_cosTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 16,
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
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/NCO_FDD3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_NCO_FDD3_u0_cosTable.hex"),
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
        u0_cosTable_q <= u0_cosTable_iq(15 downto 0);

	--u0_cosMult(MULT,28)@17
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

	--d_u0_sinTable_q_20_nor(LOGICAL,127)
    d_u0_sinTable_q_20_nor_a <= d_xIn_c_24_notEnable_q;
    d_u0_sinTable_q_20_nor_b <= d_u0_sinTable_q_20_sticky_ena_q;
    d_u0_sinTable_q_20_nor_q <= not (d_u0_sinTable_q_20_nor_a or d_u0_sinTable_q_20_nor_b);

	--d_u0_sinTable_q_20_cmpReg(REG,125)
    d_u0_sinTable_q_20_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_sinTable_q_20_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_sinTable_q_20_cmpReg_q <= VCC_q;
        END IF;
    END PROCESS;


	--d_u0_sinTable_q_20_sticky_ena(REG,128)
    d_u0_sinTable_q_20_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_sinTable_q_20_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_u0_sinTable_q_20_nor_q = "1") THEN
                d_u0_sinTable_q_20_sticky_ena_q <= d_u0_sinTable_q_20_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--d_u0_sinTable_q_20_enaAnd(LOGICAL,129)
    d_u0_sinTable_q_20_enaAnd_a <= d_u0_sinTable_q_20_sticky_ena_q;
    d_u0_sinTable_q_20_enaAnd_b <= VCC_q;
    d_u0_sinTable_q_20_enaAnd_q <= d_u0_sinTable_q_20_enaAnd_a and d_u0_sinTable_q_20_enaAnd_b;

	--u0_sinTable(DUALMEM,16)@15
    u0_sinTable_reset0 <= areset;
    u0_sinTable_ia <= (others => '0');
    u0_sinTable_aa <= (others => '0');
    u0_sinTable_ab <= u0_alphaBitSelect_b;
    u0_sinTable_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 16,
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
        init_file => safe_path("DirectRFTest_and_DPD_SV/DirectRFDesign/DSPBA/DUC5/NCO_FDD3/DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_NCO_FDD3_u0_sinTable.hex"),
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
        u0_sinTable_q <= u0_sinTable_iq(15 downto 0);

	--d_u0_sinTable_q_20_replace_rdcnt(COUNTER,121)
    -- every=1, low=0, high=1, step=1, init=1
    d_u0_sinTable_q_20_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_sinTable_q_20_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
                d_u0_sinTable_q_20_replace_rdcnt_i <= d_u0_sinTable_q_20_replace_rdcnt_i + 1;
        END IF;
    END PROCESS;
    d_u0_sinTable_q_20_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(d_u0_sinTable_q_20_replace_rdcnt_i,1));


	--d_u0_sinTable_q_20_replace_rdreg(REG,122)
    d_u0_sinTable_q_20_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_sinTable_q_20_replace_rdreg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_sinTable_q_20_replace_rdreg_q <= d_u0_sinTable_q_20_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--d_u0_sinTable_q_20_replace_rdmux(MUX,123)
    d_u0_sinTable_q_20_replace_rdmux_s <= VCC_q;
    d_u0_sinTable_q_20_replace_rdmux: PROCESS (d_u0_sinTable_q_20_replace_rdmux_s, d_u0_sinTable_q_20_replace_rdreg_q, d_u0_sinTable_q_20_replace_rdcnt_q)
    BEGIN
            CASE d_u0_sinTable_q_20_replace_rdmux_s IS
                  WHEN "0" => d_u0_sinTable_q_20_replace_rdmux_q <= d_u0_sinTable_q_20_replace_rdreg_q;
                  WHEN "1" => d_u0_sinTable_q_20_replace_rdmux_q <= d_u0_sinTable_q_20_replace_rdcnt_q;
                  WHEN OTHERS => d_u0_sinTable_q_20_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--d_u0_sinTable_q_20_replace_mem(DUALMEM,120)
    d_u0_sinTable_q_20_replace_mem_reset0 <= areset;
    d_u0_sinTable_q_20_replace_mem_ia <= u0_sinTable_q;
    d_u0_sinTable_q_20_replace_mem_aa <= d_u0_sinTable_q_20_replace_rdreg_q;
    d_u0_sinTable_q_20_replace_mem_ab <= d_u0_sinTable_q_20_replace_rdmux_q;
    d_u0_sinTable_q_20_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_20_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u0_sinTable_q_20_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u0_sinTable_q_20_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u0_sinTable_q_20_replace_mem_iq,
        address_a => d_u0_sinTable_q_20_replace_mem_aa,
        data_a => d_u0_sinTable_q_20_replace_mem_ia
    );
        d_u0_sinTable_q_20_replace_mem_q <= d_u0_sinTable_q_20_replace_mem_iq(15 downto 0);

	--u0_lsSinTable(BITSHIFT,29)@20
    u0_lsSinTable_q_int <= d_u0_sinTable_q_20_replace_mem_q & "000000000000000000000000";
    u0_lsSinTable_q <= u0_lsSinTable_q_int(39 downto 0);

	--u0_sinAdd(ADD,33)@20
    u0_sinAdd_a <= u0_lsSinTable_q(39 downto 22);
    u0_sinAdd_b <= STD_LOGIC_VECTOR("00000000" & u0_cosMult_q(31 downto 22));
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
    u0_sinAdd_q <= u0_sinAdd_o(17 downto 0);


	--u0_roundedSin(ROUND,35)@21
    u0_roundedSin_in <= u0_sinAdd_q;
    u0_roundedSin: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_roundedSin_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_roundedSin_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_roundedSin_in(17 downto 2)), 16) + SIGNED(STD_LOGIC_VECTOR'("000000000000000" & u0_roundedSin_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u0_sinMult(MULT,27)@17
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

	--d_u0_cosTable_q_20_replace_mem(DUALMEM,130)
    d_u0_cosTable_q_20_replace_mem_reset0 <= areset;
    d_u0_cosTable_q_20_replace_mem_ia <= u0_cosTable_q;
    d_u0_cosTable_q_20_replace_mem_aa <= d_u0_sinTable_q_20_replace_rdreg_q;
    d_u0_cosTable_q_20_replace_mem_ab <= d_u0_sinTable_q_20_replace_rdmux_q;
    d_u0_cosTable_q_20_replace_mem_dmem : altsyncram
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
        clocken1 => d_u0_sinTable_q_20_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_u0_cosTable_q_20_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u0_cosTable_q_20_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u0_cosTable_q_20_replace_mem_iq,
        address_a => d_u0_cosTable_q_20_replace_mem_aa,
        data_a => d_u0_cosTable_q_20_replace_mem_ia
    );
        d_u0_cosTable_q_20_replace_mem_q <= d_u0_cosTable_q_20_replace_mem_iq(15 downto 0);

	--u0_lsCosTable(BITSHIFT,30)@20
    u0_lsCosTable_q_int <= d_u0_cosTable_q_20_replace_mem_q & "000000000000000000000000";
    u0_lsCosTable_q <= u0_lsCosTable_q_int(39 downto 0);

	--u0_cosSub(SUB,34)@20
    u0_cosSub_a <= u0_lsCosTable_q(39 downto 22);
    u0_cosSub_b <= STD_LOGIC_VECTOR("00000000" & u0_sinMult_q(31 downto 22));
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
    u0_cosSub_q <= u0_cosSub_o(17 downto 0);


	--u0_roundedCos(ROUND,36)@21
    u0_roundedCos_in <= u0_cosSub_q;
    u0_roundedCos: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_roundedCos_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_roundedCos_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_roundedCos_in(17 downto 2)), 16) + SIGNED(STD_LOGIC_VECTOR'("000000000000000" & u0_roundedCos_in(1 downto 1))));
        END IF;
    END PROCESS;


	--u0_doSwap(LOOKUP,37)@21
    u0_doSwap: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_doSwap_q <= "0";
        ELSIF (clk'EVENT AND clk = '1'AND VCC_q = "1") THEN
            CASE (d_u0_octantBitSelect_b_21_replace_mem_q) IS
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


	--u0_cosSwapMux(MUX,45)@22
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


	--GND(CONSTANT,0)@0
    GND_q <= "0";

	--u0_cosInvert(SUB,47)@23
    u0_cosInvert_a <= STD_LOGIC_VECTOR((15 downto 1 => GND_q(0)) & GND_q);
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
    u0_cosInvert_q <= u0_cosInvert_o(15 downto 0);


	--u0_invertSin(BITSELECT,38)@22
    u0_invertSin_in <= d_u0_phaseIncrMem_q_22_replace_mem_q;
    u0_invertSin_b <= u0_invertSin_in(19 downto 19);

	--u0_sinJoin(BITJOIN,39)@22
    u0_sinJoin_q <= u0_invertSin_b & d_u0_octantBitSelect_b_22_q;

	--u0_doSinInvert(LOOKUP,40)@22
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


	--u0_sinSwapMux(MUX,44)@22
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


	--u0_sinInvert(SUB,46)@23
    u0_sinInvert_a <= STD_LOGIC_VECTOR((15 downto 1 => GND_q(0)) & GND_q);
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
    u0_sinInvert_q <= u0_sinInvert_o(15 downto 0);


	--d_xIn_c_24_nor(LOGICAL,71)
    d_xIn_c_24_nor_a <= d_xIn_c_24_notEnable_q;
    d_xIn_c_24_nor_b <= d_xIn_c_24_sticky_ena_q;
    d_xIn_c_24_nor_q <= not (d_xIn_c_24_nor_a or d_xIn_c_24_nor_b);

	--d_xIn_c_24_mem_top(CONSTANT,67)
    d_xIn_c_24_mem_top_q <= "01100";

	--d_xIn_c_24_cmp(LOGICAL,68)
    d_xIn_c_24_cmp_a <= d_xIn_c_24_mem_top_q;
    d_xIn_c_24_cmp_b <= STD_LOGIC_VECTOR("0" & d_xIn_c_24_replace_rdmux_q);
    d_xIn_c_24_cmp_q <= "1" when d_xIn_c_24_cmp_a = d_xIn_c_24_cmp_b else "0";

	--d_xIn_c_24_cmpReg(REG,69)
    d_xIn_c_24_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_c_24_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_xIn_c_24_cmpReg_q <= d_xIn_c_24_cmp_q;
        END IF;
    END PROCESS;


	--d_xIn_c_24_sticky_ena(REG,72)
    d_xIn_c_24_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_c_24_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (d_xIn_c_24_nor_q = "1") THEN
                d_xIn_c_24_sticky_ena_q <= d_xIn_c_24_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--d_xIn_c_24_enaAnd(LOGICAL,73)
    d_xIn_c_24_enaAnd_a <= d_xIn_c_24_sticky_ena_q;
    d_xIn_c_24_enaAnd_b <= VCC_q;
    d_xIn_c_24_enaAnd_q <= d_xIn_c_24_enaAnd_a and d_xIn_c_24_enaAnd_b;

	--d_xIn_c_24_replace_rdcnt(COUNTER,63)
    -- every=1, low=0, high=12, step=1, init=1
    d_xIn_c_24_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_c_24_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            d_xIn_c_24_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF d_xIn_c_24_replace_rdcnt_i = 11 THEN
                  d_xIn_c_24_replace_rdcnt_eq <= '1';
                ELSE
                  d_xIn_c_24_replace_rdcnt_eq <= '0';
                END IF;
                IF (d_xIn_c_24_replace_rdcnt_eq = '1') THEN
                    d_xIn_c_24_replace_rdcnt_i <= d_xIn_c_24_replace_rdcnt_i - 12;
                ELSE
                    d_xIn_c_24_replace_rdcnt_i <= d_xIn_c_24_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    d_xIn_c_24_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(d_xIn_c_24_replace_rdcnt_i,4));


	--d_xIn_c_24_replace_rdreg(REG,64)
    d_xIn_c_24_replace_rdreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_c_24_replace_rdreg_q <= "0000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_xIn_c_24_replace_rdreg_q <= d_xIn_c_24_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--d_xIn_c_24_replace_rdmux(MUX,65)
    d_xIn_c_24_replace_rdmux_s <= VCC_q;
    d_xIn_c_24_replace_rdmux: PROCESS (d_xIn_c_24_replace_rdmux_s, d_xIn_c_24_replace_rdreg_q, d_xIn_c_24_replace_rdcnt_q)
    BEGIN
            CASE d_xIn_c_24_replace_rdmux_s IS
                  WHEN "0" => d_xIn_c_24_replace_rdmux_q <= d_xIn_c_24_replace_rdreg_q;
                  WHEN "1" => d_xIn_c_24_replace_rdmux_q <= d_xIn_c_24_replace_rdcnt_q;
                  WHEN OTHERS => d_xIn_c_24_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--d_xIn_c_24_replace_mem(DUALMEM,62)
    d_xIn_c_24_replace_mem_reset0 <= areset;
    d_xIn_c_24_replace_mem_ia <= xIn_c;
    d_xIn_c_24_replace_mem_aa <= d_xIn_c_24_replace_rdreg_q;
    d_xIn_c_24_replace_mem_ab <= d_xIn_c_24_replace_rdmux_q;
    d_xIn_c_24_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 4,
        numwords_a => 13,
        width_b => 8,
        widthad_b => 4,
        numwords_b => 13,
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
        clocken1 => d_xIn_c_24_enaAnd_q(0),
        clocken0 => '1',
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => d_xIn_c_24_replace_mem_reset0,
        clock1 => clk,
        address_b => d_xIn_c_24_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_xIn_c_24_replace_mem_iq,
        address_a => d_xIn_c_24_replace_mem_aa,
        data_a => d_xIn_c_24_replace_mem_ia
    );
        d_xIn_c_24_replace_mem_q <= d_xIn_c_24_replace_mem_iq(7 downto 0);

	--d_xIn_v_24(DELAY,50)@12
    d_xIn_v_24 : dspba_delay
    GENERIC MAP ( width => 1, depth => 12 )
    PORT MAP ( xin => d_xIn_v_12_q, xout => d_xIn_v_24_q, clk => clk, aclr => areset );

	--ncoOut(PORTOUT,48)@24
    ncoOut_v <= d_xIn_v_24_q;
    ncoOut_c <= d_xIn_c_24_replace_mem_q;
    sinOut_0 <= u0_sinInvert_q;
    cosOut_0 <= u0_cosInvert_q;


end normal;
