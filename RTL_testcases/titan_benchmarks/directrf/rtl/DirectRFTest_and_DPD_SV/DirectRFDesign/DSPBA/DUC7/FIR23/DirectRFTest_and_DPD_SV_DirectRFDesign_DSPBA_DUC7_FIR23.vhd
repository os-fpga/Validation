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

-- VHDL created from DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR23
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
entity DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR23 is
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

architecture normal of DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_FIR23 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_sel_q_13_q : std_logic_vector (0 downto 0);
    signal u0_m0_wo0_wi1_delayr3_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi2_delayr2_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi3_delayr1_q : std_logic_vector (15 downto 0);
    signal u0_m0_wo0_wi0_sym_add0_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_wi0_sym_add0_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_wi0_sym_add0_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_wi0_sym_add0_q : std_logic_vector (16 downto 0);
    signal d_u0_m0_wo0_wi0_sym_add0_q_12_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_wi3_sym_add1_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_wi3_sym_add1_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo0_wi3_sym_add1_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_wi3_sym_add1_q : std_logic_vector (16 downto 0);
    signal d_u0_m0_wo0_wi3_sym_add1_q_12_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_oseq_gated_reg_q : std_logic_vector (0 downto 0);
    signal u1_m0_wo0_wi1_delayr3_q : std_logic_vector (15 downto 0);
    signal u1_m0_wo0_wi2_delayr2_q : std_logic_vector (15 downto 0);
    signal u1_m0_wo0_wi3_delayr1_q : std_logic_vector (15 downto 0);
    signal u1_m0_wo0_wi0_sym_add0_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo0_wi0_sym_add0_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo0_wi0_sym_add0_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo0_wi0_sym_add0_q : std_logic_vector (16 downto 0);
    signal d_u1_m0_wo0_wi0_sym_add0_q_12_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo0_wi3_sym_add1_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo0_wi3_sym_add1_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo0_wi3_sym_add1_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo0_wi3_sym_add1_q : std_logic_vector (16 downto 0);
    signal d_u1_m0_wo0_wi3_sym_add1_q_12_q : std_logic_vector (16 downto 0);
    signal u2_m0_wo0_wi1_delayr3_q : std_logic_vector (15 downto 0);
    signal u2_m0_wo0_wi2_delayr2_q : std_logic_vector (15 downto 0);
    signal u2_m0_wo0_wi3_delayr1_q : std_logic_vector (15 downto 0);
    signal u2_m0_wo0_wi0_sym_add0_a : std_logic_vector(16 downto 0);
    signal u2_m0_wo0_wi0_sym_add0_b : std_logic_vector(16 downto 0);
    signal u2_m0_wo0_wi0_sym_add0_o : std_logic_vector (16 downto 0);
    signal u2_m0_wo0_wi0_sym_add0_q : std_logic_vector (16 downto 0);
    signal d_u2_m0_wo0_wi0_sym_add0_q_12_q : std_logic_vector (16 downto 0);
    signal u2_m0_wo0_wi3_sym_add1_a : std_logic_vector(16 downto 0);
    signal u2_m0_wo0_wi3_sym_add1_b : std_logic_vector(16 downto 0);
    signal u2_m0_wo0_wi3_sym_add1_o : std_logic_vector (16 downto 0);
    signal u2_m0_wo0_wi3_sym_add1_q : std_logic_vector (16 downto 0);
    signal d_u2_m0_wo0_wi3_sym_add1_q_12_q : std_logic_vector (16 downto 0);
    signal u3_m0_wo0_wi1_delayr3_q : std_logic_vector (15 downto 0);
    signal u3_m0_wo0_wi2_delayr2_q : std_logic_vector (15 downto 0);
    signal u3_m0_wo0_wi3_delayr1_q : std_logic_vector (15 downto 0);
    signal u3_m0_wo0_wi0_sym_add0_a : std_logic_vector(16 downto 0);
    signal u3_m0_wo0_wi0_sym_add0_b : std_logic_vector(16 downto 0);
    signal u3_m0_wo0_wi0_sym_add0_o : std_logic_vector (16 downto 0);
    signal u3_m0_wo0_wi0_sym_add0_q : std_logic_vector (16 downto 0);
    signal d_u3_m0_wo0_wi0_sym_add0_q_12_q : std_logic_vector (16 downto 0);
    signal u3_m0_wo0_wi3_sym_add1_a : std_logic_vector(16 downto 0);
    signal u3_m0_wo0_wi3_sym_add1_b : std_logic_vector(16 downto 0);
    signal u3_m0_wo0_wi3_sym_add1_o : std_logic_vector (16 downto 0);
    signal u3_m0_wo0_wi3_sym_add1_q : std_logic_vector (16 downto 0);
    signal d_u3_m0_wo0_wi3_sym_add1_q_12_q : std_logic_vector (16 downto 0);
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
    signal u0_m0_wo4_wi1_sym_add0_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo4_wi1_sym_add0_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo4_wi1_sym_add0_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo4_wi1_sym_add0_q : std_logic_vector (16 downto 0);
    signal d_u0_m0_wo4_wi1_sym_add0_q_12_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo4_wi2_sym_add1_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo4_wi2_sym_add1_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo4_wi2_sym_add1_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo4_wi2_sym_add1_q : std_logic_vector (16 downto 0);
    signal d_u0_m0_wo4_wi2_sym_add1_q_12_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo4_wi1_sym_add0_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo4_wi1_sym_add0_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo4_wi1_sym_add0_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo4_wi1_sym_add0_q : std_logic_vector (16 downto 0);
    signal d_u1_m0_wo4_wi1_sym_add0_q_12_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo4_wi2_sym_add1_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo4_wi2_sym_add1_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo4_wi2_sym_add1_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo4_wi2_sym_add1_q : std_logic_vector (16 downto 0);
    signal d_u1_m0_wo4_wi2_sym_add1_q_12_q : std_logic_vector (16 downto 0);
    signal u2_m0_wo4_wi1_sym_add0_a : std_logic_vector(16 downto 0);
    signal u2_m0_wo4_wi1_sym_add0_b : std_logic_vector(16 downto 0);
    signal u2_m0_wo4_wi1_sym_add0_o : std_logic_vector (16 downto 0);
    signal u2_m0_wo4_wi1_sym_add0_q : std_logic_vector (16 downto 0);
    signal d_u2_m0_wo4_wi1_sym_add0_q_12_q : std_logic_vector (16 downto 0);
    signal u2_m0_wo4_wi2_sym_add1_a : std_logic_vector(16 downto 0);
    signal u2_m0_wo4_wi2_sym_add1_b : std_logic_vector(16 downto 0);
    signal u2_m0_wo4_wi2_sym_add1_o : std_logic_vector (16 downto 0);
    signal u2_m0_wo4_wi2_sym_add1_q : std_logic_vector (16 downto 0);
    signal d_u2_m0_wo4_wi2_sym_add1_q_12_q : std_logic_vector (16 downto 0);
    signal u3_m0_wo4_wi1_sym_add0_a : std_logic_vector(16 downto 0);
    signal u3_m0_wo4_wi1_sym_add0_b : std_logic_vector(16 downto 0);
    signal u3_m0_wo4_wi1_sym_add0_o : std_logic_vector (16 downto 0);
    signal u3_m0_wo4_wi1_sym_add0_q : std_logic_vector (16 downto 0);
    signal d_u3_m0_wo4_wi1_sym_add0_q_12_q : std_logic_vector (16 downto 0);
    signal u3_m0_wo4_wi2_sym_add1_a : std_logic_vector(16 downto 0);
    signal u3_m0_wo4_wi2_sym_add1_b : std_logic_vector(16 downto 0);
    signal u3_m0_wo4_wi2_sym_add1_o : std_logic_vector (16 downto 0);
    signal u3_m0_wo4_wi2_sym_add1_q : std_logic_vector (16 downto 0);
    signal d_u3_m0_wo4_wi2_sym_add1_q_12_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo6_wi2_sym_add0_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo6_wi2_sym_add0_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo6_wi2_sym_add0_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo6_wi2_sym_add0_q : std_logic_vector (16 downto 0);
    signal d_u0_m0_wo6_wi2_sym_add0_q_12_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo6_wi3_sym_add1_a : std_logic_vector(16 downto 0);
    signal u0_m0_wo6_wi3_sym_add1_b : std_logic_vector(16 downto 0);
    signal u0_m0_wo6_wi3_sym_add1_o : std_logic_vector (16 downto 0);
    signal u0_m0_wo6_wi3_sym_add1_q : std_logic_vector (16 downto 0);
    signal d_u0_m0_wo6_wi3_sym_add1_q_12_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo6_wi2_sym_add0_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo6_wi2_sym_add0_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo6_wi2_sym_add0_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo6_wi2_sym_add0_q : std_logic_vector (16 downto 0);
    signal d_u1_m0_wo6_wi2_sym_add0_q_12_q : std_logic_vector (16 downto 0);
    signal u1_m0_wo6_wi3_sym_add1_a : std_logic_vector(16 downto 0);
    signal u1_m0_wo6_wi3_sym_add1_b : std_logic_vector(16 downto 0);
    signal u1_m0_wo6_wi3_sym_add1_o : std_logic_vector (16 downto 0);
    signal u1_m0_wo6_wi3_sym_add1_q : std_logic_vector (16 downto 0);
    signal d_u1_m0_wo6_wi3_sym_add1_q_12_q : std_logic_vector (16 downto 0);
    signal u2_m0_wo6_wi2_sym_add0_a : std_logic_vector(16 downto 0);
    signal u2_m0_wo6_wi2_sym_add0_b : std_logic_vector(16 downto 0);
    signal u2_m0_wo6_wi2_sym_add0_o : std_logic_vector (16 downto 0);
    signal u2_m0_wo6_wi2_sym_add0_q : std_logic_vector (16 downto 0);
    signal d_u2_m0_wo6_wi2_sym_add0_q_12_q : std_logic_vector (16 downto 0);
    signal u2_m0_wo6_wi3_sym_add1_a : std_logic_vector(16 downto 0);
    signal u2_m0_wo6_wi3_sym_add1_b : std_logic_vector(16 downto 0);
    signal u2_m0_wo6_wi3_sym_add1_o : std_logic_vector (16 downto 0);
    signal u2_m0_wo6_wi3_sym_add1_q : std_logic_vector (16 downto 0);
    signal d_u2_m0_wo6_wi3_sym_add1_q_12_q : std_logic_vector (16 downto 0);
    signal u3_m0_wo6_wi2_sym_add0_a : std_logic_vector(16 downto 0);
    signal u3_m0_wo6_wi2_sym_add0_b : std_logic_vector(16 downto 0);
    signal u3_m0_wo6_wi2_sym_add0_o : std_logic_vector (16 downto 0);
    signal u3_m0_wo6_wi2_sym_add0_q : std_logic_vector (16 downto 0);
    signal d_u3_m0_wo6_wi2_sym_add0_q_12_q : std_logic_vector (16 downto 0);
    signal u3_m0_wo6_wi3_sym_add1_a : std_logic_vector(16 downto 0);
    signal u3_m0_wo6_wi3_sym_add1_b : std_logic_vector(16 downto 0);
    signal u3_m0_wo6_wi3_sym_add1_o : std_logic_vector (16 downto 0);
    signal u3_m0_wo6_wi3_sym_add1_q : std_logic_vector (16 downto 0);
    signal d_u3_m0_wo6_wi3_sym_add1_q_12_q : std_logic_vector (16 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_a : std_logic_vector(17 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_b : std_logic_vector(17 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_o : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_q : std_logic_vector (17 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_2_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_2_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_2_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_sub_2_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_1_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_1_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_1_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_1_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_3_a : std_logic_vector(30 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_3_b : std_logic_vector(30 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_3_o : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_add_3_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_a : std_logic_vector(17 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_b : std_logic_vector(17 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_o : std_logic_vector (17 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_q : std_logic_vector (17 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_2_a : std_logic_vector(27 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_2_b : std_logic_vector(27 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_2_o : std_logic_vector (27 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_sub_2_q : std_logic_vector (27 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_1_a : std_logic_vector(27 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_1_b : std_logic_vector(27 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_1_o : std_logic_vector (27 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_1_q : std_logic_vector (27 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_3_a : std_logic_vector(30 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_3_b : std_logic_vector(30 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_3_o : std_logic_vector (30 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_add_3_q : std_logic_vector (30 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_a : std_logic_vector(17 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_b : std_logic_vector(17 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_o : std_logic_vector (17 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_q : std_logic_vector (17 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_2_a : std_logic_vector(27 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_2_b : std_logic_vector(27 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_2_o : std_logic_vector (27 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_sub_2_q : std_logic_vector (27 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_1_a : std_logic_vector(27 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_1_b : std_logic_vector(27 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_1_o : std_logic_vector (27 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_1_q : std_logic_vector (27 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_3_a : std_logic_vector(30 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_3_b : std_logic_vector(30 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_3_o : std_logic_vector (30 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_add_3_q : std_logic_vector (30 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_a : std_logic_vector(17 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_b : std_logic_vector(17 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_o : std_logic_vector (17 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_q : std_logic_vector (17 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_2_a : std_logic_vector(27 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_2_b : std_logic_vector(27 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_2_o : std_logic_vector (27 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_sub_2_q : std_logic_vector (27 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_1_a : std_logic_vector(27 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_1_b : std_logic_vector(27 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_1_o : std_logic_vector (27 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_1_q : std_logic_vector (27 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_3_a : std_logic_vector(30 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_3_b : std_logic_vector(30 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_3_o : std_logic_vector (30 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_add_3_q : std_logic_vector (30 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_add_3_a : std_logic_vector(30 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_add_3_b : std_logic_vector(30 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_add_3_o : std_logic_vector (30 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_add_3_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_sub_0_a : std_logic_vector(17 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_sub_0_b : std_logic_vector(17 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_sub_0_o : std_logic_vector (17 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_sub_0_q : std_logic_vector (17 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_sub_2_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_sub_2_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_sub_2_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_sub_2_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(27 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(27 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (27 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (27 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_add_3_a : std_logic_vector(30 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_add_3_b : std_logic_vector(30 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_add_3_o : std_logic_vector (30 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_add_3_q : std_logic_vector (30 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_sub_0_a : std_logic_vector(17 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_sub_0_b : std_logic_vector(17 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_sub_0_o : std_logic_vector (17 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_sub_0_q : std_logic_vector (17 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_sub_2_a : std_logic_vector(27 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_sub_2_b : std_logic_vector(27 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_sub_2_o : std_logic_vector (27 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_sub_2_q : std_logic_vector (27 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(27 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(27 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (27 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (27 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_add_3_a : std_logic_vector(30 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_add_3_b : std_logic_vector(30 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_add_3_o : std_logic_vector (30 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_add_3_q : std_logic_vector (30 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult1_sub_0_a : std_logic_vector(17 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult1_sub_0_b : std_logic_vector(17 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult1_sub_0_o : std_logic_vector (17 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult1_sub_0_q : std_logic_vector (17 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult1_sub_2_a : std_logic_vector(27 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult1_sub_2_b : std_logic_vector(27 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult1_sub_2_o : std_logic_vector (27 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult1_sub_2_q : std_logic_vector (27 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(27 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(27 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (27 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (27 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_add_3_a : std_logic_vector(30 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_add_3_b : std_logic_vector(30 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_add_3_o : std_logic_vector (30 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_add_3_q : std_logic_vector (30 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult1_sub_0_a : std_logic_vector(17 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult1_sub_0_b : std_logic_vector(17 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult1_sub_0_o : std_logic_vector (17 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult1_sub_0_q : std_logic_vector (17 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult1_sub_2_a : std_logic_vector(27 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult1_sub_2_b : std_logic_vector(27 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult1_sub_2_o : std_logic_vector (27 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult1_sub_2_q : std_logic_vector (27 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult0_add_3_a : std_logic_vector(30 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult0_add_3_b : std_logic_vector(30 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult0_add_3_o : std_logic_vector (30 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult0_add_3_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult1_sub_0_a : std_logic_vector(17 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult1_sub_0_b : std_logic_vector(17 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult1_sub_0_o : std_logic_vector (17 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult1_sub_0_q : std_logic_vector (17 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult1_sub_2_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult1_sub_2_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult1_sub_2_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult1_sub_2_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(27 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(27 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (27 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (27 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult0_add_3_a : std_logic_vector(30 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult0_add_3_b : std_logic_vector(30 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult0_add_3_o : std_logic_vector (30 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult0_add_3_q : std_logic_vector (30 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult1_sub_0_a : std_logic_vector(17 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult1_sub_0_b : std_logic_vector(17 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult1_sub_0_o : std_logic_vector (17 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult1_sub_0_q : std_logic_vector (17 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult1_sub_2_a : std_logic_vector(27 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult1_sub_2_b : std_logic_vector(27 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult1_sub_2_o : std_logic_vector (27 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult1_sub_2_q : std_logic_vector (27 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(27 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(27 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (27 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (27 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_constmult0_add_3_a : std_logic_vector(30 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_constmult0_add_3_b : std_logic_vector(30 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_constmult0_add_3_o : std_logic_vector (30 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_constmult0_add_3_q : std_logic_vector (30 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_constmult1_sub_0_a : std_logic_vector(17 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_constmult1_sub_0_b : std_logic_vector(17 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_constmult1_sub_0_o : std_logic_vector (17 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_constmult1_sub_0_q : std_logic_vector (17 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_constmult1_sub_2_a : std_logic_vector(27 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_constmult1_sub_2_b : std_logic_vector(27 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_constmult1_sub_2_o : std_logic_vector (27 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_constmult1_sub_2_q : std_logic_vector (27 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(27 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(27 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (27 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (27 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_constmult0_add_3_a : std_logic_vector(30 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_constmult0_add_3_b : std_logic_vector(30 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_constmult0_add_3_o : std_logic_vector (30 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_constmult0_add_3_q : std_logic_vector (30 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_constmult1_sub_0_a : std_logic_vector(17 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_constmult1_sub_0_b : std_logic_vector(17 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_constmult1_sub_0_o : std_logic_vector (17 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_constmult1_sub_0_q : std_logic_vector (17 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_constmult1_sub_2_a : std_logic_vector(27 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_constmult1_sub_2_b : std_logic_vector(27 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_constmult1_sub_2_o : std_logic_vector (27 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_constmult1_sub_2_q : std_logic_vector (27 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult0_add_3_a : std_logic_vector(30 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult0_add_3_b : std_logic_vector(30 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult0_add_3_o : std_logic_vector (30 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult0_add_3_q : std_logic_vector (30 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult1_sub_0_a : std_logic_vector(17 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult1_sub_0_b : std_logic_vector(17 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult1_sub_0_o : std_logic_vector (17 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult1_sub_0_q : std_logic_vector (17 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult1_sub_2_a : std_logic_vector(27 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult1_sub_2_b : std_logic_vector(27 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult1_sub_2_o : std_logic_vector (27 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult1_sub_2_q : std_logic_vector (27 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(27 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(27 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (27 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (27 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult0_add_3_a : std_logic_vector(30 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult0_add_3_b : std_logic_vector(30 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult0_add_3_o : std_logic_vector (30 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult0_add_3_q : std_logic_vector (30 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult1_sub_0_a : std_logic_vector(17 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult1_sub_0_b : std_logic_vector(17 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult1_sub_0_o : std_logic_vector (17 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult1_sub_0_q : std_logic_vector (17 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult1_sub_2_a : std_logic_vector(27 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult1_sub_2_b : std_logic_vector(27 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult1_sub_2_o : std_logic_vector (27 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult1_sub_2_q : std_logic_vector (27 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(27 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(27 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (27 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (27 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_constmult0_add_3_a : std_logic_vector(30 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_constmult0_add_3_b : std_logic_vector(30 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_constmult0_add_3_o : std_logic_vector (30 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_constmult0_add_3_q : std_logic_vector (30 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_constmult1_sub_0_a : std_logic_vector(17 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_constmult1_sub_0_b : std_logic_vector(17 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_constmult1_sub_0_o : std_logic_vector (17 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_constmult1_sub_0_q : std_logic_vector (17 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_constmult1_sub_2_a : std_logic_vector(27 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_constmult1_sub_2_b : std_logic_vector(27 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_constmult1_sub_2_o : std_logic_vector (27 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_constmult1_sub_2_q : std_logic_vector (27 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_constmult0_add_1_a : std_logic_vector(27 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_constmult0_add_1_b : std_logic_vector(27 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_constmult0_add_1_o : std_logic_vector (27 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_constmult0_add_1_q : std_logic_vector (27 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_constmult0_add_3_a : std_logic_vector(30 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_constmult0_add_3_b : std_logic_vector(30 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_constmult0_add_3_o : std_logic_vector (30 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_constmult0_add_3_q : std_logic_vector (30 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_constmult1_sub_0_a : std_logic_vector(17 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_constmult1_sub_0_b : std_logic_vector(17 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_constmult1_sub_0_o : std_logic_vector (17 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_constmult1_sub_0_q : std_logic_vector (17 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_constmult1_sub_2_a : std_logic_vector(27 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_constmult1_sub_2_b : std_logic_vector(27 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_constmult1_sub_2_o : std_logic_vector (27 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_constmult1_sub_2_q : std_logic_vector (27 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_sum1_a : std_logic_vector(31 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_sum1_b : std_logic_vector(31 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_sum1_o : std_logic_vector (31 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_sum1_q : std_logic_vector (31 downto 0);
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
    signal d_u0_m0_wo0_wi3_phasedelay1_q_14_replace_mem_reset0 : std_logic;
    signal d_u0_m0_wo0_wi3_phasedelay1_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo0_wi3_phasedelay1_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u0_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u0_m0_wo0_wi3_phasedelay1_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_reset0 : std_logic;
    signal d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi3_phasedelay1_q_14_replace_mem_reset0 : std_logic;
    signal d_u1_m0_wo0_wi3_phasedelay1_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo0_wi3_phasedelay1_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u1_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u1_m0_wo0_wi3_phasedelay1_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_reset0 : std_logic;
    signal d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo0_wi3_phasedelay1_q_14_replace_mem_reset0 : std_logic;
    signal d_u2_m0_wo0_wi3_phasedelay1_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo0_wi3_phasedelay1_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u2_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u2_m0_wo0_wi3_phasedelay1_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_reset0 : std_logic;
    signal d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo0_wi3_phasedelay1_q_14_replace_mem_reset0 : std_logic;
    signal d_u3_m0_wo0_wi3_phasedelay1_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo0_wi3_phasedelay1_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u3_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u3_m0_wo0_wi3_phasedelay1_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo2_wi1_phasedelay1_q_14_replace_mem_reset0 : std_logic;
    signal d_u0_m0_wo2_wi1_phasedelay1_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo2_wi1_phasedelay1_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u0_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u0_m0_wo2_wi1_phasedelay1_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo2_wi1_phasedelay1_q_14_replace_mem_reset0 : std_logic;
    signal d_u1_m0_wo2_wi1_phasedelay1_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo2_wi1_phasedelay1_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u1_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u1_m0_wo2_wi1_phasedelay1_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo2_wi1_phasedelay1_q_14_replace_mem_reset0 : std_logic;
    signal d_u2_m0_wo2_wi1_phasedelay1_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo2_wi1_phasedelay1_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u2_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u2_m0_wo2_wi1_phasedelay1_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo2_wi1_phasedelay1_q_14_replace_mem_reset0 : std_logic;
    signal d_u3_m0_wo2_wi1_phasedelay1_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo2_wi1_phasedelay1_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u3_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u3_m0_wo2_wi1_phasedelay1_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo4_wi2_phasedelay1_q_14_replace_mem_reset0 : std_logic;
    signal d_u0_m0_wo4_wi2_phasedelay1_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo4_wi2_phasedelay1_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u0_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u0_m0_wo4_wi2_phasedelay1_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo4_wi2_phasedelay1_q_14_replace_mem_reset0 : std_logic;
    signal d_u1_m0_wo4_wi2_phasedelay1_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u1_m0_wo4_wi2_phasedelay1_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u1_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u1_m0_wo4_wi2_phasedelay1_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo4_wi2_phasedelay1_q_14_replace_mem_reset0 : std_logic;
    signal d_u2_m0_wo4_wi2_phasedelay1_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u2_m0_wo4_wi2_phasedelay1_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u2_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u2_m0_wo4_wi2_phasedelay1_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo4_wi2_phasedelay1_q_14_replace_mem_reset0 : std_logic;
    signal d_u3_m0_wo4_wi2_phasedelay1_q_14_replace_mem_iq : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ia : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ir : std_logic_vector (15 downto 0);
    signal d_u3_m0_wo4_wi2_phasedelay1_q_14_replace_mem_aa : std_logic_vector (1 downto 0);
    signal d_u3_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ab : std_logic_vector (1 downto 0);
    signal d_u3_m0_wo4_wi2_phasedelay1_q_14_replace_mem_q : std_logic_vector (15 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_s : std_logic_vector (0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q : std_logic_vector (1 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_notEnable_a : std_logic_vector(0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_notEnable_q : std_logic_vector(0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_a : std_logic_vector(0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_b : std_logic_vector(0 downto 0);
    signal d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_q : std_logic_vector(0 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int : std_logic_vector (26 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult0_shift1_q : std_logic_vector (26 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (26 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (26 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q : std_logic_vector (29 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int : std_logic_vector (26 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult0_shift1_q : std_logic_vector (26 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (26 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (26 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int : std_logic_vector (29 downto 0);
    signal u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q : std_logic_vector (29 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int : std_logic_vector (26 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult0_shift1_q : std_logic_vector (26 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (26 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (26 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int : std_logic_vector (29 downto 0);
    signal u2_m0_wo0_mtree_madd2_0_constmult1_shift2_q : std_logic_vector (29 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int : std_logic_vector (26 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult0_shift1_q : std_logic_vector (26 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int : std_logic_vector (26 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_shift0_q : std_logic_vector (26 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int : std_logic_vector (29 downto 0);
    signal u3_m0_wo0_mtree_madd2_0_constmult1_shift2_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (26 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (26 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_shift1_q_int : std_logic_vector (26 downto 0);
    signal u0_m0_wo2_mtree_madd2_0_constmult1_shift1_q : std_logic_vector (26 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (26 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (26 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (29 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (29 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_shift1_q_int : std_logic_vector (26 downto 0);
    signal u1_m0_wo2_mtree_madd2_0_constmult1_shift1_q : std_logic_vector (26 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (26 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (26 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (29 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (29 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult1_shift1_q_int : std_logic_vector (26 downto 0);
    signal u2_m0_wo2_mtree_madd2_0_constmult1_shift1_q : std_logic_vector (26 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (26 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (26 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (29 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (29 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult1_shift1_q_int : std_logic_vector (26 downto 0);
    signal u3_m0_wo2_mtree_madd2_0_constmult1_shift1_q : std_logic_vector (26 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (26 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (26 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult1_shift1_q_int : std_logic_vector (26 downto 0);
    signal u0_m0_wo4_mtree_madd2_0_constmult1_shift1_q : std_logic_vector (26 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (26 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (26 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (29 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (29 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult1_shift1_q_int : std_logic_vector (26 downto 0);
    signal u1_m0_wo4_mtree_madd2_0_constmult1_shift1_q : std_logic_vector (26 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (26 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (26 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (29 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (29 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_constmult1_shift1_q_int : std_logic_vector (26 downto 0);
    signal u2_m0_wo4_mtree_madd2_0_constmult1_shift1_q : std_logic_vector (26 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (26 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (26 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (29 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (29 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_constmult1_shift1_q_int : std_logic_vector (26 downto 0);
    signal u3_m0_wo4_mtree_madd2_0_constmult1_shift1_q : std_logic_vector (26 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (26 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (26 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult1_shift1_q_int : std_logic_vector (26 downto 0);
    signal u0_m0_wo6_mtree_madd2_0_constmult1_shift1_q : std_logic_vector (26 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (26 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (26 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (29 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (29 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult1_shift1_q_int : std_logic_vector (26 downto 0);
    signal u1_m0_wo6_mtree_madd2_0_constmult1_shift1_q : std_logic_vector (26 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (26 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (26 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (29 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (29 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_constmult1_shift1_q_int : std_logic_vector (26 downto 0);
    signal u2_m0_wo6_mtree_madd2_0_constmult1_shift1_q : std_logic_vector (26 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_constmult0_shift0_q_int : std_logic_vector (26 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_constmult0_shift0_q : std_logic_vector (26 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_constmult0_shift2_q_int : std_logic_vector (29 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_constmult0_shift2_q : std_logic_vector (29 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_constmult1_shift1_q_int : std_logic_vector (26 downto 0);
    signal u3_m0_wo6_mtree_madd2_0_constmult1_shift1_q : std_logic_vector (26 downto 0);
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
    signal u0_m0_wo5_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo5_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u1_m0_wo5_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u1_m0_wo5_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u2_m0_wo5_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u2_m0_wo5_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u3_m0_wo5_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u3_m0_wo5_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u0_m0_wo7_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u0_m0_wo7_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u1_m0_wo7_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u1_m0_wo7_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u2_m0_wo7_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u2_m0_wo7_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
    signal u3_m0_wo7_mtree_mult1_0_shift0_q_int : std_logic_vector (29 downto 0);
    signal u3_m0_wo7_mtree_mult1_0_shift0_q : std_logic_vector (29 downto 0);
begin


	--d_u0_m0_wo0_wi0_phasedelay0_q_14_notEnable(LOGICAL,1293)
    d_u0_m0_wo0_wi0_phasedelay0_q_14_notEnable_a <= VCC_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_14_notEnable_q <= not d_u0_m0_wo0_wi0_phasedelay0_q_14_notEnable_a;

	--d_u0_m0_wo0_wi0_phasedelay0_q_14_nor(LOGICAL,1294)
    d_u0_m0_wo0_wi0_phasedelay0_q_14_nor_a <= d_u0_m0_wo0_wi0_phasedelay0_q_14_notEnable_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_14_nor_b <= d_u0_m0_wo0_wi0_phasedelay0_q_14_sticky_ena_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_14_nor_q <= not (d_u0_m0_wo0_wi0_phasedelay0_q_14_nor_a or d_u0_m0_wo0_wi0_phasedelay0_q_14_nor_b);

	--d_u0_m0_wo0_wi0_phasedelay0_q_14_mem_top(CONSTANT,1290)
    d_u0_m0_wo0_wi0_phasedelay0_q_14_mem_top_q <= "010";

	--d_u0_m0_wo0_wi0_phasedelay0_q_14_cmp(LOGICAL,1291)
    d_u0_m0_wo0_wi0_phasedelay0_q_14_cmp_a <= d_u0_m0_wo0_wi0_phasedelay0_q_14_mem_top_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_14_cmp_b <= STD_LOGIC_VECTOR("0" & d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q);
    d_u0_m0_wo0_wi0_phasedelay0_q_14_cmp_q <= "1" when d_u0_m0_wo0_wi0_phasedelay0_q_14_cmp_a = d_u0_m0_wo0_wi0_phasedelay0_q_14_cmp_b else "0";

	--d_u0_m0_wo0_wi0_phasedelay0_q_14_cmpReg(REG,1292)
    d_u0_m0_wo0_wi0_phasedelay0_q_14_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_u0_m0_wo0_wi0_phasedelay0_q_14_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            d_u0_m0_wo0_wi0_phasedelay0_q_14_cmpReg_q <= d_u0_m0_wo0_wi0_phasedelay0_q_14_cmp_q;
        END IF;
    END PROCESS;


	--d_u0_m0_wo0_wi0_phasedelay0_q_14_sticky_ena(REG,1295)
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


	--d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd(LOGICAL,1296)
    d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_a <= d_u0_m0_wo0_wi0_phasedelay0_q_14_sticky_ena_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_b <= VCC_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_q <= d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_a and d_u0_m0_wo0_wi0_phasedelay0_q_14_enaAnd_b;

	--xIn(PORTIN,2)@10

	--d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt(COUNTER,1286)
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


	--d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg(REG,1287)
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

	--d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux(MUX,1288)
    d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_s <= VCC_q;
    d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux: PROCESS (d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_s, d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q, d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt_q)
    BEGIN
            CASE d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_s IS
                  WHEN "0" => d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q;
                  WHEN "1" => d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdcnt_q;
                  WHEN OTHERS => d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--d_u3_m0_wo4_wi2_phasedelay1_q_14_replace_mem(DUALMEM,1465)
    d_u3_m0_wo4_wi2_phasedelay1_q_14_replace_mem_reset0 <= areset;
    d_u3_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ia <= xIn_14;
    d_u3_m0_wo4_wi2_phasedelay1_q_14_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q;
    d_u3_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q;
    d_u3_m0_wo4_wi2_phasedelay1_q_14_replace_mem_dmem : altsyncram
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
        aclr1 => d_u3_m0_wo4_wi2_phasedelay1_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u3_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u3_m0_wo4_wi2_phasedelay1_q_14_replace_mem_iq,
        address_a => d_u3_m0_wo4_wi2_phasedelay1_q_14_replace_mem_aa,
        data_a => d_u3_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ia
    );
        d_u3_m0_wo4_wi2_phasedelay1_q_14_replace_mem_q <= d_u3_m0_wo4_wi2_phasedelay1_q_14_replace_mem_iq(15 downto 0);

	--u3_m0_wo7_mtree_mult1_0_shift0(BITSHIFT,1235)@14
    u3_m0_wo7_mtree_mult1_0_shift0_q_int <= d_u3_m0_wo4_wi2_phasedelay1_q_14_replace_mem_q & "00000000000000";
    u3_m0_wo7_mtree_mult1_0_shift0_q <= u3_m0_wo7_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u3_m0_wo6_wi2_sym_add0(ADD,907)@10
    u3_m0_wo6_wi2_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_14(15)) & xIn_14);
    u3_m0_wo6_wi2_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_13(15)) & xIn_13);
    u3_m0_wo6_wi2_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo6_wi2_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo6_wi2_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo6_wi2_sym_add0_a) + SIGNED(u3_m0_wo6_wi2_sym_add0_b));
        END IF;
    END PROCESS;
    u3_m0_wo6_wi2_sym_add0_q <= u3_m0_wo6_wi2_sym_add0_o(16 downto 0);


	--d_u3_m0_wo6_wi2_sym_add0_q_12(DELAY,1283)@11
    d_u3_m0_wo6_wi2_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u3_m0_wo6_wi2_sym_add0_q, xout => d_u3_m0_wo6_wi2_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u3_m0_wo6_mtree_madd2_0_constmult0_shift2(BITSHIFT,1222)@12
    u3_m0_wo6_mtree_madd2_0_constmult0_shift2_q_int <= d_u3_m0_wo6_wi2_sym_add0_q_12_q & "0000000000000";
    u3_m0_wo6_mtree_madd2_0_constmult0_shift2_q <= u3_m0_wo6_mtree_madd2_0_constmult0_shift2_q_int(29 downto 0);

	--u3_m0_wo6_mtree_madd2_0_constmult0_shift0(BITSHIFT,1220)@11
    u3_m0_wo6_mtree_madd2_0_constmult0_shift0_q_int <= u3_m0_wo6_wi2_sym_add0_q & "0000000000";
    u3_m0_wo6_mtree_madd2_0_constmult0_shift0_q <= u3_m0_wo6_mtree_madd2_0_constmult0_shift0_q_int(26 downto 0);

	--u3_m0_wo6_mtree_madd2_0_constmult0_add_1(ADD,1221)@11
    u3_m0_wo6_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((27 downto 17 => u3_m0_wo6_wi2_sym_add0_q(16)) & u3_m0_wo6_wi2_sym_add0_q);
    u3_m0_wo6_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u3_m0_wo6_mtree_madd2_0_constmult0_shift0_q(26)) & u3_m0_wo6_mtree_madd2_0_constmult0_shift0_q);
    u3_m0_wo6_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo6_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo6_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo6_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u3_m0_wo6_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u3_m0_wo6_mtree_madd2_0_constmult0_add_1_q <= u3_m0_wo6_mtree_madd2_0_constmult0_add_1_o(27 downto 0);


	--u3_m0_wo6_mtree_madd2_0_constmult0_add_3(ADD,1223)@12
    u3_m0_wo6_mtree_madd2_0_constmult0_add_3_a <= STD_LOGIC_VECTOR((30 downto 28 => u3_m0_wo6_mtree_madd2_0_constmult0_add_1_q(27)) & u3_m0_wo6_mtree_madd2_0_constmult0_add_1_q);
    u3_m0_wo6_mtree_madd2_0_constmult0_add_3_b <= STD_LOGIC_VECTOR((30 downto 30 => u3_m0_wo6_mtree_madd2_0_constmult0_shift2_q(29)) & u3_m0_wo6_mtree_madd2_0_constmult0_shift2_q);
    u3_m0_wo6_mtree_madd2_0_constmult0_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo6_mtree_madd2_0_constmult0_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo6_mtree_madd2_0_constmult0_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo6_mtree_madd2_0_constmult0_add_3_a) + SIGNED(u3_m0_wo6_mtree_madd2_0_constmult0_add_3_b));
        END IF;
    END PROCESS;
    u3_m0_wo6_mtree_madd2_0_constmult0_add_3_q <= u3_m0_wo6_mtree_madd2_0_constmult0_add_3_o(30 downto 0);


	--u3_m0_wo6_wi3_sym_add1(ADD,908)@10
    u3_m0_wo6_wi3_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_15(15)) & xIn_15);
    u3_m0_wo6_wi3_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_12(15)) & xIn_12);
    u3_m0_wo6_wi3_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo6_wi3_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo6_wi3_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo6_wi3_sym_add1_a) + SIGNED(u3_m0_wo6_wi3_sym_add1_b));
        END IF;
    END PROCESS;
    u3_m0_wo6_wi3_sym_add1_q <= u3_m0_wo6_wi3_sym_add1_o(16 downto 0);


	--d_u3_m0_wo6_wi3_sym_add1_q_12(DELAY,1284)@11
    d_u3_m0_wo6_wi3_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u3_m0_wo6_wi3_sym_add1_q, xout => d_u3_m0_wo6_wi3_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u3_m0_wo6_mtree_madd2_0_constmult1_shift1(BITSHIFT,1225)@12
    u3_m0_wo6_mtree_madd2_0_constmult1_shift1_q_int <= d_u3_m0_wo6_wi3_sym_add1_q_12_q & "0000000000";
    u3_m0_wo6_mtree_madd2_0_constmult1_shift1_q <= u3_m0_wo6_mtree_madd2_0_constmult1_shift1_q_int(26 downto 0);

	--u3_m0_wo6_mtree_madd2_0_constmult1_sub_0(SUB,1224)@11
    u3_m0_wo6_mtree_madd2_0_constmult1_sub_0_a <= STD_LOGIC_VECTOR((17 downto 1 => GND_q(0)) & GND_q);
    u3_m0_wo6_mtree_madd2_0_constmult1_sub_0_b <= STD_LOGIC_VECTOR((17 downto 17 => u3_m0_wo6_wi3_sym_add1_q(16)) & u3_m0_wo6_wi3_sym_add1_q);
    u3_m0_wo6_mtree_madd2_0_constmult1_sub_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo6_mtree_madd2_0_constmult1_sub_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo6_mtree_madd2_0_constmult1_sub_0_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo6_mtree_madd2_0_constmult1_sub_0_a) - SIGNED(u3_m0_wo6_mtree_madd2_0_constmult1_sub_0_b));
        END IF;
    END PROCESS;
    u3_m0_wo6_mtree_madd2_0_constmult1_sub_0_q <= u3_m0_wo6_mtree_madd2_0_constmult1_sub_0_o(17 downto 0);


	--u3_m0_wo6_mtree_madd2_0_constmult1_sub_2(SUB,1226)@12
    u3_m0_wo6_mtree_madd2_0_constmult1_sub_2_a <= STD_LOGIC_VECTOR((27 downto 18 => u3_m0_wo6_mtree_madd2_0_constmult1_sub_0_q(17)) & u3_m0_wo6_mtree_madd2_0_constmult1_sub_0_q);
    u3_m0_wo6_mtree_madd2_0_constmult1_sub_2_b <= STD_LOGIC_VECTOR((27 downto 27 => u3_m0_wo6_mtree_madd2_0_constmult1_shift1_q(26)) & u3_m0_wo6_mtree_madd2_0_constmult1_shift1_q);
    u3_m0_wo6_mtree_madd2_0_constmult1_sub_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo6_mtree_madd2_0_constmult1_sub_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo6_mtree_madd2_0_constmult1_sub_2_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo6_mtree_madd2_0_constmult1_sub_2_a) - SIGNED(u3_m0_wo6_mtree_madd2_0_constmult1_sub_2_b));
        END IF;
    END PROCESS;
    u3_m0_wo6_mtree_madd2_0_constmult1_sub_2_q <= u3_m0_wo6_mtree_madd2_0_constmult1_sub_2_o(27 downto 0);


	--u3_m0_wo6_mtree_madd2_0_sum1(ADD,1227)@13
    u3_m0_wo6_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u3_m0_wo6_mtree_madd2_0_constmult1_sub_2_q(27)) & u3_m0_wo6_mtree_madd2_0_constmult1_sub_2_q);
    u3_m0_wo6_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u3_m0_wo6_mtree_madd2_0_constmult0_add_3_q(30)) & u3_m0_wo6_mtree_madd2_0_constmult0_add_3_q);
    u3_m0_wo6_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo6_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo6_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo6_mtree_madd2_0_sum1_a) + SIGNED(u3_m0_wo6_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u3_m0_wo6_mtree_madd2_0_sum1_q <= u3_m0_wo6_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u3_m0_wo2_wi1_phasedelay1_q_14_replace_mem(DUALMEM,1417)
    d_u3_m0_wo2_wi1_phasedelay1_q_14_replace_mem_reset0 <= areset;
    d_u3_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ia <= xIn_13;
    d_u3_m0_wo2_wi1_phasedelay1_q_14_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q;
    d_u3_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q;
    d_u3_m0_wo2_wi1_phasedelay1_q_14_replace_mem_dmem : altsyncram
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
        aclr1 => d_u3_m0_wo2_wi1_phasedelay1_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u3_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u3_m0_wo2_wi1_phasedelay1_q_14_replace_mem_iq,
        address_a => d_u3_m0_wo2_wi1_phasedelay1_q_14_replace_mem_aa,
        data_a => d_u3_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ia
    );
        d_u3_m0_wo2_wi1_phasedelay1_q_14_replace_mem_q <= d_u3_m0_wo2_wi1_phasedelay1_q_14_replace_mem_iq(15 downto 0);

	--u3_m0_wo5_mtree_mult1_0_shift0(BITSHIFT,1195)@14
    u3_m0_wo5_mtree_mult1_0_shift0_q_int <= d_u3_m0_wo2_wi1_phasedelay1_q_14_replace_mem_q & "00000000000000";
    u3_m0_wo5_mtree_mult1_0_shift0_q <= u3_m0_wo5_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u3_m0_wo4_wi1_sym_add0(ADD,655)@10
    u3_m0_wo4_wi1_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_13(15)) & xIn_13);
    u3_m0_wo4_wi1_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_12(15)) & xIn_12);
    u3_m0_wo4_wi1_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo4_wi1_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo4_wi1_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo4_wi1_sym_add0_a) + SIGNED(u3_m0_wo4_wi1_sym_add0_b));
        END IF;
    END PROCESS;
    u3_m0_wo4_wi1_sym_add0_q <= u3_m0_wo4_wi1_sym_add0_o(16 downto 0);


	--d_u3_m0_wo4_wi1_sym_add0_q_12(DELAY,1275)@11
    d_u3_m0_wo4_wi1_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u3_m0_wo4_wi1_sym_add0_q, xout => d_u3_m0_wo4_wi1_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u3_m0_wo4_mtree_madd2_0_constmult0_shift2(BITSHIFT,1182)@12
    u3_m0_wo4_mtree_madd2_0_constmult0_shift2_q_int <= d_u3_m0_wo4_wi1_sym_add0_q_12_q & "0000000000000";
    u3_m0_wo4_mtree_madd2_0_constmult0_shift2_q <= u3_m0_wo4_mtree_madd2_0_constmult0_shift2_q_int(29 downto 0);

	--u3_m0_wo4_mtree_madd2_0_constmult0_shift0(BITSHIFT,1180)@11
    u3_m0_wo4_mtree_madd2_0_constmult0_shift0_q_int <= u3_m0_wo4_wi1_sym_add0_q & "0000000000";
    u3_m0_wo4_mtree_madd2_0_constmult0_shift0_q <= u3_m0_wo4_mtree_madd2_0_constmult0_shift0_q_int(26 downto 0);

	--u3_m0_wo4_mtree_madd2_0_constmult0_add_1(ADD,1181)@11
    u3_m0_wo4_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((27 downto 17 => u3_m0_wo4_wi1_sym_add0_q(16)) & u3_m0_wo4_wi1_sym_add0_q);
    u3_m0_wo4_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u3_m0_wo4_mtree_madd2_0_constmult0_shift0_q(26)) & u3_m0_wo4_mtree_madd2_0_constmult0_shift0_q);
    u3_m0_wo4_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo4_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo4_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo4_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u3_m0_wo4_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u3_m0_wo4_mtree_madd2_0_constmult0_add_1_q <= u3_m0_wo4_mtree_madd2_0_constmult0_add_1_o(27 downto 0);


	--u3_m0_wo4_mtree_madd2_0_constmult0_add_3(ADD,1183)@12
    u3_m0_wo4_mtree_madd2_0_constmult0_add_3_a <= STD_LOGIC_VECTOR((30 downto 28 => u3_m0_wo4_mtree_madd2_0_constmult0_add_1_q(27)) & u3_m0_wo4_mtree_madd2_0_constmult0_add_1_q);
    u3_m0_wo4_mtree_madd2_0_constmult0_add_3_b <= STD_LOGIC_VECTOR((30 downto 30 => u3_m0_wo4_mtree_madd2_0_constmult0_shift2_q(29)) & u3_m0_wo4_mtree_madd2_0_constmult0_shift2_q);
    u3_m0_wo4_mtree_madd2_0_constmult0_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo4_mtree_madd2_0_constmult0_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo4_mtree_madd2_0_constmult0_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo4_mtree_madd2_0_constmult0_add_3_a) + SIGNED(u3_m0_wo4_mtree_madd2_0_constmult0_add_3_b));
        END IF;
    END PROCESS;
    u3_m0_wo4_mtree_madd2_0_constmult0_add_3_q <= u3_m0_wo4_mtree_madd2_0_constmult0_add_3_o(30 downto 0);


	--u3_m0_wo0_wi3_delayr1(DELAY,145)@10
    u3_m0_wo0_wi3_delayr1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_15, xout => u3_m0_wo0_wi3_delayr1_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u3_m0_wo4_wi2_sym_add1(ADD,656)@10
    u3_m0_wo4_wi2_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_14(15)) & xIn_14);
    u3_m0_wo4_wi2_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u3_m0_wo0_wi3_delayr1_q(15)) & u3_m0_wo0_wi3_delayr1_q);
    u3_m0_wo4_wi2_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo4_wi2_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo4_wi2_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo4_wi2_sym_add1_a) + SIGNED(u3_m0_wo4_wi2_sym_add1_b));
        END IF;
    END PROCESS;
    u3_m0_wo4_wi2_sym_add1_q <= u3_m0_wo4_wi2_sym_add1_o(16 downto 0);


	--d_u3_m0_wo4_wi2_sym_add1_q_12(DELAY,1276)@11
    d_u3_m0_wo4_wi2_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u3_m0_wo4_wi2_sym_add1_q, xout => d_u3_m0_wo4_wi2_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u3_m0_wo4_mtree_madd2_0_constmult1_shift1(BITSHIFT,1185)@12
    u3_m0_wo4_mtree_madd2_0_constmult1_shift1_q_int <= d_u3_m0_wo4_wi2_sym_add1_q_12_q & "0000000000";
    u3_m0_wo4_mtree_madd2_0_constmult1_shift1_q <= u3_m0_wo4_mtree_madd2_0_constmult1_shift1_q_int(26 downto 0);

	--u3_m0_wo4_mtree_madd2_0_constmult1_sub_0(SUB,1184)@11
    u3_m0_wo4_mtree_madd2_0_constmult1_sub_0_a <= STD_LOGIC_VECTOR((17 downto 1 => GND_q(0)) & GND_q);
    u3_m0_wo4_mtree_madd2_0_constmult1_sub_0_b <= STD_LOGIC_VECTOR((17 downto 17 => u3_m0_wo4_wi2_sym_add1_q(16)) & u3_m0_wo4_wi2_sym_add1_q);
    u3_m0_wo4_mtree_madd2_0_constmult1_sub_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo4_mtree_madd2_0_constmult1_sub_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo4_mtree_madd2_0_constmult1_sub_0_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo4_mtree_madd2_0_constmult1_sub_0_a) - SIGNED(u3_m0_wo4_mtree_madd2_0_constmult1_sub_0_b));
        END IF;
    END PROCESS;
    u3_m0_wo4_mtree_madd2_0_constmult1_sub_0_q <= u3_m0_wo4_mtree_madd2_0_constmult1_sub_0_o(17 downto 0);


	--u3_m0_wo4_mtree_madd2_0_constmult1_sub_2(SUB,1186)@12
    u3_m0_wo4_mtree_madd2_0_constmult1_sub_2_a <= STD_LOGIC_VECTOR((27 downto 18 => u3_m0_wo4_mtree_madd2_0_constmult1_sub_0_q(17)) & u3_m0_wo4_mtree_madd2_0_constmult1_sub_0_q);
    u3_m0_wo4_mtree_madd2_0_constmult1_sub_2_b <= STD_LOGIC_VECTOR((27 downto 27 => u3_m0_wo4_mtree_madd2_0_constmult1_shift1_q(26)) & u3_m0_wo4_mtree_madd2_0_constmult1_shift1_q);
    u3_m0_wo4_mtree_madd2_0_constmult1_sub_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo4_mtree_madd2_0_constmult1_sub_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo4_mtree_madd2_0_constmult1_sub_2_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo4_mtree_madd2_0_constmult1_sub_2_a) - SIGNED(u3_m0_wo4_mtree_madd2_0_constmult1_sub_2_b));
        END IF;
    END PROCESS;
    u3_m0_wo4_mtree_madd2_0_constmult1_sub_2_q <= u3_m0_wo4_mtree_madd2_0_constmult1_sub_2_o(27 downto 0);


	--u3_m0_wo4_mtree_madd2_0_sum1(ADD,1187)@13
    u3_m0_wo4_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u3_m0_wo4_mtree_madd2_0_constmult1_sub_2_q(27)) & u3_m0_wo4_mtree_madd2_0_constmult1_sub_2_q);
    u3_m0_wo4_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u3_m0_wo4_mtree_madd2_0_constmult0_add_3_q(30)) & u3_m0_wo4_mtree_madd2_0_constmult0_add_3_q);
    u3_m0_wo4_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo4_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo4_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo4_mtree_madd2_0_sum1_a) + SIGNED(u3_m0_wo4_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u3_m0_wo4_mtree_madd2_0_sum1_q <= u3_m0_wo4_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem(DUALMEM,1357)
    d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_reset0 <= areset;
    d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ia <= xIn_12;
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

	--u3_m0_wo3_mtree_mult1_0_shift0(BITSHIFT,1155)@14
    u3_m0_wo3_mtree_mult1_0_shift0_q_int <= d_u3_m0_wo0_wi0_phasedelay0_q_14_replace_mem_q & "00000000000000";
    u3_m0_wo3_mtree_mult1_0_shift0_q <= u3_m0_wo3_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u3_m0_wo2_wi0_sym_add0(ADD,403)@10
    u3_m0_wo2_wi0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_12(15)) & xIn_12);
    u3_m0_wo2_wi0_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => u3_m0_wo0_wi3_delayr1_q(15)) & u3_m0_wo0_wi3_delayr1_q);
    u3_m0_wo2_wi0_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo2_wi0_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo2_wi0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo2_wi0_sym_add0_a) + SIGNED(u3_m0_wo2_wi0_sym_add0_b));
        END IF;
    END PROCESS;
    u3_m0_wo2_wi0_sym_add0_q <= u3_m0_wo2_wi0_sym_add0_o(16 downto 0);


	--d_u3_m0_wo2_wi0_sym_add0_q_12(DELAY,1263)@11
    d_u3_m0_wo2_wi0_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u3_m0_wo2_wi0_sym_add0_q, xout => d_u3_m0_wo2_wi0_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u3_m0_wo2_mtree_madd2_0_constmult0_shift2(BITSHIFT,1142)@12
    u3_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int <= d_u3_m0_wo2_wi0_sym_add0_q_12_q & "0000000000000";
    u3_m0_wo2_mtree_madd2_0_constmult0_shift2_q <= u3_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int(29 downto 0);

	--u3_m0_wo2_mtree_madd2_0_constmult0_shift0(BITSHIFT,1140)@11
    u3_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int <= u3_m0_wo2_wi0_sym_add0_q & "0000000000";
    u3_m0_wo2_mtree_madd2_0_constmult0_shift0_q <= u3_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int(26 downto 0);

	--u3_m0_wo2_mtree_madd2_0_constmult0_add_1(ADD,1141)@11
    u3_m0_wo2_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((27 downto 17 => u3_m0_wo2_wi0_sym_add0_q(16)) & u3_m0_wo2_wi0_sym_add0_q);
    u3_m0_wo2_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u3_m0_wo2_mtree_madd2_0_constmult0_shift0_q(26)) & u3_m0_wo2_mtree_madd2_0_constmult0_shift0_q);
    u3_m0_wo2_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo2_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo2_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo2_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u3_m0_wo2_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u3_m0_wo2_mtree_madd2_0_constmult0_add_1_q <= u3_m0_wo2_mtree_madd2_0_constmult0_add_1_o(27 downto 0);


	--u3_m0_wo2_mtree_madd2_0_constmult0_add_3(ADD,1143)@12
    u3_m0_wo2_mtree_madd2_0_constmult0_add_3_a <= STD_LOGIC_VECTOR((30 downto 28 => u3_m0_wo2_mtree_madd2_0_constmult0_add_1_q(27)) & u3_m0_wo2_mtree_madd2_0_constmult0_add_1_q);
    u3_m0_wo2_mtree_madd2_0_constmult0_add_3_b <= STD_LOGIC_VECTOR((30 downto 30 => u3_m0_wo2_mtree_madd2_0_constmult0_shift2_q(29)) & u3_m0_wo2_mtree_madd2_0_constmult0_shift2_q);
    u3_m0_wo2_mtree_madd2_0_constmult0_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo2_mtree_madd2_0_constmult0_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo2_mtree_madd2_0_constmult0_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo2_mtree_madd2_0_constmult0_add_3_a) + SIGNED(u3_m0_wo2_mtree_madd2_0_constmult0_add_3_b));
        END IF;
    END PROCESS;
    u3_m0_wo2_mtree_madd2_0_constmult0_add_3_q <= u3_m0_wo2_mtree_madd2_0_constmult0_add_3_o(30 downto 0);


	--u3_m0_wo0_wi2_delayr2(DELAY,139)@10
    u3_m0_wo0_wi2_delayr2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_14, xout => u3_m0_wo0_wi2_delayr2_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u3_m0_wo2_wi1_sym_add1(ADD,404)@10
    u3_m0_wo2_wi1_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_13(15)) & xIn_13);
    u3_m0_wo2_wi1_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u3_m0_wo0_wi2_delayr2_q(15)) & u3_m0_wo0_wi2_delayr2_q);
    u3_m0_wo2_wi1_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo2_wi1_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo2_wi1_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo2_wi1_sym_add1_a) + SIGNED(u3_m0_wo2_wi1_sym_add1_b));
        END IF;
    END PROCESS;
    u3_m0_wo2_wi1_sym_add1_q <= u3_m0_wo2_wi1_sym_add1_o(16 downto 0);


	--d_u3_m0_wo2_wi1_sym_add1_q_12(DELAY,1264)@11
    d_u3_m0_wo2_wi1_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u3_m0_wo2_wi1_sym_add1_q, xout => d_u3_m0_wo2_wi1_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u3_m0_wo2_mtree_madd2_0_constmult1_shift1(BITSHIFT,1145)@12
    u3_m0_wo2_mtree_madd2_0_constmult1_shift1_q_int <= d_u3_m0_wo2_wi1_sym_add1_q_12_q & "0000000000";
    u3_m0_wo2_mtree_madd2_0_constmult1_shift1_q <= u3_m0_wo2_mtree_madd2_0_constmult1_shift1_q_int(26 downto 0);

	--u3_m0_wo2_mtree_madd2_0_constmult1_sub_0(SUB,1144)@11
    u3_m0_wo2_mtree_madd2_0_constmult1_sub_0_a <= STD_LOGIC_VECTOR((17 downto 1 => GND_q(0)) & GND_q);
    u3_m0_wo2_mtree_madd2_0_constmult1_sub_0_b <= STD_LOGIC_VECTOR((17 downto 17 => u3_m0_wo2_wi1_sym_add1_q(16)) & u3_m0_wo2_wi1_sym_add1_q);
    u3_m0_wo2_mtree_madd2_0_constmult1_sub_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo2_mtree_madd2_0_constmult1_sub_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo2_mtree_madd2_0_constmult1_sub_0_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo2_mtree_madd2_0_constmult1_sub_0_a) - SIGNED(u3_m0_wo2_mtree_madd2_0_constmult1_sub_0_b));
        END IF;
    END PROCESS;
    u3_m0_wo2_mtree_madd2_0_constmult1_sub_0_q <= u3_m0_wo2_mtree_madd2_0_constmult1_sub_0_o(17 downto 0);


	--u3_m0_wo2_mtree_madd2_0_constmult1_sub_2(SUB,1146)@12
    u3_m0_wo2_mtree_madd2_0_constmult1_sub_2_a <= STD_LOGIC_VECTOR((27 downto 18 => u3_m0_wo2_mtree_madd2_0_constmult1_sub_0_q(17)) & u3_m0_wo2_mtree_madd2_0_constmult1_sub_0_q);
    u3_m0_wo2_mtree_madd2_0_constmult1_sub_2_b <= STD_LOGIC_VECTOR((27 downto 27 => u3_m0_wo2_mtree_madd2_0_constmult1_shift1_q(26)) & u3_m0_wo2_mtree_madd2_0_constmult1_shift1_q);
    u3_m0_wo2_mtree_madd2_0_constmult1_sub_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo2_mtree_madd2_0_constmult1_sub_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo2_mtree_madd2_0_constmult1_sub_2_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo2_mtree_madd2_0_constmult1_sub_2_a) - SIGNED(u3_m0_wo2_mtree_madd2_0_constmult1_sub_2_b));
        END IF;
    END PROCESS;
    u3_m0_wo2_mtree_madd2_0_constmult1_sub_2_q <= u3_m0_wo2_mtree_madd2_0_constmult1_sub_2_o(27 downto 0);


	--u3_m0_wo2_mtree_madd2_0_sum1(ADD,1147)@13
    u3_m0_wo2_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u3_m0_wo2_mtree_madd2_0_constmult1_sub_2_q(27)) & u3_m0_wo2_mtree_madd2_0_constmult1_sub_2_q);
    u3_m0_wo2_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u3_m0_wo2_mtree_madd2_0_constmult0_add_3_q(30)) & u3_m0_wo2_mtree_madd2_0_constmult0_add_3_q);
    u3_m0_wo2_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo2_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo2_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo2_mtree_madd2_0_sum1_a) + SIGNED(u3_m0_wo2_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u3_m0_wo2_mtree_madd2_0_sum1_q <= u3_m0_wo2_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u3_m0_wo0_wi3_phasedelay1_q_14_replace_mem(DUALMEM,1369)
    d_u3_m0_wo0_wi3_phasedelay1_q_14_replace_mem_reset0 <= areset;
    d_u3_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ia <= u3_m0_wo0_wi3_delayr1_q;
    d_u3_m0_wo0_wi3_phasedelay1_q_14_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q;
    d_u3_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q;
    d_u3_m0_wo0_wi3_phasedelay1_q_14_replace_mem_dmem : altsyncram
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
        aclr1 => d_u3_m0_wo0_wi3_phasedelay1_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u3_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u3_m0_wo0_wi3_phasedelay1_q_14_replace_mem_iq,
        address_a => d_u3_m0_wo0_wi3_phasedelay1_q_14_replace_mem_aa,
        data_a => d_u3_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ia
    );
        d_u3_m0_wo0_wi3_phasedelay1_q_14_replace_mem_q <= d_u3_m0_wo0_wi3_phasedelay1_q_14_replace_mem_iq(15 downto 0);

	--u3_m0_wo1_mtree_mult1_0_shift0(BITSHIFT,1115)@14
    u3_m0_wo1_mtree_mult1_0_shift0_q_int <= d_u3_m0_wo0_wi3_phasedelay1_q_14_replace_mem_q & "00000000000000";
    u3_m0_wo1_mtree_mult1_0_shift0_q <= u3_m0_wo1_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u3_m0_wo0_wi3_sym_add1(ADD,152)@10
    u3_m0_wo0_wi3_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => u3_m0_wo0_wi3_delayr1_q(15)) & u3_m0_wo0_wi3_delayr1_q);
    u3_m0_wo0_wi3_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u3_m0_wo0_wi2_delayr2_q(15)) & u3_m0_wo0_wi2_delayr2_q);
    u3_m0_wo0_wi3_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo0_wi3_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo0_wi3_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo0_wi3_sym_add1_a) + SIGNED(u3_m0_wo0_wi3_sym_add1_b));
        END IF;
    END PROCESS;
    u3_m0_wo0_wi3_sym_add1_q <= u3_m0_wo0_wi3_sym_add1_o(16 downto 0);


	--d_u3_m0_wo0_wi3_sym_add1_q_12(DELAY,1252)@11
    d_u3_m0_wo0_wi3_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u3_m0_wo0_wi3_sym_add1_q, xout => d_u3_m0_wo0_wi3_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u3_m0_wo0_mtree_madd2_0_constmult1_shift2(BITSHIFT,1105)@12
    u3_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int <= d_u3_m0_wo0_wi3_sym_add1_q_12_q & "0000000000000";
    u3_m0_wo0_mtree_madd2_0_constmult1_shift2_q <= u3_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int(29 downto 0);

	--u3_m0_wo0_mtree_madd2_0_constmult1_shift0(BITSHIFT,1103)@11
    u3_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int <= u3_m0_wo0_wi3_sym_add1_q & "0000000000";
    u3_m0_wo0_mtree_madd2_0_constmult1_shift0_q <= u3_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int(26 downto 0);

	--u3_m0_wo0_mtree_madd2_0_constmult1_add_1(ADD,1104)@11
    u3_m0_wo0_mtree_madd2_0_constmult1_add_1_a <= STD_LOGIC_VECTOR((27 downto 17 => u3_m0_wo0_wi3_sym_add1_q(16)) & u3_m0_wo0_wi3_sym_add1_q);
    u3_m0_wo0_mtree_madd2_0_constmult1_add_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u3_m0_wo0_mtree_madd2_0_constmult1_shift0_q(26)) & u3_m0_wo0_mtree_madd2_0_constmult1_shift0_q);
    u3_m0_wo0_mtree_madd2_0_constmult1_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo0_mtree_madd2_0_constmult1_add_1_a) + SIGNED(u3_m0_wo0_mtree_madd2_0_constmult1_add_1_b));
        END IF;
    END PROCESS;
    u3_m0_wo0_mtree_madd2_0_constmult1_add_1_q <= u3_m0_wo0_mtree_madd2_0_constmult1_add_1_o(27 downto 0);


	--u3_m0_wo0_mtree_madd2_0_constmult1_add_3(ADD,1106)@12
    u3_m0_wo0_mtree_madd2_0_constmult1_add_3_a <= STD_LOGIC_VECTOR((30 downto 28 => u3_m0_wo0_mtree_madd2_0_constmult1_add_1_q(27)) & u3_m0_wo0_mtree_madd2_0_constmult1_add_1_q);
    u3_m0_wo0_mtree_madd2_0_constmult1_add_3_b <= STD_LOGIC_VECTOR((30 downto 30 => u3_m0_wo0_mtree_madd2_0_constmult1_shift2_q(29)) & u3_m0_wo0_mtree_madd2_0_constmult1_shift2_q);
    u3_m0_wo0_mtree_madd2_0_constmult1_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo0_mtree_madd2_0_constmult1_add_3_a) + SIGNED(u3_m0_wo0_mtree_madd2_0_constmult1_add_3_b));
        END IF;
    END PROCESS;
    u3_m0_wo0_mtree_madd2_0_constmult1_add_3_q <= u3_m0_wo0_mtree_madd2_0_constmult1_add_3_o(30 downto 0);


	--u3_m0_wo0_wi1_delayr3(DELAY,133)@10
    u3_m0_wo0_wi1_delayr3 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_13, xout => u3_m0_wo0_wi1_delayr3_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u3_m0_wo0_wi0_sym_add0(ADD,151)@10
    u3_m0_wo0_wi0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_12(15)) & xIn_12);
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


	--d_u3_m0_wo0_wi0_sym_add0_q_12(DELAY,1251)@11
    d_u3_m0_wo0_wi0_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u3_m0_wo0_wi0_sym_add0_q, xout => d_u3_m0_wo0_wi0_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u3_m0_wo0_mtree_madd2_0_constmult0_shift1(BITSHIFT,1101)@12
    u3_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int <= d_u3_m0_wo0_wi0_sym_add0_q_12_q & "0000000000";
    u3_m0_wo0_mtree_madd2_0_constmult0_shift1_q <= u3_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int(26 downto 0);

	--u3_m0_wo0_mtree_madd2_0_constmult0_sub_0(SUB,1100)@11
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_a <= STD_LOGIC_VECTOR((17 downto 1 => GND_q(0)) & GND_q);
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_b <= STD_LOGIC_VECTOR((17 downto 17 => u3_m0_wo0_wi0_sym_add0_q(16)) & u3_m0_wo0_wi0_sym_add0_q);
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_a) - SIGNED(u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_b));
        END IF;
    END PROCESS;
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_q <= u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_o(17 downto 0);


	--u3_m0_wo0_mtree_madd2_0_constmult0_sub_2(SUB,1102)@12
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_2_a <= STD_LOGIC_VECTOR((27 downto 18 => u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_q(17)) & u3_m0_wo0_mtree_madd2_0_constmult0_sub_0_q);
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_2_b <= STD_LOGIC_VECTOR((27 downto 27 => u3_m0_wo0_mtree_madd2_0_constmult0_shift1_q(26)) & u3_m0_wo0_mtree_madd2_0_constmult0_shift1_q);
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult0_sub_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo0_mtree_madd2_0_constmult0_sub_2_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo0_mtree_madd2_0_constmult0_sub_2_a) - SIGNED(u3_m0_wo0_mtree_madd2_0_constmult0_sub_2_b));
        END IF;
    END PROCESS;
    u3_m0_wo0_mtree_madd2_0_constmult0_sub_2_q <= u3_m0_wo0_mtree_madd2_0_constmult0_sub_2_o(27 downto 0);


	--u3_m0_wo0_mtree_madd2_0_sum1(ADD,1107)@13
    u3_m0_wo0_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u3_m0_wo0_mtree_madd2_0_constmult0_sub_2_q(27)) & u3_m0_wo0_mtree_madd2_0_constmult0_sub_2_q);
    u3_m0_wo0_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u3_m0_wo0_mtree_madd2_0_constmult1_add_3_q(30)) & u3_m0_wo0_mtree_madd2_0_constmult1_add_3_q);
    u3_m0_wo0_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_m0_wo0_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_m0_wo0_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u3_m0_wo0_mtree_madd2_0_sum1_a) + SIGNED(u3_m0_wo0_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u3_m0_wo0_mtree_madd2_0_sum1_q <= u3_m0_wo0_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u2_m0_wo4_wi2_phasedelay1_q_14_replace_mem(DUALMEM,1453)
    d_u2_m0_wo4_wi2_phasedelay1_q_14_replace_mem_reset0 <= areset;
    d_u2_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ia <= xIn_10;
    d_u2_m0_wo4_wi2_phasedelay1_q_14_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q;
    d_u2_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q;
    d_u2_m0_wo4_wi2_phasedelay1_q_14_replace_mem_dmem : altsyncram
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
        aclr1 => d_u2_m0_wo4_wi2_phasedelay1_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u2_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u2_m0_wo4_wi2_phasedelay1_q_14_replace_mem_iq,
        address_a => d_u2_m0_wo4_wi2_phasedelay1_q_14_replace_mem_aa,
        data_a => d_u2_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ia
    );
        d_u2_m0_wo4_wi2_phasedelay1_q_14_replace_mem_q <= d_u2_m0_wo4_wi2_phasedelay1_q_14_replace_mem_iq(15 downto 0);

	--u2_m0_wo7_mtree_mult1_0_shift0(BITSHIFT,1233)@14
    u2_m0_wo7_mtree_mult1_0_shift0_q_int <= d_u2_m0_wo4_wi2_phasedelay1_q_14_replace_mem_q & "00000000000000";
    u2_m0_wo7_mtree_mult1_0_shift0_q <= u2_m0_wo7_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u2_m0_wo6_wi2_sym_add0(ADD,869)@10
    u2_m0_wo6_wi2_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_10(15)) & xIn_10);
    u2_m0_wo6_wi2_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_9(15)) & xIn_9);
    u2_m0_wo6_wi2_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo6_wi2_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo6_wi2_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo6_wi2_sym_add0_a) + SIGNED(u2_m0_wo6_wi2_sym_add0_b));
        END IF;
    END PROCESS;
    u2_m0_wo6_wi2_sym_add0_q <= u2_m0_wo6_wi2_sym_add0_o(16 downto 0);


	--d_u2_m0_wo6_wi2_sym_add0_q_12(DELAY,1281)@11
    d_u2_m0_wo6_wi2_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u2_m0_wo6_wi2_sym_add0_q, xout => d_u2_m0_wo6_wi2_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u2_m0_wo6_mtree_madd2_0_constmult0_shift2(BITSHIFT,1214)@12
    u2_m0_wo6_mtree_madd2_0_constmult0_shift2_q_int <= d_u2_m0_wo6_wi2_sym_add0_q_12_q & "0000000000000";
    u2_m0_wo6_mtree_madd2_0_constmult0_shift2_q <= u2_m0_wo6_mtree_madd2_0_constmult0_shift2_q_int(29 downto 0);

	--u2_m0_wo6_mtree_madd2_0_constmult0_shift0(BITSHIFT,1212)@11
    u2_m0_wo6_mtree_madd2_0_constmult0_shift0_q_int <= u2_m0_wo6_wi2_sym_add0_q & "0000000000";
    u2_m0_wo6_mtree_madd2_0_constmult0_shift0_q <= u2_m0_wo6_mtree_madd2_0_constmult0_shift0_q_int(26 downto 0);

	--u2_m0_wo6_mtree_madd2_0_constmult0_add_1(ADD,1213)@11
    u2_m0_wo6_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((27 downto 17 => u2_m0_wo6_wi2_sym_add0_q(16)) & u2_m0_wo6_wi2_sym_add0_q);
    u2_m0_wo6_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u2_m0_wo6_mtree_madd2_0_constmult0_shift0_q(26)) & u2_m0_wo6_mtree_madd2_0_constmult0_shift0_q);
    u2_m0_wo6_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo6_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo6_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo6_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u2_m0_wo6_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u2_m0_wo6_mtree_madd2_0_constmult0_add_1_q <= u2_m0_wo6_mtree_madd2_0_constmult0_add_1_o(27 downto 0);


	--u2_m0_wo6_mtree_madd2_0_constmult0_add_3(ADD,1215)@12
    u2_m0_wo6_mtree_madd2_0_constmult0_add_3_a <= STD_LOGIC_VECTOR((30 downto 28 => u2_m0_wo6_mtree_madd2_0_constmult0_add_1_q(27)) & u2_m0_wo6_mtree_madd2_0_constmult0_add_1_q);
    u2_m0_wo6_mtree_madd2_0_constmult0_add_3_b <= STD_LOGIC_VECTOR((30 downto 30 => u2_m0_wo6_mtree_madd2_0_constmult0_shift2_q(29)) & u2_m0_wo6_mtree_madd2_0_constmult0_shift2_q);
    u2_m0_wo6_mtree_madd2_0_constmult0_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo6_mtree_madd2_0_constmult0_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo6_mtree_madd2_0_constmult0_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo6_mtree_madd2_0_constmult0_add_3_a) + SIGNED(u2_m0_wo6_mtree_madd2_0_constmult0_add_3_b));
        END IF;
    END PROCESS;
    u2_m0_wo6_mtree_madd2_0_constmult0_add_3_q <= u2_m0_wo6_mtree_madd2_0_constmult0_add_3_o(30 downto 0);


	--u2_m0_wo6_wi3_sym_add1(ADD,870)@10
    u2_m0_wo6_wi3_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_11(15)) & xIn_11);
    u2_m0_wo6_wi3_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_8(15)) & xIn_8);
    u2_m0_wo6_wi3_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo6_wi3_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo6_wi3_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo6_wi3_sym_add1_a) + SIGNED(u2_m0_wo6_wi3_sym_add1_b));
        END IF;
    END PROCESS;
    u2_m0_wo6_wi3_sym_add1_q <= u2_m0_wo6_wi3_sym_add1_o(16 downto 0);


	--d_u2_m0_wo6_wi3_sym_add1_q_12(DELAY,1282)@11
    d_u2_m0_wo6_wi3_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u2_m0_wo6_wi3_sym_add1_q, xout => d_u2_m0_wo6_wi3_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u2_m0_wo6_mtree_madd2_0_constmult1_shift1(BITSHIFT,1217)@12
    u2_m0_wo6_mtree_madd2_0_constmult1_shift1_q_int <= d_u2_m0_wo6_wi3_sym_add1_q_12_q & "0000000000";
    u2_m0_wo6_mtree_madd2_0_constmult1_shift1_q <= u2_m0_wo6_mtree_madd2_0_constmult1_shift1_q_int(26 downto 0);

	--u2_m0_wo6_mtree_madd2_0_constmult1_sub_0(SUB,1216)@11
    u2_m0_wo6_mtree_madd2_0_constmult1_sub_0_a <= STD_LOGIC_VECTOR((17 downto 1 => GND_q(0)) & GND_q);
    u2_m0_wo6_mtree_madd2_0_constmult1_sub_0_b <= STD_LOGIC_VECTOR((17 downto 17 => u2_m0_wo6_wi3_sym_add1_q(16)) & u2_m0_wo6_wi3_sym_add1_q);
    u2_m0_wo6_mtree_madd2_0_constmult1_sub_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo6_mtree_madd2_0_constmult1_sub_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo6_mtree_madd2_0_constmult1_sub_0_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo6_mtree_madd2_0_constmult1_sub_0_a) - SIGNED(u2_m0_wo6_mtree_madd2_0_constmult1_sub_0_b));
        END IF;
    END PROCESS;
    u2_m0_wo6_mtree_madd2_0_constmult1_sub_0_q <= u2_m0_wo6_mtree_madd2_0_constmult1_sub_0_o(17 downto 0);


	--u2_m0_wo6_mtree_madd2_0_constmult1_sub_2(SUB,1218)@12
    u2_m0_wo6_mtree_madd2_0_constmult1_sub_2_a <= STD_LOGIC_VECTOR((27 downto 18 => u2_m0_wo6_mtree_madd2_0_constmult1_sub_0_q(17)) & u2_m0_wo6_mtree_madd2_0_constmult1_sub_0_q);
    u2_m0_wo6_mtree_madd2_0_constmult1_sub_2_b <= STD_LOGIC_VECTOR((27 downto 27 => u2_m0_wo6_mtree_madd2_0_constmult1_shift1_q(26)) & u2_m0_wo6_mtree_madd2_0_constmult1_shift1_q);
    u2_m0_wo6_mtree_madd2_0_constmult1_sub_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo6_mtree_madd2_0_constmult1_sub_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo6_mtree_madd2_0_constmult1_sub_2_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo6_mtree_madd2_0_constmult1_sub_2_a) - SIGNED(u2_m0_wo6_mtree_madd2_0_constmult1_sub_2_b));
        END IF;
    END PROCESS;
    u2_m0_wo6_mtree_madd2_0_constmult1_sub_2_q <= u2_m0_wo6_mtree_madd2_0_constmult1_sub_2_o(27 downto 0);


	--u2_m0_wo6_mtree_madd2_0_sum1(ADD,1219)@13
    u2_m0_wo6_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u2_m0_wo6_mtree_madd2_0_constmult1_sub_2_q(27)) & u2_m0_wo6_mtree_madd2_0_constmult1_sub_2_q);
    u2_m0_wo6_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u2_m0_wo6_mtree_madd2_0_constmult0_add_3_q(30)) & u2_m0_wo6_mtree_madd2_0_constmult0_add_3_q);
    u2_m0_wo6_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo6_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo6_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo6_mtree_madd2_0_sum1_a) + SIGNED(u2_m0_wo6_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u2_m0_wo6_mtree_madd2_0_sum1_q <= u2_m0_wo6_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u2_m0_wo2_wi1_phasedelay1_q_14_replace_mem(DUALMEM,1405)
    d_u2_m0_wo2_wi1_phasedelay1_q_14_replace_mem_reset0 <= areset;
    d_u2_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ia <= xIn_9;
    d_u2_m0_wo2_wi1_phasedelay1_q_14_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q;
    d_u2_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q;
    d_u2_m0_wo2_wi1_phasedelay1_q_14_replace_mem_dmem : altsyncram
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
        aclr1 => d_u2_m0_wo2_wi1_phasedelay1_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u2_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u2_m0_wo2_wi1_phasedelay1_q_14_replace_mem_iq,
        address_a => d_u2_m0_wo2_wi1_phasedelay1_q_14_replace_mem_aa,
        data_a => d_u2_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ia
    );
        d_u2_m0_wo2_wi1_phasedelay1_q_14_replace_mem_q <= d_u2_m0_wo2_wi1_phasedelay1_q_14_replace_mem_iq(15 downto 0);

	--u2_m0_wo5_mtree_mult1_0_shift0(BITSHIFT,1193)@14
    u2_m0_wo5_mtree_mult1_0_shift0_q_int <= d_u2_m0_wo2_wi1_phasedelay1_q_14_replace_mem_q & "00000000000000";
    u2_m0_wo5_mtree_mult1_0_shift0_q <= u2_m0_wo5_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u2_m0_wo4_wi1_sym_add0(ADD,617)@10
    u2_m0_wo4_wi1_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_9(15)) & xIn_9);
    u2_m0_wo4_wi1_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_8(15)) & xIn_8);
    u2_m0_wo4_wi1_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo4_wi1_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo4_wi1_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo4_wi1_sym_add0_a) + SIGNED(u2_m0_wo4_wi1_sym_add0_b));
        END IF;
    END PROCESS;
    u2_m0_wo4_wi1_sym_add0_q <= u2_m0_wo4_wi1_sym_add0_o(16 downto 0);


	--d_u2_m0_wo4_wi1_sym_add0_q_12(DELAY,1272)@11
    d_u2_m0_wo4_wi1_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u2_m0_wo4_wi1_sym_add0_q, xout => d_u2_m0_wo4_wi1_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u2_m0_wo4_mtree_madd2_0_constmult0_shift2(BITSHIFT,1174)@12
    u2_m0_wo4_mtree_madd2_0_constmult0_shift2_q_int <= d_u2_m0_wo4_wi1_sym_add0_q_12_q & "0000000000000";
    u2_m0_wo4_mtree_madd2_0_constmult0_shift2_q <= u2_m0_wo4_mtree_madd2_0_constmult0_shift2_q_int(29 downto 0);

	--u2_m0_wo4_mtree_madd2_0_constmult0_shift0(BITSHIFT,1172)@11
    u2_m0_wo4_mtree_madd2_0_constmult0_shift0_q_int <= u2_m0_wo4_wi1_sym_add0_q & "0000000000";
    u2_m0_wo4_mtree_madd2_0_constmult0_shift0_q <= u2_m0_wo4_mtree_madd2_0_constmult0_shift0_q_int(26 downto 0);

	--u2_m0_wo4_mtree_madd2_0_constmult0_add_1(ADD,1173)@11
    u2_m0_wo4_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((27 downto 17 => u2_m0_wo4_wi1_sym_add0_q(16)) & u2_m0_wo4_wi1_sym_add0_q);
    u2_m0_wo4_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u2_m0_wo4_mtree_madd2_0_constmult0_shift0_q(26)) & u2_m0_wo4_mtree_madd2_0_constmult0_shift0_q);
    u2_m0_wo4_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo4_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo4_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo4_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u2_m0_wo4_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u2_m0_wo4_mtree_madd2_0_constmult0_add_1_q <= u2_m0_wo4_mtree_madd2_0_constmult0_add_1_o(27 downto 0);


	--u2_m0_wo4_mtree_madd2_0_constmult0_add_3(ADD,1175)@12
    u2_m0_wo4_mtree_madd2_0_constmult0_add_3_a <= STD_LOGIC_VECTOR((30 downto 28 => u2_m0_wo4_mtree_madd2_0_constmult0_add_1_q(27)) & u2_m0_wo4_mtree_madd2_0_constmult0_add_1_q);
    u2_m0_wo4_mtree_madd2_0_constmult0_add_3_b <= STD_LOGIC_VECTOR((30 downto 30 => u2_m0_wo4_mtree_madd2_0_constmult0_shift2_q(29)) & u2_m0_wo4_mtree_madd2_0_constmult0_shift2_q);
    u2_m0_wo4_mtree_madd2_0_constmult0_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo4_mtree_madd2_0_constmult0_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo4_mtree_madd2_0_constmult0_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo4_mtree_madd2_0_constmult0_add_3_a) + SIGNED(u2_m0_wo4_mtree_madd2_0_constmult0_add_3_b));
        END IF;
    END PROCESS;
    u2_m0_wo4_mtree_madd2_0_constmult0_add_3_q <= u2_m0_wo4_mtree_madd2_0_constmult0_add_3_o(30 downto 0);


	--u2_m0_wo0_wi3_delayr1(DELAY,107)@10
    u2_m0_wo0_wi3_delayr1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_11, xout => u2_m0_wo0_wi3_delayr1_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u2_m0_wo4_wi2_sym_add1(ADD,618)@10
    u2_m0_wo4_wi2_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_10(15)) & xIn_10);
    u2_m0_wo4_wi2_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u2_m0_wo0_wi3_delayr1_q(15)) & u2_m0_wo0_wi3_delayr1_q);
    u2_m0_wo4_wi2_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo4_wi2_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo4_wi2_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo4_wi2_sym_add1_a) + SIGNED(u2_m0_wo4_wi2_sym_add1_b));
        END IF;
    END PROCESS;
    u2_m0_wo4_wi2_sym_add1_q <= u2_m0_wo4_wi2_sym_add1_o(16 downto 0);


	--d_u2_m0_wo4_wi2_sym_add1_q_12(DELAY,1273)@11
    d_u2_m0_wo4_wi2_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u2_m0_wo4_wi2_sym_add1_q, xout => d_u2_m0_wo4_wi2_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u2_m0_wo4_mtree_madd2_0_constmult1_shift1(BITSHIFT,1177)@12
    u2_m0_wo4_mtree_madd2_0_constmult1_shift1_q_int <= d_u2_m0_wo4_wi2_sym_add1_q_12_q & "0000000000";
    u2_m0_wo4_mtree_madd2_0_constmult1_shift1_q <= u2_m0_wo4_mtree_madd2_0_constmult1_shift1_q_int(26 downto 0);

	--u2_m0_wo4_mtree_madd2_0_constmult1_sub_0(SUB,1176)@11
    u2_m0_wo4_mtree_madd2_0_constmult1_sub_0_a <= STD_LOGIC_VECTOR((17 downto 1 => GND_q(0)) & GND_q);
    u2_m0_wo4_mtree_madd2_0_constmult1_sub_0_b <= STD_LOGIC_VECTOR((17 downto 17 => u2_m0_wo4_wi2_sym_add1_q(16)) & u2_m0_wo4_wi2_sym_add1_q);
    u2_m0_wo4_mtree_madd2_0_constmult1_sub_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo4_mtree_madd2_0_constmult1_sub_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo4_mtree_madd2_0_constmult1_sub_0_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo4_mtree_madd2_0_constmult1_sub_0_a) - SIGNED(u2_m0_wo4_mtree_madd2_0_constmult1_sub_0_b));
        END IF;
    END PROCESS;
    u2_m0_wo4_mtree_madd2_0_constmult1_sub_0_q <= u2_m0_wo4_mtree_madd2_0_constmult1_sub_0_o(17 downto 0);


	--u2_m0_wo4_mtree_madd2_0_constmult1_sub_2(SUB,1178)@12
    u2_m0_wo4_mtree_madd2_0_constmult1_sub_2_a <= STD_LOGIC_VECTOR((27 downto 18 => u2_m0_wo4_mtree_madd2_0_constmult1_sub_0_q(17)) & u2_m0_wo4_mtree_madd2_0_constmult1_sub_0_q);
    u2_m0_wo4_mtree_madd2_0_constmult1_sub_2_b <= STD_LOGIC_VECTOR((27 downto 27 => u2_m0_wo4_mtree_madd2_0_constmult1_shift1_q(26)) & u2_m0_wo4_mtree_madd2_0_constmult1_shift1_q);
    u2_m0_wo4_mtree_madd2_0_constmult1_sub_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo4_mtree_madd2_0_constmult1_sub_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo4_mtree_madd2_0_constmult1_sub_2_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo4_mtree_madd2_0_constmult1_sub_2_a) - SIGNED(u2_m0_wo4_mtree_madd2_0_constmult1_sub_2_b));
        END IF;
    END PROCESS;
    u2_m0_wo4_mtree_madd2_0_constmult1_sub_2_q <= u2_m0_wo4_mtree_madd2_0_constmult1_sub_2_o(27 downto 0);


	--u2_m0_wo4_mtree_madd2_0_sum1(ADD,1179)@13
    u2_m0_wo4_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u2_m0_wo4_mtree_madd2_0_constmult1_sub_2_q(27)) & u2_m0_wo4_mtree_madd2_0_constmult1_sub_2_q);
    u2_m0_wo4_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u2_m0_wo4_mtree_madd2_0_constmult0_add_3_q(30)) & u2_m0_wo4_mtree_madd2_0_constmult0_add_3_q);
    u2_m0_wo4_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo4_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo4_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo4_mtree_madd2_0_sum1_a) + SIGNED(u2_m0_wo4_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u2_m0_wo4_mtree_madd2_0_sum1_q <= u2_m0_wo4_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem(DUALMEM,1333)
    d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_reset0 <= areset;
    d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ia <= xIn_8;
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

	--u2_m0_wo3_mtree_mult1_0_shift0(BITSHIFT,1153)@14
    u2_m0_wo3_mtree_mult1_0_shift0_q_int <= d_u2_m0_wo0_wi0_phasedelay0_q_14_replace_mem_q & "00000000000000";
    u2_m0_wo3_mtree_mult1_0_shift0_q <= u2_m0_wo3_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u2_m0_wo2_wi0_sym_add0(ADD,365)@10
    u2_m0_wo2_wi0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_8(15)) & xIn_8);
    u2_m0_wo2_wi0_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => u2_m0_wo0_wi3_delayr1_q(15)) & u2_m0_wo0_wi3_delayr1_q);
    u2_m0_wo2_wi0_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo2_wi0_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo2_wi0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo2_wi0_sym_add0_a) + SIGNED(u2_m0_wo2_wi0_sym_add0_b));
        END IF;
    END PROCESS;
    u2_m0_wo2_wi0_sym_add0_q <= u2_m0_wo2_wi0_sym_add0_o(16 downto 0);


	--d_u2_m0_wo2_wi0_sym_add0_q_12(DELAY,1260)@11
    d_u2_m0_wo2_wi0_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u2_m0_wo2_wi0_sym_add0_q, xout => d_u2_m0_wo2_wi0_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u2_m0_wo2_mtree_madd2_0_constmult0_shift2(BITSHIFT,1134)@12
    u2_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int <= d_u2_m0_wo2_wi0_sym_add0_q_12_q & "0000000000000";
    u2_m0_wo2_mtree_madd2_0_constmult0_shift2_q <= u2_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int(29 downto 0);

	--u2_m0_wo2_mtree_madd2_0_constmult0_shift0(BITSHIFT,1132)@11
    u2_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int <= u2_m0_wo2_wi0_sym_add0_q & "0000000000";
    u2_m0_wo2_mtree_madd2_0_constmult0_shift0_q <= u2_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int(26 downto 0);

	--u2_m0_wo2_mtree_madd2_0_constmult0_add_1(ADD,1133)@11
    u2_m0_wo2_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((27 downto 17 => u2_m0_wo2_wi0_sym_add0_q(16)) & u2_m0_wo2_wi0_sym_add0_q);
    u2_m0_wo2_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u2_m0_wo2_mtree_madd2_0_constmult0_shift0_q(26)) & u2_m0_wo2_mtree_madd2_0_constmult0_shift0_q);
    u2_m0_wo2_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo2_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo2_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo2_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u2_m0_wo2_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u2_m0_wo2_mtree_madd2_0_constmult0_add_1_q <= u2_m0_wo2_mtree_madd2_0_constmult0_add_1_o(27 downto 0);


	--u2_m0_wo2_mtree_madd2_0_constmult0_add_3(ADD,1135)@12
    u2_m0_wo2_mtree_madd2_0_constmult0_add_3_a <= STD_LOGIC_VECTOR((30 downto 28 => u2_m0_wo2_mtree_madd2_0_constmult0_add_1_q(27)) & u2_m0_wo2_mtree_madd2_0_constmult0_add_1_q);
    u2_m0_wo2_mtree_madd2_0_constmult0_add_3_b <= STD_LOGIC_VECTOR((30 downto 30 => u2_m0_wo2_mtree_madd2_0_constmult0_shift2_q(29)) & u2_m0_wo2_mtree_madd2_0_constmult0_shift2_q);
    u2_m0_wo2_mtree_madd2_0_constmult0_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo2_mtree_madd2_0_constmult0_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo2_mtree_madd2_0_constmult0_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo2_mtree_madd2_0_constmult0_add_3_a) + SIGNED(u2_m0_wo2_mtree_madd2_0_constmult0_add_3_b));
        END IF;
    END PROCESS;
    u2_m0_wo2_mtree_madd2_0_constmult0_add_3_q <= u2_m0_wo2_mtree_madd2_0_constmult0_add_3_o(30 downto 0);


	--u2_m0_wo0_wi2_delayr2(DELAY,101)@10
    u2_m0_wo0_wi2_delayr2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_10, xout => u2_m0_wo0_wi2_delayr2_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u2_m0_wo2_wi1_sym_add1(ADD,366)@10
    u2_m0_wo2_wi1_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_9(15)) & xIn_9);
    u2_m0_wo2_wi1_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u2_m0_wo0_wi2_delayr2_q(15)) & u2_m0_wo0_wi2_delayr2_q);
    u2_m0_wo2_wi1_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo2_wi1_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo2_wi1_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo2_wi1_sym_add1_a) + SIGNED(u2_m0_wo2_wi1_sym_add1_b));
        END IF;
    END PROCESS;
    u2_m0_wo2_wi1_sym_add1_q <= u2_m0_wo2_wi1_sym_add1_o(16 downto 0);


	--d_u2_m0_wo2_wi1_sym_add1_q_12(DELAY,1261)@11
    d_u2_m0_wo2_wi1_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u2_m0_wo2_wi1_sym_add1_q, xout => d_u2_m0_wo2_wi1_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u2_m0_wo2_mtree_madd2_0_constmult1_shift1(BITSHIFT,1137)@12
    u2_m0_wo2_mtree_madd2_0_constmult1_shift1_q_int <= d_u2_m0_wo2_wi1_sym_add1_q_12_q & "0000000000";
    u2_m0_wo2_mtree_madd2_0_constmult1_shift1_q <= u2_m0_wo2_mtree_madd2_0_constmult1_shift1_q_int(26 downto 0);

	--u2_m0_wo2_mtree_madd2_0_constmult1_sub_0(SUB,1136)@11
    u2_m0_wo2_mtree_madd2_0_constmult1_sub_0_a <= STD_LOGIC_VECTOR((17 downto 1 => GND_q(0)) & GND_q);
    u2_m0_wo2_mtree_madd2_0_constmult1_sub_0_b <= STD_LOGIC_VECTOR((17 downto 17 => u2_m0_wo2_wi1_sym_add1_q(16)) & u2_m0_wo2_wi1_sym_add1_q);
    u2_m0_wo2_mtree_madd2_0_constmult1_sub_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo2_mtree_madd2_0_constmult1_sub_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo2_mtree_madd2_0_constmult1_sub_0_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo2_mtree_madd2_0_constmult1_sub_0_a) - SIGNED(u2_m0_wo2_mtree_madd2_0_constmult1_sub_0_b));
        END IF;
    END PROCESS;
    u2_m0_wo2_mtree_madd2_0_constmult1_sub_0_q <= u2_m0_wo2_mtree_madd2_0_constmult1_sub_0_o(17 downto 0);


	--u2_m0_wo2_mtree_madd2_0_constmult1_sub_2(SUB,1138)@12
    u2_m0_wo2_mtree_madd2_0_constmult1_sub_2_a <= STD_LOGIC_VECTOR((27 downto 18 => u2_m0_wo2_mtree_madd2_0_constmult1_sub_0_q(17)) & u2_m0_wo2_mtree_madd2_0_constmult1_sub_0_q);
    u2_m0_wo2_mtree_madd2_0_constmult1_sub_2_b <= STD_LOGIC_VECTOR((27 downto 27 => u2_m0_wo2_mtree_madd2_0_constmult1_shift1_q(26)) & u2_m0_wo2_mtree_madd2_0_constmult1_shift1_q);
    u2_m0_wo2_mtree_madd2_0_constmult1_sub_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo2_mtree_madd2_0_constmult1_sub_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo2_mtree_madd2_0_constmult1_sub_2_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo2_mtree_madd2_0_constmult1_sub_2_a) - SIGNED(u2_m0_wo2_mtree_madd2_0_constmult1_sub_2_b));
        END IF;
    END PROCESS;
    u2_m0_wo2_mtree_madd2_0_constmult1_sub_2_q <= u2_m0_wo2_mtree_madd2_0_constmult1_sub_2_o(27 downto 0);


	--u2_m0_wo2_mtree_madd2_0_sum1(ADD,1139)@13
    u2_m0_wo2_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u2_m0_wo2_mtree_madd2_0_constmult1_sub_2_q(27)) & u2_m0_wo2_mtree_madd2_0_constmult1_sub_2_q);
    u2_m0_wo2_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u2_m0_wo2_mtree_madd2_0_constmult0_add_3_q(30)) & u2_m0_wo2_mtree_madd2_0_constmult0_add_3_q);
    u2_m0_wo2_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo2_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo2_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo2_mtree_madd2_0_sum1_a) + SIGNED(u2_m0_wo2_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u2_m0_wo2_mtree_madd2_0_sum1_q <= u2_m0_wo2_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u2_m0_wo0_wi3_phasedelay1_q_14_replace_mem(DUALMEM,1345)
    d_u2_m0_wo0_wi3_phasedelay1_q_14_replace_mem_reset0 <= areset;
    d_u2_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ia <= u2_m0_wo0_wi3_delayr1_q;
    d_u2_m0_wo0_wi3_phasedelay1_q_14_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q;
    d_u2_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q;
    d_u2_m0_wo0_wi3_phasedelay1_q_14_replace_mem_dmem : altsyncram
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
        aclr1 => d_u2_m0_wo0_wi3_phasedelay1_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u2_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u2_m0_wo0_wi3_phasedelay1_q_14_replace_mem_iq,
        address_a => d_u2_m0_wo0_wi3_phasedelay1_q_14_replace_mem_aa,
        data_a => d_u2_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ia
    );
        d_u2_m0_wo0_wi3_phasedelay1_q_14_replace_mem_q <= d_u2_m0_wo0_wi3_phasedelay1_q_14_replace_mem_iq(15 downto 0);

	--u2_m0_wo1_mtree_mult1_0_shift0(BITSHIFT,1113)@14
    u2_m0_wo1_mtree_mult1_0_shift0_q_int <= d_u2_m0_wo0_wi3_phasedelay1_q_14_replace_mem_q & "00000000000000";
    u2_m0_wo1_mtree_mult1_0_shift0_q <= u2_m0_wo1_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u2_m0_wo0_wi3_sym_add1(ADD,114)@10
    u2_m0_wo0_wi3_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => u2_m0_wo0_wi3_delayr1_q(15)) & u2_m0_wo0_wi3_delayr1_q);
    u2_m0_wo0_wi3_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u2_m0_wo0_wi2_delayr2_q(15)) & u2_m0_wo0_wi2_delayr2_q);
    u2_m0_wo0_wi3_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo0_wi3_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo0_wi3_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo0_wi3_sym_add1_a) + SIGNED(u2_m0_wo0_wi3_sym_add1_b));
        END IF;
    END PROCESS;
    u2_m0_wo0_wi3_sym_add1_q <= u2_m0_wo0_wi3_sym_add1_o(16 downto 0);


	--d_u2_m0_wo0_wi3_sym_add1_q_12(DELAY,1248)@11
    d_u2_m0_wo0_wi3_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u2_m0_wo0_wi3_sym_add1_q, xout => d_u2_m0_wo0_wi3_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u2_m0_wo0_mtree_madd2_0_constmult1_shift2(BITSHIFT,1097)@12
    u2_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int <= d_u2_m0_wo0_wi3_sym_add1_q_12_q & "0000000000000";
    u2_m0_wo0_mtree_madd2_0_constmult1_shift2_q <= u2_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int(29 downto 0);

	--u2_m0_wo0_mtree_madd2_0_constmult1_shift0(BITSHIFT,1095)@11
    u2_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int <= u2_m0_wo0_wi3_sym_add1_q & "0000000000";
    u2_m0_wo0_mtree_madd2_0_constmult1_shift0_q <= u2_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int(26 downto 0);

	--u2_m0_wo0_mtree_madd2_0_constmult1_add_1(ADD,1096)@11
    u2_m0_wo0_mtree_madd2_0_constmult1_add_1_a <= STD_LOGIC_VECTOR((27 downto 17 => u2_m0_wo0_wi3_sym_add1_q(16)) & u2_m0_wo0_wi3_sym_add1_q);
    u2_m0_wo0_mtree_madd2_0_constmult1_add_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u2_m0_wo0_mtree_madd2_0_constmult1_shift0_q(26)) & u2_m0_wo0_mtree_madd2_0_constmult1_shift0_q);
    u2_m0_wo0_mtree_madd2_0_constmult1_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo0_mtree_madd2_0_constmult1_add_1_a) + SIGNED(u2_m0_wo0_mtree_madd2_0_constmult1_add_1_b));
        END IF;
    END PROCESS;
    u2_m0_wo0_mtree_madd2_0_constmult1_add_1_q <= u2_m0_wo0_mtree_madd2_0_constmult1_add_1_o(27 downto 0);


	--u2_m0_wo0_mtree_madd2_0_constmult1_add_3(ADD,1098)@12
    u2_m0_wo0_mtree_madd2_0_constmult1_add_3_a <= STD_LOGIC_VECTOR((30 downto 28 => u2_m0_wo0_mtree_madd2_0_constmult1_add_1_q(27)) & u2_m0_wo0_mtree_madd2_0_constmult1_add_1_q);
    u2_m0_wo0_mtree_madd2_0_constmult1_add_3_b <= STD_LOGIC_VECTOR((30 downto 30 => u2_m0_wo0_mtree_madd2_0_constmult1_shift2_q(29)) & u2_m0_wo0_mtree_madd2_0_constmult1_shift2_q);
    u2_m0_wo0_mtree_madd2_0_constmult1_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo0_mtree_madd2_0_constmult1_add_3_a) + SIGNED(u2_m0_wo0_mtree_madd2_0_constmult1_add_3_b));
        END IF;
    END PROCESS;
    u2_m0_wo0_mtree_madd2_0_constmult1_add_3_q <= u2_m0_wo0_mtree_madd2_0_constmult1_add_3_o(30 downto 0);


	--u2_m0_wo0_wi1_delayr3(DELAY,95)@10
    u2_m0_wo0_wi1_delayr3 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_9, xout => u2_m0_wo0_wi1_delayr3_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u2_m0_wo0_wi0_sym_add0(ADD,113)@10
    u2_m0_wo0_wi0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_8(15)) & xIn_8);
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


	--d_u2_m0_wo0_wi0_sym_add0_q_12(DELAY,1247)@11
    d_u2_m0_wo0_wi0_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u2_m0_wo0_wi0_sym_add0_q, xout => d_u2_m0_wo0_wi0_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u2_m0_wo0_mtree_madd2_0_constmult0_shift1(BITSHIFT,1093)@12
    u2_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int <= d_u2_m0_wo0_wi0_sym_add0_q_12_q & "0000000000";
    u2_m0_wo0_mtree_madd2_0_constmult0_shift1_q <= u2_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int(26 downto 0);

	--u2_m0_wo0_mtree_madd2_0_constmult0_sub_0(SUB,1092)@11
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_a <= STD_LOGIC_VECTOR((17 downto 1 => GND_q(0)) & GND_q);
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_b <= STD_LOGIC_VECTOR((17 downto 17 => u2_m0_wo0_wi0_sym_add0_q(16)) & u2_m0_wo0_wi0_sym_add0_q);
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_a) - SIGNED(u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_b));
        END IF;
    END PROCESS;
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_q <= u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_o(17 downto 0);


	--u2_m0_wo0_mtree_madd2_0_constmult0_sub_2(SUB,1094)@12
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_2_a <= STD_LOGIC_VECTOR((27 downto 18 => u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_q(17)) & u2_m0_wo0_mtree_madd2_0_constmult0_sub_0_q);
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_2_b <= STD_LOGIC_VECTOR((27 downto 27 => u2_m0_wo0_mtree_madd2_0_constmult0_shift1_q(26)) & u2_m0_wo0_mtree_madd2_0_constmult0_shift1_q);
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult0_sub_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo0_mtree_madd2_0_constmult0_sub_2_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo0_mtree_madd2_0_constmult0_sub_2_a) - SIGNED(u2_m0_wo0_mtree_madd2_0_constmult0_sub_2_b));
        END IF;
    END PROCESS;
    u2_m0_wo0_mtree_madd2_0_constmult0_sub_2_q <= u2_m0_wo0_mtree_madd2_0_constmult0_sub_2_o(27 downto 0);


	--u2_m0_wo0_mtree_madd2_0_sum1(ADD,1099)@13
    u2_m0_wo0_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u2_m0_wo0_mtree_madd2_0_constmult0_sub_2_q(27)) & u2_m0_wo0_mtree_madd2_0_constmult0_sub_2_q);
    u2_m0_wo0_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u2_m0_wo0_mtree_madd2_0_constmult1_add_3_q(30)) & u2_m0_wo0_mtree_madd2_0_constmult1_add_3_q);
    u2_m0_wo0_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_m0_wo0_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_m0_wo0_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u2_m0_wo0_mtree_madd2_0_sum1_a) + SIGNED(u2_m0_wo0_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u2_m0_wo0_mtree_madd2_0_sum1_q <= u2_m0_wo0_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u1_m0_wo4_wi2_phasedelay1_q_14_replace_mem(DUALMEM,1441)
    d_u1_m0_wo4_wi2_phasedelay1_q_14_replace_mem_reset0 <= areset;
    d_u1_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ia <= xIn_6;
    d_u1_m0_wo4_wi2_phasedelay1_q_14_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q;
    d_u1_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q;
    d_u1_m0_wo4_wi2_phasedelay1_q_14_replace_mem_dmem : altsyncram
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
        aclr1 => d_u1_m0_wo4_wi2_phasedelay1_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u1_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u1_m0_wo4_wi2_phasedelay1_q_14_replace_mem_iq,
        address_a => d_u1_m0_wo4_wi2_phasedelay1_q_14_replace_mem_aa,
        data_a => d_u1_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ia
    );
        d_u1_m0_wo4_wi2_phasedelay1_q_14_replace_mem_q <= d_u1_m0_wo4_wi2_phasedelay1_q_14_replace_mem_iq(15 downto 0);

	--u1_m0_wo7_mtree_mult1_0_shift0(BITSHIFT,1231)@14
    u1_m0_wo7_mtree_mult1_0_shift0_q_int <= d_u1_m0_wo4_wi2_phasedelay1_q_14_replace_mem_q & "00000000000000";
    u1_m0_wo7_mtree_mult1_0_shift0_q <= u1_m0_wo7_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u1_m0_wo6_wi2_sym_add0(ADD,831)@10
    u1_m0_wo6_wi2_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_6(15)) & xIn_6);
    u1_m0_wo6_wi2_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_5(15)) & xIn_5);
    u1_m0_wo6_wi2_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo6_wi2_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo6_wi2_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo6_wi2_sym_add0_a) + SIGNED(u1_m0_wo6_wi2_sym_add0_b));
        END IF;
    END PROCESS;
    u1_m0_wo6_wi2_sym_add0_q <= u1_m0_wo6_wi2_sym_add0_o(16 downto 0);


	--d_u1_m0_wo6_wi2_sym_add0_q_12(DELAY,1279)@11
    d_u1_m0_wo6_wi2_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u1_m0_wo6_wi2_sym_add0_q, xout => d_u1_m0_wo6_wi2_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u1_m0_wo6_mtree_madd2_0_constmult0_shift2(BITSHIFT,1206)@12
    u1_m0_wo6_mtree_madd2_0_constmult0_shift2_q_int <= d_u1_m0_wo6_wi2_sym_add0_q_12_q & "0000000000000";
    u1_m0_wo6_mtree_madd2_0_constmult0_shift2_q <= u1_m0_wo6_mtree_madd2_0_constmult0_shift2_q_int(29 downto 0);

	--u1_m0_wo6_mtree_madd2_0_constmult0_shift0(BITSHIFT,1204)@11
    u1_m0_wo6_mtree_madd2_0_constmult0_shift0_q_int <= u1_m0_wo6_wi2_sym_add0_q & "0000000000";
    u1_m0_wo6_mtree_madd2_0_constmult0_shift0_q <= u1_m0_wo6_mtree_madd2_0_constmult0_shift0_q_int(26 downto 0);

	--u1_m0_wo6_mtree_madd2_0_constmult0_add_1(ADD,1205)@11
    u1_m0_wo6_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((27 downto 17 => u1_m0_wo6_wi2_sym_add0_q(16)) & u1_m0_wo6_wi2_sym_add0_q);
    u1_m0_wo6_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u1_m0_wo6_mtree_madd2_0_constmult0_shift0_q(26)) & u1_m0_wo6_mtree_madd2_0_constmult0_shift0_q);
    u1_m0_wo6_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo6_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo6_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo6_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u1_m0_wo6_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo6_mtree_madd2_0_constmult0_add_1_q <= u1_m0_wo6_mtree_madd2_0_constmult0_add_1_o(27 downto 0);


	--u1_m0_wo6_mtree_madd2_0_constmult0_add_3(ADD,1207)@12
    u1_m0_wo6_mtree_madd2_0_constmult0_add_3_a <= STD_LOGIC_VECTOR((30 downto 28 => u1_m0_wo6_mtree_madd2_0_constmult0_add_1_q(27)) & u1_m0_wo6_mtree_madd2_0_constmult0_add_1_q);
    u1_m0_wo6_mtree_madd2_0_constmult0_add_3_b <= STD_LOGIC_VECTOR((30 downto 30 => u1_m0_wo6_mtree_madd2_0_constmult0_shift2_q(29)) & u1_m0_wo6_mtree_madd2_0_constmult0_shift2_q);
    u1_m0_wo6_mtree_madd2_0_constmult0_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo6_mtree_madd2_0_constmult0_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo6_mtree_madd2_0_constmult0_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo6_mtree_madd2_0_constmult0_add_3_a) + SIGNED(u1_m0_wo6_mtree_madd2_0_constmult0_add_3_b));
        END IF;
    END PROCESS;
    u1_m0_wo6_mtree_madd2_0_constmult0_add_3_q <= u1_m0_wo6_mtree_madd2_0_constmult0_add_3_o(30 downto 0);


	--u1_m0_wo6_wi3_sym_add1(ADD,832)@10
    u1_m0_wo6_wi3_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_7(15)) & xIn_7);
    u1_m0_wo6_wi3_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_4(15)) & xIn_4);
    u1_m0_wo6_wi3_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo6_wi3_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo6_wi3_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo6_wi3_sym_add1_a) + SIGNED(u1_m0_wo6_wi3_sym_add1_b));
        END IF;
    END PROCESS;
    u1_m0_wo6_wi3_sym_add1_q <= u1_m0_wo6_wi3_sym_add1_o(16 downto 0);


	--d_u1_m0_wo6_wi3_sym_add1_q_12(DELAY,1280)@11
    d_u1_m0_wo6_wi3_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u1_m0_wo6_wi3_sym_add1_q, xout => d_u1_m0_wo6_wi3_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u1_m0_wo6_mtree_madd2_0_constmult1_shift1(BITSHIFT,1209)@12
    u1_m0_wo6_mtree_madd2_0_constmult1_shift1_q_int <= d_u1_m0_wo6_wi3_sym_add1_q_12_q & "0000000000";
    u1_m0_wo6_mtree_madd2_0_constmult1_shift1_q <= u1_m0_wo6_mtree_madd2_0_constmult1_shift1_q_int(26 downto 0);

	--u1_m0_wo6_mtree_madd2_0_constmult1_sub_0(SUB,1208)@11
    u1_m0_wo6_mtree_madd2_0_constmult1_sub_0_a <= STD_LOGIC_VECTOR((17 downto 1 => GND_q(0)) & GND_q);
    u1_m0_wo6_mtree_madd2_0_constmult1_sub_0_b <= STD_LOGIC_VECTOR((17 downto 17 => u1_m0_wo6_wi3_sym_add1_q(16)) & u1_m0_wo6_wi3_sym_add1_q);
    u1_m0_wo6_mtree_madd2_0_constmult1_sub_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo6_mtree_madd2_0_constmult1_sub_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo6_mtree_madd2_0_constmult1_sub_0_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo6_mtree_madd2_0_constmult1_sub_0_a) - SIGNED(u1_m0_wo6_mtree_madd2_0_constmult1_sub_0_b));
        END IF;
    END PROCESS;
    u1_m0_wo6_mtree_madd2_0_constmult1_sub_0_q <= u1_m0_wo6_mtree_madd2_0_constmult1_sub_0_o(17 downto 0);


	--u1_m0_wo6_mtree_madd2_0_constmult1_sub_2(SUB,1210)@12
    u1_m0_wo6_mtree_madd2_0_constmult1_sub_2_a <= STD_LOGIC_VECTOR((27 downto 18 => u1_m0_wo6_mtree_madd2_0_constmult1_sub_0_q(17)) & u1_m0_wo6_mtree_madd2_0_constmult1_sub_0_q);
    u1_m0_wo6_mtree_madd2_0_constmult1_sub_2_b <= STD_LOGIC_VECTOR((27 downto 27 => u1_m0_wo6_mtree_madd2_0_constmult1_shift1_q(26)) & u1_m0_wo6_mtree_madd2_0_constmult1_shift1_q);
    u1_m0_wo6_mtree_madd2_0_constmult1_sub_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo6_mtree_madd2_0_constmult1_sub_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo6_mtree_madd2_0_constmult1_sub_2_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo6_mtree_madd2_0_constmult1_sub_2_a) - SIGNED(u1_m0_wo6_mtree_madd2_0_constmult1_sub_2_b));
        END IF;
    END PROCESS;
    u1_m0_wo6_mtree_madd2_0_constmult1_sub_2_q <= u1_m0_wo6_mtree_madd2_0_constmult1_sub_2_o(27 downto 0);


	--u1_m0_wo6_mtree_madd2_0_sum1(ADD,1211)@13
    u1_m0_wo6_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u1_m0_wo6_mtree_madd2_0_constmult1_sub_2_q(27)) & u1_m0_wo6_mtree_madd2_0_constmult1_sub_2_q);
    u1_m0_wo6_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u1_m0_wo6_mtree_madd2_0_constmult0_add_3_q(30)) & u1_m0_wo6_mtree_madd2_0_constmult0_add_3_q);
    u1_m0_wo6_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo6_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo6_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo6_mtree_madd2_0_sum1_a) + SIGNED(u1_m0_wo6_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u1_m0_wo6_mtree_madd2_0_sum1_q <= u1_m0_wo6_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u1_m0_wo2_wi1_phasedelay1_q_14_replace_mem(DUALMEM,1393)
    d_u1_m0_wo2_wi1_phasedelay1_q_14_replace_mem_reset0 <= areset;
    d_u1_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ia <= xIn_5;
    d_u1_m0_wo2_wi1_phasedelay1_q_14_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q;
    d_u1_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q;
    d_u1_m0_wo2_wi1_phasedelay1_q_14_replace_mem_dmem : altsyncram
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
        aclr1 => d_u1_m0_wo2_wi1_phasedelay1_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u1_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u1_m0_wo2_wi1_phasedelay1_q_14_replace_mem_iq,
        address_a => d_u1_m0_wo2_wi1_phasedelay1_q_14_replace_mem_aa,
        data_a => d_u1_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ia
    );
        d_u1_m0_wo2_wi1_phasedelay1_q_14_replace_mem_q <= d_u1_m0_wo2_wi1_phasedelay1_q_14_replace_mem_iq(15 downto 0);

	--u1_m0_wo5_mtree_mult1_0_shift0(BITSHIFT,1191)@14
    u1_m0_wo5_mtree_mult1_0_shift0_q_int <= d_u1_m0_wo2_wi1_phasedelay1_q_14_replace_mem_q & "00000000000000";
    u1_m0_wo5_mtree_mult1_0_shift0_q <= u1_m0_wo5_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u1_m0_wo4_wi1_sym_add0(ADD,579)@10
    u1_m0_wo4_wi1_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_5(15)) & xIn_5);
    u1_m0_wo4_wi1_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => xIn_4(15)) & xIn_4);
    u1_m0_wo4_wi1_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo4_wi1_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo4_wi1_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo4_wi1_sym_add0_a) + SIGNED(u1_m0_wo4_wi1_sym_add0_b));
        END IF;
    END PROCESS;
    u1_m0_wo4_wi1_sym_add0_q <= u1_m0_wo4_wi1_sym_add0_o(16 downto 0);


	--d_u1_m0_wo4_wi1_sym_add0_q_12(DELAY,1269)@11
    d_u1_m0_wo4_wi1_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u1_m0_wo4_wi1_sym_add0_q, xout => d_u1_m0_wo4_wi1_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u1_m0_wo4_mtree_madd2_0_constmult0_shift2(BITSHIFT,1166)@12
    u1_m0_wo4_mtree_madd2_0_constmult0_shift2_q_int <= d_u1_m0_wo4_wi1_sym_add0_q_12_q & "0000000000000";
    u1_m0_wo4_mtree_madd2_0_constmult0_shift2_q <= u1_m0_wo4_mtree_madd2_0_constmult0_shift2_q_int(29 downto 0);

	--u1_m0_wo4_mtree_madd2_0_constmult0_shift0(BITSHIFT,1164)@11
    u1_m0_wo4_mtree_madd2_0_constmult0_shift0_q_int <= u1_m0_wo4_wi1_sym_add0_q & "0000000000";
    u1_m0_wo4_mtree_madd2_0_constmult0_shift0_q <= u1_m0_wo4_mtree_madd2_0_constmult0_shift0_q_int(26 downto 0);

	--u1_m0_wo4_mtree_madd2_0_constmult0_add_1(ADD,1165)@11
    u1_m0_wo4_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((27 downto 17 => u1_m0_wo4_wi1_sym_add0_q(16)) & u1_m0_wo4_wi1_sym_add0_q);
    u1_m0_wo4_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u1_m0_wo4_mtree_madd2_0_constmult0_shift0_q(26)) & u1_m0_wo4_mtree_madd2_0_constmult0_shift0_q);
    u1_m0_wo4_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo4_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo4_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo4_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u1_m0_wo4_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo4_mtree_madd2_0_constmult0_add_1_q <= u1_m0_wo4_mtree_madd2_0_constmult0_add_1_o(27 downto 0);


	--u1_m0_wo4_mtree_madd2_0_constmult0_add_3(ADD,1167)@12
    u1_m0_wo4_mtree_madd2_0_constmult0_add_3_a <= STD_LOGIC_VECTOR((30 downto 28 => u1_m0_wo4_mtree_madd2_0_constmult0_add_1_q(27)) & u1_m0_wo4_mtree_madd2_0_constmult0_add_1_q);
    u1_m0_wo4_mtree_madd2_0_constmult0_add_3_b <= STD_LOGIC_VECTOR((30 downto 30 => u1_m0_wo4_mtree_madd2_0_constmult0_shift2_q(29)) & u1_m0_wo4_mtree_madd2_0_constmult0_shift2_q);
    u1_m0_wo4_mtree_madd2_0_constmult0_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo4_mtree_madd2_0_constmult0_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo4_mtree_madd2_0_constmult0_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo4_mtree_madd2_0_constmult0_add_3_a) + SIGNED(u1_m0_wo4_mtree_madd2_0_constmult0_add_3_b));
        END IF;
    END PROCESS;
    u1_m0_wo4_mtree_madd2_0_constmult0_add_3_q <= u1_m0_wo4_mtree_madd2_0_constmult0_add_3_o(30 downto 0);


	--u1_m0_wo0_wi3_delayr1(DELAY,69)@10
    u1_m0_wo0_wi3_delayr1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_7, xout => u1_m0_wo0_wi3_delayr1_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u1_m0_wo4_wi2_sym_add1(ADD,580)@10
    u1_m0_wo4_wi2_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_6(15)) & xIn_6);
    u1_m0_wo4_wi2_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u1_m0_wo0_wi3_delayr1_q(15)) & u1_m0_wo0_wi3_delayr1_q);
    u1_m0_wo4_wi2_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo4_wi2_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo4_wi2_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo4_wi2_sym_add1_a) + SIGNED(u1_m0_wo4_wi2_sym_add1_b));
        END IF;
    END PROCESS;
    u1_m0_wo4_wi2_sym_add1_q <= u1_m0_wo4_wi2_sym_add1_o(16 downto 0);


	--d_u1_m0_wo4_wi2_sym_add1_q_12(DELAY,1270)@11
    d_u1_m0_wo4_wi2_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u1_m0_wo4_wi2_sym_add1_q, xout => d_u1_m0_wo4_wi2_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u1_m0_wo4_mtree_madd2_0_constmult1_shift1(BITSHIFT,1169)@12
    u1_m0_wo4_mtree_madd2_0_constmult1_shift1_q_int <= d_u1_m0_wo4_wi2_sym_add1_q_12_q & "0000000000";
    u1_m0_wo4_mtree_madd2_0_constmult1_shift1_q <= u1_m0_wo4_mtree_madd2_0_constmult1_shift1_q_int(26 downto 0);

	--u1_m0_wo4_mtree_madd2_0_constmult1_sub_0(SUB,1168)@11
    u1_m0_wo4_mtree_madd2_0_constmult1_sub_0_a <= STD_LOGIC_VECTOR((17 downto 1 => GND_q(0)) & GND_q);
    u1_m0_wo4_mtree_madd2_0_constmult1_sub_0_b <= STD_LOGIC_VECTOR((17 downto 17 => u1_m0_wo4_wi2_sym_add1_q(16)) & u1_m0_wo4_wi2_sym_add1_q);
    u1_m0_wo4_mtree_madd2_0_constmult1_sub_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo4_mtree_madd2_0_constmult1_sub_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo4_mtree_madd2_0_constmult1_sub_0_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo4_mtree_madd2_0_constmult1_sub_0_a) - SIGNED(u1_m0_wo4_mtree_madd2_0_constmult1_sub_0_b));
        END IF;
    END PROCESS;
    u1_m0_wo4_mtree_madd2_0_constmult1_sub_0_q <= u1_m0_wo4_mtree_madd2_0_constmult1_sub_0_o(17 downto 0);


	--u1_m0_wo4_mtree_madd2_0_constmult1_sub_2(SUB,1170)@12
    u1_m0_wo4_mtree_madd2_0_constmult1_sub_2_a <= STD_LOGIC_VECTOR((27 downto 18 => u1_m0_wo4_mtree_madd2_0_constmult1_sub_0_q(17)) & u1_m0_wo4_mtree_madd2_0_constmult1_sub_0_q);
    u1_m0_wo4_mtree_madd2_0_constmult1_sub_2_b <= STD_LOGIC_VECTOR((27 downto 27 => u1_m0_wo4_mtree_madd2_0_constmult1_shift1_q(26)) & u1_m0_wo4_mtree_madd2_0_constmult1_shift1_q);
    u1_m0_wo4_mtree_madd2_0_constmult1_sub_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo4_mtree_madd2_0_constmult1_sub_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo4_mtree_madd2_0_constmult1_sub_2_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo4_mtree_madd2_0_constmult1_sub_2_a) - SIGNED(u1_m0_wo4_mtree_madd2_0_constmult1_sub_2_b));
        END IF;
    END PROCESS;
    u1_m0_wo4_mtree_madd2_0_constmult1_sub_2_q <= u1_m0_wo4_mtree_madd2_0_constmult1_sub_2_o(27 downto 0);


	--u1_m0_wo4_mtree_madd2_0_sum1(ADD,1171)@13
    u1_m0_wo4_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u1_m0_wo4_mtree_madd2_0_constmult1_sub_2_q(27)) & u1_m0_wo4_mtree_madd2_0_constmult1_sub_2_q);
    u1_m0_wo4_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u1_m0_wo4_mtree_madd2_0_constmult0_add_3_q(30)) & u1_m0_wo4_mtree_madd2_0_constmult0_add_3_q);
    u1_m0_wo4_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo4_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo4_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo4_mtree_madd2_0_sum1_a) + SIGNED(u1_m0_wo4_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u1_m0_wo4_mtree_madd2_0_sum1_q <= u1_m0_wo4_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem(DUALMEM,1309)
    d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_reset0 <= areset;
    d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_ia <= xIn_4;
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

	--u1_m0_wo3_mtree_mult1_0_shift0(BITSHIFT,1151)@14
    u1_m0_wo3_mtree_mult1_0_shift0_q_int <= d_u1_m0_wo0_wi0_phasedelay0_q_14_replace_mem_q & "00000000000000";
    u1_m0_wo3_mtree_mult1_0_shift0_q <= u1_m0_wo3_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u1_m0_wo2_wi0_sym_add0(ADD,327)@10
    u1_m0_wo2_wi0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_4(15)) & xIn_4);
    u1_m0_wo2_wi0_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => u1_m0_wo0_wi3_delayr1_q(15)) & u1_m0_wo0_wi3_delayr1_q);
    u1_m0_wo2_wi0_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo2_wi0_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo2_wi0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo2_wi0_sym_add0_a) + SIGNED(u1_m0_wo2_wi0_sym_add0_b));
        END IF;
    END PROCESS;
    u1_m0_wo2_wi0_sym_add0_q <= u1_m0_wo2_wi0_sym_add0_o(16 downto 0);


	--d_u1_m0_wo2_wi0_sym_add0_q_12(DELAY,1257)@11
    d_u1_m0_wo2_wi0_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u1_m0_wo2_wi0_sym_add0_q, xout => d_u1_m0_wo2_wi0_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u1_m0_wo2_mtree_madd2_0_constmult0_shift2(BITSHIFT,1126)@12
    u1_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int <= d_u1_m0_wo2_wi0_sym_add0_q_12_q & "0000000000000";
    u1_m0_wo2_mtree_madd2_0_constmult0_shift2_q <= u1_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int(29 downto 0);

	--u1_m0_wo2_mtree_madd2_0_constmult0_shift0(BITSHIFT,1124)@11
    u1_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int <= u1_m0_wo2_wi0_sym_add0_q & "0000000000";
    u1_m0_wo2_mtree_madd2_0_constmult0_shift0_q <= u1_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int(26 downto 0);

	--u1_m0_wo2_mtree_madd2_0_constmult0_add_1(ADD,1125)@11
    u1_m0_wo2_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((27 downto 17 => u1_m0_wo2_wi0_sym_add0_q(16)) & u1_m0_wo2_wi0_sym_add0_q);
    u1_m0_wo2_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u1_m0_wo2_mtree_madd2_0_constmult0_shift0_q(26)) & u1_m0_wo2_mtree_madd2_0_constmult0_shift0_q);
    u1_m0_wo2_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo2_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo2_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo2_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u1_m0_wo2_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo2_mtree_madd2_0_constmult0_add_1_q <= u1_m0_wo2_mtree_madd2_0_constmult0_add_1_o(27 downto 0);


	--u1_m0_wo2_mtree_madd2_0_constmult0_add_3(ADD,1127)@12
    u1_m0_wo2_mtree_madd2_0_constmult0_add_3_a <= STD_LOGIC_VECTOR((30 downto 28 => u1_m0_wo2_mtree_madd2_0_constmult0_add_1_q(27)) & u1_m0_wo2_mtree_madd2_0_constmult0_add_1_q);
    u1_m0_wo2_mtree_madd2_0_constmult0_add_3_b <= STD_LOGIC_VECTOR((30 downto 30 => u1_m0_wo2_mtree_madd2_0_constmult0_shift2_q(29)) & u1_m0_wo2_mtree_madd2_0_constmult0_shift2_q);
    u1_m0_wo2_mtree_madd2_0_constmult0_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo2_mtree_madd2_0_constmult0_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo2_mtree_madd2_0_constmult0_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo2_mtree_madd2_0_constmult0_add_3_a) + SIGNED(u1_m0_wo2_mtree_madd2_0_constmult0_add_3_b));
        END IF;
    END PROCESS;
    u1_m0_wo2_mtree_madd2_0_constmult0_add_3_q <= u1_m0_wo2_mtree_madd2_0_constmult0_add_3_o(30 downto 0);


	--u1_m0_wo0_wi2_delayr2(DELAY,63)@10
    u1_m0_wo0_wi2_delayr2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_6, xout => u1_m0_wo0_wi2_delayr2_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u1_m0_wo2_wi1_sym_add1(ADD,328)@10
    u1_m0_wo2_wi1_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_5(15)) & xIn_5);
    u1_m0_wo2_wi1_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u1_m0_wo0_wi2_delayr2_q(15)) & u1_m0_wo0_wi2_delayr2_q);
    u1_m0_wo2_wi1_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo2_wi1_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo2_wi1_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo2_wi1_sym_add1_a) + SIGNED(u1_m0_wo2_wi1_sym_add1_b));
        END IF;
    END PROCESS;
    u1_m0_wo2_wi1_sym_add1_q <= u1_m0_wo2_wi1_sym_add1_o(16 downto 0);


	--d_u1_m0_wo2_wi1_sym_add1_q_12(DELAY,1258)@11
    d_u1_m0_wo2_wi1_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u1_m0_wo2_wi1_sym_add1_q, xout => d_u1_m0_wo2_wi1_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u1_m0_wo2_mtree_madd2_0_constmult1_shift1(BITSHIFT,1129)@12
    u1_m0_wo2_mtree_madd2_0_constmult1_shift1_q_int <= d_u1_m0_wo2_wi1_sym_add1_q_12_q & "0000000000";
    u1_m0_wo2_mtree_madd2_0_constmult1_shift1_q <= u1_m0_wo2_mtree_madd2_0_constmult1_shift1_q_int(26 downto 0);

	--u1_m0_wo2_mtree_madd2_0_constmult1_sub_0(SUB,1128)@11
    u1_m0_wo2_mtree_madd2_0_constmult1_sub_0_a <= STD_LOGIC_VECTOR((17 downto 1 => GND_q(0)) & GND_q);
    u1_m0_wo2_mtree_madd2_0_constmult1_sub_0_b <= STD_LOGIC_VECTOR((17 downto 17 => u1_m0_wo2_wi1_sym_add1_q(16)) & u1_m0_wo2_wi1_sym_add1_q);
    u1_m0_wo2_mtree_madd2_0_constmult1_sub_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo2_mtree_madd2_0_constmult1_sub_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo2_mtree_madd2_0_constmult1_sub_0_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo2_mtree_madd2_0_constmult1_sub_0_a) - SIGNED(u1_m0_wo2_mtree_madd2_0_constmult1_sub_0_b));
        END IF;
    END PROCESS;
    u1_m0_wo2_mtree_madd2_0_constmult1_sub_0_q <= u1_m0_wo2_mtree_madd2_0_constmult1_sub_0_o(17 downto 0);


	--u1_m0_wo2_mtree_madd2_0_constmult1_sub_2(SUB,1130)@12
    u1_m0_wo2_mtree_madd2_0_constmult1_sub_2_a <= STD_LOGIC_VECTOR((27 downto 18 => u1_m0_wo2_mtree_madd2_0_constmult1_sub_0_q(17)) & u1_m0_wo2_mtree_madd2_0_constmult1_sub_0_q);
    u1_m0_wo2_mtree_madd2_0_constmult1_sub_2_b <= STD_LOGIC_VECTOR((27 downto 27 => u1_m0_wo2_mtree_madd2_0_constmult1_shift1_q(26)) & u1_m0_wo2_mtree_madd2_0_constmult1_shift1_q);
    u1_m0_wo2_mtree_madd2_0_constmult1_sub_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo2_mtree_madd2_0_constmult1_sub_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo2_mtree_madd2_0_constmult1_sub_2_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo2_mtree_madd2_0_constmult1_sub_2_a) - SIGNED(u1_m0_wo2_mtree_madd2_0_constmult1_sub_2_b));
        END IF;
    END PROCESS;
    u1_m0_wo2_mtree_madd2_0_constmult1_sub_2_q <= u1_m0_wo2_mtree_madd2_0_constmult1_sub_2_o(27 downto 0);


	--u1_m0_wo2_mtree_madd2_0_sum1(ADD,1131)@13
    u1_m0_wo2_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u1_m0_wo2_mtree_madd2_0_constmult1_sub_2_q(27)) & u1_m0_wo2_mtree_madd2_0_constmult1_sub_2_q);
    u1_m0_wo2_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u1_m0_wo2_mtree_madd2_0_constmult0_add_3_q(30)) & u1_m0_wo2_mtree_madd2_0_constmult0_add_3_q);
    u1_m0_wo2_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo2_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo2_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo2_mtree_madd2_0_sum1_a) + SIGNED(u1_m0_wo2_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u1_m0_wo2_mtree_madd2_0_sum1_q <= u1_m0_wo2_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u1_m0_wo0_wi3_phasedelay1_q_14_replace_mem(DUALMEM,1321)
    d_u1_m0_wo0_wi3_phasedelay1_q_14_replace_mem_reset0 <= areset;
    d_u1_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ia <= u1_m0_wo0_wi3_delayr1_q;
    d_u1_m0_wo0_wi3_phasedelay1_q_14_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q;
    d_u1_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q;
    d_u1_m0_wo0_wi3_phasedelay1_q_14_replace_mem_dmem : altsyncram
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
        aclr1 => d_u1_m0_wo0_wi3_phasedelay1_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u1_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u1_m0_wo0_wi3_phasedelay1_q_14_replace_mem_iq,
        address_a => d_u1_m0_wo0_wi3_phasedelay1_q_14_replace_mem_aa,
        data_a => d_u1_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ia
    );
        d_u1_m0_wo0_wi3_phasedelay1_q_14_replace_mem_q <= d_u1_m0_wo0_wi3_phasedelay1_q_14_replace_mem_iq(15 downto 0);

	--u1_m0_wo1_mtree_mult1_0_shift0(BITSHIFT,1111)@14
    u1_m0_wo1_mtree_mult1_0_shift0_q_int <= d_u1_m0_wo0_wi3_phasedelay1_q_14_replace_mem_q & "00000000000000";
    u1_m0_wo1_mtree_mult1_0_shift0_q <= u1_m0_wo1_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u1_m0_wo0_wi3_sym_add1(ADD,76)@10
    u1_m0_wo0_wi3_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => u1_m0_wo0_wi3_delayr1_q(15)) & u1_m0_wo0_wi3_delayr1_q);
    u1_m0_wo0_wi3_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u1_m0_wo0_wi2_delayr2_q(15)) & u1_m0_wo0_wi2_delayr2_q);
    u1_m0_wo0_wi3_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_wi3_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_wi3_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_wi3_sym_add1_a) + SIGNED(u1_m0_wo0_wi3_sym_add1_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_wi3_sym_add1_q <= u1_m0_wo0_wi3_sym_add1_o(16 downto 0);


	--d_u1_m0_wo0_wi3_sym_add1_q_12(DELAY,1244)@11
    d_u1_m0_wo0_wi3_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u1_m0_wo0_wi3_sym_add1_q, xout => d_u1_m0_wo0_wi3_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u1_m0_wo0_mtree_madd2_0_constmult1_shift2(BITSHIFT,1089)@12
    u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int <= d_u1_m0_wo0_wi3_sym_add1_q_12_q & "0000000000000";
    u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q <= u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int(29 downto 0);

	--u1_m0_wo0_mtree_madd2_0_constmult1_shift0(BITSHIFT,1087)@11
    u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int <= u1_m0_wo0_wi3_sym_add1_q & "0000000000";
    u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q <= u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int(26 downto 0);

	--u1_m0_wo0_mtree_madd2_0_constmult1_add_1(ADD,1088)@11
    u1_m0_wo0_mtree_madd2_0_constmult1_add_1_a <= STD_LOGIC_VECTOR((27 downto 17 => u1_m0_wo0_wi3_sym_add1_q(16)) & u1_m0_wo0_wi3_sym_add1_q);
    u1_m0_wo0_mtree_madd2_0_constmult1_add_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q(26)) & u1_m0_wo0_mtree_madd2_0_constmult1_shift0_q);
    u1_m0_wo0_mtree_madd2_0_constmult1_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_mtree_madd2_0_constmult1_add_1_a) + SIGNED(u1_m0_wo0_mtree_madd2_0_constmult1_add_1_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_mtree_madd2_0_constmult1_add_1_q <= u1_m0_wo0_mtree_madd2_0_constmult1_add_1_o(27 downto 0);


	--u1_m0_wo0_mtree_madd2_0_constmult1_add_3(ADD,1090)@12
    u1_m0_wo0_mtree_madd2_0_constmult1_add_3_a <= STD_LOGIC_VECTOR((30 downto 28 => u1_m0_wo0_mtree_madd2_0_constmult1_add_1_q(27)) & u1_m0_wo0_mtree_madd2_0_constmult1_add_1_q);
    u1_m0_wo0_mtree_madd2_0_constmult1_add_3_b <= STD_LOGIC_VECTOR((30 downto 30 => u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q(29)) & u1_m0_wo0_mtree_madd2_0_constmult1_shift2_q);
    u1_m0_wo0_mtree_madd2_0_constmult1_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_mtree_madd2_0_constmult1_add_3_a) + SIGNED(u1_m0_wo0_mtree_madd2_0_constmult1_add_3_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_mtree_madd2_0_constmult1_add_3_q <= u1_m0_wo0_mtree_madd2_0_constmult1_add_3_o(30 downto 0);


	--u1_m0_wo0_wi1_delayr3(DELAY,57)@10
    u1_m0_wo0_wi1_delayr3 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_5, xout => u1_m0_wo0_wi1_delayr3_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u1_m0_wo0_wi0_sym_add0(ADD,75)@10
    u1_m0_wo0_wi0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_4(15)) & xIn_4);
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


	--d_u1_m0_wo0_wi0_sym_add0_q_12(DELAY,1243)@11
    d_u1_m0_wo0_wi0_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u1_m0_wo0_wi0_sym_add0_q, xout => d_u1_m0_wo0_wi0_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u1_m0_wo0_mtree_madd2_0_constmult0_shift1(BITSHIFT,1085)@12
    u1_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int <= d_u1_m0_wo0_wi0_sym_add0_q_12_q & "0000000000";
    u1_m0_wo0_mtree_madd2_0_constmult0_shift1_q <= u1_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int(26 downto 0);

	--u1_m0_wo0_mtree_madd2_0_constmult0_sub_0(SUB,1084)@11
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_a <= STD_LOGIC_VECTOR((17 downto 1 => GND_q(0)) & GND_q);
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_b <= STD_LOGIC_VECTOR((17 downto 17 => u1_m0_wo0_wi0_sym_add0_q(16)) & u1_m0_wo0_wi0_sym_add0_q);
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_a) - SIGNED(u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_q <= u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_o(17 downto 0);


	--u1_m0_wo0_mtree_madd2_0_constmult0_sub_2(SUB,1086)@12
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_2_a <= STD_LOGIC_VECTOR((27 downto 18 => u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_q(17)) & u1_m0_wo0_mtree_madd2_0_constmult0_sub_0_q);
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_2_b <= STD_LOGIC_VECTOR((27 downto 27 => u1_m0_wo0_mtree_madd2_0_constmult0_shift1_q(26)) & u1_m0_wo0_mtree_madd2_0_constmult0_shift1_q);
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult0_sub_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_mtree_madd2_0_constmult0_sub_2_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_mtree_madd2_0_constmult0_sub_2_a) - SIGNED(u1_m0_wo0_mtree_madd2_0_constmult0_sub_2_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_mtree_madd2_0_constmult0_sub_2_q <= u1_m0_wo0_mtree_madd2_0_constmult0_sub_2_o(27 downto 0);


	--u1_m0_wo0_mtree_madd2_0_sum1(ADD,1091)@13
    u1_m0_wo0_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u1_m0_wo0_mtree_madd2_0_constmult0_sub_2_q(27)) & u1_m0_wo0_mtree_madd2_0_constmult0_sub_2_q);
    u1_m0_wo0_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u1_m0_wo0_mtree_madd2_0_constmult1_add_3_q(30)) & u1_m0_wo0_mtree_madd2_0_constmult1_add_3_q);
    u1_m0_wo0_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_m0_wo0_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_m0_wo0_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u1_m0_wo0_mtree_madd2_0_sum1_a) + SIGNED(u1_m0_wo0_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u1_m0_wo0_mtree_madd2_0_sum1_q <= u1_m0_wo0_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u0_m0_wo4_wi2_phasedelay1_q_14_replace_mem(DUALMEM,1429)
    d_u0_m0_wo4_wi2_phasedelay1_q_14_replace_mem_reset0 <= areset;
    d_u0_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ia <= xIn_2;
    d_u0_m0_wo4_wi2_phasedelay1_q_14_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q;
    d_u0_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q;
    d_u0_m0_wo4_wi2_phasedelay1_q_14_replace_mem_dmem : altsyncram
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
        aclr1 => d_u0_m0_wo4_wi2_phasedelay1_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u0_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u0_m0_wo4_wi2_phasedelay1_q_14_replace_mem_iq,
        address_a => d_u0_m0_wo4_wi2_phasedelay1_q_14_replace_mem_aa,
        data_a => d_u0_m0_wo4_wi2_phasedelay1_q_14_replace_mem_ia
    );
        d_u0_m0_wo4_wi2_phasedelay1_q_14_replace_mem_q <= d_u0_m0_wo4_wi2_phasedelay1_q_14_replace_mem_iq(15 downto 0);

	--u0_m0_wo7_mtree_mult1_0_shift0(BITSHIFT,1229)@14
    u0_m0_wo7_mtree_mult1_0_shift0_q_int <= d_u0_m0_wo4_wi2_phasedelay1_q_14_replace_mem_q & "00000000000000";
    u0_m0_wo7_mtree_mult1_0_shift0_q <= u0_m0_wo7_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u0_m0_wo6_wi2_sym_add0(ADD,793)@10
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


	--d_u0_m0_wo6_wi2_sym_add0_q_12(DELAY,1277)@11
    d_u0_m0_wo6_wi2_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u0_m0_wo6_wi2_sym_add0_q, xout => d_u0_m0_wo6_wi2_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u0_m0_wo6_mtree_madd2_0_constmult0_shift2(BITSHIFT,1198)@12
    u0_m0_wo6_mtree_madd2_0_constmult0_shift2_q_int <= d_u0_m0_wo6_wi2_sym_add0_q_12_q & "0000000000000";
    u0_m0_wo6_mtree_madd2_0_constmult0_shift2_q <= u0_m0_wo6_mtree_madd2_0_constmult0_shift2_q_int(29 downto 0);

	--u0_m0_wo6_mtree_madd2_0_constmult0_shift0(BITSHIFT,1196)@11
    u0_m0_wo6_mtree_madd2_0_constmult0_shift0_q_int <= u0_m0_wo6_wi2_sym_add0_q & "0000000000";
    u0_m0_wo6_mtree_madd2_0_constmult0_shift0_q <= u0_m0_wo6_mtree_madd2_0_constmult0_shift0_q_int(26 downto 0);

	--u0_m0_wo6_mtree_madd2_0_constmult0_add_1(ADD,1197)@11
    u0_m0_wo6_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((27 downto 17 => u0_m0_wo6_wi2_sym_add0_q(16)) & u0_m0_wo6_wi2_sym_add0_q);
    u0_m0_wo6_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo6_mtree_madd2_0_constmult0_shift0_q(26)) & u0_m0_wo6_mtree_madd2_0_constmult0_shift0_q);
    u0_m0_wo6_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo6_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo6_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo6_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u0_m0_wo6_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo6_mtree_madd2_0_constmult0_add_1_q <= u0_m0_wo6_mtree_madd2_0_constmult0_add_1_o(27 downto 0);


	--u0_m0_wo6_mtree_madd2_0_constmult0_add_3(ADD,1199)@12
    u0_m0_wo6_mtree_madd2_0_constmult0_add_3_a <= STD_LOGIC_VECTOR((30 downto 28 => u0_m0_wo6_mtree_madd2_0_constmult0_add_1_q(27)) & u0_m0_wo6_mtree_madd2_0_constmult0_add_1_q);
    u0_m0_wo6_mtree_madd2_0_constmult0_add_3_b <= STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo6_mtree_madd2_0_constmult0_shift2_q(29)) & u0_m0_wo6_mtree_madd2_0_constmult0_shift2_q);
    u0_m0_wo6_mtree_madd2_0_constmult0_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo6_mtree_madd2_0_constmult0_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo6_mtree_madd2_0_constmult0_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo6_mtree_madd2_0_constmult0_add_3_a) + SIGNED(u0_m0_wo6_mtree_madd2_0_constmult0_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo6_mtree_madd2_0_constmult0_add_3_q <= u0_m0_wo6_mtree_madd2_0_constmult0_add_3_o(30 downto 0);


	--u0_m0_wo6_wi3_sym_add1(ADD,794)@10
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


	--d_u0_m0_wo6_wi3_sym_add1_q_12(DELAY,1278)@11
    d_u0_m0_wo6_wi3_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u0_m0_wo6_wi3_sym_add1_q, xout => d_u0_m0_wo6_wi3_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u0_m0_wo6_mtree_madd2_0_constmult1_shift1(BITSHIFT,1201)@12
    u0_m0_wo6_mtree_madd2_0_constmult1_shift1_q_int <= d_u0_m0_wo6_wi3_sym_add1_q_12_q & "0000000000";
    u0_m0_wo6_mtree_madd2_0_constmult1_shift1_q <= u0_m0_wo6_mtree_madd2_0_constmult1_shift1_q_int(26 downto 0);

	--u0_m0_wo6_mtree_madd2_0_constmult1_sub_0(SUB,1200)@11
    u0_m0_wo6_mtree_madd2_0_constmult1_sub_0_a <= STD_LOGIC_VECTOR((17 downto 1 => GND_q(0)) & GND_q);
    u0_m0_wo6_mtree_madd2_0_constmult1_sub_0_b <= STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo6_wi3_sym_add1_q(16)) & u0_m0_wo6_wi3_sym_add1_q);
    u0_m0_wo6_mtree_madd2_0_constmult1_sub_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo6_mtree_madd2_0_constmult1_sub_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo6_mtree_madd2_0_constmult1_sub_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo6_mtree_madd2_0_constmult1_sub_0_a) - SIGNED(u0_m0_wo6_mtree_madd2_0_constmult1_sub_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo6_mtree_madd2_0_constmult1_sub_0_q <= u0_m0_wo6_mtree_madd2_0_constmult1_sub_0_o(17 downto 0);


	--u0_m0_wo6_mtree_madd2_0_constmult1_sub_2(SUB,1202)@12
    u0_m0_wo6_mtree_madd2_0_constmult1_sub_2_a <= STD_LOGIC_VECTOR((27 downto 18 => u0_m0_wo6_mtree_madd2_0_constmult1_sub_0_q(17)) & u0_m0_wo6_mtree_madd2_0_constmult1_sub_0_q);
    u0_m0_wo6_mtree_madd2_0_constmult1_sub_2_b <= STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo6_mtree_madd2_0_constmult1_shift1_q(26)) & u0_m0_wo6_mtree_madd2_0_constmult1_shift1_q);
    u0_m0_wo6_mtree_madd2_0_constmult1_sub_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo6_mtree_madd2_0_constmult1_sub_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo6_mtree_madd2_0_constmult1_sub_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo6_mtree_madd2_0_constmult1_sub_2_a) - SIGNED(u0_m0_wo6_mtree_madd2_0_constmult1_sub_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo6_mtree_madd2_0_constmult1_sub_2_q <= u0_m0_wo6_mtree_madd2_0_constmult1_sub_2_o(27 downto 0);


	--u0_m0_wo6_mtree_madd2_0_sum1(ADD,1203)@13
    u0_m0_wo6_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u0_m0_wo6_mtree_madd2_0_constmult1_sub_2_q(27)) & u0_m0_wo6_mtree_madd2_0_constmult1_sub_2_q);
    u0_m0_wo6_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo6_mtree_madd2_0_constmult0_add_3_q(30)) & u0_m0_wo6_mtree_madd2_0_constmult0_add_3_q);
    u0_m0_wo6_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo6_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo6_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo6_mtree_madd2_0_sum1_a) + SIGNED(u0_m0_wo6_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u0_m0_wo6_mtree_madd2_0_sum1_q <= u0_m0_wo6_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u0_m0_wo2_wi1_phasedelay1_q_14_replace_mem(DUALMEM,1381)
    d_u0_m0_wo2_wi1_phasedelay1_q_14_replace_mem_reset0 <= areset;
    d_u0_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ia <= xIn_1;
    d_u0_m0_wo2_wi1_phasedelay1_q_14_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q;
    d_u0_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q;
    d_u0_m0_wo2_wi1_phasedelay1_q_14_replace_mem_dmem : altsyncram
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
        aclr1 => d_u0_m0_wo2_wi1_phasedelay1_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u0_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u0_m0_wo2_wi1_phasedelay1_q_14_replace_mem_iq,
        address_a => d_u0_m0_wo2_wi1_phasedelay1_q_14_replace_mem_aa,
        data_a => d_u0_m0_wo2_wi1_phasedelay1_q_14_replace_mem_ia
    );
        d_u0_m0_wo2_wi1_phasedelay1_q_14_replace_mem_q <= d_u0_m0_wo2_wi1_phasedelay1_q_14_replace_mem_iq(15 downto 0);

	--u0_m0_wo5_mtree_mult1_0_shift0(BITSHIFT,1189)@14
    u0_m0_wo5_mtree_mult1_0_shift0_q_int <= d_u0_m0_wo2_wi1_phasedelay1_q_14_replace_mem_q & "00000000000000";
    u0_m0_wo5_mtree_mult1_0_shift0_q <= u0_m0_wo5_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u0_m0_wo4_wi1_sym_add0(ADD,541)@10
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


	--d_u0_m0_wo4_wi1_sym_add0_q_12(DELAY,1266)@11
    d_u0_m0_wo4_wi1_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u0_m0_wo4_wi1_sym_add0_q, xout => d_u0_m0_wo4_wi1_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u0_m0_wo4_mtree_madd2_0_constmult0_shift2(BITSHIFT,1158)@12
    u0_m0_wo4_mtree_madd2_0_constmult0_shift2_q_int <= d_u0_m0_wo4_wi1_sym_add0_q_12_q & "0000000000000";
    u0_m0_wo4_mtree_madd2_0_constmult0_shift2_q <= u0_m0_wo4_mtree_madd2_0_constmult0_shift2_q_int(29 downto 0);

	--u0_m0_wo4_mtree_madd2_0_constmult0_shift0(BITSHIFT,1156)@11
    u0_m0_wo4_mtree_madd2_0_constmult0_shift0_q_int <= u0_m0_wo4_wi1_sym_add0_q & "0000000000";
    u0_m0_wo4_mtree_madd2_0_constmult0_shift0_q <= u0_m0_wo4_mtree_madd2_0_constmult0_shift0_q_int(26 downto 0);

	--u0_m0_wo4_mtree_madd2_0_constmult0_add_1(ADD,1157)@11
    u0_m0_wo4_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((27 downto 17 => u0_m0_wo4_wi1_sym_add0_q(16)) & u0_m0_wo4_wi1_sym_add0_q);
    u0_m0_wo4_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo4_mtree_madd2_0_constmult0_shift0_q(26)) & u0_m0_wo4_mtree_madd2_0_constmult0_shift0_q);
    u0_m0_wo4_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo4_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo4_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo4_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u0_m0_wo4_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo4_mtree_madd2_0_constmult0_add_1_q <= u0_m0_wo4_mtree_madd2_0_constmult0_add_1_o(27 downto 0);


	--u0_m0_wo4_mtree_madd2_0_constmult0_add_3(ADD,1159)@12
    u0_m0_wo4_mtree_madd2_0_constmult0_add_3_a <= STD_LOGIC_VECTOR((30 downto 28 => u0_m0_wo4_mtree_madd2_0_constmult0_add_1_q(27)) & u0_m0_wo4_mtree_madd2_0_constmult0_add_1_q);
    u0_m0_wo4_mtree_madd2_0_constmult0_add_3_b <= STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo4_mtree_madd2_0_constmult0_shift2_q(29)) & u0_m0_wo4_mtree_madd2_0_constmult0_shift2_q);
    u0_m0_wo4_mtree_madd2_0_constmult0_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo4_mtree_madd2_0_constmult0_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo4_mtree_madd2_0_constmult0_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo4_mtree_madd2_0_constmult0_add_3_a) + SIGNED(u0_m0_wo4_mtree_madd2_0_constmult0_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo4_mtree_madd2_0_constmult0_add_3_q <= u0_m0_wo4_mtree_madd2_0_constmult0_add_3_o(30 downto 0);


	--u0_m0_wo0_wi3_delayr1(DELAY,31)@10
    u0_m0_wo0_wi3_delayr1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_3, xout => u0_m0_wo0_wi3_delayr1_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo4_wi2_sym_add1(ADD,542)@10
    u0_m0_wo4_wi2_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_2(15)) & xIn_2);
    u0_m0_wo4_wi2_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi3_delayr1_q(15)) & u0_m0_wo0_wi3_delayr1_q);
    u0_m0_wo4_wi2_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo4_wi2_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo4_wi2_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo4_wi2_sym_add1_a) + SIGNED(u0_m0_wo4_wi2_sym_add1_b));
        END IF;
    END PROCESS;
    u0_m0_wo4_wi2_sym_add1_q <= u0_m0_wo4_wi2_sym_add1_o(16 downto 0);


	--d_u0_m0_wo4_wi2_sym_add1_q_12(DELAY,1267)@11
    d_u0_m0_wo4_wi2_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u0_m0_wo4_wi2_sym_add1_q, xout => d_u0_m0_wo4_wi2_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u0_m0_wo4_mtree_madd2_0_constmult1_shift1(BITSHIFT,1161)@12
    u0_m0_wo4_mtree_madd2_0_constmult1_shift1_q_int <= d_u0_m0_wo4_wi2_sym_add1_q_12_q & "0000000000";
    u0_m0_wo4_mtree_madd2_0_constmult1_shift1_q <= u0_m0_wo4_mtree_madd2_0_constmult1_shift1_q_int(26 downto 0);

	--u0_m0_wo4_mtree_madd2_0_constmult1_sub_0(SUB,1160)@11
    u0_m0_wo4_mtree_madd2_0_constmult1_sub_0_a <= STD_LOGIC_VECTOR((17 downto 1 => GND_q(0)) & GND_q);
    u0_m0_wo4_mtree_madd2_0_constmult1_sub_0_b <= STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo4_wi2_sym_add1_q(16)) & u0_m0_wo4_wi2_sym_add1_q);
    u0_m0_wo4_mtree_madd2_0_constmult1_sub_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo4_mtree_madd2_0_constmult1_sub_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo4_mtree_madd2_0_constmult1_sub_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo4_mtree_madd2_0_constmult1_sub_0_a) - SIGNED(u0_m0_wo4_mtree_madd2_0_constmult1_sub_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo4_mtree_madd2_0_constmult1_sub_0_q <= u0_m0_wo4_mtree_madd2_0_constmult1_sub_0_o(17 downto 0);


	--u0_m0_wo4_mtree_madd2_0_constmult1_sub_2(SUB,1162)@12
    u0_m0_wo4_mtree_madd2_0_constmult1_sub_2_a <= STD_LOGIC_VECTOR((27 downto 18 => u0_m0_wo4_mtree_madd2_0_constmult1_sub_0_q(17)) & u0_m0_wo4_mtree_madd2_0_constmult1_sub_0_q);
    u0_m0_wo4_mtree_madd2_0_constmult1_sub_2_b <= STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo4_mtree_madd2_0_constmult1_shift1_q(26)) & u0_m0_wo4_mtree_madd2_0_constmult1_shift1_q);
    u0_m0_wo4_mtree_madd2_0_constmult1_sub_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo4_mtree_madd2_0_constmult1_sub_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo4_mtree_madd2_0_constmult1_sub_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo4_mtree_madd2_0_constmult1_sub_2_a) - SIGNED(u0_m0_wo4_mtree_madd2_0_constmult1_sub_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo4_mtree_madd2_0_constmult1_sub_2_q <= u0_m0_wo4_mtree_madd2_0_constmult1_sub_2_o(27 downto 0);


	--u0_m0_wo4_mtree_madd2_0_sum1(ADD,1163)@13
    u0_m0_wo4_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u0_m0_wo4_mtree_madd2_0_constmult1_sub_2_q(27)) & u0_m0_wo4_mtree_madd2_0_constmult1_sub_2_q);
    u0_m0_wo4_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo4_mtree_madd2_0_constmult0_add_3_q(30)) & u0_m0_wo4_mtree_madd2_0_constmult0_add_3_q);
    u0_m0_wo4_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo4_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo4_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo4_mtree_madd2_0_sum1_a) + SIGNED(u0_m0_wo4_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u0_m0_wo4_mtree_madd2_0_sum1_q <= u0_m0_wo4_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem(DUALMEM,1285)
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

	--u0_m0_wo3_mtree_mult1_0_shift0(BITSHIFT,1149)@14
    u0_m0_wo3_mtree_mult1_0_shift0_q_int <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_mem_q & "00000000000000";
    u0_m0_wo3_mtree_mult1_0_shift0_q <= u0_m0_wo3_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u0_m0_wo2_wi0_sym_add0(ADD,289)@10
    u0_m0_wo2_wi0_sym_add0_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_0(15)) & xIn_0);
    u0_m0_wo2_wi0_sym_add0_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi3_delayr1_q(15)) & u0_m0_wo0_wi3_delayr1_q);
    u0_m0_wo2_wi0_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_wi0_sym_add0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_wi0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_wi0_sym_add0_a) + SIGNED(u0_m0_wo2_wi0_sym_add0_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_wi0_sym_add0_q <= u0_m0_wo2_wi0_sym_add0_o(16 downto 0);


	--d_u0_m0_wo2_wi0_sym_add0_q_12(DELAY,1254)@11
    d_u0_m0_wo2_wi0_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u0_m0_wo2_wi0_sym_add0_q, xout => d_u0_m0_wo2_wi0_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u0_m0_wo2_mtree_madd2_0_constmult0_shift2(BITSHIFT,1118)@12
    u0_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int <= d_u0_m0_wo2_wi0_sym_add0_q_12_q & "0000000000000";
    u0_m0_wo2_mtree_madd2_0_constmult0_shift2_q <= u0_m0_wo2_mtree_madd2_0_constmult0_shift2_q_int(29 downto 0);

	--u0_m0_wo2_mtree_madd2_0_constmult0_shift0(BITSHIFT,1116)@11
    u0_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int <= u0_m0_wo2_wi0_sym_add0_q & "0000000000";
    u0_m0_wo2_mtree_madd2_0_constmult0_shift0_q <= u0_m0_wo2_mtree_madd2_0_constmult0_shift0_q_int(26 downto 0);

	--u0_m0_wo2_mtree_madd2_0_constmult0_add_1(ADD,1117)@11
    u0_m0_wo2_mtree_madd2_0_constmult0_add_1_a <= STD_LOGIC_VECTOR((27 downto 17 => u0_m0_wo2_wi0_sym_add0_q(16)) & u0_m0_wo2_wi0_sym_add0_q);
    u0_m0_wo2_mtree_madd2_0_constmult0_add_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo2_mtree_madd2_0_constmult0_shift0_q(26)) & u0_m0_wo2_mtree_madd2_0_constmult0_shift0_q);
    u0_m0_wo2_mtree_madd2_0_constmult0_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_madd2_0_constmult0_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_madd2_0_constmult0_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_madd2_0_constmult0_add_1_a) + SIGNED(u0_m0_wo2_mtree_madd2_0_constmult0_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_madd2_0_constmult0_add_1_q <= u0_m0_wo2_mtree_madd2_0_constmult0_add_1_o(27 downto 0);


	--u0_m0_wo2_mtree_madd2_0_constmult0_add_3(ADD,1119)@12
    u0_m0_wo2_mtree_madd2_0_constmult0_add_3_a <= STD_LOGIC_VECTOR((30 downto 28 => u0_m0_wo2_mtree_madd2_0_constmult0_add_1_q(27)) & u0_m0_wo2_mtree_madd2_0_constmult0_add_1_q);
    u0_m0_wo2_mtree_madd2_0_constmult0_add_3_b <= STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo2_mtree_madd2_0_constmult0_shift2_q(29)) & u0_m0_wo2_mtree_madd2_0_constmult0_shift2_q);
    u0_m0_wo2_mtree_madd2_0_constmult0_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_madd2_0_constmult0_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_madd2_0_constmult0_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_madd2_0_constmult0_add_3_a) + SIGNED(u0_m0_wo2_mtree_madd2_0_constmult0_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_madd2_0_constmult0_add_3_q <= u0_m0_wo2_mtree_madd2_0_constmult0_add_3_o(30 downto 0);


	--u0_m0_wo0_wi2_delayr2(DELAY,25)@10
    u0_m0_wo0_wi2_delayr2 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_2, xout => u0_m0_wo0_wi2_delayr2_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo2_wi1_sym_add1(ADD,290)@10
    u0_m0_wo2_wi1_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => xIn_1(15)) & xIn_1);
    u0_m0_wo2_wi1_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi2_delayr2_q(15)) & u0_m0_wo0_wi2_delayr2_q);
    u0_m0_wo2_wi1_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_wi1_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_wi1_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_wi1_sym_add1_a) + SIGNED(u0_m0_wo2_wi1_sym_add1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_wi1_sym_add1_q <= u0_m0_wo2_wi1_sym_add1_o(16 downto 0);


	--d_u0_m0_wo2_wi1_sym_add1_q_12(DELAY,1255)@11
    d_u0_m0_wo2_wi1_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u0_m0_wo2_wi1_sym_add1_q, xout => d_u0_m0_wo2_wi1_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u0_m0_wo2_mtree_madd2_0_constmult1_shift1(BITSHIFT,1121)@12
    u0_m0_wo2_mtree_madd2_0_constmult1_shift1_q_int <= d_u0_m0_wo2_wi1_sym_add1_q_12_q & "0000000000";
    u0_m0_wo2_mtree_madd2_0_constmult1_shift1_q <= u0_m0_wo2_mtree_madd2_0_constmult1_shift1_q_int(26 downto 0);

	--u0_m0_wo2_mtree_madd2_0_constmult1_sub_0(SUB,1120)@11
    u0_m0_wo2_mtree_madd2_0_constmult1_sub_0_a <= STD_LOGIC_VECTOR((17 downto 1 => GND_q(0)) & GND_q);
    u0_m0_wo2_mtree_madd2_0_constmult1_sub_0_b <= STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo2_wi1_sym_add1_q(16)) & u0_m0_wo2_wi1_sym_add1_q);
    u0_m0_wo2_mtree_madd2_0_constmult1_sub_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_madd2_0_constmult1_sub_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_madd2_0_constmult1_sub_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_madd2_0_constmult1_sub_0_a) - SIGNED(u0_m0_wo2_mtree_madd2_0_constmult1_sub_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_madd2_0_constmult1_sub_0_q <= u0_m0_wo2_mtree_madd2_0_constmult1_sub_0_o(17 downto 0);


	--u0_m0_wo2_mtree_madd2_0_constmult1_sub_2(SUB,1122)@12
    u0_m0_wo2_mtree_madd2_0_constmult1_sub_2_a <= STD_LOGIC_VECTOR((27 downto 18 => u0_m0_wo2_mtree_madd2_0_constmult1_sub_0_q(17)) & u0_m0_wo2_mtree_madd2_0_constmult1_sub_0_q);
    u0_m0_wo2_mtree_madd2_0_constmult1_sub_2_b <= STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo2_mtree_madd2_0_constmult1_shift1_q(26)) & u0_m0_wo2_mtree_madd2_0_constmult1_shift1_q);
    u0_m0_wo2_mtree_madd2_0_constmult1_sub_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_madd2_0_constmult1_sub_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_madd2_0_constmult1_sub_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_madd2_0_constmult1_sub_2_a) - SIGNED(u0_m0_wo2_mtree_madd2_0_constmult1_sub_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_madd2_0_constmult1_sub_2_q <= u0_m0_wo2_mtree_madd2_0_constmult1_sub_2_o(27 downto 0);


	--u0_m0_wo2_mtree_madd2_0_sum1(ADD,1123)@13
    u0_m0_wo2_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u0_m0_wo2_mtree_madd2_0_constmult1_sub_2_q(27)) & u0_m0_wo2_mtree_madd2_0_constmult1_sub_2_q);
    u0_m0_wo2_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo2_mtree_madd2_0_constmult0_add_3_q(30)) & u0_m0_wo2_mtree_madd2_0_constmult0_add_3_q);
    u0_m0_wo2_mtree_madd2_0_sum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo2_mtree_madd2_0_sum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo2_mtree_madd2_0_sum1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo2_mtree_madd2_0_sum1_a) + SIGNED(u0_m0_wo2_mtree_madd2_0_sum1_b));
        END IF;
    END PROCESS;
    u0_m0_wo2_mtree_madd2_0_sum1_q <= u0_m0_wo2_mtree_madd2_0_sum1_o(31 downto 0);


	--d_u0_m0_wo0_wi3_phasedelay1_q_14_replace_mem(DUALMEM,1297)
    d_u0_m0_wo0_wi3_phasedelay1_q_14_replace_mem_reset0 <= areset;
    d_u0_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ia <= u0_m0_wo0_wi3_delayr1_q;
    d_u0_m0_wo0_wi3_phasedelay1_q_14_replace_mem_aa <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdreg_q;
    d_u0_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ab <= d_u0_m0_wo0_wi0_phasedelay0_q_14_replace_rdmux_q;
    d_u0_m0_wo0_wi3_phasedelay1_q_14_replace_mem_dmem : altsyncram
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
        aclr1 => d_u0_m0_wo0_wi3_phasedelay1_q_14_replace_mem_reset0,
        clock1 => clk,
        address_b => d_u0_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => d_u0_m0_wo0_wi3_phasedelay1_q_14_replace_mem_iq,
        address_a => d_u0_m0_wo0_wi3_phasedelay1_q_14_replace_mem_aa,
        data_a => d_u0_m0_wo0_wi3_phasedelay1_q_14_replace_mem_ia
    );
        d_u0_m0_wo0_wi3_phasedelay1_q_14_replace_mem_q <= d_u0_m0_wo0_wi3_phasedelay1_q_14_replace_mem_iq(15 downto 0);

	--u0_m0_wo1_mtree_mult1_0_shift0(BITSHIFT,1109)@14
    u0_m0_wo1_mtree_mult1_0_shift0_q_int <= d_u0_m0_wo0_wi3_phasedelay1_q_14_replace_mem_q & "00000000000000";
    u0_m0_wo1_mtree_mult1_0_shift0_q <= u0_m0_wo1_mtree_mult1_0_shift0_q_int(29 downto 0);

	--u0_m0_wo0_wi3_sym_add1(ADD,38)@10
    u0_m0_wo0_wi3_sym_add1_a <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi3_delayr1_q(15)) & u0_m0_wo0_wi3_delayr1_q);
    u0_m0_wo0_wi3_sym_add1_b <= STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi2_delayr2_q(15)) & u0_m0_wo0_wi2_delayr2_q);
    u0_m0_wo0_wi3_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi3_sym_add1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi3_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_wi3_sym_add1_a) + SIGNED(u0_m0_wo0_wi3_sym_add1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_wi3_sym_add1_q <= u0_m0_wo0_wi3_sym_add1_o(16 downto 0);


	--d_u0_m0_wo0_wi3_sym_add1_q_12(DELAY,1240)@11
    d_u0_m0_wo0_wi3_sym_add1_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi3_sym_add1_q, xout => d_u0_m0_wo0_wi3_sym_add1_q_12_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_madd2_0_constmult1_shift2(BITSHIFT,1081)@12
    u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int <= d_u0_m0_wo0_wi3_sym_add1_q_12_q & "0000000000000";
    u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q <= u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q_int(29 downto 0);

	--u0_m0_wo0_mtree_madd2_0_constmult1_shift0(BITSHIFT,1079)@11
    u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int <= u0_m0_wo0_wi3_sym_add1_q & "0000000000";
    u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q <= u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q_int(26 downto 0);

	--u0_m0_wo0_mtree_madd2_0_constmult1_add_1(ADD,1080)@11
    u0_m0_wo0_mtree_madd2_0_constmult1_add_1_a <= STD_LOGIC_VECTOR((27 downto 17 => u0_m0_wo0_wi3_sym_add1_q(16)) & u0_m0_wo0_wi3_sym_add1_q);
    u0_m0_wo0_mtree_madd2_0_constmult1_add_1_b <= STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q(26)) & u0_m0_wo0_mtree_madd2_0_constmult1_shift0_q);
    u0_m0_wo0_mtree_madd2_0_constmult1_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult1_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_madd2_0_constmult1_add_1_a) + SIGNED(u0_m0_wo0_mtree_madd2_0_constmult1_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_madd2_0_constmult1_add_1_q <= u0_m0_wo0_mtree_madd2_0_constmult1_add_1_o(27 downto 0);


	--u0_m0_wo0_mtree_madd2_0_constmult1_add_3(ADD,1082)@12
    u0_m0_wo0_mtree_madd2_0_constmult1_add_3_a <= STD_LOGIC_VECTOR((30 downto 28 => u0_m0_wo0_mtree_madd2_0_constmult1_add_1_q(27)) & u0_m0_wo0_mtree_madd2_0_constmult1_add_1_q);
    u0_m0_wo0_mtree_madd2_0_constmult1_add_3_b <= STD_LOGIC_VECTOR((30 downto 30 => u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q(29)) & u0_m0_wo0_mtree_madd2_0_constmult1_shift2_q);
    u0_m0_wo0_mtree_madd2_0_constmult1_add_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult1_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_madd2_0_constmult1_add_3_a) + SIGNED(u0_m0_wo0_mtree_madd2_0_constmult1_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_madd2_0_constmult1_add_3_q <= u0_m0_wo0_mtree_madd2_0_constmult1_add_3_o(30 downto 0);


	--u0_m0_wo0_wi1_delayr3(DELAY,19)@10
    u0_m0_wo0_wi1_delayr3 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => xIn_1, xout => u0_m0_wo0_wi1_delayr3_q, ena => xIn_v(0), clk => clk, aclr => areset );

	--u0_m0_wo0_wi0_sym_add0(ADD,37)@10
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


	--d_u0_m0_wo0_wi0_sym_add0_q_12(DELAY,1239)@11
    d_u0_m0_wo0_wi0_sym_add0_q_12 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1 )
    PORT MAP ( xin => u0_m0_wo0_wi0_sym_add0_q, xout => d_u0_m0_wo0_wi0_sym_add0_q_12_q, clk => clk, aclr => areset );

	--u0_m0_wo0_mtree_madd2_0_constmult0_shift1(BITSHIFT,1077)@12
    u0_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int <= d_u0_m0_wo0_wi0_sym_add0_q_12_q & "0000000000";
    u0_m0_wo0_mtree_madd2_0_constmult0_shift1_q <= u0_m0_wo0_mtree_madd2_0_constmult0_shift1_q_int(26 downto 0);

	--u0_m0_wo0_mtree_madd2_0_constmult0_sub_0(SUB,1076)@11
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_a <= STD_LOGIC_VECTOR((17 downto 1 => GND_q(0)) & GND_q);
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_b <= STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo0_wi0_sym_add0_q(16)) & u0_m0_wo0_wi0_sym_add0_q);
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_a) - SIGNED(u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_q <= u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_o(17 downto 0);


	--u0_m0_wo0_mtree_madd2_0_constmult0_sub_2(SUB,1078)@12
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_2_a <= STD_LOGIC_VECTOR((27 downto 18 => u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_q(17)) & u0_m0_wo0_mtree_madd2_0_constmult0_sub_0_q);
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_2_b <= STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_madd2_0_constmult0_shift1_q(26)) & u0_m0_wo0_mtree_madd2_0_constmult0_shift1_q);
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult0_sub_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_madd2_0_constmult0_sub_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_madd2_0_constmult0_sub_2_a) - SIGNED(u0_m0_wo0_mtree_madd2_0_constmult0_sub_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_madd2_0_constmult0_sub_2_q <= u0_m0_wo0_mtree_madd2_0_constmult0_sub_2_o(27 downto 0);


	--u0_m0_wo0_mtree_madd2_0_sum1(ADD,1083)@13
    u0_m0_wo0_mtree_madd2_0_sum1_a <= STD_LOGIC_VECTOR((31 downto 28 => u0_m0_wo0_mtree_madd2_0_constmult0_sub_2_q(27)) & u0_m0_wo0_mtree_madd2_0_constmult0_sub_2_q);
    u0_m0_wo0_mtree_madd2_0_sum1_b <= STD_LOGIC_VECTOR((31 downto 31 => u0_m0_wo0_mtree_madd2_0_constmult1_add_3_q(30)) & u0_m0_wo0_mtree_madd2_0_constmult1_add_3_q);
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

	--d_in0_m0_wi0_wo0_assign_sel_q_13(DELAY,1236)@10
    d_in0_m0_wi0_wo0_assign_sel_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => xIn_v, xout => d_in0_m0_wi0_wo0_assign_sel_q_13_q, clk => clk, aclr => areset );

	--u0_m0_wo0_oseq_gated_reg(REG,40)@13
    u0_m0_wo0_oseq_gated_reg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= d_in0_m0_wi0_wo0_assign_sel_q_13_q;
        END IF;
    END PROCESS;


	--xOut(PORTOUT,1075)@14
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
    xOut_8 <= STD_LOGIC_VECTOR((33 downto 32 => u1_m0_wo0_mtree_madd2_0_sum1_q(31)) & u1_m0_wo0_mtree_madd2_0_sum1_q);
    xOut_9 <= STD_LOGIC_VECTOR((33 downto 30 => u1_m0_wo1_mtree_mult1_0_shift0_q(29)) & u1_m0_wo1_mtree_mult1_0_shift0_q);
    xOut_10 <= STD_LOGIC_VECTOR((33 downto 32 => u1_m0_wo2_mtree_madd2_0_sum1_q(31)) & u1_m0_wo2_mtree_madd2_0_sum1_q);
    xOut_11 <= STD_LOGIC_VECTOR((33 downto 30 => u1_m0_wo3_mtree_mult1_0_shift0_q(29)) & u1_m0_wo3_mtree_mult1_0_shift0_q);
    xOut_12 <= STD_LOGIC_VECTOR((33 downto 32 => u1_m0_wo4_mtree_madd2_0_sum1_q(31)) & u1_m0_wo4_mtree_madd2_0_sum1_q);
    xOut_13 <= STD_LOGIC_VECTOR((33 downto 30 => u1_m0_wo5_mtree_mult1_0_shift0_q(29)) & u1_m0_wo5_mtree_mult1_0_shift0_q);
    xOut_14 <= STD_LOGIC_VECTOR((33 downto 32 => u1_m0_wo6_mtree_madd2_0_sum1_q(31)) & u1_m0_wo6_mtree_madd2_0_sum1_q);
    xOut_15 <= STD_LOGIC_VECTOR((33 downto 30 => u1_m0_wo7_mtree_mult1_0_shift0_q(29)) & u1_m0_wo7_mtree_mult1_0_shift0_q);
    xOut_16 <= STD_LOGIC_VECTOR((33 downto 32 => u2_m0_wo0_mtree_madd2_0_sum1_q(31)) & u2_m0_wo0_mtree_madd2_0_sum1_q);
    xOut_17 <= STD_LOGIC_VECTOR((33 downto 30 => u2_m0_wo1_mtree_mult1_0_shift0_q(29)) & u2_m0_wo1_mtree_mult1_0_shift0_q);
    xOut_18 <= STD_LOGIC_VECTOR((33 downto 32 => u2_m0_wo2_mtree_madd2_0_sum1_q(31)) & u2_m0_wo2_mtree_madd2_0_sum1_q);
    xOut_19 <= STD_LOGIC_VECTOR((33 downto 30 => u2_m0_wo3_mtree_mult1_0_shift0_q(29)) & u2_m0_wo3_mtree_mult1_0_shift0_q);
    xOut_20 <= STD_LOGIC_VECTOR((33 downto 32 => u2_m0_wo4_mtree_madd2_0_sum1_q(31)) & u2_m0_wo4_mtree_madd2_0_sum1_q);
    xOut_21 <= STD_LOGIC_VECTOR((33 downto 30 => u2_m0_wo5_mtree_mult1_0_shift0_q(29)) & u2_m0_wo5_mtree_mult1_0_shift0_q);
    xOut_22 <= STD_LOGIC_VECTOR((33 downto 32 => u2_m0_wo6_mtree_madd2_0_sum1_q(31)) & u2_m0_wo6_mtree_madd2_0_sum1_q);
    xOut_23 <= STD_LOGIC_VECTOR((33 downto 30 => u2_m0_wo7_mtree_mult1_0_shift0_q(29)) & u2_m0_wo7_mtree_mult1_0_shift0_q);
    xOut_24 <= STD_LOGIC_VECTOR((33 downto 32 => u3_m0_wo0_mtree_madd2_0_sum1_q(31)) & u3_m0_wo0_mtree_madd2_0_sum1_q);
    xOut_25 <= STD_LOGIC_VECTOR((33 downto 30 => u3_m0_wo1_mtree_mult1_0_shift0_q(29)) & u3_m0_wo1_mtree_mult1_0_shift0_q);
    xOut_26 <= STD_LOGIC_VECTOR((33 downto 32 => u3_m0_wo2_mtree_madd2_0_sum1_q(31)) & u3_m0_wo2_mtree_madd2_0_sum1_q);
    xOut_27 <= STD_LOGIC_VECTOR((33 downto 30 => u3_m0_wo3_mtree_mult1_0_shift0_q(29)) & u3_m0_wo3_mtree_mult1_0_shift0_q);
    xOut_28 <= STD_LOGIC_VECTOR((33 downto 32 => u3_m0_wo4_mtree_madd2_0_sum1_q(31)) & u3_m0_wo4_mtree_madd2_0_sum1_q);
    xOut_29 <= STD_LOGIC_VECTOR((33 downto 30 => u3_m0_wo5_mtree_mult1_0_shift0_q(29)) & u3_m0_wo5_mtree_mult1_0_shift0_q);
    xOut_30 <= STD_LOGIC_VECTOR((33 downto 32 => u3_m0_wo6_mtree_madd2_0_sum1_q(31)) & u3_m0_wo6_mtree_madd2_0_sum1_q);
    xOut_31 <= STD_LOGIC_VECTOR((33 downto 30 => u3_m0_wo7_mtree_mult1_0_shift0_q(29)) & u3_m0_wo7_mtree_mult1_0_shift0_q);


end normal;
