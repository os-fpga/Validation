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

-- VHDL created from qrd192x204_DUT
-- VHDL created on Thu Oct  4 07:47:19 2012


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;
USE work.qrd192x204_safe_path.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

-- Text written from /data/rkay/daily_build/13.0/38.3/p4/ip/aion/src/mip_common/hw_model.cpp:1242
entity qrd192x204_DUT is
    port (
        R_col_s : out std_logic_vector(7 downto 0);
        R_out_re : out std_logic_vector(31 downto 0);
        R_out_im : out std_logic_vector(31 downto 0);
        R_row_s : out std_logic_vector(8 downto 0);
        R_valid_s : out std_logic_vector(0 downto 0);
        ch_in_s : in std_logic_vector(7 downto 0);
        go_s : in std_logic_vector(0 downto 0);
        wData_re : in std_logic_vector(31 downto 0);
        wData_im : in std_logic_vector(31 downto 0);
        wEn_s : in std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of qrd192x204_DUT is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

-- qrd192x204_DUT_Processor component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  we_s <= wEn_s, width=1, real=0
--  data_in_re <= wData_re, width=32, real=1
--  data_in_im <= wData_im, width=32, real=1
--  go_s <= go_s, width=1, real=0
--  valid_s <= VCC_q, width=1, real=0
--  channel_s <= ch_in_s, width=8, real=0
-- outputs
--  N/C
--  N/C
--  R_valid_s => qrd192x204_DUT_Processor_R_valid_s, width=1, real=0
--  R_channel_s => qrd192x204_DUT_Processor_R_channel_s, width=8, real=0
--  R_data_re => qrd192x204_DUT_Processor_R_data_re, width=32, real=1
--  R_data_im => qrd192x204_DUT_Processor_R_data_im, width=32, real=1
--  R_row_s => qrd192x204_DUT_Processor_R_row_s, width=9, real=0
--  R_col_s => qrd192x204_DUT_Processor_R_col_s, width=8, real=0
    component qrd192x204_DUT_Processor is
        port (
        we_s : in std_logic_vector(0 downto 0);
        data_in_re : in std_logic_vector(31 downto 0);
        data_in_im : in std_logic_vector(31 downto 0);
        go_s : in std_logic_vector(0 downto 0);
        valid_s : in std_logic_vector(0 downto 0);
        channel_s : in std_logic_vector(7 downto 0);
        R_valid_s : out std_logic_vector(0 downto 0);
        R_channel_s : out std_logic_vector(7 downto 0);
        R_data_re : out std_logic_vector(31 downto 0);
        R_data_im : out std_logic_vector(31 downto 0);
        R_row_s : out std_logic_vector(8 downto 0);
        R_col_s : out std_logic_vector(7 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


    signal VCC_q : std_logic_vector (0 downto 0);
    signal qrd192x204_DUT_Processor_we_s : std_logic_vector (0 downto 0);
    signal qrd192x204_DUT_Processor_data_in_re : std_logic_vector (31 downto 0);
    signal qrd192x204_DUT_Processor_data_in_im : std_logic_vector (31 downto 0);
    signal qrd192x204_DUT_Processor_go_s : std_logic_vector (0 downto 0);
    signal qrd192x204_DUT_Processor_valid_s : std_logic_vector (0 downto 0);
    signal qrd192x204_DUT_Processor_channel_s : std_logic_vector (7 downto 0);
    signal qrd192x204_DUT_Processor_R_valid_s : std_logic_vector (0 downto 0);
    signal qrd192x204_DUT_Processor_R_channel_s : std_logic_vector (7 downto 0);
    signal qrd192x204_DUT_Processor_R_data_re : std_logic_vector (31 downto 0);
    signal qrd192x204_DUT_Processor_R_data_im : std_logic_vector (31 downto 0);
    signal qrd192x204_DUT_Processor_R_row_s : std_logic_vector (8 downto 0);
    signal qrd192x204_DUT_Processor_R_col_s : std_logic_vector (7 downto 0);
begin


	--GND(CONSTANT,0)

	--ch_in_auto(GPIN,9)

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--go_auto(GPIN,10)

	--wData_auto_im(GPIN,12)

	--wData_auto_re(GPIN,11)

	--wEn_auto(GPIN,13)

	--qrd192x204_DUT_Processor(BLACKBOX,3)
        qrd192x204_DUT_Processor_we_s <= wEn_s;
        qrd192x204_DUT_Processor_data_in_re <= wData_re;
        qrd192x204_DUT_Processor_data_in_im <= wData_im;
        qrd192x204_DUT_Processor_go_s <= go_s;
        qrd192x204_DUT_Processor_valid_s <= VCC_q;
        qrd192x204_DUT_Processor_channel_s <= ch_in_s;
    theqrd192x204_DUT_Processor : qrd192x204_DUT_Processor port map (
        we_s => qrd192x204_DUT_Processor_we_s,
        data_in_re => qrd192x204_DUT_Processor_data_in_re,
        data_in_im => qrd192x204_DUT_Processor_data_in_im,
        go_s => qrd192x204_DUT_Processor_go_s,
        valid_s => qrd192x204_DUT_Processor_valid_s,
        channel_s => qrd192x204_DUT_Processor_channel_s,
        R_valid_s => qrd192x204_DUT_Processor_R_valid_s,
        R_channel_s => qrd192x204_DUT_Processor_R_channel_s,
        R_data_re => qrd192x204_DUT_Processor_R_data_re,
        R_data_im => qrd192x204_DUT_Processor_R_data_im,
        R_row_s => qrd192x204_DUT_Processor_R_row_s,
        R_col_s => qrd192x204_DUT_Processor_R_col_s,
        clk => clk,
        areset => areset
        );

	--R_col_auto(GPOUT,4)
    R_col_s <= qrd192x204_DUT_Processor_R_col_s;


	--R_out_auto_re(GPOUT,5)
    R_out_re <= qrd192x204_DUT_Processor_R_data_re;


	--R_out_auto_im(GPOUT,6)
    R_out_im <= qrd192x204_DUT_Processor_R_data_im;


	--R_row_auto(GPOUT,7)
    R_row_s <= qrd192x204_DUT_Processor_R_row_s;


	--R_valid_auto(GPOUT,8)
    R_valid_s <= qrd192x204_DUT_Processor_R_valid_s;


end normal;
