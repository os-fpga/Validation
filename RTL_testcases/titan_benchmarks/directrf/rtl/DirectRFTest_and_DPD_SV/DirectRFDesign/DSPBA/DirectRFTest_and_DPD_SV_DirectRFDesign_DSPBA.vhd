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

-- VHDL created from DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA
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
entity DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA is
    port (
        DucChannel_s : out std_logic_vector(7 downto 0);
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
        Inc_s : in std_logic_vector(7 downto 0);
        Ind_s : in std_logic_vector(11 downto 0);
        Inv_s : in std_logic_vector(0 downto 0);
        ch_in_s : in std_logic_vector(7 downto 0);
        valid_in_s : in std_logic_vector(0 downto 0);
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

architecture normal of DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage component declaration
-- inputs
--  busIn_d <= busIn_d, width=32, real=0
--  busIn_a <= busIn_a, width=12, real=0
--  busIn_w <= busIn_w, width=1, real=0
--  data_in_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_0, width=16, real=0
--  data_in_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_1, width=16, real=0
--  data_in_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_2, width=16, real=0
--  data_in_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_3, width=16, real=0
--  data_in_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_4, width=16, real=0
--  data_in_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_5, width=16, real=0
--  data_in_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_6, width=16, real=0
--  data_in_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_7, width=16, real=0
--  valid_in_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_v, width=1, real=0
--  ch_in_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_c, width=8, real=0
-- outputs
--  busOut_r => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_busOut_r, width=32, real=0
--  busOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_busOut_v, width=1, real=0
--  Out1_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_0, width=16, real=0
--  Out1_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_1, width=16, real=0
--  Out1_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_2, width=16, real=0
--  Out1_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_3, width=16, real=0
--  Out1_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_4, width=16, real=0
--  Out1_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_5, width=16, real=0
--  Out1_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_6, width=16, real=0
--  Out1_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_7, width=16, real=0
--  valid_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_valid_out_s, width=1, real=0
--  ch_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_ch_out_s, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage is
        port (
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
        data_in_0 : in std_logic_vector(15 downto 0);
        data_in_1 : in std_logic_vector(15 downto 0);
        data_in_2 : in std_logic_vector(15 downto 0);
        data_in_3 : in std_logic_vector(15 downto 0);
        data_in_4 : in std_logic_vector(15 downto 0);
        data_in_5 : in std_logic_vector(15 downto 0);
        data_in_6 : in std_logic_vector(15 downto 0);
        data_in_7 : in std_logic_vector(15 downto 0);
        valid_in_s : in std_logic_vector(0 downto 0);
        ch_in_s : in std_logic_vector(7 downto 0);
        busOut_r : out std_logic_vector(31 downto 0);
        busOut_v : out std_logic_vector(0 downto 0);
        Out1_0 : out std_logic_vector(15 downto 0);
        Out1_1 : out std_logic_vector(15 downto 0);
        Out1_2 : out std_logic_vector(15 downto 0);
        Out1_3 : out std_logic_vector(15 downto 0);
        Out1_4 : out std_logic_vector(15 downto 0);
        Out1_5 : out std_logic_vector(15 downto 0);
        Out1_6 : out std_logic_vector(15 downto 0);
        Out1_7 : out std_logic_vector(15 downto 0);
        valid_out_s : out std_logic_vector(0 downto 0);
        ch_out_s : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1 component declaration
-- inputs
--  busIn_d <= busIn_d, width=32, real=0
--  busIn_a <= busIn_a, width=12, real=0
--  busIn_w <= busIn_w, width=1, real=0
--  data_in_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_0, width=16, real=0
--  data_in_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_1, width=16, real=0
--  data_in_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_2, width=16, real=0
--  data_in_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_3, width=16, real=0
--  data_in_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_4, width=16, real=0
--  data_in_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_5, width=16, real=0
--  data_in_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_6, width=16, real=0
--  data_in_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_7, width=16, real=0
--  valid_in_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_v, width=1, real=0
--  ch_in_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_c, width=8, real=0
-- outputs
--  busOut_r => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_busOut_r, width=32, real=0
--  busOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_busOut_v, width=1, real=0
--  Out1_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_0, width=16, real=0
--  Out1_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_1, width=16, real=0
--  Out1_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_2, width=16, real=0
--  Out1_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_3, width=16, real=0
--  Out1_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_4, width=16, real=0
--  Out1_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_5, width=16, real=0
--  Out1_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_6, width=16, real=0
--  Out1_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_7, width=16, real=0
--  valid_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_valid_out_s, width=1, real=0
--  ch_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_ch_out_s, width=8, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1 is
        port (
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
        data_in_0 : in std_logic_vector(15 downto 0);
        data_in_1 : in std_logic_vector(15 downto 0);
        data_in_2 : in std_logic_vector(15 downto 0);
        data_in_3 : in std_logic_vector(15 downto 0);
        data_in_4 : in std_logic_vector(15 downto 0);
        data_in_5 : in std_logic_vector(15 downto 0);
        data_in_6 : in std_logic_vector(15 downto 0);
        data_in_7 : in std_logic_vector(15 downto 0);
        valid_in_s : in std_logic_vector(0 downto 0);
        ch_in_s : in std_logic_vector(7 downto 0);
        busOut_r : out std_logic_vector(31 downto 0);
        busOut_v : out std_logic_vector(0 downto 0);
        Out1_0 : out std_logic_vector(15 downto 0);
        Out1_1 : out std_logic_vector(15 downto 0);
        Out1_2 : out std_logic_vector(15 downto 0);
        Out1_3 : out std_logic_vector(15 downto 0);
        Out1_4 : out std_logic_vector(15 downto 0);
        Out1_5 : out std_logic_vector(15 downto 0);
        Out1_6 : out std_logic_vector(15 downto 0);
        Out1_7 : out std_logic_vector(15 downto 0);
        valid_out_s : out std_logic_vector(0 downto 0);
        ch_out_s : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1 component declaration
-- inputs
--  busIn_d <= busIn_d, width=32, real=0
--  busIn_a <= busIn_a, width=12, real=0
--  busIn_w <= busIn_w, width=1, real=0
--  In1_s <= Ind_s, width=12, real=0
--  In2_s <= Inv_s, width=1, real=0
--  In3_s <= Inc_s, width=8, real=0
-- outputs
--  N/C
--  N/C
--  Out1_0re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_0re, width=16, real=0
--  Out1_0im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_0im, width=16, real=0
--  Out1_1re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_1re, width=16, real=0
--  Out1_1im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_1im, width=16, real=0
--  Out1_2re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_2re, width=16, real=0
--  Out1_2im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_2im, width=16, real=0
--  Out1_3re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_3re, width=16, real=0
--  Out1_3im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_3im, width=16, real=0
--  Out1_4re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_4re, width=16, real=0
--  Out1_4im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_4im, width=16, real=0
--  Out1_5re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_5re, width=16, real=0
--  Out1_5im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_5im, width=16, real=0
--  Out1_6re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_6re, width=16, real=0
--  Out1_6im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_6im, width=16, real=0
--  Out1_7re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_7re, width=16, real=0
--  Out1_7im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_7im, width=16, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1 is
        port (
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
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
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2 component declaration
-- inputs
--  busIn_d <= busIn_d, width=32, real=0
--  busIn_a <= busIn_a, width=12, real=0
--  busIn_w <= busIn_w, width=1, real=0
--  In1_s <= Ind_s, width=12, real=0
--  In2_s <= Inv_s, width=1, real=0
--  In3_s <= Inc_s, width=8, real=0
-- outputs
--  N/C
--  N/C
--  Out1_0re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_0re, width=16, real=0
--  Out1_0im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_0im, width=16, real=0
--  Out1_1re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_1re, width=16, real=0
--  Out1_1im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_1im, width=16, real=0
--  Out1_2re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_2re, width=16, real=0
--  Out1_2im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_2im, width=16, real=0
--  Out1_3re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_3re, width=16, real=0
--  Out1_3im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_3im, width=16, real=0
--  Out1_4re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_4re, width=16, real=0
--  Out1_4im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_4im, width=16, real=0
--  Out1_5re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_5re, width=16, real=0
--  Out1_5im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_5im, width=16, real=0
--  Out1_6re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_6re, width=16, real=0
--  Out1_6im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_6im, width=16, real=0
--  Out1_7re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_7re, width=16, real=0
--  Out1_7im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_7im, width=16, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2 is
        port (
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
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
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3 component declaration
-- inputs
--  busIn_d <= busIn_d, width=32, real=0
--  busIn_a <= busIn_a, width=12, real=0
--  busIn_w <= busIn_w, width=1, real=0
--  In1_s <= Ind_s, width=12, real=0
--  In2_s <= Inv_s, width=1, real=0
--  In3_s <= Inc_s, width=8, real=0
-- outputs
--  N/C
--  N/C
--  Out1_0re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_0re, width=16, real=0
--  Out1_0im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_0im, width=16, real=0
--  Out1_1re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_1re, width=16, real=0
--  Out1_1im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_1im, width=16, real=0
--  Out1_2re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_2re, width=16, real=0
--  Out1_2im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_2im, width=16, real=0
--  Out1_3re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_3re, width=16, real=0
--  Out1_3im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_3im, width=16, real=0
--  Out1_4re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_4re, width=16, real=0
--  Out1_4im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_4im, width=16, real=0
--  Out1_5re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_5re, width=16, real=0
--  Out1_5im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_5im, width=16, real=0
--  Out1_6re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_6re, width=16, real=0
--  Out1_6im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_6im, width=16, real=0
--  Out1_7re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_7re, width=16, real=0
--  Out1_7im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_7im, width=16, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3 is
        port (
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
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
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4 component declaration
-- inputs
--  busIn_d <= busIn_d, width=32, real=0
--  busIn_a <= busIn_a, width=12, real=0
--  busIn_w <= busIn_w, width=1, real=0
--  In1_s <= Ind_s, width=12, real=0
--  In2_s <= Inv_s, width=1, real=0
--  In3_s <= Inc_s, width=8, real=0
-- outputs
--  N/C
--  N/C
--  Out1_0re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_0re, width=16, real=0
--  Out1_0im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_0im, width=16, real=0
--  Out1_1re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_1re, width=16, real=0
--  Out1_1im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_1im, width=16, real=0
--  Out1_2re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_2re, width=16, real=0
--  Out1_2im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_2im, width=16, real=0
--  Out1_3re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_3re, width=16, real=0
--  Out1_3im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_3im, width=16, real=0
--  Out1_4re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_4re, width=16, real=0
--  Out1_4im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_4im, width=16, real=0
--  Out1_5re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_5re, width=16, real=0
--  Out1_5im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_5im, width=16, real=0
--  Out1_6re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_6re, width=16, real=0
--  Out1_6im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_6im, width=16, real=0
--  Out1_7re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_7re, width=16, real=0
--  Out1_7im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_7im, width=16, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4 is
        port (
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
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
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5 component declaration
-- inputs
--  busIn_d <= busIn_d, width=32, real=0
--  busIn_a <= busIn_a, width=12, real=0
--  busIn_w <= busIn_w, width=1, real=0
--  In1_s <= Ind_s, width=12, real=0
--  In2_s <= Inv_s, width=1, real=0
--  In3_s <= Inc_s, width=8, real=0
-- outputs
--  N/C
--  N/C
--  Out1_0re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_0re, width=16, real=0
--  Out1_0im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_0im, width=16, real=0
--  Out1_1re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_1re, width=16, real=0
--  Out1_1im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_1im, width=16, real=0
--  Out1_2re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_2re, width=16, real=0
--  Out1_2im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_2im, width=16, real=0
--  Out1_3re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_3re, width=16, real=0
--  Out1_3im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_3im, width=16, real=0
--  Out1_4re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_4re, width=16, real=0
--  Out1_4im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_4im, width=16, real=0
--  Out1_5re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_5re, width=16, real=0
--  Out1_5im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_5im, width=16, real=0
--  Out1_6re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_6re, width=16, real=0
--  Out1_6im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_6im, width=16, real=0
--  Out1_7re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_7re, width=16, real=0
--  Out1_7im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_7im, width=16, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5 is
        port (
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
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
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6 component declaration
-- inputs
--  busIn_d <= busIn_d, width=32, real=0
--  busIn_a <= busIn_a, width=12, real=0
--  busIn_w <= busIn_w, width=1, real=0
--  In1_s <= Ind_s, width=12, real=0
--  In2_s <= Inv_s, width=1, real=0
--  In3_s <= Inc_s, width=8, real=0
-- outputs
--  N/C
--  N/C
--  Out1_0re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_0re, width=16, real=0
--  Out1_0im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_0im, width=16, real=0
--  Out1_1re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_1re, width=16, real=0
--  Out1_1im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_1im, width=16, real=0
--  Out1_2re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_2re, width=16, real=0
--  Out1_2im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_2im, width=16, real=0
--  Out1_3re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_3re, width=16, real=0
--  Out1_3im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_3im, width=16, real=0
--  Out1_4re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_4re, width=16, real=0
--  Out1_4im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_4im, width=16, real=0
--  Out1_5re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_5re, width=16, real=0
--  Out1_5im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_5im, width=16, real=0
--  Out1_6re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_6re, width=16, real=0
--  Out1_6im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_6im, width=16, real=0
--  Out1_7re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_7re, width=16, real=0
--  Out1_7im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_7im, width=16, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6 is
        port (
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
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
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7 component declaration
-- inputs
--  busIn_d <= busIn_d, width=32, real=0
--  busIn_a <= busIn_a, width=12, real=0
--  busIn_w <= busIn_w, width=1, real=0
--  In1_s <= Ind_s, width=12, real=0
--  In2_s <= Inv_s, width=1, real=0
--  In3_s <= Inc_s, width=8, real=0
-- outputs
--  N/C
--  N/C
--  Out1_0re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_0re, width=16, real=0
--  Out1_0im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_0im, width=16, real=0
--  Out1_1re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_1re, width=16, real=0
--  Out1_1im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_1im, width=16, real=0
--  Out1_2re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_2re, width=16, real=0
--  Out1_2im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_2im, width=16, real=0
--  Out1_3re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_3re, width=16, real=0
--  Out1_3im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_3im, width=16, real=0
--  Out1_4re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_4re, width=16, real=0
--  Out1_4im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_4im, width=16, real=0
--  Out1_5re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_5re, width=16, real=0
--  Out1_5im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_5im, width=16, real=0
--  Out1_6re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_6re, width=16, real=0
--  Out1_6im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_6im, width=16, real=0
--  Out1_7re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_7re, width=16, real=0
--  Out1_7im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_7im, width=16, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7 is
        port (
        busIn_d : in std_logic_vector(31 downto 0);
        busIn_a : in std_logic_vector(11 downto 0);
        busIn_w : in std_logic_vector(0 downto 0);
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
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
        );
    end component;


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= Add_0_im_0_im_add_2_0_q, width=19, real=0
--  xIn_1 <= Add_1_im_1_im_add_2_0_q, width=19, real=0
--  xIn_2 <= Add_2_im_2_im_add_2_0_q, width=19, real=0
--  xIn_3 <= Add_3_im_3_im_add_2_0_q, width=19, real=0
--  xIn_4 <= Add_4_im_4_im_add_2_0_q, width=19, real=0
--  xIn_5 <= Add_5_im_5_im_add_2_0_q, width=19, real=0
--  xIn_6 <= Add_6_im_6_im_add_2_0_q, width=19, real=0
--  xIn_7 <= Add_7_im_7_im_add_2_0_q, width=19, real=0
--  xIn_v <= valid_in_s, width=1, real=0
--  xIn_c <= ch_in_s, width=8, real=0
--  gain_i <= GND_q, width=1, real=0
-- outputs
--  N/C
--  N/C
--  qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_0, width=16, real=0
--  qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_1, width=16, real=0
--  qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_2, width=16, real=0
--  qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_3, width=16, real=0
--  qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_4, width=16, real=0
--  qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_5, width=16, real=0
--  qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_6, width=16, real=0
--  qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_7, width=16, real=0
--  qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_v, width=1, real=0
--  qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_c, width=8, real=0
--  eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_0, width=1, real=0
--  eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_1, width=1, real=0
--  eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_2, width=1, real=0
--  eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_3, width=1, real=0
--  eOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_4, width=1, real=0
--  eOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_5, width=1, real=0
--  eOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_6, width=1, real=0
--  eOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_7, width=1, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1 is
        port (
        xIn_0 : in std_logic_vector(18 downto 0);
        xIn_1 : in std_logic_vector(18 downto 0);
        xIn_2 : in std_logic_vector(18 downto 0);
        xIn_3 : in std_logic_vector(18 downto 0);
        xIn_4 : in std_logic_vector(18 downto 0);
        xIn_5 : in std_logic_vector(18 downto 0);
        xIn_6 : in std_logic_vector(18 downto 0);
        xIn_7 : in std_logic_vector(18 downto 0);
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


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_0, width=16, real=0
--  xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_1, width=16, real=0
--  xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_2, width=16, real=0
--  xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_3, width=16, real=0
--  xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_4, width=16, real=0
--  xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_5, width=16, real=0
--  xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_6, width=16, real=0
--  xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_7, width=16, real=0
--  xIn_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_0, width=16, real=0
--  xIn_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_1, width=16, real=0
--  xIn_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_2, width=16, real=0
--  xIn_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_3, width=16, real=0
--  xIn_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_4, width=16, real=0
--  xIn_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_5, width=16, real=0
--  xIn_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_6, width=16, real=0
--  xIn_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_7, width=16, real=0
--  xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_valid_out_s, width=1, real=0
--  xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_ch_out_s, width=8, real=0
--  gain_i <= GND_q, width=1, real=0
-- outputs
--  N/C
--  N/C
--  qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_0, width=14, real=0
--  qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_1, width=14, real=0
--  qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_2, width=14, real=0
--  qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_3, width=14, real=0
--  qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_4, width=14, real=0
--  qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_5, width=14, real=0
--  qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_6, width=14, real=0
--  qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_7, width=14, real=0
--  qOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_8, width=14, real=0
--  qOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_9, width=14, real=0
--  qOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_10, width=14, real=0
--  qOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_11, width=14, real=0
--  qOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_12, width=14, real=0
--  qOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_13, width=14, real=0
--  qOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_14, width=14, real=0
--  qOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_15, width=14, real=0
--  qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_v, width=1, real=0
--  qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_c, width=8, real=0
--  eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_0, width=1, real=0
--  eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_1, width=1, real=0
--  eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_2, width=1, real=0
--  eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_3, width=1, real=0
--  eOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_4, width=1, real=0
--  eOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_5, width=1, real=0
--  eOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_6, width=1, real=0
--  eOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_7, width=1, real=0
--  eOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_8, width=1, real=0
--  eOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_9, width=1, real=0
--  eOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_10, width=1, real=0
--  eOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_11, width=1, real=0
--  eOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_12, width=1, real=0
--  eOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_13, width=1, real=0
--  eOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_14, width=1, real=0
--  eOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_15, width=1, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2 is
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
        gain_i : in std_logic_vector(0 downto 0);
        qOut_0 : out std_logic_vector(13 downto 0);
        qOut_1 : out std_logic_vector(13 downto 0);
        qOut_2 : out std_logic_vector(13 downto 0);
        qOut_3 : out std_logic_vector(13 downto 0);
        qOut_4 : out std_logic_vector(13 downto 0);
        qOut_5 : out std_logic_vector(13 downto 0);
        qOut_6 : out std_logic_vector(13 downto 0);
        qOut_7 : out std_logic_vector(13 downto 0);
        qOut_8 : out std_logic_vector(13 downto 0);
        qOut_9 : out std_logic_vector(13 downto 0);
        qOut_10 : out std_logic_vector(13 downto 0);
        qOut_11 : out std_logic_vector(13 downto 0);
        qOut_12 : out std_logic_vector(13 downto 0);
        qOut_13 : out std_logic_vector(13 downto 0);
        qOut_14 : out std_logic_vector(13 downto 0);
        qOut_15 : out std_logic_vector(13 downto 0);
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


-- DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3 component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  xIn_0 <= Add_0_re_0_re_add_2_0_q, width=19, real=0
--  xIn_1 <= Add_1_re_1_re_add_2_0_q, width=19, real=0
--  xIn_2 <= Add_2_re_2_re_add_2_0_q, width=19, real=0
--  xIn_3 <= Add_3_re_3_re_add_2_0_q, width=19, real=0
--  xIn_4 <= Add_4_re_4_re_add_2_0_q, width=19, real=0
--  xIn_5 <= Add_5_re_5_re_add_2_0_q, width=19, real=0
--  xIn_6 <= Add_6_re_6_re_add_2_0_q, width=19, real=0
--  xIn_7 <= Add_7_re_7_re_add_2_0_q, width=19, real=0
--  xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_v, width=1, real=0
--  xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_c, width=8, real=0
--  gain_i <= GND_q, width=1, real=0
-- outputs
--  N/C
--  N/C
--  qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_0, width=16, real=0
--  qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_1, width=16, real=0
--  qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_2, width=16, real=0
--  qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_3, width=16, real=0
--  qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_4, width=16, real=0
--  qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_5, width=16, real=0
--  qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_6, width=16, real=0
--  qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_7, width=16, real=0
--  qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_v, width=1, real=0
--  qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_c, width=8, real=0
--  eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_0, width=1, real=0
--  eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_1, width=1, real=0
--  eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_2, width=1, real=0
--  eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_3, width=1, real=0
--  eOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_4, width=1, real=0
--  eOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_5, width=1, real=0
--  eOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_6, width=1, real=0
--  eOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_7, width=1, real=0
    component DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3 is
        port (
        xIn_0 : in std_logic_vector(18 downto 0);
        xIn_1 : in std_logic_vector(18 downto 0);
        xIn_2 : in std_logic_vector(18 downto 0);
        xIn_3 : in std_logic_vector(18 downto 0);
        xIn_4 : in std_logic_vector(18 downto 0);
        xIn_5 : in std_logic_vector(18 downto 0);
        xIn_6 : in std_logic_vector(18 downto 0);
        xIn_7 : in std_logic_vector(18 downto 0);
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


    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_busIn_d : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_busIn_a : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_busIn_w : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_valid_in_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_ch_in_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_busOut_r : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_busOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_valid_out_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_ch_out_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_busIn_d : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_busIn_a : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_busIn_w : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_valid_in_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_ch_in_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_busOut_r : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_busOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_valid_out_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_ch_out_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_busIn_d : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_busIn_a : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_busIn_w : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_In1_s : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_In2_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_In3_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_0re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_0im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_1re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_1im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_2re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_2im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_3re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_3im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_4re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_4im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_5re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_5im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_6re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_6im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_7re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_7im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_busIn_d : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_busIn_a : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_busIn_w : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_In1_s : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_In2_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_In3_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_0re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_0im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_1re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_1im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_2re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_2im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_3re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_3im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_4re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_4im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_5re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_5im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_6re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_6im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_7re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_7im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_busIn_d : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_busIn_a : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_busIn_w : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_In1_s : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_In2_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_In3_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_0re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_0im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_1re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_1im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_2re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_2im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_3re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_3im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_4re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_4im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_5re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_5im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_6re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_6im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_7re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_7im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_busIn_d : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_busIn_a : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_busIn_w : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_In1_s : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_In2_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_In3_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_0re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_0im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_1re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_1im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_2re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_2im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_3re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_3im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_4re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_4im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_5re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_5im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_6re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_6im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_7re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_7im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_busIn_d : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_busIn_a : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_busIn_w : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_In1_s : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_In2_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_In3_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_0re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_0im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_1re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_1im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_2re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_2im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_3re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_3im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_4re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_4im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_5re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_5im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_6re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_6im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_7re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_7im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_busIn_d : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_busIn_a : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_busIn_w : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_In1_s : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_In2_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_In3_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_0re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_0im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_1re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_1im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_2re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_2im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_3re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_3im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_4re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_4im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_5re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_5im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_6re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_6im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_7re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_7im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_busIn_d : std_logic_vector (31 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_busIn_a : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_busIn_w : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_In1_s : std_logic_vector (11 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_In2_s : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_In3_s : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_0re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_0im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_1re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_1im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_2re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_2im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_3re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_3im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_4re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_4im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_5re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_5im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_6re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_6im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_7re : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_7im : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_0 : std_logic_vector (18 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_1 : std_logic_vector (18 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_2 : std_logic_vector (18 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_3 : std_logic_vector (18 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_4 : std_logic_vector (18 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_5 : std_logic_vector (18 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_6 : std_logic_vector (18 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_7 : std_logic_vector (18 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_gain_i : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_0 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_1 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_2 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_3 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_4 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_5 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_6 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_7 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_8 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_9 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_10 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_11 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_12 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_13 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_14 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_15 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_gain_i : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_0 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_1 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_2 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_3 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_4 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_5 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_6 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_7 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_8 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_9 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_10 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_11 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_12 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_13 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_14 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_15 : std_logic_vector (13 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_0 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_1 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_2 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_3 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_4 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_5 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_6 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_7 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_8 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_9 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_10 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_11 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_12 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_13 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_14 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_15 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_0 : std_logic_vector (18 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_1 : std_logic_vector (18 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_2 : std_logic_vector (18 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_3 : std_logic_vector (18 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_4 : std_logic_vector (18 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_5 : std_logic_vector (18 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_6 : std_logic_vector (18 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_7 : std_logic_vector (18 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_gain_i : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_0 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_1 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_2 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_3 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_4 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_5 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_6 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_7 : std_logic_vector (15 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_v : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_c : std_logic_vector (7 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_0 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_1 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_2 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_3 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_4 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_5 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_6 : std_logic_vector (0 downto 0);
    signal DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_7 : std_logic_vector (0 downto 0);
    signal busReadSelector_q : std_logic_vector (31 downto 0);
    signal busReadSelector_v : std_logic_vector (0 downto 0);
    signal Add_0_re_0_re_add_0_0_a : std_logic_vector(16 downto 0);
    signal Add_0_re_0_re_add_0_0_b : std_logic_vector(16 downto 0);
    signal Add_0_re_0_re_add_0_0_o : std_logic_vector (16 downto 0);
    signal Add_0_re_0_re_add_0_0_q : std_logic_vector (16 downto 0);
    signal Add_0_re_0_re_add_0_1_a : std_logic_vector(16 downto 0);
    signal Add_0_re_0_re_add_0_1_b : std_logic_vector(16 downto 0);
    signal Add_0_re_0_re_add_0_1_o : std_logic_vector (16 downto 0);
    signal Add_0_re_0_re_add_0_1_q : std_logic_vector (16 downto 0);
    signal Add_0_re_0_re_add_0_2_a : std_logic_vector(16 downto 0);
    signal Add_0_re_0_re_add_0_2_b : std_logic_vector(16 downto 0);
    signal Add_0_re_0_re_add_0_2_o : std_logic_vector (16 downto 0);
    signal Add_0_re_0_re_add_0_2_q : std_logic_vector (16 downto 0);
    signal Add_0_re_0_re_add_1_0_a : std_logic_vector(17 downto 0);
    signal Add_0_re_0_re_add_1_0_b : std_logic_vector(17 downto 0);
    signal Add_0_re_0_re_add_1_0_o : std_logic_vector (17 downto 0);
    signal Add_0_re_0_re_add_1_0_q : std_logic_vector (17 downto 0);
    signal Add_0_re_0_re_add_1_1_a : std_logic_vector(17 downto 0);
    signal Add_0_re_0_re_add_1_1_b : std_logic_vector(17 downto 0);
    signal Add_0_re_0_re_add_1_1_o : std_logic_vector (17 downto 0);
    signal Add_0_re_0_re_add_1_1_q : std_logic_vector (17 downto 0);
    signal Add_0_re_0_re_add_2_0_a : std_logic_vector(18 downto 0);
    signal Add_0_re_0_re_add_2_0_b : std_logic_vector(18 downto 0);
    signal Add_0_re_0_re_add_2_0_o : std_logic_vector (18 downto 0);
    signal Add_0_re_0_re_add_2_0_q : std_logic_vector (18 downto 0);
    signal Add_0_im_0_im_add_0_0_a : std_logic_vector(16 downto 0);
    signal Add_0_im_0_im_add_0_0_b : std_logic_vector(16 downto 0);
    signal Add_0_im_0_im_add_0_0_o : std_logic_vector (16 downto 0);
    signal Add_0_im_0_im_add_0_0_q : std_logic_vector (16 downto 0);
    signal Add_0_im_0_im_add_0_1_a : std_logic_vector(16 downto 0);
    signal Add_0_im_0_im_add_0_1_b : std_logic_vector(16 downto 0);
    signal Add_0_im_0_im_add_0_1_o : std_logic_vector (16 downto 0);
    signal Add_0_im_0_im_add_0_1_q : std_logic_vector (16 downto 0);
    signal Add_0_im_0_im_add_0_2_a : std_logic_vector(16 downto 0);
    signal Add_0_im_0_im_add_0_2_b : std_logic_vector(16 downto 0);
    signal Add_0_im_0_im_add_0_2_o : std_logic_vector (16 downto 0);
    signal Add_0_im_0_im_add_0_2_q : std_logic_vector (16 downto 0);
    signal Add_0_im_0_im_add_1_0_a : std_logic_vector(17 downto 0);
    signal Add_0_im_0_im_add_1_0_b : std_logic_vector(17 downto 0);
    signal Add_0_im_0_im_add_1_0_o : std_logic_vector (17 downto 0);
    signal Add_0_im_0_im_add_1_0_q : std_logic_vector (17 downto 0);
    signal Add_0_im_0_im_add_1_1_a : std_logic_vector(17 downto 0);
    signal Add_0_im_0_im_add_1_1_b : std_logic_vector(17 downto 0);
    signal Add_0_im_0_im_add_1_1_o : std_logic_vector (17 downto 0);
    signal Add_0_im_0_im_add_1_1_q : std_logic_vector (17 downto 0);
    signal Add_0_im_0_im_add_2_0_a : std_logic_vector(18 downto 0);
    signal Add_0_im_0_im_add_2_0_b : std_logic_vector(18 downto 0);
    signal Add_0_im_0_im_add_2_0_o : std_logic_vector (18 downto 0);
    signal Add_0_im_0_im_add_2_0_q : std_logic_vector (18 downto 0);
    signal Add_1_re_1_re_add_0_0_a : std_logic_vector(16 downto 0);
    signal Add_1_re_1_re_add_0_0_b : std_logic_vector(16 downto 0);
    signal Add_1_re_1_re_add_0_0_o : std_logic_vector (16 downto 0);
    signal Add_1_re_1_re_add_0_0_q : std_logic_vector (16 downto 0);
    signal Add_1_re_1_re_add_0_1_a : std_logic_vector(16 downto 0);
    signal Add_1_re_1_re_add_0_1_b : std_logic_vector(16 downto 0);
    signal Add_1_re_1_re_add_0_1_o : std_logic_vector (16 downto 0);
    signal Add_1_re_1_re_add_0_1_q : std_logic_vector (16 downto 0);
    signal Add_1_re_1_re_add_0_2_a : std_logic_vector(16 downto 0);
    signal Add_1_re_1_re_add_0_2_b : std_logic_vector(16 downto 0);
    signal Add_1_re_1_re_add_0_2_o : std_logic_vector (16 downto 0);
    signal Add_1_re_1_re_add_0_2_q : std_logic_vector (16 downto 0);
    signal Add_1_re_1_re_add_1_0_a : std_logic_vector(17 downto 0);
    signal Add_1_re_1_re_add_1_0_b : std_logic_vector(17 downto 0);
    signal Add_1_re_1_re_add_1_0_o : std_logic_vector (17 downto 0);
    signal Add_1_re_1_re_add_1_0_q : std_logic_vector (17 downto 0);
    signal Add_1_re_1_re_add_1_1_a : std_logic_vector(17 downto 0);
    signal Add_1_re_1_re_add_1_1_b : std_logic_vector(17 downto 0);
    signal Add_1_re_1_re_add_1_1_o : std_logic_vector (17 downto 0);
    signal Add_1_re_1_re_add_1_1_q : std_logic_vector (17 downto 0);
    signal Add_1_re_1_re_add_2_0_a : std_logic_vector(18 downto 0);
    signal Add_1_re_1_re_add_2_0_b : std_logic_vector(18 downto 0);
    signal Add_1_re_1_re_add_2_0_o : std_logic_vector (18 downto 0);
    signal Add_1_re_1_re_add_2_0_q : std_logic_vector (18 downto 0);
    signal Add_1_im_1_im_add_0_0_a : std_logic_vector(16 downto 0);
    signal Add_1_im_1_im_add_0_0_b : std_logic_vector(16 downto 0);
    signal Add_1_im_1_im_add_0_0_o : std_logic_vector (16 downto 0);
    signal Add_1_im_1_im_add_0_0_q : std_logic_vector (16 downto 0);
    signal Add_1_im_1_im_add_0_1_a : std_logic_vector(16 downto 0);
    signal Add_1_im_1_im_add_0_1_b : std_logic_vector(16 downto 0);
    signal Add_1_im_1_im_add_0_1_o : std_logic_vector (16 downto 0);
    signal Add_1_im_1_im_add_0_1_q : std_logic_vector (16 downto 0);
    signal Add_1_im_1_im_add_0_2_a : std_logic_vector(16 downto 0);
    signal Add_1_im_1_im_add_0_2_b : std_logic_vector(16 downto 0);
    signal Add_1_im_1_im_add_0_2_o : std_logic_vector (16 downto 0);
    signal Add_1_im_1_im_add_0_2_q : std_logic_vector (16 downto 0);
    signal Add_1_im_1_im_add_1_0_a : std_logic_vector(17 downto 0);
    signal Add_1_im_1_im_add_1_0_b : std_logic_vector(17 downto 0);
    signal Add_1_im_1_im_add_1_0_o : std_logic_vector (17 downto 0);
    signal Add_1_im_1_im_add_1_0_q : std_logic_vector (17 downto 0);
    signal Add_1_im_1_im_add_1_1_a : std_logic_vector(17 downto 0);
    signal Add_1_im_1_im_add_1_1_b : std_logic_vector(17 downto 0);
    signal Add_1_im_1_im_add_1_1_o : std_logic_vector (17 downto 0);
    signal Add_1_im_1_im_add_1_1_q : std_logic_vector (17 downto 0);
    signal Add_1_im_1_im_add_2_0_a : std_logic_vector(18 downto 0);
    signal Add_1_im_1_im_add_2_0_b : std_logic_vector(18 downto 0);
    signal Add_1_im_1_im_add_2_0_o : std_logic_vector (18 downto 0);
    signal Add_1_im_1_im_add_2_0_q : std_logic_vector (18 downto 0);
    signal Add_2_re_2_re_add_0_0_a : std_logic_vector(16 downto 0);
    signal Add_2_re_2_re_add_0_0_b : std_logic_vector(16 downto 0);
    signal Add_2_re_2_re_add_0_0_o : std_logic_vector (16 downto 0);
    signal Add_2_re_2_re_add_0_0_q : std_logic_vector (16 downto 0);
    signal Add_2_re_2_re_add_0_1_a : std_logic_vector(16 downto 0);
    signal Add_2_re_2_re_add_0_1_b : std_logic_vector(16 downto 0);
    signal Add_2_re_2_re_add_0_1_o : std_logic_vector (16 downto 0);
    signal Add_2_re_2_re_add_0_1_q : std_logic_vector (16 downto 0);
    signal Add_2_re_2_re_add_0_2_a : std_logic_vector(16 downto 0);
    signal Add_2_re_2_re_add_0_2_b : std_logic_vector(16 downto 0);
    signal Add_2_re_2_re_add_0_2_o : std_logic_vector (16 downto 0);
    signal Add_2_re_2_re_add_0_2_q : std_logic_vector (16 downto 0);
    signal Add_2_re_2_re_add_1_0_a : std_logic_vector(17 downto 0);
    signal Add_2_re_2_re_add_1_0_b : std_logic_vector(17 downto 0);
    signal Add_2_re_2_re_add_1_0_o : std_logic_vector (17 downto 0);
    signal Add_2_re_2_re_add_1_0_q : std_logic_vector (17 downto 0);
    signal Add_2_re_2_re_add_1_1_a : std_logic_vector(17 downto 0);
    signal Add_2_re_2_re_add_1_1_b : std_logic_vector(17 downto 0);
    signal Add_2_re_2_re_add_1_1_o : std_logic_vector (17 downto 0);
    signal Add_2_re_2_re_add_1_1_q : std_logic_vector (17 downto 0);
    signal Add_2_re_2_re_add_2_0_a : std_logic_vector(18 downto 0);
    signal Add_2_re_2_re_add_2_0_b : std_logic_vector(18 downto 0);
    signal Add_2_re_2_re_add_2_0_o : std_logic_vector (18 downto 0);
    signal Add_2_re_2_re_add_2_0_q : std_logic_vector (18 downto 0);
    signal Add_2_im_2_im_add_0_0_a : std_logic_vector(16 downto 0);
    signal Add_2_im_2_im_add_0_0_b : std_logic_vector(16 downto 0);
    signal Add_2_im_2_im_add_0_0_o : std_logic_vector (16 downto 0);
    signal Add_2_im_2_im_add_0_0_q : std_logic_vector (16 downto 0);
    signal Add_2_im_2_im_add_0_1_a : std_logic_vector(16 downto 0);
    signal Add_2_im_2_im_add_0_1_b : std_logic_vector(16 downto 0);
    signal Add_2_im_2_im_add_0_1_o : std_logic_vector (16 downto 0);
    signal Add_2_im_2_im_add_0_1_q : std_logic_vector (16 downto 0);
    signal Add_2_im_2_im_add_0_2_a : std_logic_vector(16 downto 0);
    signal Add_2_im_2_im_add_0_2_b : std_logic_vector(16 downto 0);
    signal Add_2_im_2_im_add_0_2_o : std_logic_vector (16 downto 0);
    signal Add_2_im_2_im_add_0_2_q : std_logic_vector (16 downto 0);
    signal Add_2_im_2_im_add_1_0_a : std_logic_vector(17 downto 0);
    signal Add_2_im_2_im_add_1_0_b : std_logic_vector(17 downto 0);
    signal Add_2_im_2_im_add_1_0_o : std_logic_vector (17 downto 0);
    signal Add_2_im_2_im_add_1_0_q : std_logic_vector (17 downto 0);
    signal Add_2_im_2_im_add_1_1_a : std_logic_vector(17 downto 0);
    signal Add_2_im_2_im_add_1_1_b : std_logic_vector(17 downto 0);
    signal Add_2_im_2_im_add_1_1_o : std_logic_vector (17 downto 0);
    signal Add_2_im_2_im_add_1_1_q : std_logic_vector (17 downto 0);
    signal Add_2_im_2_im_add_2_0_a : std_logic_vector(18 downto 0);
    signal Add_2_im_2_im_add_2_0_b : std_logic_vector(18 downto 0);
    signal Add_2_im_2_im_add_2_0_o : std_logic_vector (18 downto 0);
    signal Add_2_im_2_im_add_2_0_q : std_logic_vector (18 downto 0);
    signal Add_3_re_3_re_add_0_0_a : std_logic_vector(16 downto 0);
    signal Add_3_re_3_re_add_0_0_b : std_logic_vector(16 downto 0);
    signal Add_3_re_3_re_add_0_0_o : std_logic_vector (16 downto 0);
    signal Add_3_re_3_re_add_0_0_q : std_logic_vector (16 downto 0);
    signal Add_3_re_3_re_add_0_1_a : std_logic_vector(16 downto 0);
    signal Add_3_re_3_re_add_0_1_b : std_logic_vector(16 downto 0);
    signal Add_3_re_3_re_add_0_1_o : std_logic_vector (16 downto 0);
    signal Add_3_re_3_re_add_0_1_q : std_logic_vector (16 downto 0);
    signal Add_3_re_3_re_add_0_2_a : std_logic_vector(16 downto 0);
    signal Add_3_re_3_re_add_0_2_b : std_logic_vector(16 downto 0);
    signal Add_3_re_3_re_add_0_2_o : std_logic_vector (16 downto 0);
    signal Add_3_re_3_re_add_0_2_q : std_logic_vector (16 downto 0);
    signal Add_3_re_3_re_add_1_0_a : std_logic_vector(17 downto 0);
    signal Add_3_re_3_re_add_1_0_b : std_logic_vector(17 downto 0);
    signal Add_3_re_3_re_add_1_0_o : std_logic_vector (17 downto 0);
    signal Add_3_re_3_re_add_1_0_q : std_logic_vector (17 downto 0);
    signal Add_3_re_3_re_add_1_1_a : std_logic_vector(17 downto 0);
    signal Add_3_re_3_re_add_1_1_b : std_logic_vector(17 downto 0);
    signal Add_3_re_3_re_add_1_1_o : std_logic_vector (17 downto 0);
    signal Add_3_re_3_re_add_1_1_q : std_logic_vector (17 downto 0);
    signal Add_3_re_3_re_add_2_0_a : std_logic_vector(18 downto 0);
    signal Add_3_re_3_re_add_2_0_b : std_logic_vector(18 downto 0);
    signal Add_3_re_3_re_add_2_0_o : std_logic_vector (18 downto 0);
    signal Add_3_re_3_re_add_2_0_q : std_logic_vector (18 downto 0);
    signal Add_3_im_3_im_add_0_0_a : std_logic_vector(16 downto 0);
    signal Add_3_im_3_im_add_0_0_b : std_logic_vector(16 downto 0);
    signal Add_3_im_3_im_add_0_0_o : std_logic_vector (16 downto 0);
    signal Add_3_im_3_im_add_0_0_q : std_logic_vector (16 downto 0);
    signal Add_3_im_3_im_add_0_1_a : std_logic_vector(16 downto 0);
    signal Add_3_im_3_im_add_0_1_b : std_logic_vector(16 downto 0);
    signal Add_3_im_3_im_add_0_1_o : std_logic_vector (16 downto 0);
    signal Add_3_im_3_im_add_0_1_q : std_logic_vector (16 downto 0);
    signal Add_3_im_3_im_add_0_2_a : std_logic_vector(16 downto 0);
    signal Add_3_im_3_im_add_0_2_b : std_logic_vector(16 downto 0);
    signal Add_3_im_3_im_add_0_2_o : std_logic_vector (16 downto 0);
    signal Add_3_im_3_im_add_0_2_q : std_logic_vector (16 downto 0);
    signal Add_3_im_3_im_add_1_0_a : std_logic_vector(17 downto 0);
    signal Add_3_im_3_im_add_1_0_b : std_logic_vector(17 downto 0);
    signal Add_3_im_3_im_add_1_0_o : std_logic_vector (17 downto 0);
    signal Add_3_im_3_im_add_1_0_q : std_logic_vector (17 downto 0);
    signal Add_3_im_3_im_add_1_1_a : std_logic_vector(17 downto 0);
    signal Add_3_im_3_im_add_1_1_b : std_logic_vector(17 downto 0);
    signal Add_3_im_3_im_add_1_1_o : std_logic_vector (17 downto 0);
    signal Add_3_im_3_im_add_1_1_q : std_logic_vector (17 downto 0);
    signal Add_3_im_3_im_add_2_0_a : std_logic_vector(18 downto 0);
    signal Add_3_im_3_im_add_2_0_b : std_logic_vector(18 downto 0);
    signal Add_3_im_3_im_add_2_0_o : std_logic_vector (18 downto 0);
    signal Add_3_im_3_im_add_2_0_q : std_logic_vector (18 downto 0);
    signal Add_4_re_4_re_add_0_0_a : std_logic_vector(16 downto 0);
    signal Add_4_re_4_re_add_0_0_b : std_logic_vector(16 downto 0);
    signal Add_4_re_4_re_add_0_0_o : std_logic_vector (16 downto 0);
    signal Add_4_re_4_re_add_0_0_q : std_logic_vector (16 downto 0);
    signal Add_4_re_4_re_add_0_1_a : std_logic_vector(16 downto 0);
    signal Add_4_re_4_re_add_0_1_b : std_logic_vector(16 downto 0);
    signal Add_4_re_4_re_add_0_1_o : std_logic_vector (16 downto 0);
    signal Add_4_re_4_re_add_0_1_q : std_logic_vector (16 downto 0);
    signal Add_4_re_4_re_add_0_2_a : std_logic_vector(16 downto 0);
    signal Add_4_re_4_re_add_0_2_b : std_logic_vector(16 downto 0);
    signal Add_4_re_4_re_add_0_2_o : std_logic_vector (16 downto 0);
    signal Add_4_re_4_re_add_0_2_q : std_logic_vector (16 downto 0);
    signal Add_4_re_4_re_add_1_0_a : std_logic_vector(17 downto 0);
    signal Add_4_re_4_re_add_1_0_b : std_logic_vector(17 downto 0);
    signal Add_4_re_4_re_add_1_0_o : std_logic_vector (17 downto 0);
    signal Add_4_re_4_re_add_1_0_q : std_logic_vector (17 downto 0);
    signal Add_4_re_4_re_add_1_1_a : std_logic_vector(17 downto 0);
    signal Add_4_re_4_re_add_1_1_b : std_logic_vector(17 downto 0);
    signal Add_4_re_4_re_add_1_1_o : std_logic_vector (17 downto 0);
    signal Add_4_re_4_re_add_1_1_q : std_logic_vector (17 downto 0);
    signal Add_4_re_4_re_add_2_0_a : std_logic_vector(18 downto 0);
    signal Add_4_re_4_re_add_2_0_b : std_logic_vector(18 downto 0);
    signal Add_4_re_4_re_add_2_0_o : std_logic_vector (18 downto 0);
    signal Add_4_re_4_re_add_2_0_q : std_logic_vector (18 downto 0);
    signal Add_4_im_4_im_add_0_0_a : std_logic_vector(16 downto 0);
    signal Add_4_im_4_im_add_0_0_b : std_logic_vector(16 downto 0);
    signal Add_4_im_4_im_add_0_0_o : std_logic_vector (16 downto 0);
    signal Add_4_im_4_im_add_0_0_q : std_logic_vector (16 downto 0);
    signal Add_4_im_4_im_add_0_1_a : std_logic_vector(16 downto 0);
    signal Add_4_im_4_im_add_0_1_b : std_logic_vector(16 downto 0);
    signal Add_4_im_4_im_add_0_1_o : std_logic_vector (16 downto 0);
    signal Add_4_im_4_im_add_0_1_q : std_logic_vector (16 downto 0);
    signal Add_4_im_4_im_add_0_2_a : std_logic_vector(16 downto 0);
    signal Add_4_im_4_im_add_0_2_b : std_logic_vector(16 downto 0);
    signal Add_4_im_4_im_add_0_2_o : std_logic_vector (16 downto 0);
    signal Add_4_im_4_im_add_0_2_q : std_logic_vector (16 downto 0);
    signal Add_4_im_4_im_add_1_0_a : std_logic_vector(17 downto 0);
    signal Add_4_im_4_im_add_1_0_b : std_logic_vector(17 downto 0);
    signal Add_4_im_4_im_add_1_0_o : std_logic_vector (17 downto 0);
    signal Add_4_im_4_im_add_1_0_q : std_logic_vector (17 downto 0);
    signal Add_4_im_4_im_add_1_1_a : std_logic_vector(17 downto 0);
    signal Add_4_im_4_im_add_1_1_b : std_logic_vector(17 downto 0);
    signal Add_4_im_4_im_add_1_1_o : std_logic_vector (17 downto 0);
    signal Add_4_im_4_im_add_1_1_q : std_logic_vector (17 downto 0);
    signal Add_4_im_4_im_add_2_0_a : std_logic_vector(18 downto 0);
    signal Add_4_im_4_im_add_2_0_b : std_logic_vector(18 downto 0);
    signal Add_4_im_4_im_add_2_0_o : std_logic_vector (18 downto 0);
    signal Add_4_im_4_im_add_2_0_q : std_logic_vector (18 downto 0);
    signal Add_5_re_5_re_add_0_0_a : std_logic_vector(16 downto 0);
    signal Add_5_re_5_re_add_0_0_b : std_logic_vector(16 downto 0);
    signal Add_5_re_5_re_add_0_0_o : std_logic_vector (16 downto 0);
    signal Add_5_re_5_re_add_0_0_q : std_logic_vector (16 downto 0);
    signal Add_5_re_5_re_add_0_1_a : std_logic_vector(16 downto 0);
    signal Add_5_re_5_re_add_0_1_b : std_logic_vector(16 downto 0);
    signal Add_5_re_5_re_add_0_1_o : std_logic_vector (16 downto 0);
    signal Add_5_re_5_re_add_0_1_q : std_logic_vector (16 downto 0);
    signal Add_5_re_5_re_add_0_2_a : std_logic_vector(16 downto 0);
    signal Add_5_re_5_re_add_0_2_b : std_logic_vector(16 downto 0);
    signal Add_5_re_5_re_add_0_2_o : std_logic_vector (16 downto 0);
    signal Add_5_re_5_re_add_0_2_q : std_logic_vector (16 downto 0);
    signal Add_5_re_5_re_add_1_0_a : std_logic_vector(17 downto 0);
    signal Add_5_re_5_re_add_1_0_b : std_logic_vector(17 downto 0);
    signal Add_5_re_5_re_add_1_0_o : std_logic_vector (17 downto 0);
    signal Add_5_re_5_re_add_1_0_q : std_logic_vector (17 downto 0);
    signal Add_5_re_5_re_add_1_1_a : std_logic_vector(17 downto 0);
    signal Add_5_re_5_re_add_1_1_b : std_logic_vector(17 downto 0);
    signal Add_5_re_5_re_add_1_1_o : std_logic_vector (17 downto 0);
    signal Add_5_re_5_re_add_1_1_q : std_logic_vector (17 downto 0);
    signal Add_5_re_5_re_add_2_0_a : std_logic_vector(18 downto 0);
    signal Add_5_re_5_re_add_2_0_b : std_logic_vector(18 downto 0);
    signal Add_5_re_5_re_add_2_0_o : std_logic_vector (18 downto 0);
    signal Add_5_re_5_re_add_2_0_q : std_logic_vector (18 downto 0);
    signal Add_5_im_5_im_add_0_0_a : std_logic_vector(16 downto 0);
    signal Add_5_im_5_im_add_0_0_b : std_logic_vector(16 downto 0);
    signal Add_5_im_5_im_add_0_0_o : std_logic_vector (16 downto 0);
    signal Add_5_im_5_im_add_0_0_q : std_logic_vector (16 downto 0);
    signal Add_5_im_5_im_add_0_1_a : std_logic_vector(16 downto 0);
    signal Add_5_im_5_im_add_0_1_b : std_logic_vector(16 downto 0);
    signal Add_5_im_5_im_add_0_1_o : std_logic_vector (16 downto 0);
    signal Add_5_im_5_im_add_0_1_q : std_logic_vector (16 downto 0);
    signal Add_5_im_5_im_add_0_2_a : std_logic_vector(16 downto 0);
    signal Add_5_im_5_im_add_0_2_b : std_logic_vector(16 downto 0);
    signal Add_5_im_5_im_add_0_2_o : std_logic_vector (16 downto 0);
    signal Add_5_im_5_im_add_0_2_q : std_logic_vector (16 downto 0);
    signal Add_5_im_5_im_add_1_0_a : std_logic_vector(17 downto 0);
    signal Add_5_im_5_im_add_1_0_b : std_logic_vector(17 downto 0);
    signal Add_5_im_5_im_add_1_0_o : std_logic_vector (17 downto 0);
    signal Add_5_im_5_im_add_1_0_q : std_logic_vector (17 downto 0);
    signal Add_5_im_5_im_add_1_1_a : std_logic_vector(17 downto 0);
    signal Add_5_im_5_im_add_1_1_b : std_logic_vector(17 downto 0);
    signal Add_5_im_5_im_add_1_1_o : std_logic_vector (17 downto 0);
    signal Add_5_im_5_im_add_1_1_q : std_logic_vector (17 downto 0);
    signal Add_5_im_5_im_add_2_0_a : std_logic_vector(18 downto 0);
    signal Add_5_im_5_im_add_2_0_b : std_logic_vector(18 downto 0);
    signal Add_5_im_5_im_add_2_0_o : std_logic_vector (18 downto 0);
    signal Add_5_im_5_im_add_2_0_q : std_logic_vector (18 downto 0);
    signal Add_6_re_6_re_add_0_0_a : std_logic_vector(16 downto 0);
    signal Add_6_re_6_re_add_0_0_b : std_logic_vector(16 downto 0);
    signal Add_6_re_6_re_add_0_0_o : std_logic_vector (16 downto 0);
    signal Add_6_re_6_re_add_0_0_q : std_logic_vector (16 downto 0);
    signal Add_6_re_6_re_add_0_1_a : std_logic_vector(16 downto 0);
    signal Add_6_re_6_re_add_0_1_b : std_logic_vector(16 downto 0);
    signal Add_6_re_6_re_add_0_1_o : std_logic_vector (16 downto 0);
    signal Add_6_re_6_re_add_0_1_q : std_logic_vector (16 downto 0);
    signal Add_6_re_6_re_add_0_2_a : std_logic_vector(16 downto 0);
    signal Add_6_re_6_re_add_0_2_b : std_logic_vector(16 downto 0);
    signal Add_6_re_6_re_add_0_2_o : std_logic_vector (16 downto 0);
    signal Add_6_re_6_re_add_0_2_q : std_logic_vector (16 downto 0);
    signal Add_6_re_6_re_add_1_0_a : std_logic_vector(17 downto 0);
    signal Add_6_re_6_re_add_1_0_b : std_logic_vector(17 downto 0);
    signal Add_6_re_6_re_add_1_0_o : std_logic_vector (17 downto 0);
    signal Add_6_re_6_re_add_1_0_q : std_logic_vector (17 downto 0);
    signal Add_6_re_6_re_add_1_1_a : std_logic_vector(17 downto 0);
    signal Add_6_re_6_re_add_1_1_b : std_logic_vector(17 downto 0);
    signal Add_6_re_6_re_add_1_1_o : std_logic_vector (17 downto 0);
    signal Add_6_re_6_re_add_1_1_q : std_logic_vector (17 downto 0);
    signal Add_6_re_6_re_add_2_0_a : std_logic_vector(18 downto 0);
    signal Add_6_re_6_re_add_2_0_b : std_logic_vector(18 downto 0);
    signal Add_6_re_6_re_add_2_0_o : std_logic_vector (18 downto 0);
    signal Add_6_re_6_re_add_2_0_q : std_logic_vector (18 downto 0);
    signal Add_6_im_6_im_add_0_0_a : std_logic_vector(16 downto 0);
    signal Add_6_im_6_im_add_0_0_b : std_logic_vector(16 downto 0);
    signal Add_6_im_6_im_add_0_0_o : std_logic_vector (16 downto 0);
    signal Add_6_im_6_im_add_0_0_q : std_logic_vector (16 downto 0);
    signal Add_6_im_6_im_add_0_1_a : std_logic_vector(16 downto 0);
    signal Add_6_im_6_im_add_0_1_b : std_logic_vector(16 downto 0);
    signal Add_6_im_6_im_add_0_1_o : std_logic_vector (16 downto 0);
    signal Add_6_im_6_im_add_0_1_q : std_logic_vector (16 downto 0);
    signal Add_6_im_6_im_add_0_2_a : std_logic_vector(16 downto 0);
    signal Add_6_im_6_im_add_0_2_b : std_logic_vector(16 downto 0);
    signal Add_6_im_6_im_add_0_2_o : std_logic_vector (16 downto 0);
    signal Add_6_im_6_im_add_0_2_q : std_logic_vector (16 downto 0);
    signal Add_6_im_6_im_add_1_0_a : std_logic_vector(17 downto 0);
    signal Add_6_im_6_im_add_1_0_b : std_logic_vector(17 downto 0);
    signal Add_6_im_6_im_add_1_0_o : std_logic_vector (17 downto 0);
    signal Add_6_im_6_im_add_1_0_q : std_logic_vector (17 downto 0);
    signal Add_6_im_6_im_add_1_1_a : std_logic_vector(17 downto 0);
    signal Add_6_im_6_im_add_1_1_b : std_logic_vector(17 downto 0);
    signal Add_6_im_6_im_add_1_1_o : std_logic_vector (17 downto 0);
    signal Add_6_im_6_im_add_1_1_q : std_logic_vector (17 downto 0);
    signal Add_6_im_6_im_add_2_0_a : std_logic_vector(18 downto 0);
    signal Add_6_im_6_im_add_2_0_b : std_logic_vector(18 downto 0);
    signal Add_6_im_6_im_add_2_0_o : std_logic_vector (18 downto 0);
    signal Add_6_im_6_im_add_2_0_q : std_logic_vector (18 downto 0);
    signal Add_7_re_7_re_add_0_0_a : std_logic_vector(16 downto 0);
    signal Add_7_re_7_re_add_0_0_b : std_logic_vector(16 downto 0);
    signal Add_7_re_7_re_add_0_0_o : std_logic_vector (16 downto 0);
    signal Add_7_re_7_re_add_0_0_q : std_logic_vector (16 downto 0);
    signal Add_7_re_7_re_add_0_1_a : std_logic_vector(16 downto 0);
    signal Add_7_re_7_re_add_0_1_b : std_logic_vector(16 downto 0);
    signal Add_7_re_7_re_add_0_1_o : std_logic_vector (16 downto 0);
    signal Add_7_re_7_re_add_0_1_q : std_logic_vector (16 downto 0);
    signal Add_7_re_7_re_add_0_2_a : std_logic_vector(16 downto 0);
    signal Add_7_re_7_re_add_0_2_b : std_logic_vector(16 downto 0);
    signal Add_7_re_7_re_add_0_2_o : std_logic_vector (16 downto 0);
    signal Add_7_re_7_re_add_0_2_q : std_logic_vector (16 downto 0);
    signal Add_7_re_7_re_add_1_0_a : std_logic_vector(17 downto 0);
    signal Add_7_re_7_re_add_1_0_b : std_logic_vector(17 downto 0);
    signal Add_7_re_7_re_add_1_0_o : std_logic_vector (17 downto 0);
    signal Add_7_re_7_re_add_1_0_q : std_logic_vector (17 downto 0);
    signal Add_7_re_7_re_add_1_1_a : std_logic_vector(17 downto 0);
    signal Add_7_re_7_re_add_1_1_b : std_logic_vector(17 downto 0);
    signal Add_7_re_7_re_add_1_1_o : std_logic_vector (17 downto 0);
    signal Add_7_re_7_re_add_1_1_q : std_logic_vector (17 downto 0);
    signal Add_7_re_7_re_add_2_0_a : std_logic_vector(18 downto 0);
    signal Add_7_re_7_re_add_2_0_b : std_logic_vector(18 downto 0);
    signal Add_7_re_7_re_add_2_0_o : std_logic_vector (18 downto 0);
    signal Add_7_re_7_re_add_2_0_q : std_logic_vector (18 downto 0);
    signal Add_7_im_7_im_add_0_0_a : std_logic_vector(16 downto 0);
    signal Add_7_im_7_im_add_0_0_b : std_logic_vector(16 downto 0);
    signal Add_7_im_7_im_add_0_0_o : std_logic_vector (16 downto 0);
    signal Add_7_im_7_im_add_0_0_q : std_logic_vector (16 downto 0);
    signal Add_7_im_7_im_add_0_1_a : std_logic_vector(16 downto 0);
    signal Add_7_im_7_im_add_0_1_b : std_logic_vector(16 downto 0);
    signal Add_7_im_7_im_add_0_1_o : std_logic_vector (16 downto 0);
    signal Add_7_im_7_im_add_0_1_q : std_logic_vector (16 downto 0);
    signal Add_7_im_7_im_add_0_2_a : std_logic_vector(16 downto 0);
    signal Add_7_im_7_im_add_0_2_b : std_logic_vector(16 downto 0);
    signal Add_7_im_7_im_add_0_2_o : std_logic_vector (16 downto 0);
    signal Add_7_im_7_im_add_0_2_q : std_logic_vector (16 downto 0);
    signal Add_7_im_7_im_add_1_0_a : std_logic_vector(17 downto 0);
    signal Add_7_im_7_im_add_1_0_b : std_logic_vector(17 downto 0);
    signal Add_7_im_7_im_add_1_0_o : std_logic_vector (17 downto 0);
    signal Add_7_im_7_im_add_1_0_q : std_logic_vector (17 downto 0);
    signal Add_7_im_7_im_add_1_1_a : std_logic_vector(17 downto 0);
    signal Add_7_im_7_im_add_1_1_b : std_logic_vector(17 downto 0);
    signal Add_7_im_7_im_add_1_1_o : std_logic_vector (17 downto 0);
    signal Add_7_im_7_im_add_1_1_q : std_logic_vector (17 downto 0);
    signal Add_7_im_7_im_add_2_0_a : std_logic_vector(18 downto 0);
    signal Add_7_im_7_im_add_2_0_b : std_logic_vector(18 downto 0);
    signal Add_7_im_7_im_add_2_0_o : std_logic_vector (18 downto 0);
    signal Add_7_im_7_im_add_2_0_q : std_logic_vector (18 downto 0);
begin


	--GND(CONSTANT,0)
    GND_q <= "0";

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--Inc_auto(GPIN,48)

	--Inv_auto(GPIN,50)

	--Ind_auto(GPIN,49)

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7(BLACKBOX,29)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_busIn_d <= busIn_d;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_busIn_a <= busIn_a;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_busIn_w <= busIn_w;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_In1_s <= Ind_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_In2_s <= Inv_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_In3_s <= Inc_s;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7 port map (
        busIn_d => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_busIn_d,
        busIn_a => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_busIn_a,
        busIn_w => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_busIn_w,
        In1_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_In1_s,
        In2_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_In2_s,
        In3_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_In3_s,
        Out1_0re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_0re,
        Out1_0im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_0im,
        Out1_1re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_1re,
        Out1_1im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_1im,
        Out1_2re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_2re,
        Out1_2im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_2im,
        Out1_3re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_3re,
        Out1_3im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_3im,
        Out1_4re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_4re,
        Out1_4im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_4im,
        Out1_5re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_5re,
        Out1_5im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_5im,
        Out1_6re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_6re,
        Out1_6im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_6im,
        Out1_7re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_7re,
        Out1_7im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_7im,
        clk => clk,
        areset => areset,
        bus_clk => bus_clk,
        bus_areset => bus_areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6(BLACKBOX,28)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_busIn_d <= busIn_d;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_busIn_a <= busIn_a;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_busIn_w <= busIn_w;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_In1_s <= Ind_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_In2_s <= Inv_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_In3_s <= Inc_s;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6 port map (
        busIn_d => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_busIn_d,
        busIn_a => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_busIn_a,
        busIn_w => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_busIn_w,
        In1_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_In1_s,
        In2_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_In2_s,
        In3_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_In3_s,
        Out1_0re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_0re,
        Out1_0im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_0im,
        Out1_1re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_1re,
        Out1_1im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_1im,
        Out1_2re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_2re,
        Out1_2im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_2im,
        Out1_3re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_3re,
        Out1_3im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_3im,
        Out1_4re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_4re,
        Out1_4im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_4im,
        Out1_5re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_5re,
        Out1_5im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_5im,
        Out1_6re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_6re,
        Out1_6im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_6im,
        Out1_7re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_7re,
        Out1_7im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_7im,
        clk => clk,
        areset => areset,
        bus_clk => bus_clk,
        bus_areset => bus_areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5(BLACKBOX,27)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_busIn_d <= busIn_d;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_busIn_a <= busIn_a;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_busIn_w <= busIn_w;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_In1_s <= Ind_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_In2_s <= Inv_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_In3_s <= Inc_s;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5 port map (
        busIn_d => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_busIn_d,
        busIn_a => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_busIn_a,
        busIn_w => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_busIn_w,
        In1_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_In1_s,
        In2_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_In2_s,
        In3_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_In3_s,
        Out1_0re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_0re,
        Out1_0im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_0im,
        Out1_1re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_1re,
        Out1_1im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_1im,
        Out1_2re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_2re,
        Out1_2im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_2im,
        Out1_3re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_3re,
        Out1_3im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_3im,
        Out1_4re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_4re,
        Out1_4im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_4im,
        Out1_5re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_5re,
        Out1_5im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_5im,
        Out1_6re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_6re,
        Out1_6im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_6im,
        Out1_7re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_7re,
        Out1_7im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_7im,
        clk => clk,
        areset => areset,
        bus_clk => bus_clk,
        bus_areset => bus_areset
        );

	--Add_7_re_7_re_add_0_2(ADD,145)
    Add_7_re_7_re_add_0_2_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_7re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_7re);
    Add_7_re_7_re_add_0_2_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_7re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_7re);
    Add_7_re_7_re_add_0_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_7_re_7_re_add_0_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_7_re_7_re_add_0_2_o <= STD_LOGIC_VECTOR(SIGNED(Add_7_re_7_re_add_0_2_a) + SIGNED(Add_7_re_7_re_add_0_2_b));
        END IF;
    END PROCESS;
    Add_7_re_7_re_add_0_2_q <= Add_7_re_7_re_add_0_2_o(16 downto 0);


	--Add_7_re_7_re_add_1_1(ADD,147)
    Add_7_re_7_re_add_1_1_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_7_re_7_re_add_0_2_q(16)) & Add_7_re_7_re_add_0_2_q);
    Add_7_re_7_re_add_1_1_b <= STD_LOGIC_VECTOR((17 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_7re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_7re);
    Add_7_re_7_re_add_1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_7_re_7_re_add_1_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_7_re_7_re_add_1_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_7_re_7_re_add_1_1_a) + SIGNED(Add_7_re_7_re_add_1_1_b));
        END IF;
    END PROCESS;
    Add_7_re_7_re_add_1_1_q <= Add_7_re_7_re_add_1_1_o(17 downto 0);


	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4(BLACKBOX,26)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_busIn_d <= busIn_d;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_busIn_a <= busIn_a;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_busIn_w <= busIn_w;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_In1_s <= Ind_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_In2_s <= Inv_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_In3_s <= Inc_s;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4 port map (
        busIn_d => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_busIn_d,
        busIn_a => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_busIn_a,
        busIn_w => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_busIn_w,
        In1_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_In1_s,
        In2_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_In2_s,
        In3_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_In3_s,
        Out1_0re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_0re,
        Out1_0im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_0im,
        Out1_1re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_1re,
        Out1_1im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_1im,
        Out1_2re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_2re,
        Out1_2im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_2im,
        Out1_3re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_3re,
        Out1_3im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_3im,
        Out1_4re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_4re,
        Out1_4im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_4im,
        Out1_5re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_5re,
        Out1_5im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_5im,
        Out1_6re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_6re,
        Out1_6im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_6im,
        Out1_7re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_7re,
        Out1_7im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_7im,
        clk => clk,
        areset => areset,
        bus_clk => bus_clk,
        bus_areset => bus_areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3(BLACKBOX,25)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_busIn_d <= busIn_d;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_busIn_a <= busIn_a;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_busIn_w <= busIn_w;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_In1_s <= Ind_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_In2_s <= Inv_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_In3_s <= Inc_s;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3 port map (
        busIn_d => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_busIn_d,
        busIn_a => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_busIn_a,
        busIn_w => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_busIn_w,
        In1_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_In1_s,
        In2_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_In2_s,
        In3_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_In3_s,
        Out1_0re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_0re,
        Out1_0im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_0im,
        Out1_1re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_1re,
        Out1_1im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_1im,
        Out1_2re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_2re,
        Out1_2im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_2im,
        Out1_3re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_3re,
        Out1_3im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_3im,
        Out1_4re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_4re,
        Out1_4im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_4im,
        Out1_5re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_5re,
        Out1_5im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_5im,
        Out1_6re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_6re,
        Out1_6im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_6im,
        Out1_7re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_7re,
        Out1_7im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_7im,
        clk => clk,
        areset => areset,
        bus_clk => bus_clk,
        bus_areset => bus_areset
        );

	--Add_7_re_7_re_add_0_1(ADD,144)
    Add_7_re_7_re_add_0_1_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_7re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_7re);
    Add_7_re_7_re_add_0_1_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_7re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_7re);
    Add_7_re_7_re_add_0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_7_re_7_re_add_0_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_7_re_7_re_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_7_re_7_re_add_0_1_a) + SIGNED(Add_7_re_7_re_add_0_1_b));
        END IF;
    END PROCESS;
    Add_7_re_7_re_add_0_1_q <= Add_7_re_7_re_add_0_1_o(16 downto 0);


	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2(BLACKBOX,24)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_busIn_d <= busIn_d;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_busIn_a <= busIn_a;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_busIn_w <= busIn_w;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_In1_s <= Ind_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_In2_s <= Inv_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_In3_s <= Inc_s;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2 port map (
        busIn_d => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_busIn_d,
        busIn_a => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_busIn_a,
        busIn_w => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_busIn_w,
        In1_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_In1_s,
        In2_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_In2_s,
        In3_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_In3_s,
        Out1_0re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_0re,
        Out1_0im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_0im,
        Out1_1re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_1re,
        Out1_1im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_1im,
        Out1_2re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_2re,
        Out1_2im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_2im,
        Out1_3re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_3re,
        Out1_3im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_3im,
        Out1_4re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_4re,
        Out1_4im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_4im,
        Out1_5re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_5re,
        Out1_5im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_5im,
        Out1_6re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_6re,
        Out1_6im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_6im,
        Out1_7re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_7re,
        Out1_7im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_7im,
        clk => clk,
        areset => areset,
        bus_clk => bus_clk,
        bus_areset => bus_areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1(BLACKBOX,23)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_busIn_d <= busIn_d;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_busIn_a <= busIn_a;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_busIn_w <= busIn_w;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_In1_s <= Ind_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_In2_s <= Inv_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_In3_s <= Inc_s;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1 port map (
        busIn_d => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_busIn_d,
        busIn_a => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_busIn_a,
        busIn_w => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_busIn_w,
        In1_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_In1_s,
        In2_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_In2_s,
        In3_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_In3_s,
        Out1_0re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_0re,
        Out1_0im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_0im,
        Out1_1re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_1re,
        Out1_1im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_1im,
        Out1_2re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_2re,
        Out1_2im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_2im,
        Out1_3re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_3re,
        Out1_3im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_3im,
        Out1_4re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_4re,
        Out1_4im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_4im,
        Out1_5re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_5re,
        Out1_5im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_5im,
        Out1_6re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_6re,
        Out1_6im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_6im,
        Out1_7re => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_7re,
        Out1_7im => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_7im,
        clk => clk,
        areset => areset,
        bus_clk => bus_clk,
        bus_areset => bus_areset
        );

	--Add_7_re_7_re_add_0_0(ADD,143)
    Add_7_re_7_re_add_0_0_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_7re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_7re);
    Add_7_re_7_re_add_0_0_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_7re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_7re);
    Add_7_re_7_re_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_7_re_7_re_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_7_re_7_re_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_7_re_7_re_add_0_0_a) + SIGNED(Add_7_re_7_re_add_0_0_b));
        END IF;
    END PROCESS;
    Add_7_re_7_re_add_0_0_q <= Add_7_re_7_re_add_0_0_o(16 downto 0);


	--Add_7_re_7_re_add_1_0(ADD,146)
    Add_7_re_7_re_add_1_0_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_7_re_7_re_add_0_0_q(16)) & Add_7_re_7_re_add_0_0_q);
    Add_7_re_7_re_add_1_0_b <= STD_LOGIC_VECTOR((17 downto 17 => Add_7_re_7_re_add_0_1_q(16)) & Add_7_re_7_re_add_0_1_q);
    Add_7_re_7_re_add_1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_7_re_7_re_add_1_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_7_re_7_re_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_7_re_7_re_add_1_0_a) + SIGNED(Add_7_re_7_re_add_1_0_b));
        END IF;
    END PROCESS;
    Add_7_re_7_re_add_1_0_q <= Add_7_re_7_re_add_1_0_o(17 downto 0);


	--Add_7_re_7_re_add_2_0(ADD,148)
    Add_7_re_7_re_add_2_0_a <= STD_LOGIC_VECTOR((18 downto 18 => Add_7_re_7_re_add_1_0_q(17)) & Add_7_re_7_re_add_1_0_q);
    Add_7_re_7_re_add_2_0_b <= STD_LOGIC_VECTOR((18 downto 18 => Add_7_re_7_re_add_1_1_q(17)) & Add_7_re_7_re_add_1_1_q);
    Add_7_re_7_re_add_2_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_7_re_7_re_add_2_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_7_re_7_re_add_2_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_7_re_7_re_add_2_0_a) + SIGNED(Add_7_re_7_re_add_2_0_b));
        END IF;
    END PROCESS;
    Add_7_re_7_re_add_2_0_q <= Add_7_re_7_re_add_2_0_o(18 downto 0);


	--Add_6_re_6_re_add_0_2(ADD,133)
    Add_6_re_6_re_add_0_2_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_6re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_6re);
    Add_6_re_6_re_add_0_2_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_6re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_6re);
    Add_6_re_6_re_add_0_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_6_re_6_re_add_0_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_6_re_6_re_add_0_2_o <= STD_LOGIC_VECTOR(SIGNED(Add_6_re_6_re_add_0_2_a) + SIGNED(Add_6_re_6_re_add_0_2_b));
        END IF;
    END PROCESS;
    Add_6_re_6_re_add_0_2_q <= Add_6_re_6_re_add_0_2_o(16 downto 0);


	--Add_6_re_6_re_add_1_1(ADD,135)
    Add_6_re_6_re_add_1_1_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_6_re_6_re_add_0_2_q(16)) & Add_6_re_6_re_add_0_2_q);
    Add_6_re_6_re_add_1_1_b <= STD_LOGIC_VECTOR((17 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_6re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_6re);
    Add_6_re_6_re_add_1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_6_re_6_re_add_1_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_6_re_6_re_add_1_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_6_re_6_re_add_1_1_a) + SIGNED(Add_6_re_6_re_add_1_1_b));
        END IF;
    END PROCESS;
    Add_6_re_6_re_add_1_1_q <= Add_6_re_6_re_add_1_1_o(17 downto 0);


	--Add_6_re_6_re_add_0_1(ADD,132)
    Add_6_re_6_re_add_0_1_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_6re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_6re);
    Add_6_re_6_re_add_0_1_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_6re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_6re);
    Add_6_re_6_re_add_0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_6_re_6_re_add_0_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_6_re_6_re_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_6_re_6_re_add_0_1_a) + SIGNED(Add_6_re_6_re_add_0_1_b));
        END IF;
    END PROCESS;
    Add_6_re_6_re_add_0_1_q <= Add_6_re_6_re_add_0_1_o(16 downto 0);


	--Add_6_re_6_re_add_0_0(ADD,131)
    Add_6_re_6_re_add_0_0_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_6re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_6re);
    Add_6_re_6_re_add_0_0_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_6re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_6re);
    Add_6_re_6_re_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_6_re_6_re_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_6_re_6_re_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_6_re_6_re_add_0_0_a) + SIGNED(Add_6_re_6_re_add_0_0_b));
        END IF;
    END PROCESS;
    Add_6_re_6_re_add_0_0_q <= Add_6_re_6_re_add_0_0_o(16 downto 0);


	--Add_6_re_6_re_add_1_0(ADD,134)
    Add_6_re_6_re_add_1_0_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_6_re_6_re_add_0_0_q(16)) & Add_6_re_6_re_add_0_0_q);
    Add_6_re_6_re_add_1_0_b <= STD_LOGIC_VECTOR((17 downto 17 => Add_6_re_6_re_add_0_1_q(16)) & Add_6_re_6_re_add_0_1_q);
    Add_6_re_6_re_add_1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_6_re_6_re_add_1_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_6_re_6_re_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_6_re_6_re_add_1_0_a) + SIGNED(Add_6_re_6_re_add_1_0_b));
        END IF;
    END PROCESS;
    Add_6_re_6_re_add_1_0_q <= Add_6_re_6_re_add_1_0_o(17 downto 0);


	--Add_6_re_6_re_add_2_0(ADD,136)
    Add_6_re_6_re_add_2_0_a <= STD_LOGIC_VECTOR((18 downto 18 => Add_6_re_6_re_add_1_0_q(17)) & Add_6_re_6_re_add_1_0_q);
    Add_6_re_6_re_add_2_0_b <= STD_LOGIC_VECTOR((18 downto 18 => Add_6_re_6_re_add_1_1_q(17)) & Add_6_re_6_re_add_1_1_q);
    Add_6_re_6_re_add_2_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_6_re_6_re_add_2_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_6_re_6_re_add_2_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_6_re_6_re_add_2_0_a) + SIGNED(Add_6_re_6_re_add_2_0_b));
        END IF;
    END PROCESS;
    Add_6_re_6_re_add_2_0_q <= Add_6_re_6_re_add_2_0_o(18 downto 0);


	--Add_5_re_5_re_add_0_2(ADD,121)
    Add_5_re_5_re_add_0_2_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_5re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_5re);
    Add_5_re_5_re_add_0_2_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_5re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_5re);
    Add_5_re_5_re_add_0_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_5_re_5_re_add_0_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_5_re_5_re_add_0_2_o <= STD_LOGIC_VECTOR(SIGNED(Add_5_re_5_re_add_0_2_a) + SIGNED(Add_5_re_5_re_add_0_2_b));
        END IF;
    END PROCESS;
    Add_5_re_5_re_add_0_2_q <= Add_5_re_5_re_add_0_2_o(16 downto 0);


	--Add_5_re_5_re_add_1_1(ADD,123)
    Add_5_re_5_re_add_1_1_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_5_re_5_re_add_0_2_q(16)) & Add_5_re_5_re_add_0_2_q);
    Add_5_re_5_re_add_1_1_b <= STD_LOGIC_VECTOR((17 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_5re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_5re);
    Add_5_re_5_re_add_1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_5_re_5_re_add_1_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_5_re_5_re_add_1_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_5_re_5_re_add_1_1_a) + SIGNED(Add_5_re_5_re_add_1_1_b));
        END IF;
    END PROCESS;
    Add_5_re_5_re_add_1_1_q <= Add_5_re_5_re_add_1_1_o(17 downto 0);


	--Add_5_re_5_re_add_0_1(ADD,120)
    Add_5_re_5_re_add_0_1_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_5re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_5re);
    Add_5_re_5_re_add_0_1_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_5re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_5re);
    Add_5_re_5_re_add_0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_5_re_5_re_add_0_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_5_re_5_re_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_5_re_5_re_add_0_1_a) + SIGNED(Add_5_re_5_re_add_0_1_b));
        END IF;
    END PROCESS;
    Add_5_re_5_re_add_0_1_q <= Add_5_re_5_re_add_0_1_o(16 downto 0);


	--Add_5_re_5_re_add_0_0(ADD,119)
    Add_5_re_5_re_add_0_0_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_5re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_5re);
    Add_5_re_5_re_add_0_0_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_5re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_5re);
    Add_5_re_5_re_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_5_re_5_re_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_5_re_5_re_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_5_re_5_re_add_0_0_a) + SIGNED(Add_5_re_5_re_add_0_0_b));
        END IF;
    END PROCESS;
    Add_5_re_5_re_add_0_0_q <= Add_5_re_5_re_add_0_0_o(16 downto 0);


	--Add_5_re_5_re_add_1_0(ADD,122)
    Add_5_re_5_re_add_1_0_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_5_re_5_re_add_0_0_q(16)) & Add_5_re_5_re_add_0_0_q);
    Add_5_re_5_re_add_1_0_b <= STD_LOGIC_VECTOR((17 downto 17 => Add_5_re_5_re_add_0_1_q(16)) & Add_5_re_5_re_add_0_1_q);
    Add_5_re_5_re_add_1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_5_re_5_re_add_1_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_5_re_5_re_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_5_re_5_re_add_1_0_a) + SIGNED(Add_5_re_5_re_add_1_0_b));
        END IF;
    END PROCESS;
    Add_5_re_5_re_add_1_0_q <= Add_5_re_5_re_add_1_0_o(17 downto 0);


	--Add_5_re_5_re_add_2_0(ADD,124)
    Add_5_re_5_re_add_2_0_a <= STD_LOGIC_VECTOR((18 downto 18 => Add_5_re_5_re_add_1_0_q(17)) & Add_5_re_5_re_add_1_0_q);
    Add_5_re_5_re_add_2_0_b <= STD_LOGIC_VECTOR((18 downto 18 => Add_5_re_5_re_add_1_1_q(17)) & Add_5_re_5_re_add_1_1_q);
    Add_5_re_5_re_add_2_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_5_re_5_re_add_2_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_5_re_5_re_add_2_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_5_re_5_re_add_2_0_a) + SIGNED(Add_5_re_5_re_add_2_0_b));
        END IF;
    END PROCESS;
    Add_5_re_5_re_add_2_0_q <= Add_5_re_5_re_add_2_0_o(18 downto 0);


	--Add_4_re_4_re_add_0_2(ADD,109)
    Add_4_re_4_re_add_0_2_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_4re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_4re);
    Add_4_re_4_re_add_0_2_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_4re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_4re);
    Add_4_re_4_re_add_0_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_4_re_4_re_add_0_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_4_re_4_re_add_0_2_o <= STD_LOGIC_VECTOR(SIGNED(Add_4_re_4_re_add_0_2_a) + SIGNED(Add_4_re_4_re_add_0_2_b));
        END IF;
    END PROCESS;
    Add_4_re_4_re_add_0_2_q <= Add_4_re_4_re_add_0_2_o(16 downto 0);


	--Add_4_re_4_re_add_1_1(ADD,111)
    Add_4_re_4_re_add_1_1_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_4_re_4_re_add_0_2_q(16)) & Add_4_re_4_re_add_0_2_q);
    Add_4_re_4_re_add_1_1_b <= STD_LOGIC_VECTOR((17 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_4re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_4re);
    Add_4_re_4_re_add_1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_4_re_4_re_add_1_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_4_re_4_re_add_1_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_4_re_4_re_add_1_1_a) + SIGNED(Add_4_re_4_re_add_1_1_b));
        END IF;
    END PROCESS;
    Add_4_re_4_re_add_1_1_q <= Add_4_re_4_re_add_1_1_o(17 downto 0);


	--Add_4_re_4_re_add_0_1(ADD,108)
    Add_4_re_4_re_add_0_1_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_4re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_4re);
    Add_4_re_4_re_add_0_1_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_4re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_4re);
    Add_4_re_4_re_add_0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_4_re_4_re_add_0_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_4_re_4_re_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_4_re_4_re_add_0_1_a) + SIGNED(Add_4_re_4_re_add_0_1_b));
        END IF;
    END PROCESS;
    Add_4_re_4_re_add_0_1_q <= Add_4_re_4_re_add_0_1_o(16 downto 0);


	--Add_4_re_4_re_add_0_0(ADD,107)
    Add_4_re_4_re_add_0_0_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_4re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_4re);
    Add_4_re_4_re_add_0_0_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_4re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_4re);
    Add_4_re_4_re_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_4_re_4_re_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_4_re_4_re_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_4_re_4_re_add_0_0_a) + SIGNED(Add_4_re_4_re_add_0_0_b));
        END IF;
    END PROCESS;
    Add_4_re_4_re_add_0_0_q <= Add_4_re_4_re_add_0_0_o(16 downto 0);


	--Add_4_re_4_re_add_1_0(ADD,110)
    Add_4_re_4_re_add_1_0_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_4_re_4_re_add_0_0_q(16)) & Add_4_re_4_re_add_0_0_q);
    Add_4_re_4_re_add_1_0_b <= STD_LOGIC_VECTOR((17 downto 17 => Add_4_re_4_re_add_0_1_q(16)) & Add_4_re_4_re_add_0_1_q);
    Add_4_re_4_re_add_1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_4_re_4_re_add_1_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_4_re_4_re_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_4_re_4_re_add_1_0_a) + SIGNED(Add_4_re_4_re_add_1_0_b));
        END IF;
    END PROCESS;
    Add_4_re_4_re_add_1_0_q <= Add_4_re_4_re_add_1_0_o(17 downto 0);


	--Add_4_re_4_re_add_2_0(ADD,112)
    Add_4_re_4_re_add_2_0_a <= STD_LOGIC_VECTOR((18 downto 18 => Add_4_re_4_re_add_1_0_q(17)) & Add_4_re_4_re_add_1_0_q);
    Add_4_re_4_re_add_2_0_b <= STD_LOGIC_VECTOR((18 downto 18 => Add_4_re_4_re_add_1_1_q(17)) & Add_4_re_4_re_add_1_1_q);
    Add_4_re_4_re_add_2_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_4_re_4_re_add_2_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_4_re_4_re_add_2_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_4_re_4_re_add_2_0_a) + SIGNED(Add_4_re_4_re_add_2_0_b));
        END IF;
    END PROCESS;
    Add_4_re_4_re_add_2_0_q <= Add_4_re_4_re_add_2_0_o(18 downto 0);


	--Add_3_re_3_re_add_0_2(ADD,97)
    Add_3_re_3_re_add_0_2_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_3re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_3re);
    Add_3_re_3_re_add_0_2_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_3re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_3re);
    Add_3_re_3_re_add_0_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_3_re_3_re_add_0_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_3_re_3_re_add_0_2_o <= STD_LOGIC_VECTOR(SIGNED(Add_3_re_3_re_add_0_2_a) + SIGNED(Add_3_re_3_re_add_0_2_b));
        END IF;
    END PROCESS;
    Add_3_re_3_re_add_0_2_q <= Add_3_re_3_re_add_0_2_o(16 downto 0);


	--Add_3_re_3_re_add_1_1(ADD,99)
    Add_3_re_3_re_add_1_1_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_3_re_3_re_add_0_2_q(16)) & Add_3_re_3_re_add_0_2_q);
    Add_3_re_3_re_add_1_1_b <= STD_LOGIC_VECTOR((17 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_3re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_3re);
    Add_3_re_3_re_add_1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_3_re_3_re_add_1_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_3_re_3_re_add_1_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_3_re_3_re_add_1_1_a) + SIGNED(Add_3_re_3_re_add_1_1_b));
        END IF;
    END PROCESS;
    Add_3_re_3_re_add_1_1_q <= Add_3_re_3_re_add_1_1_o(17 downto 0);


	--Add_3_re_3_re_add_0_1(ADD,96)
    Add_3_re_3_re_add_0_1_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_3re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_3re);
    Add_3_re_3_re_add_0_1_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_3re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_3re);
    Add_3_re_3_re_add_0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_3_re_3_re_add_0_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_3_re_3_re_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_3_re_3_re_add_0_1_a) + SIGNED(Add_3_re_3_re_add_0_1_b));
        END IF;
    END PROCESS;
    Add_3_re_3_re_add_0_1_q <= Add_3_re_3_re_add_0_1_o(16 downto 0);


	--Add_3_re_3_re_add_0_0(ADD,95)
    Add_3_re_3_re_add_0_0_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_3re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_3re);
    Add_3_re_3_re_add_0_0_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_3re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_3re);
    Add_3_re_3_re_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_3_re_3_re_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_3_re_3_re_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_3_re_3_re_add_0_0_a) + SIGNED(Add_3_re_3_re_add_0_0_b));
        END IF;
    END PROCESS;
    Add_3_re_3_re_add_0_0_q <= Add_3_re_3_re_add_0_0_o(16 downto 0);


	--Add_3_re_3_re_add_1_0(ADD,98)
    Add_3_re_3_re_add_1_0_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_3_re_3_re_add_0_0_q(16)) & Add_3_re_3_re_add_0_0_q);
    Add_3_re_3_re_add_1_0_b <= STD_LOGIC_VECTOR((17 downto 17 => Add_3_re_3_re_add_0_1_q(16)) & Add_3_re_3_re_add_0_1_q);
    Add_3_re_3_re_add_1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_3_re_3_re_add_1_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_3_re_3_re_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_3_re_3_re_add_1_0_a) + SIGNED(Add_3_re_3_re_add_1_0_b));
        END IF;
    END PROCESS;
    Add_3_re_3_re_add_1_0_q <= Add_3_re_3_re_add_1_0_o(17 downto 0);


	--Add_3_re_3_re_add_2_0(ADD,100)
    Add_3_re_3_re_add_2_0_a <= STD_LOGIC_VECTOR((18 downto 18 => Add_3_re_3_re_add_1_0_q(17)) & Add_3_re_3_re_add_1_0_q);
    Add_3_re_3_re_add_2_0_b <= STD_LOGIC_VECTOR((18 downto 18 => Add_3_re_3_re_add_1_1_q(17)) & Add_3_re_3_re_add_1_1_q);
    Add_3_re_3_re_add_2_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_3_re_3_re_add_2_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_3_re_3_re_add_2_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_3_re_3_re_add_2_0_a) + SIGNED(Add_3_re_3_re_add_2_0_b));
        END IF;
    END PROCESS;
    Add_3_re_3_re_add_2_0_q <= Add_3_re_3_re_add_2_0_o(18 downto 0);


	--Add_2_re_2_re_add_0_2(ADD,85)
    Add_2_re_2_re_add_0_2_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_2re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_2re);
    Add_2_re_2_re_add_0_2_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_2re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_2re);
    Add_2_re_2_re_add_0_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_2_re_2_re_add_0_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_2_re_2_re_add_0_2_o <= STD_LOGIC_VECTOR(SIGNED(Add_2_re_2_re_add_0_2_a) + SIGNED(Add_2_re_2_re_add_0_2_b));
        END IF;
    END PROCESS;
    Add_2_re_2_re_add_0_2_q <= Add_2_re_2_re_add_0_2_o(16 downto 0);


	--Add_2_re_2_re_add_1_1(ADD,87)
    Add_2_re_2_re_add_1_1_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_2_re_2_re_add_0_2_q(16)) & Add_2_re_2_re_add_0_2_q);
    Add_2_re_2_re_add_1_1_b <= STD_LOGIC_VECTOR((17 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_2re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_2re);
    Add_2_re_2_re_add_1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_2_re_2_re_add_1_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_2_re_2_re_add_1_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_2_re_2_re_add_1_1_a) + SIGNED(Add_2_re_2_re_add_1_1_b));
        END IF;
    END PROCESS;
    Add_2_re_2_re_add_1_1_q <= Add_2_re_2_re_add_1_1_o(17 downto 0);


	--Add_2_re_2_re_add_0_1(ADD,84)
    Add_2_re_2_re_add_0_1_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_2re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_2re);
    Add_2_re_2_re_add_0_1_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_2re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_2re);
    Add_2_re_2_re_add_0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_2_re_2_re_add_0_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_2_re_2_re_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_2_re_2_re_add_0_1_a) + SIGNED(Add_2_re_2_re_add_0_1_b));
        END IF;
    END PROCESS;
    Add_2_re_2_re_add_0_1_q <= Add_2_re_2_re_add_0_1_o(16 downto 0);


	--Add_2_re_2_re_add_0_0(ADD,83)
    Add_2_re_2_re_add_0_0_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_2re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_2re);
    Add_2_re_2_re_add_0_0_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_2re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_2re);
    Add_2_re_2_re_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_2_re_2_re_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_2_re_2_re_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_2_re_2_re_add_0_0_a) + SIGNED(Add_2_re_2_re_add_0_0_b));
        END IF;
    END PROCESS;
    Add_2_re_2_re_add_0_0_q <= Add_2_re_2_re_add_0_0_o(16 downto 0);


	--Add_2_re_2_re_add_1_0(ADD,86)
    Add_2_re_2_re_add_1_0_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_2_re_2_re_add_0_0_q(16)) & Add_2_re_2_re_add_0_0_q);
    Add_2_re_2_re_add_1_0_b <= STD_LOGIC_VECTOR((17 downto 17 => Add_2_re_2_re_add_0_1_q(16)) & Add_2_re_2_re_add_0_1_q);
    Add_2_re_2_re_add_1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_2_re_2_re_add_1_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_2_re_2_re_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_2_re_2_re_add_1_0_a) + SIGNED(Add_2_re_2_re_add_1_0_b));
        END IF;
    END PROCESS;
    Add_2_re_2_re_add_1_0_q <= Add_2_re_2_re_add_1_0_o(17 downto 0);


	--Add_2_re_2_re_add_2_0(ADD,88)
    Add_2_re_2_re_add_2_0_a <= STD_LOGIC_VECTOR((18 downto 18 => Add_2_re_2_re_add_1_0_q(17)) & Add_2_re_2_re_add_1_0_q);
    Add_2_re_2_re_add_2_0_b <= STD_LOGIC_VECTOR((18 downto 18 => Add_2_re_2_re_add_1_1_q(17)) & Add_2_re_2_re_add_1_1_q);
    Add_2_re_2_re_add_2_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_2_re_2_re_add_2_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_2_re_2_re_add_2_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_2_re_2_re_add_2_0_a) + SIGNED(Add_2_re_2_re_add_2_0_b));
        END IF;
    END PROCESS;
    Add_2_re_2_re_add_2_0_q <= Add_2_re_2_re_add_2_0_o(18 downto 0);


	--Add_1_re_1_re_add_0_2(ADD,73)
    Add_1_re_1_re_add_0_2_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_1re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_1re);
    Add_1_re_1_re_add_0_2_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_1re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_1re);
    Add_1_re_1_re_add_0_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_1_re_1_re_add_0_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_1_re_1_re_add_0_2_o <= STD_LOGIC_VECTOR(SIGNED(Add_1_re_1_re_add_0_2_a) + SIGNED(Add_1_re_1_re_add_0_2_b));
        END IF;
    END PROCESS;
    Add_1_re_1_re_add_0_2_q <= Add_1_re_1_re_add_0_2_o(16 downto 0);


	--Add_1_re_1_re_add_1_1(ADD,75)
    Add_1_re_1_re_add_1_1_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_1_re_1_re_add_0_2_q(16)) & Add_1_re_1_re_add_0_2_q);
    Add_1_re_1_re_add_1_1_b <= STD_LOGIC_VECTOR((17 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_1re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_1re);
    Add_1_re_1_re_add_1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_1_re_1_re_add_1_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_1_re_1_re_add_1_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_1_re_1_re_add_1_1_a) + SIGNED(Add_1_re_1_re_add_1_1_b));
        END IF;
    END PROCESS;
    Add_1_re_1_re_add_1_1_q <= Add_1_re_1_re_add_1_1_o(17 downto 0);


	--Add_1_re_1_re_add_0_1(ADD,72)
    Add_1_re_1_re_add_0_1_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_1re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_1re);
    Add_1_re_1_re_add_0_1_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_1re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_1re);
    Add_1_re_1_re_add_0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_1_re_1_re_add_0_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_1_re_1_re_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_1_re_1_re_add_0_1_a) + SIGNED(Add_1_re_1_re_add_0_1_b));
        END IF;
    END PROCESS;
    Add_1_re_1_re_add_0_1_q <= Add_1_re_1_re_add_0_1_o(16 downto 0);


	--Add_1_re_1_re_add_0_0(ADD,71)
    Add_1_re_1_re_add_0_0_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_1re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_1re);
    Add_1_re_1_re_add_0_0_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_1re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_1re);
    Add_1_re_1_re_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_1_re_1_re_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_1_re_1_re_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_1_re_1_re_add_0_0_a) + SIGNED(Add_1_re_1_re_add_0_0_b));
        END IF;
    END PROCESS;
    Add_1_re_1_re_add_0_0_q <= Add_1_re_1_re_add_0_0_o(16 downto 0);


	--Add_1_re_1_re_add_1_0(ADD,74)
    Add_1_re_1_re_add_1_0_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_1_re_1_re_add_0_0_q(16)) & Add_1_re_1_re_add_0_0_q);
    Add_1_re_1_re_add_1_0_b <= STD_LOGIC_VECTOR((17 downto 17 => Add_1_re_1_re_add_0_1_q(16)) & Add_1_re_1_re_add_0_1_q);
    Add_1_re_1_re_add_1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_1_re_1_re_add_1_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_1_re_1_re_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_1_re_1_re_add_1_0_a) + SIGNED(Add_1_re_1_re_add_1_0_b));
        END IF;
    END PROCESS;
    Add_1_re_1_re_add_1_0_q <= Add_1_re_1_re_add_1_0_o(17 downto 0);


	--Add_1_re_1_re_add_2_0(ADD,76)
    Add_1_re_1_re_add_2_0_a <= STD_LOGIC_VECTOR((18 downto 18 => Add_1_re_1_re_add_1_0_q(17)) & Add_1_re_1_re_add_1_0_q);
    Add_1_re_1_re_add_2_0_b <= STD_LOGIC_VECTOR((18 downto 18 => Add_1_re_1_re_add_1_1_q(17)) & Add_1_re_1_re_add_1_1_q);
    Add_1_re_1_re_add_2_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_1_re_1_re_add_2_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_1_re_1_re_add_2_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_1_re_1_re_add_2_0_a) + SIGNED(Add_1_re_1_re_add_2_0_b));
        END IF;
    END PROCESS;
    Add_1_re_1_re_add_2_0_q <= Add_1_re_1_re_add_2_0_o(18 downto 0);


	--Add_0_re_0_re_add_0_2(ADD,61)
    Add_0_re_0_re_add_0_2_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_0re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_0re);
    Add_0_re_0_re_add_0_2_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_0re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_0re);
    Add_0_re_0_re_add_0_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_0_re_0_re_add_0_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_0_re_0_re_add_0_2_o <= STD_LOGIC_VECTOR(SIGNED(Add_0_re_0_re_add_0_2_a) + SIGNED(Add_0_re_0_re_add_0_2_b));
        END IF;
    END PROCESS;
    Add_0_re_0_re_add_0_2_q <= Add_0_re_0_re_add_0_2_o(16 downto 0);


	--Add_0_re_0_re_add_1_1(ADD,63)
    Add_0_re_0_re_add_1_1_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_0_re_0_re_add_0_2_q(16)) & Add_0_re_0_re_add_0_2_q);
    Add_0_re_0_re_add_1_1_b <= STD_LOGIC_VECTOR((17 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_0re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_0re);
    Add_0_re_0_re_add_1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_0_re_0_re_add_1_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_0_re_0_re_add_1_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_0_re_0_re_add_1_1_a) + SIGNED(Add_0_re_0_re_add_1_1_b));
        END IF;
    END PROCESS;
    Add_0_re_0_re_add_1_1_q <= Add_0_re_0_re_add_1_1_o(17 downto 0);


	--Add_0_re_0_re_add_0_1(ADD,60)
    Add_0_re_0_re_add_0_1_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_0re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_0re);
    Add_0_re_0_re_add_0_1_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_0re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_0re);
    Add_0_re_0_re_add_0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_0_re_0_re_add_0_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_0_re_0_re_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_0_re_0_re_add_0_1_a) + SIGNED(Add_0_re_0_re_add_0_1_b));
        END IF;
    END PROCESS;
    Add_0_re_0_re_add_0_1_q <= Add_0_re_0_re_add_0_1_o(16 downto 0);


	--Add_0_re_0_re_add_0_0(ADD,59)
    Add_0_re_0_re_add_0_0_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_0re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_0re);
    Add_0_re_0_re_add_0_0_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_0re(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_0re);
    Add_0_re_0_re_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_0_re_0_re_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_0_re_0_re_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_0_re_0_re_add_0_0_a) + SIGNED(Add_0_re_0_re_add_0_0_b));
        END IF;
    END PROCESS;
    Add_0_re_0_re_add_0_0_q <= Add_0_re_0_re_add_0_0_o(16 downto 0);


	--Add_0_re_0_re_add_1_0(ADD,62)
    Add_0_re_0_re_add_1_0_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_0_re_0_re_add_0_0_q(16)) & Add_0_re_0_re_add_0_0_q);
    Add_0_re_0_re_add_1_0_b <= STD_LOGIC_VECTOR((17 downto 17 => Add_0_re_0_re_add_0_1_q(16)) & Add_0_re_0_re_add_0_1_q);
    Add_0_re_0_re_add_1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_0_re_0_re_add_1_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_0_re_0_re_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_0_re_0_re_add_1_0_a) + SIGNED(Add_0_re_0_re_add_1_0_b));
        END IF;
    END PROCESS;
    Add_0_re_0_re_add_1_0_q <= Add_0_re_0_re_add_1_0_o(17 downto 0);


	--Add_0_re_0_re_add_2_0(ADD,64)
    Add_0_re_0_re_add_2_0_a <= STD_LOGIC_VECTOR((18 downto 18 => Add_0_re_0_re_add_1_0_q(17)) & Add_0_re_0_re_add_1_0_q);
    Add_0_re_0_re_add_2_0_b <= STD_LOGIC_VECTOR((18 downto 18 => Add_0_re_0_re_add_1_1_q(17)) & Add_0_re_0_re_add_1_1_q);
    Add_0_re_0_re_add_2_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_0_re_0_re_add_2_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_0_re_0_re_add_2_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_0_re_0_re_add_2_0_a) + SIGNED(Add_0_re_0_re_add_2_0_b));
        END IF;
    END PROCESS;
    Add_0_re_0_re_add_2_0_q <= Add_0_re_0_re_add_2_0_o(18 downto 0);


	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3(BLACKBOX,53)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_0 <= Add_0_re_0_re_add_2_0_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_1 <= Add_1_re_1_re_add_2_0_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_2 <= Add_2_re_2_re_add_2_0_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_3 <= Add_3_re_3_re_add_2_0_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_4 <= Add_4_re_4_re_add_2_0_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_5 <= Add_5_re_5_re_add_2_0_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_6 <= Add_6_re_6_re_add_2_0_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_7 <= Add_7_re_7_re_add_2_0_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_v;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_c;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_gain_i <= GND_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_0,
        xIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_1,
        xIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_2,
        xIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_3,
        xIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_4,
        xIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_5,
        xIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_6,
        xIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_7,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_xIn_c,
        gain_i => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_gain_i,
        qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_0,
        qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_1,
        qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_2,
        qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_3,
        qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_4,
        qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_5,
        qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_6,
        qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_7,
        qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_v,
        qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_c,
        eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_0,
        eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_1,
        eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_2,
        eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_3,
        eOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_4,
        eOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_5,
        eOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_6,
        eOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_eOut_7,
        clk => clk,
        areset => areset
        );

	--ch_in_auto(GPIN,54)

	--valid_in_auto(GPIN,55)

	--Add_7_im_7_im_add_0_2(ADD,151)
    Add_7_im_7_im_add_0_2_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_7im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_7im);
    Add_7_im_7_im_add_0_2_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_7im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_7im);
    Add_7_im_7_im_add_0_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_7_im_7_im_add_0_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_7_im_7_im_add_0_2_o <= STD_LOGIC_VECTOR(SIGNED(Add_7_im_7_im_add_0_2_a) + SIGNED(Add_7_im_7_im_add_0_2_b));
        END IF;
    END PROCESS;
    Add_7_im_7_im_add_0_2_q <= Add_7_im_7_im_add_0_2_o(16 downto 0);


	--Add_7_im_7_im_add_1_1(ADD,153)
    Add_7_im_7_im_add_1_1_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_7_im_7_im_add_0_2_q(16)) & Add_7_im_7_im_add_0_2_q);
    Add_7_im_7_im_add_1_1_b <= STD_LOGIC_VECTOR((17 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_7im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_7im);
    Add_7_im_7_im_add_1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_7_im_7_im_add_1_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_7_im_7_im_add_1_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_7_im_7_im_add_1_1_a) + SIGNED(Add_7_im_7_im_add_1_1_b));
        END IF;
    END PROCESS;
    Add_7_im_7_im_add_1_1_q <= Add_7_im_7_im_add_1_1_o(17 downto 0);


	--Add_7_im_7_im_add_0_1(ADD,150)
    Add_7_im_7_im_add_0_1_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_7im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_7im);
    Add_7_im_7_im_add_0_1_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_7im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_7im);
    Add_7_im_7_im_add_0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_7_im_7_im_add_0_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_7_im_7_im_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_7_im_7_im_add_0_1_a) + SIGNED(Add_7_im_7_im_add_0_1_b));
        END IF;
    END PROCESS;
    Add_7_im_7_im_add_0_1_q <= Add_7_im_7_im_add_0_1_o(16 downto 0);


	--Add_7_im_7_im_add_0_0(ADD,149)
    Add_7_im_7_im_add_0_0_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_7im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_7im);
    Add_7_im_7_im_add_0_0_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_7im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_7im);
    Add_7_im_7_im_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_7_im_7_im_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_7_im_7_im_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_7_im_7_im_add_0_0_a) + SIGNED(Add_7_im_7_im_add_0_0_b));
        END IF;
    END PROCESS;
    Add_7_im_7_im_add_0_0_q <= Add_7_im_7_im_add_0_0_o(16 downto 0);


	--Add_7_im_7_im_add_1_0(ADD,152)
    Add_7_im_7_im_add_1_0_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_7_im_7_im_add_0_0_q(16)) & Add_7_im_7_im_add_0_0_q);
    Add_7_im_7_im_add_1_0_b <= STD_LOGIC_VECTOR((17 downto 17 => Add_7_im_7_im_add_0_1_q(16)) & Add_7_im_7_im_add_0_1_q);
    Add_7_im_7_im_add_1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_7_im_7_im_add_1_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_7_im_7_im_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_7_im_7_im_add_1_0_a) + SIGNED(Add_7_im_7_im_add_1_0_b));
        END IF;
    END PROCESS;
    Add_7_im_7_im_add_1_0_q <= Add_7_im_7_im_add_1_0_o(17 downto 0);


	--Add_7_im_7_im_add_2_0(ADD,154)
    Add_7_im_7_im_add_2_0_a <= STD_LOGIC_VECTOR((18 downto 18 => Add_7_im_7_im_add_1_0_q(17)) & Add_7_im_7_im_add_1_0_q);
    Add_7_im_7_im_add_2_0_b <= STD_LOGIC_VECTOR((18 downto 18 => Add_7_im_7_im_add_1_1_q(17)) & Add_7_im_7_im_add_1_1_q);
    Add_7_im_7_im_add_2_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_7_im_7_im_add_2_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_7_im_7_im_add_2_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_7_im_7_im_add_2_0_a) + SIGNED(Add_7_im_7_im_add_2_0_b));
        END IF;
    END PROCESS;
    Add_7_im_7_im_add_2_0_q <= Add_7_im_7_im_add_2_0_o(18 downto 0);


	--Add_6_im_6_im_add_0_2(ADD,139)
    Add_6_im_6_im_add_0_2_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_6im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_6im);
    Add_6_im_6_im_add_0_2_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_6im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_6im);
    Add_6_im_6_im_add_0_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_6_im_6_im_add_0_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_6_im_6_im_add_0_2_o <= STD_LOGIC_VECTOR(SIGNED(Add_6_im_6_im_add_0_2_a) + SIGNED(Add_6_im_6_im_add_0_2_b));
        END IF;
    END PROCESS;
    Add_6_im_6_im_add_0_2_q <= Add_6_im_6_im_add_0_2_o(16 downto 0);


	--Add_6_im_6_im_add_1_1(ADD,141)
    Add_6_im_6_im_add_1_1_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_6_im_6_im_add_0_2_q(16)) & Add_6_im_6_im_add_0_2_q);
    Add_6_im_6_im_add_1_1_b <= STD_LOGIC_VECTOR((17 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_6im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_6im);
    Add_6_im_6_im_add_1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_6_im_6_im_add_1_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_6_im_6_im_add_1_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_6_im_6_im_add_1_1_a) + SIGNED(Add_6_im_6_im_add_1_1_b));
        END IF;
    END PROCESS;
    Add_6_im_6_im_add_1_1_q <= Add_6_im_6_im_add_1_1_o(17 downto 0);


	--Add_6_im_6_im_add_0_1(ADD,138)
    Add_6_im_6_im_add_0_1_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_6im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_6im);
    Add_6_im_6_im_add_0_1_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_6im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_6im);
    Add_6_im_6_im_add_0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_6_im_6_im_add_0_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_6_im_6_im_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_6_im_6_im_add_0_1_a) + SIGNED(Add_6_im_6_im_add_0_1_b));
        END IF;
    END PROCESS;
    Add_6_im_6_im_add_0_1_q <= Add_6_im_6_im_add_0_1_o(16 downto 0);


	--Add_6_im_6_im_add_0_0(ADD,137)
    Add_6_im_6_im_add_0_0_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_6im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_6im);
    Add_6_im_6_im_add_0_0_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_6im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_6im);
    Add_6_im_6_im_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_6_im_6_im_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_6_im_6_im_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_6_im_6_im_add_0_0_a) + SIGNED(Add_6_im_6_im_add_0_0_b));
        END IF;
    END PROCESS;
    Add_6_im_6_im_add_0_0_q <= Add_6_im_6_im_add_0_0_o(16 downto 0);


	--Add_6_im_6_im_add_1_0(ADD,140)
    Add_6_im_6_im_add_1_0_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_6_im_6_im_add_0_0_q(16)) & Add_6_im_6_im_add_0_0_q);
    Add_6_im_6_im_add_1_0_b <= STD_LOGIC_VECTOR((17 downto 17 => Add_6_im_6_im_add_0_1_q(16)) & Add_6_im_6_im_add_0_1_q);
    Add_6_im_6_im_add_1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_6_im_6_im_add_1_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_6_im_6_im_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_6_im_6_im_add_1_0_a) + SIGNED(Add_6_im_6_im_add_1_0_b));
        END IF;
    END PROCESS;
    Add_6_im_6_im_add_1_0_q <= Add_6_im_6_im_add_1_0_o(17 downto 0);


	--Add_6_im_6_im_add_2_0(ADD,142)
    Add_6_im_6_im_add_2_0_a <= STD_LOGIC_VECTOR((18 downto 18 => Add_6_im_6_im_add_1_0_q(17)) & Add_6_im_6_im_add_1_0_q);
    Add_6_im_6_im_add_2_0_b <= STD_LOGIC_VECTOR((18 downto 18 => Add_6_im_6_im_add_1_1_q(17)) & Add_6_im_6_im_add_1_1_q);
    Add_6_im_6_im_add_2_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_6_im_6_im_add_2_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_6_im_6_im_add_2_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_6_im_6_im_add_2_0_a) + SIGNED(Add_6_im_6_im_add_2_0_b));
        END IF;
    END PROCESS;
    Add_6_im_6_im_add_2_0_q <= Add_6_im_6_im_add_2_0_o(18 downto 0);


	--Add_5_im_5_im_add_0_2(ADD,127)
    Add_5_im_5_im_add_0_2_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_5im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_5im);
    Add_5_im_5_im_add_0_2_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_5im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_5im);
    Add_5_im_5_im_add_0_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_5_im_5_im_add_0_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_5_im_5_im_add_0_2_o <= STD_LOGIC_VECTOR(SIGNED(Add_5_im_5_im_add_0_2_a) + SIGNED(Add_5_im_5_im_add_0_2_b));
        END IF;
    END PROCESS;
    Add_5_im_5_im_add_0_2_q <= Add_5_im_5_im_add_0_2_o(16 downto 0);


	--Add_5_im_5_im_add_1_1(ADD,129)
    Add_5_im_5_im_add_1_1_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_5_im_5_im_add_0_2_q(16)) & Add_5_im_5_im_add_0_2_q);
    Add_5_im_5_im_add_1_1_b <= STD_LOGIC_VECTOR((17 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_5im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_5im);
    Add_5_im_5_im_add_1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_5_im_5_im_add_1_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_5_im_5_im_add_1_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_5_im_5_im_add_1_1_a) + SIGNED(Add_5_im_5_im_add_1_1_b));
        END IF;
    END PROCESS;
    Add_5_im_5_im_add_1_1_q <= Add_5_im_5_im_add_1_1_o(17 downto 0);


	--Add_5_im_5_im_add_0_1(ADD,126)
    Add_5_im_5_im_add_0_1_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_5im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_5im);
    Add_5_im_5_im_add_0_1_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_5im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_5im);
    Add_5_im_5_im_add_0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_5_im_5_im_add_0_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_5_im_5_im_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_5_im_5_im_add_0_1_a) + SIGNED(Add_5_im_5_im_add_0_1_b));
        END IF;
    END PROCESS;
    Add_5_im_5_im_add_0_1_q <= Add_5_im_5_im_add_0_1_o(16 downto 0);


	--Add_5_im_5_im_add_0_0(ADD,125)
    Add_5_im_5_im_add_0_0_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_5im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_5im);
    Add_5_im_5_im_add_0_0_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_5im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_5im);
    Add_5_im_5_im_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_5_im_5_im_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_5_im_5_im_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_5_im_5_im_add_0_0_a) + SIGNED(Add_5_im_5_im_add_0_0_b));
        END IF;
    END PROCESS;
    Add_5_im_5_im_add_0_0_q <= Add_5_im_5_im_add_0_0_o(16 downto 0);


	--Add_5_im_5_im_add_1_0(ADD,128)
    Add_5_im_5_im_add_1_0_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_5_im_5_im_add_0_0_q(16)) & Add_5_im_5_im_add_0_0_q);
    Add_5_im_5_im_add_1_0_b <= STD_LOGIC_VECTOR((17 downto 17 => Add_5_im_5_im_add_0_1_q(16)) & Add_5_im_5_im_add_0_1_q);
    Add_5_im_5_im_add_1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_5_im_5_im_add_1_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_5_im_5_im_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_5_im_5_im_add_1_0_a) + SIGNED(Add_5_im_5_im_add_1_0_b));
        END IF;
    END PROCESS;
    Add_5_im_5_im_add_1_0_q <= Add_5_im_5_im_add_1_0_o(17 downto 0);


	--Add_5_im_5_im_add_2_0(ADD,130)
    Add_5_im_5_im_add_2_0_a <= STD_LOGIC_VECTOR((18 downto 18 => Add_5_im_5_im_add_1_0_q(17)) & Add_5_im_5_im_add_1_0_q);
    Add_5_im_5_im_add_2_0_b <= STD_LOGIC_VECTOR((18 downto 18 => Add_5_im_5_im_add_1_1_q(17)) & Add_5_im_5_im_add_1_1_q);
    Add_5_im_5_im_add_2_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_5_im_5_im_add_2_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_5_im_5_im_add_2_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_5_im_5_im_add_2_0_a) + SIGNED(Add_5_im_5_im_add_2_0_b));
        END IF;
    END PROCESS;
    Add_5_im_5_im_add_2_0_q <= Add_5_im_5_im_add_2_0_o(18 downto 0);


	--Add_4_im_4_im_add_0_2(ADD,115)
    Add_4_im_4_im_add_0_2_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_4im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_4im);
    Add_4_im_4_im_add_0_2_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_4im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_4im);
    Add_4_im_4_im_add_0_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_4_im_4_im_add_0_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_4_im_4_im_add_0_2_o <= STD_LOGIC_VECTOR(SIGNED(Add_4_im_4_im_add_0_2_a) + SIGNED(Add_4_im_4_im_add_0_2_b));
        END IF;
    END PROCESS;
    Add_4_im_4_im_add_0_2_q <= Add_4_im_4_im_add_0_2_o(16 downto 0);


	--Add_4_im_4_im_add_1_1(ADD,117)
    Add_4_im_4_im_add_1_1_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_4_im_4_im_add_0_2_q(16)) & Add_4_im_4_im_add_0_2_q);
    Add_4_im_4_im_add_1_1_b <= STD_LOGIC_VECTOR((17 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_4im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_4im);
    Add_4_im_4_im_add_1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_4_im_4_im_add_1_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_4_im_4_im_add_1_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_4_im_4_im_add_1_1_a) + SIGNED(Add_4_im_4_im_add_1_1_b));
        END IF;
    END PROCESS;
    Add_4_im_4_im_add_1_1_q <= Add_4_im_4_im_add_1_1_o(17 downto 0);


	--Add_4_im_4_im_add_0_1(ADD,114)
    Add_4_im_4_im_add_0_1_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_4im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_4im);
    Add_4_im_4_im_add_0_1_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_4im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_4im);
    Add_4_im_4_im_add_0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_4_im_4_im_add_0_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_4_im_4_im_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_4_im_4_im_add_0_1_a) + SIGNED(Add_4_im_4_im_add_0_1_b));
        END IF;
    END PROCESS;
    Add_4_im_4_im_add_0_1_q <= Add_4_im_4_im_add_0_1_o(16 downto 0);


	--Add_4_im_4_im_add_0_0(ADD,113)
    Add_4_im_4_im_add_0_0_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_4im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_4im);
    Add_4_im_4_im_add_0_0_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_4im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_4im);
    Add_4_im_4_im_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_4_im_4_im_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_4_im_4_im_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_4_im_4_im_add_0_0_a) + SIGNED(Add_4_im_4_im_add_0_0_b));
        END IF;
    END PROCESS;
    Add_4_im_4_im_add_0_0_q <= Add_4_im_4_im_add_0_0_o(16 downto 0);


	--Add_4_im_4_im_add_1_0(ADD,116)
    Add_4_im_4_im_add_1_0_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_4_im_4_im_add_0_0_q(16)) & Add_4_im_4_im_add_0_0_q);
    Add_4_im_4_im_add_1_0_b <= STD_LOGIC_VECTOR((17 downto 17 => Add_4_im_4_im_add_0_1_q(16)) & Add_4_im_4_im_add_0_1_q);
    Add_4_im_4_im_add_1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_4_im_4_im_add_1_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_4_im_4_im_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_4_im_4_im_add_1_0_a) + SIGNED(Add_4_im_4_im_add_1_0_b));
        END IF;
    END PROCESS;
    Add_4_im_4_im_add_1_0_q <= Add_4_im_4_im_add_1_0_o(17 downto 0);


	--Add_4_im_4_im_add_2_0(ADD,118)
    Add_4_im_4_im_add_2_0_a <= STD_LOGIC_VECTOR((18 downto 18 => Add_4_im_4_im_add_1_0_q(17)) & Add_4_im_4_im_add_1_0_q);
    Add_4_im_4_im_add_2_0_b <= STD_LOGIC_VECTOR((18 downto 18 => Add_4_im_4_im_add_1_1_q(17)) & Add_4_im_4_im_add_1_1_q);
    Add_4_im_4_im_add_2_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_4_im_4_im_add_2_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_4_im_4_im_add_2_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_4_im_4_im_add_2_0_a) + SIGNED(Add_4_im_4_im_add_2_0_b));
        END IF;
    END PROCESS;
    Add_4_im_4_im_add_2_0_q <= Add_4_im_4_im_add_2_0_o(18 downto 0);


	--Add_3_im_3_im_add_0_2(ADD,103)
    Add_3_im_3_im_add_0_2_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_3im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_3im);
    Add_3_im_3_im_add_0_2_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_3im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_3im);
    Add_3_im_3_im_add_0_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_3_im_3_im_add_0_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_3_im_3_im_add_0_2_o <= STD_LOGIC_VECTOR(SIGNED(Add_3_im_3_im_add_0_2_a) + SIGNED(Add_3_im_3_im_add_0_2_b));
        END IF;
    END PROCESS;
    Add_3_im_3_im_add_0_2_q <= Add_3_im_3_im_add_0_2_o(16 downto 0);


	--Add_3_im_3_im_add_1_1(ADD,105)
    Add_3_im_3_im_add_1_1_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_3_im_3_im_add_0_2_q(16)) & Add_3_im_3_im_add_0_2_q);
    Add_3_im_3_im_add_1_1_b <= STD_LOGIC_VECTOR((17 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_3im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_3im);
    Add_3_im_3_im_add_1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_3_im_3_im_add_1_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_3_im_3_im_add_1_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_3_im_3_im_add_1_1_a) + SIGNED(Add_3_im_3_im_add_1_1_b));
        END IF;
    END PROCESS;
    Add_3_im_3_im_add_1_1_q <= Add_3_im_3_im_add_1_1_o(17 downto 0);


	--Add_3_im_3_im_add_0_1(ADD,102)
    Add_3_im_3_im_add_0_1_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_3im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_3im);
    Add_3_im_3_im_add_0_1_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_3im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_3im);
    Add_3_im_3_im_add_0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_3_im_3_im_add_0_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_3_im_3_im_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_3_im_3_im_add_0_1_a) + SIGNED(Add_3_im_3_im_add_0_1_b));
        END IF;
    END PROCESS;
    Add_3_im_3_im_add_0_1_q <= Add_3_im_3_im_add_0_1_o(16 downto 0);


	--Add_3_im_3_im_add_0_0(ADD,101)
    Add_3_im_3_im_add_0_0_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_3im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_3im);
    Add_3_im_3_im_add_0_0_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_3im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_3im);
    Add_3_im_3_im_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_3_im_3_im_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_3_im_3_im_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_3_im_3_im_add_0_0_a) + SIGNED(Add_3_im_3_im_add_0_0_b));
        END IF;
    END PROCESS;
    Add_3_im_3_im_add_0_0_q <= Add_3_im_3_im_add_0_0_o(16 downto 0);


	--Add_3_im_3_im_add_1_0(ADD,104)
    Add_3_im_3_im_add_1_0_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_3_im_3_im_add_0_0_q(16)) & Add_3_im_3_im_add_0_0_q);
    Add_3_im_3_im_add_1_0_b <= STD_LOGIC_VECTOR((17 downto 17 => Add_3_im_3_im_add_0_1_q(16)) & Add_3_im_3_im_add_0_1_q);
    Add_3_im_3_im_add_1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_3_im_3_im_add_1_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_3_im_3_im_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_3_im_3_im_add_1_0_a) + SIGNED(Add_3_im_3_im_add_1_0_b));
        END IF;
    END PROCESS;
    Add_3_im_3_im_add_1_0_q <= Add_3_im_3_im_add_1_0_o(17 downto 0);


	--Add_3_im_3_im_add_2_0(ADD,106)
    Add_3_im_3_im_add_2_0_a <= STD_LOGIC_VECTOR((18 downto 18 => Add_3_im_3_im_add_1_0_q(17)) & Add_3_im_3_im_add_1_0_q);
    Add_3_im_3_im_add_2_0_b <= STD_LOGIC_VECTOR((18 downto 18 => Add_3_im_3_im_add_1_1_q(17)) & Add_3_im_3_im_add_1_1_q);
    Add_3_im_3_im_add_2_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_3_im_3_im_add_2_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_3_im_3_im_add_2_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_3_im_3_im_add_2_0_a) + SIGNED(Add_3_im_3_im_add_2_0_b));
        END IF;
    END PROCESS;
    Add_3_im_3_im_add_2_0_q <= Add_3_im_3_im_add_2_0_o(18 downto 0);


	--Add_2_im_2_im_add_0_2(ADD,91)
    Add_2_im_2_im_add_0_2_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_2im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_2im);
    Add_2_im_2_im_add_0_2_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_2im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_2im);
    Add_2_im_2_im_add_0_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_2_im_2_im_add_0_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_2_im_2_im_add_0_2_o <= STD_LOGIC_VECTOR(SIGNED(Add_2_im_2_im_add_0_2_a) + SIGNED(Add_2_im_2_im_add_0_2_b));
        END IF;
    END PROCESS;
    Add_2_im_2_im_add_0_2_q <= Add_2_im_2_im_add_0_2_o(16 downto 0);


	--Add_2_im_2_im_add_1_1(ADD,93)
    Add_2_im_2_im_add_1_1_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_2_im_2_im_add_0_2_q(16)) & Add_2_im_2_im_add_0_2_q);
    Add_2_im_2_im_add_1_1_b <= STD_LOGIC_VECTOR((17 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_2im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_2im);
    Add_2_im_2_im_add_1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_2_im_2_im_add_1_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_2_im_2_im_add_1_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_2_im_2_im_add_1_1_a) + SIGNED(Add_2_im_2_im_add_1_1_b));
        END IF;
    END PROCESS;
    Add_2_im_2_im_add_1_1_q <= Add_2_im_2_im_add_1_1_o(17 downto 0);


	--Add_2_im_2_im_add_0_1(ADD,90)
    Add_2_im_2_im_add_0_1_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_2im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_2im);
    Add_2_im_2_im_add_0_1_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_2im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_2im);
    Add_2_im_2_im_add_0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_2_im_2_im_add_0_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_2_im_2_im_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_2_im_2_im_add_0_1_a) + SIGNED(Add_2_im_2_im_add_0_1_b));
        END IF;
    END PROCESS;
    Add_2_im_2_im_add_0_1_q <= Add_2_im_2_im_add_0_1_o(16 downto 0);


	--Add_2_im_2_im_add_0_0(ADD,89)
    Add_2_im_2_im_add_0_0_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_2im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_2im);
    Add_2_im_2_im_add_0_0_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_2im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_2im);
    Add_2_im_2_im_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_2_im_2_im_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_2_im_2_im_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_2_im_2_im_add_0_0_a) + SIGNED(Add_2_im_2_im_add_0_0_b));
        END IF;
    END PROCESS;
    Add_2_im_2_im_add_0_0_q <= Add_2_im_2_im_add_0_0_o(16 downto 0);


	--Add_2_im_2_im_add_1_0(ADD,92)
    Add_2_im_2_im_add_1_0_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_2_im_2_im_add_0_0_q(16)) & Add_2_im_2_im_add_0_0_q);
    Add_2_im_2_im_add_1_0_b <= STD_LOGIC_VECTOR((17 downto 17 => Add_2_im_2_im_add_0_1_q(16)) & Add_2_im_2_im_add_0_1_q);
    Add_2_im_2_im_add_1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_2_im_2_im_add_1_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_2_im_2_im_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_2_im_2_im_add_1_0_a) + SIGNED(Add_2_im_2_im_add_1_0_b));
        END IF;
    END PROCESS;
    Add_2_im_2_im_add_1_0_q <= Add_2_im_2_im_add_1_0_o(17 downto 0);


	--Add_2_im_2_im_add_2_0(ADD,94)
    Add_2_im_2_im_add_2_0_a <= STD_LOGIC_VECTOR((18 downto 18 => Add_2_im_2_im_add_1_0_q(17)) & Add_2_im_2_im_add_1_0_q);
    Add_2_im_2_im_add_2_0_b <= STD_LOGIC_VECTOR((18 downto 18 => Add_2_im_2_im_add_1_1_q(17)) & Add_2_im_2_im_add_1_1_q);
    Add_2_im_2_im_add_2_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_2_im_2_im_add_2_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_2_im_2_im_add_2_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_2_im_2_im_add_2_0_a) + SIGNED(Add_2_im_2_im_add_2_0_b));
        END IF;
    END PROCESS;
    Add_2_im_2_im_add_2_0_q <= Add_2_im_2_im_add_2_0_o(18 downto 0);


	--Add_1_im_1_im_add_0_2(ADD,79)
    Add_1_im_1_im_add_0_2_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_1im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_1im);
    Add_1_im_1_im_add_0_2_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_1im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_1im);
    Add_1_im_1_im_add_0_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_1_im_1_im_add_0_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_1_im_1_im_add_0_2_o <= STD_LOGIC_VECTOR(SIGNED(Add_1_im_1_im_add_0_2_a) + SIGNED(Add_1_im_1_im_add_0_2_b));
        END IF;
    END PROCESS;
    Add_1_im_1_im_add_0_2_q <= Add_1_im_1_im_add_0_2_o(16 downto 0);


	--Add_1_im_1_im_add_1_1(ADD,81)
    Add_1_im_1_im_add_1_1_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_1_im_1_im_add_0_2_q(16)) & Add_1_im_1_im_add_0_2_q);
    Add_1_im_1_im_add_1_1_b <= STD_LOGIC_VECTOR((17 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_1im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_1im);
    Add_1_im_1_im_add_1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_1_im_1_im_add_1_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_1_im_1_im_add_1_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_1_im_1_im_add_1_1_a) + SIGNED(Add_1_im_1_im_add_1_1_b));
        END IF;
    END PROCESS;
    Add_1_im_1_im_add_1_1_q <= Add_1_im_1_im_add_1_1_o(17 downto 0);


	--Add_1_im_1_im_add_0_1(ADD,78)
    Add_1_im_1_im_add_0_1_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_1im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_1im);
    Add_1_im_1_im_add_0_1_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_1im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_1im);
    Add_1_im_1_im_add_0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_1_im_1_im_add_0_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_1_im_1_im_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_1_im_1_im_add_0_1_a) + SIGNED(Add_1_im_1_im_add_0_1_b));
        END IF;
    END PROCESS;
    Add_1_im_1_im_add_0_1_q <= Add_1_im_1_im_add_0_1_o(16 downto 0);


	--Add_1_im_1_im_add_0_0(ADD,77)
    Add_1_im_1_im_add_0_0_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_1im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_1im);
    Add_1_im_1_im_add_0_0_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_1im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_1im);
    Add_1_im_1_im_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_1_im_1_im_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_1_im_1_im_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_1_im_1_im_add_0_0_a) + SIGNED(Add_1_im_1_im_add_0_0_b));
        END IF;
    END PROCESS;
    Add_1_im_1_im_add_0_0_q <= Add_1_im_1_im_add_0_0_o(16 downto 0);


	--Add_1_im_1_im_add_1_0(ADD,80)
    Add_1_im_1_im_add_1_0_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_1_im_1_im_add_0_0_q(16)) & Add_1_im_1_im_add_0_0_q);
    Add_1_im_1_im_add_1_0_b <= STD_LOGIC_VECTOR((17 downto 17 => Add_1_im_1_im_add_0_1_q(16)) & Add_1_im_1_im_add_0_1_q);
    Add_1_im_1_im_add_1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_1_im_1_im_add_1_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_1_im_1_im_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_1_im_1_im_add_1_0_a) + SIGNED(Add_1_im_1_im_add_1_0_b));
        END IF;
    END PROCESS;
    Add_1_im_1_im_add_1_0_q <= Add_1_im_1_im_add_1_0_o(17 downto 0);


	--Add_1_im_1_im_add_2_0(ADD,82)
    Add_1_im_1_im_add_2_0_a <= STD_LOGIC_VECTOR((18 downto 18 => Add_1_im_1_im_add_1_0_q(17)) & Add_1_im_1_im_add_1_0_q);
    Add_1_im_1_im_add_2_0_b <= STD_LOGIC_VECTOR((18 downto 18 => Add_1_im_1_im_add_1_1_q(17)) & Add_1_im_1_im_add_1_1_q);
    Add_1_im_1_im_add_2_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_1_im_1_im_add_2_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_1_im_1_im_add_2_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_1_im_1_im_add_2_0_a) + SIGNED(Add_1_im_1_im_add_2_0_b));
        END IF;
    END PROCESS;
    Add_1_im_1_im_add_2_0_q <= Add_1_im_1_im_add_2_0_o(18 downto 0);


	--Add_0_im_0_im_add_0_2(ADD,67)
    Add_0_im_0_im_add_0_2_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_0im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC5_Out1_0im);
    Add_0_im_0_im_add_0_2_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_0im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_Out1_0im);
    Add_0_im_0_im_add_0_2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_0_im_0_im_add_0_2_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_0_im_0_im_add_0_2_o <= STD_LOGIC_VECTOR(SIGNED(Add_0_im_0_im_add_0_2_a) + SIGNED(Add_0_im_0_im_add_0_2_b));
        END IF;
    END PROCESS;
    Add_0_im_0_im_add_0_2_q <= Add_0_im_0_im_add_0_2_o(16 downto 0);


	--Add_0_im_0_im_add_1_1(ADD,69)
    Add_0_im_0_im_add_1_1_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_0_im_0_im_add_0_2_q(16)) & Add_0_im_0_im_add_0_2_q);
    Add_0_im_0_im_add_1_1_b <= STD_LOGIC_VECTOR((17 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_0im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_Out1_0im);
    Add_0_im_0_im_add_1_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_0_im_0_im_add_1_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_0_im_0_im_add_1_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_0_im_0_im_add_1_1_a) + SIGNED(Add_0_im_0_im_add_1_1_b));
        END IF;
    END PROCESS;
    Add_0_im_0_im_add_1_1_q <= Add_0_im_0_im_add_1_1_o(17 downto 0);


	--Add_0_im_0_im_add_0_1(ADD,66)
    Add_0_im_0_im_add_0_1_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_0im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC3_Out1_0im);
    Add_0_im_0_im_add_0_1_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_0im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Out1_0im);
    Add_0_im_0_im_add_0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_0_im_0_im_add_0_1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_0_im_0_im_add_0_1_o <= STD_LOGIC_VECTOR(SIGNED(Add_0_im_0_im_add_0_1_a) + SIGNED(Add_0_im_0_im_add_0_1_b));
        END IF;
    END PROCESS;
    Add_0_im_0_im_add_0_1_q <= Add_0_im_0_im_add_0_1_o(16 downto 0);


	--Add_0_im_0_im_add_0_0(ADD,65)
    Add_0_im_0_im_add_0_0_a <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_0im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC1_Out1_0im);
    Add_0_im_0_im_add_0_0_b <= STD_LOGIC_VECTOR((16 downto 16 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_0im(15)) & DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_Out1_0im);
    Add_0_im_0_im_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_0_im_0_im_add_0_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_0_im_0_im_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_0_im_0_im_add_0_0_a) + SIGNED(Add_0_im_0_im_add_0_0_b));
        END IF;
    END PROCESS;
    Add_0_im_0_im_add_0_0_q <= Add_0_im_0_im_add_0_0_o(16 downto 0);


	--Add_0_im_0_im_add_1_0(ADD,68)
    Add_0_im_0_im_add_1_0_a <= STD_LOGIC_VECTOR((17 downto 17 => Add_0_im_0_im_add_0_0_q(16)) & Add_0_im_0_im_add_0_0_q);
    Add_0_im_0_im_add_1_0_b <= STD_LOGIC_VECTOR((17 downto 17 => Add_0_im_0_im_add_0_1_q(16)) & Add_0_im_0_im_add_0_1_q);
    Add_0_im_0_im_add_1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_0_im_0_im_add_1_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_0_im_0_im_add_1_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_0_im_0_im_add_1_0_a) + SIGNED(Add_0_im_0_im_add_1_0_b));
        END IF;
    END PROCESS;
    Add_0_im_0_im_add_1_0_q <= Add_0_im_0_im_add_1_0_o(17 downto 0);


	--Add_0_im_0_im_add_2_0(ADD,70)
    Add_0_im_0_im_add_2_0_a <= STD_LOGIC_VECTOR((18 downto 18 => Add_0_im_0_im_add_1_0_q(17)) & Add_0_im_0_im_add_1_0_q);
    Add_0_im_0_im_add_2_0_b <= STD_LOGIC_VECTOR((18 downto 18 => Add_0_im_0_im_add_1_1_q(17)) & Add_0_im_0_im_add_1_1_q);
    Add_0_im_0_im_add_2_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_0_im_0_im_add_2_0_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_0_im_0_im_add_2_0_o <= STD_LOGIC_VECTOR(SIGNED(Add_0_im_0_im_add_2_0_a) + SIGNED(Add_0_im_0_im_add_2_0_b));
        END IF;
    END PROCESS;
    Add_0_im_0_im_add_2_0_q <= Add_0_im_0_im_add_2_0_o(18 downto 0);


	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1(BLACKBOX,51)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_0 <= Add_0_im_0_im_add_2_0_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_1 <= Add_1_im_1_im_add_2_0_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_2 <= Add_2_im_2_im_add_2_0_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_3 <= Add_3_im_3_im_add_2_0_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_4 <= Add_4_im_4_im_add_2_0_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_5 <= Add_5_im_5_im_add_2_0_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_6 <= Add_6_im_6_im_add_2_0_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_7 <= Add_7_im_7_im_add_2_0_q;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_v <= valid_in_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_c <= ch_in_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_gain_i <= GND_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_0,
        xIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_1,
        xIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_2,
        xIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_3,
        xIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_4,
        xIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_5,
        xIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_6,
        xIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_7,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_xIn_c,
        gain_i => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_gain_i,
        qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_0,
        qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_1,
        qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_2,
        qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_3,
        qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_4,
        qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_5,
        qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_6,
        qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_7,
        qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_v,
        qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_c,
        eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_0,
        eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_1,
        eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_2,
        eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_3,
        eOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_4,
        eOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_5,
        eOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_6,
        eOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_eOut_7,
        clk => clk,
        areset => areset
        );

	--busIn(BUSIN,56)

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1(BLACKBOX,22)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_busIn_d <= busIn_d;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_busIn_a <= busIn_a;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_busIn_w <= busIn_w;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI1_qOut_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_valid_in_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_v;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_ch_in_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_c;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1 port map (
        busIn_d => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_busIn_d,
        busIn_a => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_busIn_a,
        busIn_w => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_busIn_w,
        data_in_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_0,
        data_in_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_1,
        data_in_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_2,
        data_in_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_3,
        data_in_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_4,
        data_in_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_5,
        data_in_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_6,
        data_in_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_data_in_7,
        valid_in_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_valid_in_s,
        ch_in_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_ch_in_s,
        busOut_r => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_busOut_r,
        busOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_busOut_v,
        Out1_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_0,
        Out1_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_1,
        Out1_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_2,
        Out1_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_3,
        Out1_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_4,
        Out1_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_5,
        Out1_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_6,
        Out1_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_7,
        valid_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_valid_out_s,
        ch_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_ch_out_s,
        clk => clk,
        areset => areset,
        bus_clk => bus_clk,
        bus_areset => bus_areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage(BLACKBOX,21)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_busIn_d <= busIn_d;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_busIn_a <= busIn_a;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_busIn_w <= busIn_w;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_valid_in_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_v;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_ch_in_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI3_qOut_c;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage port map (
        busIn_d => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_busIn_d,
        busIn_a => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_busIn_a,
        busIn_w => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_busIn_w,
        data_in_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_0,
        data_in_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_1,
        data_in_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_2,
        data_in_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_3,
        data_in_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_4,
        data_in_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_5,
        data_in_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_6,
        data_in_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_data_in_7,
        valid_in_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_valid_in_s,
        ch_in_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_ch_in_s,
        busOut_r => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_busOut_r,
        busOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_busOut_v,
        Out1_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_0,
        Out1_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_1,
        Out1_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_2,
        Out1_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_3,
        Out1_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_4,
        Out1_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_5,
        Out1_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_6,
        Out1_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_7,
        valid_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_valid_out_s,
        ch_out_s => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_ch_out_s,
        clk => clk,
        areset => areset,
        bus_clk => bus_clk,
        bus_areset => bus_areset
        );

	--DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2(BLACKBOX,52)
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_0 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_1 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_2 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_3 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_4 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_5 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_6 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_7 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_Out1_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_8 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_0;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_9 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_1;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_2;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_3;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_4;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_5;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_6;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_Out1_7;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_v <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_valid_out_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_c <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_ch_out_s;
        DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_gain_i <= GND_q;
    theDirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2 : DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2 port map (
        xIn_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_0,
        xIn_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_1,
        xIn_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_2,
        xIn_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_3,
        xIn_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_4,
        xIn_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_5,
        xIn_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_6,
        xIn_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_7,
        xIn_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_8,
        xIn_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_9,
        xIn_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_10,
        xIn_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_11,
        xIn_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_12,
        xIn_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_13,
        xIn_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_14,
        xIn_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_15,
        xIn_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_v,
        xIn_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_xIn_c,
        gain_i => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_gain_i,
        qOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_0,
        qOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_1,
        qOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_2,
        qOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_3,
        qOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_4,
        qOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_5,
        qOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_6,
        qOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_7,
        qOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_8,
        qOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_9,
        qOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_10,
        qOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_11,
        qOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_12,
        qOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_13,
        qOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_14,
        qOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_15,
        qOut_v => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_v,
        qOut_c => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_c,
        eOut_0 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_0,
        eOut_1 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_1,
        eOut_2 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_2,
        eOut_3 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_3,
        eOut_4 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_4,
        eOut_5 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_5,
        eOut_6 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_6,
        eOut_7 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_7,
        eOut_8 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_8,
        eOut_9 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_9,
        eOut_10 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_10,
        eOut_11 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_11,
        eOut_12 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_12,
        eOut_13 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_13,
        eOut_14 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_14,
        eOut_15 => DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_eOut_15,
        clk => clk,
        areset => areset
        );

	--DucChannel_auto(GPOUT,30)
    DucChannel_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_c;


	--u0_DucOut_auto(GPOUT,31)
    DucOut_00 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_0;


	--u1_DucOut_auto(GPOUT,32)
    DucOut_01 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_1;


	--u2_DucOut_auto(GPOUT,33)
    DucOut_02 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_2;


	--u3_DucOut_auto(GPOUT,34)
    DucOut_03 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_3;


	--u4_DucOut_auto(GPOUT,35)
    DucOut_04 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_4;


	--u5_DucOut_auto(GPOUT,36)
    DucOut_05 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_5;


	--u6_DucOut_auto(GPOUT,37)
    DucOut_06 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_6;


	--u7_DucOut_auto(GPOUT,38)
    DucOut_07 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_7;


	--u8_DucOut_auto(GPOUT,39)
    DucOut_08 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_8;


	--u9_DucOut_auto(GPOUT,40)
    DucOut_09 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_9;


	--u10_DucOut_auto(GPOUT,41)
    DucOut_10 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_10;


	--u11_DucOut_auto(GPOUT,42)
    DucOut_11 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_11;


	--u12_DucOut_auto(GPOUT,43)
    DucOut_12 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_12;


	--u13_DucOut_auto(GPOUT,44)
    DucOut_13 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_13;


	--u14_DucOut_auto(GPOUT,45)
    DucOut_14 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_14;


	--u15_DucOut_auto(GPOUT,46)
    DucOut_15 <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_15;


	--DucValid_auto(GPOUT,47)
    DucValid_s <= DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_MixerScaleI2_qOut_v;


	--busReadSelector(SELECTOR,57)
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
            IF (DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_busOut_v = "1") THEN
                q := q or DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage1_busOut_r;
                v := v or "1";
            END IF;
            -- guarantee zero: false
            IF (DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_busOut_v = "1") THEN
                q := q or DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DPD_Stage_busOut_r;
                v := v or "1";
            END IF;
            busReadSelector_q <= q;
            busReadSelector_v <= v;
        END IF;
    END PROCESS;


	--busOut(BUSOUT,58)
    busOut_v <= busReadSelector_v;
    busOut_r <= busReadSelector_q;


end normal;
