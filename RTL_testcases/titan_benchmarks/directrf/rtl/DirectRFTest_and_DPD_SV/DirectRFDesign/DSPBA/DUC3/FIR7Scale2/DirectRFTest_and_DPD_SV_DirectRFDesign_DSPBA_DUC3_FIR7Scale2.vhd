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

-- VHDL created from DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR7Scale2
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
entity DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR7Scale2 is
    port (
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        xIn_0 : in std_logic_vector(33 downto 0);
        xIn_1 : in std_logic_vector(33 downto 0);
        xIn_2 : in std_logic_vector(33 downto 0);
        xIn_3 : in std_logic_vector(33 downto 0);
        xIn_4 : in std_logic_vector(33 downto 0);
        xIn_5 : in std_logic_vector(33 downto 0);
        xIn_6 : in std_logic_vector(33 downto 0);
        xIn_7 : in std_logic_vector(33 downto 0);
        xIn_8 : in std_logic_vector(33 downto 0);
        xIn_9 : in std_logic_vector(33 downto 0);
        xIn_10 : in std_logic_vector(33 downto 0);
        xIn_11 : in std_logic_vector(33 downto 0);
        xIn_12 : in std_logic_vector(33 downto 0);
        xIn_13 : in std_logic_vector(33 downto 0);
        xIn_14 : in std_logic_vector(33 downto 0);
        xIn_15 : in std_logic_vector(33 downto 0);
        gain_i : in std_logic_vector(0 downto 0);
        qOut_v : out std_logic_vector(0 downto 0);
        qOut_c : out std_logic_vector(7 downto 0);
        qOut_0 : out std_logic_vector(15 downto 0);
        qOut_1 : out std_logic_vector(15 downto 0);
        qOut_2 : out std_logic_vector(15 downto 0);
        qOut_3 : out std_logic_vector(15 downto 0);
        qOut_4 : out std_logic_vector(15 downto 0);
        qOut_5 : out std_logic_vector(15 downto 0);
        qOut_6 : out std_logic_vector(15 downto 0);
        qOut_7 : out std_logic_vector(15 downto 0);
        qOut_8 : out std_logic_vector(15 downto 0);
        qOut_9 : out std_logic_vector(15 downto 0);
        qOut_10 : out std_logic_vector(15 downto 0);
        qOut_11 : out std_logic_vector(15 downto 0);
        qOut_12 : out std_logic_vector(15 downto 0);
        qOut_13 : out std_logic_vector(15 downto 0);
        qOut_14 : out std_logic_vector(15 downto 0);
        qOut_15 : out std_logic_vector(15 downto 0);
        eOut_0 : out std_logic_vector(0 downto 0);
        eOut_1 : out std_logic_vector(0 downto 0);
        eOut_2 : out std_logic_vector(0 downto 0);
        eOut_3 : out std_logic_vector(0 downto 0);
        eOut_4 : out std_logic_vector(0 downto 0);
        eOut_5 : out std_logic_vector(0 downto 0);
        eOut_6 : out std_logic_vector(0 downto 0);
        eOut_7 : out std_logic_vector(0 downto 0);
        eOut_8 : out std_logic_vector(0 downto 0);
        eOut_9 : out std_logic_vector(0 downto 0);
        eOut_10 : out std_logic_vector(0 downto 0);
        eOut_11 : out std_logic_vector(0 downto 0);
        eOut_12 : out std_logic_vector(0 downto 0);
        eOut_13 : out std_logic_vector(0 downto 0);
        eOut_14 : out std_logic_vector(0 downto 0);
        eOut_15 : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_FIR7Scale2 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal gainReg_q : std_logic_vector (0 downto 0);
    signal u0_rnd_in : std_logic_vector (34 downto 0);
    signal u0_rnd_q : std_logic_vector (19 downto 0);
    signal u0_lowconst_q : std_logic_vector (15 downto 0);
    signal u0_highconst_q : std_logic_vector (15 downto 0);
    signal u0_low_a : std_logic_vector(22 downto 0);
    signal u0_low_b : std_logic_vector(22 downto 0);
    signal u0_low_o : std_logic_vector (22 downto 0);
    signal u0_low_cin : std_logic_vector (0 downto 0);
    signal u0_low_c : std_logic_vector (0 downto 0);
    signal u0_high_a : std_logic_vector(22 downto 0);
    signal u0_high_b : std_logic_vector(22 downto 0);
    signal u0_high_o : std_logic_vector (22 downto 0);
    signal u0_high_cin : std_logic_vector (0 downto 0);
    signal u0_high_n : std_logic_vector (0 downto 0);
    signal u0_mux_q : std_logic_vector (15 downto 0);
    signal u0_mux_v : std_logic_vector (0 downto 0);
    signal u1_rnd_in : std_logic_vector (34 downto 0);
    signal u1_rnd_q : std_logic_vector (19 downto 0);
    signal u1_low_a : std_logic_vector(22 downto 0);
    signal u1_low_b : std_logic_vector(22 downto 0);
    signal u1_low_o : std_logic_vector (22 downto 0);
    signal u1_low_cin : std_logic_vector (0 downto 0);
    signal u1_low_c : std_logic_vector (0 downto 0);
    signal u1_high_a : std_logic_vector(22 downto 0);
    signal u1_high_b : std_logic_vector(22 downto 0);
    signal u1_high_o : std_logic_vector (22 downto 0);
    signal u1_high_cin : std_logic_vector (0 downto 0);
    signal u1_high_n : std_logic_vector (0 downto 0);
    signal u1_mux_q : std_logic_vector (15 downto 0);
    signal u1_mux_v : std_logic_vector (0 downto 0);
    signal u2_rnd_in : std_logic_vector (34 downto 0);
    signal u2_rnd_q : std_logic_vector (19 downto 0);
    signal u2_low_a : std_logic_vector(22 downto 0);
    signal u2_low_b : std_logic_vector(22 downto 0);
    signal u2_low_o : std_logic_vector (22 downto 0);
    signal u2_low_cin : std_logic_vector (0 downto 0);
    signal u2_low_c : std_logic_vector (0 downto 0);
    signal u2_high_a : std_logic_vector(22 downto 0);
    signal u2_high_b : std_logic_vector(22 downto 0);
    signal u2_high_o : std_logic_vector (22 downto 0);
    signal u2_high_cin : std_logic_vector (0 downto 0);
    signal u2_high_n : std_logic_vector (0 downto 0);
    signal u2_mux_q : std_logic_vector (15 downto 0);
    signal u2_mux_v : std_logic_vector (0 downto 0);
    signal u3_rnd_in : std_logic_vector (34 downto 0);
    signal u3_rnd_q : std_logic_vector (19 downto 0);
    signal u3_low_a : std_logic_vector(22 downto 0);
    signal u3_low_b : std_logic_vector(22 downto 0);
    signal u3_low_o : std_logic_vector (22 downto 0);
    signal u3_low_cin : std_logic_vector (0 downto 0);
    signal u3_low_c : std_logic_vector (0 downto 0);
    signal u3_high_a : std_logic_vector(22 downto 0);
    signal u3_high_b : std_logic_vector(22 downto 0);
    signal u3_high_o : std_logic_vector (22 downto 0);
    signal u3_high_cin : std_logic_vector (0 downto 0);
    signal u3_high_n : std_logic_vector (0 downto 0);
    signal u3_mux_q : std_logic_vector (15 downto 0);
    signal u3_mux_v : std_logic_vector (0 downto 0);
    signal u4_rnd_in : std_logic_vector (34 downto 0);
    signal u4_rnd_q : std_logic_vector (19 downto 0);
    signal u4_low_a : std_logic_vector(22 downto 0);
    signal u4_low_b : std_logic_vector(22 downto 0);
    signal u4_low_o : std_logic_vector (22 downto 0);
    signal u4_low_cin : std_logic_vector (0 downto 0);
    signal u4_low_c : std_logic_vector (0 downto 0);
    signal u4_high_a : std_logic_vector(22 downto 0);
    signal u4_high_b : std_logic_vector(22 downto 0);
    signal u4_high_o : std_logic_vector (22 downto 0);
    signal u4_high_cin : std_logic_vector (0 downto 0);
    signal u4_high_n : std_logic_vector (0 downto 0);
    signal u4_mux_q : std_logic_vector (15 downto 0);
    signal u4_mux_v : std_logic_vector (0 downto 0);
    signal u5_rnd_in : std_logic_vector (34 downto 0);
    signal u5_rnd_q : std_logic_vector (19 downto 0);
    signal u5_low_a : std_logic_vector(22 downto 0);
    signal u5_low_b : std_logic_vector(22 downto 0);
    signal u5_low_o : std_logic_vector (22 downto 0);
    signal u5_low_cin : std_logic_vector (0 downto 0);
    signal u5_low_c : std_logic_vector (0 downto 0);
    signal u5_high_a : std_logic_vector(22 downto 0);
    signal u5_high_b : std_logic_vector(22 downto 0);
    signal u5_high_o : std_logic_vector (22 downto 0);
    signal u5_high_cin : std_logic_vector (0 downto 0);
    signal u5_high_n : std_logic_vector (0 downto 0);
    signal u5_mux_q : std_logic_vector (15 downto 0);
    signal u5_mux_v : std_logic_vector (0 downto 0);
    signal u6_rnd_in : std_logic_vector (34 downto 0);
    signal u6_rnd_q : std_logic_vector (19 downto 0);
    signal u6_low_a : std_logic_vector(22 downto 0);
    signal u6_low_b : std_logic_vector(22 downto 0);
    signal u6_low_o : std_logic_vector (22 downto 0);
    signal u6_low_cin : std_logic_vector (0 downto 0);
    signal u6_low_c : std_logic_vector (0 downto 0);
    signal u6_high_a : std_logic_vector(22 downto 0);
    signal u6_high_b : std_logic_vector(22 downto 0);
    signal u6_high_o : std_logic_vector (22 downto 0);
    signal u6_high_cin : std_logic_vector (0 downto 0);
    signal u6_high_n : std_logic_vector (0 downto 0);
    signal u6_mux_q : std_logic_vector (15 downto 0);
    signal u6_mux_v : std_logic_vector (0 downto 0);
    signal u7_rnd_in : std_logic_vector (34 downto 0);
    signal u7_rnd_q : std_logic_vector (19 downto 0);
    signal u7_low_a : std_logic_vector(22 downto 0);
    signal u7_low_b : std_logic_vector(22 downto 0);
    signal u7_low_o : std_logic_vector (22 downto 0);
    signal u7_low_cin : std_logic_vector (0 downto 0);
    signal u7_low_c : std_logic_vector (0 downto 0);
    signal u7_high_a : std_logic_vector(22 downto 0);
    signal u7_high_b : std_logic_vector(22 downto 0);
    signal u7_high_o : std_logic_vector (22 downto 0);
    signal u7_high_cin : std_logic_vector (0 downto 0);
    signal u7_high_n : std_logic_vector (0 downto 0);
    signal u7_mux_q : std_logic_vector (15 downto 0);
    signal u7_mux_v : std_logic_vector (0 downto 0);
    signal u8_rnd_in : std_logic_vector (34 downto 0);
    signal u8_rnd_q : std_logic_vector (19 downto 0);
    signal u8_low_a : std_logic_vector(22 downto 0);
    signal u8_low_b : std_logic_vector(22 downto 0);
    signal u8_low_o : std_logic_vector (22 downto 0);
    signal u8_low_cin : std_logic_vector (0 downto 0);
    signal u8_low_c : std_logic_vector (0 downto 0);
    signal u8_high_a : std_logic_vector(22 downto 0);
    signal u8_high_b : std_logic_vector(22 downto 0);
    signal u8_high_o : std_logic_vector (22 downto 0);
    signal u8_high_cin : std_logic_vector (0 downto 0);
    signal u8_high_n : std_logic_vector (0 downto 0);
    signal u8_mux_q : std_logic_vector (15 downto 0);
    signal u8_mux_v : std_logic_vector (0 downto 0);
    signal u9_rnd_in : std_logic_vector (34 downto 0);
    signal u9_rnd_q : std_logic_vector (19 downto 0);
    signal u9_low_a : std_logic_vector(22 downto 0);
    signal u9_low_b : std_logic_vector(22 downto 0);
    signal u9_low_o : std_logic_vector (22 downto 0);
    signal u9_low_cin : std_logic_vector (0 downto 0);
    signal u9_low_c : std_logic_vector (0 downto 0);
    signal u9_high_a : std_logic_vector(22 downto 0);
    signal u9_high_b : std_logic_vector(22 downto 0);
    signal u9_high_o : std_logic_vector (22 downto 0);
    signal u9_high_cin : std_logic_vector (0 downto 0);
    signal u9_high_n : std_logic_vector (0 downto 0);
    signal u9_mux_q : std_logic_vector (15 downto 0);
    signal u9_mux_v : std_logic_vector (0 downto 0);
    signal u10_rnd_in : std_logic_vector (34 downto 0);
    signal u10_rnd_q : std_logic_vector (19 downto 0);
    signal u10_low_a : std_logic_vector(22 downto 0);
    signal u10_low_b : std_logic_vector(22 downto 0);
    signal u10_low_o : std_logic_vector (22 downto 0);
    signal u10_low_cin : std_logic_vector (0 downto 0);
    signal u10_low_c : std_logic_vector (0 downto 0);
    signal u10_high_a : std_logic_vector(22 downto 0);
    signal u10_high_b : std_logic_vector(22 downto 0);
    signal u10_high_o : std_logic_vector (22 downto 0);
    signal u10_high_cin : std_logic_vector (0 downto 0);
    signal u10_high_n : std_logic_vector (0 downto 0);
    signal u10_mux_q : std_logic_vector (15 downto 0);
    signal u10_mux_v : std_logic_vector (0 downto 0);
    signal u11_rnd_in : std_logic_vector (34 downto 0);
    signal u11_rnd_q : std_logic_vector (19 downto 0);
    signal u11_low_a : std_logic_vector(22 downto 0);
    signal u11_low_b : std_logic_vector(22 downto 0);
    signal u11_low_o : std_logic_vector (22 downto 0);
    signal u11_low_cin : std_logic_vector (0 downto 0);
    signal u11_low_c : std_logic_vector (0 downto 0);
    signal u11_high_a : std_logic_vector(22 downto 0);
    signal u11_high_b : std_logic_vector(22 downto 0);
    signal u11_high_o : std_logic_vector (22 downto 0);
    signal u11_high_cin : std_logic_vector (0 downto 0);
    signal u11_high_n : std_logic_vector (0 downto 0);
    signal u11_mux_q : std_logic_vector (15 downto 0);
    signal u11_mux_v : std_logic_vector (0 downto 0);
    signal u12_rnd_in : std_logic_vector (34 downto 0);
    signal u12_rnd_q : std_logic_vector (19 downto 0);
    signal u12_low_a : std_logic_vector(22 downto 0);
    signal u12_low_b : std_logic_vector(22 downto 0);
    signal u12_low_o : std_logic_vector (22 downto 0);
    signal u12_low_cin : std_logic_vector (0 downto 0);
    signal u12_low_c : std_logic_vector (0 downto 0);
    signal u12_high_a : std_logic_vector(22 downto 0);
    signal u12_high_b : std_logic_vector(22 downto 0);
    signal u12_high_o : std_logic_vector (22 downto 0);
    signal u12_high_cin : std_logic_vector (0 downto 0);
    signal u12_high_n : std_logic_vector (0 downto 0);
    signal u12_mux_q : std_logic_vector (15 downto 0);
    signal u12_mux_v : std_logic_vector (0 downto 0);
    signal u13_rnd_in : std_logic_vector (34 downto 0);
    signal u13_rnd_q : std_logic_vector (19 downto 0);
    signal u13_low_a : std_logic_vector(22 downto 0);
    signal u13_low_b : std_logic_vector(22 downto 0);
    signal u13_low_o : std_logic_vector (22 downto 0);
    signal u13_low_cin : std_logic_vector (0 downto 0);
    signal u13_low_c : std_logic_vector (0 downto 0);
    signal u13_high_a : std_logic_vector(22 downto 0);
    signal u13_high_b : std_logic_vector(22 downto 0);
    signal u13_high_o : std_logic_vector (22 downto 0);
    signal u13_high_cin : std_logic_vector (0 downto 0);
    signal u13_high_n : std_logic_vector (0 downto 0);
    signal u13_mux_q : std_logic_vector (15 downto 0);
    signal u13_mux_v : std_logic_vector (0 downto 0);
    signal u14_rnd_in : std_logic_vector (34 downto 0);
    signal u14_rnd_q : std_logic_vector (19 downto 0);
    signal u14_low_a : std_logic_vector(22 downto 0);
    signal u14_low_b : std_logic_vector(22 downto 0);
    signal u14_low_o : std_logic_vector (22 downto 0);
    signal u14_low_cin : std_logic_vector (0 downto 0);
    signal u14_low_c : std_logic_vector (0 downto 0);
    signal u14_high_a : std_logic_vector(22 downto 0);
    signal u14_high_b : std_logic_vector(22 downto 0);
    signal u14_high_o : std_logic_vector (22 downto 0);
    signal u14_high_cin : std_logic_vector (0 downto 0);
    signal u14_high_n : std_logic_vector (0 downto 0);
    signal u14_mux_q : std_logic_vector (15 downto 0);
    signal u14_mux_v : std_logic_vector (0 downto 0);
    signal u15_rnd_in : std_logic_vector (34 downto 0);
    signal u15_rnd_q : std_logic_vector (19 downto 0);
    signal u15_low_a : std_logic_vector(22 downto 0);
    signal u15_low_b : std_logic_vector(22 downto 0);
    signal u15_low_o : std_logic_vector (22 downto 0);
    signal u15_low_cin : std_logic_vector (0 downto 0);
    signal u15_low_c : std_logic_vector (0 downto 0);
    signal u15_high_a : std_logic_vector(22 downto 0);
    signal u15_high_b : std_logic_vector(22 downto 0);
    signal u15_high_o : std_logic_vector (22 downto 0);
    signal u15_high_cin : std_logic_vector (0 downto 0);
    signal u15_high_n : std_logic_vector (0 downto 0);
    signal u15_mux_q : std_logic_vector (15 downto 0);
    signal u15_mux_v : std_logic_vector (0 downto 0);
    signal ld_xIn_v_to_u0_low_e_q : std_logic_vector (0 downto 0);
    signal ld_xIn_v_to_u0_mux_e_q : std_logic_vector (0 downto 0);
    signal ld_u0_rnd_q_to_u0_mux_cc_q : std_logic_vector (19 downto 0);
    signal ld_xIn_v_to_u0_exp_and_b_q : std_logic_vector (0 downto 0);
    signal ld_u1_rnd_q_to_u1_mux_cc_q : std_logic_vector (19 downto 0);
    signal ld_u2_rnd_q_to_u2_mux_cc_q : std_logic_vector (19 downto 0);
    signal ld_u3_rnd_q_to_u3_mux_cc_q : std_logic_vector (19 downto 0);
    signal ld_u4_rnd_q_to_u4_mux_cc_q : std_logic_vector (19 downto 0);
    signal ld_u5_rnd_q_to_u5_mux_cc_q : std_logic_vector (19 downto 0);
    signal ld_u6_rnd_q_to_u6_mux_cc_q : std_logic_vector (19 downto 0);
    signal ld_u7_rnd_q_to_u7_mux_cc_q : std_logic_vector (19 downto 0);
    signal ld_u8_rnd_q_to_u8_mux_cc_q : std_logic_vector (19 downto 0);
    signal ld_u9_rnd_q_to_u9_mux_cc_q : std_logic_vector (19 downto 0);
    signal ld_u10_rnd_q_to_u10_mux_cc_q : std_logic_vector (19 downto 0);
    signal ld_u11_rnd_q_to_u11_mux_cc_q : std_logic_vector (19 downto 0);
    signal ld_u12_rnd_q_to_u12_mux_cc_q : std_logic_vector (19 downto 0);
    signal ld_u13_rnd_q_to_u13_mux_cc_q : std_logic_vector (19 downto 0);
    signal ld_u14_rnd_q_to_u14_mux_cc_q : std_logic_vector (19 downto 0);
    signal ld_u15_rnd_q_to_u15_mux_cc_q : std_logic_vector (19 downto 0);
    signal ld_xIn_c_to_qOut_c_q : std_logic_vector (7 downto 0);
    signal u0_shiftsel_q_int : std_logic_vector (34 downto 0);
    signal u0_shiftsel_q : std_logic_vector (34 downto 0);
    signal u1_shiftsel_q_int : std_logic_vector (34 downto 0);
    signal u1_shiftsel_q : std_logic_vector (34 downto 0);
    signal u2_shiftsel_q_int : std_logic_vector (34 downto 0);
    signal u2_shiftsel_q : std_logic_vector (34 downto 0);
    signal u3_shiftsel_q_int : std_logic_vector (34 downto 0);
    signal u3_shiftsel_q : std_logic_vector (34 downto 0);
    signal u4_shiftsel_q_int : std_logic_vector (34 downto 0);
    signal u4_shiftsel_q : std_logic_vector (34 downto 0);
    signal u5_shiftsel_q_int : std_logic_vector (34 downto 0);
    signal u5_shiftsel_q : std_logic_vector (34 downto 0);
    signal u6_shiftsel_q_int : std_logic_vector (34 downto 0);
    signal u6_shiftsel_q : std_logic_vector (34 downto 0);
    signal u7_shiftsel_q_int : std_logic_vector (34 downto 0);
    signal u7_shiftsel_q : std_logic_vector (34 downto 0);
    signal u8_shiftsel_q_int : std_logic_vector (34 downto 0);
    signal u8_shiftsel_q : std_logic_vector (34 downto 0);
    signal u9_shiftsel_q_int : std_logic_vector (34 downto 0);
    signal u9_shiftsel_q : std_logic_vector (34 downto 0);
    signal u10_shiftsel_q_int : std_logic_vector (34 downto 0);
    signal u10_shiftsel_q : std_logic_vector (34 downto 0);
    signal u11_shiftsel_q_int : std_logic_vector (34 downto 0);
    signal u11_shiftsel_q : std_logic_vector (34 downto 0);
    signal u12_shiftsel_q_int : std_logic_vector (34 downto 0);
    signal u12_shiftsel_q : std_logic_vector (34 downto 0);
    signal u13_shiftsel_q_int : std_logic_vector (34 downto 0);
    signal u13_shiftsel_q : std_logic_vector (34 downto 0);
    signal u14_shiftsel_q_int : std_logic_vector (34 downto 0);
    signal u14_shiftsel_q : std_logic_vector (34 downto 0);
    signal u15_shiftsel_q_int : std_logic_vector (34 downto 0);
    signal u15_shiftsel_q : std_logic_vector (34 downto 0);
    signal u0_exp_and_a : std_logic_vector(0 downto 0);
    signal u0_exp_and_b : std_logic_vector(0 downto 0);
    signal u0_exp_and_q : std_logic_vector(0 downto 0);
    signal u1_exp_and_a : std_logic_vector(0 downto 0);
    signal u1_exp_and_b : std_logic_vector(0 downto 0);
    signal u1_exp_and_q : std_logic_vector(0 downto 0);
    signal u2_exp_and_a : std_logic_vector(0 downto 0);
    signal u2_exp_and_b : std_logic_vector(0 downto 0);
    signal u2_exp_and_q : std_logic_vector(0 downto 0);
    signal u3_exp_and_a : std_logic_vector(0 downto 0);
    signal u3_exp_and_b : std_logic_vector(0 downto 0);
    signal u3_exp_and_q : std_logic_vector(0 downto 0);
    signal u4_exp_and_a : std_logic_vector(0 downto 0);
    signal u4_exp_and_b : std_logic_vector(0 downto 0);
    signal u4_exp_and_q : std_logic_vector(0 downto 0);
    signal u5_exp_and_a : std_logic_vector(0 downto 0);
    signal u5_exp_and_b : std_logic_vector(0 downto 0);
    signal u5_exp_and_q : std_logic_vector(0 downto 0);
    signal u6_exp_and_a : std_logic_vector(0 downto 0);
    signal u6_exp_and_b : std_logic_vector(0 downto 0);
    signal u6_exp_and_q : std_logic_vector(0 downto 0);
    signal u7_exp_and_a : std_logic_vector(0 downto 0);
    signal u7_exp_and_b : std_logic_vector(0 downto 0);
    signal u7_exp_and_q : std_logic_vector(0 downto 0);
    signal u8_exp_and_a : std_logic_vector(0 downto 0);
    signal u8_exp_and_b : std_logic_vector(0 downto 0);
    signal u8_exp_and_q : std_logic_vector(0 downto 0);
    signal u9_exp_and_a : std_logic_vector(0 downto 0);
    signal u9_exp_and_b : std_logic_vector(0 downto 0);
    signal u9_exp_and_q : std_logic_vector(0 downto 0);
    signal u10_exp_and_a : std_logic_vector(0 downto 0);
    signal u10_exp_and_b : std_logic_vector(0 downto 0);
    signal u10_exp_and_q : std_logic_vector(0 downto 0);
    signal u11_exp_and_a : std_logic_vector(0 downto 0);
    signal u11_exp_and_b : std_logic_vector(0 downto 0);
    signal u11_exp_and_q : std_logic_vector(0 downto 0);
    signal u12_exp_and_a : std_logic_vector(0 downto 0);
    signal u12_exp_and_b : std_logic_vector(0 downto 0);
    signal u12_exp_and_q : std_logic_vector(0 downto 0);
    signal u13_exp_and_a : std_logic_vector(0 downto 0);
    signal u13_exp_and_b : std_logic_vector(0 downto 0);
    signal u13_exp_and_q : std_logic_vector(0 downto 0);
    signal u14_exp_and_a : std_logic_vector(0 downto 0);
    signal u14_exp_and_b : std_logic_vector(0 downto 0);
    signal u14_exp_and_q : std_logic_vector(0 downto 0);
    signal u15_exp_and_a : std_logic_vector(0 downto 0);
    signal u15_exp_and_b : std_logic_vector(0 downto 0);
    signal u15_exp_and_q : std_logic_vector(0 downto 0);
begin


	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--xIn(PORTIN,2)@0

	--gainReg(REG,3)@0
    gainReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            gainReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            gainReg_q <= gain_i;
        END IF;
    END PROCESS;


	--u15_exp_and(LOGICAL,131)@3
    u15_exp_and_a <= u15_mux_v;
    u15_exp_and_b <= ld_xIn_v_to_u0_exp_and_b_q;
    u15_exp_and_q <= u15_exp_and_a and u15_exp_and_b;

	--u14_exp_and(LOGICAL,123)@3
    u14_exp_and_a <= u14_mux_v;
    u14_exp_and_b <= ld_xIn_v_to_u0_exp_and_b_q;
    u14_exp_and_q <= u14_exp_and_a and u14_exp_and_b;

	--u13_exp_and(LOGICAL,115)@3
    u13_exp_and_a <= u13_mux_v;
    u13_exp_and_b <= ld_xIn_v_to_u0_exp_and_b_q;
    u13_exp_and_q <= u13_exp_and_a and u13_exp_and_b;

	--u12_exp_and(LOGICAL,107)@3
    u12_exp_and_a <= u12_mux_v;
    u12_exp_and_b <= ld_xIn_v_to_u0_exp_and_b_q;
    u12_exp_and_q <= u12_exp_and_a and u12_exp_and_b;

	--u11_exp_and(LOGICAL,99)@3
    u11_exp_and_a <= u11_mux_v;
    u11_exp_and_b <= ld_xIn_v_to_u0_exp_and_b_q;
    u11_exp_and_q <= u11_exp_and_a and u11_exp_and_b;

	--u10_exp_and(LOGICAL,91)@3
    u10_exp_and_a <= u10_mux_v;
    u10_exp_and_b <= ld_xIn_v_to_u0_exp_and_b_q;
    u10_exp_and_q <= u10_exp_and_a and u10_exp_and_b;

	--u9_exp_and(LOGICAL,83)@3
    u9_exp_and_a <= u9_mux_v;
    u9_exp_and_b <= ld_xIn_v_to_u0_exp_and_b_q;
    u9_exp_and_q <= u9_exp_and_a and u9_exp_and_b;

	--u8_exp_and(LOGICAL,75)@3
    u8_exp_and_a <= u8_mux_v;
    u8_exp_and_b <= ld_xIn_v_to_u0_exp_and_b_q;
    u8_exp_and_q <= u8_exp_and_a and u8_exp_and_b;

	--u7_exp_and(LOGICAL,67)@3
    u7_exp_and_a <= u7_mux_v;
    u7_exp_and_b <= ld_xIn_v_to_u0_exp_and_b_q;
    u7_exp_and_q <= u7_exp_and_a and u7_exp_and_b;

	--u6_exp_and(LOGICAL,59)@3
    u6_exp_and_a <= u6_mux_v;
    u6_exp_and_b <= ld_xIn_v_to_u0_exp_and_b_q;
    u6_exp_and_q <= u6_exp_and_a and u6_exp_and_b;

	--u5_exp_and(LOGICAL,51)@3
    u5_exp_and_a <= u5_mux_v;
    u5_exp_and_b <= ld_xIn_v_to_u0_exp_and_b_q;
    u5_exp_and_q <= u5_exp_and_a and u5_exp_and_b;

	--u4_exp_and(LOGICAL,43)@3
    u4_exp_and_a <= u4_mux_v;
    u4_exp_and_b <= ld_xIn_v_to_u0_exp_and_b_q;
    u4_exp_and_q <= u4_exp_and_a and u4_exp_and_b;

	--u3_exp_and(LOGICAL,35)@3
    u3_exp_and_a <= u3_mux_v;
    u3_exp_and_b <= ld_xIn_v_to_u0_exp_and_b_q;
    u3_exp_and_q <= u3_exp_and_a and u3_exp_and_b;

	--u2_exp_and(LOGICAL,27)@3
    u2_exp_and_a <= u2_mux_v;
    u2_exp_and_b <= ld_xIn_v_to_u0_exp_and_b_q;
    u2_exp_and_q <= u2_exp_and_a and u2_exp_and_b;

	--u1_exp_and(LOGICAL,19)@3
    u1_exp_and_a <= u1_mux_v;
    u1_exp_and_b <= ld_xIn_v_to_u0_exp_and_b_q;
    u1_exp_and_q <= u1_exp_and_a and u1_exp_and_b;

	--u0_exp_and(LOGICAL,11)@3
    u0_exp_and_a <= u0_mux_v;
    u0_exp_and_b <= ld_xIn_v_to_u0_exp_and_b_q;
    u0_exp_and_q <= u0_exp_and_a and u0_exp_and_b;

	--u15_shiftsel(BITSHIFT,124)@0
    u15_shiftsel_q_int <= xIn_15 & "0";
    u15_shiftsel_q <= u15_shiftsel_q_int(34 downto 0);

	--u15_rnd(ROUND,125)@0
    u15_rnd_in <= u15_shiftsel_q;
    u15_rnd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_rnd_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u15_rnd_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u15_rnd_in(34 downto 15)), 20) + SIGNED(STD_LOGIC_VECTOR'("0000000000000000000" & u15_rnd_in(14 downto 14))));
            END IF;
        END IF;
    END PROCESS;


	--ld_u15_rnd_q_to_u15_mux_cc(DELAY,339)@1
    ld_u15_rnd_q_to_u15_mux_cc : dspba_delay
    GENERIC MAP ( width => 20, depth => 1 )
    PORT MAP ( xin => u15_rnd_q, xout => ld_u15_rnd_q_to_u15_mux_cc_q, clk => clk, aclr => areset );

	--u0_highconst(CONSTANT,7)
    u0_highconst_q <= "0111111111111111";

	--GND(CONSTANT,0)
    GND_q <= "0";

	--ld_xIn_v_to_u0_low_e(DELAY,138)@0
    ld_xIn_v_to_u0_low_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => xIn_v, xout => ld_xIn_v_to_u0_low_e_q, clk => clk, aclr => areset );

	--u15_high(COMPARE,129)@1
    u15_high_cin <= GND_q;
    u15_high_a <= STD_LOGIC_VECTOR((21 downto 20 => u15_rnd_q(19)) & u15_rnd_q) & '0';
    u15_high_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_highconst_q(15)) & u0_highconst_q) & u15_high_cin(0);
    u15_high: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_high_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u15_high_o <= STD_LOGIC_VECTOR(SIGNED(u15_high_a) - SIGNED(u15_high_b));
            END IF;
        END IF;
    END PROCESS;
    u15_high_n(0) <= not u15_high_o(22);


	--u0_lowconst(CONSTANT,6)
    u0_lowconst_q <= "1000000000000001";

	--u15_low(COMPARE,128)@1
    u15_low_cin <= GND_q;
    u15_low_a <= STD_LOGIC_VECTOR((21 downto 20 => u15_rnd_q(19)) & u15_rnd_q) & '0';
    u15_low_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_lowconst_q(15)) & u0_lowconst_q) & u15_low_cin(0);
    u15_low: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_low_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u15_low_o <= STD_LOGIC_VECTOR(SIGNED(u15_low_a) - SIGNED(u15_low_b));
            END IF;
        END IF;
    END PROCESS;
    u15_low_c(0) <= u15_low_o(22);


	--ld_xIn_v_to_u0_mux_e(DELAY,141)@0
    ld_xIn_v_to_u0_mux_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => xIn_v, xout => ld_xIn_v_to_u0_mux_e_q, clk => clk, aclr => areset );

	--u15_mux(SELECTOR,130)@2
    u15_mux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u15_mux_q <= (others => '0');
            u15_mux_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_mux_e_q = "1") THEN
                u15_mux_q <= ld_u15_rnd_q_to_u15_mux_cc_q(15 downto 0);
                u15_mux_v <= (others => '0');
                IF (u15_high_n = "1") THEN
                    u15_mux_q <= u0_highconst_q;
                    u15_mux_v <= "1";
                END IF;
                IF (u15_low_c = "1") THEN
                    u15_mux_q <= u0_lowconst_q;
                    u15_mux_v <= "1";
                END IF;
            END IF;
        END IF;
    END PROCESS;


	--u14_shiftsel(BITSHIFT,116)@0
    u14_shiftsel_q_int <= xIn_14 & "0";
    u14_shiftsel_q <= u14_shiftsel_q_int(34 downto 0);

	--u14_rnd(ROUND,117)@0
    u14_rnd_in <= u14_shiftsel_q;
    u14_rnd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_rnd_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u14_rnd_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u14_rnd_in(34 downto 15)), 20) + SIGNED(STD_LOGIC_VECTOR'("0000000000000000000" & u14_rnd_in(14 downto 14))));
            END IF;
        END IF;
    END PROCESS;


	--ld_u14_rnd_q_to_u14_mux_cc(DELAY,326)@1
    ld_u14_rnd_q_to_u14_mux_cc : dspba_delay
    GENERIC MAP ( width => 20, depth => 1 )
    PORT MAP ( xin => u14_rnd_q, xout => ld_u14_rnd_q_to_u14_mux_cc_q, clk => clk, aclr => areset );

	--u14_high(COMPARE,121)@1
    u14_high_cin <= GND_q;
    u14_high_a <= STD_LOGIC_VECTOR((21 downto 20 => u14_rnd_q(19)) & u14_rnd_q) & '0';
    u14_high_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_highconst_q(15)) & u0_highconst_q) & u14_high_cin(0);
    u14_high: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_high_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u14_high_o <= STD_LOGIC_VECTOR(SIGNED(u14_high_a) - SIGNED(u14_high_b));
            END IF;
        END IF;
    END PROCESS;
    u14_high_n(0) <= not u14_high_o(22);


	--u14_low(COMPARE,120)@1
    u14_low_cin <= GND_q;
    u14_low_a <= STD_LOGIC_VECTOR((21 downto 20 => u14_rnd_q(19)) & u14_rnd_q) & '0';
    u14_low_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_lowconst_q(15)) & u0_lowconst_q) & u14_low_cin(0);
    u14_low: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_low_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u14_low_o <= STD_LOGIC_VECTOR(SIGNED(u14_low_a) - SIGNED(u14_low_b));
            END IF;
        END IF;
    END PROCESS;
    u14_low_c(0) <= u14_low_o(22);


	--u14_mux(SELECTOR,122)@2
    u14_mux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u14_mux_q <= (others => '0');
            u14_mux_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_mux_e_q = "1") THEN
                u14_mux_q <= ld_u14_rnd_q_to_u14_mux_cc_q(15 downto 0);
                u14_mux_v <= (others => '0');
                IF (u14_high_n = "1") THEN
                    u14_mux_q <= u0_highconst_q;
                    u14_mux_v <= "1";
                END IF;
                IF (u14_low_c = "1") THEN
                    u14_mux_q <= u0_lowconst_q;
                    u14_mux_v <= "1";
                END IF;
            END IF;
        END IF;
    END PROCESS;


	--u13_shiftsel(BITSHIFT,108)@0
    u13_shiftsel_q_int <= xIn_13 & "0";
    u13_shiftsel_q <= u13_shiftsel_q_int(34 downto 0);

	--u13_rnd(ROUND,109)@0
    u13_rnd_in <= u13_shiftsel_q;
    u13_rnd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_rnd_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u13_rnd_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u13_rnd_in(34 downto 15)), 20) + SIGNED(STD_LOGIC_VECTOR'("0000000000000000000" & u13_rnd_in(14 downto 14))));
            END IF;
        END IF;
    END PROCESS;


	--ld_u13_rnd_q_to_u13_mux_cc(DELAY,313)@1
    ld_u13_rnd_q_to_u13_mux_cc : dspba_delay
    GENERIC MAP ( width => 20, depth => 1 )
    PORT MAP ( xin => u13_rnd_q, xout => ld_u13_rnd_q_to_u13_mux_cc_q, clk => clk, aclr => areset );

	--u13_high(COMPARE,113)@1
    u13_high_cin <= GND_q;
    u13_high_a <= STD_LOGIC_VECTOR((21 downto 20 => u13_rnd_q(19)) & u13_rnd_q) & '0';
    u13_high_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_highconst_q(15)) & u0_highconst_q) & u13_high_cin(0);
    u13_high: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_high_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u13_high_o <= STD_LOGIC_VECTOR(SIGNED(u13_high_a) - SIGNED(u13_high_b));
            END IF;
        END IF;
    END PROCESS;
    u13_high_n(0) <= not u13_high_o(22);


	--u13_low(COMPARE,112)@1
    u13_low_cin <= GND_q;
    u13_low_a <= STD_LOGIC_VECTOR((21 downto 20 => u13_rnd_q(19)) & u13_rnd_q) & '0';
    u13_low_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_lowconst_q(15)) & u0_lowconst_q) & u13_low_cin(0);
    u13_low: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_low_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u13_low_o <= STD_LOGIC_VECTOR(SIGNED(u13_low_a) - SIGNED(u13_low_b));
            END IF;
        END IF;
    END PROCESS;
    u13_low_c(0) <= u13_low_o(22);


	--u13_mux(SELECTOR,114)@2
    u13_mux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u13_mux_q <= (others => '0');
            u13_mux_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_mux_e_q = "1") THEN
                u13_mux_q <= ld_u13_rnd_q_to_u13_mux_cc_q(15 downto 0);
                u13_mux_v <= (others => '0');
                IF (u13_high_n = "1") THEN
                    u13_mux_q <= u0_highconst_q;
                    u13_mux_v <= "1";
                END IF;
                IF (u13_low_c = "1") THEN
                    u13_mux_q <= u0_lowconst_q;
                    u13_mux_v <= "1";
                END IF;
            END IF;
        END IF;
    END PROCESS;


	--u12_shiftsel(BITSHIFT,100)@0
    u12_shiftsel_q_int <= xIn_12 & "0";
    u12_shiftsel_q <= u12_shiftsel_q_int(34 downto 0);

	--u12_rnd(ROUND,101)@0
    u12_rnd_in <= u12_shiftsel_q;
    u12_rnd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_rnd_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u12_rnd_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u12_rnd_in(34 downto 15)), 20) + SIGNED(STD_LOGIC_VECTOR'("0000000000000000000" & u12_rnd_in(14 downto 14))));
            END IF;
        END IF;
    END PROCESS;


	--ld_u12_rnd_q_to_u12_mux_cc(DELAY,300)@1
    ld_u12_rnd_q_to_u12_mux_cc : dspba_delay
    GENERIC MAP ( width => 20, depth => 1 )
    PORT MAP ( xin => u12_rnd_q, xout => ld_u12_rnd_q_to_u12_mux_cc_q, clk => clk, aclr => areset );

	--u12_high(COMPARE,105)@1
    u12_high_cin <= GND_q;
    u12_high_a <= STD_LOGIC_VECTOR((21 downto 20 => u12_rnd_q(19)) & u12_rnd_q) & '0';
    u12_high_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_highconst_q(15)) & u0_highconst_q) & u12_high_cin(0);
    u12_high: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_high_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u12_high_o <= STD_LOGIC_VECTOR(SIGNED(u12_high_a) - SIGNED(u12_high_b));
            END IF;
        END IF;
    END PROCESS;
    u12_high_n(0) <= not u12_high_o(22);


	--u12_low(COMPARE,104)@1
    u12_low_cin <= GND_q;
    u12_low_a <= STD_LOGIC_VECTOR((21 downto 20 => u12_rnd_q(19)) & u12_rnd_q) & '0';
    u12_low_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_lowconst_q(15)) & u0_lowconst_q) & u12_low_cin(0);
    u12_low: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_low_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u12_low_o <= STD_LOGIC_VECTOR(SIGNED(u12_low_a) - SIGNED(u12_low_b));
            END IF;
        END IF;
    END PROCESS;
    u12_low_c(0) <= u12_low_o(22);


	--u12_mux(SELECTOR,106)@2
    u12_mux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u12_mux_q <= (others => '0');
            u12_mux_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_mux_e_q = "1") THEN
                u12_mux_q <= ld_u12_rnd_q_to_u12_mux_cc_q(15 downto 0);
                u12_mux_v <= (others => '0');
                IF (u12_high_n = "1") THEN
                    u12_mux_q <= u0_highconst_q;
                    u12_mux_v <= "1";
                END IF;
                IF (u12_low_c = "1") THEN
                    u12_mux_q <= u0_lowconst_q;
                    u12_mux_v <= "1";
                END IF;
            END IF;
        END IF;
    END PROCESS;


	--u11_shiftsel(BITSHIFT,92)@0
    u11_shiftsel_q_int <= xIn_11 & "0";
    u11_shiftsel_q <= u11_shiftsel_q_int(34 downto 0);

	--u11_rnd(ROUND,93)@0
    u11_rnd_in <= u11_shiftsel_q;
    u11_rnd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_rnd_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u11_rnd_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u11_rnd_in(34 downto 15)), 20) + SIGNED(STD_LOGIC_VECTOR'("0000000000000000000" & u11_rnd_in(14 downto 14))));
            END IF;
        END IF;
    END PROCESS;


	--ld_u11_rnd_q_to_u11_mux_cc(DELAY,287)@1
    ld_u11_rnd_q_to_u11_mux_cc : dspba_delay
    GENERIC MAP ( width => 20, depth => 1 )
    PORT MAP ( xin => u11_rnd_q, xout => ld_u11_rnd_q_to_u11_mux_cc_q, clk => clk, aclr => areset );

	--u11_high(COMPARE,97)@1
    u11_high_cin <= GND_q;
    u11_high_a <= STD_LOGIC_VECTOR((21 downto 20 => u11_rnd_q(19)) & u11_rnd_q) & '0';
    u11_high_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_highconst_q(15)) & u0_highconst_q) & u11_high_cin(0);
    u11_high: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_high_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u11_high_o <= STD_LOGIC_VECTOR(SIGNED(u11_high_a) - SIGNED(u11_high_b));
            END IF;
        END IF;
    END PROCESS;
    u11_high_n(0) <= not u11_high_o(22);


	--u11_low(COMPARE,96)@1
    u11_low_cin <= GND_q;
    u11_low_a <= STD_LOGIC_VECTOR((21 downto 20 => u11_rnd_q(19)) & u11_rnd_q) & '0';
    u11_low_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_lowconst_q(15)) & u0_lowconst_q) & u11_low_cin(0);
    u11_low: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_low_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u11_low_o <= STD_LOGIC_VECTOR(SIGNED(u11_low_a) - SIGNED(u11_low_b));
            END IF;
        END IF;
    END PROCESS;
    u11_low_c(0) <= u11_low_o(22);


	--u11_mux(SELECTOR,98)@2
    u11_mux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u11_mux_q <= (others => '0');
            u11_mux_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_mux_e_q = "1") THEN
                u11_mux_q <= ld_u11_rnd_q_to_u11_mux_cc_q(15 downto 0);
                u11_mux_v <= (others => '0');
                IF (u11_high_n = "1") THEN
                    u11_mux_q <= u0_highconst_q;
                    u11_mux_v <= "1";
                END IF;
                IF (u11_low_c = "1") THEN
                    u11_mux_q <= u0_lowconst_q;
                    u11_mux_v <= "1";
                END IF;
            END IF;
        END IF;
    END PROCESS;


	--u10_shiftsel(BITSHIFT,84)@0
    u10_shiftsel_q_int <= xIn_10 & "0";
    u10_shiftsel_q <= u10_shiftsel_q_int(34 downto 0);

	--u10_rnd(ROUND,85)@0
    u10_rnd_in <= u10_shiftsel_q;
    u10_rnd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_rnd_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u10_rnd_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u10_rnd_in(34 downto 15)), 20) + SIGNED(STD_LOGIC_VECTOR'("0000000000000000000" & u10_rnd_in(14 downto 14))));
            END IF;
        END IF;
    END PROCESS;


	--ld_u10_rnd_q_to_u10_mux_cc(DELAY,274)@1
    ld_u10_rnd_q_to_u10_mux_cc : dspba_delay
    GENERIC MAP ( width => 20, depth => 1 )
    PORT MAP ( xin => u10_rnd_q, xout => ld_u10_rnd_q_to_u10_mux_cc_q, clk => clk, aclr => areset );

	--u10_high(COMPARE,89)@1
    u10_high_cin <= GND_q;
    u10_high_a <= STD_LOGIC_VECTOR((21 downto 20 => u10_rnd_q(19)) & u10_rnd_q) & '0';
    u10_high_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_highconst_q(15)) & u0_highconst_q) & u10_high_cin(0);
    u10_high: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_high_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u10_high_o <= STD_LOGIC_VECTOR(SIGNED(u10_high_a) - SIGNED(u10_high_b));
            END IF;
        END IF;
    END PROCESS;
    u10_high_n(0) <= not u10_high_o(22);


	--u10_low(COMPARE,88)@1
    u10_low_cin <= GND_q;
    u10_low_a <= STD_LOGIC_VECTOR((21 downto 20 => u10_rnd_q(19)) & u10_rnd_q) & '0';
    u10_low_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_lowconst_q(15)) & u0_lowconst_q) & u10_low_cin(0);
    u10_low: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_low_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u10_low_o <= STD_LOGIC_VECTOR(SIGNED(u10_low_a) - SIGNED(u10_low_b));
            END IF;
        END IF;
    END PROCESS;
    u10_low_c(0) <= u10_low_o(22);


	--u10_mux(SELECTOR,90)@2
    u10_mux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u10_mux_q <= (others => '0');
            u10_mux_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_mux_e_q = "1") THEN
                u10_mux_q <= ld_u10_rnd_q_to_u10_mux_cc_q(15 downto 0);
                u10_mux_v <= (others => '0');
                IF (u10_high_n = "1") THEN
                    u10_mux_q <= u0_highconst_q;
                    u10_mux_v <= "1";
                END IF;
                IF (u10_low_c = "1") THEN
                    u10_mux_q <= u0_lowconst_q;
                    u10_mux_v <= "1";
                END IF;
            END IF;
        END IF;
    END PROCESS;


	--u9_shiftsel(BITSHIFT,76)@0
    u9_shiftsel_q_int <= xIn_9 & "0";
    u9_shiftsel_q <= u9_shiftsel_q_int(34 downto 0);

	--u9_rnd(ROUND,77)@0
    u9_rnd_in <= u9_shiftsel_q;
    u9_rnd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_rnd_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u9_rnd_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u9_rnd_in(34 downto 15)), 20) + SIGNED(STD_LOGIC_VECTOR'("0000000000000000000" & u9_rnd_in(14 downto 14))));
            END IF;
        END IF;
    END PROCESS;


	--ld_u9_rnd_q_to_u9_mux_cc(DELAY,261)@1
    ld_u9_rnd_q_to_u9_mux_cc : dspba_delay
    GENERIC MAP ( width => 20, depth => 1 )
    PORT MAP ( xin => u9_rnd_q, xout => ld_u9_rnd_q_to_u9_mux_cc_q, clk => clk, aclr => areset );

	--u9_high(COMPARE,81)@1
    u9_high_cin <= GND_q;
    u9_high_a <= STD_LOGIC_VECTOR((21 downto 20 => u9_rnd_q(19)) & u9_rnd_q) & '0';
    u9_high_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_highconst_q(15)) & u0_highconst_q) & u9_high_cin(0);
    u9_high: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_high_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u9_high_o <= STD_LOGIC_VECTOR(SIGNED(u9_high_a) - SIGNED(u9_high_b));
            END IF;
        END IF;
    END PROCESS;
    u9_high_n(0) <= not u9_high_o(22);


	--u9_low(COMPARE,80)@1
    u9_low_cin <= GND_q;
    u9_low_a <= STD_LOGIC_VECTOR((21 downto 20 => u9_rnd_q(19)) & u9_rnd_q) & '0';
    u9_low_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_lowconst_q(15)) & u0_lowconst_q) & u9_low_cin(0);
    u9_low: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_low_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u9_low_o <= STD_LOGIC_VECTOR(SIGNED(u9_low_a) - SIGNED(u9_low_b));
            END IF;
        END IF;
    END PROCESS;
    u9_low_c(0) <= u9_low_o(22);


	--u9_mux(SELECTOR,82)@2
    u9_mux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u9_mux_q <= (others => '0');
            u9_mux_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_mux_e_q = "1") THEN
                u9_mux_q <= ld_u9_rnd_q_to_u9_mux_cc_q(15 downto 0);
                u9_mux_v <= (others => '0');
                IF (u9_high_n = "1") THEN
                    u9_mux_q <= u0_highconst_q;
                    u9_mux_v <= "1";
                END IF;
                IF (u9_low_c = "1") THEN
                    u9_mux_q <= u0_lowconst_q;
                    u9_mux_v <= "1";
                END IF;
            END IF;
        END IF;
    END PROCESS;


	--u8_shiftsel(BITSHIFT,68)@0
    u8_shiftsel_q_int <= xIn_8 & "0";
    u8_shiftsel_q <= u8_shiftsel_q_int(34 downto 0);

	--u8_rnd(ROUND,69)@0
    u8_rnd_in <= u8_shiftsel_q;
    u8_rnd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_rnd_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u8_rnd_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u8_rnd_in(34 downto 15)), 20) + SIGNED(STD_LOGIC_VECTOR'("0000000000000000000" & u8_rnd_in(14 downto 14))));
            END IF;
        END IF;
    END PROCESS;


	--ld_u8_rnd_q_to_u8_mux_cc(DELAY,248)@1
    ld_u8_rnd_q_to_u8_mux_cc : dspba_delay
    GENERIC MAP ( width => 20, depth => 1 )
    PORT MAP ( xin => u8_rnd_q, xout => ld_u8_rnd_q_to_u8_mux_cc_q, clk => clk, aclr => areset );

	--u8_high(COMPARE,73)@1
    u8_high_cin <= GND_q;
    u8_high_a <= STD_LOGIC_VECTOR((21 downto 20 => u8_rnd_q(19)) & u8_rnd_q) & '0';
    u8_high_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_highconst_q(15)) & u0_highconst_q) & u8_high_cin(0);
    u8_high: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_high_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u8_high_o <= STD_LOGIC_VECTOR(SIGNED(u8_high_a) - SIGNED(u8_high_b));
            END IF;
        END IF;
    END PROCESS;
    u8_high_n(0) <= not u8_high_o(22);


	--u8_low(COMPARE,72)@1
    u8_low_cin <= GND_q;
    u8_low_a <= STD_LOGIC_VECTOR((21 downto 20 => u8_rnd_q(19)) & u8_rnd_q) & '0';
    u8_low_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_lowconst_q(15)) & u0_lowconst_q) & u8_low_cin(0);
    u8_low: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_low_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u8_low_o <= STD_LOGIC_VECTOR(SIGNED(u8_low_a) - SIGNED(u8_low_b));
            END IF;
        END IF;
    END PROCESS;
    u8_low_c(0) <= u8_low_o(22);


	--u8_mux(SELECTOR,74)@2
    u8_mux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u8_mux_q <= (others => '0');
            u8_mux_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_mux_e_q = "1") THEN
                u8_mux_q <= ld_u8_rnd_q_to_u8_mux_cc_q(15 downto 0);
                u8_mux_v <= (others => '0');
                IF (u8_high_n = "1") THEN
                    u8_mux_q <= u0_highconst_q;
                    u8_mux_v <= "1";
                END IF;
                IF (u8_low_c = "1") THEN
                    u8_mux_q <= u0_lowconst_q;
                    u8_mux_v <= "1";
                END IF;
            END IF;
        END IF;
    END PROCESS;


	--u7_shiftsel(BITSHIFT,60)@0
    u7_shiftsel_q_int <= xIn_7 & "0";
    u7_shiftsel_q <= u7_shiftsel_q_int(34 downto 0);

	--u7_rnd(ROUND,61)@0
    u7_rnd_in <= u7_shiftsel_q;
    u7_rnd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_rnd_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u7_rnd_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u7_rnd_in(34 downto 15)), 20) + SIGNED(STD_LOGIC_VECTOR'("0000000000000000000" & u7_rnd_in(14 downto 14))));
            END IF;
        END IF;
    END PROCESS;


	--ld_u7_rnd_q_to_u7_mux_cc(DELAY,235)@1
    ld_u7_rnd_q_to_u7_mux_cc : dspba_delay
    GENERIC MAP ( width => 20, depth => 1 )
    PORT MAP ( xin => u7_rnd_q, xout => ld_u7_rnd_q_to_u7_mux_cc_q, clk => clk, aclr => areset );

	--u7_high(COMPARE,65)@1
    u7_high_cin <= GND_q;
    u7_high_a <= STD_LOGIC_VECTOR((21 downto 20 => u7_rnd_q(19)) & u7_rnd_q) & '0';
    u7_high_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_highconst_q(15)) & u0_highconst_q) & u7_high_cin(0);
    u7_high: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_high_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u7_high_o <= STD_LOGIC_VECTOR(SIGNED(u7_high_a) - SIGNED(u7_high_b));
            END IF;
        END IF;
    END PROCESS;
    u7_high_n(0) <= not u7_high_o(22);


	--u7_low(COMPARE,64)@1
    u7_low_cin <= GND_q;
    u7_low_a <= STD_LOGIC_VECTOR((21 downto 20 => u7_rnd_q(19)) & u7_rnd_q) & '0';
    u7_low_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_lowconst_q(15)) & u0_lowconst_q) & u7_low_cin(0);
    u7_low: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_low_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u7_low_o <= STD_LOGIC_VECTOR(SIGNED(u7_low_a) - SIGNED(u7_low_b));
            END IF;
        END IF;
    END PROCESS;
    u7_low_c(0) <= u7_low_o(22);


	--u7_mux(SELECTOR,66)@2
    u7_mux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_mux_q <= (others => '0');
            u7_mux_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_mux_e_q = "1") THEN
                u7_mux_q <= ld_u7_rnd_q_to_u7_mux_cc_q(15 downto 0);
                u7_mux_v <= (others => '0');
                IF (u7_high_n = "1") THEN
                    u7_mux_q <= u0_highconst_q;
                    u7_mux_v <= "1";
                END IF;
                IF (u7_low_c = "1") THEN
                    u7_mux_q <= u0_lowconst_q;
                    u7_mux_v <= "1";
                END IF;
            END IF;
        END IF;
    END PROCESS;


	--u6_shiftsel(BITSHIFT,52)@0
    u6_shiftsel_q_int <= xIn_6 & "0";
    u6_shiftsel_q <= u6_shiftsel_q_int(34 downto 0);

	--u6_rnd(ROUND,53)@0
    u6_rnd_in <= u6_shiftsel_q;
    u6_rnd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_rnd_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u6_rnd_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u6_rnd_in(34 downto 15)), 20) + SIGNED(STD_LOGIC_VECTOR'("0000000000000000000" & u6_rnd_in(14 downto 14))));
            END IF;
        END IF;
    END PROCESS;


	--ld_u6_rnd_q_to_u6_mux_cc(DELAY,222)@1
    ld_u6_rnd_q_to_u6_mux_cc : dspba_delay
    GENERIC MAP ( width => 20, depth => 1 )
    PORT MAP ( xin => u6_rnd_q, xout => ld_u6_rnd_q_to_u6_mux_cc_q, clk => clk, aclr => areset );

	--u6_high(COMPARE,57)@1
    u6_high_cin <= GND_q;
    u6_high_a <= STD_LOGIC_VECTOR((21 downto 20 => u6_rnd_q(19)) & u6_rnd_q) & '0';
    u6_high_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_highconst_q(15)) & u0_highconst_q) & u6_high_cin(0);
    u6_high: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_high_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u6_high_o <= STD_LOGIC_VECTOR(SIGNED(u6_high_a) - SIGNED(u6_high_b));
            END IF;
        END IF;
    END PROCESS;
    u6_high_n(0) <= not u6_high_o(22);


	--u6_low(COMPARE,56)@1
    u6_low_cin <= GND_q;
    u6_low_a <= STD_LOGIC_VECTOR((21 downto 20 => u6_rnd_q(19)) & u6_rnd_q) & '0';
    u6_low_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_lowconst_q(15)) & u0_lowconst_q) & u6_low_cin(0);
    u6_low: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_low_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u6_low_o <= STD_LOGIC_VECTOR(SIGNED(u6_low_a) - SIGNED(u6_low_b));
            END IF;
        END IF;
    END PROCESS;
    u6_low_c(0) <= u6_low_o(22);


	--u6_mux(SELECTOR,58)@2
    u6_mux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_mux_q <= (others => '0');
            u6_mux_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_mux_e_q = "1") THEN
                u6_mux_q <= ld_u6_rnd_q_to_u6_mux_cc_q(15 downto 0);
                u6_mux_v <= (others => '0');
                IF (u6_high_n = "1") THEN
                    u6_mux_q <= u0_highconst_q;
                    u6_mux_v <= "1";
                END IF;
                IF (u6_low_c = "1") THEN
                    u6_mux_q <= u0_lowconst_q;
                    u6_mux_v <= "1";
                END IF;
            END IF;
        END IF;
    END PROCESS;


	--u5_shiftsel(BITSHIFT,44)@0
    u5_shiftsel_q_int <= xIn_5 & "0";
    u5_shiftsel_q <= u5_shiftsel_q_int(34 downto 0);

	--u5_rnd(ROUND,45)@0
    u5_rnd_in <= u5_shiftsel_q;
    u5_rnd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_rnd_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u5_rnd_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u5_rnd_in(34 downto 15)), 20) + SIGNED(STD_LOGIC_VECTOR'("0000000000000000000" & u5_rnd_in(14 downto 14))));
            END IF;
        END IF;
    END PROCESS;


	--ld_u5_rnd_q_to_u5_mux_cc(DELAY,209)@1
    ld_u5_rnd_q_to_u5_mux_cc : dspba_delay
    GENERIC MAP ( width => 20, depth => 1 )
    PORT MAP ( xin => u5_rnd_q, xout => ld_u5_rnd_q_to_u5_mux_cc_q, clk => clk, aclr => areset );

	--u5_high(COMPARE,49)@1
    u5_high_cin <= GND_q;
    u5_high_a <= STD_LOGIC_VECTOR((21 downto 20 => u5_rnd_q(19)) & u5_rnd_q) & '0';
    u5_high_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_highconst_q(15)) & u0_highconst_q) & u5_high_cin(0);
    u5_high: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_high_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u5_high_o <= STD_LOGIC_VECTOR(SIGNED(u5_high_a) - SIGNED(u5_high_b));
            END IF;
        END IF;
    END PROCESS;
    u5_high_n(0) <= not u5_high_o(22);


	--u5_low(COMPARE,48)@1
    u5_low_cin <= GND_q;
    u5_low_a <= STD_LOGIC_VECTOR((21 downto 20 => u5_rnd_q(19)) & u5_rnd_q) & '0';
    u5_low_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_lowconst_q(15)) & u0_lowconst_q) & u5_low_cin(0);
    u5_low: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_low_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u5_low_o <= STD_LOGIC_VECTOR(SIGNED(u5_low_a) - SIGNED(u5_low_b));
            END IF;
        END IF;
    END PROCESS;
    u5_low_c(0) <= u5_low_o(22);


	--u5_mux(SELECTOR,50)@2
    u5_mux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_mux_q <= (others => '0');
            u5_mux_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_mux_e_q = "1") THEN
                u5_mux_q <= ld_u5_rnd_q_to_u5_mux_cc_q(15 downto 0);
                u5_mux_v <= (others => '0');
                IF (u5_high_n = "1") THEN
                    u5_mux_q <= u0_highconst_q;
                    u5_mux_v <= "1";
                END IF;
                IF (u5_low_c = "1") THEN
                    u5_mux_q <= u0_lowconst_q;
                    u5_mux_v <= "1";
                END IF;
            END IF;
        END IF;
    END PROCESS;


	--u4_shiftsel(BITSHIFT,36)@0
    u4_shiftsel_q_int <= xIn_4 & "0";
    u4_shiftsel_q <= u4_shiftsel_q_int(34 downto 0);

	--u4_rnd(ROUND,37)@0
    u4_rnd_in <= u4_shiftsel_q;
    u4_rnd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_rnd_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u4_rnd_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u4_rnd_in(34 downto 15)), 20) + SIGNED(STD_LOGIC_VECTOR'("0000000000000000000" & u4_rnd_in(14 downto 14))));
            END IF;
        END IF;
    END PROCESS;


	--ld_u4_rnd_q_to_u4_mux_cc(DELAY,196)@1
    ld_u4_rnd_q_to_u4_mux_cc : dspba_delay
    GENERIC MAP ( width => 20, depth => 1 )
    PORT MAP ( xin => u4_rnd_q, xout => ld_u4_rnd_q_to_u4_mux_cc_q, clk => clk, aclr => areset );

	--u4_high(COMPARE,41)@1
    u4_high_cin <= GND_q;
    u4_high_a <= STD_LOGIC_VECTOR((21 downto 20 => u4_rnd_q(19)) & u4_rnd_q) & '0';
    u4_high_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_highconst_q(15)) & u0_highconst_q) & u4_high_cin(0);
    u4_high: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_high_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u4_high_o <= STD_LOGIC_VECTOR(SIGNED(u4_high_a) - SIGNED(u4_high_b));
            END IF;
        END IF;
    END PROCESS;
    u4_high_n(0) <= not u4_high_o(22);


	--u4_low(COMPARE,40)@1
    u4_low_cin <= GND_q;
    u4_low_a <= STD_LOGIC_VECTOR((21 downto 20 => u4_rnd_q(19)) & u4_rnd_q) & '0';
    u4_low_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_lowconst_q(15)) & u0_lowconst_q) & u4_low_cin(0);
    u4_low: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_low_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u4_low_o <= STD_LOGIC_VECTOR(SIGNED(u4_low_a) - SIGNED(u4_low_b));
            END IF;
        END IF;
    END PROCESS;
    u4_low_c(0) <= u4_low_o(22);


	--u4_mux(SELECTOR,42)@2
    u4_mux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_mux_q <= (others => '0');
            u4_mux_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_mux_e_q = "1") THEN
                u4_mux_q <= ld_u4_rnd_q_to_u4_mux_cc_q(15 downto 0);
                u4_mux_v <= (others => '0');
                IF (u4_high_n = "1") THEN
                    u4_mux_q <= u0_highconst_q;
                    u4_mux_v <= "1";
                END IF;
                IF (u4_low_c = "1") THEN
                    u4_mux_q <= u0_lowconst_q;
                    u4_mux_v <= "1";
                END IF;
            END IF;
        END IF;
    END PROCESS;


	--u3_shiftsel(BITSHIFT,28)@0
    u3_shiftsel_q_int <= xIn_3 & "0";
    u3_shiftsel_q <= u3_shiftsel_q_int(34 downto 0);

	--u3_rnd(ROUND,29)@0
    u3_rnd_in <= u3_shiftsel_q;
    u3_rnd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_rnd_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u3_rnd_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u3_rnd_in(34 downto 15)), 20) + SIGNED(STD_LOGIC_VECTOR'("0000000000000000000" & u3_rnd_in(14 downto 14))));
            END IF;
        END IF;
    END PROCESS;


	--ld_u3_rnd_q_to_u3_mux_cc(DELAY,183)@1
    ld_u3_rnd_q_to_u3_mux_cc : dspba_delay
    GENERIC MAP ( width => 20, depth => 1 )
    PORT MAP ( xin => u3_rnd_q, xout => ld_u3_rnd_q_to_u3_mux_cc_q, clk => clk, aclr => areset );

	--u3_high(COMPARE,33)@1
    u3_high_cin <= GND_q;
    u3_high_a <= STD_LOGIC_VECTOR((21 downto 20 => u3_rnd_q(19)) & u3_rnd_q) & '0';
    u3_high_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_highconst_q(15)) & u0_highconst_q) & u3_high_cin(0);
    u3_high: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_high_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u3_high_o <= STD_LOGIC_VECTOR(SIGNED(u3_high_a) - SIGNED(u3_high_b));
            END IF;
        END IF;
    END PROCESS;
    u3_high_n(0) <= not u3_high_o(22);


	--u3_low(COMPARE,32)@1
    u3_low_cin <= GND_q;
    u3_low_a <= STD_LOGIC_VECTOR((21 downto 20 => u3_rnd_q(19)) & u3_rnd_q) & '0';
    u3_low_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_lowconst_q(15)) & u0_lowconst_q) & u3_low_cin(0);
    u3_low: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_low_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u3_low_o <= STD_LOGIC_VECTOR(SIGNED(u3_low_a) - SIGNED(u3_low_b));
            END IF;
        END IF;
    END PROCESS;
    u3_low_c(0) <= u3_low_o(22);


	--u3_mux(SELECTOR,34)@2
    u3_mux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_mux_q <= (others => '0');
            u3_mux_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_mux_e_q = "1") THEN
                u3_mux_q <= ld_u3_rnd_q_to_u3_mux_cc_q(15 downto 0);
                u3_mux_v <= (others => '0');
                IF (u3_high_n = "1") THEN
                    u3_mux_q <= u0_highconst_q;
                    u3_mux_v <= "1";
                END IF;
                IF (u3_low_c = "1") THEN
                    u3_mux_q <= u0_lowconst_q;
                    u3_mux_v <= "1";
                END IF;
            END IF;
        END IF;
    END PROCESS;


	--u2_shiftsel(BITSHIFT,20)@0
    u2_shiftsel_q_int <= xIn_2 & "0";
    u2_shiftsel_q <= u2_shiftsel_q_int(34 downto 0);

	--u2_rnd(ROUND,21)@0
    u2_rnd_in <= u2_shiftsel_q;
    u2_rnd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_rnd_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u2_rnd_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u2_rnd_in(34 downto 15)), 20) + SIGNED(STD_LOGIC_VECTOR'("0000000000000000000" & u2_rnd_in(14 downto 14))));
            END IF;
        END IF;
    END PROCESS;


	--ld_u2_rnd_q_to_u2_mux_cc(DELAY,170)@1
    ld_u2_rnd_q_to_u2_mux_cc : dspba_delay
    GENERIC MAP ( width => 20, depth => 1 )
    PORT MAP ( xin => u2_rnd_q, xout => ld_u2_rnd_q_to_u2_mux_cc_q, clk => clk, aclr => areset );

	--u2_high(COMPARE,25)@1
    u2_high_cin <= GND_q;
    u2_high_a <= STD_LOGIC_VECTOR((21 downto 20 => u2_rnd_q(19)) & u2_rnd_q) & '0';
    u2_high_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_highconst_q(15)) & u0_highconst_q) & u2_high_cin(0);
    u2_high: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_high_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u2_high_o <= STD_LOGIC_VECTOR(SIGNED(u2_high_a) - SIGNED(u2_high_b));
            END IF;
        END IF;
    END PROCESS;
    u2_high_n(0) <= not u2_high_o(22);


	--u2_low(COMPARE,24)@1
    u2_low_cin <= GND_q;
    u2_low_a <= STD_LOGIC_VECTOR((21 downto 20 => u2_rnd_q(19)) & u2_rnd_q) & '0';
    u2_low_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_lowconst_q(15)) & u0_lowconst_q) & u2_low_cin(0);
    u2_low: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_low_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u2_low_o <= STD_LOGIC_VECTOR(SIGNED(u2_low_a) - SIGNED(u2_low_b));
            END IF;
        END IF;
    END PROCESS;
    u2_low_c(0) <= u2_low_o(22);


	--u2_mux(SELECTOR,26)@2
    u2_mux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_mux_q <= (others => '0');
            u2_mux_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_mux_e_q = "1") THEN
                u2_mux_q <= ld_u2_rnd_q_to_u2_mux_cc_q(15 downto 0);
                u2_mux_v <= (others => '0');
                IF (u2_high_n = "1") THEN
                    u2_mux_q <= u0_highconst_q;
                    u2_mux_v <= "1";
                END IF;
                IF (u2_low_c = "1") THEN
                    u2_mux_q <= u0_lowconst_q;
                    u2_mux_v <= "1";
                END IF;
            END IF;
        END IF;
    END PROCESS;


	--u1_shiftsel(BITSHIFT,12)@0
    u1_shiftsel_q_int <= xIn_1 & "0";
    u1_shiftsel_q <= u1_shiftsel_q_int(34 downto 0);

	--u1_rnd(ROUND,13)@0
    u1_rnd_in <= u1_shiftsel_q;
    u1_rnd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_rnd_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u1_rnd_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u1_rnd_in(34 downto 15)), 20) + SIGNED(STD_LOGIC_VECTOR'("0000000000000000000" & u1_rnd_in(14 downto 14))));
            END IF;
        END IF;
    END PROCESS;


	--ld_u1_rnd_q_to_u1_mux_cc(DELAY,157)@1
    ld_u1_rnd_q_to_u1_mux_cc : dspba_delay
    GENERIC MAP ( width => 20, depth => 1 )
    PORT MAP ( xin => u1_rnd_q, xout => ld_u1_rnd_q_to_u1_mux_cc_q, clk => clk, aclr => areset );

	--u1_high(COMPARE,17)@1
    u1_high_cin <= GND_q;
    u1_high_a <= STD_LOGIC_VECTOR((21 downto 20 => u1_rnd_q(19)) & u1_rnd_q) & '0';
    u1_high_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_highconst_q(15)) & u0_highconst_q) & u1_high_cin(0);
    u1_high: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_high_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u1_high_o <= STD_LOGIC_VECTOR(SIGNED(u1_high_a) - SIGNED(u1_high_b));
            END IF;
        END IF;
    END PROCESS;
    u1_high_n(0) <= not u1_high_o(22);


	--u1_low(COMPARE,16)@1
    u1_low_cin <= GND_q;
    u1_low_a <= STD_LOGIC_VECTOR((21 downto 20 => u1_rnd_q(19)) & u1_rnd_q) & '0';
    u1_low_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_lowconst_q(15)) & u0_lowconst_q) & u1_low_cin(0);
    u1_low: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_low_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u1_low_o <= STD_LOGIC_VECTOR(SIGNED(u1_low_a) - SIGNED(u1_low_b));
            END IF;
        END IF;
    END PROCESS;
    u1_low_c(0) <= u1_low_o(22);


	--u1_mux(SELECTOR,18)@2
    u1_mux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_mux_q <= (others => '0');
            u1_mux_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_mux_e_q = "1") THEN
                u1_mux_q <= ld_u1_rnd_q_to_u1_mux_cc_q(15 downto 0);
                u1_mux_v <= (others => '0');
                IF (u1_high_n = "1") THEN
                    u1_mux_q <= u0_highconst_q;
                    u1_mux_v <= "1";
                END IF;
                IF (u1_low_c = "1") THEN
                    u1_mux_q <= u0_lowconst_q;
                    u1_mux_v <= "1";
                END IF;
            END IF;
        END IF;
    END PROCESS;


	--u0_shiftsel(BITSHIFT,4)@0
    u0_shiftsel_q_int <= xIn_0 & "0";
    u0_shiftsel_q <= u0_shiftsel_q_int(34 downto 0);

	--u0_rnd(ROUND,5)@0
    u0_rnd_in <= u0_shiftsel_q;
    u0_rnd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_rnd_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_rnd_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_rnd_in(34 downto 15)), 20) + SIGNED(STD_LOGIC_VECTOR'("0000000000000000000" & u0_rnd_in(14 downto 14))));
            END IF;
        END IF;
    END PROCESS;


	--ld_u0_rnd_q_to_u0_mux_cc(DELAY,144)@1
    ld_u0_rnd_q_to_u0_mux_cc : dspba_delay
    GENERIC MAP ( width => 20, depth => 1 )
    PORT MAP ( xin => u0_rnd_q, xout => ld_u0_rnd_q_to_u0_mux_cc_q, clk => clk, aclr => areset );

	--u0_high(COMPARE,9)@1
    u0_high_cin <= GND_q;
    u0_high_a <= STD_LOGIC_VECTOR((21 downto 20 => u0_rnd_q(19)) & u0_rnd_q) & '0';
    u0_high_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_highconst_q(15)) & u0_highconst_q) & u0_high_cin(0);
    u0_high: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_high_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u0_high_o <= STD_LOGIC_VECTOR(SIGNED(u0_high_a) - SIGNED(u0_high_b));
            END IF;
        END IF;
    END PROCESS;
    u0_high_n(0) <= not u0_high_o(22);


	--u0_low(COMPARE,8)@1
    u0_low_cin <= GND_q;
    u0_low_a <= STD_LOGIC_VECTOR((21 downto 20 => u0_rnd_q(19)) & u0_rnd_q) & '0';
    u0_low_b <= STD_LOGIC_VECTOR((21 downto 16 => u0_lowconst_q(15)) & u0_lowconst_q) & u0_low_cin(0);
    u0_low: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_low_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u0_low_o <= STD_LOGIC_VECTOR(SIGNED(u0_low_a) - SIGNED(u0_low_b));
            END IF;
        END IF;
    END PROCESS;
    u0_low_c(0) <= u0_low_o(22);


	--u0_mux(SELECTOR,10)@2
    u0_mux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_mux_q <= (others => '0');
            u0_mux_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_mux_e_q = "1") THEN
                u0_mux_q <= ld_u0_rnd_q_to_u0_mux_cc_q(15 downto 0);
                u0_mux_v <= (others => '0');
                IF (u0_high_n = "1") THEN
                    u0_mux_q <= u0_highconst_q;
                    u0_mux_v <= "1";
                END IF;
                IF (u0_low_c = "1") THEN
                    u0_mux_q <= u0_lowconst_q;
                    u0_mux_v <= "1";
                END IF;
            END IF;
        END IF;
    END PROCESS;


	--ld_xIn_c_to_qOut_c(DELAY,343)@0
    ld_xIn_c_to_qOut_c : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => xIn_c, xout => ld_xIn_c_to_qOut_c_q, clk => clk, aclr => areset );

	--ld_xIn_v_to_u0_exp_and_b(DELAY,146)@0
    ld_xIn_v_to_u0_exp_and_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => xIn_v, xout => ld_xIn_v_to_u0_exp_and_b_q, clk => clk, aclr => areset );

	--qOut(PORTOUT,132)@3
    qOut_v <= ld_xIn_v_to_u0_exp_and_b_q;
    qOut_c <= ld_xIn_c_to_qOut_c_q;
    qOut_0 <= u0_mux_q;
    qOut_1 <= u1_mux_q;
    qOut_2 <= u2_mux_q;
    qOut_3 <= u3_mux_q;
    qOut_4 <= u4_mux_q;
    qOut_5 <= u5_mux_q;
    qOut_6 <= u6_mux_q;
    qOut_7 <= u7_mux_q;
    qOut_8 <= u8_mux_q;
    qOut_9 <= u9_mux_q;
    qOut_10 <= u10_mux_q;
    qOut_11 <= u11_mux_q;
    qOut_12 <= u12_mux_q;
    qOut_13 <= u13_mux_q;
    qOut_14 <= u14_mux_q;
    qOut_15 <= u15_mux_q;
    eOut_0 <= u0_exp_and_q;
    eOut_1 <= u1_exp_and_q;
    eOut_2 <= u2_exp_and_q;
    eOut_3 <= u3_exp_and_q;
    eOut_4 <= u4_exp_and_q;
    eOut_5 <= u5_exp_and_q;
    eOut_6 <= u6_exp_and_q;
    eOut_7 <= u7_exp_and_q;
    eOut_8 <= u8_exp_and_q;
    eOut_9 <= u9_exp_and_q;
    eOut_10 <= u10_exp_and_q;
    eOut_11 <= u11_exp_and_q;
    eOut_12 <= u12_exp_and_q;
    eOut_13 <= u13_exp_and_q;
    eOut_14 <= u14_exp_and_q;
    eOut_15 <= u15_exp_and_q;


end normal;
