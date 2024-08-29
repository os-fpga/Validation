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

-- VHDL created from cholesky_solver_mc_CholFwBw
-- VHDL created on Thu Oct  4 06:06:21 2012


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;
USE work.cholesky_solver_mc_safe_path.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

-- Text written from /data/rkay/daily_build/13.0/38.3/p4/ip/aion/src/mip_common/hw_model.cpp:1242
entity cholesky_solver_mc_CholFwBw is
    port (
        BkSubDone_s : out std_logic_vector(0 downto 0);
        BsFifoErr_s : out std_logic_vector(0 downto 0);
        BsProcLower_s : in std_logic_vector(0 downto 0);
        BsWrLowerTri_s : in std_logic_vector(0 downto 0);
        FifolErr_s : out std_logic_vector(0 downto 0);
        FwDone_s : out std_logic_vector(0 downto 0);
        InCh_s : in std_logic_vector(7 downto 0);
        InColumnIdx_s : in std_logic_vector(8 downto 0);
        InData_re : in std_logic_vector(31 downto 0);
        InData_im : in std_logic_vector(31 downto 0);
        InDataV_s : in std_logic_vector(0 downto 0);
        InMatSize_s : in std_logic_vector(8 downto 0);
        InNumMat_s : in std_logic_vector(7 downto 0);
        InRowIdx_s : in std_logic_vector(8 downto 0);
        InUpper_s : in std_logic_vector(0 downto 0);
        Lij_v_s : out std_logic_vector(0 downto 0);
        Lij_y_c_s : out std_logic_vector(7 downto 0);
        Lij_y_modified_re : out std_logic_vector(31 downto 0);
        Lij_y_modified_im : out std_logic_vector(31 downto 0);
        ProcUpper_s : in std_logic_vector(0 downto 0);
        go_s : in std_logic_vector(0 downto 0);
        x_c_s : out std_logic_vector(7 downto 0);
        x_d_re : out std_logic_vector(31 downto 0);
        x_d_im : out std_logic_vector(31 downto 0);
        x_v_s : out std_logic_vector(0 downto 0);
        y_v_s : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of cholesky_solver_mc_CholFwBw is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

-- cholesky_solver_mc_CholFwBw_BwSub component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  Lij_v_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_v_s, width=1, real=0
--  y_v_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_y_v_s, width=1, real=0
--  Lij_y_re <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_modified_re, width=32, real=1
--  Lij_y_im <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_modified_im, width=32, real=1
--  ChIdx_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_ChIdx_s, width=8, real=0
--  ColumnIdx_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_ColumnIdx_s, width=7, real=0
--  RowIdx_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_RowIdx_s, width=7, real=0
--  FwDone_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_FwDone_s, width=1, real=0
--  MatSizeRT_mn1_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_MatSizeRT_mn1_s, width=7, real=0
--  NumMatRT_mn1_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_NumMatRT_mn1_s, width=2, real=0
--  BsInLowerTri_s <= BsWrLowerTri_s, width=1, real=0
--  BsProcLower_s <= BsProcLower_s, width=1, real=0
-- outputs
--  N/C
--  N/C
--  xv_s => cholesky_solver_mc_CholFwBw_BwSub_xv_s, width=1, real=0
--  xc_s => cholesky_solver_mc_CholFwBw_BwSub_xc_s, width=8, real=0
--  xd_re => cholesky_solver_mc_CholFwBw_BwSub_xd_re, width=32, real=1
--  xd_im => cholesky_solver_mc_CholFwBw_BwSub_xd_im, width=32, real=1
--  xBwSubDone_s => cholesky_solver_mc_CholFwBw_BwSub_xBwSubDone_s, width=1, real=0
--  xBsFifoErr_s => cholesky_solver_mc_CholFwBw_BwSub_xBsFifoErr_s, width=1, real=0
    component cholesky_solver_mc_CholFwBw_BwSub is
        port (
        Lij_v_s : in std_logic_vector(0 downto 0);
        y_v_s : in std_logic_vector(0 downto 0);
        Lij_y_re : in std_logic_vector(31 downto 0);
        Lij_y_im : in std_logic_vector(31 downto 0);
        ChIdx_s : in std_logic_vector(7 downto 0);
        ColumnIdx_s : in std_logic_vector(6 downto 0);
        RowIdx_s : in std_logic_vector(6 downto 0);
        FwDone_s : in std_logic_vector(0 downto 0);
        MatSizeRT_mn1_s : in std_logic_vector(6 downto 0);
        NumMatRT_mn1_s : in std_logic_vector(1 downto 0);
        BsInLowerTri_s : in std_logic_vector(0 downto 0);
        BsProcLower_s : in std_logic_vector(0 downto 0);
        xv_s : out std_logic_vector(0 downto 0);
        xc_s : out std_logic_vector(7 downto 0);
        xd_re : out std_logic_vector(31 downto 0);
        xd_im : out std_logic_vector(31 downto 0);
        xBwSubDone_s : out std_logic_vector(0 downto 0);
        xBsFifoErr_s : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- cholesky_solver_mc_CholFwBw_Cholesky_Fw component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  go_s <= go_s, width=1, real=0
--  InMatSize_s <= InMatSize_s, width=9, real=0
--  ProcUpper_s <= ProcUpper_s, width=1, real=0
--  NumMatIn_s <= InNumMat_s, width=8, real=0
--  InDataV_s <= InDataV_s, width=1, real=0
--  InCh_s <= InCh_s, width=8, real=0
--  InData_re <= InData_re, width=32, real=1
--  InData_im <= InData_im, width=32, real=1
--  InColumnIdx_s <= InColumnIdx_s, width=9, real=0
--  InRowIdx_s <= InRowIdx_s, width=9, real=0
--  InUpper_s <= InUpper_s, width=1, real=0
-- outputs
--  N/C
--  N/C
--  Lij_y_v_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_v_s, width=1, real=0
--  Lij_v_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_v_s, width=1, real=0
--  y_v_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_y_v_s, width=1, real=0
--  Lij_y_modified_re => cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_modified_re, width=32, real=1
--  Lij_y_modified_im => cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_modified_im, width=32, real=1
--  ChIdx_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_ChIdx_s, width=8, real=0
--  ColumnIdx_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_ColumnIdx_s, width=7, real=0
--  RowIdx_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_RowIdx_s, width=7, real=0
--  FwDone_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_FwDone_s, width=1, real=0
--  MatSizeRT_mn1_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_MatSizeRT_mn1_s, width=7, real=0
--  NumMatRT_mn1_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_NumMatRT_mn1_s, width=2, real=0
--  FifoErr_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_FifoErr_s, width=1, real=0
    component cholesky_solver_mc_CholFwBw_Cholesky_Fw is
        port (
        go_s : in std_logic_vector(0 downto 0);
        InMatSize_s : in std_logic_vector(8 downto 0);
        ProcUpper_s : in std_logic_vector(0 downto 0);
        NumMatIn_s : in std_logic_vector(7 downto 0);
        InDataV_s : in std_logic_vector(0 downto 0);
        InCh_s : in std_logic_vector(7 downto 0);
        InData_re : in std_logic_vector(31 downto 0);
        InData_im : in std_logic_vector(31 downto 0);
        InColumnIdx_s : in std_logic_vector(8 downto 0);
        InRowIdx_s : in std_logic_vector(8 downto 0);
        InUpper_s : in std_logic_vector(0 downto 0);
        Lij_y_v_s : out std_logic_vector(0 downto 0);
        Lij_v_s : out std_logic_vector(0 downto 0);
        y_v_s : out std_logic_vector(0 downto 0);
        Lij_y_modified_re : out std_logic_vector(31 downto 0);
        Lij_y_modified_im : out std_logic_vector(31 downto 0);
        ChIdx_s : out std_logic_vector(7 downto 0);
        ColumnIdx_s : out std_logic_vector(6 downto 0);
        RowIdx_s : out std_logic_vector(6 downto 0);
        FwDone_s : out std_logic_vector(0 downto 0);
        MatSizeRT_mn1_s : out std_logic_vector(6 downto 0);
        NumMatRT_mn1_s : out std_logic_vector(1 downto 0);
        FifoErr_s : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- cholesky_solver_mc_CholFwBw_ValidCapture_L component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  In1_re <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_modified_re, width=32, real=1
--  In1_im <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_modified_im, width=32, real=1
--  Enable_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_v_s, width=1, real=0
-- outputs
--  N/C
--  N/C
    component cholesky_solver_mc_CholFwBw_ValidCapture_L is
        port (
        In1_re : in std_logic_vector(31 downto 0);
        In1_im : in std_logic_vector(31 downto 0);
        Enable_s : in std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


-- cholesky_solver_mc_CholFwBw_ValidCapture_y component declaration
-- inputs
--  N/C
--  N/C
--  N/C
--  N/C
--  In1_re <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_modified_re, width=32, real=1
--  In1_im <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_modified_im, width=32, real=1
--  Enable_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_y_v_s, width=1, real=0
-- outputs
--  N/C
--  N/C
    component cholesky_solver_mc_CholFwBw_ValidCapture_y is
        port (
        In1_re : in std_logic_vector(31 downto 0);
        In1_im : in std_logic_vector(31 downto 0);
        Enable_s : in std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
    end component;


    signal cholesky_solver_mc_CholFwBw_BwSub_Lij_v_s : std_logic_vector (0 downto 0);
    signal cholesky_solver_mc_CholFwBw_BwSub_y_v_s : std_logic_vector (0 downto 0);
    signal cholesky_solver_mc_CholFwBw_BwSub_Lij_y_re : std_logic_vector (31 downto 0);
    signal cholesky_solver_mc_CholFwBw_BwSub_Lij_y_im : std_logic_vector (31 downto 0);
    signal cholesky_solver_mc_CholFwBw_BwSub_ChIdx_s : std_logic_vector (7 downto 0);
    signal cholesky_solver_mc_CholFwBw_BwSub_ColumnIdx_s : std_logic_vector (6 downto 0);
    signal cholesky_solver_mc_CholFwBw_BwSub_RowIdx_s : std_logic_vector (6 downto 0);
    signal cholesky_solver_mc_CholFwBw_BwSub_FwDone_s : std_logic_vector (0 downto 0);
    signal cholesky_solver_mc_CholFwBw_BwSub_MatSizeRT_mn1_s : std_logic_vector (6 downto 0);
    signal cholesky_solver_mc_CholFwBw_BwSub_NumMatRT_mn1_s : std_logic_vector (1 downto 0);
    signal cholesky_solver_mc_CholFwBw_BwSub_BsInLowerTri_s : std_logic_vector (0 downto 0);
    signal cholesky_solver_mc_CholFwBw_BwSub_BsProcLower_s : std_logic_vector (0 downto 0);
    signal cholesky_solver_mc_CholFwBw_BwSub_xv_s : std_logic_vector (0 downto 0);
    signal cholesky_solver_mc_CholFwBw_BwSub_xc_s : std_logic_vector (7 downto 0);
    signal cholesky_solver_mc_CholFwBw_BwSub_xd_re : std_logic_vector (31 downto 0);
    signal cholesky_solver_mc_CholFwBw_BwSub_xd_im : std_logic_vector (31 downto 0);
    signal cholesky_solver_mc_CholFwBw_BwSub_xBwSubDone_s : std_logic_vector (0 downto 0);
    signal cholesky_solver_mc_CholFwBw_BwSub_xBsFifoErr_s : std_logic_vector (0 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_go_s : std_logic_vector (0 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_InMatSize_s : std_logic_vector (8 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_ProcUpper_s : std_logic_vector (0 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_NumMatIn_s : std_logic_vector (7 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_InDataV_s : std_logic_vector (0 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_InCh_s : std_logic_vector (7 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_InData_re : std_logic_vector (31 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_InData_im : std_logic_vector (31 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_InColumnIdx_s : std_logic_vector (8 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_InRowIdx_s : std_logic_vector (8 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_InUpper_s : std_logic_vector (0 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_v_s : std_logic_vector (0 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_v_s : std_logic_vector (0 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_y_v_s : std_logic_vector (0 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_modified_re : std_logic_vector (31 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_modified_im : std_logic_vector (31 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_ChIdx_s : std_logic_vector (7 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_ColumnIdx_s : std_logic_vector (6 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_RowIdx_s : std_logic_vector (6 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_FwDone_s : std_logic_vector (0 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_MatSizeRT_mn1_s : std_logic_vector (6 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_NumMatRT_mn1_s : std_logic_vector (1 downto 0);
    signal cholesky_solver_mc_CholFwBw_Cholesky_Fw_FifoErr_s : std_logic_vector (0 downto 0);
    signal cholesky_solver_mc_CholFwBw_ValidCapture_L_In1_re : std_logic_vector (31 downto 0);
    signal cholesky_solver_mc_CholFwBw_ValidCapture_L_In1_im : std_logic_vector (31 downto 0);
    signal cholesky_solver_mc_CholFwBw_ValidCapture_L_Enable_s : std_logic_vector (0 downto 0);
    signal cholesky_solver_mc_CholFwBw_ValidCapture_y_In1_re : std_logic_vector (31 downto 0);
    signal cholesky_solver_mc_CholFwBw_ValidCapture_y_In1_im : std_logic_vector (31 downto 0);
    signal cholesky_solver_mc_CholFwBw_ValidCapture_y_Enable_s : std_logic_vector (0 downto 0);
begin


	--GND(CONSTANT,0)

	--VCC(CONSTANT,1)

	--BsProcLower_auto(GPIN,4)

	--BsWrLowerTri_auto(GPIN,5)

	--InUpper_auto(GPIN,18)

	--InRowIdx_auto(GPIN,17)

	--InColumnIdx_auto(GPIN,11)

	--InData_auto_im(GPIN,13)

	--InData_auto_re(GPIN,12)

	--InCh_auto(GPIN,10)

	--InDataV_auto(GPIN,14)

	--InNumMat_auto(GPIN,16)

	--ProcUpper_auto(GPIN,23)

	--InMatSize_auto(GPIN,15)

	--go_auto(GPIN,26)

	--cholesky_solver_mc_CholFwBw_Cholesky_Fw(BLACKBOX,7)
        cholesky_solver_mc_CholFwBw_Cholesky_Fw_go_s <= go_s;
        cholesky_solver_mc_CholFwBw_Cholesky_Fw_InMatSize_s <= InMatSize_s;
        cholesky_solver_mc_CholFwBw_Cholesky_Fw_ProcUpper_s <= ProcUpper_s;
        cholesky_solver_mc_CholFwBw_Cholesky_Fw_NumMatIn_s <= InNumMat_s;
        cholesky_solver_mc_CholFwBw_Cholesky_Fw_InDataV_s <= InDataV_s;
        cholesky_solver_mc_CholFwBw_Cholesky_Fw_InCh_s <= InCh_s;
        cholesky_solver_mc_CholFwBw_Cholesky_Fw_InData_re <= InData_re;
        cholesky_solver_mc_CholFwBw_Cholesky_Fw_InData_im <= InData_im;
        cholesky_solver_mc_CholFwBw_Cholesky_Fw_InColumnIdx_s <= InColumnIdx_s;
        cholesky_solver_mc_CholFwBw_Cholesky_Fw_InRowIdx_s <= InRowIdx_s;
        cholesky_solver_mc_CholFwBw_Cholesky_Fw_InUpper_s <= InUpper_s;
    thecholesky_solver_mc_CholFwBw_Cholesky_Fw : cholesky_solver_mc_CholFwBw_Cholesky_Fw port map (
        go_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_go_s,
        InMatSize_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_InMatSize_s,
        ProcUpper_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_ProcUpper_s,
        NumMatIn_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_NumMatIn_s,
        InDataV_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_InDataV_s,
        InCh_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_InCh_s,
        InData_re => cholesky_solver_mc_CholFwBw_Cholesky_Fw_InData_re,
        InData_im => cholesky_solver_mc_CholFwBw_Cholesky_Fw_InData_im,
        InColumnIdx_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_InColumnIdx_s,
        InRowIdx_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_InRowIdx_s,
        InUpper_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_InUpper_s,
        Lij_y_v_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_v_s,
        Lij_v_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_v_s,
        y_v_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_y_v_s,
        Lij_y_modified_re => cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_modified_re,
        Lij_y_modified_im => cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_modified_im,
        ChIdx_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_ChIdx_s,
        ColumnIdx_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_ColumnIdx_s,
        RowIdx_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_RowIdx_s,
        FwDone_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_FwDone_s,
        MatSizeRT_mn1_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_MatSizeRT_mn1_s,
        NumMatRT_mn1_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_NumMatRT_mn1_s,
        FifoErr_s => cholesky_solver_mc_CholFwBw_Cholesky_Fw_FifoErr_s,
        clk => clk,
        areset => areset
        );

	--cholesky_solver_mc_CholFwBw_BwSub(BLACKBOX,6)
        cholesky_solver_mc_CholFwBw_BwSub_Lij_v_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_v_s;
        cholesky_solver_mc_CholFwBw_BwSub_y_v_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_y_v_s;
        cholesky_solver_mc_CholFwBw_BwSub_Lij_y_re <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_modified_re;
        cholesky_solver_mc_CholFwBw_BwSub_Lij_y_im <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_modified_im;
        cholesky_solver_mc_CholFwBw_BwSub_ChIdx_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_ChIdx_s;
        cholesky_solver_mc_CholFwBw_BwSub_ColumnIdx_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_ColumnIdx_s;
        cholesky_solver_mc_CholFwBw_BwSub_RowIdx_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_RowIdx_s;
        cholesky_solver_mc_CholFwBw_BwSub_FwDone_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_FwDone_s;
        cholesky_solver_mc_CholFwBw_BwSub_MatSizeRT_mn1_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_MatSizeRT_mn1_s;
        cholesky_solver_mc_CholFwBw_BwSub_NumMatRT_mn1_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_NumMatRT_mn1_s;
        cholesky_solver_mc_CholFwBw_BwSub_BsInLowerTri_s <= BsWrLowerTri_s;
        cholesky_solver_mc_CholFwBw_BwSub_BsProcLower_s <= BsProcLower_s;
    thecholesky_solver_mc_CholFwBw_BwSub : cholesky_solver_mc_CholFwBw_BwSub port map (
        Lij_v_s => cholesky_solver_mc_CholFwBw_BwSub_Lij_v_s,
        y_v_s => cholesky_solver_mc_CholFwBw_BwSub_y_v_s,
        Lij_y_re => cholesky_solver_mc_CholFwBw_BwSub_Lij_y_re,
        Lij_y_im => cholesky_solver_mc_CholFwBw_BwSub_Lij_y_im,
        ChIdx_s => cholesky_solver_mc_CholFwBw_BwSub_ChIdx_s,
        ColumnIdx_s => cholesky_solver_mc_CholFwBw_BwSub_ColumnIdx_s,
        RowIdx_s => cholesky_solver_mc_CholFwBw_BwSub_RowIdx_s,
        FwDone_s => cholesky_solver_mc_CholFwBw_BwSub_FwDone_s,
        MatSizeRT_mn1_s => cholesky_solver_mc_CholFwBw_BwSub_MatSizeRT_mn1_s,
        NumMatRT_mn1_s => cholesky_solver_mc_CholFwBw_BwSub_NumMatRT_mn1_s,
        BsInLowerTri_s => cholesky_solver_mc_CholFwBw_BwSub_BsInLowerTri_s,
        BsProcLower_s => cholesky_solver_mc_CholFwBw_BwSub_BsProcLower_s,
        xv_s => cholesky_solver_mc_CholFwBw_BwSub_xv_s,
        xc_s => cholesky_solver_mc_CholFwBw_BwSub_xc_s,
        xd_re => cholesky_solver_mc_CholFwBw_BwSub_xd_re,
        xd_im => cholesky_solver_mc_CholFwBw_BwSub_xd_im,
        xBwSubDone_s => cholesky_solver_mc_CholFwBw_BwSub_xBwSubDone_s,
        xBsFifoErr_s => cholesky_solver_mc_CholFwBw_BwSub_xBsFifoErr_s,
        clk => clk,
        areset => areset
        );

	--BkSubDone_auto(GPOUT,2)
    BkSubDone_s <= cholesky_solver_mc_CholFwBw_BwSub_xBwSubDone_s;


	--BsFifoErr_auto(GPOUT,3)
    BsFifoErr_s <= cholesky_solver_mc_CholFwBw_BwSub_xBsFifoErr_s;


	--FifolErr_auto(GPOUT,8)
    FifolErr_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_FifoErr_s;


	--FwDone_auto(GPOUT,9)
    FwDone_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_FwDone_s;


	--Lij_v_auto(GPOUT,19)
    Lij_v_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_v_s;


	--Lij_y_c_auto(GPOUT,20)
    Lij_y_c_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_ChIdx_s;


	--Lij_y_modified_auto_re(GPOUT,21)
    Lij_y_modified_re <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_modified_re;


	--Lij_y_modified_auto_im(GPOUT,22)
    Lij_y_modified_im <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_modified_im;


	--cholesky_solver_mc_CholFwBw_ValidCapture_L(BLACKBOX,24)
        cholesky_solver_mc_CholFwBw_ValidCapture_L_In1_re <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_modified_re;
        cholesky_solver_mc_CholFwBw_ValidCapture_L_In1_im <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_modified_im;
        cholesky_solver_mc_CholFwBw_ValidCapture_L_Enable_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_v_s;
    thecholesky_solver_mc_CholFwBw_ValidCapture_L : cholesky_solver_mc_CholFwBw_ValidCapture_L port map (
        In1_re => cholesky_solver_mc_CholFwBw_ValidCapture_L_In1_re,
        In1_im => cholesky_solver_mc_CholFwBw_ValidCapture_L_In1_im,
        Enable_s => cholesky_solver_mc_CholFwBw_ValidCapture_L_Enable_s,
        clk => clk,
        areset => areset
        );

	--cholesky_solver_mc_CholFwBw_ValidCapture_y(BLACKBOX,25)
        cholesky_solver_mc_CholFwBw_ValidCapture_y_In1_re <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_modified_re;
        cholesky_solver_mc_CholFwBw_ValidCapture_y_In1_im <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_Lij_y_modified_im;
        cholesky_solver_mc_CholFwBw_ValidCapture_y_Enable_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_y_v_s;
    thecholesky_solver_mc_CholFwBw_ValidCapture_y : cholesky_solver_mc_CholFwBw_ValidCapture_y port map (
        In1_re => cholesky_solver_mc_CholFwBw_ValidCapture_y_In1_re,
        In1_im => cholesky_solver_mc_CholFwBw_ValidCapture_y_In1_im,
        Enable_s => cholesky_solver_mc_CholFwBw_ValidCapture_y_Enable_s,
        clk => clk,
        areset => areset
        );

	--x_c_auto(GPOUT,27)
    x_c_s <= cholesky_solver_mc_CholFwBw_BwSub_xc_s;


	--x_d_auto_re(GPOUT,28)
    x_d_re <= cholesky_solver_mc_CholFwBw_BwSub_xd_re;


	--x_d_auto_im(GPOUT,29)
    x_d_im <= cholesky_solver_mc_CholFwBw_BwSub_xd_im;


	--x_v_auto(GPOUT,30)
    x_v_s <= cholesky_solver_mc_CholFwBw_BwSub_xv_s;


	--y_v_auto(GPOUT,31)
    y_v_s <= cholesky_solver_mc_CholFwBw_Cholesky_Fw_y_v_s;


end normal;
