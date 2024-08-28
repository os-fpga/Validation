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

-- VHDL created from DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1
-- VHDL created on Thu Oct  4 07:10:09 2012


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
entity DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1 is
    port (
        Out1_0 : out std_logic_vector(15 downto 0);
        Out1_1 : out std_logic_vector(15 downto 0);
        Out1_2 : out std_logic_vector(15 downto 0);
        Out1_3 : out std_logic_vector(15 downto 0);
        Out1_4 : out std_logic_vector(15 downto 0);
        Out1_5 : out std_logic_vector(15 downto 0);
        Out1_6 : out std_logic_vector(15 downto 0);
        Out1_7 : out std_logic_vector(15 downto 0);
        ch_in_s : in std_logic_vector(7 downto 0);
        ch_out_s : out std_logic_vector(7 downto 0);
        data_in_0 : in std_logic_vector(15 downto 0);
        data_in_1 : in std_logic_vector(15 downto 0);
        data_in_2 : in std_logic_vector(15 downto 0);
        data_in_3 : in std_logic_vector(15 downto 0);
        data_in_4 : in std_logic_vector(15 downto 0);
        data_in_5 : in std_logic_vector(15 downto 0);
        data_in_6 : in std_logic_vector(15 downto 0);
        data_in_7 : in std_logic_vector(15 downto 0);
        valid_in_s : in std_logic_vector(0 downto 0);
        valid_out_s : out std_logic_vector(0 downto 0);
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

architecture normal of DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path component declaration
-- inputs
--  busIn_d <= busIn_d, width=32, real=0
--  busIn_a <= busIn_a, width=12, real=0
--  busIn_w <= busIn_w, width=1, real=0
--  valid_s <= valid_in_s, width=1, real=0
--  channel_s <= ch_in_s, width=8, real=0
--  sop_s <= GND_q, width=1, real=0
--  eop_s <= GND_q, width=1, real=0
--  xr_re <= data_in_0, width=16, real=0
--  xr_im <= data_in_1, width=16, real=0
--  xr1_re <= data_in_2, width=16, real=0
--  xr1_im <= data_in_3, width=16, real=0
--  Arb_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c_o0, width=1, real=0
-- outputs
--  busOut_r => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_busOut_r, width=32, real=0
--  busOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_busOut_v, width=1, real=0
--  v_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_v_s, width=1, real=0
--  c_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_c_s, width=8, real=0
--  sop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_sop_out_s, width=1, real=0
--  eop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_eop_out_s, width=1, real=0
--  zr_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_zr_re, width=16, real=0
--  zr_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_zr_im, width=16, real=0
--  zr1_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_zr1_re, width=16, real=0
--  zr1_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_zr1_im, width=16, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path is
        port (
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
        valid_s : in std_logic_vector(0 downto 0);
        channel_s : in std_logic_vector(7 downto 0);
        sop_s : in std_logic_vector(0 downto 0);
        eop_s : in std_logic_vector(0 downto 0);
        xr_re : in std_logic_vector(15 downto 0);
        xr_im : in std_logic_vector(15 downto 0);
        xr1_re : in std_logic_vector(15 downto 0);
        xr1_im : in std_logic_vector(15 downto 0);
        Arb_s : in std_logic_vector(0 downto 0);
        busOut_r : out std_logic_vector(31 downto 0);
        busOut_v : out std_logic_vector(0 downto 0);
        v_s : out std_logic_vector(0 downto 0);
        c_s : out std_logic_vector(7 downto 0);
        sop_out_s : out std_logic_vector(0 downto 0);
        eop_out_s : out std_logic_vector(0 downto 0);
        zr_re : out std_logic_vector(15 downto 0);
        zr_im : out std_logic_vector(15 downto 0);
        zr1_re : out std_logic_vector(15 downto 0);
        zr1_im : out std_logic_vector(15 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1 component declaration
-- inputs
--  busIn_d <= busIn_d, width=32, real=0
--  busIn_a <= busIn_a, width=12, real=0
--  busIn_w <= busIn_w, width=1, real=0
--  valid_s <= valid_in_s, width=1, real=0
--  channel_s <= ch_in_s, width=8, real=0
--  sop_s <= GND_q, width=1, real=0
--  eop_s <= GND_q, width=1, real=0
--  xr_re <= data_in_4, width=16, real=0
--  xr_im <= data_in_5, width=16, real=0
--  xr1_re <= data_in_6, width=16, real=0
--  xr1_im <= data_in_7, width=16, real=0
--  Arb_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c1_o0, width=1, real=0
-- outputs
--  busOut_r => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_busOut_r, width=32, real=0
--  busOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_busOut_v, width=1, real=0
--  v_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_v_s, width=1, real=0
--  c_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_c_s, width=8, real=0
--  sop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_sop_out_s, width=1, real=0
--  eop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_eop_out_s, width=1, real=0
--  zr_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_zr_re, width=16, real=0
--  zr_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_zr_im, width=16, real=0
--  zr1_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_zr1_re, width=16, real=0
--  zr1_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_zr1_im, width=16, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1 is
        port (
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
        valid_s : in std_logic_vector(0 downto 0);
        channel_s : in std_logic_vector(7 downto 0);
        sop_s : in std_logic_vector(0 downto 0);
        eop_s : in std_logic_vector(0 downto 0);
        xr_re : in std_logic_vector(15 downto 0);
        xr_im : in std_logic_vector(15 downto 0);
        xr1_re : in std_logic_vector(15 downto 0);
        xr1_im : in std_logic_vector(15 downto 0);
        Arb_s : in std_logic_vector(0 downto 0);
        busOut_r : out std_logic_vector(31 downto 0);
        busOut_v : out std_logic_vector(0 downto 0);
        v_s : out std_logic_vector(0 downto 0);
        c_s : out std_logic_vector(7 downto 0);
        sop_out_s : out std_logic_vector(0 downto 0);
        eop_out_s : out std_logic_vector(0 downto 0);
        zr_re : out std_logic_vector(15 downto 0);
        zr_im : out std_logic_vector(15 downto 0);
        zr1_re : out std_logic_vector(15 downto 0);
        zr1_im : out std_logic_vector(15 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2 component declaration
-- inputs
--  busIn_d <= busIn_d, width=32, real=0
--  busIn_a <= busIn_a, width=12, real=0
--  busIn_w <= busIn_w, width=1, real=0
--  valid_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_v_s, width=1, real=0
--  channel_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_c_s, width=8, real=0
--  sop_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_sop_out_s, width=1, real=0
--  eop_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_eop_out_s, width=1, real=0
--  xr_re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_zr_re, width=16, real=0
--  xr_im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_zr_im, width=16, real=0
--  xr1_re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_zr1_re, width=16, real=0
--  xr1_im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_zr1_im, width=16, real=0
--  Arb_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c_o0, width=1, real=0
-- outputs
--  busOut_r => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_busOut_r, width=32, real=0
--  busOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_busOut_v, width=1, real=0
--  v_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_v_s, width=1, real=0
--  c_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_c_s, width=8, real=0
--  sop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_sop_out_s, width=1, real=0
--  eop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_eop_out_s, width=1, real=0
--  zr_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_zr_re, width=16, real=0
--  zr_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_zr_im, width=16, real=0
--  zr1_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_zr1_re, width=16, real=0
--  zr1_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_zr1_im, width=16, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2 is
        port (
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
        valid_s : in std_logic_vector(0 downto 0);
        channel_s : in std_logic_vector(7 downto 0);
        sop_s : in std_logic_vector(0 downto 0);
        eop_s : in std_logic_vector(0 downto 0);
        xr_re : in std_logic_vector(15 downto 0);
        xr_im : in std_logic_vector(15 downto 0);
        xr1_re : in std_logic_vector(15 downto 0);
        xr1_im : in std_logic_vector(15 downto 0);
        Arb_s : in std_logic_vector(0 downto 0);
        busOut_r : out std_logic_vector(31 downto 0);
        busOut_v : out std_logic_vector(0 downto 0);
        v_s : out std_logic_vector(0 downto 0);
        c_s : out std_logic_vector(7 downto 0);
        sop_out_s : out std_logic_vector(0 downto 0);
        eop_out_s : out std_logic_vector(0 downto 0);
        zr_re : out std_logic_vector(15 downto 0);
        zr_im : out std_logic_vector(15 downto 0);
        zr1_re : out std_logic_vector(15 downto 0);
        zr1_im : out std_logic_vector(15 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3 component declaration
-- inputs
--  busIn_d <= busIn_d, width=32, real=0
--  busIn_a <= busIn_a, width=12, real=0
--  busIn_w <= busIn_w, width=1, real=0
--  valid_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_v_s, width=1, real=0
--  channel_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_c_s, width=8, real=0
--  sop_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_sop_out_s, width=1, real=0
--  eop_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_eop_out_s, width=1, real=0
--  xr_re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_zr_re, width=16, real=0
--  xr_im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_zr_im, width=16, real=0
--  xr1_re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_zr1_re, width=16, real=0
--  xr1_im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_zr1_im, width=16, real=0
--  Arb_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c_o0, width=1, real=0
-- outputs
--  busOut_r => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_busOut_r, width=32, real=0
--  busOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_busOut_v, width=1, real=0
--  v_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_v_s, width=1, real=0
--  c_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_c_s, width=8, real=0
--  sop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_sop_out_s, width=1, real=0
--  eop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_eop_out_s, width=1, real=0
--  zr_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_zr_re, width=16, real=0
--  zr_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_zr_im, width=16, real=0
--  zr1_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_zr1_re, width=16, real=0
--  zr1_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_zr1_im, width=16, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3 is
        port (
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
        valid_s : in std_logic_vector(0 downto 0);
        channel_s : in std_logic_vector(7 downto 0);
        sop_s : in std_logic_vector(0 downto 0);
        eop_s : in std_logic_vector(0 downto 0);
        xr_re : in std_logic_vector(15 downto 0);
        xr_im : in std_logic_vector(15 downto 0);
        xr1_re : in std_logic_vector(15 downto 0);
        xr1_im : in std_logic_vector(15 downto 0);
        Arb_s : in std_logic_vector(0 downto 0);
        busOut_r : out std_logic_vector(31 downto 0);
        busOut_v : out std_logic_vector(0 downto 0);
        v_s : out std_logic_vector(0 downto 0);
        c_s : out std_logic_vector(7 downto 0);
        sop_out_s : out std_logic_vector(0 downto 0);
        eop_out_s : out std_logic_vector(0 downto 0);
        zr_re : out std_logic_vector(15 downto 0);
        zr_im : out std_logic_vector(15 downto 0);
        zr1_re : out std_logic_vector(15 downto 0);
        zr1_im : out std_logic_vector(15 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4 component declaration
-- inputs
--  busIn_d <= busIn_d, width=32, real=0
--  busIn_a <= busIn_a, width=12, real=0
--  busIn_w <= busIn_w, width=1, real=0
--  valid_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_v_s, width=1, real=0
--  channel_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_c_s, width=8, real=0
--  sop_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_sop_out_s, width=1, real=0
--  eop_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_eop_out_s, width=1, real=0
--  xr_re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_zr_re, width=16, real=0
--  xr_im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_zr_im, width=16, real=0
--  xr1_re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_zr1_re, width=16, real=0
--  xr1_im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_zr1_im, width=16, real=0
--  Arb_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c1_o0, width=1, real=0
-- outputs
--  busOut_r => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_busOut_r, width=32, real=0
--  busOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_busOut_v, width=1, real=0
--  v_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_v_s, width=1, real=0
--  c_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_c_s, width=8, real=0
--  sop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_sop_out_s, width=1, real=0
--  eop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_eop_out_s, width=1, real=0
--  zr_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_zr_re, width=16, real=0
--  zr_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_zr_im, width=16, real=0
--  zr1_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_zr1_re, width=16, real=0
--  zr1_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_zr1_im, width=16, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4 is
        port (
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
        valid_s : in std_logic_vector(0 downto 0);
        channel_s : in std_logic_vector(7 downto 0);
        sop_s : in std_logic_vector(0 downto 0);
        eop_s : in std_logic_vector(0 downto 0);
        xr_re : in std_logic_vector(15 downto 0);
        xr_im : in std_logic_vector(15 downto 0);
        xr1_re : in std_logic_vector(15 downto 0);
        xr1_im : in std_logic_vector(15 downto 0);
        Arb_s : in std_logic_vector(0 downto 0);
        busOut_r : out std_logic_vector(31 downto 0);
        busOut_v : out std_logic_vector(0 downto 0);
        v_s : out std_logic_vector(0 downto 0);
        c_s : out std_logic_vector(7 downto 0);
        sop_out_s : out std_logic_vector(0 downto 0);
        eop_out_s : out std_logic_vector(0 downto 0);
        zr_re : out std_logic_vector(15 downto 0);
        zr_im : out std_logic_vector(15 downto 0);
        zr1_re : out std_logic_vector(15 downto 0);
        zr1_im : out std_logic_vector(15 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5 component declaration
-- inputs
--  busIn_d <= busIn_d, width=32, real=0
--  busIn_a <= busIn_a, width=12, real=0
--  busIn_w <= busIn_w, width=1, real=0
--  valid_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_v_s, width=1, real=0
--  channel_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_c_s, width=8, real=0
--  sop_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_sop_out_s, width=1, real=0
--  eop_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_eop_out_s, width=1, real=0
--  xr_re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_zr_re, width=16, real=0
--  xr_im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_zr_im, width=16, real=0
--  xr1_re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_zr1_re, width=16, real=0
--  xr1_im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_zr1_im, width=16, real=0
--  Arb_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c1_o0, width=1, real=0
-- outputs
--  busOut_r => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_busOut_r, width=32, real=0
--  busOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_busOut_v, width=1, real=0
--  v_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_v_s, width=1, real=0
--  c_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_c_s, width=8, real=0
--  sop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_sop_out_s, width=1, real=0
--  eop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_eop_out_s, width=1, real=0
--  zr_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_zr_re, width=16, real=0
--  zr_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_zr_im, width=16, real=0
--  zr1_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_zr1_re, width=16, real=0
--  zr1_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_zr1_im, width=16, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5 is
        port (
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
        valid_s : in std_logic_vector(0 downto 0);
        channel_s : in std_logic_vector(7 downto 0);
        sop_s : in std_logic_vector(0 downto 0);
        eop_s : in std_logic_vector(0 downto 0);
        xr_re : in std_logic_vector(15 downto 0);
        xr_im : in std_logic_vector(15 downto 0);
        xr1_re : in std_logic_vector(15 downto 0);
        xr1_im : in std_logic_vector(15 downto 0);
        Arb_s : in std_logic_vector(0 downto 0);
        busOut_r : out std_logic_vector(31 downto 0);
        busOut_v : out std_logic_vector(0 downto 0);
        v_s : out std_logic_vector(0 downto 0);
        c_s : out std_logic_vector(7 downto 0);
        sop_out_s : out std_logic_vector(0 downto 0);
        eop_out_s : out std_logic_vector(0 downto 0);
        zr_re : out std_logic_vector(15 downto 0);
        zr_im : out std_logic_vector(15 downto 0);
        zr1_re : out std_logic_vector(15 downto 0);
        zr1_im : out std_logic_vector(15 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
-- outputs
--  N/C
--  N/C
--  o0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c_o0, width=1, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c is
        port (
        o0 : out std_logic_vector(0 downto 0)
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c1 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
-- outputs
--  N/C
--  N/C
--  o0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c1_o0, width=1, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c1 is
        port (
        o0 : out std_logic_vector(0 downto 0)
        );
    end component;


    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_busIn_d : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_busIn_a : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_busIn_w : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_valid_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_channel_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_sop_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_eop_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_xr_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_xr_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_xr1_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_xr1_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_Arb_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_busOut_r : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_busOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_v_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_c_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_sop_out_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_eop_out_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_zr_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_zr_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_zr1_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_zr1_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_busIn_d : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_busIn_a : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_busIn_w : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_valid_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_channel_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_sop_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_eop_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_xr_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_xr_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_xr1_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_xr1_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_Arb_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_busOut_r : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_busOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_v_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_c_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_sop_out_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_eop_out_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_zr_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_zr_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_zr1_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_zr1_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_busIn_d : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_busIn_a : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_busIn_w : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_valid_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_channel_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_sop_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_eop_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_xr_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_xr_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_xr1_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_xr1_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_Arb_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_busOut_r : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_busOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_v_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_c_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_sop_out_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_eop_out_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_zr_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_zr_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_zr1_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_zr1_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_busIn_d : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_busIn_a : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_busIn_w : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_valid_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_channel_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_sop_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_eop_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_xr_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_xr_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_xr1_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_xr1_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_Arb_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_busOut_r : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_busOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_v_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_c_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_sop_out_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_eop_out_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_zr_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_zr_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_zr1_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_zr1_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_busIn_d : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_busIn_a : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_busIn_w : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_valid_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_channel_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_sop_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_eop_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_xr_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_xr_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_xr1_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_xr1_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_Arb_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_busOut_r : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_busOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_v_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_c_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_sop_out_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_eop_out_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_zr_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_zr_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_zr1_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_zr1_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_busIn_d : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_busIn_a : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_busIn_w : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_valid_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_channel_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_sop_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_eop_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_xr_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_xr_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_xr1_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_xr1_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_Arb_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_busOut_r : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_busOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_v_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_c_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_sop_out_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_eop_out_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_zr_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_zr_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_zr1_re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_zr1_im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c_o0 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c1_o0 : std_logic_vector (0 downto 0);
    signal busReadSelector_q : std_logic_vector (31 downto 0);
    signal busReadSelector_v : std_logic_vector (0 downto 0);
begin


	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c(BLACKBOX,20)
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c port map (
        o0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c_o0
        );

	--u3_data_in_auto(GPIN,27)

	--u2_data_in_auto(GPIN,26)

	--u1_data_in_auto(GPIN,25)

	--u0_data_in_auto(GPIN,24)

	--GND(CONSTANT,0)
    GND_q <= "0";

	--ch_in_auto(GPIN,22)

	--valid_in_auto(GPIN,32)

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path(BLACKBOX,6)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_busIn_d <= busIn_d;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_busIn_a <= busIn_a;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_busIn_w <= busIn_w;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_valid_s <= valid_in_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_channel_s <= ch_in_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_sop_s <= GND_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_eop_s <= GND_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_xr_re <= data_in_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_xr_im <= data_in_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_xr1_re <= data_in_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_xr1_im <= data_in_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_Arb_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c_o0;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path port map (
        busIn_d => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_busIn_d,
        busIn_a => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_busIn_a,
        busIn_w => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_busIn_w,
        valid_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_valid_s,
        channel_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_channel_s,
        sop_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_sop_s,
        eop_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_eop_s,
        xr_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_xr_re,
        xr_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_xr_im,
        xr1_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_xr1_re,
        xr1_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_xr1_im,
        Arb_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_Arb_s,
        busOut_r => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_busOut_r,
        busOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_busOut_v,
        v_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_v_s,
        c_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_c_s,
        sop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_sop_out_s,
        eop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_eop_out_s,
        zr_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_zr_re,
        zr_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_zr_im,
        zr1_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_zr1_re,
        zr1_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_zr1_im,
        clk => clk,
        areset => areset,
        bus_clk => bus_clk,
        bus_areset => bus_areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2(BLACKBOX,8)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_busIn_d <= busIn_d;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_busIn_a <= busIn_a;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_busIn_w <= busIn_w;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_valid_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_v_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_channel_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_c_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_sop_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_sop_out_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_eop_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_eop_out_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_xr_re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_zr_re;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_xr_im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_zr_im;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_xr1_re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_zr1_re;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_xr1_im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_zr1_im;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_Arb_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c_o0;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2 port map (
        busIn_d => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_busIn_d,
        busIn_a => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_busIn_a,
        busIn_w => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_busIn_w,
        valid_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_valid_s,
        channel_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_channel_s,
        sop_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_sop_s,
        eop_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_eop_s,
        xr_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_xr_re,
        xr_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_xr_im,
        xr1_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_xr1_re,
        xr1_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_xr1_im,
        Arb_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_Arb_s,
        busOut_r => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_busOut_r,
        busOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_busOut_v,
        v_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_v_s,
        c_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_c_s,
        sop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_sop_out_s,
        eop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_eop_out_s,
        zr_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_zr_re,
        zr_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_zr_im,
        zr1_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_zr1_re,
        zr1_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_zr1_im,
        clk => clk,
        areset => areset,
        bus_clk => bus_clk,
        bus_areset => bus_areset
        );

	--busIn(BUSIN,34)

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3(BLACKBOX,9)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_busIn_d <= busIn_d;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_busIn_a <= busIn_a;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_busIn_w <= busIn_w;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_valid_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_v_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_channel_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_c_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_sop_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_sop_out_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_eop_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_eop_out_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_xr_re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_zr_re;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_xr_im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_zr_im;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_xr1_re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_zr1_re;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_xr1_im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_zr1_im;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_Arb_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c_o0;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3 port map (
        busIn_d => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_busIn_d,
        busIn_a => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_busIn_a,
        busIn_w => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_busIn_w,
        valid_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_valid_s,
        channel_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_channel_s,
        sop_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_sop_s,
        eop_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_eop_s,
        xr_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_xr_re,
        xr_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_xr_im,
        xr1_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_xr1_re,
        xr1_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_xr1_im,
        Arb_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_Arb_s,
        busOut_r => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_busOut_r,
        busOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_busOut_v,
        v_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_v_s,
        c_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_c_s,
        sop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_sop_out_s,
        eop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_eop_out_s,
        zr_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_zr_re,
        zr_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_zr_im,
        zr1_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_zr1_re,
        zr1_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_zr1_im,
        clk => clk,
        areset => areset,
        bus_clk => bus_clk,
        bus_areset => bus_areset
        );

	--u0_Out1_auto(GPOUT,12)
    Out1_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_zr_re;


	--u1_Out1_auto(GPOUT,13)
    Out1_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_zr_im;


	--u2_Out1_auto(GPOUT,14)
    Out1_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_zr1_re;


	--u3_Out1_auto(GPOUT,15)
    Out1_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_zr1_im;


	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c1(BLACKBOX,21)
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c1 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c1 port map (
        o0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c1_o0
        );

	--u7_data_in_auto(GPIN,31)

	--u6_data_in_auto(GPIN,30)

	--u5_data_in_auto(GPIN,29)

	--u4_data_in_auto(GPIN,28)

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1(BLACKBOX,7)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_busIn_d <= busIn_d;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_busIn_a <= busIn_a;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_busIn_w <= busIn_w;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_valid_s <= valid_in_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_channel_s <= ch_in_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_sop_s <= GND_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_eop_s <= GND_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_xr_re <= data_in_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_xr_im <= data_in_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_xr1_re <= data_in_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_xr1_im <= data_in_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_Arb_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c1_o0;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1 port map (
        busIn_d => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_busIn_d,
        busIn_a => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_busIn_a,
        busIn_w => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_busIn_w,
        valid_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_valid_s,
        channel_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_channel_s,
        sop_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_sop_s,
        eop_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_eop_s,
        xr_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_xr_re,
        xr_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_xr_im,
        xr1_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_xr1_re,
        xr1_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_xr1_im,
        Arb_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_Arb_s,
        busOut_r => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_busOut_r,
        busOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_busOut_v,
        v_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_v_s,
        c_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_c_s,
        sop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_sop_out_s,
        eop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_eop_out_s,
        zr_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_zr_re,
        zr_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_zr_im,
        zr1_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_zr1_re,
        zr1_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_zr1_im,
        clk => clk,
        areset => areset,
        bus_clk => bus_clk,
        bus_areset => bus_areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4(BLACKBOX,10)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_busIn_d <= busIn_d;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_busIn_a <= busIn_a;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_busIn_w <= busIn_w;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_valid_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_v_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_channel_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_c_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_sop_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_sop_out_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_eop_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_eop_out_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_xr_re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_zr_re;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_xr_im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_zr_im;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_xr1_re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_zr1_re;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_xr1_im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_zr1_im;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_Arb_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c1_o0;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4 port map (
        busIn_d => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_busIn_d,
        busIn_a => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_busIn_a,
        busIn_w => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_busIn_w,
        valid_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_valid_s,
        channel_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_channel_s,
        sop_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_sop_s,
        eop_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_eop_s,
        xr_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_xr_re,
        xr_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_xr_im,
        xr1_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_xr1_re,
        xr1_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_xr1_im,
        Arb_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_Arb_s,
        busOut_r => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_busOut_r,
        busOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_busOut_v,
        v_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_v_s,
        c_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_c_s,
        sop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_sop_out_s,
        eop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_eop_out_s,
        zr_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_zr_re,
        zr_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_zr_im,
        zr1_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_zr1_re,
        zr1_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_zr1_im,
        clk => clk,
        areset => areset,
        bus_clk => bus_clk,
        bus_areset => bus_areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5(BLACKBOX,11)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_busIn_d <= busIn_d;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_busIn_a <= busIn_a;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_busIn_w <= busIn_w;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_valid_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_v_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_channel_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_c_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_sop_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_sop_out_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_eop_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_eop_out_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_xr_re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_zr_re;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_xr_im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_zr_im;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_xr1_re <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_zr1_re;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_xr1_im <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_zr1_im;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_Arb_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_c1_o0;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5 port map (
        busIn_d => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_busIn_d,
        busIn_a => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_busIn_a,
        busIn_w => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_busIn_w,
        valid_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_valid_s,
        channel_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_channel_s,
        sop_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_sop_s,
        eop_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_eop_s,
        xr_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_xr_re,
        xr_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_xr_im,
        xr1_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_xr1_re,
        xr1_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_xr1_im,
        Arb_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_Arb_s,
        busOut_r => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_busOut_r,
        busOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_busOut_v,
        v_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_v_s,
        c_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_c_s,
        sop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_sop_out_s,
        eop_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_eop_out_s,
        zr_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_zr_re,
        zr_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_zr_im,
        zr1_re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_zr1_re,
        zr1_im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_zr1_im,
        clk => clk,
        areset => areset,
        bus_clk => bus_clk,
        bus_areset => bus_areset
        );

	--u4_Out1_auto(GPOUT,16)
    Out1_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_zr_re;


	--u5_Out1_auto(GPOUT,17)
    Out1_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_zr_im;


	--u6_Out1_auto(GPOUT,18)
    Out1_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_zr1_re;


	--u7_Out1_auto(GPOUT,19)
    Out1_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_zr1_im;


	--ch_out_auto(GPOUT,23)
    ch_out_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_c_s;


	--valid_out_auto(GPOUT,33)
    valid_out_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_v_s;


	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--busReadSelector(SELECTOR,35)
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
            IF (DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_busOut_v = "1") THEN
                q := q or DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path5_busOut_r;
                v := v or "1";
            END IF;
            -- guarantee zero: false
            IF (DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_busOut_v = "1") THEN
                q := q or DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path4_busOut_r;
                v := v or "1";
            END IF;
            -- guarantee zero: false
            IF (DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_busOut_v = "1") THEN
                q := q or DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path3_busOut_r;
                v := v or "1";
            END IF;
            -- guarantee zero: false
            IF (DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_busOut_v = "1") THEN
                q := q or DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path2_busOut_r;
                v := v or "1";
            END IF;
            -- guarantee zero: false
            IF (DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_busOut_v = "1") THEN
                q := q or DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path1_busOut_r;
                v := v or "1";
            END IF;
            -- guarantee zero: false
            IF (DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_busOut_v = "1") THEN
                q := q or DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Forward_path_busOut_r;
                v := v or "1";
            END IF;
            busReadSelector_q <= q;
            busReadSelector_v <= v;
        END IF;
    END PROCESS;


	--busOut(BUSOUT,36)
    busOut_v <= busReadSelector_v;
    busOut_r <= busReadSelector_q;


end normal;
