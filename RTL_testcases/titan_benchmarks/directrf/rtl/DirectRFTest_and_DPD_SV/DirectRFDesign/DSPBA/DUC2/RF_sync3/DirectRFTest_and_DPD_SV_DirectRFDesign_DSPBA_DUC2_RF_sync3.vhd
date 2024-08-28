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

-- VHDL created from DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3
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
entity DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3 is
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
end;

architecture normal of DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_RF_sync3 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

begin


	--GND(CONSTANT,0)

	--VCC(CONSTANT,1)

	--In1_auto(GPIN,2)

	--u0_out_auto(GPOUT,3)
    out_00 <= In1_s;


	--u1_out_auto(GPOUT,4)
    out_01 <= In1_s;


	--u2_out_auto(GPOUT,5)
    out_02 <= In1_s;


	--u3_out_auto(GPOUT,6)
    out_03 <= In1_s;


	--u4_out_auto(GPOUT,7)
    out_04 <= In1_s;


	--u5_out_auto(GPOUT,8)
    out_05 <= In1_s;


	--u6_out_auto(GPOUT,9)
    out_06 <= In1_s;


	--u7_out_auto(GPOUT,10)
    out_07 <= In1_s;


	--u8_out_auto(GPOUT,11)
    out_08 <= In1_s;


	--u9_out_auto(GPOUT,12)
    out_09 <= In1_s;


	--u10_out_auto(GPOUT,13)
    out_10 <= In1_s;


	--u11_out_auto(GPOUT,14)
    out_11 <= In1_s;


	--u12_out_auto(GPOUT,15)
    out_12 <= In1_s;


	--u13_out_auto(GPOUT,16)
    out_13 <= In1_s;


	--u14_out_auto(GPOUT,17)
    out_14 <= In1_s;


	--u15_out_auto(GPOUT,18)
    out_15 <= In1_s;


end normal;
