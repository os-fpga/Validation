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

-- VHDL created from DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Mixer9
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
entity DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Mixer9 is
    port (
        In_v : in std_logic_vector(0 downto 0);
        In_c : in std_logic_vector(7 downto 0);
        iIn_0 : in std_logic_vector(15 downto 0);
        iIn_1 : in std_logic_vector(15 downto 0);
        iIn_2 : in std_logic_vector(15 downto 0);
        iIn_3 : in std_logic_vector(15 downto 0);
        iIn_4 : in std_logic_vector(15 downto 0);
        iIn_5 : in std_logic_vector(15 downto 0);
        iIn_6 : in std_logic_vector(15 downto 0);
        iIn_7 : in std_logic_vector(15 downto 0);
        qIn_0 : in std_logic_vector(15 downto 0);
        qIn_1 : in std_logic_vector(15 downto 0);
        qIn_2 : in std_logic_vector(15 downto 0);
        qIn_3 : in std_logic_vector(15 downto 0);
        qIn_4 : in std_logic_vector(15 downto 0);
        qIn_5 : in std_logic_vector(15 downto 0);
        qIn_6 : in std_logic_vector(15 downto 0);
        qIn_7 : in std_logic_vector(15 downto 0);
        sIn_0 : in std_logic_vector(11 downto 0);
        sIn_1 : in std_logic_vector(11 downto 0);
        sIn_2 : in std_logic_vector(11 downto 0);
        sIn_3 : in std_logic_vector(11 downto 0);
        sIn_4 : in std_logic_vector(11 downto 0);
        sIn_5 : in std_logic_vector(11 downto 0);
        sIn_6 : in std_logic_vector(11 downto 0);
        sIn_7 : in std_logic_vector(11 downto 0);
        cIn_0 : in std_logic_vector(11 downto 0);
        cIn_1 : in std_logic_vector(11 downto 0);
        cIn_2 : in std_logic_vector(11 downto 0);
        cIn_3 : in std_logic_vector(11 downto 0);
        cIn_4 : in std_logic_vector(11 downto 0);
        cIn_5 : in std_logic_vector(11 downto 0);
        cIn_6 : in std_logic_vector(11 downto 0);
        cIn_7 : in std_logic_vector(11 downto 0);
        Out_v : out std_logic_vector(0 downto 0);
        Out_c : out std_logic_vector(7 downto 0);
        iOut_0 : out std_logic_vector(28 downto 0);
        iOut_1 : out std_logic_vector(28 downto 0);
        iOut_2 : out std_logic_vector(28 downto 0);
        iOut_3 : out std_logic_vector(28 downto 0);
        iOut_4 : out std_logic_vector(28 downto 0);
        iOut_5 : out std_logic_vector(28 downto 0);
        iOut_6 : out std_logic_vector(28 downto 0);
        iOut_7 : out std_logic_vector(28 downto 0);
        qOut_0 : out std_logic_vector(28 downto 0);
        qOut_1 : out std_logic_vector(28 downto 0);
        qOut_2 : out std_logic_vector(28 downto 0);
        qOut_3 : out std_logic_vector(28 downto 0);
        qOut_4 : out std_logic_vector(28 downto 0);
        qOut_5 : out std_logic_vector(28 downto 0);
        qOut_6 : out std_logic_vector(28 downto 0);
        qOut_7 : out std_logic_vector(28 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Mixer9 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal d_iIn_In_c_3_q : std_logic_vector (7 downto 0);
    signal d_iIn_In_v_3_q : std_logic_vector (0 downto 0);
    type u0_as_mult_i_cma_a_type is array(0 to 1) of SIGNED(11 downto 0);
    signal u0_as_mult_i_cma_a : u0_as_mult_i_cma_a_type;
    type u0_as_mult_i_cma_c_type is array(0 to 1) of SIGNED(15 downto 0);
    signal u0_as_mult_i_cma_c : u0_as_mult_i_cma_c_type;
    type u0_as_mult_i_cma_p_type is array(0 to 1) of SIGNED(27 downto 0);
    signal u0_as_mult_i_cma_p : u0_as_mult_i_cma_p_type;
    type u0_as_mult_i_cma_w_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u0_as_mult_i_cma_w : u0_as_mult_i_cma_w_type;
    type u0_as_mult_i_cma_x_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u0_as_mult_i_cma_x : u0_as_mult_i_cma_x_type;
    type u0_as_mult_i_cma_y_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u0_as_mult_i_cma_y : u0_as_mult_i_cma_y_type;
    type u0_as_mult_i_cma_s_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u0_as_mult_i_cma_s : u0_as_mult_i_cma_s_type;
    signal u0_as_mult_i_cma_s0 : std_logic_vector(28 downto 0);
    signal u0_as_mult_i_cma_q : std_logic_vector (28 downto 0);
    type u0_as_mult_q_cma_a_type is array(0 to 1) of SIGNED(11 downto 0);
    signal u0_as_mult_q_cma_a : u0_as_mult_q_cma_a_type;
    type u0_as_mult_q_cma_c_type is array(0 to 1) of SIGNED(15 downto 0);
    signal u0_as_mult_q_cma_c : u0_as_mult_q_cma_c_type;
    type u0_as_mult_q_cma_p_type is array(0 to 1) of SIGNED(27 downto 0);
    signal u0_as_mult_q_cma_p : u0_as_mult_q_cma_p_type;
    type u0_as_mult_q_cma_w_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u0_as_mult_q_cma_w : u0_as_mult_q_cma_w_type;
    type u0_as_mult_q_cma_x_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u0_as_mult_q_cma_x : u0_as_mult_q_cma_x_type;
    type u0_as_mult_q_cma_y_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u0_as_mult_q_cma_y : u0_as_mult_q_cma_y_type;
    type u0_as_mult_q_cma_s_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u0_as_mult_q_cma_s : u0_as_mult_q_cma_s_type;
    signal u0_as_mult_q_cma_s0 : std_logic_vector(28 downto 0);
    signal u0_as_mult_q_cma_q : std_logic_vector (28 downto 0);
    type u1_as_mult_i_cma_a_type is array(0 to 1) of SIGNED(11 downto 0);
    signal u1_as_mult_i_cma_a : u1_as_mult_i_cma_a_type;
    type u1_as_mult_i_cma_c_type is array(0 to 1) of SIGNED(15 downto 0);
    signal u1_as_mult_i_cma_c : u1_as_mult_i_cma_c_type;
    type u1_as_mult_i_cma_p_type is array(0 to 1) of SIGNED(27 downto 0);
    signal u1_as_mult_i_cma_p : u1_as_mult_i_cma_p_type;
    type u1_as_mult_i_cma_w_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u1_as_mult_i_cma_w : u1_as_mult_i_cma_w_type;
    type u1_as_mult_i_cma_x_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u1_as_mult_i_cma_x : u1_as_mult_i_cma_x_type;
    type u1_as_mult_i_cma_y_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u1_as_mult_i_cma_y : u1_as_mult_i_cma_y_type;
    type u1_as_mult_i_cma_s_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u1_as_mult_i_cma_s : u1_as_mult_i_cma_s_type;
    signal u1_as_mult_i_cma_s0 : std_logic_vector(28 downto 0);
    signal u1_as_mult_i_cma_q : std_logic_vector (28 downto 0);
    type u1_as_mult_q_cma_a_type is array(0 to 1) of SIGNED(11 downto 0);
    signal u1_as_mult_q_cma_a : u1_as_mult_q_cma_a_type;
    type u1_as_mult_q_cma_c_type is array(0 to 1) of SIGNED(15 downto 0);
    signal u1_as_mult_q_cma_c : u1_as_mult_q_cma_c_type;
    type u1_as_mult_q_cma_p_type is array(0 to 1) of SIGNED(27 downto 0);
    signal u1_as_mult_q_cma_p : u1_as_mult_q_cma_p_type;
    type u1_as_mult_q_cma_w_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u1_as_mult_q_cma_w : u1_as_mult_q_cma_w_type;
    type u1_as_mult_q_cma_x_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u1_as_mult_q_cma_x : u1_as_mult_q_cma_x_type;
    type u1_as_mult_q_cma_y_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u1_as_mult_q_cma_y : u1_as_mult_q_cma_y_type;
    type u1_as_mult_q_cma_s_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u1_as_mult_q_cma_s : u1_as_mult_q_cma_s_type;
    signal u1_as_mult_q_cma_s0 : std_logic_vector(28 downto 0);
    signal u1_as_mult_q_cma_q : std_logic_vector (28 downto 0);
    type u2_as_mult_i_cma_a_type is array(0 to 1) of SIGNED(11 downto 0);
    signal u2_as_mult_i_cma_a : u2_as_mult_i_cma_a_type;
    type u2_as_mult_i_cma_c_type is array(0 to 1) of SIGNED(15 downto 0);
    signal u2_as_mult_i_cma_c : u2_as_mult_i_cma_c_type;
    type u2_as_mult_i_cma_p_type is array(0 to 1) of SIGNED(27 downto 0);
    signal u2_as_mult_i_cma_p : u2_as_mult_i_cma_p_type;
    type u2_as_mult_i_cma_w_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u2_as_mult_i_cma_w : u2_as_mult_i_cma_w_type;
    type u2_as_mult_i_cma_x_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u2_as_mult_i_cma_x : u2_as_mult_i_cma_x_type;
    type u2_as_mult_i_cma_y_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u2_as_mult_i_cma_y : u2_as_mult_i_cma_y_type;
    type u2_as_mult_i_cma_s_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u2_as_mult_i_cma_s : u2_as_mult_i_cma_s_type;
    signal u2_as_mult_i_cma_s0 : std_logic_vector(28 downto 0);
    signal u2_as_mult_i_cma_q : std_logic_vector (28 downto 0);
    type u2_as_mult_q_cma_a_type is array(0 to 1) of SIGNED(11 downto 0);
    signal u2_as_mult_q_cma_a : u2_as_mult_q_cma_a_type;
    type u2_as_mult_q_cma_c_type is array(0 to 1) of SIGNED(15 downto 0);
    signal u2_as_mult_q_cma_c : u2_as_mult_q_cma_c_type;
    type u2_as_mult_q_cma_p_type is array(0 to 1) of SIGNED(27 downto 0);
    signal u2_as_mult_q_cma_p : u2_as_mult_q_cma_p_type;
    type u2_as_mult_q_cma_w_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u2_as_mult_q_cma_w : u2_as_mult_q_cma_w_type;
    type u2_as_mult_q_cma_x_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u2_as_mult_q_cma_x : u2_as_mult_q_cma_x_type;
    type u2_as_mult_q_cma_y_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u2_as_mult_q_cma_y : u2_as_mult_q_cma_y_type;
    type u2_as_mult_q_cma_s_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u2_as_mult_q_cma_s : u2_as_mult_q_cma_s_type;
    signal u2_as_mult_q_cma_s0 : std_logic_vector(28 downto 0);
    signal u2_as_mult_q_cma_q : std_logic_vector (28 downto 0);
    type u3_as_mult_i_cma_a_type is array(0 to 1) of SIGNED(11 downto 0);
    signal u3_as_mult_i_cma_a : u3_as_mult_i_cma_a_type;
    type u3_as_mult_i_cma_c_type is array(0 to 1) of SIGNED(15 downto 0);
    signal u3_as_mult_i_cma_c : u3_as_mult_i_cma_c_type;
    type u3_as_mult_i_cma_p_type is array(0 to 1) of SIGNED(27 downto 0);
    signal u3_as_mult_i_cma_p : u3_as_mult_i_cma_p_type;
    type u3_as_mult_i_cma_w_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u3_as_mult_i_cma_w : u3_as_mult_i_cma_w_type;
    type u3_as_mult_i_cma_x_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u3_as_mult_i_cma_x : u3_as_mult_i_cma_x_type;
    type u3_as_mult_i_cma_y_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u3_as_mult_i_cma_y : u3_as_mult_i_cma_y_type;
    type u3_as_mult_i_cma_s_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u3_as_mult_i_cma_s : u3_as_mult_i_cma_s_type;
    signal u3_as_mult_i_cma_s0 : std_logic_vector(28 downto 0);
    signal u3_as_mult_i_cma_q : std_logic_vector (28 downto 0);
    type u3_as_mult_q_cma_a_type is array(0 to 1) of SIGNED(11 downto 0);
    signal u3_as_mult_q_cma_a : u3_as_mult_q_cma_a_type;
    type u3_as_mult_q_cma_c_type is array(0 to 1) of SIGNED(15 downto 0);
    signal u3_as_mult_q_cma_c : u3_as_mult_q_cma_c_type;
    type u3_as_mult_q_cma_p_type is array(0 to 1) of SIGNED(27 downto 0);
    signal u3_as_mult_q_cma_p : u3_as_mult_q_cma_p_type;
    type u3_as_mult_q_cma_w_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u3_as_mult_q_cma_w : u3_as_mult_q_cma_w_type;
    type u3_as_mult_q_cma_x_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u3_as_mult_q_cma_x : u3_as_mult_q_cma_x_type;
    type u3_as_mult_q_cma_y_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u3_as_mult_q_cma_y : u3_as_mult_q_cma_y_type;
    type u3_as_mult_q_cma_s_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u3_as_mult_q_cma_s : u3_as_mult_q_cma_s_type;
    signal u3_as_mult_q_cma_s0 : std_logic_vector(28 downto 0);
    signal u3_as_mult_q_cma_q : std_logic_vector (28 downto 0);
    type u4_as_mult_i_cma_a_type is array(0 to 1) of SIGNED(11 downto 0);
    signal u4_as_mult_i_cma_a : u4_as_mult_i_cma_a_type;
    type u4_as_mult_i_cma_c_type is array(0 to 1) of SIGNED(15 downto 0);
    signal u4_as_mult_i_cma_c : u4_as_mult_i_cma_c_type;
    type u4_as_mult_i_cma_p_type is array(0 to 1) of SIGNED(27 downto 0);
    signal u4_as_mult_i_cma_p : u4_as_mult_i_cma_p_type;
    type u4_as_mult_i_cma_w_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u4_as_mult_i_cma_w : u4_as_mult_i_cma_w_type;
    type u4_as_mult_i_cma_x_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u4_as_mult_i_cma_x : u4_as_mult_i_cma_x_type;
    type u4_as_mult_i_cma_y_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u4_as_mult_i_cma_y : u4_as_mult_i_cma_y_type;
    type u4_as_mult_i_cma_s_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u4_as_mult_i_cma_s : u4_as_mult_i_cma_s_type;
    signal u4_as_mult_i_cma_s0 : std_logic_vector(28 downto 0);
    signal u4_as_mult_i_cma_q : std_logic_vector (28 downto 0);
    type u4_as_mult_q_cma_a_type is array(0 to 1) of SIGNED(11 downto 0);
    signal u4_as_mult_q_cma_a : u4_as_mult_q_cma_a_type;
    type u4_as_mult_q_cma_c_type is array(0 to 1) of SIGNED(15 downto 0);
    signal u4_as_mult_q_cma_c : u4_as_mult_q_cma_c_type;
    type u4_as_mult_q_cma_p_type is array(0 to 1) of SIGNED(27 downto 0);
    signal u4_as_mult_q_cma_p : u4_as_mult_q_cma_p_type;
    type u4_as_mult_q_cma_w_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u4_as_mult_q_cma_w : u4_as_mult_q_cma_w_type;
    type u4_as_mult_q_cma_x_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u4_as_mult_q_cma_x : u4_as_mult_q_cma_x_type;
    type u4_as_mult_q_cma_y_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u4_as_mult_q_cma_y : u4_as_mult_q_cma_y_type;
    type u4_as_mult_q_cma_s_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u4_as_mult_q_cma_s : u4_as_mult_q_cma_s_type;
    signal u4_as_mult_q_cma_s0 : std_logic_vector(28 downto 0);
    signal u4_as_mult_q_cma_q : std_logic_vector (28 downto 0);
    type u5_as_mult_i_cma_a_type is array(0 to 1) of SIGNED(11 downto 0);
    signal u5_as_mult_i_cma_a : u5_as_mult_i_cma_a_type;
    type u5_as_mult_i_cma_c_type is array(0 to 1) of SIGNED(15 downto 0);
    signal u5_as_mult_i_cma_c : u5_as_mult_i_cma_c_type;
    type u5_as_mult_i_cma_p_type is array(0 to 1) of SIGNED(27 downto 0);
    signal u5_as_mult_i_cma_p : u5_as_mult_i_cma_p_type;
    type u5_as_mult_i_cma_w_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u5_as_mult_i_cma_w : u5_as_mult_i_cma_w_type;
    type u5_as_mult_i_cma_x_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u5_as_mult_i_cma_x : u5_as_mult_i_cma_x_type;
    type u5_as_mult_i_cma_y_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u5_as_mult_i_cma_y : u5_as_mult_i_cma_y_type;
    type u5_as_mult_i_cma_s_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u5_as_mult_i_cma_s : u5_as_mult_i_cma_s_type;
    signal u5_as_mult_i_cma_s0 : std_logic_vector(28 downto 0);
    signal u5_as_mult_i_cma_q : std_logic_vector (28 downto 0);
    type u5_as_mult_q_cma_a_type is array(0 to 1) of SIGNED(11 downto 0);
    signal u5_as_mult_q_cma_a : u5_as_mult_q_cma_a_type;
    type u5_as_mult_q_cma_c_type is array(0 to 1) of SIGNED(15 downto 0);
    signal u5_as_mult_q_cma_c : u5_as_mult_q_cma_c_type;
    type u5_as_mult_q_cma_p_type is array(0 to 1) of SIGNED(27 downto 0);
    signal u5_as_mult_q_cma_p : u5_as_mult_q_cma_p_type;
    type u5_as_mult_q_cma_w_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u5_as_mult_q_cma_w : u5_as_mult_q_cma_w_type;
    type u5_as_mult_q_cma_x_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u5_as_mult_q_cma_x : u5_as_mult_q_cma_x_type;
    type u5_as_mult_q_cma_y_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u5_as_mult_q_cma_y : u5_as_mult_q_cma_y_type;
    type u5_as_mult_q_cma_s_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u5_as_mult_q_cma_s : u5_as_mult_q_cma_s_type;
    signal u5_as_mult_q_cma_s0 : std_logic_vector(28 downto 0);
    signal u5_as_mult_q_cma_q : std_logic_vector (28 downto 0);
    type u6_as_mult_i_cma_a_type is array(0 to 1) of SIGNED(11 downto 0);
    signal u6_as_mult_i_cma_a : u6_as_mult_i_cma_a_type;
    type u6_as_mult_i_cma_c_type is array(0 to 1) of SIGNED(15 downto 0);
    signal u6_as_mult_i_cma_c : u6_as_mult_i_cma_c_type;
    type u6_as_mult_i_cma_p_type is array(0 to 1) of SIGNED(27 downto 0);
    signal u6_as_mult_i_cma_p : u6_as_mult_i_cma_p_type;
    type u6_as_mult_i_cma_w_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u6_as_mult_i_cma_w : u6_as_mult_i_cma_w_type;
    type u6_as_mult_i_cma_x_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u6_as_mult_i_cma_x : u6_as_mult_i_cma_x_type;
    type u6_as_mult_i_cma_y_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u6_as_mult_i_cma_y : u6_as_mult_i_cma_y_type;
    type u6_as_mult_i_cma_s_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u6_as_mult_i_cma_s : u6_as_mult_i_cma_s_type;
    signal u6_as_mult_i_cma_s0 : std_logic_vector(28 downto 0);
    signal u6_as_mult_i_cma_q : std_logic_vector (28 downto 0);
    type u6_as_mult_q_cma_a_type is array(0 to 1) of SIGNED(11 downto 0);
    signal u6_as_mult_q_cma_a : u6_as_mult_q_cma_a_type;
    type u6_as_mult_q_cma_c_type is array(0 to 1) of SIGNED(15 downto 0);
    signal u6_as_mult_q_cma_c : u6_as_mult_q_cma_c_type;
    type u6_as_mult_q_cma_p_type is array(0 to 1) of SIGNED(27 downto 0);
    signal u6_as_mult_q_cma_p : u6_as_mult_q_cma_p_type;
    type u6_as_mult_q_cma_w_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u6_as_mult_q_cma_w : u6_as_mult_q_cma_w_type;
    type u6_as_mult_q_cma_x_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u6_as_mult_q_cma_x : u6_as_mult_q_cma_x_type;
    type u6_as_mult_q_cma_y_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u6_as_mult_q_cma_y : u6_as_mult_q_cma_y_type;
    type u6_as_mult_q_cma_s_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u6_as_mult_q_cma_s : u6_as_mult_q_cma_s_type;
    signal u6_as_mult_q_cma_s0 : std_logic_vector(28 downto 0);
    signal u6_as_mult_q_cma_q : std_logic_vector (28 downto 0);
    type u7_as_mult_i_cma_a_type is array(0 to 1) of SIGNED(11 downto 0);
    signal u7_as_mult_i_cma_a : u7_as_mult_i_cma_a_type;
    type u7_as_mult_i_cma_c_type is array(0 to 1) of SIGNED(15 downto 0);
    signal u7_as_mult_i_cma_c : u7_as_mult_i_cma_c_type;
    type u7_as_mult_i_cma_p_type is array(0 to 1) of SIGNED(27 downto 0);
    signal u7_as_mult_i_cma_p : u7_as_mult_i_cma_p_type;
    type u7_as_mult_i_cma_w_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u7_as_mult_i_cma_w : u7_as_mult_i_cma_w_type;
    type u7_as_mult_i_cma_x_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u7_as_mult_i_cma_x : u7_as_mult_i_cma_x_type;
    type u7_as_mult_i_cma_y_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u7_as_mult_i_cma_y : u7_as_mult_i_cma_y_type;
    type u7_as_mult_i_cma_s_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u7_as_mult_i_cma_s : u7_as_mult_i_cma_s_type;
    signal u7_as_mult_i_cma_s0 : std_logic_vector(28 downto 0);
    signal u7_as_mult_i_cma_q : std_logic_vector (28 downto 0);
    type u7_as_mult_q_cma_a_type is array(0 to 1) of SIGNED(11 downto 0);
    signal u7_as_mult_q_cma_a : u7_as_mult_q_cma_a_type;
    type u7_as_mult_q_cma_c_type is array(0 to 1) of SIGNED(15 downto 0);
    signal u7_as_mult_q_cma_c : u7_as_mult_q_cma_c_type;
    type u7_as_mult_q_cma_p_type is array(0 to 1) of SIGNED(27 downto 0);
    signal u7_as_mult_q_cma_p : u7_as_mult_q_cma_p_type;
    type u7_as_mult_q_cma_w_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u7_as_mult_q_cma_w : u7_as_mult_q_cma_w_type;
    type u7_as_mult_q_cma_x_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u7_as_mult_q_cma_x : u7_as_mult_q_cma_x_type;
    type u7_as_mult_q_cma_y_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u7_as_mult_q_cma_y : u7_as_mult_q_cma_y_type;
    type u7_as_mult_q_cma_s_type is array(0 to 0) of SIGNED(28 downto 0);
    signal u7_as_mult_q_cma_s : u7_as_mult_q_cma_s_type;
    signal u7_as_mult_q_cma_s0 : std_logic_vector(28 downto 0);
    signal u7_as_mult_q_cma_q : std_logic_vector (28 downto 0);
begin


	--iIn(PORTIN,2)@0

	--cIn(PORTIN,5)@0

	--qIn(PORTIN,3)@0

	--sIn(PORTIN,4)@0

	--GND(CONSTANT,0)@0
    GND_q <= "0";

	--VCC(CONSTANT,1)@0
    VCC_q <= "1";

	--u7_as_mult_i_cma(CHAINMULTADD,38)@0
    u7_as_mult_i_cma_p(0) <= u7_as_mult_i_cma_a(0) * u7_as_mult_i_cma_c(0);
    u7_as_mult_i_cma_p(1) <= u7_as_mult_i_cma_a(1) * u7_as_mult_i_cma_c(1);
    u7_as_mult_i_cma_w(0) <= RESIZE(u7_as_mult_i_cma_p(1),29) - RESIZE(u7_as_mult_i_cma_p(0),29);
    u7_as_mult_i_cma_x(0) <= u7_as_mult_i_cma_w(0);
    u7_as_mult_i_cma_y(0) <= u7_as_mult_i_cma_x(0);
    u7_as_mult_i_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_as_mult_i_cma_a <= (others => (others => '0'));
            u7_as_mult_i_cma_c <= (others => (others => '0'));
            u7_as_mult_i_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            u7_as_mult_i_cma_a(0) <= SIGNED(RESIZE(SIGNED(sIn_7),12));
            u7_as_mult_i_cma_a(1) <= SIGNED(RESIZE(SIGNED(cIn_7),12));
            u7_as_mult_i_cma_c(0) <= SIGNED(RESIZE(SIGNED(qIn_7),16));
            u7_as_mult_i_cma_c(1) <= SIGNED(RESIZE(SIGNED(iIn_7),16));
            u7_as_mult_i_cma_s(0) <= u7_as_mult_i_cma_y(0);
        END IF;
    END PROCESS;
    u7_as_mult_i_cma_s0 <= STD_LOGIC_VECTOR(RESIZE(u7_as_mult_i_cma_s(0),29));
    u7_as_mult_i_cma: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_as_mult_i_cma_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u7_as_mult_i_cma_q <= u7_as_mult_i_cma_s0;
        END IF;
    END PROCESS;

	--u6_as_mult_i_cma(CHAINMULTADD,36)@0
    u6_as_mult_i_cma_p(0) <= u6_as_mult_i_cma_a(0) * u6_as_mult_i_cma_c(0);
    u6_as_mult_i_cma_p(1) <= u6_as_mult_i_cma_a(1) * u6_as_mult_i_cma_c(1);
    u6_as_mult_i_cma_w(0) <= RESIZE(u6_as_mult_i_cma_p(1),29) - RESIZE(u6_as_mult_i_cma_p(0),29);
    u6_as_mult_i_cma_x(0) <= u6_as_mult_i_cma_w(0);
    u6_as_mult_i_cma_y(0) <= u6_as_mult_i_cma_x(0);
    u6_as_mult_i_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_as_mult_i_cma_a <= (others => (others => '0'));
            u6_as_mult_i_cma_c <= (others => (others => '0'));
            u6_as_mult_i_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            u6_as_mult_i_cma_a(0) <= SIGNED(RESIZE(SIGNED(sIn_6),12));
            u6_as_mult_i_cma_a(1) <= SIGNED(RESIZE(SIGNED(cIn_6),12));
            u6_as_mult_i_cma_c(0) <= SIGNED(RESIZE(SIGNED(qIn_6),16));
            u6_as_mult_i_cma_c(1) <= SIGNED(RESIZE(SIGNED(iIn_6),16));
            u6_as_mult_i_cma_s(0) <= u6_as_mult_i_cma_y(0);
        END IF;
    END PROCESS;
    u6_as_mult_i_cma_s0 <= STD_LOGIC_VECTOR(RESIZE(u6_as_mult_i_cma_s(0),29));
    u6_as_mult_i_cma: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_as_mult_i_cma_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u6_as_mult_i_cma_q <= u6_as_mult_i_cma_s0;
        END IF;
    END PROCESS;

	--u5_as_mult_i_cma(CHAINMULTADD,34)@0
    u5_as_mult_i_cma_p(0) <= u5_as_mult_i_cma_a(0) * u5_as_mult_i_cma_c(0);
    u5_as_mult_i_cma_p(1) <= u5_as_mult_i_cma_a(1) * u5_as_mult_i_cma_c(1);
    u5_as_mult_i_cma_w(0) <= RESIZE(u5_as_mult_i_cma_p(1),29) - RESIZE(u5_as_mult_i_cma_p(0),29);
    u5_as_mult_i_cma_x(0) <= u5_as_mult_i_cma_w(0);
    u5_as_mult_i_cma_y(0) <= u5_as_mult_i_cma_x(0);
    u5_as_mult_i_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_as_mult_i_cma_a <= (others => (others => '0'));
            u5_as_mult_i_cma_c <= (others => (others => '0'));
            u5_as_mult_i_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            u5_as_mult_i_cma_a(0) <= SIGNED(RESIZE(SIGNED(sIn_5),12));
            u5_as_mult_i_cma_a(1) <= SIGNED(RESIZE(SIGNED(cIn_5),12));
            u5_as_mult_i_cma_c(0) <= SIGNED(RESIZE(SIGNED(qIn_5),16));
            u5_as_mult_i_cma_c(1) <= SIGNED(RESIZE(SIGNED(iIn_5),16));
            u5_as_mult_i_cma_s(0) <= u5_as_mult_i_cma_y(0);
        END IF;
    END PROCESS;
    u5_as_mult_i_cma_s0 <= STD_LOGIC_VECTOR(RESIZE(u5_as_mult_i_cma_s(0),29));
    u5_as_mult_i_cma: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_as_mult_i_cma_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u5_as_mult_i_cma_q <= u5_as_mult_i_cma_s0;
        END IF;
    END PROCESS;

	--u4_as_mult_i_cma(CHAINMULTADD,32)@0
    u4_as_mult_i_cma_p(0) <= u4_as_mult_i_cma_a(0) * u4_as_mult_i_cma_c(0);
    u4_as_mult_i_cma_p(1) <= u4_as_mult_i_cma_a(1) * u4_as_mult_i_cma_c(1);
    u4_as_mult_i_cma_w(0) <= RESIZE(u4_as_mult_i_cma_p(1),29) - RESIZE(u4_as_mult_i_cma_p(0),29);
    u4_as_mult_i_cma_x(0) <= u4_as_mult_i_cma_w(0);
    u4_as_mult_i_cma_y(0) <= u4_as_mult_i_cma_x(0);
    u4_as_mult_i_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_as_mult_i_cma_a <= (others => (others => '0'));
            u4_as_mult_i_cma_c <= (others => (others => '0'));
            u4_as_mult_i_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            u4_as_mult_i_cma_a(0) <= SIGNED(RESIZE(SIGNED(sIn_4),12));
            u4_as_mult_i_cma_a(1) <= SIGNED(RESIZE(SIGNED(cIn_4),12));
            u4_as_mult_i_cma_c(0) <= SIGNED(RESIZE(SIGNED(qIn_4),16));
            u4_as_mult_i_cma_c(1) <= SIGNED(RESIZE(SIGNED(iIn_4),16));
            u4_as_mult_i_cma_s(0) <= u4_as_mult_i_cma_y(0);
        END IF;
    END PROCESS;
    u4_as_mult_i_cma_s0 <= STD_LOGIC_VECTOR(RESIZE(u4_as_mult_i_cma_s(0),29));
    u4_as_mult_i_cma: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_as_mult_i_cma_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u4_as_mult_i_cma_q <= u4_as_mult_i_cma_s0;
        END IF;
    END PROCESS;

	--u3_as_mult_i_cma(CHAINMULTADD,30)@0
    u3_as_mult_i_cma_p(0) <= u3_as_mult_i_cma_a(0) * u3_as_mult_i_cma_c(0);
    u3_as_mult_i_cma_p(1) <= u3_as_mult_i_cma_a(1) * u3_as_mult_i_cma_c(1);
    u3_as_mult_i_cma_w(0) <= RESIZE(u3_as_mult_i_cma_p(1),29) - RESIZE(u3_as_mult_i_cma_p(0),29);
    u3_as_mult_i_cma_x(0) <= u3_as_mult_i_cma_w(0);
    u3_as_mult_i_cma_y(0) <= u3_as_mult_i_cma_x(0);
    u3_as_mult_i_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_as_mult_i_cma_a <= (others => (others => '0'));
            u3_as_mult_i_cma_c <= (others => (others => '0'));
            u3_as_mult_i_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_as_mult_i_cma_a(0) <= SIGNED(RESIZE(SIGNED(sIn_3),12));
            u3_as_mult_i_cma_a(1) <= SIGNED(RESIZE(SIGNED(cIn_3),12));
            u3_as_mult_i_cma_c(0) <= SIGNED(RESIZE(SIGNED(qIn_3),16));
            u3_as_mult_i_cma_c(1) <= SIGNED(RESIZE(SIGNED(iIn_3),16));
            u3_as_mult_i_cma_s(0) <= u3_as_mult_i_cma_y(0);
        END IF;
    END PROCESS;
    u3_as_mult_i_cma_s0 <= STD_LOGIC_VECTOR(RESIZE(u3_as_mult_i_cma_s(0),29));
    u3_as_mult_i_cma: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_as_mult_i_cma_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_as_mult_i_cma_q <= u3_as_mult_i_cma_s0;
        END IF;
    END PROCESS;

	--u2_as_mult_i_cma(CHAINMULTADD,28)@0
    u2_as_mult_i_cma_p(0) <= u2_as_mult_i_cma_a(0) * u2_as_mult_i_cma_c(0);
    u2_as_mult_i_cma_p(1) <= u2_as_mult_i_cma_a(1) * u2_as_mult_i_cma_c(1);
    u2_as_mult_i_cma_w(0) <= RESIZE(u2_as_mult_i_cma_p(1),29) - RESIZE(u2_as_mult_i_cma_p(0),29);
    u2_as_mult_i_cma_x(0) <= u2_as_mult_i_cma_w(0);
    u2_as_mult_i_cma_y(0) <= u2_as_mult_i_cma_x(0);
    u2_as_mult_i_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_as_mult_i_cma_a <= (others => (others => '0'));
            u2_as_mult_i_cma_c <= (others => (others => '0'));
            u2_as_mult_i_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_as_mult_i_cma_a(0) <= SIGNED(RESIZE(SIGNED(sIn_2),12));
            u2_as_mult_i_cma_a(1) <= SIGNED(RESIZE(SIGNED(cIn_2),12));
            u2_as_mult_i_cma_c(0) <= SIGNED(RESIZE(SIGNED(qIn_2),16));
            u2_as_mult_i_cma_c(1) <= SIGNED(RESIZE(SIGNED(iIn_2),16));
            u2_as_mult_i_cma_s(0) <= u2_as_mult_i_cma_y(0);
        END IF;
    END PROCESS;
    u2_as_mult_i_cma_s0 <= STD_LOGIC_VECTOR(RESIZE(u2_as_mult_i_cma_s(0),29));
    u2_as_mult_i_cma: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_as_mult_i_cma_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_as_mult_i_cma_q <= u2_as_mult_i_cma_s0;
        END IF;
    END PROCESS;

	--u1_as_mult_i_cma(CHAINMULTADD,26)@0
    u1_as_mult_i_cma_p(0) <= u1_as_mult_i_cma_a(0) * u1_as_mult_i_cma_c(0);
    u1_as_mult_i_cma_p(1) <= u1_as_mult_i_cma_a(1) * u1_as_mult_i_cma_c(1);
    u1_as_mult_i_cma_w(0) <= RESIZE(u1_as_mult_i_cma_p(1),29) - RESIZE(u1_as_mult_i_cma_p(0),29);
    u1_as_mult_i_cma_x(0) <= u1_as_mult_i_cma_w(0);
    u1_as_mult_i_cma_y(0) <= u1_as_mult_i_cma_x(0);
    u1_as_mult_i_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_as_mult_i_cma_a <= (others => (others => '0'));
            u1_as_mult_i_cma_c <= (others => (others => '0'));
            u1_as_mult_i_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_as_mult_i_cma_a(0) <= SIGNED(RESIZE(SIGNED(sIn_1),12));
            u1_as_mult_i_cma_a(1) <= SIGNED(RESIZE(SIGNED(cIn_1),12));
            u1_as_mult_i_cma_c(0) <= SIGNED(RESIZE(SIGNED(qIn_1),16));
            u1_as_mult_i_cma_c(1) <= SIGNED(RESIZE(SIGNED(iIn_1),16));
            u1_as_mult_i_cma_s(0) <= u1_as_mult_i_cma_y(0);
        END IF;
    END PROCESS;
    u1_as_mult_i_cma_s0 <= STD_LOGIC_VECTOR(RESIZE(u1_as_mult_i_cma_s(0),29));
    u1_as_mult_i_cma: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_as_mult_i_cma_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_as_mult_i_cma_q <= u1_as_mult_i_cma_s0;
        END IF;
    END PROCESS;

	--u0_as_mult_i_cma(CHAINMULTADD,24)@0
    u0_as_mult_i_cma_p(0) <= u0_as_mult_i_cma_a(0) * u0_as_mult_i_cma_c(0);
    u0_as_mult_i_cma_p(1) <= u0_as_mult_i_cma_a(1) * u0_as_mult_i_cma_c(1);
    u0_as_mult_i_cma_w(0) <= RESIZE(u0_as_mult_i_cma_p(1),29) - RESIZE(u0_as_mult_i_cma_p(0),29);
    u0_as_mult_i_cma_x(0) <= u0_as_mult_i_cma_w(0);
    u0_as_mult_i_cma_y(0) <= u0_as_mult_i_cma_x(0);
    u0_as_mult_i_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_as_mult_i_cma_a <= (others => (others => '0'));
            u0_as_mult_i_cma_c <= (others => (others => '0'));
            u0_as_mult_i_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_as_mult_i_cma_a(0) <= SIGNED(RESIZE(SIGNED(sIn_0),12));
            u0_as_mult_i_cma_a(1) <= SIGNED(RESIZE(SIGNED(cIn_0),12));
            u0_as_mult_i_cma_c(0) <= SIGNED(RESIZE(SIGNED(qIn_0),16));
            u0_as_mult_i_cma_c(1) <= SIGNED(RESIZE(SIGNED(iIn_0),16));
            u0_as_mult_i_cma_s(0) <= u0_as_mult_i_cma_y(0);
        END IF;
    END PROCESS;
    u0_as_mult_i_cma_s0 <= STD_LOGIC_VECTOR(RESIZE(u0_as_mult_i_cma_s(0),29));
    u0_as_mult_i_cma: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_as_mult_i_cma_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_as_mult_i_cma_q <= u0_as_mult_i_cma_s0;
        END IF;
    END PROCESS;

	--d_iIn_In_c_3(DELAY,41)@0
    d_iIn_In_c_3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => In_c, xout => d_iIn_In_c_3_q, clk => clk, aclr => areset );

	--d_iIn_In_v_3(DELAY,40)@0
    d_iIn_In_v_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => In_v, xout => d_iIn_In_v_3_q, clk => clk, aclr => areset );

	--iOut(PORTOUT,22)@3
    Out_v <= d_iIn_In_v_3_q;
    Out_c <= d_iIn_In_c_3_q;
    iOut_0 <= u0_as_mult_i_cma_q;
    iOut_1 <= u1_as_mult_i_cma_q;
    iOut_2 <= u2_as_mult_i_cma_q;
    iOut_3 <= u3_as_mult_i_cma_q;
    iOut_4 <= u4_as_mult_i_cma_q;
    iOut_5 <= u5_as_mult_i_cma_q;
    iOut_6 <= u6_as_mult_i_cma_q;
    iOut_7 <= u7_as_mult_i_cma_q;


	--u7_as_mult_q_cma(CHAINMULTADD,39)@0
    u7_as_mult_q_cma_p(0) <= u7_as_mult_q_cma_a(0) * u7_as_mult_q_cma_c(0);
    u7_as_mult_q_cma_p(1) <= u7_as_mult_q_cma_a(1) * u7_as_mult_q_cma_c(1);
    u7_as_mult_q_cma_w(0) <= RESIZE(u7_as_mult_q_cma_p(0),29) + RESIZE(u7_as_mult_q_cma_p(1),29);
    u7_as_mult_q_cma_x(0) <= u7_as_mult_q_cma_w(0);
    u7_as_mult_q_cma_y(0) <= u7_as_mult_q_cma_x(0);
    u7_as_mult_q_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_as_mult_q_cma_a <= (others => (others => '0'));
            u7_as_mult_q_cma_c <= (others => (others => '0'));
            u7_as_mult_q_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            u7_as_mult_q_cma_a(0) <= SIGNED(RESIZE(SIGNED(sIn_7),12));
            u7_as_mult_q_cma_a(1) <= SIGNED(RESIZE(SIGNED(cIn_7),12));
            u7_as_mult_q_cma_c(0) <= SIGNED(RESIZE(SIGNED(iIn_7),16));
            u7_as_mult_q_cma_c(1) <= SIGNED(RESIZE(SIGNED(qIn_7),16));
            u7_as_mult_q_cma_s(0) <= u7_as_mult_q_cma_y(0);
        END IF;
    END PROCESS;
    u7_as_mult_q_cma_s0 <= STD_LOGIC_VECTOR(RESIZE(u7_as_mult_q_cma_s(0),29));
    u7_as_mult_q_cma: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u7_as_mult_q_cma_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u7_as_mult_q_cma_q <= u7_as_mult_q_cma_s0;
        END IF;
    END PROCESS;

	--u6_as_mult_q_cma(CHAINMULTADD,37)@0
    u6_as_mult_q_cma_p(0) <= u6_as_mult_q_cma_a(0) * u6_as_mult_q_cma_c(0);
    u6_as_mult_q_cma_p(1) <= u6_as_mult_q_cma_a(1) * u6_as_mult_q_cma_c(1);
    u6_as_mult_q_cma_w(0) <= RESIZE(u6_as_mult_q_cma_p(0),29) + RESIZE(u6_as_mult_q_cma_p(1),29);
    u6_as_mult_q_cma_x(0) <= u6_as_mult_q_cma_w(0);
    u6_as_mult_q_cma_y(0) <= u6_as_mult_q_cma_x(0);
    u6_as_mult_q_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_as_mult_q_cma_a <= (others => (others => '0'));
            u6_as_mult_q_cma_c <= (others => (others => '0'));
            u6_as_mult_q_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            u6_as_mult_q_cma_a(0) <= SIGNED(RESIZE(SIGNED(sIn_6),12));
            u6_as_mult_q_cma_a(1) <= SIGNED(RESIZE(SIGNED(cIn_6),12));
            u6_as_mult_q_cma_c(0) <= SIGNED(RESIZE(SIGNED(iIn_6),16));
            u6_as_mult_q_cma_c(1) <= SIGNED(RESIZE(SIGNED(qIn_6),16));
            u6_as_mult_q_cma_s(0) <= u6_as_mult_q_cma_y(0);
        END IF;
    END PROCESS;
    u6_as_mult_q_cma_s0 <= STD_LOGIC_VECTOR(RESIZE(u6_as_mult_q_cma_s(0),29));
    u6_as_mult_q_cma: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u6_as_mult_q_cma_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u6_as_mult_q_cma_q <= u6_as_mult_q_cma_s0;
        END IF;
    END PROCESS;

	--u5_as_mult_q_cma(CHAINMULTADD,35)@0
    u5_as_mult_q_cma_p(0) <= u5_as_mult_q_cma_a(0) * u5_as_mult_q_cma_c(0);
    u5_as_mult_q_cma_p(1) <= u5_as_mult_q_cma_a(1) * u5_as_mult_q_cma_c(1);
    u5_as_mult_q_cma_w(0) <= RESIZE(u5_as_mult_q_cma_p(0),29) + RESIZE(u5_as_mult_q_cma_p(1),29);
    u5_as_mult_q_cma_x(0) <= u5_as_mult_q_cma_w(0);
    u5_as_mult_q_cma_y(0) <= u5_as_mult_q_cma_x(0);
    u5_as_mult_q_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_as_mult_q_cma_a <= (others => (others => '0'));
            u5_as_mult_q_cma_c <= (others => (others => '0'));
            u5_as_mult_q_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            u5_as_mult_q_cma_a(0) <= SIGNED(RESIZE(SIGNED(sIn_5),12));
            u5_as_mult_q_cma_a(1) <= SIGNED(RESIZE(SIGNED(cIn_5),12));
            u5_as_mult_q_cma_c(0) <= SIGNED(RESIZE(SIGNED(iIn_5),16));
            u5_as_mult_q_cma_c(1) <= SIGNED(RESIZE(SIGNED(qIn_5),16));
            u5_as_mult_q_cma_s(0) <= u5_as_mult_q_cma_y(0);
        END IF;
    END PROCESS;
    u5_as_mult_q_cma_s0 <= STD_LOGIC_VECTOR(RESIZE(u5_as_mult_q_cma_s(0),29));
    u5_as_mult_q_cma: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u5_as_mult_q_cma_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u5_as_mult_q_cma_q <= u5_as_mult_q_cma_s0;
        END IF;
    END PROCESS;

	--u4_as_mult_q_cma(CHAINMULTADD,33)@0
    u4_as_mult_q_cma_p(0) <= u4_as_mult_q_cma_a(0) * u4_as_mult_q_cma_c(0);
    u4_as_mult_q_cma_p(1) <= u4_as_mult_q_cma_a(1) * u4_as_mult_q_cma_c(1);
    u4_as_mult_q_cma_w(0) <= RESIZE(u4_as_mult_q_cma_p(0),29) + RESIZE(u4_as_mult_q_cma_p(1),29);
    u4_as_mult_q_cma_x(0) <= u4_as_mult_q_cma_w(0);
    u4_as_mult_q_cma_y(0) <= u4_as_mult_q_cma_x(0);
    u4_as_mult_q_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_as_mult_q_cma_a <= (others => (others => '0'));
            u4_as_mult_q_cma_c <= (others => (others => '0'));
            u4_as_mult_q_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            u4_as_mult_q_cma_a(0) <= SIGNED(RESIZE(SIGNED(sIn_4),12));
            u4_as_mult_q_cma_a(1) <= SIGNED(RESIZE(SIGNED(cIn_4),12));
            u4_as_mult_q_cma_c(0) <= SIGNED(RESIZE(SIGNED(iIn_4),16));
            u4_as_mult_q_cma_c(1) <= SIGNED(RESIZE(SIGNED(qIn_4),16));
            u4_as_mult_q_cma_s(0) <= u4_as_mult_q_cma_y(0);
        END IF;
    END PROCESS;
    u4_as_mult_q_cma_s0 <= STD_LOGIC_VECTOR(RESIZE(u4_as_mult_q_cma_s(0),29));
    u4_as_mult_q_cma: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u4_as_mult_q_cma_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u4_as_mult_q_cma_q <= u4_as_mult_q_cma_s0;
        END IF;
    END PROCESS;

	--u3_as_mult_q_cma(CHAINMULTADD,31)@0
    u3_as_mult_q_cma_p(0) <= u3_as_mult_q_cma_a(0) * u3_as_mult_q_cma_c(0);
    u3_as_mult_q_cma_p(1) <= u3_as_mult_q_cma_a(1) * u3_as_mult_q_cma_c(1);
    u3_as_mult_q_cma_w(0) <= RESIZE(u3_as_mult_q_cma_p(0),29) + RESIZE(u3_as_mult_q_cma_p(1),29);
    u3_as_mult_q_cma_x(0) <= u3_as_mult_q_cma_w(0);
    u3_as_mult_q_cma_y(0) <= u3_as_mult_q_cma_x(0);
    u3_as_mult_q_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_as_mult_q_cma_a <= (others => (others => '0'));
            u3_as_mult_q_cma_c <= (others => (others => '0'));
            u3_as_mult_q_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_as_mult_q_cma_a(0) <= SIGNED(RESIZE(SIGNED(sIn_3),12));
            u3_as_mult_q_cma_a(1) <= SIGNED(RESIZE(SIGNED(cIn_3),12));
            u3_as_mult_q_cma_c(0) <= SIGNED(RESIZE(SIGNED(iIn_3),16));
            u3_as_mult_q_cma_c(1) <= SIGNED(RESIZE(SIGNED(qIn_3),16));
            u3_as_mult_q_cma_s(0) <= u3_as_mult_q_cma_y(0);
        END IF;
    END PROCESS;
    u3_as_mult_q_cma_s0 <= STD_LOGIC_VECTOR(RESIZE(u3_as_mult_q_cma_s(0),29));
    u3_as_mult_q_cma: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u3_as_mult_q_cma_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u3_as_mult_q_cma_q <= u3_as_mult_q_cma_s0;
        END IF;
    END PROCESS;

	--u2_as_mult_q_cma(CHAINMULTADD,29)@0
    u2_as_mult_q_cma_p(0) <= u2_as_mult_q_cma_a(0) * u2_as_mult_q_cma_c(0);
    u2_as_mult_q_cma_p(1) <= u2_as_mult_q_cma_a(1) * u2_as_mult_q_cma_c(1);
    u2_as_mult_q_cma_w(0) <= RESIZE(u2_as_mult_q_cma_p(0),29) + RESIZE(u2_as_mult_q_cma_p(1),29);
    u2_as_mult_q_cma_x(0) <= u2_as_mult_q_cma_w(0);
    u2_as_mult_q_cma_y(0) <= u2_as_mult_q_cma_x(0);
    u2_as_mult_q_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_as_mult_q_cma_a <= (others => (others => '0'));
            u2_as_mult_q_cma_c <= (others => (others => '0'));
            u2_as_mult_q_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_as_mult_q_cma_a(0) <= SIGNED(RESIZE(SIGNED(sIn_2),12));
            u2_as_mult_q_cma_a(1) <= SIGNED(RESIZE(SIGNED(cIn_2),12));
            u2_as_mult_q_cma_c(0) <= SIGNED(RESIZE(SIGNED(iIn_2),16));
            u2_as_mult_q_cma_c(1) <= SIGNED(RESIZE(SIGNED(qIn_2),16));
            u2_as_mult_q_cma_s(0) <= u2_as_mult_q_cma_y(0);
        END IF;
    END PROCESS;
    u2_as_mult_q_cma_s0 <= STD_LOGIC_VECTOR(RESIZE(u2_as_mult_q_cma_s(0),29));
    u2_as_mult_q_cma: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u2_as_mult_q_cma_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u2_as_mult_q_cma_q <= u2_as_mult_q_cma_s0;
        END IF;
    END PROCESS;

	--u1_as_mult_q_cma(CHAINMULTADD,27)@0
    u1_as_mult_q_cma_p(0) <= u1_as_mult_q_cma_a(0) * u1_as_mult_q_cma_c(0);
    u1_as_mult_q_cma_p(1) <= u1_as_mult_q_cma_a(1) * u1_as_mult_q_cma_c(1);
    u1_as_mult_q_cma_w(0) <= RESIZE(u1_as_mult_q_cma_p(0),29) + RESIZE(u1_as_mult_q_cma_p(1),29);
    u1_as_mult_q_cma_x(0) <= u1_as_mult_q_cma_w(0);
    u1_as_mult_q_cma_y(0) <= u1_as_mult_q_cma_x(0);
    u1_as_mult_q_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_as_mult_q_cma_a <= (others => (others => '0'));
            u1_as_mult_q_cma_c <= (others => (others => '0'));
            u1_as_mult_q_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_as_mult_q_cma_a(0) <= SIGNED(RESIZE(SIGNED(sIn_1),12));
            u1_as_mult_q_cma_a(1) <= SIGNED(RESIZE(SIGNED(cIn_1),12));
            u1_as_mult_q_cma_c(0) <= SIGNED(RESIZE(SIGNED(iIn_1),16));
            u1_as_mult_q_cma_c(1) <= SIGNED(RESIZE(SIGNED(qIn_1),16));
            u1_as_mult_q_cma_s(0) <= u1_as_mult_q_cma_y(0);
        END IF;
    END PROCESS;
    u1_as_mult_q_cma_s0 <= STD_LOGIC_VECTOR(RESIZE(u1_as_mult_q_cma_s(0),29));
    u1_as_mult_q_cma: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_as_mult_q_cma_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u1_as_mult_q_cma_q <= u1_as_mult_q_cma_s0;
        END IF;
    END PROCESS;

	--u0_as_mult_q_cma(CHAINMULTADD,25)@0
    u0_as_mult_q_cma_p(0) <= u0_as_mult_q_cma_a(0) * u0_as_mult_q_cma_c(0);
    u0_as_mult_q_cma_p(1) <= u0_as_mult_q_cma_a(1) * u0_as_mult_q_cma_c(1);
    u0_as_mult_q_cma_w(0) <= RESIZE(u0_as_mult_q_cma_p(0),29) + RESIZE(u0_as_mult_q_cma_p(1),29);
    u0_as_mult_q_cma_x(0) <= u0_as_mult_q_cma_w(0);
    u0_as_mult_q_cma_y(0) <= u0_as_mult_q_cma_x(0);
    u0_as_mult_q_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_as_mult_q_cma_a <= (others => (others => '0'));
            u0_as_mult_q_cma_c <= (others => (others => '0'));
            u0_as_mult_q_cma_s <= (others => (others => '0'));
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_as_mult_q_cma_a(0) <= SIGNED(RESIZE(SIGNED(sIn_0),12));
            u0_as_mult_q_cma_a(1) <= SIGNED(RESIZE(SIGNED(cIn_0),12));
            u0_as_mult_q_cma_c(0) <= SIGNED(RESIZE(SIGNED(iIn_0),16));
            u0_as_mult_q_cma_c(1) <= SIGNED(RESIZE(SIGNED(qIn_0),16));
            u0_as_mult_q_cma_s(0) <= u0_as_mult_q_cma_y(0);
        END IF;
    END PROCESS;
    u0_as_mult_q_cma_s0 <= STD_LOGIC_VECTOR(RESIZE(u0_as_mult_q_cma_s(0),29));
    u0_as_mult_q_cma: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_as_mult_q_cma_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            u0_as_mult_q_cma_q <= u0_as_mult_q_cma_s0;
        END IF;
    END PROCESS;

	--qOut(PORTOUT,23)@3
    qOut_0 <= u0_as_mult_q_cma_q;
    qOut_1 <= u1_as_mult_q_cma_q;
    qOut_2 <= u2_as_mult_q_cma_q;
    qOut_3 <= u3_as_mult_q_cma_q;
    qOut_4 <= u4_as_mult_q_cma_q;
    qOut_5 <= u5_as_mult_q_cma_q;
    qOut_6 <= u6_as_mult_q_cma_q;
    qOut_7 <= u7_as_mult_q_cma_q;


end normal;
