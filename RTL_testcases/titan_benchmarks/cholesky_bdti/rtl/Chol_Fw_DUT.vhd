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

-- VHDL created from Chol_Fw_DUT
-- VHDL created on Thu Oct  4 06:06:36 2012


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;
USE work.Chol_Fw_safe_path.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

-- Text written from /data/rkay/daily_build/13.0/38.3/p4/ip/aion/src/mip_common/hw_model.cpp:1242
entity Chol_Fw_DUT is
    port (
        FwDone_s : out std_logic_vector(0 downto 0);
        InColumnIdx_s : in std_logic_vector(7 downto 0);
        InData_re : in std_logic_vector(31 downto 0);
        InData_im : in std_logic_vector(31 downto 0);
        InDataV_s : in std_logic_vector(0 downto 0);
        InRowIdx_s : in std_logic_vector(7 downto 0);
        InUpper_s : in std_logic_vector(0 downto 0);
        Lij_v_s : out std_logic_vector(0 downto 0);
        MatSizeIn_s : in std_logic_vector(7 downto 0);
        ProcUpper_s : in std_logic_vector(0 downto 0);
        go_s : in std_logic_vector(0 downto 0);
        q_re : out std_logic_vector(31 downto 0);
        q_im : out std_logic_vector(31 downto 0);
        q_v_s : out std_logic_vector(0 downto 0);
        y_v_o_s : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of Chol_Fw_DUT is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

-- Chol_Fw_DUT_Cholesky_Fw component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  go_s <= go_s, width=1, real=0
--  MatSizeIn_s <= MatSizeIn_s, width=8, real=0
--  ProcUpper_s <= ProcUpper_s, width=1, real=0
--  InDataV_s <= InDataV_s, width=1, real=0
--  InData_re <= InData_re, width=32, real=1
--  InData_im <= InData_im, width=32, real=1
--  InColumnIdx_s <= InColumnIdx_s, width=8, real=0
--  InRowIdx_s <= InRowIdx_s, width=8, real=0
--  InUpper_s <= InUpper_s, width=1, real=0
-- outputs
--  N/C
--  N/C
--  Lij_v_s => Chol_Fw_DUT_Cholesky_Fw_Lij_v_s, width=1, real=0
--  y_v_o_s => Chol_Fw_DUT_Cholesky_Fw_y_v_o_s, width=1, real=0
--  q_re => Chol_Fw_DUT_Cholesky_Fw_q_re, width=32, real=1
--  q_im => Chol_Fw_DUT_Cholesky_Fw_q_im, width=32, real=1
--  qv_s => Chol_Fw_DUT_Cholesky_Fw_qv_s, width=1, real=0
--  q2_re => Chol_Fw_DUT_Cholesky_Fw_q2_re, width=32, real=1
--  q2_im => Chol_Fw_DUT_Cholesky_Fw_q2_im, width=32, real=1
--  ColumnIdx_s => Chol_Fw_DUT_Cholesky_Fw_ColumnIdx_s, width=8, real=0
--  RowIdx_s => Chol_Fw_DUT_Cholesky_Fw_RowIdx_s, width=8, real=0
--  FwDone_s => Chol_Fw_DUT_Cholesky_Fw_FwDone_s, width=1, real=0
    component Chol_Fw_DUT_Cholesky_Fw is
        port (
        go_s : in std_logic_vector(0 downto 0);
        MatSizeIn_s : in std_logic_vector(7 downto 0);
        ProcUpper_s : in std_logic_vector(0 downto 0);
        InDataV_s : in std_logic_vector(0 downto 0);
        InData_re : in std_logic_vector(31 downto 0);
        InData_im : in std_logic_vector(31 downto 0);
        InColumnIdx_s : in std_logic_vector(7 downto 0);
        InRowIdx_s : in std_logic_vector(7 downto 0);
        InUpper_s : in std_logic_vector(0 downto 0);
        Lij_v_s : out std_logic_vector(0 downto 0);
        y_v_o_s : out std_logic_vector(0 downto 0);
        q_re : out std_logic_vector(31 downto 0);
        q_im : out std_logic_vector(31 downto 0);
        qv_s : out std_logic_vector(0 downto 0);
        q2_re : out std_logic_vector(31 downto 0);
        q2_im : out std_logic_vector(31 downto 0);
        ColumnIdx_s : out std_logic_vector(7 downto 0);
        RowIdx_s : out std_logic_vector(7 downto 0);
        FwDone_s : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


    signal Chol_Fw_DUT_Cholesky_Fw_go_s : std_logic_vector (0 downto 0);
    signal Chol_Fw_DUT_Cholesky_Fw_MatSizeIn_s : std_logic_vector (7 downto 0);
    signal Chol_Fw_DUT_Cholesky_Fw_ProcUpper_s : std_logic_vector (0 downto 0);
    signal Chol_Fw_DUT_Cholesky_Fw_InDataV_s : std_logic_vector (0 downto 0);
    signal Chol_Fw_DUT_Cholesky_Fw_InData_re : std_logic_vector (31 downto 0);
    signal Chol_Fw_DUT_Cholesky_Fw_InData_im : std_logic_vector (31 downto 0);
    signal Chol_Fw_DUT_Cholesky_Fw_InColumnIdx_s : std_logic_vector (7 downto 0);
    signal Chol_Fw_DUT_Cholesky_Fw_InRowIdx_s : std_logic_vector (7 downto 0);
    signal Chol_Fw_DUT_Cholesky_Fw_InUpper_s : std_logic_vector (0 downto 0);
    signal Chol_Fw_DUT_Cholesky_Fw_Lij_v_s : std_logic_vector (0 downto 0);
    signal Chol_Fw_DUT_Cholesky_Fw_y_v_o_s : std_logic_vector (0 downto 0);
    signal Chol_Fw_DUT_Cholesky_Fw_q_re : std_logic_vector (31 downto 0);
    signal Chol_Fw_DUT_Cholesky_Fw_q_im : std_logic_vector (31 downto 0);
    signal Chol_Fw_DUT_Cholesky_Fw_qv_s : std_logic_vector (0 downto 0);
    signal Chol_Fw_DUT_Cholesky_Fw_q2_re : std_logic_vector (31 downto 0);
    signal Chol_Fw_DUT_Cholesky_Fw_q2_im : std_logic_vector (31 downto 0);
    signal Chol_Fw_DUT_Cholesky_Fw_ColumnIdx_s : std_logic_vector (7 downto 0);
    signal Chol_Fw_DUT_Cholesky_Fw_RowIdx_s : std_logic_vector (7 downto 0);
    signal Chol_Fw_DUT_Cholesky_Fw_FwDone_s : std_logic_vector (0 downto 0);
begin


	--GND(CONSTANT,0)

	--VCC(CONSTANT,1)

	--InUpper_auto(GPIN,9)

	--InRowIdx_auto(GPIN,8)

	--InColumnIdx_auto(GPIN,4)

	--InData_auto_im(GPIN,6)

	--InData_auto_re(GPIN,5)

	--InDataV_auto(GPIN,7)

	--ProcUpper_auto(GPIN,12)

	--MatSizeIn_auto(GPIN,11)

	--go_auto(GPIN,13)

	--Chol_Fw_DUT_Cholesky_Fw(BLACKBOX,2)
        Chol_Fw_DUT_Cholesky_Fw_go_s <= go_s;
        Chol_Fw_DUT_Cholesky_Fw_MatSizeIn_s <= MatSizeIn_s;
        Chol_Fw_DUT_Cholesky_Fw_ProcUpper_s <= ProcUpper_s;
        Chol_Fw_DUT_Cholesky_Fw_InDataV_s <= InDataV_s;
        Chol_Fw_DUT_Cholesky_Fw_InData_re <= InData_re;
        Chol_Fw_DUT_Cholesky_Fw_InData_im <= InData_im;
        Chol_Fw_DUT_Cholesky_Fw_InColumnIdx_s <= InColumnIdx_s;
        Chol_Fw_DUT_Cholesky_Fw_InRowIdx_s <= InRowIdx_s;
        Chol_Fw_DUT_Cholesky_Fw_InUpper_s <= InUpper_s;
    theChol_Fw_DUT_Cholesky_Fw : Chol_Fw_DUT_Cholesky_Fw port map (
        go_s => Chol_Fw_DUT_Cholesky_Fw_go_s,
        MatSizeIn_s => Chol_Fw_DUT_Cholesky_Fw_MatSizeIn_s,
        ProcUpper_s => Chol_Fw_DUT_Cholesky_Fw_ProcUpper_s,
        InDataV_s => Chol_Fw_DUT_Cholesky_Fw_InDataV_s,
        InData_re => Chol_Fw_DUT_Cholesky_Fw_InData_re,
        InData_im => Chol_Fw_DUT_Cholesky_Fw_InData_im,
        InColumnIdx_s => Chol_Fw_DUT_Cholesky_Fw_InColumnIdx_s,
        InRowIdx_s => Chol_Fw_DUT_Cholesky_Fw_InRowIdx_s,
        InUpper_s => Chol_Fw_DUT_Cholesky_Fw_InUpper_s,
        Lij_v_s => Chol_Fw_DUT_Cholesky_Fw_Lij_v_s,
        y_v_o_s => Chol_Fw_DUT_Cholesky_Fw_y_v_o_s,
        q_re => Chol_Fw_DUT_Cholesky_Fw_q_re,
        q_im => Chol_Fw_DUT_Cholesky_Fw_q_im,
        qv_s => Chol_Fw_DUT_Cholesky_Fw_qv_s,
        q2_re => Chol_Fw_DUT_Cholesky_Fw_q2_re,
        q2_im => Chol_Fw_DUT_Cholesky_Fw_q2_im,
        ColumnIdx_s => Chol_Fw_DUT_Cholesky_Fw_ColumnIdx_s,
        RowIdx_s => Chol_Fw_DUT_Cholesky_Fw_RowIdx_s,
        FwDone_s => Chol_Fw_DUT_Cholesky_Fw_FwDone_s,
        clk => clk,
        areset => areset
        );

	--FwDone_auto(GPOUT,3)
    FwDone_s <= Chol_Fw_DUT_Cholesky_Fw_FwDone_s;


	--Lij_v_auto(GPOUT,10)
    Lij_v_s <= Chol_Fw_DUT_Cholesky_Fw_Lij_v_s;


	--q_auto_re(GPOUT,14)
    q_re <= Chol_Fw_DUT_Cholesky_Fw_q_re;


	--q_auto_im(GPOUT,15)
    q_im <= Chol_Fw_DUT_Cholesky_Fw_q_im;


	--q_v_auto(GPOUT,16)
    q_v_s <= Chol_Fw_DUT_Cholesky_Fw_qv_s;


	--y_v_o_auto(GPOUT,17)
    y_v_o_s <= Chol_Fw_DUT_Cholesky_Fw_y_v_o_s;


end normal;
