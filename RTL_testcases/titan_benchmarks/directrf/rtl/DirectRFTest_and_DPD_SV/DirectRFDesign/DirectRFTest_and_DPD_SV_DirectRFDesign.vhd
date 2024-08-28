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

-- VHDL created from DirectRFTest_and_DPD_SV_DirectRFDesign
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
entity DirectRFTest_and_DPD_SV_DirectRFDesign is
    port (
        Ch0 : out std_logic_vector(13 downto 0);
        Ch1 : out std_logic_vector(13 downto 0);
        Ch10 : out std_logic_vector(13 downto 0);
        Ch11 : out std_logic_vector(13 downto 0);
        Ch12 : out std_logic_vector(13 downto 0);
        Ch13 : out std_logic_vector(13 downto 0);
        Ch14 : out std_logic_vector(13 downto 0);
        Ch15 : out std_logic_vector(13 downto 0);
        Ch2 : out std_logic_vector(13 downto 0);
        Ch3 : out std_logic_vector(13 downto 0);
        Ch4 : out std_logic_vector(13 downto 0);
        Ch5 : out std_logic_vector(13 downto 0);
        Ch6 : out std_logic_vector(13 downto 0);
        Ch7 : out std_logic_vector(13 downto 0);
        Ch8 : out std_logic_vector(13 downto 0);
        Ch9 : out std_logic_vector(13 downto 0);
        channel : in std_logic_vector(7 downto 0);
        data : in std_logic_vector(11 downto 0);
        valid : in std_logic_vector(0 downto 0);
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

architecture normal of DirectRFTest_and_DPD_SV_DirectRFDesign is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA component declaration
-- inputs
--  busIn_d <= busIn_d, width=32, real=0
--  busIn_a <= busIn_a, width=12, real=0
--  busIn_w <= busIn_w, width=1, real=0
--  Ind_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaData_q0, width=12, real=0
--  Inv_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaValid_q0, width=1, real=0
--  Inc_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChannel_q0, width=8, real=0
--  valid_in_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaValid_q0, width=1, real=0
--  ch_in_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChannel_q0, width=8, real=0
-- outputs
--  busOut_r => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_busOut_r, width=32, real=0
--  busOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_busOut_v, width=1, real=0
--  DucOut_00 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_00, width=14, real=0
--  DucOut_01 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_01, width=14, real=0
--  DucOut_02 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_02, width=14, real=0
--  DucOut_03 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_03, width=14, real=0
--  DucOut_04 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_04, width=14, real=0
--  DucOut_05 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_05, width=14, real=0
--  DucOut_06 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_06, width=14, real=0
--  DucOut_07 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_07, width=14, real=0
--  DucOut_08 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_08, width=14, real=0
--  DucOut_09 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_09, width=14, real=0
--  DucOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_10, width=14, real=0
--  DucOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_11, width=14, real=0
--  DucOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_12, width=14, real=0
--  DucOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_13, width=14, real=0
--  DucOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_14, width=14, real=0
--  DucOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_15, width=14, real=0
--  DucValid_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucValid_s, width=1, real=0
--  DucChannel_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucChannel_s, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA is
        port (
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
        Ind_s : in std_logic_vector(11 downto 0);
        Inv_s : in std_logic_vector(0 downto 0);
        Inc_s : in std_logic_vector(7 downto 0);
        valid_in_s : in std_logic_vector(0 downto 0);
        ch_in_s : in std_logic_vector(7 downto 0);
        busOut_r : out std_logic_vector(31 downto 0);
        busOut_v : out std_logic_vector(0 downto 0);
        DucOut_00 : out std_logic_vector(13 downto 0);
        DucOut_01 : out std_logic_vector(13 downto 0);
        DucOut_02 : out std_logic_vector(13 downto 0);
        DucOut_03 : out std_logic_vector(13 downto 0);
        DucOut_04 : out std_logic_vector(13 downto 0);
        DucOut_05 : out std_logic_vector(13 downto 0);
        DucOut_06 : out std_logic_vector(13 downto 0);
        DucOut_07 : out std_logic_vector(13 downto 0);
        DucOut_08 : out std_logic_vector(13 downto 0);
        DucOut_09 : out std_logic_vector(13 downto 0);
        DucOut_10 : out std_logic_vector(13 downto 0);
        DucOut_11 : out std_logic_vector(13 downto 0);
        DucOut_12 : out std_logic_vector(13 downto 0);
        DucOut_13 : out std_logic_vector(13 downto 0);
        DucOut_14 : out std_logic_vector(13 downto 0);
        DucOut_15 : out std_logic_vector(13 downto 0);
        DucValid_s : out std_logic_vector(0 downto 0);
        DucChannel_s : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut0 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_00, width=14, real=0
-- outputs
--  N/C
--  N/C
--  q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut0_q0, width=14, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut0 is
        port (
        a0 : in std_logic_vector(13 downto 0);
        q0 : out std_logic_vector(13 downto 0)
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut1 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_01, width=14, real=0
-- outputs
--  N/C
--  N/C
--  q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut1_q0, width=14, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut1 is
        port (
        a0 : in std_logic_vector(13 downto 0);
        q0 : out std_logic_vector(13 downto 0)
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut10 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_10, width=14, real=0
-- outputs
--  N/C
--  N/C
--  q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut10_q0, width=14, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut10 is
        port (
        a0 : in std_logic_vector(13 downto 0);
        q0 : out std_logic_vector(13 downto 0)
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut11 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_11, width=14, real=0
-- outputs
--  N/C
--  N/C
--  q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut11_q0, width=14, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut11 is
        port (
        a0 : in std_logic_vector(13 downto 0);
        q0 : out std_logic_vector(13 downto 0)
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut12 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_12, width=14, real=0
-- outputs
--  N/C
--  N/C
--  q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut12_q0, width=14, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut12 is
        port (
        a0 : in std_logic_vector(13 downto 0);
        q0 : out std_logic_vector(13 downto 0)
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut13 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_13, width=14, real=0
-- outputs
--  N/C
--  N/C
--  q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut13_q0, width=14, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut13 is
        port (
        a0 : in std_logic_vector(13 downto 0);
        q0 : out std_logic_vector(13 downto 0)
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut14 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_14, width=14, real=0
-- outputs
--  N/C
--  N/C
--  q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut14_q0, width=14, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut14 is
        port (
        a0 : in std_logic_vector(13 downto 0);
        q0 : out std_logic_vector(13 downto 0)
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut15 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_15, width=14, real=0
-- outputs
--  N/C
--  N/C
--  q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut15_q0, width=14, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut15 is
        port (
        a0 : in std_logic_vector(13 downto 0);
        q0 : out std_logic_vector(13 downto 0)
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut16 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucChannel_s, width=8, real=0
-- outputs
--  N/C
--  N/C
--  q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut16_q0, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut16 is
        port (
        a0 : in std_logic_vector(7 downto 0);
        q0 : out std_logic_vector(7 downto 0)
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut2 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_02, width=14, real=0
-- outputs
--  N/C
--  N/C
--  q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut2_q0, width=14, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut2 is
        port (
        a0 : in std_logic_vector(13 downto 0);
        q0 : out std_logic_vector(13 downto 0)
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut3 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_03, width=14, real=0
-- outputs
--  N/C
--  N/C
--  q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut3_q0, width=14, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut3 is
        port (
        a0 : in std_logic_vector(13 downto 0);
        q0 : out std_logic_vector(13 downto 0)
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut4 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_04, width=14, real=0
-- outputs
--  N/C
--  N/C
--  q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut4_q0, width=14, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut4 is
        port (
        a0 : in std_logic_vector(13 downto 0);
        q0 : out std_logic_vector(13 downto 0)
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut5 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_05, width=14, real=0
-- outputs
--  N/C
--  N/C
--  q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut5_q0, width=14, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut5 is
        port (
        a0 : in std_logic_vector(13 downto 0);
        q0 : out std_logic_vector(13 downto 0)
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut6 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_06, width=14, real=0
-- outputs
--  N/C
--  N/C
--  q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut6_q0, width=14, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut6 is
        port (
        a0 : in std_logic_vector(13 downto 0);
        q0 : out std_logic_vector(13 downto 0)
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut7 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_07, width=14, real=0
-- outputs
--  N/C
--  N/C
--  q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut7_q0, width=14, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut7 is
        port (
        a0 : in std_logic_vector(13 downto 0);
        q0 : out std_logic_vector(13 downto 0)
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut8 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_08, width=14, real=0
-- outputs
--  N/C
--  N/C
--  q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut8_q0, width=14, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut8 is
        port (
        a0 : in std_logic_vector(13 downto 0);
        q0 : out std_logic_vector(13 downto 0)
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut9 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_09, width=14, real=0
-- outputs
--  N/C
--  N/C
--  q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut9_q0, width=14, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut9 is
        port (
        a0 : in std_logic_vector(13 downto 0);
        q0 : out std_logic_vector(13 downto 0)
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChannel component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  a0 <= channel, width=8, real=0
-- outputs
--  N/C
--  N/C
--  q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChannel_q0, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChannel is
        port (
        a0 : in std_logic_vector(7 downto 0);
        q0 : out std_logic_vector(7 downto 0)
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaData component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  a0 <= data, width=12, real=0
-- outputs
--  N/C
--  N/C
--  q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaData_q0, width=12, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaData is
        port (
        a0 : in std_logic_vector(11 downto 0);
        q0 : out std_logic_vector(11 downto 0)
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaValid component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  a0 <= valid, width=1, real=0
-- outputs
--  N/C
--  N/C
--  q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaValid_q0, width=1, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaValid is
        port (
        a0 : in std_logic_vector(0 downto 0);
        q0 : out std_logic_vector(0 downto 0)
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_valid_out component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucValid_s, width=1, real=0
-- outputs
--  N/C
--  N/C
--  q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_valid_out_q0, width=1, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_valid_out is
        port (
        a0 : in std_logic_vector(0 downto 0);
        q0 : out std_logic_vector(0 downto 0)
        );
    end component;


    signal VCC_q : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_busIn_d : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_busIn_a : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_busIn_w : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_Ind_s : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_Inv_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_Inc_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_valid_in_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_ch_in_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_busOut_r : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_busOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_00 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_01 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_02 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_03 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_04 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_05 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_06 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_07 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_08 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_09 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_10 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_11 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_12 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_13 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_14 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_15 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucValid_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucChannel_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut0_a0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut0_q0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut1_a0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut1_q0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut10_a0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut10_q0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut11_a0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut11_q0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut12_a0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut12_q0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut13_a0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut13_q0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut14_a0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut14_q0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut15_a0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut15_q0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut16_a0 : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut16_q0 : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut2_a0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut2_q0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut3_a0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut3_q0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut4_a0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut4_q0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut5_a0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut5_q0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut6_a0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut6_q0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut7_a0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut7_q0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut8_a0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut8_q0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut9_a0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut9_q0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChannel_a0 : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChannel_q0 : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaData_a0 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaData_q0 : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaValid_a0 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaValid_q0 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_valid_out_a0 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_valid_out_q0 : std_logic_vector (0 downto 0);
    signal busReadSelector_q : std_logic_vector (31 downto 0);
    signal busReadSelector_v : std_logic_vector (0 downto 0);
begin


	--GND(CONSTANT,0)

	--channel_auto(GPIN,19)

	--DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChannel(BLACKBOX,38)
        DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChannel_a0 <= channel;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChannel : DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChannel port map (
        a0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChannel_a0,
        q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChannel_q0
        );

	--valid_auto(GPIN,41)

	--DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaValid(BLACKBOX,40)
        DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaValid_a0 <= valid;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_dspbaValid : DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaValid port map (
        a0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaValid_a0,
        q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaValid_q0
        );

	--data_auto(GPIN,20)

	--DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaData(BLACKBOX,39)
        DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaData_a0 <= data;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_dspbaData : DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaData port map (
        a0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaData_a0,
        q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaData_q0
        );

	--busIn(BUSIN,43)

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA(BLACKBOX,18)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_busIn_d <= busIn_d;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_busIn_a <= busIn_a;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_busIn_w <= busIn_w;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_Ind_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaData_q0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_Inv_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaValid_q0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_Inc_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChannel_q0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_valid_in_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaValid_q0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_ch_in_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChannel_q0;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA port map (
        busIn_d => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_busIn_d,
        busIn_a => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_busIn_a,
        busIn_w => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_busIn_w,
        Ind_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_Ind_s,
        Inv_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_Inv_s,
        Inc_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_Inc_s,
        valid_in_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_valid_in_s,
        ch_in_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_ch_in_s,
        busOut_r => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_busOut_r,
        busOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_busOut_v,
        DucOut_00 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_00,
        DucOut_01 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_01,
        DucOut_02 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_02,
        DucOut_03 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_03,
        DucOut_04 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_04,
        DucOut_05 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_05,
        DucOut_06 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_06,
        DucOut_07 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_07,
        DucOut_08 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_08,
        DucOut_09 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_09,
        DucOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_10,
        DucOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_11,
        DucOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_12,
        DucOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_13,
        DucOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_14,
        DucOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_15,
        DucValid_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucValid_s,
        DucChannel_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucChannel_s,
        clk => clk,
        areset => areset,
        bus_clk => bus_clk,
        bus_areset => bus_areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut0(BLACKBOX,21)
        DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut0_a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_00;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut0 : DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut0 port map (
        a0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut0_a0,
        q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut0_q0
        );

	--Ch0_auto(GPOUT,2)
    Ch0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut0_q0;


	--DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut1(BLACKBOX,22)
        DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut1_a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_01;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut1 : DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut1 port map (
        a0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut1_a0,
        q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut1_q0
        );

	--Ch1_auto(GPOUT,3)
    Ch1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut1_q0;


	--DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut10(BLACKBOX,23)
        DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut10_a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_10;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut10 : DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut10 port map (
        a0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut10_a0,
        q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut10_q0
        );

	--Ch10_auto(GPOUT,4)
    Ch10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut10_q0;


	--DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut11(BLACKBOX,24)
        DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut11_a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_11;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut11 : DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut11 port map (
        a0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut11_a0,
        q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut11_q0
        );

	--Ch11_auto(GPOUT,5)
    Ch11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut11_q0;


	--DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut12(BLACKBOX,25)
        DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut12_a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_12;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut12 : DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut12 port map (
        a0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut12_a0,
        q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut12_q0
        );

	--Ch12_auto(GPOUT,6)
    Ch12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut12_q0;


	--DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut13(BLACKBOX,26)
        DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut13_a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_13;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut13 : DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut13 port map (
        a0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut13_a0,
        q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut13_q0
        );

	--Ch13_auto(GPOUT,7)
    Ch13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut13_q0;


	--DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut14(BLACKBOX,27)
        DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut14_a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_14;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut14 : DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut14 port map (
        a0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut14_a0,
        q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut14_q0
        );

	--Ch14_auto(GPOUT,8)
    Ch14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut14_q0;


	--DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut15(BLACKBOX,28)
        DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut15_a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_15;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut15 : DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut15 port map (
        a0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut15_a0,
        q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut15_q0
        );

	--Ch15_auto(GPOUT,9)
    Ch15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut15_q0;


	--DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut2(BLACKBOX,30)
        DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut2_a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_02;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut2 : DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut2 port map (
        a0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut2_a0,
        q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut2_q0
        );

	--Ch2_auto(GPOUT,10)
    Ch2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut2_q0;


	--DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut3(BLACKBOX,31)
        DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut3_a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_03;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut3 : DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut3 port map (
        a0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut3_a0,
        q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut3_q0
        );

	--Ch3_auto(GPOUT,11)
    Ch3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut3_q0;


	--DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut4(BLACKBOX,32)
        DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut4_a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_04;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut4 : DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut4 port map (
        a0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut4_a0,
        q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut4_q0
        );

	--Ch4_auto(GPOUT,12)
    Ch4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut4_q0;


	--DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut5(BLACKBOX,33)
        DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut5_a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_05;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut5 : DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut5 port map (
        a0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut5_a0,
        q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut5_q0
        );

	--Ch5_auto(GPOUT,13)
    Ch5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut5_q0;


	--DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut6(BLACKBOX,34)
        DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut6_a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_06;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut6 : DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut6 port map (
        a0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut6_a0,
        q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut6_q0
        );

	--Ch6_auto(GPOUT,14)
    Ch6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut6_q0;


	--DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut7(BLACKBOX,35)
        DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut7_a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_07;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut7 : DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut7 port map (
        a0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut7_a0,
        q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut7_q0
        );

	--Ch7_auto(GPOUT,15)
    Ch7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut7_q0;


	--DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut8(BLACKBOX,36)
        DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut8_a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_08;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut8 : DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut8 port map (
        a0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut8_a0,
        q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut8_q0
        );

	--Ch8_auto(GPOUT,16)
    Ch8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut8_q0;


	--DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut9(BLACKBOX,37)
        DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut9_a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucOut_09;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut9 : DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut9 port map (
        a0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut9_a0,
        q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut9_q0
        );

	--Ch9_auto(GPOUT,17)
    Ch9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut9_q0;


	--DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut16(BLACKBOX,29)
        DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut16_a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucChannel_s;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut16 : DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut16 port map (
        a0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut16_a0,
        q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut16_q0
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_valid_out(BLACKBOX,42)
        DirectRFTest_and_DPD_SV_DirectRFDesign_valid_out_a0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DucValid_s;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_valid_out : DirectRFTest_and_DPD_SV_DirectRFDesign_valid_out port map (
        a0 => DirectRFTest_and_DPD_SV_DirectRFDesign_valid_out_a0,
        q0 => DirectRFTest_and_DPD_SV_DirectRFDesign_valid_out_q0
        );

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--busReadSelector(SELECTOR,44)
    busReadSelector: PROCESS (bus_clk, bus_areset)
        VARIABLE q : STD_LOGIC_VECTOR(31 downto 0);
        VARIABLE v : STD_LOGIC_VECTOR(0 downto 0);
    BEGIN
        IF (bus_areset = '1') THEN
            busReadSelector_q <= (others => '0');
            busReadSelector_v <= "0";
        ELSIF (bus_clk'EVENT AND bus_clk = '1') THEN
            q := (others => '0');
            v := "0";
            -- guarantee zero: false
            IF (DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_busOut_v = "1") THEN
                q := q or DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_busOut_r;
                v := v or "1";
            END IF;
            busReadSelector_q <= q;
            busReadSelector_v <= v;
        END IF;
    END PROCESS;


	--busOut(BUSOUT,45)
    busOut_v <= busReadSelector_v;
    busOut_r <= busReadSelector_q;


end normal;
