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

-- VHDL created from DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2
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
entity DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2 is
    port (
        In1_s : in std_logic_vector(11 downto 0);
        In2_s : in std_logic_vector(0 downto 0);
        In3_s : in std_logic_vector(7 downto 0);
        Out1_0re : out std_logic_vector(15 downto 0);
        Out1_0im : out std_logic_vector(15 downto 0);
        Out1_1re : out std_logic_vector(15 downto 0);
        Out1_1im : out std_logic_vector(15 downto 0);
        Out1_2re : out std_logic_vector(15 downto 0);
        Out1_2im : out std_logic_vector(15 downto 0);
        Out1_3re : out std_logic_vector(15 downto 0);
        Out1_3im : out std_logic_vector(15 downto 0);
        Out1_4re : out std_logic_vector(15 downto 0);
        Out1_4im : out std_logic_vector(15 downto 0);
        Out1_5re : out std_logic_vector(15 downto 0);
        Out1_5im : out std_logic_vector(15 downto 0);
        Out1_6re : out std_logic_vector(15 downto 0);
        Out1_6im : out std_logic_vector(15 downto 0);
        Out1_7re : out std_logic_vector(15 downto 0);
        Out1_7im : out std_logic_vector(15 downto 0);
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
        busOut_v : out std_logic_vector(0 downto 0);
        busOut_r : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
end;

architecture normal of DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  band0_a_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_0, width=29, real=0
--  band0_a_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_1, width=29, real=0
--  band0_a_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_2, width=29, real=0
--  band0_a_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_3, width=29, real=0
--  band0_a_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_4, width=29, real=0
--  band0_a_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_5, width=29, real=0
--  band0_a_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_6, width=29, real=0
--  band0_a_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_7, width=29, real=0
--  band1_a_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_0, width=29, real=0
--  band1_a_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_1, width=29, real=0
--  band1_a_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_2, width=29, real=0
--  band1_a_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_3, width=29, real=0
--  band1_a_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_4, width=29, real=0
--  band1_a_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_5, width=29, real=0
--  band1_a_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_6, width=29, real=0
--  band1_a_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_7, width=29, real=0
--  band0_b_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_0, width=29, real=0
--  band0_b_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_1, width=29, real=0
--  band0_b_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_2, width=29, real=0
--  band0_b_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_3, width=29, real=0
--  band0_b_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_4, width=29, real=0
--  band0_b_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_5, width=29, real=0
--  band0_b_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_6, width=29, real=0
--  band0_b_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_7, width=29, real=0
--  band1_b_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_0, width=29, real=0
--  band1_b_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_1, width=29, real=0
--  band1_b_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_2, width=29, real=0
--  band1_b_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_3, width=29, real=0
--  band1_b_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_4, width=29, real=0
--  band1_b_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_5, width=29, real=0
--  band1_b_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_6, width=29, real=0
--  band1_b_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_7, width=29, real=0
--  vin_s <= VCC_q, width=1, real=0
--  cin_s <= Const107_q, width=8, real=0
-- outputs
--  N/C
--  N/C
--  a_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_0, width=30, real=0
--  a_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_1, width=30, real=0
--  a_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_2, width=30, real=0
--  a_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_3, width=30, real=0
--  a_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_4, width=30, real=0
--  a_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_5, width=30, real=0
--  a_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_6, width=30, real=0
--  a_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_7, width=30, real=0
--  b_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_0, width=30, real=0
--  b_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_1, width=30, real=0
--  b_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_2, width=30, real=0
--  b_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_3, width=30, real=0
--  b_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_4, width=30, real=0
--  b_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_5, width=30, real=0
--  b_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_6, width=30, real=0
--  b_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_7, width=30, real=0
--  vout_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_vout_s, width=1, real=0
--  cout_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_cout_s, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1 is
        port (
        band0_a_0 : in std_logic_vector(28 downto 0);
        band0_a_1 : in std_logic_vector(28 downto 0);
        band0_a_2 : in std_logic_vector(28 downto 0);
        band0_a_3 : in std_logic_vector(28 downto 0);
        band0_a_4 : in std_logic_vector(28 downto 0);
        band0_a_5 : in std_logic_vector(28 downto 0);
        band0_a_6 : in std_logic_vector(28 downto 0);
        band0_a_7 : in std_logic_vector(28 downto 0);
        band1_a_0 : in std_logic_vector(28 downto 0);
        band1_a_1 : in std_logic_vector(28 downto 0);
        band1_a_2 : in std_logic_vector(28 downto 0);
        band1_a_3 : in std_logic_vector(28 downto 0);
        band1_a_4 : in std_logic_vector(28 downto 0);
        band1_a_5 : in std_logic_vector(28 downto 0);
        band1_a_6 : in std_logic_vector(28 downto 0);
        band1_a_7 : in std_logic_vector(28 downto 0);
        band0_b_0 : in std_logic_vector(28 downto 0);
        band0_b_1 : in std_logic_vector(28 downto 0);
        band0_b_2 : in std_logic_vector(28 downto 0);
        band0_b_3 : in std_logic_vector(28 downto 0);
        band0_b_4 : in std_logic_vector(28 downto 0);
        band0_b_5 : in std_logic_vector(28 downto 0);
        band0_b_6 : in std_logic_vector(28 downto 0);
        band0_b_7 : in std_logic_vector(28 downto 0);
        band1_b_0 : in std_logic_vector(28 downto 0);
        band1_b_1 : in std_logic_vector(28 downto 0);
        band1_b_2 : in std_logic_vector(28 downto 0);
        band1_b_3 : in std_logic_vector(28 downto 0);
        band1_b_4 : in std_logic_vector(28 downto 0);
        band1_b_5 : in std_logic_vector(28 downto 0);
        band1_b_6 : in std_logic_vector(28 downto 0);
        band1_b_7 : in std_logic_vector(28 downto 0);
        vin_s : in std_logic_vector(0 downto 0);
        cin_s : in std_logic_vector(7 downto 0);
        a_0 : out std_logic_vector(29 downto 0);
        a_1 : out std_logic_vector(29 downto 0);
        a_2 : out std_logic_vector(29 downto 0);
        a_3 : out std_logic_vector(29 downto 0);
        a_4 : out std_logic_vector(29 downto 0);
        a_5 : out std_logic_vector(29 downto 0);
        a_6 : out std_logic_vector(29 downto 0);
        a_7 : out std_logic_vector(29 downto 0);
        b_0 : out std_logic_vector(29 downto 0);
        b_1 : out std_logic_vector(29 downto 0);
        b_2 : out std_logic_vector(29 downto 0);
        b_3 : out std_logic_vector(29 downto 0);
        b_4 : out std_logic_vector(29 downto 0);
        b_5 : out std_logic_vector(29 downto 0);
        b_6 : out std_logic_vector(29 downto 0);
        b_7 : out std_logic_vector(29 downto 0);
        vout_s : out std_logic_vector(0 downto 0);
        cout_s : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  i1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_iOut_0, width=33, real=0
--  i2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_iOut_1, width=33, real=0
--  vin <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_Out_v, width=1, real=0
--  cin <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_Out_c, width=8, real=0
-- outputs
--  N/C
--  N/C
--  iout1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_iout1, width=35, real=0
--  iout2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_iout2, width=35, real=0
--  vout => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_vout, width=1, real=0
--  cout => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_cout, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3 is
        port (
        i1 : in std_logic_vector(32 downto 0);
        i2 : in std_logic_vector(32 downto 0);
        vin : in std_logic_vector(0 downto 0);
        cin : in std_logic_vector(7 downto 0);
        iout1 : out std_logic_vector(34 downto 0);
        iout2 : out std_logic_vector(34 downto 0);
        vout : out std_logic_vector(0 downto 0);
        cout : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  i1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_qOut_0, width=33, real=0
--  i2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_qOut_1, width=33, real=0
--  vin <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_Out_v, width=1, real=0
--  cin <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_Out_c, width=8, real=0
-- outputs
--  N/C
--  N/C
--  iout1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_iout1, width=35, real=0
--  iout2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_iout2, width=35, real=0
--  vout => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_vout, width=1, real=0
--  cout => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_cout, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3 is
        port (
        i1 : in std_logic_vector(32 downto 0);
        i2 : in std_logic_vector(32 downto 0);
        vin : in std_logic_vector(0 downto 0);
        cin : in std_logic_vector(7 downto 0);
        iout1 : out std_logic_vector(34 downto 0);
        iout2 : out std_logic_vector(34 downto 0);
        vout : out std_logic_vector(0 downto 0);
        cout : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_qout, width=35, real=0
--  xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_vout, width=1, real=0
--  xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_cout, width=8, real=0
--  gain_i <= GND_q, width=1, real=0
-- outputs
--  N/C
--  N/C
--  qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_qOut_0, width=16, real=0
--  qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_qOut_v, width=1, real=0
--  qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_qOut_c, width=8, real=0
--  eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_eOut_0, width=1, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3 is
        port (
        xIn_0 : in std_logic_vector(34 downto 0);
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        gain_i : in std_logic_vector(0 downto 0);
        qOut_0 : out std_logic_vector(15 downto 0);
        qOut_v : out std_logic_vector(0 downto 0);
        qOut_c : out std_logic_vector(7 downto 0);
        eOut_0 : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= In1_s, width=12, real=0
--  xIn_v <= In2_s, width=1, real=0
--  xIn_c <= In3_s, width=8, real=0
-- outputs
--  N/C
--  N/C
--  xOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xOut_0, width=31, real=0
--  xOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xOut_1, width=31, real=0
--  xOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xOut_v, width=1, real=0
--  xOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xOut_c, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17 is
        port (
        xIn_0 : in std_logic_vector(11 downto 0);
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        xOut_0 : out std_logic_vector(30 downto 0);
        xOut_1 : out std_logic_vector(30 downto 0);
        xOut_v : out std_logic_vector(0 downto 0);
        xOut_c : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_qOut_0, width=16, real=0
--  xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_qOut_1, width=16, real=0
--  xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_qOut_v, width=1, real=0
--  xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_qOut_c, width=8, real=0
-- outputs
--  N/C
--  N/C
--  xOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_0, width=35, real=0
--  xOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_1, width=35, real=0
--  xOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_2, width=35, real=0
--  xOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_3, width=35, real=0
--  xOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_v, width=1, real=0
--  xOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_c, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18 is
        port (
        xIn_0 : in std_logic_vector(15 downto 0);
        xIn_1 : in std_logic_vector(15 downto 0);
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        xOut_0 : out std_logic_vector(34 downto 0);
        xOut_1 : out std_logic_vector(34 downto 0);
        xOut_2 : out std_logic_vector(34 downto 0);
        xOut_3 : out std_logic_vector(34 downto 0);
        xOut_v : out std_logic_vector(0 downto 0);
        xOut_c : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_qOut_0, width=16, real=0
--  xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_qOut_v, width=1, real=0
--  xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_qOut_c, width=8, real=0
-- outputs
--  N/C
--  N/C
--  xOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xOut_0, width=35, real=0
--  xOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xOut_1, width=35, real=0
--  xOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xOut_v, width=1, real=0
--  xOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xOut_c, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19 is
        port (
        xIn_0 : in std_logic_vector(15 downto 0);
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        xOut_0 : out std_logic_vector(34 downto 0);
        xOut_1 : out std_logic_vector(34 downto 0);
        xOut_v : out std_logic_vector(0 downto 0);
        xOut_c : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_qOut_0, width=16, real=0
--  xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_qOut_1, width=16, real=0
--  xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_qOut_v, width=1, real=0
--  xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_qOut_c, width=8, real=0
-- outputs
--  N/C
--  N/C
--  xOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_0, width=35, real=0
--  xOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_1, width=35, real=0
--  xOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_2, width=35, real=0
--  xOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_3, width=35, real=0
--  xOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_v, width=1, real=0
--  xOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_c, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20 is
        port (
        xIn_0 : in std_logic_vector(15 downto 0);
        xIn_1 : in std_logic_vector(15 downto 0);
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        xOut_0 : out std_logic_vector(34 downto 0);
        xOut_1 : out std_logic_vector(34 downto 0);
        xOut_2 : out std_logic_vector(34 downto 0);
        xOut_3 : out std_logic_vector(34 downto 0);
        xOut_v : out std_logic_vector(0 downto 0);
        xOut_c : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_0, width=16, real=0
--  xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_1, width=16, real=0
--  xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_2, width=16, real=0
--  xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_3, width=16, real=0
--  xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_v, width=1, real=0
--  xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_c, width=8, real=0
-- outputs
--  N/C
--  N/C
--  xOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_0, width=34, real=0
--  xOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_1, width=34, real=0
--  xOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_2, width=34, real=0
--  xOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_3, width=34, real=0
--  xOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_4, width=34, real=0
--  xOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_5, width=34, real=0
--  xOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_6, width=34, real=0
--  xOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_7, width=34, real=0
--  xOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_v, width=1, real=0
--  xOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_c, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21 is
        port (
        xIn_0 : in std_logic_vector(15 downto 0);
        xIn_1 : in std_logic_vector(15 downto 0);
        xIn_2 : in std_logic_vector(15 downto 0);
        xIn_3 : in std_logic_vector(15 downto 0);
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        xOut_0 : out std_logic_vector(33 downto 0);
        xOut_1 : out std_logic_vector(33 downto 0);
        xOut_2 : out std_logic_vector(33 downto 0);
        xOut_3 : out std_logic_vector(33 downto 0);
        xOut_4 : out std_logic_vector(33 downto 0);
        xOut_5 : out std_logic_vector(33 downto 0);
        xOut_6 : out std_logic_vector(33 downto 0);
        xOut_7 : out std_logic_vector(33 downto 0);
        xOut_v : out std_logic_vector(0 downto 0);
        xOut_c : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_0, width=16, real=0
--  xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_1, width=16, real=0
--  xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_2, width=16, real=0
--  xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_3, width=16, real=0
--  xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_4, width=16, real=0
--  xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_5, width=16, real=0
--  xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_6, width=16, real=0
--  xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_7, width=16, real=0
--  xIn_v <= VCC_q, width=1, real=0
--  xIn_c <= Const107_q, width=8, real=0
-- outputs
--  N/C
--  N/C
--  xOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_0, width=34, real=0
--  xOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_1, width=34, real=0
--  xOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_2, width=34, real=0
--  xOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_3, width=34, real=0
--  xOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_4, width=34, real=0
--  xOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_5, width=34, real=0
--  xOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_6, width=34, real=0
--  xOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_7, width=34, real=0
--  xOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_8, width=34, real=0
--  xOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_9, width=34, real=0
--  xOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_10, width=34, real=0
--  xOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_11, width=34, real=0
--  xOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_12, width=34, real=0
--  xOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_13, width=34, real=0
--  xOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_14, width=34, real=0
--  xOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_15, width=34, real=0
--  xOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_v, width=1, real=0
--  xOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_c, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22 is
        port (
        xIn_0 : in std_logic_vector(15 downto 0);
        xIn_1 : in std_logic_vector(15 downto 0);
        xIn_2 : in std_logic_vector(15 downto 0);
        xIn_3 : in std_logic_vector(15 downto 0);
        xIn_4 : in std_logic_vector(15 downto 0);
        xIn_5 : in std_logic_vector(15 downto 0);
        xIn_6 : in std_logic_vector(15 downto 0);
        xIn_7 : in std_logic_vector(15 downto 0);
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
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
        xOut_v : out std_logic_vector(0 downto 0);
        xOut_c : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_0, width=16, real=0
--  xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_1, width=16, real=0
--  xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_2, width=16, real=0
--  xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_3, width=16, real=0
--  xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_4, width=16, real=0
--  xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_5, width=16, real=0
--  xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_6, width=16, real=0
--  xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_7, width=16, real=0
--  xIn_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_8, width=16, real=0
--  xIn_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_9, width=16, real=0
--  xIn_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_10, width=16, real=0
--  xIn_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_11, width=16, real=0
--  xIn_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_12, width=16, real=0
--  xIn_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_13, width=16, real=0
--  xIn_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_14, width=16, real=0
--  xIn_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_15, width=16, real=0
--  xIn_v <= VCC_q, width=1, real=0
--  xIn_c <= Const107_q, width=8, real=0
-- outputs
--  N/C
--  N/C
--  xOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_0, width=34, real=0
--  xOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_1, width=34, real=0
--  xOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_2, width=34, real=0
--  xOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_3, width=34, real=0
--  xOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_4, width=34, real=0
--  xOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_5, width=34, real=0
--  xOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_6, width=34, real=0
--  xOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_7, width=34, real=0
--  xOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_8, width=34, real=0
--  xOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_9, width=34, real=0
--  xOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_10, width=34, real=0
--  xOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_11, width=34, real=0
--  xOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_12, width=34, real=0
--  xOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_13, width=34, real=0
--  xOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_14, width=34, real=0
--  xOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_15, width=34, real=0
--  xOut_16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_16, width=34, real=0
--  xOut_17 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_17, width=34, real=0
--  xOut_18 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_18, width=34, real=0
--  xOut_19 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_19, width=34, real=0
--  xOut_20 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_20, width=34, real=0
--  xOut_21 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_21, width=34, real=0
--  xOut_22 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_22, width=34, real=0
--  xOut_23 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_23, width=34, real=0
--  xOut_24 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_24, width=34, real=0
--  xOut_25 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_25, width=34, real=0
--  xOut_26 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_26, width=34, real=0
--  xOut_27 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_27, width=34, real=0
--  xOut_28 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_28, width=34, real=0
--  xOut_29 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_29, width=34, real=0
--  xOut_30 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_30, width=34, real=0
--  xOut_31 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_31, width=34, real=0
--  xOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_v, width=1, real=0
--  xOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_c, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23 is
        port (
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
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
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
        xOut_v : out std_logic_vector(0 downto 0);
        xOut_c : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_0, width=16, real=0
--  xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_1, width=16, real=0
--  xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_2, width=16, real=0
--  xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_3, width=16, real=0
--  xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_4, width=16, real=0
--  xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_5, width=16, real=0
--  xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_6, width=16, real=0
--  xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_7, width=16, real=0
--  xIn_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_16, width=16, real=0
--  xIn_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_17, width=16, real=0
--  xIn_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_18, width=16, real=0
--  xIn_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_19, width=16, real=0
--  xIn_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_20, width=16, real=0
--  xIn_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_21, width=16, real=0
--  xIn_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_22, width=16, real=0
--  xIn_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_23, width=16, real=0
--  xIn_v <= VCC_q, width=1, real=0
--  xIn_c <= Const107_q, width=8, real=0
-- outputs
--  N/C
--  N/C
--  xOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_0, width=34, real=0
--  xOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_1, width=34, real=0
--  xOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_2, width=34, real=0
--  xOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_3, width=34, real=0
--  xOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_4, width=34, real=0
--  xOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_5, width=34, real=0
--  xOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_6, width=34, real=0
--  xOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_7, width=34, real=0
--  xOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_8, width=34, real=0
--  xOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_9, width=34, real=0
--  xOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_10, width=34, real=0
--  xOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_11, width=34, real=0
--  xOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_12, width=34, real=0
--  xOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_13, width=34, real=0
--  xOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_14, width=34, real=0
--  xOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_15, width=34, real=0
--  xOut_16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_16, width=34, real=0
--  xOut_17 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_17, width=34, real=0
--  xOut_18 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_18, width=34, real=0
--  xOut_19 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_19, width=34, real=0
--  xOut_20 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_20, width=34, real=0
--  xOut_21 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_21, width=34, real=0
--  xOut_22 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_22, width=34, real=0
--  xOut_23 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_23, width=34, real=0
--  xOut_24 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_24, width=34, real=0
--  xOut_25 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_25, width=34, real=0
--  xOut_26 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_26, width=34, real=0
--  xOut_27 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_27, width=34, real=0
--  xOut_28 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_28, width=34, real=0
--  xOut_29 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_29, width=34, real=0
--  xOut_30 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_30, width=34, real=0
--  xOut_31 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_31, width=34, real=0
--  xOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_v, width=1, real=0
--  xOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_c, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24 is
        port (
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
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
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
        xOut_v : out std_logic_vector(0 downto 0);
        xOut_c : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xOut_0, width=31, real=0
--  xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xOut_1, width=31, real=0
--  xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xOut_v, width=1, real=0
--  xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xOut_c, width=8, real=0
--  gain_i <= GND_q, width=1, real=0
-- outputs
--  N/C
--  N/C
--  qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_qOut_0, width=16, real=0
--  qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_qOut_1, width=16, real=0
--  qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_qOut_v, width=1, real=0
--  qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_qOut_c, width=8, real=0
--  eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_eOut_0, width=1, real=0
--  eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_eOut_1, width=1, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2 is
        port (
        xIn_0 : in std_logic_vector(30 downto 0);
        xIn_1 : in std_logic_vector(30 downto 0);
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        gain_i : in std_logic_vector(0 downto 0);
        qOut_0 : out std_logic_vector(15 downto 0);
        qOut_1 : out std_logic_vector(15 downto 0);
        qOut_v : out std_logic_vector(0 downto 0);
        qOut_c : out std_logic_vector(7 downto 0);
        eOut_0 : out std_logic_vector(0 downto 0);
        eOut_1 : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_0, width=35, real=0
--  xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_1, width=35, real=0
--  xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_2, width=35, real=0
--  xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_3, width=35, real=0
--  xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_v, width=1, real=0
--  xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_c, width=8, real=0
--  gain_i <= GND_q, width=1, real=0
-- outputs
--  N/C
--  N/C
--  qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_0, width=16, real=0
--  qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_1, width=16, real=0
--  qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_2, width=16, real=0
--  qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_3, width=16, real=0
--  qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_v, width=1, real=0
--  qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_c, width=8, real=0
--  eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_eOut_0, width=1, real=0
--  eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_eOut_1, width=1, real=0
--  eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_eOut_2, width=1, real=0
--  eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_eOut_3, width=1, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2 is
        port (
        xIn_0 : in std_logic_vector(34 downto 0);
        xIn_1 : in std_logic_vector(34 downto 0);
        xIn_2 : in std_logic_vector(34 downto 0);
        xIn_3 : in std_logic_vector(34 downto 0);
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        gain_i : in std_logic_vector(0 downto 0);
        qOut_0 : out std_logic_vector(15 downto 0);
        qOut_1 : out std_logic_vector(15 downto 0);
        qOut_2 : out std_logic_vector(15 downto 0);
        qOut_3 : out std_logic_vector(15 downto 0);
        qOut_v : out std_logic_vector(0 downto 0);
        qOut_c : out std_logic_vector(7 downto 0);
        eOut_0 : out std_logic_vector(0 downto 0);
        eOut_1 : out std_logic_vector(0 downto 0);
        eOut_2 : out std_logic_vector(0 downto 0);
        eOut_3 : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xOut_0, width=35, real=0
--  xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xOut_1, width=35, real=0
--  xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xOut_v, width=1, real=0
--  xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xOut_c, width=8, real=0
--  gain_i <= GND_q, width=1, real=0
-- outputs
--  N/C
--  N/C
--  qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_qOut_0, width=16, real=0
--  qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_qOut_1, width=16, real=0
--  qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_qOut_v, width=1, real=0
--  qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_qOut_c, width=8, real=0
--  eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_eOut_0, width=1, real=0
--  eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_eOut_1, width=1, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2 is
        port (
        xIn_0 : in std_logic_vector(34 downto 0);
        xIn_1 : in std_logic_vector(34 downto 0);
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        gain_i : in std_logic_vector(0 downto 0);
        qOut_0 : out std_logic_vector(15 downto 0);
        qOut_1 : out std_logic_vector(15 downto 0);
        qOut_v : out std_logic_vector(0 downto 0);
        qOut_c : out std_logic_vector(7 downto 0);
        eOut_0 : out std_logic_vector(0 downto 0);
        eOut_1 : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_0, width=35, real=0
--  xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_1, width=35, real=0
--  xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_2, width=35, real=0
--  xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_3, width=35, real=0
--  xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_v, width=1, real=0
--  xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_c, width=8, real=0
--  gain_i <= GND_q, width=1, real=0
-- outputs
--  N/C
--  N/C
--  qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_0, width=16, real=0
--  qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_1, width=16, real=0
--  qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_2, width=16, real=0
--  qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_3, width=16, real=0
--  qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_v, width=1, real=0
--  qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_c, width=8, real=0
--  eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_eOut_0, width=1, real=0
--  eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_eOut_1, width=1, real=0
--  eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_eOut_2, width=1, real=0
--  eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_eOut_3, width=1, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2 is
        port (
        xIn_0 : in std_logic_vector(34 downto 0);
        xIn_1 : in std_logic_vector(34 downto 0);
        xIn_2 : in std_logic_vector(34 downto 0);
        xIn_3 : in std_logic_vector(34 downto 0);
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        gain_i : in std_logic_vector(0 downto 0);
        qOut_0 : out std_logic_vector(15 downto 0);
        qOut_1 : out std_logic_vector(15 downto 0);
        qOut_2 : out std_logic_vector(15 downto 0);
        qOut_3 : out std_logic_vector(15 downto 0);
        qOut_v : out std_logic_vector(0 downto 0);
        qOut_c : out std_logic_vector(7 downto 0);
        eOut_0 : out std_logic_vector(0 downto 0);
        eOut_1 : out std_logic_vector(0 downto 0);
        eOut_2 : out std_logic_vector(0 downto 0);
        eOut_3 : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_0, width=34, real=0
--  xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_1, width=34, real=0
--  xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_2, width=34, real=0
--  xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_3, width=34, real=0
--  xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_4, width=34, real=0
--  xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_5, width=34, real=0
--  xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_6, width=34, real=0
--  xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_7, width=34, real=0
--  xIn_v <= VCC_q, width=1, real=0
--  xIn_c <= Const107_q, width=8, real=0
--  gain_i <= GND_q, width=1, real=0
-- outputs
--  N/C
--  N/C
--  qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_0, width=16, real=0
--  qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_1, width=16, real=0
--  qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_2, width=16, real=0
--  qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_3, width=16, real=0
--  qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_4, width=16, real=0
--  qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_5, width=16, real=0
--  qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_6, width=16, real=0
--  qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_7, width=16, real=0
--  qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_v, width=1, real=0
--  qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_c, width=8, real=0
--  eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_0, width=1, real=0
--  eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_1, width=1, real=0
--  eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_2, width=1, real=0
--  eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_3, width=1, real=0
--  eOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_4, width=1, real=0
--  eOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_5, width=1, real=0
--  eOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_6, width=1, real=0
--  eOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_7, width=1, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2 is
        port (
        xIn_0 : in std_logic_vector(33 downto 0);
        xIn_1 : in std_logic_vector(33 downto 0);
        xIn_2 : in std_logic_vector(33 downto 0);
        xIn_3 : in std_logic_vector(33 downto 0);
        xIn_4 : in std_logic_vector(33 downto 0);
        xIn_5 : in std_logic_vector(33 downto 0);
        xIn_6 : in std_logic_vector(33 downto 0);
        xIn_7 : in std_logic_vector(33 downto 0);
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        gain_i : in std_logic_vector(0 downto 0);
        qOut_0 : out std_logic_vector(15 downto 0);
        qOut_1 : out std_logic_vector(15 downto 0);
        qOut_2 : out std_logic_vector(15 downto 0);
        qOut_3 : out std_logic_vector(15 downto 0);
        qOut_4 : out std_logic_vector(15 downto 0);
        qOut_5 : out std_logic_vector(15 downto 0);
        qOut_6 : out std_logic_vector(15 downto 0);
        qOut_7 : out std_logic_vector(15 downto 0);
        qOut_v : out std_logic_vector(0 downto 0);
        qOut_c : out std_logic_vector(7 downto 0);
        eOut_0 : out std_logic_vector(0 downto 0);
        eOut_1 : out std_logic_vector(0 downto 0);
        eOut_2 : out std_logic_vector(0 downto 0);
        eOut_3 : out std_logic_vector(0 downto 0);
        eOut_4 : out std_logic_vector(0 downto 0);
        eOut_5 : out std_logic_vector(0 downto 0);
        eOut_6 : out std_logic_vector(0 downto 0);
        eOut_7 : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_0, width=30, real=0
--  xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_1, width=30, real=0
--  xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_2, width=30, real=0
--  xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_3, width=30, real=0
--  xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_4, width=30, real=0
--  xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_5, width=30, real=0
--  xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_6, width=30, real=0
--  xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_7, width=30, real=0
--  xIn_v <= VCC_q, width=1, real=0
--  xIn_c <= Const107_q, width=8, real=0
--  gain_i <= GND_q, width=1, real=0
-- outputs
--  N/C
--  N/C
--  qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_0, width=16, real=0
--  qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_1, width=16, real=0
--  qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_2, width=16, real=0
--  qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_3, width=16, real=0
--  qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_4, width=16, real=0
--  qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_5, width=16, real=0
--  qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_6, width=16, real=0
--  qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_7, width=16, real=0
--  qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_v, width=1, real=0
--  qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_c, width=8, real=0
--  eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_0, width=1, real=0
--  eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_1, width=1, real=0
--  eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_2, width=1, real=0
--  eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_3, width=1, real=0
--  eOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_4, width=1, real=0
--  eOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_5, width=1, real=0
--  eOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_6, width=1, real=0
--  eOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_7, width=1, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1 is
        port (
        xIn_0 : in std_logic_vector(29 downto 0);
        xIn_1 : in std_logic_vector(29 downto 0);
        xIn_2 : in std_logic_vector(29 downto 0);
        xIn_3 : in std_logic_vector(29 downto 0);
        xIn_4 : in std_logic_vector(29 downto 0);
        xIn_5 : in std_logic_vector(29 downto 0);
        xIn_6 : in std_logic_vector(29 downto 0);
        xIn_7 : in std_logic_vector(29 downto 0);
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        gain_i : in std_logic_vector(0 downto 0);
        qOut_0 : out std_logic_vector(15 downto 0);
        qOut_1 : out std_logic_vector(15 downto 0);
        qOut_2 : out std_logic_vector(15 downto 0);
        qOut_3 : out std_logic_vector(15 downto 0);
        qOut_4 : out std_logic_vector(15 downto 0);
        qOut_5 : out std_logic_vector(15 downto 0);
        qOut_6 : out std_logic_vector(15 downto 0);
        qOut_7 : out std_logic_vector(15 downto 0);
        qOut_v : out std_logic_vector(0 downto 0);
        qOut_c : out std_logic_vector(7 downto 0);
        eOut_0 : out std_logic_vector(0 downto 0);
        eOut_1 : out std_logic_vector(0 downto 0);
        eOut_2 : out std_logic_vector(0 downto 0);
        eOut_3 : out std_logic_vector(0 downto 0);
        eOut_4 : out std_logic_vector(0 downto 0);
        eOut_5 : out std_logic_vector(0 downto 0);
        eOut_6 : out std_logic_vector(0 downto 0);
        eOut_7 : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_0, width=34, real=0
--  xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_1, width=34, real=0
--  xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_2, width=34, real=0
--  xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_3, width=34, real=0
--  xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_4, width=34, real=0
--  xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_5, width=34, real=0
--  xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_6, width=34, real=0
--  xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_7, width=34, real=0
--  xIn_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_8, width=34, real=0
--  xIn_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_9, width=34, real=0
--  xIn_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_10, width=34, real=0
--  xIn_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_11, width=34, real=0
--  xIn_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_12, width=34, real=0
--  xIn_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_13, width=34, real=0
--  xIn_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_14, width=34, real=0
--  xIn_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_15, width=34, real=0
--  xIn_v <= VCC_q, width=1, real=0
--  xIn_c <= Const107_q, width=8, real=0
--  gain_i <= GND_q, width=1, real=0
-- outputs
--  N/C
--  N/C
--  qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_0, width=16, real=0
--  qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_1, width=16, real=0
--  qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_2, width=16, real=0
--  qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_3, width=16, real=0
--  qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_4, width=16, real=0
--  qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_5, width=16, real=0
--  qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_6, width=16, real=0
--  qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_7, width=16, real=0
--  qOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_8, width=16, real=0
--  qOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_9, width=16, real=0
--  qOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_10, width=16, real=0
--  qOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_11, width=16, real=0
--  qOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_12, width=16, real=0
--  qOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_13, width=16, real=0
--  qOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_14, width=16, real=0
--  qOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_15, width=16, real=0
--  qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_v, width=1, real=0
--  qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_c, width=8, real=0
--  eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_0, width=1, real=0
--  eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_1, width=1, real=0
--  eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_2, width=1, real=0
--  eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_3, width=1, real=0
--  eOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_4, width=1, real=0
--  eOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_5, width=1, real=0
--  eOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_6, width=1, real=0
--  eOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_7, width=1, real=0
--  eOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_8, width=1, real=0
--  eOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_9, width=1, real=0
--  eOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_10, width=1, real=0
--  eOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_11, width=1, real=0
--  eOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_12, width=1, real=0
--  eOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_13, width=1, real=0
--  eOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_14, width=1, real=0
--  eOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_15, width=1, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2 is
        port (
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
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        gain_i : in std_logic_vector(0 downto 0);
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
        qOut_v : out std_logic_vector(0 downto 0);
        qOut_c : out std_logic_vector(7 downto 0);
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
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_0, width=30, real=0
--  xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_1, width=30, real=0
--  xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_2, width=30, real=0
--  xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_3, width=30, real=0
--  xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_4, width=30, real=0
--  xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_5, width=30, real=0
--  xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_6, width=30, real=0
--  xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_7, width=30, real=0
--  xIn_v <= VCC_q, width=1, real=0
--  xIn_c <= Const107_q, width=8, real=0
--  gain_i <= GND_q, width=1, real=0
-- outputs
--  N/C
--  N/C
--  qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_0, width=16, real=0
--  qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_1, width=16, real=0
--  qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_2, width=16, real=0
--  qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_3, width=16, real=0
--  qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_4, width=16, real=0
--  qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_5, width=16, real=0
--  qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_6, width=16, real=0
--  qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_7, width=16, real=0
--  qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_v, width=1, real=0
--  qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_c, width=8, real=0
--  eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_0, width=1, real=0
--  eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_1, width=1, real=0
--  eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_2, width=1, real=0
--  eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_3, width=1, real=0
--  eOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_4, width=1, real=0
--  eOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_5, width=1, real=0
--  eOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_6, width=1, real=0
--  eOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_7, width=1, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3 is
        port (
        xIn_0 : in std_logic_vector(29 downto 0);
        xIn_1 : in std_logic_vector(29 downto 0);
        xIn_2 : in std_logic_vector(29 downto 0);
        xIn_3 : in std_logic_vector(29 downto 0);
        xIn_4 : in std_logic_vector(29 downto 0);
        xIn_5 : in std_logic_vector(29 downto 0);
        xIn_6 : in std_logic_vector(29 downto 0);
        xIn_7 : in std_logic_vector(29 downto 0);
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        gain_i : in std_logic_vector(0 downto 0);
        qOut_0 : out std_logic_vector(15 downto 0);
        qOut_1 : out std_logic_vector(15 downto 0);
        qOut_2 : out std_logic_vector(15 downto 0);
        qOut_3 : out std_logic_vector(15 downto 0);
        qOut_4 : out std_logic_vector(15 downto 0);
        qOut_5 : out std_logic_vector(15 downto 0);
        qOut_6 : out std_logic_vector(15 downto 0);
        qOut_7 : out std_logic_vector(15 downto 0);
        qOut_v : out std_logic_vector(0 downto 0);
        qOut_c : out std_logic_vector(7 downto 0);
        eOut_0 : out std_logic_vector(0 downto 0);
        eOut_1 : out std_logic_vector(0 downto 0);
        eOut_2 : out std_logic_vector(0 downto 0);
        eOut_3 : out std_logic_vector(0 downto 0);
        eOut_4 : out std_logic_vector(0 downto 0);
        eOut_5 : out std_logic_vector(0 downto 0);
        eOut_6 : out std_logic_vector(0 downto 0);
        eOut_7 : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_0, width=34, real=0
--  xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_1, width=34, real=0
--  xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_2, width=34, real=0
--  xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_3, width=34, real=0
--  xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_4, width=34, real=0
--  xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_5, width=34, real=0
--  xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_6, width=34, real=0
--  xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_7, width=34, real=0
--  xIn_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_8, width=34, real=0
--  xIn_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_9, width=34, real=0
--  xIn_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_10, width=34, real=0
--  xIn_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_11, width=34, real=0
--  xIn_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_12, width=34, real=0
--  xIn_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_13, width=34, real=0
--  xIn_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_14, width=34, real=0
--  xIn_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_15, width=34, real=0
--  xIn_16 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_16, width=34, real=0
--  xIn_17 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_17, width=34, real=0
--  xIn_18 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_18, width=34, real=0
--  xIn_19 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_19, width=34, real=0
--  xIn_20 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_20, width=34, real=0
--  xIn_21 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_21, width=34, real=0
--  xIn_22 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_22, width=34, real=0
--  xIn_23 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_23, width=34, real=0
--  xIn_24 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_24, width=34, real=0
--  xIn_25 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_25, width=34, real=0
--  xIn_26 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_26, width=34, real=0
--  xIn_27 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_27, width=34, real=0
--  xIn_28 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_28, width=34, real=0
--  xIn_29 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_29, width=34, real=0
--  xIn_30 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_30, width=34, real=0
--  xIn_31 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_31, width=34, real=0
--  xIn_v <= VCC_q, width=1, real=0
--  xIn_c <= Const107_q, width=8, real=0
--  gain_i <= GND_q, width=1, real=0
-- outputs
--  N/C
--  N/C
--  qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_0, width=16, real=0
--  qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_1, width=16, real=0
--  qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_2, width=16, real=0
--  qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_3, width=16, real=0
--  qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_4, width=16, real=0
--  qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_5, width=16, real=0
--  qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_6, width=16, real=0
--  qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_7, width=16, real=0
--  qOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_8, width=16, real=0
--  qOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_9, width=16, real=0
--  qOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_10, width=16, real=0
--  qOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_11, width=16, real=0
--  qOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_12, width=16, real=0
--  qOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_13, width=16, real=0
--  qOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_14, width=16, real=0
--  qOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_15, width=16, real=0
--  qOut_16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_16, width=16, real=0
--  qOut_17 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_17, width=16, real=0
--  qOut_18 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_18, width=16, real=0
--  qOut_19 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_19, width=16, real=0
--  qOut_20 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_20, width=16, real=0
--  qOut_21 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_21, width=16, real=0
--  qOut_22 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_22, width=16, real=0
--  qOut_23 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_23, width=16, real=0
--  qOut_24 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_24, width=16, real=0
--  qOut_25 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_25, width=16, real=0
--  qOut_26 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_26, width=16, real=0
--  qOut_27 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_27, width=16, real=0
--  qOut_28 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_28, width=16, real=0
--  qOut_29 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_29, width=16, real=0
--  qOut_30 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_30, width=16, real=0
--  qOut_31 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_31, width=16, real=0
--  qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_v, width=1, real=0
--  qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_c, width=8, real=0
--  eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_0, width=1, real=0
--  eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_1, width=1, real=0
--  eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_2, width=1, real=0
--  eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_3, width=1, real=0
--  eOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_4, width=1, real=0
--  eOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_5, width=1, real=0
--  eOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_6, width=1, real=0
--  eOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_7, width=1, real=0
--  eOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_8, width=1, real=0
--  eOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_9, width=1, real=0
--  eOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_10, width=1, real=0
--  eOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_11, width=1, real=0
--  eOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_12, width=1, real=0
--  eOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_13, width=1, real=0
--  eOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_14, width=1, real=0
--  eOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_15, width=1, real=0
--  eOut_16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_16, width=1, real=0
--  eOut_17 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_17, width=1, real=0
--  eOut_18 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_18, width=1, real=0
--  eOut_19 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_19, width=1, real=0
--  eOut_20 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_20, width=1, real=0
--  eOut_21 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_21, width=1, real=0
--  eOut_22 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_22, width=1, real=0
--  eOut_23 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_23, width=1, real=0
--  eOut_24 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_24, width=1, real=0
--  eOut_25 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_25, width=1, real=0
--  eOut_26 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_26, width=1, real=0
--  eOut_27 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_27, width=1, real=0
--  eOut_28 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_28, width=1, real=0
--  eOut_29 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_29, width=1, real=0
--  eOut_30 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_30, width=1, real=0
--  eOut_31 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_31, width=1, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2 is
        port (
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
        xIn_16 : in std_logic_vector(33 downto 0);
        xIn_17 : in std_logic_vector(33 downto 0);
        xIn_18 : in std_logic_vector(33 downto 0);
        xIn_19 : in std_logic_vector(33 downto 0);
        xIn_20 : in std_logic_vector(33 downto 0);
        xIn_21 : in std_logic_vector(33 downto 0);
        xIn_22 : in std_logic_vector(33 downto 0);
        xIn_23 : in std_logic_vector(33 downto 0);
        xIn_24 : in std_logic_vector(33 downto 0);
        xIn_25 : in std_logic_vector(33 downto 0);
        xIn_26 : in std_logic_vector(33 downto 0);
        xIn_27 : in std_logic_vector(33 downto 0);
        xIn_28 : in std_logic_vector(33 downto 0);
        xIn_29 : in std_logic_vector(33 downto 0);
        xIn_30 : in std_logic_vector(33 downto 0);
        xIn_31 : in std_logic_vector(33 downto 0);
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        gain_i : in std_logic_vector(0 downto 0);
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
        qOut_16 : out std_logic_vector(15 downto 0);
        qOut_17 : out std_logic_vector(15 downto 0);
        qOut_18 : out std_logic_vector(15 downto 0);
        qOut_19 : out std_logic_vector(15 downto 0);
        qOut_20 : out std_logic_vector(15 downto 0);
        qOut_21 : out std_logic_vector(15 downto 0);
        qOut_22 : out std_logic_vector(15 downto 0);
        qOut_23 : out std_logic_vector(15 downto 0);
        qOut_24 : out std_logic_vector(15 downto 0);
        qOut_25 : out std_logic_vector(15 downto 0);
        qOut_26 : out std_logic_vector(15 downto 0);
        qOut_27 : out std_logic_vector(15 downto 0);
        qOut_28 : out std_logic_vector(15 downto 0);
        qOut_29 : out std_logic_vector(15 downto 0);
        qOut_30 : out std_logic_vector(15 downto 0);
        qOut_31 : out std_logic_vector(15 downto 0);
        qOut_v : out std_logic_vector(0 downto 0);
        qOut_c : out std_logic_vector(7 downto 0);
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
        eOut_16 : out std_logic_vector(0 downto 0);
        eOut_17 : out std_logic_vector(0 downto 0);
        eOut_18 : out std_logic_vector(0 downto 0);
        eOut_19 : out std_logic_vector(0 downto 0);
        eOut_20 : out std_logic_vector(0 downto 0);
        eOut_21 : out std_logic_vector(0 downto 0);
        eOut_22 : out std_logic_vector(0 downto 0);
        eOut_23 : out std_logic_vector(0 downto 0);
        eOut_24 : out std_logic_vector(0 downto 0);
        eOut_25 : out std_logic_vector(0 downto 0);
        eOut_26 : out std_logic_vector(0 downto 0);
        eOut_27 : out std_logic_vector(0 downto 0);
        eOut_28 : out std_logic_vector(0 downto 0);
        eOut_29 : out std_logic_vector(0 downto 0);
        eOut_30 : out std_logic_vector(0 downto 0);
        eOut_31 : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_0, width=34, real=0
--  xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_1, width=34, real=0
--  xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_2, width=34, real=0
--  xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_3, width=34, real=0
--  xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_4, width=34, real=0
--  xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_5, width=34, real=0
--  xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_6, width=34, real=0
--  xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_7, width=34, real=0
--  xIn_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_8, width=34, real=0
--  xIn_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_9, width=34, real=0
--  xIn_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_10, width=34, real=0
--  xIn_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_11, width=34, real=0
--  xIn_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_12, width=34, real=0
--  xIn_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_13, width=34, real=0
--  xIn_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_14, width=34, real=0
--  xIn_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_15, width=34, real=0
--  xIn_16 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_16, width=34, real=0
--  xIn_17 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_17, width=34, real=0
--  xIn_18 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_18, width=34, real=0
--  xIn_19 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_19, width=34, real=0
--  xIn_20 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_20, width=34, real=0
--  xIn_21 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_21, width=34, real=0
--  xIn_22 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_22, width=34, real=0
--  xIn_23 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_23, width=34, real=0
--  xIn_24 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_24, width=34, real=0
--  xIn_25 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_25, width=34, real=0
--  xIn_26 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_26, width=34, real=0
--  xIn_27 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_27, width=34, real=0
--  xIn_28 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_28, width=34, real=0
--  xIn_29 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_29, width=34, real=0
--  xIn_30 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_30, width=34, real=0
--  xIn_31 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_31, width=34, real=0
--  xIn_v <= VCC_q, width=1, real=0
--  xIn_c <= Const107_q, width=8, real=0
--  gain_i <= GND_q, width=1, real=0
-- outputs
--  N/C
--  N/C
--  qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_0, width=16, real=0
--  qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_1, width=16, real=0
--  qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_2, width=16, real=0
--  qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_3, width=16, real=0
--  qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_4, width=16, real=0
--  qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_5, width=16, real=0
--  qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_6, width=16, real=0
--  qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_7, width=16, real=0
--  qOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_8, width=16, real=0
--  qOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_9, width=16, real=0
--  qOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_10, width=16, real=0
--  qOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_11, width=16, real=0
--  qOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_12, width=16, real=0
--  qOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_13, width=16, real=0
--  qOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_14, width=16, real=0
--  qOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_15, width=16, real=0
--  qOut_16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_16, width=16, real=0
--  qOut_17 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_17, width=16, real=0
--  qOut_18 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_18, width=16, real=0
--  qOut_19 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_19, width=16, real=0
--  qOut_20 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_20, width=16, real=0
--  qOut_21 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_21, width=16, real=0
--  qOut_22 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_22, width=16, real=0
--  qOut_23 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_23, width=16, real=0
--  qOut_24 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_24, width=16, real=0
--  qOut_25 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_25, width=16, real=0
--  qOut_26 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_26, width=16, real=0
--  qOut_27 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_27, width=16, real=0
--  qOut_28 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_28, width=16, real=0
--  qOut_29 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_29, width=16, real=0
--  qOut_30 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_30, width=16, real=0
--  qOut_31 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_31, width=16, real=0
--  qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_v, width=1, real=0
--  qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_c, width=8, real=0
--  eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_0, width=1, real=0
--  eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_1, width=1, real=0
--  eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_2, width=1, real=0
--  eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_3, width=1, real=0
--  eOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_4, width=1, real=0
--  eOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_5, width=1, real=0
--  eOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_6, width=1, real=0
--  eOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_7, width=1, real=0
--  eOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_8, width=1, real=0
--  eOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_9, width=1, real=0
--  eOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_10, width=1, real=0
--  eOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_11, width=1, real=0
--  eOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_12, width=1, real=0
--  eOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_13, width=1, real=0
--  eOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_14, width=1, real=0
--  eOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_15, width=1, real=0
--  eOut_16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_16, width=1, real=0
--  eOut_17 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_17, width=1, real=0
--  eOut_18 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_18, width=1, real=0
--  eOut_19 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_19, width=1, real=0
--  eOut_20 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_20, width=1, real=0
--  eOut_21 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_21, width=1, real=0
--  eOut_22 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_22, width=1, real=0
--  eOut_23 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_23, width=1, real=0
--  eOut_24 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_24, width=1, real=0
--  eOut_25 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_25, width=1, real=0
--  eOut_26 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_26, width=1, real=0
--  eOut_27 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_27, width=1, real=0
--  eOut_28 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_28, width=1, real=0
--  eOut_29 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_29, width=1, real=0
--  eOut_30 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_30, width=1, real=0
--  eOut_31 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_31, width=1, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3 is
        port (
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
        xIn_16 : in std_logic_vector(33 downto 0);
        xIn_17 : in std_logic_vector(33 downto 0);
        xIn_18 : in std_logic_vector(33 downto 0);
        xIn_19 : in std_logic_vector(33 downto 0);
        xIn_20 : in std_logic_vector(33 downto 0);
        xIn_21 : in std_logic_vector(33 downto 0);
        xIn_22 : in std_logic_vector(33 downto 0);
        xIn_23 : in std_logic_vector(33 downto 0);
        xIn_24 : in std_logic_vector(33 downto 0);
        xIn_25 : in std_logic_vector(33 downto 0);
        xIn_26 : in std_logic_vector(33 downto 0);
        xIn_27 : in std_logic_vector(33 downto 0);
        xIn_28 : in std_logic_vector(33 downto 0);
        xIn_29 : in std_logic_vector(33 downto 0);
        xIn_30 : in std_logic_vector(33 downto 0);
        xIn_31 : in std_logic_vector(33 downto 0);
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        gain_i : in std_logic_vector(0 downto 0);
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
        qOut_16 : out std_logic_vector(15 downto 0);
        qOut_17 : out std_logic_vector(15 downto 0);
        qOut_18 : out std_logic_vector(15 downto 0);
        qOut_19 : out std_logic_vector(15 downto 0);
        qOut_20 : out std_logic_vector(15 downto 0);
        qOut_21 : out std_logic_vector(15 downto 0);
        qOut_22 : out std_logic_vector(15 downto 0);
        qOut_23 : out std_logic_vector(15 downto 0);
        qOut_24 : out std_logic_vector(15 downto 0);
        qOut_25 : out std_logic_vector(15 downto 0);
        qOut_26 : out std_logic_vector(15 downto 0);
        qOut_27 : out std_logic_vector(15 downto 0);
        qOut_28 : out std_logic_vector(15 downto 0);
        qOut_29 : out std_logic_vector(15 downto 0);
        qOut_30 : out std_logic_vector(15 downto 0);
        qOut_31 : out std_logic_vector(15 downto 0);
        qOut_v : out std_logic_vector(0 downto 0);
        qOut_c : out std_logic_vector(7 downto 0);
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
        eOut_16 : out std_logic_vector(0 downto 0);
        eOut_17 : out std_logic_vector(0 downto 0);
        eOut_18 : out std_logic_vector(0 downto 0);
        eOut_19 : out std_logic_vector(0 downto 0);
        eOut_20 : out std_logic_vector(0 downto 0);
        eOut_21 : out std_logic_vector(0 downto 0);
        eOut_22 : out std_logic_vector(0 downto 0);
        eOut_23 : out std_logic_vector(0 downto 0);
        eOut_24 : out std_logic_vector(0 downto 0);
        eOut_25 : out std_logic_vector(0 downto 0);
        eOut_26 : out std_logic_vector(0 downto 0);
        eOut_27 : out std_logic_vector(0 downto 0);
        eOut_28 : out std_logic_vector(0 downto 0);
        eOut_29 : out std_logic_vector(0 downto 0);
        eOut_30 : out std_logic_vector(0 downto 0);
        eOut_31 : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_0, width=34, real=0
--  xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_1, width=34, real=0
--  xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_2, width=34, real=0
--  xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_3, width=34, real=0
--  xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_4, width=34, real=0
--  xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_5, width=34, real=0
--  xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_6, width=34, real=0
--  xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_7, width=34, real=0
--  xIn_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_8, width=34, real=0
--  xIn_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_9, width=34, real=0
--  xIn_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_10, width=34, real=0
--  xIn_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_11, width=34, real=0
--  xIn_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_12, width=34, real=0
--  xIn_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_13, width=34, real=0
--  xIn_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_14, width=34, real=0
--  xIn_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_15, width=34, real=0
--  xIn_16 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_16, width=34, real=0
--  xIn_17 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_17, width=34, real=0
--  xIn_18 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_18, width=34, real=0
--  xIn_19 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_19, width=34, real=0
--  xIn_20 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_20, width=34, real=0
--  xIn_21 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_21, width=34, real=0
--  xIn_22 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_22, width=34, real=0
--  xIn_23 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_23, width=34, real=0
--  xIn_24 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_24, width=34, real=0
--  xIn_25 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_25, width=34, real=0
--  xIn_26 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_26, width=34, real=0
--  xIn_27 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_27, width=34, real=0
--  xIn_28 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_28, width=34, real=0
--  xIn_29 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_29, width=34, real=0
--  xIn_30 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_30, width=34, real=0
--  xIn_31 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_31, width=34, real=0
--  xIn_v <= VCC_q, width=1, real=0
--  xIn_c <= Const107_q, width=8, real=0
--  gain_i <= GND_q, width=1, real=0
-- outputs
--  N/C
--  N/C
--  qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_0, width=16, real=0
--  qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_1, width=16, real=0
--  qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_2, width=16, real=0
--  qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_3, width=16, real=0
--  qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_4, width=16, real=0
--  qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_5, width=16, real=0
--  qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_6, width=16, real=0
--  qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_7, width=16, real=0
--  qOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_8, width=16, real=0
--  qOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_9, width=16, real=0
--  qOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_10, width=16, real=0
--  qOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_11, width=16, real=0
--  qOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_12, width=16, real=0
--  qOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_13, width=16, real=0
--  qOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_14, width=16, real=0
--  qOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_15, width=16, real=0
--  qOut_16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_16, width=16, real=0
--  qOut_17 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_17, width=16, real=0
--  qOut_18 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_18, width=16, real=0
--  qOut_19 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_19, width=16, real=0
--  qOut_20 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_20, width=16, real=0
--  qOut_21 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_21, width=16, real=0
--  qOut_22 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_22, width=16, real=0
--  qOut_23 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_23, width=16, real=0
--  qOut_24 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_24, width=16, real=0
--  qOut_25 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_25, width=16, real=0
--  qOut_26 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_26, width=16, real=0
--  qOut_27 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_27, width=16, real=0
--  qOut_28 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_28, width=16, real=0
--  qOut_29 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_29, width=16, real=0
--  qOut_30 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_30, width=16, real=0
--  qOut_31 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_31, width=16, real=0
--  qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_v, width=1, real=0
--  qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_c, width=8, real=0
--  eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_0, width=1, real=0
--  eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_1, width=1, real=0
--  eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_2, width=1, real=0
--  eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_3, width=1, real=0
--  eOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_4, width=1, real=0
--  eOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_5, width=1, real=0
--  eOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_6, width=1, real=0
--  eOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_7, width=1, real=0
--  eOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_8, width=1, real=0
--  eOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_9, width=1, real=0
--  eOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_10, width=1, real=0
--  eOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_11, width=1, real=0
--  eOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_12, width=1, real=0
--  eOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_13, width=1, real=0
--  eOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_14, width=1, real=0
--  eOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_15, width=1, real=0
--  eOut_16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_16, width=1, real=0
--  eOut_17 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_17, width=1, real=0
--  eOut_18 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_18, width=1, real=0
--  eOut_19 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_19, width=1, real=0
--  eOut_20 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_20, width=1, real=0
--  eOut_21 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_21, width=1, real=0
--  eOut_22 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_22, width=1, real=0
--  eOut_23 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_23, width=1, real=0
--  eOut_24 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_24, width=1, real=0
--  eOut_25 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_25, width=1, real=0
--  eOut_26 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_26, width=1, real=0
--  eOut_27 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_27, width=1, real=0
--  eOut_28 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_28, width=1, real=0
--  eOut_29 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_29, width=1, real=0
--  eOut_30 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_30, width=1, real=0
--  eOut_31 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_31, width=1, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4 is
        port (
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
        xIn_16 : in std_logic_vector(33 downto 0);
        xIn_17 : in std_logic_vector(33 downto 0);
        xIn_18 : in std_logic_vector(33 downto 0);
        xIn_19 : in std_logic_vector(33 downto 0);
        xIn_20 : in std_logic_vector(33 downto 0);
        xIn_21 : in std_logic_vector(33 downto 0);
        xIn_22 : in std_logic_vector(33 downto 0);
        xIn_23 : in std_logic_vector(33 downto 0);
        xIn_24 : in std_logic_vector(33 downto 0);
        xIn_25 : in std_logic_vector(33 downto 0);
        xIn_26 : in std_logic_vector(33 downto 0);
        xIn_27 : in std_logic_vector(33 downto 0);
        xIn_28 : in std_logic_vector(33 downto 0);
        xIn_29 : in std_logic_vector(33 downto 0);
        xIn_30 : in std_logic_vector(33 downto 0);
        xIn_31 : in std_logic_vector(33 downto 0);
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        gain_i : in std_logic_vector(0 downto 0);
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
        qOut_16 : out std_logic_vector(15 downto 0);
        qOut_17 : out std_logic_vector(15 downto 0);
        qOut_18 : out std_logic_vector(15 downto 0);
        qOut_19 : out std_logic_vector(15 downto 0);
        qOut_20 : out std_logic_vector(15 downto 0);
        qOut_21 : out std_logic_vector(15 downto 0);
        qOut_22 : out std_logic_vector(15 downto 0);
        qOut_23 : out std_logic_vector(15 downto 0);
        qOut_24 : out std_logic_vector(15 downto 0);
        qOut_25 : out std_logic_vector(15 downto 0);
        qOut_26 : out std_logic_vector(15 downto 0);
        qOut_27 : out std_logic_vector(15 downto 0);
        qOut_28 : out std_logic_vector(15 downto 0);
        qOut_29 : out std_logic_vector(15 downto 0);
        qOut_30 : out std_logic_vector(15 downto 0);
        qOut_31 : out std_logic_vector(15 downto 0);
        qOut_v : out std_logic_vector(0 downto 0);
        qOut_c : out std_logic_vector(7 downto 0);
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
        eOut_16 : out std_logic_vector(0 downto 0);
        eOut_17 : out std_logic_vector(0 downto 0);
        eOut_18 : out std_logic_vector(0 downto 0);
        eOut_19 : out std_logic_vector(0 downto 0);
        eOut_20 : out std_logic_vector(0 downto 0);
        eOut_21 : out std_logic_vector(0 downto 0);
        eOut_22 : out std_logic_vector(0 downto 0);
        eOut_23 : out std_logic_vector(0 downto 0);
        eOut_24 : out std_logic_vector(0 downto 0);
        eOut_25 : out std_logic_vector(0 downto 0);
        eOut_26 : out std_logic_vector(0 downto 0);
        eOut_27 : out std_logic_vector(0 downto 0);
        eOut_28 : out std_logic_vector(0 downto 0);
        eOut_29 : out std_logic_vector(0 downto 0);
        eOut_30 : out std_logic_vector(0 downto 0);
        eOut_31 : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_8, width=16, real=0
--  xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_9, width=16, real=0
--  xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_10, width=16, real=0
--  xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_11, width=16, real=0
--  xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_12, width=16, real=0
--  xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_13, width=16, real=0
--  xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_14, width=16, real=0
--  xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_15, width=16, real=0
--  xIn_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_24, width=16, real=0
--  xIn_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_25, width=16, real=0
--  xIn_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_26, width=16, real=0
--  xIn_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_27, width=16, real=0
--  xIn_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_28, width=16, real=0
--  xIn_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_29, width=16, real=0
--  xIn_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_30, width=16, real=0
--  xIn_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_31, width=16, real=0
--  xIn_v <= VCC_q, width=1, real=0
--  xIn_c <= Const107_q, width=8, real=0
-- outputs
--  N/C
--  N/C
--  xOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_0, width=34, real=0
--  xOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_1, width=34, real=0
--  xOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_2, width=34, real=0
--  xOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_3, width=34, real=0
--  xOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_4, width=34, real=0
--  xOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_5, width=34, real=0
--  xOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_6, width=34, real=0
--  xOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_7, width=34, real=0
--  xOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_8, width=34, real=0
--  xOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_9, width=34, real=0
--  xOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_10, width=34, real=0
--  xOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_11, width=34, real=0
--  xOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_12, width=34, real=0
--  xOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_13, width=34, real=0
--  xOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_14, width=34, real=0
--  xOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_15, width=34, real=0
--  xOut_16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_16, width=34, real=0
--  xOut_17 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_17, width=34, real=0
--  xOut_18 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_18, width=34, real=0
--  xOut_19 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_19, width=34, real=0
--  xOut_20 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_20, width=34, real=0
--  xOut_21 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_21, width=34, real=0
--  xOut_22 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_22, width=34, real=0
--  xOut_23 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_23, width=34, real=0
--  xOut_24 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_24, width=34, real=0
--  xOut_25 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_25, width=34, real=0
--  xOut_26 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_26, width=34, real=0
--  xOut_27 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_27, width=34, real=0
--  xOut_28 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_28, width=34, real=0
--  xOut_29 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_29, width=34, real=0
--  xOut_30 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_30, width=34, real=0
--  xOut_31 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_31, width=34, real=0
--  xOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_v, width=1, real=0
--  xOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_c, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1 is
        port (
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
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
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
        xOut_v : out std_logic_vector(0 downto 0);
        xOut_c : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  i1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_iout1, width=35, real=0
--  i2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_iout2, width=35, real=0
--  q1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_iout1, width=35, real=0
--  q2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_iout2, width=35, real=0
--  vin <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_vout, width=1, real=0
--  cin <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_cout, width=8, real=0
-- outputs
--  N/C
--  N/C
--  qout => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_qout, width=35, real=0
--  vout => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_vout, width=1, real=0
--  cout => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_cout, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3 is
        port (
        i1 : in std_logic_vector(34 downto 0);
        i2 : in std_logic_vector(34 downto 0);
        q1 : in std_logic_vector(34 downto 0);
        q2 : in std_logic_vector(34 downto 0);
        vin : in std_logic_vector(0 downto 0);
        cin : in std_logic_vector(7 downto 0);
        qout : out std_logic_vector(34 downto 0);
        vout : out std_logic_vector(0 downto 0);
        cout : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  iIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_8, width=16, real=0
--  iIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_9, width=16, real=0
--  iIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_10, width=16, real=0
--  iIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_11, width=16, real=0
--  iIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_12, width=16, real=0
--  iIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_13, width=16, real=0
--  iIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_14, width=16, real=0
--  iIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_15, width=16, real=0
--  qIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_24, width=16, real=0
--  qIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_25, width=16, real=0
--  qIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_26, width=16, real=0
--  qIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_27, width=16, real=0
--  qIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_28, width=16, real=0
--  qIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_29, width=16, real=0
--  qIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_30, width=16, real=0
--  qIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_31, width=16, real=0
--  In_v <= VCC_q, width=1, real=0
--  In_c <= Const107_q, width=8, real=0
--  sIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_8, width=12, real=0
--  sIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_9, width=12, real=0
--  sIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_10, width=12, real=0
--  sIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_11, width=12, real=0
--  sIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_12, width=12, real=0
--  sIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_13, width=12, real=0
--  sIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_14, width=12, real=0
--  sIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_15, width=12, real=0
--  cIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_8, width=12, real=0
--  cIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_9, width=12, real=0
--  cIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_10, width=12, real=0
--  cIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_11, width=12, real=0
--  cIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_12, width=12, real=0
--  cIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_13, width=12, real=0
--  cIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_14, width=12, real=0
--  cIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_15, width=12, real=0
-- outputs
--  N/C
--  N/C
--  iOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_0, width=29, real=0
--  iOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_1, width=29, real=0
--  iOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_2, width=29, real=0
--  iOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_3, width=29, real=0
--  iOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_4, width=29, real=0
--  iOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_5, width=29, real=0
--  iOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_6, width=29, real=0
--  iOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_7, width=29, real=0
--  qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_0, width=29, real=0
--  qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_1, width=29, real=0
--  qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_2, width=29, real=0
--  qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_3, width=29, real=0
--  qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_4, width=29, real=0
--  qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_5, width=29, real=0
--  qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_6, width=29, real=0
--  qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_7, width=29, real=0
--  Out_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_Out_v, width=1, real=0
--  Out_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_Out_c, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10 is
        port (
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
        In_v : in std_logic_vector(0 downto 0);
        In_c : in std_logic_vector(7 downto 0);
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
        Out_v : out std_logic_vector(0 downto 0);
        Out_c : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  iIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_0, width=16, real=0
--  iIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_1, width=16, real=0
--  iIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_2, width=16, real=0
--  iIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_3, width=16, real=0
--  iIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_4, width=16, real=0
--  iIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_5, width=16, real=0
--  iIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_6, width=16, real=0
--  iIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_7, width=16, real=0
--  qIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_16, width=16, real=0
--  qIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_17, width=16, real=0
--  qIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_18, width=16, real=0
--  qIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_19, width=16, real=0
--  qIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_20, width=16, real=0
--  qIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_21, width=16, real=0
--  qIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_22, width=16, real=0
--  qIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_23, width=16, real=0
--  In_v <= VCC_q, width=1, real=0
--  In_c <= Const107_q, width=8, real=0
--  sIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_0, width=12, real=0
--  sIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_1, width=12, real=0
--  sIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_2, width=12, real=0
--  sIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_3, width=12, real=0
--  sIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_4, width=12, real=0
--  sIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_5, width=12, real=0
--  sIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_6, width=12, real=0
--  sIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_7, width=12, real=0
--  cIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_0, width=12, real=0
--  cIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_1, width=12, real=0
--  cIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_2, width=12, real=0
--  cIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_3, width=12, real=0
--  cIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_4, width=12, real=0
--  cIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_5, width=12, real=0
--  cIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_6, width=12, real=0
--  cIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_7, width=12, real=0
-- outputs
--  N/C
--  N/C
--  iOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_0, width=29, real=0
--  iOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_1, width=29, real=0
--  iOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_2, width=29, real=0
--  iOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_3, width=29, real=0
--  iOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_4, width=29, real=0
--  iOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_5, width=29, real=0
--  iOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_6, width=29, real=0
--  iOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_7, width=29, real=0
--  qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_0, width=29, real=0
--  qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_1, width=29, real=0
--  qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_2, width=29, real=0
--  qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_3, width=29, real=0
--  qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_4, width=29, real=0
--  qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_5, width=29, real=0
--  qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_6, width=29, real=0
--  qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_7, width=29, real=0
--  Out_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_Out_v, width=1, real=0
--  Out_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_Out_c, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11 is
        port (
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
        In_v : in std_logic_vector(0 downto 0);
        In_c : in std_logic_vector(7 downto 0);
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
        Out_v : out std_logic_vector(0 downto 0);
        Out_c : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  iIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_8, width=16, real=0
--  iIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_9, width=16, real=0
--  iIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_10, width=16, real=0
--  iIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_11, width=16, real=0
--  iIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_12, width=16, real=0
--  iIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_13, width=16, real=0
--  iIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_14, width=16, real=0
--  iIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_15, width=16, real=0
--  qIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_24, width=16, real=0
--  qIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_25, width=16, real=0
--  qIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_26, width=16, real=0
--  qIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_27, width=16, real=0
--  qIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_28, width=16, real=0
--  qIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_29, width=16, real=0
--  qIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_30, width=16, real=0
--  qIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_31, width=16, real=0
--  In_v <= VCC_q, width=1, real=0
--  In_c <= Const107_q, width=8, real=0
--  sIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_8, width=12, real=0
--  sIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_9, width=12, real=0
--  sIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_10, width=12, real=0
--  sIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_11, width=12, real=0
--  sIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_12, width=12, real=0
--  sIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_13, width=12, real=0
--  sIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_14, width=12, real=0
--  sIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_15, width=12, real=0
--  cIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_8, width=12, real=0
--  cIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_9, width=12, real=0
--  cIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_10, width=12, real=0
--  cIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_11, width=12, real=0
--  cIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_12, width=12, real=0
--  cIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_13, width=12, real=0
--  cIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_14, width=12, real=0
--  cIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_15, width=12, real=0
-- outputs
--  N/C
--  N/C
--  iOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_0, width=29, real=0
--  iOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_1, width=29, real=0
--  iOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_2, width=29, real=0
--  iOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_3, width=29, real=0
--  iOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_4, width=29, real=0
--  iOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_5, width=29, real=0
--  iOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_6, width=29, real=0
--  iOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_7, width=29, real=0
--  qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_0, width=29, real=0
--  qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_1, width=29, real=0
--  qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_2, width=29, real=0
--  qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_3, width=29, real=0
--  qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_4, width=29, real=0
--  qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_5, width=29, real=0
--  qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_6, width=29, real=0
--  qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_7, width=29, real=0
--  Out_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_Out_v, width=1, real=0
--  Out_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_Out_c, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12 is
        port (
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
        In_v : in std_logic_vector(0 downto 0);
        In_c : in std_logic_vector(7 downto 0);
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
        Out_v : out std_logic_vector(0 downto 0);
        Out_c : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  iIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_0, width=16, real=0
--  iIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_1, width=16, real=0
--  qIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_2, width=16, real=0
--  qIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_3, width=16, real=0
--  In_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_v, width=1, real=0
--  In_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_c, width=8, real=0
--  sIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_sinOut_0, width=16, real=0
--  sIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_sinOut_0, width=16, real=0
--  cIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_cosOut_0, width=16, real=0
--  cIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_cosOut_0, width=16, real=0
-- outputs
--  N/C
--  N/C
--  iOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_iOut_0, width=33, real=0
--  iOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_iOut_1, width=33, real=0
--  qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_qOut_0, width=33, real=0
--  qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_qOut_1, width=33, real=0
--  Out_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_Out_v, width=1, real=0
--  Out_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_Out_c, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8 is
        port (
        iIn_0 : in std_logic_vector(15 downto 0);
        iIn_1 : in std_logic_vector(15 downto 0);
        qIn_0 : in std_logic_vector(15 downto 0);
        qIn_1 : in std_logic_vector(15 downto 0);
        In_v : in std_logic_vector(0 downto 0);
        In_c : in std_logic_vector(7 downto 0);
        sIn_0 : in std_logic_vector(15 downto 0);
        sIn_1 : in std_logic_vector(15 downto 0);
        cIn_0 : in std_logic_vector(15 downto 0);
        cIn_1 : in std_logic_vector(15 downto 0);
        iOut_0 : out std_logic_vector(32 downto 0);
        iOut_1 : out std_logic_vector(32 downto 0);
        qOut_0 : out std_logic_vector(32 downto 0);
        qOut_1 : out std_logic_vector(32 downto 0);
        Out_v : out std_logic_vector(0 downto 0);
        Out_c : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  iIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_0, width=16, real=0
--  iIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_1, width=16, real=0
--  iIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_2, width=16, real=0
--  iIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_3, width=16, real=0
--  iIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_4, width=16, real=0
--  iIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_5, width=16, real=0
--  iIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_6, width=16, real=0
--  iIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_7, width=16, real=0
--  qIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_16, width=16, real=0
--  qIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_17, width=16, real=0
--  qIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_18, width=16, real=0
--  qIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_19, width=16, real=0
--  qIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_20, width=16, real=0
--  qIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_21, width=16, real=0
--  qIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_22, width=16, real=0
--  qIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_23, width=16, real=0
--  In_v <= VCC_q, width=1, real=0
--  In_c <= Const107_q, width=8, real=0
--  sIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_0, width=12, real=0
--  sIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_1, width=12, real=0
--  sIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_2, width=12, real=0
--  sIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_3, width=12, real=0
--  sIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_4, width=12, real=0
--  sIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_5, width=12, real=0
--  sIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_6, width=12, real=0
--  sIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_7, width=12, real=0
--  cIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_0, width=12, real=0
--  cIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_1, width=12, real=0
--  cIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_2, width=12, real=0
--  cIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_3, width=12, real=0
--  cIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_4, width=12, real=0
--  cIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_5, width=12, real=0
--  cIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_6, width=12, real=0
--  cIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_7, width=12, real=0
-- outputs
--  N/C
--  N/C
--  iOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_0, width=29, real=0
--  iOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_1, width=29, real=0
--  iOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_2, width=29, real=0
--  iOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_3, width=29, real=0
--  iOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_4, width=29, real=0
--  iOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_5, width=29, real=0
--  iOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_6, width=29, real=0
--  iOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_7, width=29, real=0
--  qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_0, width=29, real=0
--  qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_1, width=29, real=0
--  qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_2, width=29, real=0
--  qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_3, width=29, real=0
--  qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_4, width=29, real=0
--  qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_5, width=29, real=0
--  qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_6, width=29, real=0
--  qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_7, width=29, real=0
--  Out_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_Out_v, width=1, real=0
--  Out_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_Out_c, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9 is
        port (
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
        In_v : in std_logic_vector(0 downto 0);
        In_c : in std_logic_vector(7 downto 0);
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
        Out_v : out std_logic_vector(0 downto 0);
        Out_c : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3 component declaration
-- inputs
--  busIn_d <= busIn_d, width=32, real=0
--  busIn_a <= busIn_a, width=12, real=0
--  busIn_w <= busIn_w, width=1, real=0
--  xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_c, width=8, real=0
--  xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_v, width=1, real=0
--  xIn_p_0 <= Const104_q, width=18, real=0
--  xIn_s_0 <= GND_q, width=1, real=0
-- outputs
--  N/C
--  N/C
--  sinOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_sinOut_0, width=16, real=0
--  cosOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_cosOut_0, width=16, real=0
--  ncoOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_ncoOut_v, width=1, real=0
--  ncoOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_ncoOut_c, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3 is
        port (
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_p_0 : in std_logic_vector(17 downto 0);
        xIn_s_0 : in std_logic_vector(0 downto 0);
        sinOut_0 : out std_logic_vector(15 downto 0);
        cosOut_0 : out std_logic_vector(15 downto 0);
        ncoOut_v : out std_logic_vector(0 downto 0);
        ncoOut_c : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3 component declaration
-- inputs
--  busIn_d <= busIn_d, width=32, real=0
--  busIn_a <= busIn_a, width=12, real=0
--  busIn_w <= busIn_w, width=1, real=0
--  xIn_c <= Const107_q, width=8, real=0
--  xIn_v <= VCC_q, width=1, real=0
--  xIn_p_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_00, width=18, real=0
--  xIn_p_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_01, width=18, real=0
--  xIn_p_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_02, width=18, real=0
--  xIn_p_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_03, width=18, real=0
--  xIn_p_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_04, width=18, real=0
--  xIn_p_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_05, width=18, real=0
--  xIn_p_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_06, width=18, real=0
--  xIn_p_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_07, width=18, real=0
--  xIn_p_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_08, width=18, real=0
--  xIn_p_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_09, width=18, real=0
--  xIn_p_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_10, width=18, real=0
--  xIn_p_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_11, width=18, real=0
--  xIn_p_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_12, width=18, real=0
--  xIn_p_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_13, width=18, real=0
--  xIn_p_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_14, width=18, real=0
--  xIn_p_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_15, width=18, real=0
--  xIn_s_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_00, width=1, real=0
--  xIn_s_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_01, width=1, real=0
--  xIn_s_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_02, width=1, real=0
--  xIn_s_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_03, width=1, real=0
--  xIn_s_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_04, width=1, real=0
--  xIn_s_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_05, width=1, real=0
--  xIn_s_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_06, width=1, real=0
--  xIn_s_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_07, width=1, real=0
--  xIn_s_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_08, width=1, real=0
--  xIn_s_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_09, width=1, real=0
--  xIn_s_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_10, width=1, real=0
--  xIn_s_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_11, width=1, real=0
--  xIn_s_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_12, width=1, real=0
--  xIn_s_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_13, width=1, real=0
--  xIn_s_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_14, width=1, real=0
--  xIn_s_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_15, width=1, real=0
-- outputs
--  N/C
--  N/C
--  sinOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_0, width=12, real=0
--  sinOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_1, width=12, real=0
--  sinOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_2, width=12, real=0
--  sinOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_3, width=12, real=0
--  sinOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_4, width=12, real=0
--  sinOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_5, width=12, real=0
--  sinOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_6, width=12, real=0
--  sinOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_7, width=12, real=0
--  sinOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_8, width=12, real=0
--  sinOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_9, width=12, real=0
--  sinOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_10, width=12, real=0
--  sinOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_11, width=12, real=0
--  sinOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_12, width=12, real=0
--  sinOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_13, width=12, real=0
--  sinOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_14, width=12, real=0
--  sinOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_15, width=12, real=0
--  cosOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_0, width=12, real=0
--  cosOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_1, width=12, real=0
--  cosOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_2, width=12, real=0
--  cosOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_3, width=12, real=0
--  cosOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_4, width=12, real=0
--  cosOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_5, width=12, real=0
--  cosOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_6, width=12, real=0
--  cosOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_7, width=12, real=0
--  cosOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_8, width=12, real=0
--  cosOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_9, width=12, real=0
--  cosOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_10, width=12, real=0
--  cosOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_11, width=12, real=0
--  cosOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_12, width=12, real=0
--  cosOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_13, width=12, real=0
--  cosOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_14, width=12, real=0
--  cosOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_15, width=12, real=0
--  ncoOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_ncoOut_v, width=1, real=0
--  ncoOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_ncoOut_c, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3 is
        port (
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        xIn_v : in std_logic_vector(0 downto 0);
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
        ncoOut_v : out std_logic_vector(0 downto 0);
        ncoOut_c : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4 component declaration
-- inputs
--  busIn_d <= busIn_d, width=32, real=0
--  busIn_a <= busIn_a, width=12, real=0
--  busIn_w <= busIn_w, width=1, real=0
--  xIn_c <= Const107_q, width=8, real=0
--  xIn_v <= VCC_q, width=1, real=0
--  xIn_p_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_00, width=18, real=0
--  xIn_p_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_01, width=18, real=0
--  xIn_p_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_02, width=18, real=0
--  xIn_p_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_03, width=18, real=0
--  xIn_p_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_04, width=18, real=0
--  xIn_p_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_05, width=18, real=0
--  xIn_p_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_06, width=18, real=0
--  xIn_p_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_07, width=18, real=0
--  xIn_p_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_08, width=18, real=0
--  xIn_p_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_09, width=18, real=0
--  xIn_p_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_10, width=18, real=0
--  xIn_p_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_11, width=18, real=0
--  xIn_p_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_12, width=18, real=0
--  xIn_p_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_13, width=18, real=0
--  xIn_p_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_14, width=18, real=0
--  xIn_p_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_15, width=18, real=0
--  xIn_s_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_00, width=1, real=0
--  xIn_s_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_01, width=1, real=0
--  xIn_s_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_02, width=1, real=0
--  xIn_s_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_03, width=1, real=0
--  xIn_s_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_04, width=1, real=0
--  xIn_s_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_05, width=1, real=0
--  xIn_s_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_06, width=1, real=0
--  xIn_s_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_07, width=1, real=0
--  xIn_s_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_08, width=1, real=0
--  xIn_s_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_09, width=1, real=0
--  xIn_s_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_10, width=1, real=0
--  xIn_s_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_11, width=1, real=0
--  xIn_s_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_12, width=1, real=0
--  xIn_s_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_13, width=1, real=0
--  xIn_s_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_14, width=1, real=0
--  xIn_s_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_15, width=1, real=0
-- outputs
--  N/C
--  N/C
--  sinOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_0, width=12, real=0
--  sinOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_1, width=12, real=0
--  sinOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_2, width=12, real=0
--  sinOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_3, width=12, real=0
--  sinOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_4, width=12, real=0
--  sinOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_5, width=12, real=0
--  sinOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_6, width=12, real=0
--  sinOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_7, width=12, real=0
--  sinOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_8, width=12, real=0
--  sinOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_9, width=12, real=0
--  sinOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_10, width=12, real=0
--  sinOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_11, width=12, real=0
--  sinOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_12, width=12, real=0
--  sinOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_13, width=12, real=0
--  sinOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_14, width=12, real=0
--  sinOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_15, width=12, real=0
--  cosOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_0, width=12, real=0
--  cosOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_1, width=12, real=0
--  cosOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_2, width=12, real=0
--  cosOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_3, width=12, real=0
--  cosOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_4, width=12, real=0
--  cosOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_5, width=12, real=0
--  cosOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_6, width=12, real=0
--  cosOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_7, width=12, real=0
--  cosOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_8, width=12, real=0
--  cosOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_9, width=12, real=0
--  cosOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_10, width=12, real=0
--  cosOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_11, width=12, real=0
--  cosOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_12, width=12, real=0
--  cosOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_13, width=12, real=0
--  cosOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_14, width=12, real=0
--  cosOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_15, width=12, real=0
--  ncoOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_ncoOut_v, width=1, real=0
--  ncoOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_ncoOut_c, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4 is
        port (
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        xIn_v : in std_logic_vector(0 downto 0);
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
        ncoOut_v : out std_logic_vector(0 downto 0);
        ncoOut_c : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2 component declaration
-- inputs
--  busIn_d <= busIn_d, width=32, real=0
--  busIn_a <= busIn_a, width=12, real=0
--  busIn_w <= busIn_w, width=1, real=0
-- outputs
--  N/C
--  N/C
--  out_00 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_00, width=18, real=0
--  out_01 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_01, width=18, real=0
--  out_02 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_02, width=18, real=0
--  out_03 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_03, width=18, real=0
--  out_04 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_04, width=18, real=0
--  out_05 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_05, width=18, real=0
--  out_06 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_06, width=18, real=0
--  out_07 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_07, width=18, real=0
--  out_08 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_08, width=18, real=0
--  out_09 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_09, width=18, real=0
--  out_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_10, width=18, real=0
--  out_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_11, width=18, real=0
--  out_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_12, width=18, real=0
--  out_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_13, width=18, real=0
--  out_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_14, width=18, real=0
--  out_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_15, width=18, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2 is
        port (
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
        out_00 : out std_logic_vector(17 downto 0);
        out_01 : out std_logic_vector(17 downto 0);
        out_02 : out std_logic_vector(17 downto 0);
        out_03 : out std_logic_vector(17 downto 0);
        out_04 : out std_logic_vector(17 downto 0);
        out_05 : out std_logic_vector(17 downto 0);
        out_06 : out std_logic_vector(17 downto 0);
        out_07 : out std_logic_vector(17 downto 0);
        out_08 : out std_logic_vector(17 downto 0);
        out_09 : out std_logic_vector(17 downto 0);
        out_10 : out std_logic_vector(17 downto 0);
        out_11 : out std_logic_vector(17 downto 0);
        out_12 : out std_logic_vector(17 downto 0);
        out_13 : out std_logic_vector(17 downto 0);
        out_14 : out std_logic_vector(17 downto 0);
        out_15 : out std_logic_vector(17 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3 component declaration
-- inputs
--  busIn_d <= busIn_d, width=32, real=0
--  busIn_a <= busIn_a, width=12, real=0
--  busIn_w <= busIn_w, width=1, real=0
-- outputs
--  N/C
--  N/C
--  out_00 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_00, width=18, real=0
--  out_01 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_01, width=18, real=0
--  out_02 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_02, width=18, real=0
--  out_03 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_03, width=18, real=0
--  out_04 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_04, width=18, real=0
--  out_05 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_05, width=18, real=0
--  out_06 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_06, width=18, real=0
--  out_07 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_07, width=18, real=0
--  out_08 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_08, width=18, real=0
--  out_09 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_09, width=18, real=0
--  out_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_10, width=18, real=0
--  out_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_11, width=18, real=0
--  out_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_12, width=18, real=0
--  out_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_13, width=18, real=0
--  out_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_14, width=18, real=0
--  out_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_15, width=18, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3 is
        port (
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
        out_00 : out std_logic_vector(17 downto 0);
        out_01 : out std_logic_vector(17 downto 0);
        out_02 : out std_logic_vector(17 downto 0);
        out_03 : out std_logic_vector(17 downto 0);
        out_04 : out std_logic_vector(17 downto 0);
        out_05 : out std_logic_vector(17 downto 0);
        out_06 : out std_logic_vector(17 downto 0);
        out_07 : out std_logic_vector(17 downto 0);
        out_08 : out std_logic_vector(17 downto 0);
        out_09 : out std_logic_vector(17 downto 0);
        out_10 : out std_logic_vector(17 downto 0);
        out_11 : out std_logic_vector(17 downto 0);
        out_12 : out std_logic_vector(17 downto 0);
        out_13 : out std_logic_vector(17 downto 0);
        out_14 : out std_logic_vector(17 downto 0);
        out_15 : out std_logic_vector(17 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  In1_s <= Not1_q, width=1, real=0
-- outputs
--  N/C
--  N/C
--  out_00 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_00, width=1, real=0
--  out_01 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_01, width=1, real=0
--  out_02 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_02, width=1, real=0
--  out_03 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_03, width=1, real=0
--  out_04 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_04, width=1, real=0
--  out_05 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_05, width=1, real=0
--  out_06 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_06, width=1, real=0
--  out_07 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_07, width=1, real=0
--  out_08 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_08, width=1, real=0
--  out_09 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_09, width=1, real=0
--  out_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_10, width=1, real=0
--  out_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_11, width=1, real=0
--  out_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_12, width=1, real=0
--  out_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_13, width=1, real=0
--  out_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_14, width=1, real=0
--  out_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_15, width=1, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3 is
        port (
        In1_s : in std_logic_vector(0 downto 0);
        out_00 : out std_logic_vector(0 downto 0);
        out_01 : out std_logic_vector(0 downto 0);
        out_02 : out std_logic_vector(0 downto 0);
        out_03 : out std_logic_vector(0 downto 0);
        out_04 : out std_logic_vector(0 downto 0);
        out_05 : out std_logic_vector(0 downto 0);
        out_06 : out std_logic_vector(0 downto 0);
        out_07 : out std_logic_vector(0 downto 0);
        out_08 : out std_logic_vector(0 downto 0);
        out_09 : out std_logic_vector(0 downto 0);
        out_10 : out std_logic_vector(0 downto 0);
        out_11 : out std_logic_vector(0 downto 0);
        out_12 : out std_logic_vector(0 downto 0);
        out_13 : out std_logic_vector(0 downto 0);
        out_14 : out std_logic_vector(0 downto 0);
        out_15 : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  In1_s <= Not1_q, width=1, real=0
-- outputs
--  N/C
--  N/C
--  out_00 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_00, width=1, real=0
--  out_01 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_01, width=1, real=0
--  out_02 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_02, width=1, real=0
--  out_03 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_03, width=1, real=0
--  out_04 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_04, width=1, real=0
--  out_05 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_05, width=1, real=0
--  out_06 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_06, width=1, real=0
--  out_07 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_07, width=1, real=0
--  out_08 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_08, width=1, real=0
--  out_09 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_09, width=1, real=0
--  out_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_10, width=1, real=0
--  out_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_11, width=1, real=0
--  out_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_12, width=1, real=0
--  out_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_13, width=1, real=0
--  out_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_14, width=1, real=0
--  out_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_15, width=1, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4 is
        port (
        In1_s : in std_logic_vector(0 downto 0);
        out_00 : out std_logic_vector(0 downto 0);
        out_01 : out std_logic_vector(0 downto 0);
        out_02 : out std_logic_vector(0 downto 0);
        out_03 : out std_logic_vector(0 downto 0);
        out_04 : out std_logic_vector(0 downto 0);
        out_05 : out std_logic_vector(0 downto 0);
        out_06 : out std_logic_vector(0 downto 0);
        out_07 : out std_logic_vector(0 downto 0);
        out_08 : out std_logic_vector(0 downto 0);
        out_09 : out std_logic_vector(0 downto 0);
        out_10 : out std_logic_vector(0 downto 0);
        out_11 : out std_logic_vector(0 downto 0);
        out_12 : out std_logic_vector(0 downto 0);
        out_13 : out std_logic_vector(0 downto 0);
        out_14 : out std_logic_vector(0 downto 0);
        out_15 : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_latch_1L component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  e <= In2_s, width=1, real=0
--  d <= In2_s, width=1, real=0
-- outputs
--  N/C
--  N/C
--  q => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_latch_1L_q, width=1, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_latch_1L is
        port (
        e : in std_logic_vector(0 downto 0);
        d : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_0 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_1 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_2 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_3 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_4 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_5 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_6 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_7 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_0 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_1 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_2 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_3 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_4 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_5 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_6 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_7 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_0 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_1 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_2 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_3 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_4 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_5 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_6 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_7 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_0 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_1 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_2 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_3 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_4 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_5 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_6 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_7 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_vin_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_cin_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_0 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_1 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_2 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_3 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_4 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_5 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_6 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_7 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_0 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_1 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_2 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_3 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_4 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_5 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_6 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_7 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_vout_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_cout_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_i1 : std_logic_vector (32 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_i2 : std_logic_vector (32 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_vin : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_cin : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_iout1 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_iout2 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_vout : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_cout : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_i1 : std_logic_vector (32 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_i2 : std_logic_vector (32 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_vin : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_cin : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_iout1 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_iout2 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_vout : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_cout : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_xIn_0 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_gain_i : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_qOut_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_qOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_qOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_eOut_0 : std_logic_vector (0 downto 0);
    signal Const104_q : std_logic_vector (17 downto 0);
    signal Const107_q : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xIn_0 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xOut_0 : std_logic_vector (30 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xOut_1 : std_logic_vector (30 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xIn_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xIn_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_0 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_1 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_2 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_3 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xIn_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xOut_0 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xOut_1 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xIn_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xIn_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_0 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_1 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_2 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_3 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xIn_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xIn_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xIn_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xIn_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_0 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_1 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_2 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_3 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_4 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_5 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_6 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_7 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_0 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_1 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_2 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_3 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_4 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_5 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_6 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_7 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_8 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_9 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_10 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_11 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_12 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_13 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_14 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_15 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_8 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_9 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_10 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_11 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_12 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_13 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_14 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_15 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_0 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_1 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_2 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_3 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_4 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_5 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_6 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_7 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_8 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_9 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_10 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_11 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_12 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_13 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_14 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_15 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_16 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_17 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_18 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_19 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_20 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_21 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_22 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_23 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_24 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_25 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_26 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_27 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_28 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_29 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_30 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_31 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_8 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_9 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_10 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_11 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_12 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_13 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_14 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_15 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_0 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_1 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_2 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_3 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_4 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_5 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_6 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_7 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_8 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_9 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_10 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_11 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_12 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_13 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_14 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_15 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_16 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_17 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_18 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_19 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_20 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_21 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_22 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_23 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_24 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_25 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_26 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_27 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_28 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_29 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_30 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_31 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_xIn_0 : std_logic_vector (30 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_xIn_1 : std_logic_vector (30 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_gain_i : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_qOut_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_qOut_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_qOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_qOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_eOut_0 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_eOut_1 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_xIn_0 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_xIn_1 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_xIn_2 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_xIn_3 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_gain_i : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_eOut_0 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_eOut_1 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_eOut_2 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_eOut_3 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_xIn_0 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_xIn_1 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_gain_i : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_qOut_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_qOut_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_qOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_qOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_eOut_0 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_eOut_1 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_xIn_0 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_xIn_1 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_xIn_2 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_xIn_3 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_gain_i : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_eOut_0 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_eOut_1 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_eOut_2 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_eOut_3 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_0 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_1 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_2 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_3 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_4 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_5 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_6 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_7 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_gain_i : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_0 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_1 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_2 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_3 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_4 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_5 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_6 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_7 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_0 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_1 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_2 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_3 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_4 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_5 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_6 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_7 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_gain_i : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_0 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_1 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_2 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_3 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_4 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_5 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_6 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_7 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_0 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_1 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_2 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_3 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_4 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_5 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_6 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_7 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_8 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_9 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_10 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_11 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_12 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_13 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_14 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_15 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_gain_i : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_8 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_9 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_10 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_11 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_12 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_13 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_14 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_15 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_0 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_1 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_2 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_3 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_4 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_5 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_6 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_7 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_8 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_9 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_10 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_11 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_12 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_13 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_14 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_15 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_0 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_1 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_2 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_3 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_4 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_5 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_6 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_7 : std_logic_vector (29 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_gain_i : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_0 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_1 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_2 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_3 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_4 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_5 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_6 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_7 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_0 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_1 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_2 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_3 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_4 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_5 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_6 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_7 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_8 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_9 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_10 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_11 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_12 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_13 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_14 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_15 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_16 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_17 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_18 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_19 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_20 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_21 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_22 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_23 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_24 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_25 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_26 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_27 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_28 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_29 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_30 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_31 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_gain_i : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_8 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_9 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_10 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_11 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_12 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_13 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_14 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_15 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_16 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_17 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_18 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_19 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_20 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_21 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_22 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_23 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_24 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_25 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_26 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_27 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_28 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_29 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_30 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_31 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_0 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_1 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_2 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_3 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_4 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_5 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_6 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_7 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_8 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_9 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_10 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_11 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_12 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_13 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_14 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_15 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_16 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_17 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_18 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_19 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_20 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_21 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_22 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_23 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_24 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_25 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_26 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_27 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_28 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_29 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_30 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_31 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_0 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_1 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_2 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_3 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_4 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_5 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_6 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_7 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_8 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_9 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_10 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_11 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_12 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_13 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_14 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_15 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_16 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_17 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_18 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_19 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_20 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_21 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_22 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_23 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_24 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_25 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_26 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_27 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_28 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_29 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_30 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_31 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_gain_i : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_8 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_9 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_10 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_11 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_12 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_13 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_14 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_15 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_16 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_17 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_18 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_19 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_20 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_21 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_22 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_23 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_24 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_25 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_26 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_27 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_28 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_29 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_30 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_31 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_0 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_1 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_2 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_3 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_4 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_5 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_6 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_7 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_8 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_9 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_10 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_11 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_12 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_13 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_14 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_15 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_16 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_17 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_18 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_19 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_20 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_21 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_22 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_23 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_24 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_25 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_26 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_27 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_28 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_29 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_30 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_31 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_0 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_1 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_2 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_3 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_4 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_5 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_6 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_7 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_8 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_9 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_10 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_11 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_12 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_13 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_14 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_15 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_16 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_17 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_18 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_19 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_20 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_21 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_22 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_23 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_24 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_25 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_26 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_27 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_28 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_29 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_30 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_31 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_gain_i : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_8 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_9 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_10 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_11 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_12 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_13 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_14 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_15 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_16 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_17 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_18 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_19 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_20 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_21 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_22 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_23 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_24 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_25 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_26 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_27 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_28 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_29 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_30 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_31 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_0 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_1 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_2 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_3 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_4 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_5 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_6 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_7 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_8 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_9 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_10 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_11 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_12 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_13 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_14 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_15 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_16 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_17 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_18 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_19 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_20 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_21 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_22 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_23 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_24 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_25 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_26 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_27 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_28 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_29 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_30 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_31 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_8 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_9 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_10 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_11 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_12 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_13 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_14 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_15 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_0 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_1 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_2 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_3 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_4 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_5 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_6 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_7 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_8 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_9 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_10 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_11 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_12 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_13 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_14 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_15 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_16 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_17 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_18 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_19 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_20 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_21 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_22 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_23 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_24 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_25 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_26 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_27 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_28 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_29 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_30 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_31 : std_logic_vector (33 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_i1 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_i2 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_q1 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_q2 : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_vin : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_cin : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_qout : std_logic_vector (34 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_vout : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_cout : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_In_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_In_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_0 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_1 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_2 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_3 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_4 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_5 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_6 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_7 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_0 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_1 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_2 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_3 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_4 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_5 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_6 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_7 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_0 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_1 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_2 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_3 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_4 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_5 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_6 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_7 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_0 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_1 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_2 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_3 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_4 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_5 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_6 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_7 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_Out_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_Out_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_In_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_In_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_0 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_1 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_2 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_3 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_4 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_5 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_6 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_7 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_0 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_1 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_2 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_3 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_4 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_5 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_6 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_7 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_0 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_1 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_2 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_3 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_4 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_5 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_6 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_7 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_0 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_1 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_2 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_3 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_4 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_5 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_6 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_7 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_Out_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_Out_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_In_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_In_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_0 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_1 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_2 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_3 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_4 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_5 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_6 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_7 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_0 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_1 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_2 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_3 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_4 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_5 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_6 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_7 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_0 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_1 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_2 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_3 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_4 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_5 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_6 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_7 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_0 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_1 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_2 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_3 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_4 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_5 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_6 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_7 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_Out_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_Out_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_iIn_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_iIn_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_qIn_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_qIn_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_In_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_In_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_sIn_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_sIn_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_cIn_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_cIn_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_iOut_0 : std_logic_vector (32 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_iOut_1 : std_logic_vector (32 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_qOut_0 : std_logic_vector (32 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_qOut_1 : std_logic_vector (32 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_Out_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_Out_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_In_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_In_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_0 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_1 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_2 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_3 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_4 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_5 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_6 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_7 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_0 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_1 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_2 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_3 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_4 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_5 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_6 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_7 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_0 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_1 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_2 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_3 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_4 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_5 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_6 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_7 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_0 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_1 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_2 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_3 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_4 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_5 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_6 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_7 : std_logic_vector (28 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_Out_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_Out_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_busIn_d : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_busIn_a : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_busIn_w : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_xIn_p_0 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_xIn_s_0 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_sinOut_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_cosOut_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_ncoOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_ncoOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_busIn_d : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_busIn_a : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_busIn_w : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_0 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_1 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_2 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_3 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_4 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_5 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_6 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_7 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_8 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_9 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_10 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_11 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_12 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_13 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_14 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_15 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_0 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_1 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_2 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_3 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_4 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_5 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_6 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_7 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_8 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_9 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_10 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_11 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_12 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_13 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_14 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_15 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_0 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_1 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_2 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_3 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_4 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_5 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_6 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_7 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_8 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_9 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_10 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_11 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_12 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_13 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_14 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_15 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_0 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_1 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_2 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_3 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_4 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_5 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_6 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_7 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_8 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_9 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_10 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_11 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_12 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_13 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_14 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_15 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_ncoOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_ncoOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_busIn_d : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_busIn_a : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_busIn_w : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_0 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_1 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_2 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_3 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_4 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_5 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_6 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_7 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_8 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_9 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_10 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_11 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_12 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_13 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_14 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_15 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_0 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_1 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_2 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_3 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_4 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_5 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_6 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_7 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_8 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_9 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_10 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_11 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_12 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_13 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_14 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_15 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_0 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_1 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_2 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_3 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_4 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_5 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_6 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_7 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_8 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_9 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_10 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_11 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_12 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_13 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_14 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_15 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_0 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_1 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_2 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_3 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_4 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_5 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_6 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_7 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_8 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_9 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_10 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_11 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_12 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_13 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_14 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_15 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_ncoOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_ncoOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_busIn_d : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_busIn_a : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_busIn_w : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_00 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_01 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_02 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_03 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_04 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_05 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_06 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_07 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_08 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_09 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_10 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_11 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_12 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_13 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_14 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_15 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_busIn_d : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_busIn_a : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_busIn_w : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_00 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_01 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_02 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_03 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_04 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_05 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_06 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_07 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_08 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_09 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_10 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_11 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_12 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_13 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_14 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_15 : std_logic_vector (17 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_In1_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_00 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_01 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_02 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_03 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_04 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_05 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_06 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_07 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_08 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_09 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_10 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_11 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_12 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_13 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_14 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_15 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_In1_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_00 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_01 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_02 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_03 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_04 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_05 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_06 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_07 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_08 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_09 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_10 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_11 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_12 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_13 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_14 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_15 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_latch_1L_e : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_latch_1L_d : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_latch_1L_q : std_logic_vector (0 downto 0);
    signal busReadSelector_q : std_logic_vector (63 downto 0);
    signal busReadSelector_v : std_logic_vector (0 downto 0);
    signal Not1_a : std_logic_vector(0 downto 0);
    signal Not1_q : std_logic_vector(0 downto 0);
begin


	--GND(CONSTANT,0)
    GND_q <= "0";

	--Const107(CONSTANT,10)
    Const107_q <= "00000000";

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--In2_auto(GPIN,77)

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_latch_1L(BLACKBOX,109)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_latch_1L_e <= In2_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_latch_1L_d <= In2_s;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_latch_1L : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_latch_1L port map (
        e => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_latch_1L_e,
        d => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_latch_1L_d,
        q => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_latch_1L_q,
        clk => clk,
        areset => areset
        );

	--Not1(LOGICAL,86)
    Not1_a <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_latch_1L_q;
    Not1_q <= not Not1_a;

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4(BLACKBOX,108)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_In1_s <= Not1_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4 port map (
        In1_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_In1_s,
        out_00 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_00,
        out_01 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_01,
        out_02 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_02,
        out_03 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_03,
        out_04 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_04,
        out_05 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_05,
        out_06 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_06,
        out_07 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_07,
        out_08 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_08,
        out_09 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_09,
        out_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_10,
        out_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_11,
        out_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_12,
        out_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_13,
        out_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_14,
        out_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_15,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3(BLACKBOX,106)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_busIn_d <= busIn_d;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_busIn_a <= busIn_a;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_busIn_w <= busIn_w;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3 port map (
        busIn_d => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_busIn_d,
        busIn_a => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_busIn_a,
        busIn_w => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_busIn_w,
        out_00 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_00,
        out_01 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_01,
        out_02 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_02,
        out_03 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_03,
        out_04 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_04,
        out_05 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_05,
        out_06 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_06,
        out_07 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_07,
        out_08 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_08,
        out_09 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_09,
        out_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_10,
        out_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_11,
        out_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_12,
        out_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_13,
        out_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_14,
        out_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_15,
        clk => clk,
        areset => areset,
        bus_clk => bus_clk,
        bus_areset => bus_areset
        );

	--busIn(BUSIN,110)

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4(BLACKBOX,104)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_busIn_d <= busIn_d;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_busIn_a <= busIn_a;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_busIn_w <= busIn_w;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_c <= Const107_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_v <= VCC_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_00;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_01;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_02;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_03;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_04;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_05;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_06;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_07;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_08;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_09;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_10;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_11;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_12;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_13;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_14;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase3_out_15;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_00;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_01;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_02;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_03;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_04;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_05;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_06;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_07;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_08;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_09;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_10;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_11;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_12;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_13;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_14;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync4_out_15;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4 port map (
        busIn_d => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_busIn_d,
        busIn_a => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_busIn_a,
        busIn_w => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_busIn_w,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_c,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_v,
        xIn_p_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_0,
        xIn_p_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_1,
        xIn_p_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_2,
        xIn_p_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_3,
        xIn_p_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_4,
        xIn_p_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_5,
        xIn_p_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_6,
        xIn_p_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_7,
        xIn_p_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_8,
        xIn_p_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_9,
        xIn_p_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_10,
        xIn_p_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_11,
        xIn_p_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_12,
        xIn_p_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_13,
        xIn_p_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_14,
        xIn_p_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_p_15,
        xIn_s_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_0,
        xIn_s_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_1,
        xIn_s_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_2,
        xIn_s_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_3,
        xIn_s_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_4,
        xIn_s_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_5,
        xIn_s_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_6,
        xIn_s_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_7,
        xIn_s_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_8,
        xIn_s_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_9,
        xIn_s_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_10,
        xIn_s_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_11,
        xIn_s_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_12,
        xIn_s_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_13,
        xIn_s_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_14,
        xIn_s_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_xIn_s_15,
        sinOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_0,
        sinOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_1,
        sinOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_2,
        sinOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_3,
        sinOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_4,
        sinOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_5,
        sinOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_6,
        sinOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_7,
        sinOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_8,
        sinOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_9,
        sinOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_10,
        sinOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_11,
        sinOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_12,
        sinOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_13,
        sinOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_14,
        sinOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_15,
        cosOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_0,
        cosOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_1,
        cosOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_2,
        cosOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_3,
        cosOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_4,
        cosOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_5,
        cosOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_6,
        cosOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_7,
        cosOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_8,
        cosOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_9,
        cosOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_10,
        cosOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_11,
        cosOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_12,
        cosOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_13,
        cosOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_14,
        cosOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_15,
        ncoOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_ncoOut_v,
        ncoOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_ncoOut_c,
        clk => clk,
        areset => areset,
        bus_clk => bus_clk,
        bus_areset => bus_areset
        );

	--Const104(CONSTANT,8)
    Const104_q <= "000000000000000000";

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3(BLACKBOX,85)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_busIn_d <= busIn_d;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_busIn_a <= busIn_a;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_busIn_w <= busIn_w;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_c;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_v;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_xIn_p_0 <= Const104_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_xIn_s_0 <= GND_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3 port map (
        busIn_d => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_busIn_d,
        busIn_a => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_busIn_a,
        busIn_w => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_busIn_w,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_xIn_c,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_xIn_v,
        xIn_p_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_xIn_p_0,
        xIn_s_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_xIn_s_0,
        sinOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_sinOut_0,
        cosOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_cosOut_0,
        ncoOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_ncoOut_v,
        ncoOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_ncoOut_c,
        clk => clk,
        areset => areset,
        bus_clk => bus_clk,
        bus_areset => bus_areset
        );

	--In3_auto(GPIN,78)

	--In1_auto(GPIN,76)

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17(BLACKBOX,56)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xIn_0 <= In1_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xIn_v <= In2_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xIn_c <= In3_s;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xIn_0,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xIn_c,
        xOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xOut_0,
        xOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xOut_1,
        xOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xOut_v,
        xOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xOut_c,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2(BLACKBOX,64)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xOut_v;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR17_xOut_c;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_gain_i <= GND_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_xIn_0,
        xIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_xIn_1,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_xIn_c,
        gain_i => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_gain_i,
        qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_qOut_0,
        qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_qOut_1,
        qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_qOut_v,
        qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_qOut_c,
        eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_eOut_0,
        eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_eOut_1,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18(BLACKBOX,57)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_qOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_qOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_qOut_v;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR2Scale2_qOut_c;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xIn_0,
        xIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xIn_1,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xIn_c,
        xOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_0,
        xOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_1,
        xOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_2,
        xOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_3,
        xOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_v,
        xOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_c,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2(BLACKBOX,65)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_v;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR18_xOut_c;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_gain_i <= GND_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_xIn_0,
        xIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_xIn_1,
        xIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_xIn_2,
        xIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_xIn_3,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_xIn_c,
        gain_i => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_gain_i,
        qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_0,
        qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_1,
        qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_2,
        qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_3,
        qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_v,
        qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_c,
        eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_eOut_0,
        eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_eOut_1,
        eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_eOut_2,
        eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_eOut_3,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8(BLACKBOX,83)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_iIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_iIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_qIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_qIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_In_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_v;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_In_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR3Scale2_qOut_c;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_sIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_sinOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_sIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_sinOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_cIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_cosOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_cIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_NCO_FDD3_cosOut_0;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8 port map (
        iIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_iIn_0,
        iIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_iIn_1,
        qIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_qIn_0,
        qIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_qIn_1,
        In_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_In_v,
        In_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_In_c,
        sIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_sIn_0,
        sIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_sIn_1,
        cIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_cIn_0,
        cIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_cIn_1,
        iOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_iOut_0,
        iOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_iOut_1,
        qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_qOut_0,
        qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_qOut_1,
        Out_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_Out_v,
        Out_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_Out_c,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3(BLACKBOX,4)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_i1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_qOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_i2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_qOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_vin <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_Out_v;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_cin <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_Out_c;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3 port map (
        i1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_i1,
        i2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_i2,
        vin => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_vin,
        cin => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_cin,
        iout1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_iout1,
        iout2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_iout2,
        vout => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_vout,
        cout => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_cout,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3(BLACKBOX,3)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_i1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_iOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_i2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_iOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_vin <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_Out_v;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_cin <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer8_Out_c;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3 port map (
        i1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_i1,
        i2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_i2,
        vin => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_vin,
        cin => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_cin,
        iout1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_iout1,
        iout2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_iout2,
        vout => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_vout,
        cout => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_cout,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3(BLACKBOX,79)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_i1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_iout1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_i2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_iout2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_q1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_iout1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_q2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumQ3_iout2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_vin <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_vout;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_cin <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumI3_cout;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3 port map (
        i1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_i1,
        i2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_i2,
        q1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_q1,
        q2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_q2,
        vin => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_vin,
        cin => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_cin,
        qout => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_qout,
        vout => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_vout,
        cout => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_cout,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3(BLACKBOX,5)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_qout;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_vout;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Interleaver3_cout;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_gain_i <= GND_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_xIn_0,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_xIn_c,
        gain_i => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_gain_i,
        qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_qOut_0,
        qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_qOut_v,
        qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_qOut_c,
        eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_eOut_0,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19(BLACKBOX,58)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_qOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_qOut_v;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_CarrierSumScale3_qOut_c;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xIn_0,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xIn_c,
        xOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xOut_0,
        xOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xOut_1,
        xOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xOut_v,
        xOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xOut_c,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2(BLACKBOX,66)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xOut_v;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR19_xOut_c;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_gain_i <= GND_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_xIn_0,
        xIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_xIn_1,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_xIn_c,
        gain_i => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_gain_i,
        qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_qOut_0,
        qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_qOut_1,
        qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_qOut_v,
        qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_qOut_c,
        eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_eOut_0,
        eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_eOut_1,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20(BLACKBOX,59)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_qOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_qOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_qOut_v;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR4Scale2_qOut_c;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xIn_0,
        xIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xIn_1,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xIn_c,
        xOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_0,
        xOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_1,
        xOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_2,
        xOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_3,
        xOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_v,
        xOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_c,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2(BLACKBOX,67)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_v;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR20_xOut_c;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_gain_i <= GND_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_xIn_0,
        xIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_xIn_1,
        xIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_xIn_2,
        xIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_xIn_3,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_xIn_c,
        gain_i => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_gain_i,
        qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_0,
        qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_1,
        qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_2,
        qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_3,
        qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_v,
        qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_c,
        eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_eOut_0,
        eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_eOut_1,
        eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_eOut_2,
        eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_eOut_3,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21(BLACKBOX,60)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_v;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR5Scale2_qOut_c;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xIn_0,
        xIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xIn_1,
        xIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xIn_2,
        xIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xIn_3,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xIn_c,
        xOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_0,
        xOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_1,
        xOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_2,
        xOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_3,
        xOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_4,
        xOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_5,
        xOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_6,
        xOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_7,
        xOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_v,
        xOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_c,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2(BLACKBOX,68)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR21_xOut_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_v <= VCC_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_c <= Const107_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_gain_i <= GND_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_0,
        xIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_1,
        xIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_2,
        xIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_3,
        xIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_4,
        xIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_5,
        xIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_6,
        xIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_7,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_xIn_c,
        gain_i => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_gain_i,
        qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_0,
        qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_1,
        qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_2,
        qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_3,
        qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_4,
        qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_5,
        qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_6,
        qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_7,
        qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_v,
        qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_c,
        eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_0,
        eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_1,
        eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_2,
        eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_3,
        eOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_4,
        eOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_5,
        eOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_6,
        eOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_eOut_7,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22(BLACKBOX,61)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR6Scale2_qOut_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_v <= VCC_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_c <= Const107_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_0,
        xIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_1,
        xIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_2,
        xIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_3,
        xIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_4,
        xIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_5,
        xIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_6,
        xIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_7,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xIn_c,
        xOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_0,
        xOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_1,
        xOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_2,
        xOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_3,
        xOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_4,
        xOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_5,
        xOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_6,
        xOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_7,
        xOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_8,
        xOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_9,
        xOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_10,
        xOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_11,
        xOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_12,
        xOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_13,
        xOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_14,
        xOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_15,
        xOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_v,
        xOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_c,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2(BLACKBOX,70)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_8;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_9;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_10;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_11;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_12;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_13;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_14;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR22_xOut_15;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_v <= VCC_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_c <= Const107_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_gain_i <= GND_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_0,
        xIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_1,
        xIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_2,
        xIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_3,
        xIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_4,
        xIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_5,
        xIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_6,
        xIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_7,
        xIn_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_8,
        xIn_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_9,
        xIn_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_10,
        xIn_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_11,
        xIn_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_12,
        xIn_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_13,
        xIn_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_14,
        xIn_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_15,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_xIn_c,
        gain_i => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_gain_i,
        qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_0,
        qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_1,
        qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_2,
        qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_3,
        qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_4,
        qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_5,
        qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_6,
        qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_7,
        qOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_8,
        qOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_9,
        qOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_10,
        qOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_11,
        qOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_12,
        qOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_13,
        qOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_14,
        qOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_15,
        qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_v,
        qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_c,
        eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_0,
        eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_1,
        eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_2,
        eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_3,
        eOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_4,
        eOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_5,
        eOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_6,
        eOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_7,
        eOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_8,
        eOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_9,
        eOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_10,
        eOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_11,
        eOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_12,
        eOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_13,
        eOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_14,
        eOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_eOut_15,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23(BLACKBOX,62)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_8;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_9;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_10;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_11;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_12;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_13;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_14;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale2_qOut_15;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_v <= VCC_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_c <= Const107_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_0,
        xIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_1,
        xIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_2,
        xIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_3,
        xIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_4,
        xIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_5,
        xIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_6,
        xIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_7,
        xIn_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_8,
        xIn_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_9,
        xIn_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_10,
        xIn_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_11,
        xIn_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_12,
        xIn_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_13,
        xIn_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_14,
        xIn_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_15,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xIn_c,
        xOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_0,
        xOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_1,
        xOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_2,
        xOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_3,
        xOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_4,
        xOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_5,
        xOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_6,
        xOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_7,
        xOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_8,
        xOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_9,
        xOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_10,
        xOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_11,
        xOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_12,
        xOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_13,
        xOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_14,
        xOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_15,
        xOut_16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_16,
        xOut_17 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_17,
        xOut_18 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_18,
        xOut_19 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_19,
        xOut_20 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_20,
        xOut_21 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_21,
        xOut_22 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_22,
        xOut_23 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_23,
        xOut_24 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_24,
        xOut_25 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_25,
        xOut_26 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_26,
        xOut_27 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_27,
        xOut_28 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_28,
        xOut_29 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_29,
        xOut_30 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_30,
        xOut_31 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_31,
        xOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_v,
        xOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_c,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2(BLACKBOX,72)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_8;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_9;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_10;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_11;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_12;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_13;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_14;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_15;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_16 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_16;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_17 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_17;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_18 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_18;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_19 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_19;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_20 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_20;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_21 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_21;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_22 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_22;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_23 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_23;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_24 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_24;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_25 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_25;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_26 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_26;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_27 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_27;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_28 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_28;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_29 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_29;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_30 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_30;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_31 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR23_xOut_31;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_v <= VCC_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_c <= Const107_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_gain_i <= GND_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_0,
        xIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_1,
        xIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_2,
        xIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_3,
        xIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_4,
        xIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_5,
        xIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_6,
        xIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_7,
        xIn_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_8,
        xIn_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_9,
        xIn_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_10,
        xIn_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_11,
        xIn_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_12,
        xIn_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_13,
        xIn_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_14,
        xIn_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_15,
        xIn_16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_16,
        xIn_17 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_17,
        xIn_18 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_18,
        xIn_19 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_19,
        xIn_20 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_20,
        xIn_21 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_21,
        xIn_22 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_22,
        xIn_23 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_23,
        xIn_24 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_24,
        xIn_25 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_25,
        xIn_26 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_26,
        xIn_27 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_27,
        xIn_28 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_28,
        xIn_29 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_29,
        xIn_30 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_30,
        xIn_31 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_31,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_xIn_c,
        gain_i => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_gain_i,
        qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_0,
        qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_1,
        qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_2,
        qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_3,
        qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_4,
        qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_5,
        qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_6,
        qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_7,
        qOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_8,
        qOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_9,
        qOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_10,
        qOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_11,
        qOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_12,
        qOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_13,
        qOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_14,
        qOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_15,
        qOut_16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_16,
        qOut_17 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_17,
        qOut_18 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_18,
        qOut_19 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_19,
        qOut_20 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_20,
        qOut_21 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_21,
        qOut_22 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_22,
        qOut_23 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_23,
        qOut_24 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_24,
        qOut_25 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_25,
        qOut_26 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_26,
        qOut_27 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_27,
        qOut_28 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_28,
        qOut_29 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_29,
        qOut_30 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_30,
        qOut_31 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_31,
        qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_v,
        qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_c,
        eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_0,
        eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_1,
        eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_2,
        eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_3,
        eOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_4,
        eOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_5,
        eOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_6,
        eOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_7,
        eOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_8,
        eOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_9,
        eOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_10,
        eOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_11,
        eOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_12,
        eOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_13,
        eOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_14,
        eOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_15,
        eOut_16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_16,
        eOut_17 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_17,
        eOut_18 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_18,
        eOut_19 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_19,
        eOut_20 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_20,
        eOut_21 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_21,
        eOut_22 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_22,
        eOut_23 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_23,
        eOut_24 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_24,
        eOut_25 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_25,
        eOut_26 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_26,
        eOut_27 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_27,
        eOut_28 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_28,
        eOut_29 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_29,
        eOut_30 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_30,
        eOut_31 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_eOut_31,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1(BLACKBOX,75)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_8;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_9;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_10;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_11;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_12;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_13;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_14;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_15;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_24;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_25;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_26;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_27;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_28;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_29;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_30;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_31;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_v <= VCC_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_c <= Const107_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_0,
        xIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_1,
        xIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_2,
        xIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_3,
        xIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_4,
        xIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_5,
        xIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_6,
        xIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_7,
        xIn_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_8,
        xIn_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_9,
        xIn_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_10,
        xIn_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_11,
        xIn_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_12,
        xIn_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_13,
        xIn_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_14,
        xIn_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_15,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xIn_c,
        xOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_0,
        xOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_1,
        xOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_2,
        xOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_3,
        xOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_4,
        xOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_5,
        xOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_6,
        xOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_7,
        xOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_8,
        xOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_9,
        xOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_10,
        xOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_11,
        xOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_12,
        xOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_13,
        xOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_14,
        xOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_15,
        xOut_16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_16,
        xOut_17 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_17,
        xOut_18 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_18,
        xOut_19 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_19,
        xOut_20 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_20,
        xOut_21 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_21,
        xOut_22 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_22,
        xOut_23 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_23,
        xOut_24 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_24,
        xOut_25 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_25,
        xOut_26 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_26,
        xOut_27 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_27,
        xOut_28 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_28,
        xOut_29 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_29,
        xOut_30 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_30,
        xOut_31 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_31,
        xOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_v,
        xOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_c,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4(BLACKBOX,74)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_8;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_9;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_10;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_11;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_12;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_13;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_14;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_15;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_16 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_16;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_17 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_17;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_18 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_18;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_19 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_19;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_20 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_20;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_21 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_21;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_22 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_22;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_23 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_23;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_24 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_24;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_25 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_25;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_26 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_26;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_27 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_27;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_28 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_28;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_29 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_29;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_30 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_30;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_31 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9a1_xOut_31;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_v <= VCC_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_c <= Const107_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_gain_i <= GND_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_0,
        xIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_1,
        xIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_2,
        xIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_3,
        xIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_4,
        xIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_5,
        xIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_6,
        xIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_7,
        xIn_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_8,
        xIn_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_9,
        xIn_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_10,
        xIn_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_11,
        xIn_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_12,
        xIn_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_13,
        xIn_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_14,
        xIn_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_15,
        xIn_16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_16,
        xIn_17 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_17,
        xIn_18 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_18,
        xIn_19 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_19,
        xIn_20 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_20,
        xIn_21 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_21,
        xIn_22 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_22,
        xIn_23 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_23,
        xIn_24 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_24,
        xIn_25 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_25,
        xIn_26 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_26,
        xIn_27 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_27,
        xIn_28 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_28,
        xIn_29 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_29,
        xIn_30 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_30,
        xIn_31 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_31,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_xIn_c,
        gain_i => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_gain_i,
        qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_0,
        qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_1,
        qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_2,
        qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_3,
        qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_4,
        qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_5,
        qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_6,
        qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_7,
        qOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_8,
        qOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_9,
        qOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_10,
        qOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_11,
        qOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_12,
        qOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_13,
        qOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_14,
        qOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_15,
        qOut_16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_16,
        qOut_17 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_17,
        qOut_18 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_18,
        qOut_19 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_19,
        qOut_20 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_20,
        qOut_21 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_21,
        qOut_22 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_22,
        qOut_23 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_23,
        qOut_24 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_24,
        qOut_25 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_25,
        qOut_26 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_26,
        qOut_27 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_27,
        qOut_28 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_28,
        qOut_29 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_29,
        qOut_30 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_30,
        qOut_31 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_31,
        qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_v,
        qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_c,
        eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_0,
        eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_1,
        eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_2,
        eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_3,
        eOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_4,
        eOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_5,
        eOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_6,
        eOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_7,
        eOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_8,
        eOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_9,
        eOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_10,
        eOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_11,
        eOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_12,
        eOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_13,
        eOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_14,
        eOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_15,
        eOut_16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_16,
        eOut_17 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_17,
        eOut_18 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_18,
        eOut_19 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_19,
        eOut_20 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_20,
        eOut_21 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_21,
        eOut_22 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_22,
        eOut_23 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_23,
        eOut_24 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_24,
        eOut_25 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_25,
        eOut_26 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_26,
        eOut_27 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_27,
        eOut_28 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_28,
        eOut_29 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_29,
        eOut_30 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_30,
        eOut_31 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_eOut_31,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12(BLACKBOX,82)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_8;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_9;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_10;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_11;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_12;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_13;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_14;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_15;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_24;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_25;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_26;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_27;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_28;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_29;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_30;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_31;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_In_v <= VCC_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_In_c <= Const107_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_8;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_9;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_10;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_11;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_12;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_13;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_14;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_15;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_8;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_9;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_10;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_11;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_12;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_13;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_14;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_15;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12 port map (
        iIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_0,
        iIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_1,
        iIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_2,
        iIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_3,
        iIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_4,
        iIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_5,
        iIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_6,
        iIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iIn_7,
        qIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_0,
        qIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_1,
        qIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_2,
        qIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_3,
        qIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_4,
        qIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_5,
        qIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_6,
        qIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qIn_7,
        In_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_In_v,
        In_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_In_c,
        sIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_0,
        sIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_1,
        sIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_2,
        sIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_3,
        sIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_4,
        sIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_5,
        sIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_6,
        sIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_sIn_7,
        cIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_0,
        cIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_1,
        cIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_2,
        cIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_3,
        cIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_4,
        cIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_5,
        cIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_6,
        cIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_cIn_7,
        iOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_0,
        iOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_1,
        iOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_2,
        iOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_3,
        iOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_4,
        iOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_5,
        iOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_6,
        iOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_7,
        qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_0,
        qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_1,
        qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_2,
        qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_3,
        qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_4,
        qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_5,
        qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_6,
        qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_qOut_7,
        Out_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_Out_v,
        Out_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_Out_c,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3(BLACKBOX,107)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_In1_s <= Not1_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3 port map (
        In1_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_In1_s,
        out_00 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_00,
        out_01 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_01,
        out_02 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_02,
        out_03 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_03,
        out_04 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_04,
        out_05 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_05,
        out_06 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_06,
        out_07 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_07,
        out_08 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_08,
        out_09 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_09,
        out_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_10,
        out_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_11,
        out_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_12,
        out_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_13,
        out_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_14,
        out_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_15,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2(BLACKBOX,105)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_busIn_d <= busIn_d;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_busIn_a <= busIn_a;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_busIn_w <= busIn_w;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2 port map (
        busIn_d => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_busIn_d,
        busIn_a => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_busIn_a,
        busIn_w => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_busIn_w,
        out_00 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_00,
        out_01 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_01,
        out_02 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_02,
        out_03 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_03,
        out_04 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_04,
        out_05 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_05,
        out_06 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_06,
        out_07 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_07,
        out_08 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_08,
        out_09 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_09,
        out_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_10,
        out_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_11,
        out_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_12,
        out_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_13,
        out_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_14,
        out_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_15,
        clk => clk,
        areset => areset,
        bus_clk => bus_clk,
        bus_areset => bus_areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3(BLACKBOX,103)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_busIn_d <= busIn_d;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_busIn_a <= busIn_a;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_busIn_w <= busIn_w;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_c <= Const107_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_v <= VCC_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_00;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_01;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_02;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_03;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_04;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_05;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_06;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_07;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_08;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_09;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_10;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_11;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_12;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_13;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_14;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_phase2_out_15;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_00;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_01;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_02;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_03;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_04;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_05;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_06;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_07;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_08;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_09;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_10;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_11;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_12;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_13;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_14;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3_out_15;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3 port map (
        busIn_d => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_busIn_d,
        busIn_a => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_busIn_a,
        busIn_w => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_busIn_w,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_c,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_v,
        xIn_p_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_0,
        xIn_p_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_1,
        xIn_p_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_2,
        xIn_p_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_3,
        xIn_p_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_4,
        xIn_p_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_5,
        xIn_p_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_6,
        xIn_p_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_7,
        xIn_p_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_8,
        xIn_p_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_9,
        xIn_p_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_10,
        xIn_p_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_11,
        xIn_p_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_12,
        xIn_p_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_13,
        xIn_p_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_14,
        xIn_p_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_p_15,
        xIn_s_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_0,
        xIn_s_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_1,
        xIn_s_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_2,
        xIn_s_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_3,
        xIn_s_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_4,
        xIn_s_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_5,
        xIn_s_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_6,
        xIn_s_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_7,
        xIn_s_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_8,
        xIn_s_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_9,
        xIn_s_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_10,
        xIn_s_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_11,
        xIn_s_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_12,
        xIn_s_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_13,
        xIn_s_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_14,
        xIn_s_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_xIn_s_15,
        sinOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_0,
        sinOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_1,
        sinOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_2,
        sinOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_3,
        sinOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_4,
        sinOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_5,
        sinOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_6,
        sinOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_7,
        sinOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_8,
        sinOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_9,
        sinOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_10,
        sinOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_11,
        sinOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_12,
        sinOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_13,
        sinOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_14,
        sinOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_15,
        cosOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_0,
        cosOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_1,
        cosOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_2,
        cosOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_3,
        cosOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_4,
        cosOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_5,
        cosOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_6,
        cosOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_7,
        cosOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_8,
        cosOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_9,
        cosOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_10,
        cosOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_11,
        cosOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_12,
        cosOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_13,
        cosOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_14,
        cosOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_15,
        ncoOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_ncoOut_v,
        ncoOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_ncoOut_c,
        clk => clk,
        areset => areset,
        bus_clk => bus_clk,
        bus_areset => bus_areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24(BLACKBOX,63)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_16;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_17;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_18;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_19;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_20;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_21;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_22;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR8Scale2_qOut_23;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_v <= VCC_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_c <= Const107_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_0,
        xIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_1,
        xIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_2,
        xIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_3,
        xIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_4,
        xIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_5,
        xIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_6,
        xIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_7,
        xIn_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_8,
        xIn_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_9,
        xIn_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_10,
        xIn_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_11,
        xIn_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_12,
        xIn_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_13,
        xIn_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_14,
        xIn_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_15,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xIn_c,
        xOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_0,
        xOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_1,
        xOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_2,
        xOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_3,
        xOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_4,
        xOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_5,
        xOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_6,
        xOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_7,
        xOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_8,
        xOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_9,
        xOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_10,
        xOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_11,
        xOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_12,
        xOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_13,
        xOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_14,
        xOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_15,
        xOut_16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_16,
        xOut_17 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_17,
        xOut_18 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_18,
        xOut_19 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_19,
        xOut_20 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_20,
        xOut_21 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_21,
        xOut_22 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_22,
        xOut_23 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_23,
        xOut_24 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_24,
        xOut_25 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_25,
        xOut_26 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_26,
        xOut_27 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_27,
        xOut_28 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_28,
        xOut_29 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_29,
        xOut_30 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_30,
        xOut_31 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_31,
        xOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_v,
        xOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_c,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3(BLACKBOX,73)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_8;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_9;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_10;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_11;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_12;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_13;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_14;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_15;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_16 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_16;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_17 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_17;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_18 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_18;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_19 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_19;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_20 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_20;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_21 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_21;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_22 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_22;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_23 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_23;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_24 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_24;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_25 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_25;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_26 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_26;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_27 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_27;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_28 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_28;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_29 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_29;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_30 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_30;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_31 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR24_xOut_31;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_v <= VCC_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_c <= Const107_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_gain_i <= GND_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_0,
        xIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_1,
        xIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_2,
        xIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_3,
        xIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_4,
        xIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_5,
        xIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_6,
        xIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_7,
        xIn_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_8,
        xIn_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_9,
        xIn_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_10,
        xIn_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_11,
        xIn_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_12,
        xIn_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_13,
        xIn_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_14,
        xIn_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_15,
        xIn_16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_16,
        xIn_17 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_17,
        xIn_18 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_18,
        xIn_19 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_19,
        xIn_20 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_20,
        xIn_21 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_21,
        xIn_22 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_22,
        xIn_23 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_23,
        xIn_24 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_24,
        xIn_25 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_25,
        xIn_26 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_26,
        xIn_27 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_27,
        xIn_28 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_28,
        xIn_29 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_29,
        xIn_30 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_30,
        xIn_31 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_31,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_xIn_c,
        gain_i => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_gain_i,
        qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_0,
        qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_1,
        qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_2,
        qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_3,
        qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_4,
        qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_5,
        qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_6,
        qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_7,
        qOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_8,
        qOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_9,
        qOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_10,
        qOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_11,
        qOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_12,
        qOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_13,
        qOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_14,
        qOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_15,
        qOut_16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_16,
        qOut_17 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_17,
        qOut_18 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_18,
        qOut_19 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_19,
        qOut_20 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_20,
        qOut_21 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_21,
        qOut_22 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_22,
        qOut_23 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_23,
        qOut_24 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_24,
        qOut_25 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_25,
        qOut_26 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_26,
        qOut_27 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_27,
        qOut_28 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_28,
        qOut_29 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_29,
        qOut_30 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_30,
        qOut_31 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_31,
        qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_v,
        qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_c,
        eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_0,
        eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_1,
        eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_2,
        eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_3,
        eOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_4,
        eOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_5,
        eOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_6,
        eOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_7,
        eOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_8,
        eOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_9,
        eOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_10,
        eOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_11,
        eOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_12,
        eOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_13,
        eOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_14,
        eOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_15,
        eOut_16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_16,
        eOut_17 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_17,
        eOut_18 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_18,
        eOut_19 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_19,
        eOut_20 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_20,
        eOut_21 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_21,
        eOut_22 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_22,
        eOut_23 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_23,
        eOut_24 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_24,
        eOut_25 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_25,
        eOut_26 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_26,
        eOut_27 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_27,
        eOut_28 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_28,
        eOut_29 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_29,
        eOut_30 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_30,
        eOut_31 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_eOut_31,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10(BLACKBOX,80)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_8;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_9;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_10;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_11;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_12;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_13;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_14;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_15;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_24;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_25;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_26;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_27;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_28;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_29;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_30;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_31;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_In_v <= VCC_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_In_c <= Const107_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_8;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_9;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_10;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_11;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_12;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_13;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_14;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_15;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_8;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_9;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_10;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_11;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_12;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_13;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_14;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_15;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10 port map (
        iIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_0,
        iIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_1,
        iIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_2,
        iIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_3,
        iIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_4,
        iIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_5,
        iIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_6,
        iIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iIn_7,
        qIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_0,
        qIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_1,
        qIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_2,
        qIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_3,
        qIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_4,
        qIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_5,
        qIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_6,
        qIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qIn_7,
        In_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_In_v,
        In_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_In_c,
        sIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_0,
        sIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_1,
        sIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_2,
        sIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_3,
        sIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_4,
        sIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_5,
        sIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_6,
        sIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_sIn_7,
        cIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_0,
        cIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_1,
        cIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_2,
        cIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_3,
        cIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_4,
        cIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_5,
        cIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_6,
        cIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_cIn_7,
        iOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_0,
        iOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_1,
        iOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_2,
        iOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_3,
        iOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_4,
        iOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_5,
        iOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_6,
        iOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_7,
        qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_0,
        qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_1,
        qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_2,
        qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_3,
        qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_4,
        qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_5,
        qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_6,
        qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_qOut_7,
        Out_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_Out_v,
        Out_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_Out_c,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11(BLACKBOX,81)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_16;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_17;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_18;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_19;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_20;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_21;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_22;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale4_qOut_23;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_In_v <= VCC_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_In_c <= Const107_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_sinOut_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier4_cosOut_7;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11 port map (
        iIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_0,
        iIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_1,
        iIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_2,
        iIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_3,
        iIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_4,
        iIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_5,
        iIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_6,
        iIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iIn_7,
        qIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_0,
        qIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_1,
        qIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_2,
        qIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_3,
        qIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_4,
        qIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_5,
        qIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_6,
        qIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qIn_7,
        In_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_In_v,
        In_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_In_c,
        sIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_0,
        sIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_1,
        sIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_2,
        sIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_3,
        sIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_4,
        sIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_5,
        sIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_6,
        sIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_sIn_7,
        cIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_0,
        cIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_1,
        cIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_2,
        cIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_3,
        cIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_4,
        cIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_5,
        cIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_6,
        cIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_cIn_7,
        iOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_0,
        iOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_1,
        iOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_2,
        iOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_3,
        iOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_4,
        iOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_5,
        iOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_6,
        iOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_7,
        qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_0,
        qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_1,
        qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_2,
        qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_3,
        qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_4,
        qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_5,
        qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_6,
        qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_qOut_7,
        Out_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_Out_v,
        Out_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_Out_c,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9(BLACKBOX,84)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_16;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_17;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_18;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_19;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_20;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_21;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_22;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR9Scale3_qOut_23;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_In_v <= VCC_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_In_c <= Const107_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_sinOut_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_carrier3_cosOut_7;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9 port map (
        iIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_0,
        iIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_1,
        iIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_2,
        iIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_3,
        iIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_4,
        iIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_5,
        iIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_6,
        iIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iIn_7,
        qIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_0,
        qIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_1,
        qIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_2,
        qIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_3,
        qIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_4,
        qIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_5,
        qIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_6,
        qIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qIn_7,
        In_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_In_v,
        In_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_In_c,
        sIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_0,
        sIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_1,
        sIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_2,
        sIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_3,
        sIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_4,
        sIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_5,
        sIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_6,
        sIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_sIn_7,
        cIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_0,
        cIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_1,
        cIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_2,
        cIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_3,
        cIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_4,
        cIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_5,
        cIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_6,
        cIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_cIn_7,
        iOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_0,
        iOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_1,
        iOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_2,
        iOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_3,
        iOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_4,
        iOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_5,
        iOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_6,
        iOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_7,
        qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_0,
        qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_1,
        qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_2,
        qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_3,
        qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_4,
        qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_5,
        qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_6,
        qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_qOut_7,
        Out_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_Out_v,
        Out_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_Out_c,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1(BLACKBOX,2)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer9_iOut_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer11_iOut_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer10_iOut_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Mixer12_iOut_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_vin_s <= VCC_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_cin_s <= Const107_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1 port map (
        band0_a_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_0,
        band0_a_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_1,
        band0_a_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_2,
        band0_a_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_3,
        band0_a_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_4,
        band0_a_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_5,
        band0_a_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_6,
        band0_a_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_a_7,
        band1_a_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_0,
        band1_a_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_1,
        band1_a_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_2,
        band1_a_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_3,
        band1_a_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_4,
        band1_a_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_5,
        band1_a_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_6,
        band1_a_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_a_7,
        band0_b_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_0,
        band0_b_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_1,
        band0_b_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_2,
        band0_b_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_3,
        band0_b_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_4,
        band0_b_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_5,
        band0_b_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_6,
        band0_b_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band0_b_7,
        band1_b_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_0,
        band1_b_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_1,
        band1_b_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_2,
        band1_b_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_3,
        band1_b_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_4,
        band1_b_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_5,
        band1_b_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_6,
        band1_b_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_band1_b_7,
        vin_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_vin_s,
        cin_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_cin_s,
        a_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_0,
        a_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_1,
        a_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_2,
        a_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_3,
        a_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_4,
        a_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_5,
        a_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_6,
        a_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_7,
        b_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_0,
        b_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_1,
        b_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_2,
        b_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_3,
        b_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_4,
        b_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_5,
        b_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_6,
        b_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_7,
        vout_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_vout_s,
        cout_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_cout_s,
        clk => clk,
        areset => areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1(BLACKBOX,69)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_b_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_v <= VCC_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_c <= Const107_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_gain_i <= GND_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_0,
        xIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_1,
        xIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_2,
        xIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_3,
        xIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_4,
        xIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_5,
        xIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_6,
        xIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_7,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_xIn_c,
        gain_i => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_gain_i,
        qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_0,
        qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_1,
        qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_2,
        qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_3,
        qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_4,
        qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_5,
        qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_6,
        qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_7,
        qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_v,
        qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_c,
        eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_0,
        eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_1,
        eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_2,
        eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_3,
        eOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_4,
        eOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_5,
        eOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_6,
        eOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_eOut_7,
        clk => clk,
        areset => areset
        );

	--u0_Out1_auto_re(GPOUT,87)
    Out1_0re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_0;


	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3(BLACKBOX,71)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_BandSummer1_a_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_v <= VCC_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_c <= Const107_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_gain_i <= GND_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_0,
        xIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_1,
        xIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_2,
        xIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_3,
        xIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_4,
        xIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_5,
        xIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_6,
        xIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_7,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_xIn_c,
        gain_i => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_gain_i,
        qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_0,
        qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_1,
        qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_2,
        qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_3,
        qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_4,
        qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_5,
        qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_6,
        qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_7,
        qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_v,
        qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_c,
        eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_0,
        eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_1,
        eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_2,
        eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_3,
        eOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_4,
        eOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_5,
        eOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_6,
        eOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_eOut_7,
        clk => clk,
        areset => areset
        );

	--u0_Out1_auto_im(GPOUT,88)
    Out1_0im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_0;


	--u1_Out1_auto_re(GPOUT,89)
    Out1_1re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_1;


	--u1_Out1_auto_im(GPOUT,90)
    Out1_1im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_1;


	--u2_Out1_auto_re(GPOUT,91)
    Out1_2re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_2;


	--u2_Out1_auto_im(GPOUT,92)
    Out1_2im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_2;


	--u3_Out1_auto_re(GPOUT,93)
    Out1_3re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_3;


	--u3_Out1_auto_im(GPOUT,94)
    Out1_3im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_3;


	--u4_Out1_auto_re(GPOUT,95)
    Out1_4re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_4;


	--u4_Out1_auto_im(GPOUT,96)
    Out1_4im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_4;


	--u5_Out1_auto_re(GPOUT,97)
    Out1_5re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_5;


	--u5_Out1_auto_im(GPOUT,98)
    Out1_5im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_5;


	--u6_Out1_auto_re(GPOUT,99)
    Out1_6re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_6;


	--u6_Out1_auto_im(GPOUT,100)
    Out1_6im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_6;


	--u7_Out1_auto_re(GPOUT,101)
    Out1_7re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale1_qOut_7;


	--u7_Out1_auto_im(GPOUT,102)
    Out1_7im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_FIR7Scale3_qOut_7;


	--busReadSelector(SELECTOR,111)
    busReadSelector_q <= (others => '0');
    busReadSelector_v <= "0";

	--busOut(BUSOUT,112)
    busOut_v <= busReadSelector_v;
    busOut_r <= busReadSelector_q(31 downto 0);


end normal;
