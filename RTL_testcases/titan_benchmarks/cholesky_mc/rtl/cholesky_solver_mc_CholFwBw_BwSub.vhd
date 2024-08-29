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

-- VHDL created from cholesky_solver_mc_CholFwBw_BwSub
-- VHDL created on Thu Oct  4 06:06:21 2012


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.hcc_package.all;
use work.math_package.all;
use work.fpc_library_package.all;
use work.dspba_library_package.all;
USE work.cholesky_solver_mc_safe_path.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

-- Text written from /data/rkay/daily_build/13.0/38.3/p4/ip/aion/src/mip_common/hw_model.cpp:1242
entity cholesky_solver_mc_CholFwBw_BwSub is
    port (
        Lij_v_s : in std_logic_vector(0 downto 0);
        ChIdx_s : in std_logic_vector(7 downto 0);
        y_v_s : in std_logic_vector(0 downto 0);
        Lij_y_re : in std_logic_vector(31 downto 0);
        Lij_y_im : in std_logic_vector(31 downto 0);
        ColumnIdx_s : in std_logic_vector(6 downto 0);
        RowIdx_s : in std_logic_vector(6 downto 0);
        BsInLowerTri_s : in std_logic_vector(0 downto 0);
        BsProcLower_s : in std_logic_vector(0 downto 0);
        MatSizeRT_mn1_s : in std_logic_vector(6 downto 0);
        NumMatRT_mn1_s : in std_logic_vector(1 downto 0);
        FwDone_s : in std_logic_vector(0 downto 0);
        xv_s : out std_logic_vector(0 downto 0);
        xc_s : out std_logic_vector(7 downto 0);
        xd_re : out std_logic_vector(31 downto 0);
        xd_im : out std_logic_vector(31 downto 0);
        xBwSubDone_s : out std_logic_vector(0 downto 0);
        xBsFifoErr_s : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of cholesky_solver_mc_CholFwBw_BwSub is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal Control_AutoMinDelay_q : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_Detect_Done_SRlatch1_SampleDelay1_q : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_Detect_Done_SampleDelay2_q : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_Detect_Done_SampleDelay4_q : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_SampleDelay_q : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_SampleDelay2_q : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO_reset : std_logic;
    signal Control_CmdFifo_FIFO_f : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO_e : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO_t : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO_q : std_logic_vector (6 downto 0);
    signal Control_CmdFifo_FIFO_empty : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO_v : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO1_reset : std_logic;
    signal Control_CmdFifo_FIFO1_f : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO1_e : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO1_t : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO1_q : std_logic_vector (15 downto 0);
    signal Control_CmdFifo_FIFO1_empty : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO1_v : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO2_reset : std_logic;
    signal Control_CmdFifo_FIFO2_f : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO2_e : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO2_t : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO2_q : std_logic_vector (6 downto 0);
    signal Control_CmdFifo_FIFO2_empty : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO2_v : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO4_reset : std_logic;
    signal Control_CmdFifo_FIFO4_f : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO4_e : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO4_t : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO4_q : std_logic_vector (15 downto 0);
    signal Control_CmdFifo_FIFO4_empty : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO4_v : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO_WrBkAddr_reset : std_logic;
    signal Control_CmdFifo_FIFO_WrBkAddr_f : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO_WrBkAddr_e : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO_WrBkAddr_t : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO_WrBkAddr_q : std_logic_vector (15 downto 0);
    signal Control_CmdFifo_FIFO_WrBkAddr_empty : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_FIFO_WrBkAddr_v : std_logic_vector (0 downto 0);
    signal Control_Commands_Add1_add_a : std_logic_vector(14 downto 0);
    signal Control_Commands_Add1_add_b : std_logic_vector(14 downto 0);
    signal Control_Commands_Add1_add_o : std_logic_vector (14 downto 0);
    signal Control_Commands_Add1_add_q : std_logic_vector (13 downto 0);
    signal Control_Commands_Const1_q : std_logic_vector (9 downto 0);
    signal Control_Commands_Const2_q : std_logic_vector (15 downto 0);
    signal Control_MasterLoops_Const1_q : std_logic_vector (6 downto 0);
    signal Control_MasterLoops_Const10_q : std_logic_vector (7 downto 0);
    signal Control_MasterLoops_Const11_q : std_logic_vector (15 downto 0);
    signal Control_MasterLoops_Const12_q : std_logic_vector (13 downto 0);
    signal Control_MasterLoops_Const2_q : std_logic_vector (7 downto 0);
    signal Control_MasterLoops_Const3_q : std_logic_vector (7 downto 0);
    signal Control_MasterLoops_Const4_q : std_logic_vector (9 downto 0);
    signal Control_MasterLoops_Const6_q : std_logic_vector (6 downto 0);
    signal Control_MasterLoops_ForChan_FLB_ls : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForChan_FLB_la : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForChan_FLB_init : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForChan_FLB_step : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForChan_FLB_limit : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForChan_FLB_en : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForChan_FLB_el : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForChan_FLB_fl : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForChan_FLB_ll : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForChan_FLB_bs : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForChan_FLB_v : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForChan_FLB_c : std_logic_vector (6 downto 0);
    signal Control_MasterLoops_ForChan_FLB_firstpass : std_logic;
    signal Control_MasterLoops_ForChan_FLB_firstnextpass : std_logic;
    signal Control_MasterLoops_ForChan_FLB_nextnextpass : std_logic;
    signal Control_MasterLoops_ForChan_FLB_nextpass : std_logic;
    signal Control_MasterLoops_ForChan_FLB_pass : std_logic;
    signal Control_MasterLoops_ForChan_FLB_count : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForChan_FLB_nextcount : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForChan_FLB_firstloop : std_logic;
    signal Control_MasterLoops_ForChan_FLB_limit2 : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForChan_FLB_prevpass : std_logic;
    signal Control_MasterLoops_ForChan_FLB_prevnextpass : std_logic;
    signal Control_MasterLoops_ForChan_FLB_prevcount : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForChan_FLB_prevnextcount : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForColumn_FLB_ls : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForColumn_FLB_la : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForColumn_FLB_init : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForColumn_FLB_step : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForColumn_FLB_limit : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForColumn_FLB_en : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForColumn_FLB_el : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForColumn_FLB_fl : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForColumn_FLB_ll : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForColumn_FLB_bs : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForColumn_FLB_v : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForColumn_FLB_c : std_logic_vector (7 downto 0);
    signal Control_MasterLoops_ForColumn_FLB_firstpass : std_logic;
    signal Control_MasterLoops_ForColumn_FLB_firstnextpass : std_logic;
    signal Control_MasterLoops_ForColumn_FLB_nextnextpass : std_logic;
    signal Control_MasterLoops_ForColumn_FLB_nextpass : std_logic;
    signal Control_MasterLoops_ForColumn_FLB_pass : std_logic;
    signal Control_MasterLoops_ForColumn_FLB_count : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForColumn_FLB_nextcount : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForColumn_FLB_firstloop : std_logic;
    signal Control_MasterLoops_ForColumn_FLB_limit2 : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForColumn_FLB_prevpass : std_logic;
    signal Control_MasterLoops_ForColumn_FLB_prevnextpass : std_logic;
    signal Control_MasterLoops_ForColumn_FLB_prevcount : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForColumn_FLB_prevnextcount : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForMatMem_FLB_ls : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForMatMem_FLB_la : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForMatMem_FLB_init : std_logic_vector (17 downto 0);
    signal Control_MasterLoops_ForMatMem_FLB_step : std_logic_vector (17 downto 0);
    signal Control_MasterLoops_ForMatMem_FLB_limit : std_logic_vector (17 downto 0);
    signal Control_MasterLoops_ForMatMem_FLB_en : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForMatMem_FLB_el : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForMatMem_FLB_fl : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForMatMem_FLB_ll : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForMatMem_FLB_bs : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForMatMem_FLB_v : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForMatMem_FLB_c : std_logic_vector (15 downto 0);
    signal Control_MasterLoops_ForMatMem_FLB_firstpass : std_logic;
    signal Control_MasterLoops_ForMatMem_FLB_firstnextpass : std_logic;
    signal Control_MasterLoops_ForMatMem_FLB_nextnextpass : std_logic;
    signal Control_MasterLoops_ForMatMem_FLB_nextpass : std_logic;
    signal Control_MasterLoops_ForMatMem_FLB_pass : std_logic;
    signal Control_MasterLoops_ForMatMem_FLB_count : std_logic_vector (17 downto 0);
    signal Control_MasterLoops_ForMatMem_FLB_nextcount : std_logic_vector (17 downto 0);
    signal Control_MasterLoops_ForMatMem_FLB_firstloop : std_logic;
    signal Control_MasterLoops_ForMatMem_FLB_limit2 : std_logic_vector (17 downto 0);
    signal Control_MasterLoops_ForMatMem_FLB_prevpass : std_logic;
    signal Control_MasterLoops_ForMatMem_FLB_prevnextpass : std_logic;
    signal Control_MasterLoops_ForMatMem_FLB_prevcount : std_logic_vector (17 downto 0);
    signal Control_MasterLoops_ForMatMem_FLB_prevnextcount : std_logic_vector (17 downto 0);
    signal Control_MasterLoops_ForRow_FLB_ls : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForRow_FLB_la : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForRow_FLB_init : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForRow_FLB_step : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForRow_FLB_limit : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForRow_FLB_en : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForRow_FLB_el : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForRow_FLB_fl : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForRow_FLB_ll : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForRow_FLB_bs : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForRow_FLB_v : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForRow_FLB_c : std_logic_vector (7 downto 0);
    signal Control_MasterLoops_ForRow_FLB_firstpass : std_logic;
    signal Control_MasterLoops_ForRow_FLB_firstnextpass : std_logic;
    signal Control_MasterLoops_ForRow_FLB_nextnextpass : std_logic;
    signal Control_MasterLoops_ForRow_FLB_nextpass : std_logic;
    signal Control_MasterLoops_ForRow_FLB_pass : std_logic;
    signal Control_MasterLoops_ForRow_FLB_count : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForRow_FLB_nextcount : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForRow_FLB_firstloop : std_logic;
    signal Control_MasterLoops_ForRow_FLB_limit2 : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForRow_FLB_prevpass : std_logic;
    signal Control_MasterLoops_ForRow_FLB_prevnextpass : std_logic;
    signal Control_MasterLoops_ForRow_FLB_prevcount : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_ForRow_FLB_prevnextcount : std_logic_vector (8 downto 0);
    signal Control_MasterLoops_For_yMem_FLB_ls : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_For_yMem_FLB_la : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_For_yMem_FLB_init : std_logic_vector (11 downto 0);
    signal Control_MasterLoops_For_yMem_FLB_step : std_logic_vector (11 downto 0);
    signal Control_MasterLoops_For_yMem_FLB_limit : std_logic_vector (11 downto 0);
    signal Control_MasterLoops_For_yMem_FLB_en : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_For_yMem_FLB_el : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_For_yMem_FLB_fl : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_For_yMem_FLB_ll : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_For_yMem_FLB_bs : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_For_yMem_FLB_v : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_For_yMem_FLB_c : std_logic_vector (9 downto 0);
    signal Control_MasterLoops_For_yMem_FLB_firstpass : std_logic;
    signal Control_MasterLoops_For_yMem_FLB_firstnextpass : std_logic;
    signal Control_MasterLoops_For_yMem_FLB_nextnextpass : std_logic;
    signal Control_MasterLoops_For_yMem_FLB_nextpass : std_logic;
    signal Control_MasterLoops_For_yMem_FLB_pass : std_logic;
    signal Control_MasterLoops_For_yMem_FLB_count : std_logic_vector (11 downto 0);
    signal Control_MasterLoops_For_yMem_FLB_nextcount : std_logic_vector (11 downto 0);
    signal Control_MasterLoops_For_yMem_FLB_firstloop : std_logic;
    signal Control_MasterLoops_For_yMem_FLB_limit2 : std_logic_vector (11 downto 0);
    signal Control_MasterLoops_For_yMem_FLB_prevpass : std_logic;
    signal Control_MasterLoops_For_yMem_FLB_prevnextpass : std_logic;
    signal Control_MasterLoops_For_yMem_FLB_prevcount : std_logic_vector (11 downto 0);
    signal Control_MasterLoops_For_yMem_FLB_prevnextcount : std_logic_vector (11 downto 0);
    signal Control_MasterLoops_latch_0L1_SampleDelay_q : std_logic_vector (6 downto 0);
    signal Control_MasterLoops_latch_0L2_SampleDelay_q : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_latch_0L3_SampleDelay_q : std_logic_vector (1 downto 0);
    signal DataPath_AccFifo_re_reset : std_logic;
    signal DataPath_AccFifo_re_f : std_logic_vector (0 downto 0);
    signal DataPath_AccFifo_re_e : std_logic_vector (0 downto 0);
    signal DataPath_AccFifo_re_t : std_logic_vector (0 downto 0);
    signal DataPath_AccFifo_re_q : std_logic_vector (44 downto 0);
    signal DataPath_AccFifo_re_empty : std_logic_vector (0 downto 0);
    signal DataPath_AccFifo_re_v : std_logic_vector (0 downto 0);
    signal DataPath_AccFifo_im_reset : std_logic;
    signal DataPath_AccFifo_im_f : std_logic_vector (0 downto 0);
    signal DataPath_AccFifo_im_e : std_logic_vector (0 downto 0);
    signal DataPath_AccFifo_im_t : std_logic_vector (0 downto 0);
    signal DataPath_AccFifo_im_q : std_logic_vector (44 downto 0);
    signal DataPath_AccFifo_im_empty : std_logic_vector (0 downto 0);
    signal DataPath_AccFifo_im_v : std_logic_vector (0 downto 0);
    signal DataPath_AutoMinDelay_q : std_logic_vector (0 downto 0);
    signal DataPath_Const1_q : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
    signal InPort_WrBack_InPort_Add1_add_a : std_logic_vector(13 downto 0);
    signal InPort_WrBack_InPort_Add1_add_b : std_logic_vector(13 downto 0);
    signal InPort_WrBack_InPort_Add1_add_o : std_logic_vector (13 downto 0);
    signal InPort_WrBack_InPort_Add1_add_q : std_logic_vector (13 downto 0);
    signal InPort_WrBack_InPort_FIFO1_reset : std_logic;
    signal InPort_WrBack_InPort_FIFO1_f : std_logic_vector (0 downto 0);
    signal InPort_WrBack_InPort_FIFO1_e : std_logic_vector (0 downto 0);
    signal InPort_WrBack_InPort_FIFO1_t : std_logic_vector (0 downto 0);
    signal InPort_WrBack_InPort_FIFO1_q : std_logic_vector (9 downto 0);
    signal InPort_WrBack_InPort_FIFO1_empty : std_logic_vector (0 downto 0);
    signal InPort_WrBack_InPort_FIFO1_v : std_logic_vector (0 downto 0);
    signal InPort_WrBack_InPort_FIFO2_re_reset : std_logic;
    signal InPort_WrBack_InPort_FIFO2_re_f : std_logic_vector (0 downto 0);
    signal InPort_WrBack_InPort_FIFO2_re_e : std_logic_vector (0 downto 0);
    signal InPort_WrBack_InPort_FIFO2_re_t : std_logic_vector (0 downto 0);
    signal InPort_WrBack_InPort_FIFO2_re_q : std_logic_vector (31 downto 0);
    signal InPort_WrBack_InPort_FIFO2_re_empty : std_logic_vector (0 downto 0);
    signal InPort_WrBack_InPort_FIFO2_re_v : std_logic_vector (0 downto 0);
    signal InPort_WrBack_InPort_FIFO2_im_reset : std_logic;
    signal InPort_WrBack_InPort_FIFO2_im_f : std_logic_vector (0 downto 0);
    signal InPort_WrBack_InPort_FIFO2_im_e : std_logic_vector (0 downto 0);
    signal InPort_WrBack_InPort_FIFO2_im_t : std_logic_vector (0 downto 0);
    signal InPort_WrBack_InPort_FIFO2_im_q : std_logic_vector (31 downto 0);
    signal InPort_WrBack_InPort_FIFO2_im_empty : std_logic_vector (0 downto 0);
    signal InPort_WrBack_InPort_FIFO2_im_v : std_logic_vector (0 downto 0);
    signal InPort_WrBack_InPort_Mult_a : std_logic_vector (7 downto 0);
    signal InPort_WrBack_InPort_Mult_b : std_logic_vector (13 downto 0);
    signal InPort_WrBack_InPort_Mult_s1 : std_logic_vector (21 downto 0);
    signal InPort_WrBack_InPort_Mult_reset : std_logic;
    signal InPort_WrBack_InPort_Mult_q : std_logic_vector (21 downto 0);
    signal L_Mem_re_reset0 : std_logic;
    signal L_Mem_re_iq : std_logic_vector (31 downto 0);
    signal L_Mem_re_ia : std_logic_vector (31 downto 0);
    signal L_Mem_re_ir : std_logic_vector (31 downto 0);
    signal L_Mem_re_aa : std_logic_vector (15 downto 0);
    signal L_Mem_re_ab : std_logic_vector (15 downto 0);
    signal L_Mem_re_q : std_logic_vector (31 downto 0);
    signal L_Mem_re_r : std_logic_vector (31 downto 0);
    signal L_Mem_im_reset0 : std_logic;
    signal L_Mem_im_iq : std_logic_vector (31 downto 0);
    signal L_Mem_im_ia : std_logic_vector (31 downto 0);
    signal L_Mem_im_ir : std_logic_vector (31 downto 0);
    signal L_Mem_im_aa : std_logic_vector (15 downto 0);
    signal L_Mem_im_ab : std_logic_vector (15 downto 0);
    signal L_Mem_im_q : std_logic_vector (31 downto 0);
    signal L_Mem_im_r : std_logic_vector (31 downto 0);
    signal SyncFifo_FIFO_re_reset : std_logic;
    signal SyncFifo_FIFO_re_f : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO_re_e : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO_re_t : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO_re_q : std_logic_vector (31 downto 0);
    signal SyncFifo_FIFO_re_empty : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO_re_v : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO_im_reset : std_logic;
    signal SyncFifo_FIFO_im_f : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO_im_e : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO_im_t : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO_im_q : std_logic_vector (31 downto 0);
    signal SyncFifo_FIFO_im_empty : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO_im_v : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO1_reset : std_logic;
    signal SyncFifo_FIFO1_f : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO1_e : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO1_t : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO1_q : std_logic_vector (4 downto 0);
    signal SyncFifo_FIFO1_empty : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO1_v : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO2_re_reset : std_logic;
    signal SyncFifo_FIFO2_re_f : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO2_re_e : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO2_re_t : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO2_re_q : std_logic_vector (31 downto 0);
    signal SyncFifo_FIFO2_re_empty : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO2_re_v : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO2_im_reset : std_logic;
    signal SyncFifo_FIFO2_im_f : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO2_im_e : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO2_im_t : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO2_im_q : std_logic_vector (31 downto 0);
    signal SyncFifo_FIFO2_im_empty : std_logic_vector (0 downto 0);
    signal SyncFifo_FIFO2_im_v : std_logic_vector (0 downto 0);
    signal yMem_re_reset0 : std_logic;
    signal yMem_re_iq : std_logic_vector (31 downto 0);
    signal yMem_re_ia : std_logic_vector (31 downto 0);
    signal yMem_re_ir : std_logic_vector (31 downto 0);
    signal yMem_re_aa : std_logic_vector (9 downto 0);
    signal yMem_re_ab : std_logic_vector (9 downto 0);
    signal yMem_re_q : std_logic_vector (31 downto 0);
    signal yMem_re_r : std_logic_vector (31 downto 0);
    signal yMem_im_reset0 : std_logic;
    signal yMem_im_iq : std_logic_vector (31 downto 0);
    signal yMem_im_ia : std_logic_vector (31 downto 0);
    signal yMem_im_ir : std_logic_vector (31 downto 0);
    signal yMem_im_aa : std_logic_vector (9 downto 0);
    signal yMem_im_ab : std_logic_vector (9 downto 0);
    signal yMem_im_q : std_logic_vector (31 downto 0);
    signal yMem_im_r : std_logic_vector (31 downto 0);
    signal DataPath_Add_R_add_f_reset : std_logic;
    signal DataPath_Add_R_add_f_add_sub : std_logic_vector (0 downto 0);
    signal DataPath_Add_R_add_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_Add_R_add_f_a_real : REAL;
    signal DataPath_Add_R_add_f_b_real : REAL;
    signal DataPath_Add_R_add_f_q_real : REAL;
    -- synopsys translate on
    signal DataPath_Add_R_add_f_p : std_logic_vector (0 downto 0);
    signal DataPath_Add_R_add_f_n : std_logic_vector (0 downto 0);
    signal DataPath_Add_I_add_f_reset : std_logic;
    signal DataPath_Add_I_add_f_add_sub : std_logic_vector (0 downto 0);
    signal DataPath_Add_I_add_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_Add_I_add_f_a_real : REAL;
    signal DataPath_Add_I_add_f_b_real : REAL;
    signal DataPath_Add_I_add_f_q_real : REAL;
    -- synopsys translate on
    signal DataPath_Add_I_add_f_p : std_logic_vector (0 downto 0);
    signal DataPath_Add_I_add_f_n : std_logic_vector (0 downto 0);
    signal DataPath_ConjMult1_Add1_add_f_reset : std_logic;
    signal DataPath_ConjMult1_Add1_add_f_add_sub : std_logic_vector (0 downto 0);
    signal DataPath_ConjMult1_Add1_add_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_ConjMult1_Add1_add_f_a_real : REAL;
    signal DataPath_ConjMult1_Add1_add_f_b_real : REAL;
    signal DataPath_ConjMult1_Add1_add_f_q_real : REAL;
    -- synopsys translate on
    signal DataPath_ConjMult1_Add1_add_f_p : std_logic_vector (0 downto 0);
    signal DataPath_ConjMult1_Add1_add_f_n : std_logic_vector (0 downto 0);
    signal DataPath_ConjMult1_Multii_f_reset : std_logic;
    signal DataPath_ConjMult1_Multii_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_ConjMult1_Multii_f_a_real : REAL;
    signal DataPath_ConjMult1_Multii_f_b_real : REAL;
    signal DataPath_ConjMult1_Multii_f_q_real : REAL;
    -- synopsys translate on
    signal DataPath_ConjMult1_Multir_f_reset : std_logic;
    signal DataPath_ConjMult1_Multir_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_ConjMult1_Multir_f_a_real : REAL;
    signal DataPath_ConjMult1_Multir_f_b_real : REAL;
    signal DataPath_ConjMult1_Multir_f_q_real : REAL;
    -- synopsys translate on
    signal DataPath_ConjMult1_Multri_f_reset : std_logic;
    signal DataPath_ConjMult1_Multri_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_ConjMult1_Multri_f_a_real : REAL;
    signal DataPath_ConjMult1_Multri_f_b_real : REAL;
    signal DataPath_ConjMult1_Multri_f_q_real : REAL;
    -- synopsys translate on
    signal DataPath_ConjMult1_Multrr_f_reset : std_logic;
    signal DataPath_ConjMult1_Multrr_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_ConjMult1_Multrr_f_a_real : REAL;
    signal DataPath_ConjMult1_Multrr_f_b_real : REAL;
    signal DataPath_ConjMult1_Multrr_f_q_real : REAL;
    -- synopsys translate on
    signal DataPath_ConjMult1_Sub_R_sub_f_reset : std_logic;
    signal DataPath_ConjMult1_Sub_R_sub_f_add_sub : std_logic_vector (0 downto 0);
    signal DataPath_ConjMult1_Sub_R_sub_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_ConjMult1_Sub_R_sub_f_a_real : REAL;
    signal DataPath_ConjMult1_Sub_R_sub_f_b_real : REAL;
    signal DataPath_ConjMult1_Sub_R_sub_f_q_real : REAL;
    -- synopsys translate on
    signal DataPath_ConjMult1_Sub_R_sub_f_p : std_logic_vector (0 downto 0);
    signal DataPath_ConjMult1_Sub_R_sub_f_n : std_logic_vector (0 downto 0);
    signal DataPath_Mult_R_sub_f_reset : std_logic;
    signal DataPath_Mult_R_sub_f_add_sub : std_logic_vector (0 downto 0);
    signal DataPath_Mult_R_sub_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_Mult_R_sub_f_a_real : REAL;
    signal DataPath_Mult_R_sub_f_b_real : REAL;
    signal DataPath_Mult_R_sub_f_q_real : REAL;
    -- synopsys translate on
    signal DataPath_Mult_R_sub_f_p : std_logic_vector (0 downto 0);
    signal DataPath_Mult_R_sub_f_n : std_logic_vector (0 downto 0);
    signal DataPath_Mult_I_add_f_reset : std_logic;
    signal DataPath_Mult_I_add_f_add_sub : std_logic_vector (0 downto 0);
    signal DataPath_Mult_I_add_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_Mult_I_add_f_a_real : REAL;
    signal DataPath_Mult_I_add_f_b_real : REAL;
    signal DataPath_Mult_I_add_f_q_real : REAL;
    -- synopsys translate on
    signal DataPath_Mult_I_add_f_p : std_logic_vector (0 downto 0);
    signal DataPath_Mult_I_add_f_n : std_logic_vector (0 downto 0);
    signal DataPath_Mult_aR_x_bR_f_reset : std_logic;
    signal DataPath_Mult_aR_x_bR_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_Mult_aR_x_bR_f_a_real : REAL;
    signal DataPath_Mult_aR_x_bR_f_b_real : REAL;
    signal DataPath_Mult_aR_x_bR_f_q_real : REAL;
    -- synopsys translate on
    signal DataPath_Mult_aI_x_bI_f_reset : std_logic;
    signal DataPath_Mult_aI_x_bI_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_Mult_aI_x_bI_f_a_real : REAL;
    signal DataPath_Mult_aI_x_bI_f_b_real : REAL;
    signal DataPath_Mult_aI_x_bI_f_q_real : REAL;
    -- synopsys translate on
    signal DataPath_Mult_aR_x_bI_f_reset : std_logic;
    signal DataPath_Mult_aR_x_bI_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_Mult_aR_x_bI_f_a_real : REAL;
    signal DataPath_Mult_aR_x_bI_f_b_real : REAL;
    signal DataPath_Mult_aR_x_bI_f_q_real : REAL;
    -- synopsys translate on
    signal DataPath_Mult_aI_x_bR_f_reset : std_logic;
    signal DataPath_Mult_aI_x_bR_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_Mult_aI_x_bR_f_a_real : REAL;
    signal DataPath_Mult_aI_x_bR_f_b_real : REAL;
    signal DataPath_Mult_aI_x_bR_f_q_real : REAL;
    -- synopsys translate on
    signal DataPath_x_top_R_sub_f_reset : std_logic;
    signal DataPath_x_top_R_sub_f_add_sub : std_logic_vector (0 downto 0);
    signal DataPath_x_top_R_sub_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_x_top_R_sub_f_a_real : REAL;
    signal DataPath_x_top_R_sub_f_b_real : REAL;
    signal DataPath_x_top_R_sub_f_q_real : REAL;
    -- synopsys translate on
    signal DataPath_x_top_R_sub_f_p : std_logic_vector (0 downto 0);
    signal DataPath_x_top_R_sub_f_n : std_logic_vector (0 downto 0);
    signal DataPath_x_top_I_sub_f_reset : std_logic;
    signal DataPath_x_top_I_sub_f_add_sub : std_logic_vector (0 downto 0);
    signal DataPath_x_top_I_sub_f_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_x_top_I_sub_f_a_real : REAL;
    signal DataPath_x_top_I_sub_f_b_real : REAL;
    signal DataPath_x_top_I_sub_f_q_real : REAL;
    -- synopsys translate on
    signal DataPath_x_top_I_sub_f_p : std_logic_vector (0 downto 0);
    signal DataPath_x_top_I_sub_f_n : std_logic_vector (0 downto 0);
    signal ChannelOut_2_cast_reset : std_logic;
    signal ChannelOut_2_cast_a : std_logic_vector (44 downto 0);
    signal ChannelOut_2_cast_q : std_logic_vector (31 downto 0);
    -- synopsys translate off
    signal ChannelOut_2_cast_q_real : REAL;
    -- synopsys translate on
    signal ChannelOut_3_cast_reset : std_logic;
    signal ChannelOut_3_cast_a : std_logic_vector (44 downto 0);
    signal ChannelOut_3_cast_q : std_logic_vector (31 downto 0);
    -- synopsys translate off
    signal ChannelOut_3_cast_q_real : REAL;
    -- synopsys translate on
    signal DataPath_Mux_re_2_cast_reset : std_logic;
    signal DataPath_Mux_re_2_cast_a : std_logic_vector (44 downto 0);
    signal DataPath_Mux_re_2_cast_q : std_logic_vector (31 downto 0);
    -- synopsys translate off
    signal DataPath_Mux_re_2_cast_q_real : REAL;
    -- synopsys translate on
    signal InPort_WrBack_Input_WrBk_Mux_Mux3_re_3_cast_reset : std_logic;
    signal InPort_WrBack_Input_WrBk_Mux_Mux3_re_3_cast_a : std_logic_vector (44 downto 0);
    signal InPort_WrBack_Input_WrBk_Mux_Mux3_re_3_cast_q : std_logic_vector (31 downto 0);
    -- synopsys translate off
    signal InPort_WrBack_Input_WrBk_Mux_Mux3_re_3_cast_q_real : REAL;
    -- synopsys translate on
    signal InPort_WrBack_Input_WrBk_Mux_Mux3_im_3_cast_reset : std_logic;
    signal InPort_WrBack_Input_WrBk_Mux_Mux3_im_3_cast_a : std_logic_vector (44 downto 0);
    signal InPort_WrBack_Input_WrBk_Mux_Mux3_im_3_cast_q : std_logic_vector (31 downto 0);
    -- synopsys translate off
    signal InPort_WrBack_Input_WrBk_Mux_Mux3_im_3_cast_q_real : REAL;
    -- synopsys translate on
    signal DataPath_Add_R_add_f_1_cast_reset : std_logic;
    signal DataPath_Add_R_add_f_1_cast_a : std_logic_vector (31 downto 0);
    signal DataPath_Add_R_add_f_1_cast_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_Add_R_add_f_1_cast_q_real : REAL;
    -- synopsys translate on
    signal DataPath_Mult_aR_x_bR_f_0_cast_reset : std_logic;
    signal DataPath_Mult_aR_x_bR_f_0_cast_a : std_logic_vector (44 downto 0);
    signal DataPath_Mult_aR_x_bR_f_0_cast_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_Mult_aR_x_bR_f_0_cast_q_real : REAL;
    -- synopsys translate on
    signal DataPath_Mult_aR_x_bR_f_1_cast_reset : std_logic;
    signal DataPath_Mult_aR_x_bR_f_1_cast_a : std_logic_vector (31 downto 0);
    signal DataPath_Mult_aR_x_bR_f_1_cast_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_Mult_aR_x_bR_f_1_cast_q_real : REAL;
    -- synopsys translate on
    signal DataPath_Mult_aI_x_bI_f_0_cast_reset : std_logic;
    signal DataPath_Mult_aI_x_bI_f_0_cast_a : std_logic_vector (44 downto 0);
    signal DataPath_Mult_aI_x_bI_f_0_cast_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_Mult_aI_x_bI_f_0_cast_q_real : REAL;
    -- synopsys translate on
    signal DataPath_Mult_aI_x_bI_f_1_cast_reset : std_logic;
    signal DataPath_Mult_aI_x_bI_f_1_cast_a : std_logic_vector (31 downto 0);
    signal DataPath_Mult_aI_x_bI_f_1_cast_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_Mult_aI_x_bI_f_1_cast_q_real : REAL;
    -- synopsys translate on
    signal DataPath_x_top_R_sub_f_0_cast_reset : std_logic;
    signal DataPath_x_top_R_sub_f_0_cast_a : std_logic_vector (31 downto 0);
    signal DataPath_x_top_R_sub_f_0_cast_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_x_top_R_sub_f_0_cast_q_real : REAL;
    -- synopsys translate on
    signal DataPath_x_top_R_sub_f_1_cast_reset : std_logic;
    signal DataPath_x_top_R_sub_f_1_cast_a : std_logic_vector (31 downto 0);
    signal DataPath_x_top_R_sub_f_1_cast_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_x_top_R_sub_f_1_cast_q_real : REAL;
    -- synopsys translate on
    signal DataPath_x_top_I_sub_f_0_cast_reset : std_logic;
    signal DataPath_x_top_I_sub_f_0_cast_a : std_logic_vector (31 downto 0);
    signal DataPath_x_top_I_sub_f_0_cast_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_x_top_I_sub_f_0_cast_q_real : REAL;
    -- synopsys translate on
    signal DataPath_Mux_im_3_cast_q_const_q : std_logic_vector (44 downto 0) := '0' & '0' & '0' & "00000100000000000000000000000" & "000" & "0000000000";
    signal Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_a : std_logic_vector(17 downto 0);
    signal Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_b : std_logic_vector(17 downto 0);
    signal Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_i : std_logic_vector (17 downto 0);
    signal Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_o : std_logic_vector (17 downto 0);
    signal Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_cin : std_logic_vector (0 downto 0);
    signal Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_q : std_logic_vector (15 downto 0);
    signal Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged_a : std_logic_vector(17 downto 0);
    signal Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged_b : std_logic_vector(17 downto 0);
    signal Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged_i : std_logic_vector (17 downto 0);
    signal Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged_o : std_logic_vector (17 downto 0);
    signal Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged_cin : std_logic_vector (0 downto 0);
    signal Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged_q : std_logic_vector (15 downto 0);
    signal InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_a : std_logic_vector(17 downto 0);
    signal InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_b : std_logic_vector(17 downto 0);
    signal InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_i : std_logic_vector (17 downto 0);
    signal InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_o : std_logic_vector (17 downto 0);
    signal InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_cin : std_logic_vector (0 downto 0);
    signal InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_q : std_logic_vector (15 downto 0);
    signal InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_a : std_logic_vector(11 downto 0);
    signal InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_b : std_logic_vector(11 downto 0);
    signal InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_i : std_logic_vector (11 downto 0);
    signal InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_o : std_logic_vector (11 downto 0);
    signal InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_cin : std_logic_vector (0 downto 0);
    signal InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_q : std_logic_vector (9 downto 0);
    signal DataPath_Mux1_im_0_norm_DataPath_Add_I_add_f_1_reset : std_logic;
    signal DataPath_Mux1_im_0_norm_DataPath_Add_I_add_f_1_q : std_logic_vector (44 downto 0);
    -- synopsys translate off
    signal DataPath_Mux1_im_0_norm_DataPath_Add_I_add_f_1_q_real : REAL;
    -- synopsys translate on
    signal reg_Control_CmdFifo_Detect_Done_SRlatch1_SampleDelay1_0_to_Control_CmdFifo_Detect_Done_And14_1_q : std_logic_vector (0 downto 0);
    signal reg_InPort_WrBack_InPort_Mult1_shift4_0_to_InPort_WrBack_InPort_Add3_add_1_q : std_logic_vector (15 downto 0);
    signal ld_Control_CmdFifo_BitExtract1_5_b_to_Control_CmdFifo_And3_a_q : std_logic_vector (0 downto 0);
    signal ld_Control_CmdFifo_BitExtract1_6_b_to_Control_CmdFifo_And3_b_q : std_logic_vector (0 downto 0);
    signal ld_Control_CmdFifo_Detect_Pulses2_SRlatch_SampleDelay1_q_to_Control_CmdFifo_Detect_Pulses2_SRlatch_Or_a_q : std_logic_vector (0 downto 0);
    signal ld_Control_CmdFifo_Detect_Pulses2_SRlatch1_SampleDelay1_q_to_Control_CmdFifo_Detect_Pulses2_SRlatch1_Or_a_q : std_logic_vector (0 downto 0);
    signal ld_Control_MasterLoops_ForChan_FLB_v_to_Control_CmdFifo_FIFO1_v_q : std_logic_vector (0 downto 0);
    signal ld_Control_CmdFifo_Or_q_to_Control_CmdFifo_FIFO1_r_q : std_logic_vector (0 downto 0);
    signal ld_Control_MasterLoops_ForChan_FLB_v_to_Control_CmdFifo_FIFO4_v_q : std_logic_vector (0 downto 0);
    signal ld_Control_CmdFifo_Or_q_to_Control_CmdFifo_FIFO4_r_q : std_logic_vector (0 downto 0);
    signal ld_Control_CmdFifo_And12_q_to_Control_CmdFifo_FIFO_WrBkAddr_v_q : std_logic_vector (0 downto 0);
    signal ld_Control_CmdFifo_Detect_Pulses2_And2_q_to_Control_CmdFifo_SRlatch_Not_a_q : std_logic_vector (0 downto 0);
    signal ld_Control_CmdFifo_SRlatch_SampleDelay1_q_to_Control_CmdFifo_SRlatch_Or_a_q : std_logic_vector (0 downto 0);
    signal ld_Control_MasterLoops_latch_0L3_Mux_q_to_Control_MasterLoops_ForChan_FLB_limit_q : std_logic_vector (1 downto 0);
    signal ld_ChannelIn_FwDone_s_to_Control_MasterLoops_ForColumn_FLB_ls_q : std_logic_vector (0 downto 0);
    signal ld_Control_MasterLoops_ForRow_FLB_bs_to_Control_MasterLoops_ForMatMem_FLB_ls_q : std_logic_vector (0 downto 0);
    signal ld_Control_MasterLoops_Not_q_to_Control_MasterLoops_ForMatMem_FLB_en_q : std_logic_vector (0 downto 0);
    signal ld_ChannelIn_MatSizeRT_mn1_s_to_Control_MasterLoops_latch_0L1_Mux_d_q : std_logic_vector (6 downto 0);
    signal ld_DataPath_AutoMinDelay_q_to_DataPath_AccFifo_im_v_q : std_logic_vector (0 downto 0);
    signal ld_SyncFifo_And6_q_to_DataPath_AccFifo_im_r_q : std_logic_vector (0 downto 0);
    signal ld_SyncFifo_And4_q_to_DataPath_Mux_im_b_q : std_logic_vector (0 downto 0);
    signal ld_SyncFifo_And6_q_to_DataPath_Mux1_re_b_q : std_logic_vector (0 downto 0);
    signal ld_InPort_WrBack_InPort_Add1_add_q_to_InPort_WrBack_InPort_Add2_add_b_q : std_logic_vector (13 downto 0);
    signal ld_ChannelIn_ColumnIdx_s_to_InPort_WrBack_InPort_Add3_add_a_q : std_logic_vector (6 downto 0);
    signal ld_ChannelIn_y_v_s_to_InPort_WrBack_InPort_FIFO1_v_q : std_logic_vector (0 downto 0);
    signal ld_InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_q_to_InPort_WrBack_InPort_FIFO1_d_q : std_logic_vector (9 downto 0);
    signal ld_AutoMinDelay_q_to_InPort_WrBack_Input_WrBk_Mux_Mux2_b_q : std_logic_vector (0 downto 0);
    signal ld_InPort_WrBack_InPort_FIFO1_q_to_InPort_WrBack_Input_WrBk_Mux_Mux2_c_q : std_logic_vector (9 downto 0);
    signal ld_Control_CmdFifo_FIFO_WrBkAddr_q_to_InPort_WrBack_Input_WrBk_Mux_Mux2_d_q : std_logic_vector (15 downto 0);
    signal ld_InPort_WrBack_InPort_FIFO2_re_q_to_InPort_WrBack_Input_WrBk_Mux_Mux3_re_c_q : std_logic_vector (31 downto 0);
    signal ld_InPort_WrBack_InPort_FIFO2_im_q_to_InPort_WrBack_Input_WrBk_Mux_Mux3_im_c_q : std_logic_vector (31 downto 0);
    signal ld_ChannelIn_Lij_v_s_to_L_Mem_re_b_q : std_logic_vector (0 downto 0);
    signal ld_InPort_WrBack_InPort_FIFO1_f_to_Or_rsrvd_fix_a_q : std_logic_vector (0 downto 0);
    signal ld_DataPath_And_q_to_Or_rsrvd_fix_b_q : std_logic_vector (0 downto 0);
    signal ld_DataPath_AccFifo_re_f_to_Or_rsrvd_fix_c_q : std_logic_vector (0 downto 0);
    signal ld_Control_CmdFifo_And5_q_to_Or_rsrvd_fix_f_q : std_logic_vector (0 downto 0);
    signal ld_SyncFifo_Or_q_to_SyncFifo_And_a_q : std_logic_vector (0 downto 0);
    signal ld_SyncFifo_BitExtract1_1_b_to_SyncFifo_And4_a_q : std_logic_vector (0 downto 0);
    signal ld_SyncFifo_Or_q_to_SyncFifo_And4_b_q : std_logic_vector (0 downto 0);
    signal ld_Control_CmdFifo_Or_q_to_SyncFifo_FIFO_re_v_q : std_logic_vector (0 downto 0);
    signal ld_Control_CmdFifo_FIFO1_q_to_yMem_re_a_q : std_logic_vector (15 downto 0);
    signal ld_InPort_WrBack_Input_WrBk_Mux_Mux1_q_to_yMem_re_b_q : std_logic_vector (0 downto 0);
    signal ld_DataPath_x_top_I_sub_f_q_to_DataPath_Mult_aI_x_bI_f_0_cast_a_q : std_logic_vector (44 downto 0);
    signal ld_SyncFifo_FIFO_im_q_to_DataPath_x_top_I_sub_f_0_cast_a_q : std_logic_vector (31 downto 0);
    signal ld_Control_Commands_Mux_sel_inv_q_to_Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_l_q : std_logic_vector (0 downto 0);
    signal ld_Control_MasterLoops_latch_0L2_Mux_q_to_Control_Commands_Mux_sel_inv_a_q : std_logic_vector (0 downto 0);
    signal ld_InPort_WrBack_InPort_Mux_sel_inv_q_to_InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_l_q : std_logic_vector (0 downto 0);
    signal ld_ChannelIn_BsInLowerTri_s_to_InPort_WrBack_InPort_Mux_sel_inv_a_q : std_logic_vector (0 downto 0);
    signal AutoMinDelay_replace_mem_reset0 : std_logic;
    signal AutoMinDelay_replace_mem_iq : std_logic_vector (0 downto 0);
    signal AutoMinDelay_replace_mem_ia : std_logic_vector (0 downto 0);
    signal AutoMinDelay_replace_mem_ir : std_logic_vector (0 downto 0);
    signal AutoMinDelay_replace_mem_aa : std_logic_vector (4 downto 0);
    signal AutoMinDelay_replace_mem_ab : std_logic_vector (4 downto 0);
    signal AutoMinDelay_replace_mem_q : std_logic_vector (0 downto 0);
    signal AutoMinDelay_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal AutoMinDelay_replace_rdcnt_i : unsigned(4 downto 0);
    signal AutoMinDelay_replace_rdcnt_eq : std_logic;
    signal AutoMinDelay_replace_wrreg_q : std_logic_vector (4 downto 0);
    signal AutoMinDelay_mem_top_q : std_logic_vector (5 downto 0);
    signal AutoMinDelay_cmpReg_q : std_logic_vector (0 downto 0);
    signal AutoMinDelay_sticky_ena_q : std_logic_vector (0 downto 0);
    signal DataPath_AutoMinDelay1_im_im_replace_mem_reset0 : std_logic;
    signal DataPath_AutoMinDelay1_im_im_replace_mem_iq : std_logic_vector (44 downto 0);
    signal DataPath_AutoMinDelay1_im_im_replace_mem_ia : std_logic_vector (44 downto 0);
    signal DataPath_AutoMinDelay1_im_im_replace_mem_ir : std_logic_vector (44 downto 0);
    signal DataPath_AutoMinDelay1_im_im_replace_mem_aa : std_logic_vector (2 downto 0);
    signal DataPath_AutoMinDelay1_im_im_replace_mem_ab : std_logic_vector (2 downto 0);
    signal DataPath_AutoMinDelay1_im_im_replace_mem_q : std_logic_vector (44 downto 0);
    signal DataPath_AutoMinDelay1_im_im_replace_rdcnt_q : std_logic_vector(2 downto 0);
    signal DataPath_AutoMinDelay1_im_im_replace_rdcnt_i : unsigned(2 downto 0);
    signal DataPath_AutoMinDelay1_im_im_replace_rdcnt_eq : std_logic;
    signal DataPath_AutoMinDelay1_im_im_replace_wrreg_q : std_logic_vector (2 downto 0);
    signal DataPath_AutoMinDelay1_im_im_mem_top_q : std_logic_vector (3 downto 0);
    signal DataPath_AutoMinDelay1_im_im_cmpReg_q : std_logic_vector (0 downto 0);
    signal DataPath_AutoMinDelay1_im_im_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_SyncFifo_And1_q_to_ChannelOut_xv_s_outputreg_q : std_logic_vector (0 downto 0);
    signal ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_outputreg_q : std_logic_vector (6 downto 0);
    signal ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_replace_mem_reset0 : std_logic;
    signal ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_replace_mem_iq : std_logic_vector (6 downto 0);
    signal ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_replace_mem_ia : std_logic_vector (6 downto 0);
    signal ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_replace_mem_ir : std_logic_vector (6 downto 0);
    signal ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_replace_mem_q : std_logic_vector (6 downto 0);
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_outputreg_q : std_logic_vector (0 downto 0);
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_mem_reset0 : std_logic;
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_mem_ir : std_logic_vector (0 downto 0);
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_rdcnt_eq : std_logic;
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_wrreg_q : std_logic_vector (4 downto 0);
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_outputreg_q : std_logic_vector (0 downto 0);
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_mem_reset0 : std_logic;
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_mem_iq : std_logic_vector (0 downto 0);
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_mem_ia : std_logic_vector (0 downto 0);
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_mem_ir : std_logic_vector (0 downto 0);
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_mem_aa : std_logic_vector (4 downto 0);
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_mem_ab : std_logic_vector (4 downto 0);
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_mem_q : std_logic_vector (0 downto 0);
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_rdcnt_q : std_logic_vector(4 downto 0);
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_rdcnt_i : unsigned(4 downto 0);
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_rdcnt_eq : std_logic;
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_wrreg_q : std_logic_vector (4 downto 0);
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_mem_top_q : std_logic_vector (5 downto 0);
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_InPort_WrBack_InPort_Add1_add_q_to_InPort_WrBack_InPort_Add2_add_b_outputreg_q : std_logic_vector (13 downto 0);
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_mem_reset0 : std_logic;
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_mem_iq : std_logic_vector (31 downto 0);
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_mem_ia : std_logic_vector (31 downto 0);
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_mem_ir : std_logic_vector (31 downto 0);
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_mem_q : std_logic_vector (31 downto 0);
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_rdcnt_q : std_logic_vector(1 downto 0);
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_rdcnt_i : unsigned(1 downto 0);
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_rdcnt_eq : std_logic;
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_wrreg_q : std_logic_vector (1 downto 0);
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_mem_top_q : std_logic_vector (2 downto 0);
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_ChannelIn_Lij_y_im_to_InPort_WrBack_InPort_FIFO2_im_d_replace_mem_reset0 : std_logic;
    signal ld_ChannelIn_Lij_y_im_to_InPort_WrBack_InPort_FIFO2_im_d_replace_mem_iq : std_logic_vector (31 downto 0);
    signal ld_ChannelIn_Lij_y_im_to_InPort_WrBack_InPort_FIFO2_im_d_replace_mem_ia : std_logic_vector (31 downto 0);
    signal ld_ChannelIn_Lij_y_im_to_InPort_WrBack_InPort_FIFO2_im_d_replace_mem_ir : std_logic_vector (31 downto 0);
    signal ld_ChannelIn_Lij_y_im_to_InPort_WrBack_InPort_FIFO2_im_d_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_ChannelIn_Lij_y_im_to_InPort_WrBack_InPort_FIFO2_im_d_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_ChannelIn_Lij_y_im_to_InPort_WrBack_InPort_FIFO2_im_d_replace_mem_q : std_logic_vector (31 downto 0);
    signal ld_ChannelIn_Lij_y_re_to_L_Mem_re_dd_outputreg_q : std_logic_vector (31 downto 0);
    signal ld_ChannelIn_Lij_y_im_to_L_Mem_im_dd_outputreg_q : std_logic_vector (31 downto 0);
    signal ld_DataPath_Mux1_re_q_to_DataPath_Add_R_add_f_1_cast_a_replace_mem_reset0 : std_logic;
    signal ld_DataPath_Mux1_re_q_to_DataPath_Add_R_add_f_1_cast_a_replace_mem_iq : std_logic_vector (31 downto 0);
    signal ld_DataPath_Mux1_re_q_to_DataPath_Add_R_add_f_1_cast_a_replace_mem_ia : std_logic_vector (31 downto 0);
    signal ld_DataPath_Mux1_re_q_to_DataPath_Add_R_add_f_1_cast_a_replace_mem_ir : std_logic_vector (31 downto 0);
    signal ld_DataPath_Mux1_re_q_to_DataPath_Add_R_add_f_1_cast_a_replace_mem_aa : std_logic_vector (1 downto 0);
    signal ld_DataPath_Mux1_re_q_to_DataPath_Add_R_add_f_1_cast_a_replace_mem_ab : std_logic_vector (1 downto 0);
    signal ld_DataPath_Mux1_re_q_to_DataPath_Add_R_add_f_1_cast_a_replace_mem_q : std_logic_vector (31 downto 0);
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_mem_reset0 : std_logic;
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_mem_iq : std_logic_vector (31 downto 0);
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_mem_ia : std_logic_vector (31 downto 0);
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_mem_ir : std_logic_vector (31 downto 0);
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_mem_q : std_logic_vector (31 downto 0);
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_rdcnt_q : std_logic_vector(3 downto 0);
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_rdcnt_i : unsigned(3 downto 0);
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_rdcnt_eq : std_logic;
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_wrreg_q : std_logic_vector (3 downto 0);
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_mem_top_q : std_logic_vector (4 downto 0);
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_sticky_ena_q : std_logic_vector (0 downto 0);
    signal ld_SyncFifo_FIFO2_im_q_to_DataPath_Mult_aI_x_bI_f_1_cast_a_replace_mem_reset0 : std_logic;
    signal ld_SyncFifo_FIFO2_im_q_to_DataPath_Mult_aI_x_bI_f_1_cast_a_replace_mem_iq : std_logic_vector (31 downto 0);
    signal ld_SyncFifo_FIFO2_im_q_to_DataPath_Mult_aI_x_bI_f_1_cast_a_replace_mem_ia : std_logic_vector (31 downto 0);
    signal ld_SyncFifo_FIFO2_im_q_to_DataPath_Mult_aI_x_bI_f_1_cast_a_replace_mem_ir : std_logic_vector (31 downto 0);
    signal ld_SyncFifo_FIFO2_im_q_to_DataPath_Mult_aI_x_bI_f_1_cast_a_replace_mem_aa : std_logic_vector (3 downto 0);
    signal ld_SyncFifo_FIFO2_im_q_to_DataPath_Mult_aI_x_bI_f_1_cast_a_replace_mem_ab : std_logic_vector (3 downto 0);
    signal ld_SyncFifo_FIFO2_im_q_to_DataPath_Mult_aI_x_bI_f_1_cast_a_replace_mem_q : std_logic_vector (31 downto 0);
    signal ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_mem_reset0 : std_logic;
    signal ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_mem_iq : std_logic_vector (31 downto 0);
    signal ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_mem_ia : std_logic_vector (31 downto 0);
    signal ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_mem_ir : std_logic_vector (31 downto 0);
    signal ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_mem_aa : std_logic_vector (0 downto 0);
    signal ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_mem_ab : std_logic_vector (0 downto 0);
    signal ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_mem_q : std_logic_vector (31 downto 0);
    signal ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_rdcnt_q : std_logic_vector(0 downto 0);
    signal ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_rdcnt_i : unsigned(0 downto 0);
    signal ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_wrreg_q : std_logic_vector (0 downto 0);
    signal ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_cmpReg_q : std_logic_vector (0 downto 0);
    signal ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_sticky_ena_q : std_logic_vector (0 downto 0);
    signal Control_Commands_Add2_add_a : std_logic_vector(15 downto 0);
    signal Control_Commands_Add2_add_b : std_logic_vector(15 downto 0);
    signal Control_Commands_Add2_add_o : std_logic_vector (15 downto 0);
    signal Control_Commands_Add2_add_q : std_logic_vector (15 downto 0);
    signal Control_Commands_Add3_add_a : std_logic_vector(16 downto 0);
    signal Control_Commands_Add3_add_b : std_logic_vector(16 downto 0);
    signal Control_Commands_Add3_add_o : std_logic_vector (16 downto 0);
    signal Control_Commands_Add3_add_q : std_logic_vector (15 downto 0);
    signal Control_Commands_BsColIdx2BankAddr_q : std_logic_vector(13 downto 0);
    signal Control_MasterLoops_latch_0L1_Mux_s : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_latch_0L1_Mux_q : std_logic_vector (6 downto 0);
    signal Control_MasterLoops_latch_0L2_Mux_s : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_latch_0L2_Mux_q : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_latch_0L3_Mux_s : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_latch_0L3_Mux_q : std_logic_vector (1 downto 0);
    signal DataPath_Mux_im_s : std_logic_vector (0 downto 0);
    signal DataPath_Mux_im_q : std_logic_vector (44 downto 0);
    signal DataPath_Mux1_re_s : std_logic_vector (0 downto 0);
    signal DataPath_Mux1_re_q : std_logic_vector (31 downto 0);
    signal DataPath_Mux1_im_s : std_logic_vector (0 downto 0);
    signal DataPath_Mux1_im_q : std_logic_vector (44 downto 0);
    signal InPort_WrBack_InPort_Add2_add_a : std_logic_vector(15 downto 0);
    signal InPort_WrBack_InPort_Add2_add_b : std_logic_vector(15 downto 0);
    signal InPort_WrBack_InPort_Add2_add_o : std_logic_vector (15 downto 0);
    signal InPort_WrBack_InPort_Add2_add_q : std_logic_vector (15 downto 0);
    signal InPort_WrBack_InPort_Add3_add_a : std_logic_vector(9 downto 0);
    signal InPort_WrBack_InPort_Add3_add_b : std_logic_vector(9 downto 0);
    signal InPort_WrBack_InPort_Add3_add_o : std_logic_vector (9 downto 0);
    signal InPort_WrBack_InPort_Add3_add_q : std_logic_vector (9 downto 0);
    signal InPort_WrBack_InPort_BsInColIdx2BankAddr_q : std_logic_vector(13 downto 0);
    signal InPort_WrBack_Input_WrBk_Mux_Mux2_s : std_logic_vector (0 downto 0);
    signal InPort_WrBack_Input_WrBk_Mux_Mux2_q : std_logic_vector (15 downto 0);
    signal InPort_WrBack_Input_WrBk_Mux_Mux3_re_s : std_logic_vector (0 downto 0);
    signal InPort_WrBack_Input_WrBk_Mux_Mux3_re_q : std_logic_vector (31 downto 0);
    signal InPort_WrBack_Input_WrBk_Mux_Mux3_im_s : std_logic_vector (0 downto 0);
    signal InPort_WrBack_Input_WrBk_Mux_Mux3_im_q : std_logic_vector (31 downto 0);
    signal Control_MasterLoops_Convert_rnd_in : std_logic_vector (6 downto 0);
    signal Control_MasterLoops_Convert_rnd_q : std_logic_vector (6 downto 0);
    signal AutoMinDelay_notEnable_a : std_logic_vector(0 downto 0);
    signal AutoMinDelay_notEnable_q : std_logic_vector(0 downto 0);
    signal AutoMinDelay_enaAnd_a : std_logic_vector(0 downto 0);
    signal AutoMinDelay_enaAnd_b : std_logic_vector(0 downto 0);
    signal AutoMinDelay_enaAnd_q : std_logic_vector(0 downto 0);
    signal DataPath_AutoMinDelay1_im_im_enaAnd_a : std_logic_vector(0 downto 0);
    signal DataPath_AutoMinDelay1_im_im_enaAnd_b : std_logic_vector(0 downto 0);
    signal DataPath_AutoMinDelay1_im_im_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_enaAnd_a : std_logic_vector(0 downto 0);
    signal ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_enaAnd_b : std_logic_vector(0 downto 0);
    signal ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_enaAnd_q : std_logic_vector(0 downto 0);
    signal InPort_WrBack_InPort_Mult1_shift0_q_int : std_logic_vector (10 downto 0);
    signal InPort_WrBack_InPort_Mult1_shift0_q : std_logic_vector (10 downto 0);
    signal InPort_WrBack_InPort_Mult1_add_1_a : std_logic_vector(11 downto 0);
    signal InPort_WrBack_InPort_Mult1_add_1_b : std_logic_vector(11 downto 0);
    signal InPort_WrBack_InPort_Mult1_add_1_o : std_logic_vector (11 downto 0);
    signal InPort_WrBack_InPort_Mult1_add_1_q : std_logic_vector (11 downto 0);
    signal InPort_WrBack_InPort_Mult1_shift2_q_int : std_logic_vector (11 downto 0);
    signal InPort_WrBack_InPort_Mult1_shift2_q : std_logic_vector (11 downto 0);
    signal Control_MasterLoops_Not_a : std_logic_vector(0 downto 0);
    signal Control_MasterLoops_Not_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Not3_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Not3_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_Not_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_Not_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_SRlatch_Not_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_SRlatch_Not_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_BitExtract1_0_in : std_logic_vector (6 downto 0);
    signal Control_CmdFifo_BitExtract1_0_b : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_BitExtract1_1_in : std_logic_vector (6 downto 0);
    signal Control_CmdFifo_BitExtract1_1_b : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_BitExtract1_2_in : std_logic_vector (6 downto 0);
    signal Control_CmdFifo_BitExtract1_2_b : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_BitExtract1_3_in : std_logic_vector (6 downto 0);
    signal Control_CmdFifo_BitExtract1_3_b : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_BitExtract1_4_in : std_logic_vector (6 downto 0);
    signal Control_CmdFifo_BitExtract1_4_b : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_BitExtract1_5_in : std_logic_vector (6 downto 0);
    signal Control_CmdFifo_BitExtract1_5_b : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_BitExtract1_6_in : std_logic_vector (6 downto 0);
    signal Control_CmdFifo_BitExtract1_6_b : std_logic_vector (0 downto 0);
    signal Control_CmdFifo_And3_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And3_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And3_c : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And3_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Not1_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Not1_q : std_logic_vector(0 downto 0);
    signal Control_MasterLoops_ForChan_FLA_el : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForChan_FLA_ll : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForChan_FLA_bd : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForChan_FLA_la : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForChan_FLA_ld : std_logic_vector (0 downto 0);
    signal Control_Commands_CmpEQ_a : std_logic_vector(7 downto 0);
    signal Control_Commands_CmpEQ_b : std_logic_vector(7 downto 0);
    signal Control_Commands_CmpEQ_q : std_logic_vector(0 downto 0);
    signal Control_Commands_CmpEQ2_a : std_logic_vector(7 downto 0);
    signal Control_Commands_CmpEQ2_b : std_logic_vector(7 downto 0);
    signal Control_Commands_CmpEQ2_q : std_logic_vector(0 downto 0);
    signal Control_Commands_CmpNE_a : std_logic_vector(7 downto 0);
    signal Control_Commands_CmpNE_b : std_logic_vector(7 downto 0);
    signal Control_Commands_CmpNE_q : std_logic_vector(0 downto 0);
    signal Control_MasterLoops_ForMatMem_FLA_el : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForMatMem_FLA_ll : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForMatMem_FLA_bd : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForMatMem_FLA_la : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForMatMem_FLA_ld : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForRow_FLA_el : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForRow_FLA_ll : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForRow_FLA_bd : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForRow_FLA_la : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForRow_FLA_ld : std_logic_vector (0 downto 0);
    signal Control_Commands_CmpEQ1_a : std_logic_vector(7 downto 0);
    signal Control_Commands_CmpEQ1_b : std_logic_vector(7 downto 0);
    signal Control_Commands_CmpEQ1_q : std_logic_vector(0 downto 0);
    signal Control_MasterLoops_For_yMem_FLA_el : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_For_yMem_FLA_ll : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_For_yMem_FLA_bd : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_For_yMem_FLA_la : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_For_yMem_FLA_ld : std_logic_vector (0 downto 0);
    signal DataPath_Not1_a : std_logic_vector(0 downto 0);
    signal DataPath_Not1_q : std_logic_vector(0 downto 0);
    signal SyncFifo_BitExtract1_0_in : std_logic_vector (4 downto 0);
    signal SyncFifo_BitExtract1_0_b : std_logic_vector (0 downto 0);
    signal SyncFifo_BitExtract1_1_in : std_logic_vector (4 downto 0);
    signal SyncFifo_BitExtract1_1_b : std_logic_vector (0 downto 0);
    signal SyncFifo_BitExtract1_2_in : std_logic_vector (4 downto 0);
    signal SyncFifo_BitExtract1_2_b : std_logic_vector (0 downto 0);
    signal SyncFifo_BitExtract1_3_in : std_logic_vector (4 downto 0);
    signal SyncFifo_BitExtract1_3_b : std_logic_vector (0 downto 0);
    signal SyncFifo_BitExtract1_4_in : std_logic_vector (4 downto 0);
    signal SyncFifo_BitExtract1_4_b : std_logic_vector (0 downto 0);
    signal SyncFifo_Not1_a : std_logic_vector(0 downto 0);
    signal SyncFifo_Not1_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_SRlatch_Or_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_SRlatch_Or_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_SRlatch_Or_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_SRlatch_Not_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_SRlatch_Not_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_SRlatch_Or_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_SRlatch_Or_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_SRlatch_Or_q : std_logic_vector(0 downto 0);
    signal SyncFifo_And_a : std_logic_vector(0 downto 0);
    signal SyncFifo_And_b : std_logic_vector(0 downto 0);
    signal SyncFifo_And_q : std_logic_vector(0 downto 0);
    signal SyncFifo_And4_a : std_logic_vector(0 downto 0);
    signal SyncFifo_And4_b : std_logic_vector(0 downto 0);
    signal SyncFifo_And4_q : std_logic_vector(0 downto 0);
    signal Control_Commands_Mux_sel_inv_a : std_logic_vector(0 downto 0);
    signal Control_Commands_Mux_sel_inv_q : std_logic_vector(0 downto 0);
    signal InPort_WrBack_InPort_Mux_sel_inv_a : std_logic_vector(0 downto 0);
    signal InPort_WrBack_InPort_Mux_sel_inv_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And4_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And4_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And4_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And5_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And5_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And5_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Done_Not2_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Done_Not2_q : std_logic_vector(0 downto 0);
    signal AutoMinDelay_cmp_a : std_logic_vector(5 downto 0);
    signal AutoMinDelay_cmp_b : std_logic_vector(5 downto 0);
    signal AutoMinDelay_cmp_q : std_logic_vector(0 downto 0);
    signal AutoMinDelay_nor_a : std_logic_vector(0 downto 0);
    signal AutoMinDelay_nor_b : std_logic_vector(0 downto 0);
    signal AutoMinDelay_nor_q : std_logic_vector(0 downto 0);
    signal DataPath_AutoMinDelay1_im_im_cmp_a : std_logic_vector(3 downto 0);
    signal DataPath_AutoMinDelay1_im_im_cmp_b : std_logic_vector(3 downto 0);
    signal DataPath_AutoMinDelay1_im_im_cmp_q : std_logic_vector(0 downto 0);
    signal DataPath_AutoMinDelay1_im_im_nor_a : std_logic_vector(0 downto 0);
    signal DataPath_AutoMinDelay1_im_im_nor_b : std_logic_vector(0 downto 0);
    signal DataPath_AutoMinDelay1_im_im_nor_q : std_logic_vector(0 downto 0);
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_cmp_a : std_logic_vector(5 downto 0);
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_cmp_b : std_logic_vector(5 downto 0);
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_cmp_q : std_logic_vector(0 downto 0);
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_nor_a : std_logic_vector(0 downto 0);
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_nor_b : std_logic_vector(0 downto 0);
    signal ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_nor_q : std_logic_vector(0 downto 0);
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_cmp_a : std_logic_vector(5 downto 0);
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_cmp_b : std_logic_vector(5 downto 0);
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_cmp_q : std_logic_vector(0 downto 0);
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_nor_a : std_logic_vector(0 downto 0);
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_nor_b : std_logic_vector(0 downto 0);
    signal ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_nor_q : std_logic_vector(0 downto 0);
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_cmp_a : std_logic_vector(2 downto 0);
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_cmp_b : std_logic_vector(2 downto 0);
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_cmp_q : std_logic_vector(0 downto 0);
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_nor_a : std_logic_vector(0 downto 0);
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_nor_b : std_logic_vector(0 downto 0);
    signal ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_nor_q : std_logic_vector(0 downto 0);
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_cmp_a : std_logic_vector(4 downto 0);
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_cmp_b : std_logic_vector(4 downto 0);
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_cmp_q : std_logic_vector(0 downto 0);
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_nor_q : std_logic_vector(0 downto 0);
    signal ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_nor_a : std_logic_vector(0 downto 0);
    signal ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_nor_b : std_logic_vector(0 downto 0);
    signal ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_nor_q : std_logic_vector(0 downto 0);
    signal Control_MasterLoops_Convert_sel_in : std_logic_vector (7 downto 0);
    signal Control_MasterLoops_Convert_sel_b : std_logic_vector (7 downto 0);
    signal InPort_WrBack_InPort_Mult1_add_3_a : std_logic_vector(12 downto 0);
    signal InPort_WrBack_InPort_Mult1_add_3_b : std_logic_vector(12 downto 0);
    signal InPort_WrBack_InPort_Mult1_add_3_o : std_logic_vector (12 downto 0);
    signal InPort_WrBack_InPort_Mult1_add_3_q : std_logic_vector (12 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_SRlatch_And_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_SRlatch_And_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_SRlatch_And_q : std_logic_vector(0 downto 0);
    signal Control_Commands_And1_a : std_logic_vector(0 downto 0);
    signal Control_Commands_And1_b : std_logic_vector(0 downto 0);
    signal Control_Commands_And1_q : std_logic_vector(0 downto 0);
    signal Control_Commands_Not_a : std_logic_vector(0 downto 0);
    signal Control_Commands_Not_q : std_logic_vector(0 downto 0);
    signal Control_Commands_And4_a : std_logic_vector(0 downto 0);
    signal Control_Commands_And4_b : std_logic_vector(0 downto 0);
    signal Control_Commands_And4_q : std_logic_vector(0 downto 0);
    signal Control_Commands_And5_a : std_logic_vector(0 downto 0);
    signal Control_Commands_And5_b : std_logic_vector(0 downto 0);
    signal Control_Commands_And5_q : std_logic_vector(0 downto 0);
    signal Control_MasterLoops_ForColumn_FLA_el : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForColumn_FLA_ll : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForColumn_FLA_bd : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForColumn_FLA_la : std_logic_vector (0 downto 0);
    signal Control_MasterLoops_ForColumn_FLA_ld : std_logic_vector (0 downto 0);
    signal Control_Commands_And3_a : std_logic_vector(0 downto 0);
    signal Control_Commands_And3_b : std_logic_vector(0 downto 0);
    signal Control_Commands_And3_q : std_logic_vector(0 downto 0);
    signal SyncFifo_And2_a : std_logic_vector(0 downto 0);
    signal SyncFifo_And2_b : std_logic_vector(0 downto 0);
    signal SyncFifo_And2_q : std_logic_vector(0 downto 0);
    signal SyncFifo_Not3_a : std_logic_vector(0 downto 0);
    signal SyncFifo_Not3_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_SRlatch_And_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_SRlatch_And_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_SRlatch_And_q : std_logic_vector(0 downto 0);
    signal Or_rsrvd_fix_a : std_logic_vector(0 downto 0);
    signal Or_rsrvd_fix_b : std_logic_vector(0 downto 0);
    signal Or_rsrvd_fix_c : std_logic_vector(0 downto 0);
    signal Or_rsrvd_fix_d : std_logic_vector(0 downto 0);
    signal Or_rsrvd_fix_e : std_logic_vector(0 downto 0);
    signal Or_rsrvd_fix_f : std_logic_vector(0 downto 0);
    signal Or_rsrvd_fix_q : std_logic_vector(0 downto 0);
    signal DataPath_Mux_re_s : std_logic_vector (0 downto 0);
    signal DataPath_Mux_re_q : std_logic_vector (31 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_SRlatch1_Or_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_SRlatch1_Or_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_SRlatch1_Or_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Done_And6_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Done_And6_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Done_And6_q : std_logic_vector(0 downto 0);
    signal InPort_WrBack_InPort_And_a : std_logic_vector(0 downto 0);
    signal InPort_WrBack_InPort_And_b : std_logic_vector(0 downto 0);
    signal InPort_WrBack_InPort_And_q : std_logic_vector(0 downto 0);
    signal InPort_WrBack_InPort_Mult1_shift4_q_int : std_logic_vector (15 downto 0);
    signal InPort_WrBack_InPort_Mult1_shift4_q : std_logic_vector (15 downto 0);
    signal Control_Commands_And2_a : std_logic_vector(0 downto 0);
    signal Control_Commands_And2_b : std_logic_vector(0 downto 0);
    signal Control_Commands_And2_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_BitCombine1_q : std_logic_vector (6 downto 0);
    signal SyncFifo_And3_a : std_logic_vector(0 downto 0);
    signal SyncFifo_And3_b : std_logic_vector(0 downto 0);
    signal SyncFifo_And3_c : std_logic_vector(0 downto 0);
    signal SyncFifo_And3_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Not_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Not_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_SRlatch1_And_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_SRlatch1_And_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_SRlatch1_And_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Done_And14_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Done_And14_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Done_And14_q : std_logic_vector(0 downto 0);
    signal InPort_WrBack_Input_WrBk_Mux_Mux1_s : std_logic_vector (0 downto 0);
    signal InPort_WrBack_Input_WrBk_Mux_Mux1_q : std_logic_vector (0 downto 0);
    signal SyncFifo_Or_a : std_logic_vector(0 downto 0);
    signal SyncFifo_Or_b : std_logic_vector(0 downto 0);
    signal SyncFifo_Or_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And1_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And1_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And1_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_And1_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_And1_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_And1_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Done_SRlatch1_Not_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Done_SRlatch1_Not_q : std_logic_vector(0 downto 0);
    signal SyncFifo_And1_a : std_logic_vector(0 downto 0);
    signal SyncFifo_And1_b : std_logic_vector(0 downto 0);
    signal SyncFifo_And1_q : std_logic_vector(0 downto 0);
    signal SyncFifo_And5_a : std_logic_vector(0 downto 0);
    signal SyncFifo_And5_b : std_logic_vector(0 downto 0);
    signal SyncFifo_And5_q : std_logic_vector(0 downto 0);
    signal SyncFifo_And6_a : std_logic_vector(0 downto 0);
    signal SyncFifo_And6_b : std_logic_vector(0 downto 0);
    signal SyncFifo_And6_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_And2_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_And2_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Pulses2_And2_q : std_logic_vector(0 downto 0);
    signal DataPath_And_a : std_logic_vector(0 downto 0);
    signal DataPath_And_b : std_logic_vector(0 downto 0);
    signal DataPath_And_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And2_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And2_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And2_c : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And2_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Or_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Or_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Or_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And10_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And10_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And10_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And11_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And11_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And11_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And12_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And12_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And12_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And7_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And7_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And7_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And8_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And8_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And8_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And9_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And9_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_And9_q : std_logic_vector(0 downto 0);
    signal SyncFifo_BitCombine1_q : std_logic_vector (4 downto 0);
    signal Control_CmdFifo_Detect_Done_Not4_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Done_Not4_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Done_And13_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Done_And13_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Done_And13_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Done_SRlatch1_Or_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Done_SRlatch1_Or_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Done_SRlatch1_Or_q : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Done_SRlatch1_And_a : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Done_SRlatch1_And_b : std_logic_vector(0 downto 0);
    signal Control_CmdFifo_Detect_Done_SRlatch1_And_q : std_logic_vector(0 downto 0);
begin


	--AutoMinDelay_notEnable(LOGICAL,645)
    AutoMinDelay_notEnable_a <= VCC_q;
    AutoMinDelay_notEnable_q <= not AutoMinDelay_notEnable_a;

	--ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_nor(LOGICAL,700)
    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_nor_a <= AutoMinDelay_notEnable_q;
    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_nor_b <= ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_sticky_ena_q;
    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_nor_q <= not (ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_nor_a or ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_nor_b);

	--ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_mem_top(CONSTANT,696)
    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_mem_top_q <= "011010";

	--ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_cmp(LOGICAL,697)
    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_cmp_a <= ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_mem_top_q;
    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_cmp_b <= STD_LOGIC_VECTOR("0" & ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_rdcnt_q);
    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_cmp_q <= "1" when ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_cmp_a = ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_cmp_b else "0";

	--ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_cmpReg(REG,698)
    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_cmpReg_q <= ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_cmp_q;
        END IF;
    END PROCESS;


	--ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_sticky_ena(REG,701)
    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_nor_q = "1") THEN
                ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_sticky_ena_q <= ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_enaAnd(LOGICAL,702)
    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_enaAnd_a <= ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_sticky_ena_q;
    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_enaAnd_b <= VCC_q;
    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_enaAnd_q <= ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_enaAnd_a and ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_enaAnd_b;

	--Control_CmdFifo_Detect_Pulses2_SampleDelay2(DELAY,55)@5
    Control_CmdFifo_Detect_Pulses2_SampleDelay2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => Control_CmdFifo_Detect_Pulses2_And2_q, xout => Control_CmdFifo_Detect_Pulses2_SampleDelay2_q, clk => clk, aclr => areset );

	--Control_CmdFifo_Detect_Pulses2_SRlatch_Not(LOGICAL,47)@6
    Control_CmdFifo_Detect_Pulses2_SRlatch_Not_a <= Control_CmdFifo_Detect_Pulses2_SampleDelay2_q;
    Control_CmdFifo_Detect_Pulses2_SRlatch_Not_q <= not Control_CmdFifo_Detect_Pulses2_SRlatch_Not_a;

	--Control_CmdFifo_Detect_Done_SampleDelay2(DELAY,40)@6
    Control_CmdFifo_Detect_Done_SampleDelay2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => AutoMinDelay_replace_mem_q, xout => Control_CmdFifo_Detect_Done_SampleDelay2_q, clk => clk, aclr => areset );

	--Control_CmdFifo_Not3(LOGICAL,65)@6
    Control_CmdFifo_Not3_a <= Control_CmdFifo_Detect_Done_SampleDelay2_q;
    Control_CmdFifo_Not3_q <= not Control_CmdFifo_Not3_a;

	--Control_CmdFifo_And4(LOGICAL,18)@6
    Control_CmdFifo_And4_a <= Control_CmdFifo_Not3_q;
    Control_CmdFifo_And4_b <= AutoMinDelay_replace_mem_q;
    Control_CmdFifo_And4_q <= Control_CmdFifo_And4_a and Control_CmdFifo_And4_b;

	--ld_Control_CmdFifo_Detect_Pulses2_SRlatch1_SampleDelay1_q_to_Control_CmdFifo_Detect_Pulses2_SRlatch1_Or_a(DELAY,368)@5
    ld_Control_CmdFifo_Detect_Pulses2_SRlatch1_SampleDelay1_q_to_Control_CmdFifo_Detect_Pulses2_SRlatch1_Or_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => Control_CmdFifo_Detect_Pulses2_SRlatch1_And_q, xout => ld_Control_CmdFifo_Detect_Pulses2_SRlatch1_SampleDelay1_q_to_Control_CmdFifo_Detect_Pulses2_SRlatch1_Or_a_q, clk => clk, aclr => areset );

	--Control_CmdFifo_Detect_Pulses2_SRlatch1_Or(LOGICAL,52)@6
    Control_CmdFifo_Detect_Pulses2_SRlatch1_Or_a <= ld_Control_CmdFifo_Detect_Pulses2_SRlatch1_SampleDelay1_q_to_Control_CmdFifo_Detect_Pulses2_SRlatch1_Or_a_q;
    Control_CmdFifo_Detect_Pulses2_SRlatch1_Or_b <= Control_CmdFifo_And4_q;
    Control_CmdFifo_Detect_Pulses2_SRlatch1_Or_q <= Control_CmdFifo_Detect_Pulses2_SRlatch1_Or_a or Control_CmdFifo_Detect_Pulses2_SRlatch1_Or_b;

	--Control_CmdFifo_Detect_Pulses2_SRlatch1_And(LOGICAL,50)@6
    Control_CmdFifo_Detect_Pulses2_SRlatch1_And_a <= Control_CmdFifo_Detect_Pulses2_SRlatch1_Or_q;
    Control_CmdFifo_Detect_Pulses2_SRlatch1_And_b <= Control_CmdFifo_Detect_Pulses2_SRlatch_Not_q;
    Control_CmdFifo_Detect_Pulses2_SRlatch1_And_q <= Control_CmdFifo_Detect_Pulses2_SRlatch1_And_a and Control_CmdFifo_Detect_Pulses2_SRlatch1_And_b;

	--Control_MasterLoops_ForChan_FLA(FLA,105)@5
    Control_MasterLoops_ForChan_FLA_el <= Control_MasterLoops_ForChan_FLB_el;
    Control_MasterLoops_ForChan_FLA_ll <= Control_MasterLoops_ForChan_FLB_ll;
    Control_MasterLoops_ForChan_FLA_bd <= Control_MasterLoops_ForChan_FLB_bs;
    Control_MasterLoops_ForChan_FLA_la <= (not Control_MasterLoops_ForChan_FLA_el) and Control_MasterLoops_ForChan_FLA_bd;
    Control_MasterLoops_ForChan_FLA_ld <= Control_MasterLoops_ForChan_FLA_el or (Control_MasterLoops_ForChan_FLA_bd and Control_MasterLoops_ForChan_FLA_ll);

	--Control_AutoMinDelay(DELAY,11)@5
    Control_AutoMinDelay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => Control_CmdFifo_FIFO2_f, xout => Control_AutoMinDelay_q, clk => clk, aclr => areset );

	--Control_MasterLoops_Not(LOGICAL,115)@5
    Control_MasterLoops_Not_a <= Control_AutoMinDelay_q;
    Control_MasterLoops_Not_q <= not Control_MasterLoops_Not_a;

	--Control_MasterLoops_Const1(CONSTANT,92)
    Control_MasterLoops_Const1_q <= "0000000";

	--Control_MasterLoops_Const6(CONSTANT,100)
    Control_MasterLoops_Const6_q <= "1111111";

	--Control_MasterLoops_ForRow_FLA(FLA,111)@5
    Control_MasterLoops_ForRow_FLA_el <= Control_MasterLoops_ForRow_FLB_el;
    Control_MasterLoops_ForRow_FLA_ll <= Control_MasterLoops_ForRow_FLB_ll;
    Control_MasterLoops_ForRow_FLA_bd <= Control_MasterLoops_ForChan_FLA_ld;
    Control_MasterLoops_ForRow_FLA_la <= (not Control_MasterLoops_ForRow_FLA_el) and Control_MasterLoops_ForRow_FLA_bd;
    Control_MasterLoops_ForRow_FLA_ld <= Control_MasterLoops_ForRow_FLA_el or (Control_MasterLoops_ForRow_FLA_bd and Control_MasterLoops_ForRow_FLA_ll);

	--Control_MasterLoops_ForRow_FLB(FLB,112)@5
    Control_MasterLoops_ForRow_FLB_ls <= Control_MasterLoops_ForColumn_FLB_bs;
    Control_MasterLoops_ForRow_FLB_la <= Control_MasterLoops_ForRow_FLA_la;
    Control_MasterLoops_ForRow_FLB_en <= Control_MasterLoops_Not_q;
    Control_MasterLoops_ForRow_FLB_init <= STD_LOGIC_VECTOR((8 downto 8 => Control_MasterLoops_ForColumn_FLB_c(7)) & Control_MasterLoops_ForColumn_FLB_c);
    Control_MasterLoops_ForRow_FLB_step <= STD_LOGIC_VECTOR((8 downto 7 => Control_MasterLoops_Const6_q(6)) & Control_MasterLoops_Const6_q);
    Control_MasterLoops_ForRow_FLB_limit <= STD_LOGIC_VECTOR((8 downto 7 => Control_MasterLoops_Const1_q(6)) & Control_MasterLoops_Const1_q);

    Control_MasterLoops_ForRow_FLB_count <=
        Control_MasterLoops_ForRow_FLB_init when Control_MasterLoops_ForRow_FLB_ls(0) = '1' else
        Control_MasterLoops_ForRow_FLB_prevnextcount when Control_MasterLoops_ForRow_FLB_la(0) = '1' else
        Control_MasterLoops_ForRow_FLB_prevcount;

    Control_MasterLoops_ForRow_FLB_nextcount <= STD_LOGIC_VECTOR(SIGNED(Control_MasterLoops_ForRow_FLB_count) + SIGNED(Control_MasterLoops_ForRow_FLB_step));
    Control_MasterLoops_ForRow_FLB_firstloop <=
        Control_MasterLoops_ForRow_FLB_firstpass when Control_MasterLoops_ForRow_FLB_ls(0) = '1' else
        '0' when Control_MasterLoops_ForRow_FLB_la(0) = '1' else
        Control_MasterLoops_ForRow_FLB_fl(0);

    Control_MasterLoops_ForRow_FLB_pass <=
        Control_MasterLoops_ForRow_FLB_firstpass when Control_MasterLoops_ForRow_FLB_ls(0) = '1' else
        Control_MasterLoops_ForRow_FLB_prevnextpass when Control_MasterLoops_ForRow_FLB_la(0) = '1' else
        Control_MasterLoops_ForRow_FLB_prevpass;

    Control_MasterLoops_ForRow_FLB_firstpass <= '1' when SIGNED(Control_MasterLoops_ForRow_FLB_init) >= SIGNED(Control_MasterLoops_ForRow_FLB_limit) else '0';
    Control_MasterLoops_ForRow_FLB_nextpass <=
        Control_MasterLoops_ForRow_FLB_firstnextpass when Control_MasterLoops_ForRow_FLB_ls(0) = '1' else
        Control_MasterLoops_ForRow_FLB_nextnextpass when Control_MasterLoops_ForRow_FLB_la(0) = '1' else
        Control_MasterLoops_ForRow_FLB_prevnextpass;

    Control_MasterLoops_ForRow_FLB_nextnextpass <= '1' when SIGNED(Control_MasterLoops_ForRow_FLB_prevnextcount) >= SIGNED(Control_MasterLoops_ForRow_FLB_limit2) else '0';
    Control_MasterLoops_ForRow_FLB_firstnextpass <= '1' when SIGNED(Control_MasterLoops_ForRow_FLB_init) >= SIGNED(Control_MasterLoops_ForRow_FLB_limit2) else '0';
    Control_MasterLoops_ForRow_FLB_limit2 <= STD_LOGIC_VECTOR(SIGNED(Control_MasterLoops_ForRow_FLB_limit) - SIGNED(Control_MasterLoops_ForRow_FLB_step));

    Control_MasterLoops_ForRow_FLB: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Control_MasterLoops_ForRow_FLB_prevcount <= (others => '0');
            Control_MasterLoops_ForRow_FLB_prevnextcount <= (others => '0');
            Control_MasterLoops_ForRow_FLB_prevpass <= '0';
            Control_MasterLoops_ForRow_FLB_prevnextpass <= '0';
            Control_MasterLoops_ForRow_FLB_el <= (others => '0');
            Control_MasterLoops_ForRow_FLB_fl <= (others => '0');
            Control_MasterLoops_ForRow_FLB_ll <= (others => '0');
            Control_MasterLoops_ForRow_FLB_bs <= (others => '0');
            Control_MasterLoops_ForRow_FLB_v <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (Control_MasterLoops_ForRow_FLB_en = "1") THEN
                Control_MasterLoops_ForRow_FLB_prevcount <= Control_MasterLoops_ForRow_FLB_count;
                Control_MasterLoops_ForRow_FLB_prevnextcount <= Control_MasterLoops_ForRow_FLB_nextcount;
                Control_MasterLoops_ForRow_FLB_prevpass <= Control_MasterLoops_ForRow_FLB_pass;
                Control_MasterLoops_ForRow_FLB_prevnextpass <= Control_MasterLoops_ForRow_FLB_nextpass;
                Control_MasterLoops_ForRow_FLB_el(0) <= Control_MasterLoops_ForRow_FLB_ls(0) and (not Control_MasterLoops_ForRow_FLB_firstpass);
                Control_MasterLoops_ForRow_FLB_fl(0) <= Control_MasterLoops_ForRow_FLB_firstloop;
                Control_MasterLoops_ForRow_FLB_ll(0) <= Control_MasterLoops_ForRow_FLB_pass and (not Control_MasterLoops_ForRow_FLB_nextpass);
                Control_MasterLoops_ForRow_FLB_bs(0) <= (Control_MasterLoops_ForRow_FLB_ls(0) or Control_MasterLoops_ForRow_FLB_la(0)) and Control_MasterLoops_ForRow_FLB_pass;
            END IF;
            Control_MasterLoops_ForRow_FLB_v(0) <= Control_MasterLoops_ForRow_FLB_en(0) and Control_MasterLoops_ForRow_FLB_pass;
        END IF;
    END PROCESS;

    Control_MasterLoops_ForRow_FLB_c <= Control_MasterLoops_ForRow_FLB_prevcount(7 downto 0);

	--Control_Commands_CmpEQ(LOGICAL,81)@5
    Control_Commands_CmpEQ_a <= Control_MasterLoops_ForColumn_FLB_c;
    Control_Commands_CmpEQ_b <= Control_MasterLoops_ForRow_FLB_c;
    Control_Commands_CmpEQ_q <= "1" when Control_Commands_CmpEQ_a = Control_Commands_CmpEQ_b else "0";

	--Control_Commands_And1(LOGICAL,75)@5
    Control_Commands_And1_a <= Control_Commands_CmpEQ_q;
    Control_Commands_And1_b <= Control_MasterLoops_ForChan_FLB_v;
    Control_Commands_And1_q <= Control_Commands_And1_a and Control_Commands_And1_b;

	--Control_MasterLoops_Const2(CONSTANT,96)
    Control_MasterLoops_Const2_q <= "00000000";

	--Control_MasterLoops_Const3(CONSTANT,97)
    Control_MasterLoops_Const3_q <= "11111111";

	--ChannelIn(PORTIN,8)@2

	--ld_ChannelIn_MatSizeRT_mn1_s_to_Control_MasterLoops_latch_0L1_Mux_d(DELAY,455)@2
    ld_ChannelIn_MatSizeRT_mn1_s_to_Control_MasterLoops_latch_0L1_Mux_d : dspba_delay
    GENERIC MAP ( width => 7, depth => 3 )
    PORT MAP ( xin => MatSizeRT_mn1_s, xout => ld_ChannelIn_MatSizeRT_mn1_s_to_Control_MasterLoops_latch_0L1_Mux_d_q, clk => clk, aclr => areset );

	--Control_MasterLoops_latch_0L1_SampleDelay(DELAY,117)@5
    Control_MasterLoops_latch_0L1_SampleDelay : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => Control_MasterLoops_latch_0L1_Mux_q, xout => Control_MasterLoops_latch_0L1_SampleDelay_q, clk => clk, aclr => areset );

	--Control_MasterLoops_latch_0L1_Mux(MUX,116)@5
    Control_MasterLoops_latch_0L1_Mux_s <= ld_ChannelIn_FwDone_s_to_Control_MasterLoops_ForColumn_FLB_ls_q;
    Control_MasterLoops_latch_0L1_Mux: PROCESS (Control_MasterLoops_latch_0L1_Mux_s, Control_MasterLoops_latch_0L1_SampleDelay_q, ld_ChannelIn_MatSizeRT_mn1_s_to_Control_MasterLoops_latch_0L1_Mux_d_q)
    BEGIN
            CASE Control_MasterLoops_latch_0L1_Mux_s IS
                  WHEN "0" => Control_MasterLoops_latch_0L1_Mux_q <= Control_MasterLoops_latch_0L1_SampleDelay_q;
                  WHEN "1" => Control_MasterLoops_latch_0L1_Mux_q <= ld_ChannelIn_MatSizeRT_mn1_s_to_Control_MasterLoops_latch_0L1_Mux_d_q;
                  WHEN OTHERS => Control_MasterLoops_latch_0L1_Mux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--Control_MasterLoops_Convert_rnd(ROUND,255)@5
    Control_MasterLoops_Convert_rnd_in <= Control_MasterLoops_latch_0L1_Mux_q;
    Control_MasterLoops_Convert_rnd_q <= Control_MasterLoops_Convert_rnd_in(6 downto 0);

	--Control_MasterLoops_Convert_sel(BITSELECT,256)@5
    Control_MasterLoops_Convert_sel_in <= STD_LOGIC_VECTOR("0" & Control_MasterLoops_Convert_rnd_q);
    Control_MasterLoops_Convert_sel_b <= Control_MasterLoops_Convert_sel_in(7 downto 0);

	--Control_MasterLoops_ForColumn_FLA(FLA,107)@5
    Control_MasterLoops_ForColumn_FLA_el <= Control_MasterLoops_ForColumn_FLB_el;
    Control_MasterLoops_ForColumn_FLA_ll <= Control_MasterLoops_ForColumn_FLB_ll;
    Control_MasterLoops_ForColumn_FLA_bd <= Control_MasterLoops_ForRow_FLA_ld;
    Control_MasterLoops_ForColumn_FLA_la <= (not Control_MasterLoops_ForColumn_FLA_el) and Control_MasterLoops_ForColumn_FLA_bd;
    Control_MasterLoops_ForColumn_FLA_ld <= Control_MasterLoops_ForColumn_FLA_el or (Control_MasterLoops_ForColumn_FLA_bd and Control_MasterLoops_ForColumn_FLA_ll);

	--ld_ChannelIn_FwDone_s_to_Control_MasterLoops_ForColumn_FLB_ls(DELAY,431)@2
    ld_ChannelIn_FwDone_s_to_Control_MasterLoops_ForColumn_FLB_ls : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => FwDone_s, xout => ld_ChannelIn_FwDone_s_to_Control_MasterLoops_ForColumn_FLB_ls_q, clk => clk, aclr => areset );

	--Control_MasterLoops_ForColumn_FLB(FLB,108)@5
    Control_MasterLoops_ForColumn_FLB_ls <= ld_ChannelIn_FwDone_s_to_Control_MasterLoops_ForColumn_FLB_ls_q;
    Control_MasterLoops_ForColumn_FLB_la <= Control_MasterLoops_ForColumn_FLA_la;
    Control_MasterLoops_ForColumn_FLB_en <= Control_MasterLoops_Not_q;
    Control_MasterLoops_ForColumn_FLB_init <= STD_LOGIC_VECTOR((8 downto 8 => Control_MasterLoops_Convert_sel_b(7)) & Control_MasterLoops_Convert_sel_b);
    Control_MasterLoops_ForColumn_FLB_step <= STD_LOGIC_VECTOR((8 downto 8 => Control_MasterLoops_Const3_q(7)) & Control_MasterLoops_Const3_q);
    Control_MasterLoops_ForColumn_FLB_limit <= STD_LOGIC_VECTOR((8 downto 8 => Control_MasterLoops_Const2_q(7)) & Control_MasterLoops_Const2_q);

    Control_MasterLoops_ForColumn_FLB_count <=
        Control_MasterLoops_ForColumn_FLB_init when Control_MasterLoops_ForColumn_FLB_ls(0) = '1' else
        Control_MasterLoops_ForColumn_FLB_prevnextcount when Control_MasterLoops_ForColumn_FLB_la(0) = '1' else
        Control_MasterLoops_ForColumn_FLB_prevcount;

    Control_MasterLoops_ForColumn_FLB_nextcount <= STD_LOGIC_VECTOR(SIGNED(Control_MasterLoops_ForColumn_FLB_count) + SIGNED(Control_MasterLoops_ForColumn_FLB_step));
    Control_MasterLoops_ForColumn_FLB_firstloop <=
        Control_MasterLoops_ForColumn_FLB_firstpass when Control_MasterLoops_ForColumn_FLB_ls(0) = '1' else
        '0' when Control_MasterLoops_ForColumn_FLB_la(0) = '1' else
        Control_MasterLoops_ForColumn_FLB_fl(0);

    Control_MasterLoops_ForColumn_FLB_pass <=
        Control_MasterLoops_ForColumn_FLB_firstpass when Control_MasterLoops_ForColumn_FLB_ls(0) = '1' else
        Control_MasterLoops_ForColumn_FLB_prevnextpass when Control_MasterLoops_ForColumn_FLB_la(0) = '1' else
        Control_MasterLoops_ForColumn_FLB_prevpass;

    Control_MasterLoops_ForColumn_FLB_firstpass <= '1' when SIGNED(Control_MasterLoops_ForColumn_FLB_init) >= SIGNED(Control_MasterLoops_ForColumn_FLB_limit) else '0';
    Control_MasterLoops_ForColumn_FLB_nextpass <=
        Control_MasterLoops_ForColumn_FLB_firstnextpass when Control_MasterLoops_ForColumn_FLB_ls(0) = '1' else
        Control_MasterLoops_ForColumn_FLB_nextnextpass when Control_MasterLoops_ForColumn_FLB_la(0) = '1' else
        Control_MasterLoops_ForColumn_FLB_prevnextpass;

    Control_MasterLoops_ForColumn_FLB_nextnextpass <= '1' when SIGNED(Control_MasterLoops_ForColumn_FLB_prevnextcount) >= SIGNED(Control_MasterLoops_ForColumn_FLB_limit2) else '0';
    Control_MasterLoops_ForColumn_FLB_firstnextpass <= '1' when SIGNED(Control_MasterLoops_ForColumn_FLB_init) >= SIGNED(Control_MasterLoops_ForColumn_FLB_limit2) else '0';
    Control_MasterLoops_ForColumn_FLB_limit2 <= STD_LOGIC_VECTOR(SIGNED(Control_MasterLoops_ForColumn_FLB_limit) - SIGNED(Control_MasterLoops_ForColumn_FLB_step));

    Control_MasterLoops_ForColumn_FLB: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Control_MasterLoops_ForColumn_FLB_prevcount <= (others => '0');
            Control_MasterLoops_ForColumn_FLB_prevnextcount <= (others => '0');
            Control_MasterLoops_ForColumn_FLB_prevpass <= '0';
            Control_MasterLoops_ForColumn_FLB_prevnextpass <= '0';
            Control_MasterLoops_ForColumn_FLB_el <= (others => '0');
            Control_MasterLoops_ForColumn_FLB_fl <= (others => '0');
            Control_MasterLoops_ForColumn_FLB_ll <= (others => '0');
            Control_MasterLoops_ForColumn_FLB_bs <= (others => '0');
            Control_MasterLoops_ForColumn_FLB_v <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (Control_MasterLoops_ForColumn_FLB_en = "1") THEN
                Control_MasterLoops_ForColumn_FLB_prevcount <= Control_MasterLoops_ForColumn_FLB_count;
                Control_MasterLoops_ForColumn_FLB_prevnextcount <= Control_MasterLoops_ForColumn_FLB_nextcount;
                Control_MasterLoops_ForColumn_FLB_prevpass <= Control_MasterLoops_ForColumn_FLB_pass;
                Control_MasterLoops_ForColumn_FLB_prevnextpass <= Control_MasterLoops_ForColumn_FLB_nextpass;
                Control_MasterLoops_ForColumn_FLB_el(0) <= Control_MasterLoops_ForColumn_FLB_ls(0) and (not Control_MasterLoops_ForColumn_FLB_firstpass);
                Control_MasterLoops_ForColumn_FLB_fl(0) <= Control_MasterLoops_ForColumn_FLB_firstloop;
                Control_MasterLoops_ForColumn_FLB_ll(0) <= Control_MasterLoops_ForColumn_FLB_pass and (not Control_MasterLoops_ForColumn_FLB_nextpass);
                Control_MasterLoops_ForColumn_FLB_bs(0) <= (Control_MasterLoops_ForColumn_FLB_ls(0) or Control_MasterLoops_ForColumn_FLB_la(0)) and Control_MasterLoops_ForColumn_FLB_pass;
            END IF;
            Control_MasterLoops_ForColumn_FLB_v(0) <= Control_MasterLoops_ForColumn_FLB_en(0) and Control_MasterLoops_ForColumn_FLB_pass;
        END IF;
    END PROCESS;

    Control_MasterLoops_ForColumn_FLB_c <= Control_MasterLoops_ForColumn_FLB_prevcount(7 downto 0);

	--Control_Commands_CmpNE(LOGICAL,84)@5
    Control_Commands_CmpNE_a <= STD_LOGIC_VECTOR("0" & Control_MasterLoops_latch_0L1_Mux_q);
    Control_Commands_CmpNE_b <= Control_MasterLoops_ForColumn_FLB_c;
    Control_Commands_CmpNE_q <= "1" when Control_Commands_CmpNE_a /= Control_Commands_CmpNE_b else "0";

	--Control_Commands_And5(LOGICAL,79)@5
    Control_Commands_And5_a <= Control_MasterLoops_ForChan_FLB_v;
    Control_Commands_And5_b <= Control_Commands_CmpNE_q;
    Control_Commands_And5_q <= Control_Commands_And5_a and Control_Commands_And5_b;

	--Control_Commands_Not(LOGICAL,88)@5
    Control_Commands_Not_a <= Control_Commands_CmpEQ_q;
    Control_Commands_Not_q <= not Control_Commands_Not_a;

	--Control_Commands_And2(LOGICAL,76)@5
    Control_Commands_And2_a <= Control_Commands_Not_q;
    Control_Commands_And2_b <= Control_MasterLoops_ForChan_FLB_v;
    Control_Commands_And2_q <= Control_Commands_And2_a and Control_Commands_And2_b;

	--Control_Commands_CmpEQ1(LOGICAL,82)@5
    Control_Commands_CmpEQ1_a <= Control_MasterLoops_ForRow_FLB_c;
    Control_Commands_CmpEQ1_b <= STD_LOGIC_VECTOR("0" & Control_MasterLoops_latch_0L1_Mux_q);
    Control_Commands_CmpEQ1_q <= "1" when Control_Commands_CmpEQ1_a = Control_Commands_CmpEQ1_b else "0";

	--Control_Commands_And3(LOGICAL,77)@5
    Control_Commands_And3_a <= Control_MasterLoops_ForChan_FLB_v;
    Control_Commands_And3_b <= Control_Commands_CmpEQ1_q;
    Control_Commands_And3_q <= Control_Commands_And3_a and Control_Commands_And3_b;

	--Control_Commands_CmpEQ2(LOGICAL,83)@5
    Control_Commands_CmpEQ2_a <= STD_LOGIC_VECTOR("0" & Control_MasterLoops_latch_0L1_Mux_q);
    Control_Commands_CmpEQ2_b <= Control_MasterLoops_ForColumn_FLB_c;
    Control_Commands_CmpEQ2_q <= "1" when Control_Commands_CmpEQ2_a = Control_Commands_CmpEQ2_b else "0";

	--Control_Commands_And4(LOGICAL,78)@5
    Control_Commands_And4_a <= Control_MasterLoops_ForChan_FLB_v;
    Control_Commands_And4_b <= Control_Commands_CmpEQ2_q;
    Control_Commands_And4_q <= Control_Commands_And4_a and Control_Commands_And4_b;

	--Control_CmdFifo_BitCombine1(BITJOIN,23)@5
    Control_CmdFifo_BitCombine1_q <= Control_MasterLoops_ForChan_FLA_ld & Control_Commands_And1_q & Control_MasterLoops_ForColumn_FLB_ll & Control_Commands_And5_q & Control_Commands_And2_q & Control_Commands_And3_q & Control_Commands_And4_q;

	--Control_MasterLoops_latch_0L3_SampleDelay(DELAY,121)@2
    Control_MasterLoops_latch_0L3_SampleDelay : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => Control_MasterLoops_latch_0L3_Mux_q, xout => Control_MasterLoops_latch_0L3_SampleDelay_q, clk => clk, aclr => areset );

	--Control_MasterLoops_latch_0L3_Mux(MUX,120)@2
    Control_MasterLoops_latch_0L3_Mux_s <= FwDone_s;
    Control_MasterLoops_latch_0L3_Mux: PROCESS (Control_MasterLoops_latch_0L3_Mux_s, Control_MasterLoops_latch_0L3_SampleDelay_q, NumMatRT_mn1_s)
    BEGIN
            CASE Control_MasterLoops_latch_0L3_Mux_s IS
                  WHEN "0" => Control_MasterLoops_latch_0L3_Mux_q <= Control_MasterLoops_latch_0L3_SampleDelay_q;
                  WHEN "1" => Control_MasterLoops_latch_0L3_Mux_q <= NumMatRT_mn1_s;
                  WHEN OTHERS => Control_MasterLoops_latch_0L3_Mux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_Control_MasterLoops_latch_0L3_Mux_q_to_Control_MasterLoops_ForChan_FLB_limit(DELAY,426)@2
    ld_Control_MasterLoops_latch_0L3_Mux_q_to_Control_MasterLoops_ForChan_FLB_limit : dspba_delay
    GENERIC MAP ( width => 2, depth => 3 )
    PORT MAP ( xin => Control_MasterLoops_latch_0L3_Mux_q, xout => ld_Control_MasterLoops_latch_0L3_Mux_q_to_Control_MasterLoops_ForChan_FLB_limit_q, clk => clk, aclr => areset );

	--Control_MasterLoops_ForChan_FLB(FLB,106)@5
    Control_MasterLoops_ForChan_FLB_ls <= Control_MasterLoops_ForRow_FLB_bs;
    Control_MasterLoops_ForChan_FLB_la <= Control_MasterLoops_ForChan_FLA_la;
    Control_MasterLoops_ForChan_FLB_en <= Control_MasterLoops_Not_q;
    Control_MasterLoops_ForChan_FLB_init <= STD_LOGIC_VECTOR("00" & Control_MasterLoops_Const1_q);
    Control_MasterLoops_ForChan_FLB_step <= STD_LOGIC_VECTOR("00000000" & VCC_q);
    Control_MasterLoops_ForChan_FLB_limit <= STD_LOGIC_VECTOR("0000000" & ld_Control_MasterLoops_latch_0L3_Mux_q_to_Control_MasterLoops_ForChan_FLB_limit_q);

    Control_MasterLoops_ForChan_FLB_count <=
        Control_MasterLoops_ForChan_FLB_init when Control_MasterLoops_ForChan_FLB_ls(0) = '1' else
        Control_MasterLoops_ForChan_FLB_prevnextcount when Control_MasterLoops_ForChan_FLB_la(0) = '1' else
        Control_MasterLoops_ForChan_FLB_prevcount;

    Control_MasterLoops_ForChan_FLB_nextcount <= STD_LOGIC_VECTOR(SIGNED(Control_MasterLoops_ForChan_FLB_count) + SIGNED(Control_MasterLoops_ForChan_FLB_step));
    Control_MasterLoops_ForChan_FLB_firstloop <=
        Control_MasterLoops_ForChan_FLB_firstpass when Control_MasterLoops_ForChan_FLB_ls(0) = '1' else
        '0' when Control_MasterLoops_ForChan_FLB_la(0) = '1' else
        Control_MasterLoops_ForChan_FLB_fl(0);

    Control_MasterLoops_ForChan_FLB_pass <=
        Control_MasterLoops_ForChan_FLB_firstpass when Control_MasterLoops_ForChan_FLB_ls(0) = '1' else
        Control_MasterLoops_ForChan_FLB_prevnextpass when Control_MasterLoops_ForChan_FLB_la(0) = '1' else
        Control_MasterLoops_ForChan_FLB_prevpass;

    Control_MasterLoops_ForChan_FLB_firstpass <= '1' when SIGNED(Control_MasterLoops_ForChan_FLB_init) <= SIGNED(Control_MasterLoops_ForChan_FLB_limit) else '0';
    Control_MasterLoops_ForChan_FLB_nextpass <=
        Control_MasterLoops_ForChan_FLB_firstnextpass when Control_MasterLoops_ForChan_FLB_ls(0) = '1' else
        Control_MasterLoops_ForChan_FLB_nextnextpass when Control_MasterLoops_ForChan_FLB_la(0) = '1' else
        Control_MasterLoops_ForChan_FLB_prevnextpass;

    Control_MasterLoops_ForChan_FLB_nextnextpass <= '1' when SIGNED(Control_MasterLoops_ForChan_FLB_prevnextcount) <= SIGNED(Control_MasterLoops_ForChan_FLB_limit2) else '0';
    Control_MasterLoops_ForChan_FLB_firstnextpass <= '1' when SIGNED(Control_MasterLoops_ForChan_FLB_init) + SIGNED(Control_MasterLoops_ForChan_FLB_step) <= SIGNED(Control_MasterLoops_ForChan_FLB_limit) else '0';

    Control_MasterLoops_ForChan_FLB: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Control_MasterLoops_ForChan_FLB_prevcount <= (others => '0');
            Control_MasterLoops_ForChan_FLB_prevnextcount <= (others => '0');
            Control_MasterLoops_ForChan_FLB_limit2 <= (others => '0');
            Control_MasterLoops_ForChan_FLB_prevpass <= '0';
            Control_MasterLoops_ForChan_FLB_prevnextpass <= '0';
            Control_MasterLoops_ForChan_FLB_el <= (others => '0');
            Control_MasterLoops_ForChan_FLB_fl <= (others => '0');
            Control_MasterLoops_ForChan_FLB_ll <= (others => '0');
            Control_MasterLoops_ForChan_FLB_bs <= (others => '0');
            Control_MasterLoops_ForChan_FLB_v <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (Control_MasterLoops_ForChan_FLB_en = "1") THEN
                Control_MasterLoops_ForChan_FLB_prevcount <= Control_MasterLoops_ForChan_FLB_count;
                Control_MasterLoops_ForChan_FLB_prevnextcount <= Control_MasterLoops_ForChan_FLB_nextcount;
            Control_MasterLoops_ForChan_FLB_limit2 <= STD_LOGIC_VECTOR(SIGNED(Control_MasterLoops_ForChan_FLB_limit) - SIGNED(Control_MasterLoops_ForChan_FLB_step));
                Control_MasterLoops_ForChan_FLB_prevpass <= Control_MasterLoops_ForChan_FLB_pass;
                Control_MasterLoops_ForChan_FLB_prevnextpass <= Control_MasterLoops_ForChan_FLB_nextpass;
                Control_MasterLoops_ForChan_FLB_el(0) <= Control_MasterLoops_ForChan_FLB_ls(0) and (not Control_MasterLoops_ForChan_FLB_firstpass);
                Control_MasterLoops_ForChan_FLB_fl(0) <= Control_MasterLoops_ForChan_FLB_firstloop;
                Control_MasterLoops_ForChan_FLB_ll(0) <= Control_MasterLoops_ForChan_FLB_pass and (not Control_MasterLoops_ForChan_FLB_nextpass);
                Control_MasterLoops_ForChan_FLB_bs(0) <= (Control_MasterLoops_ForChan_FLB_ls(0) or Control_MasterLoops_ForChan_FLB_la(0)) and Control_MasterLoops_ForChan_FLB_pass;
            END IF;
            Control_MasterLoops_ForChan_FLB_v(0) <= Control_MasterLoops_ForChan_FLB_en(0) and Control_MasterLoops_ForChan_FLB_pass;
        END IF;
    END PROCESS;

    Control_MasterLoops_ForChan_FLB_c <= Control_MasterLoops_ForChan_FLB_prevcount(6 downto 0);

	--Control_CmdFifo_FIFO(FIFO,56)@5
    Control_CmdFifo_FIFO_reset <= areset;

    Control_CmdFifo_FIFO_fifo : scfifo
    GENERIC MAP (
      add_ram_output_register => "ON",
      almost_empty_value => 4,
      almost_full_value => 488,
      intended_device_family => "Stratix IV",
      lpm_numwords => 496,
      lpm_showahead => "ON",
      lpm_type => "scfifo",
      lpm_width => 7,
      lpm_widthu => 9,
      overflow_checking => "ON",
      underflow_checking => "ON",
      use_eab => "ON"
    )
    PORT MAP (
      rdreq => Control_CmdFifo_Or_q(0),
      aclr => Control_CmdFifo_FIFO_reset,
      clock => clk,
      wrreq => Control_MasterLoops_ForChan_FLB_v(0),
      data => Control_CmdFifo_BitCombine1_q,
      almost_full => Control_CmdFifo_FIFO_f(0),
      almost_empty => Control_CmdFifo_FIFO_t(0),
      empty => Control_CmdFifo_FIFO_empty(0),
      q => Control_CmdFifo_FIFO_q
    );
    Control_CmdFifo_FIFO_v <= not Control_CmdFifo_FIFO_empty;
    Control_CmdFifo_FIFO_e <= not Control_CmdFifo_FIFO_t;

	--Control_CmdFifo_BitExtract1_6(BITSELECT,30)@5
    Control_CmdFifo_BitExtract1_6_in <= Control_CmdFifo_FIFO_q;
    Control_CmdFifo_BitExtract1_6_b <= Control_CmdFifo_BitExtract1_6_in(6 downto 6);

	--ld_Control_CmdFifo_BitExtract1_6_b_to_Control_CmdFifo_And3_b(DELAY,321)@5
    ld_Control_CmdFifo_BitExtract1_6_b_to_Control_CmdFifo_And3_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => Control_CmdFifo_BitExtract1_6_b, xout => ld_Control_CmdFifo_BitExtract1_6_b_to_Control_CmdFifo_And3_b_q, clk => clk, aclr => areset );

	--Control_CmdFifo_BitExtract1_5(BITSELECT,29)@5
    Control_CmdFifo_BitExtract1_5_in <= Control_CmdFifo_FIFO_q;
    Control_CmdFifo_BitExtract1_5_b <= Control_CmdFifo_BitExtract1_5_in(5 downto 5);

	--ld_Control_CmdFifo_BitExtract1_5_b_to_Control_CmdFifo_And3_a(DELAY,320)@5
    ld_Control_CmdFifo_BitExtract1_5_b_to_Control_CmdFifo_And3_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => Control_CmdFifo_BitExtract1_5_b, xout => ld_Control_CmdFifo_BitExtract1_5_b_to_Control_CmdFifo_And3_a_q, clk => clk, aclr => areset );

	--Control_CmdFifo_And3(LOGICAL,17)@6
    Control_CmdFifo_And3_a <= ld_Control_CmdFifo_BitExtract1_5_b_to_Control_CmdFifo_And3_a_q;
    Control_CmdFifo_And3_b <= ld_Control_CmdFifo_BitExtract1_6_b_to_Control_CmdFifo_And3_b_q;
    Control_CmdFifo_And3_c <= Control_CmdFifo_FIFO1_v;
    Control_CmdFifo_And3_q <= Control_CmdFifo_And3_a and Control_CmdFifo_And3_b and Control_CmdFifo_And3_c;

	--ld_Control_CmdFifo_Detect_Pulses2_SRlatch_SampleDelay1_q_to_Control_CmdFifo_Detect_Pulses2_SRlatch_Or_a(DELAY,364)@5
    ld_Control_CmdFifo_Detect_Pulses2_SRlatch_SampleDelay1_q_to_Control_CmdFifo_Detect_Pulses2_SRlatch_Or_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => Control_CmdFifo_Detect_Pulses2_SRlatch_And_q, xout => ld_Control_CmdFifo_Detect_Pulses2_SRlatch_SampleDelay1_q_to_Control_CmdFifo_Detect_Pulses2_SRlatch_Or_a_q, clk => clk, aclr => areset );

	--Control_CmdFifo_Detect_Pulses2_SRlatch_Or(LOGICAL,48)@6
    Control_CmdFifo_Detect_Pulses2_SRlatch_Or_a <= ld_Control_CmdFifo_Detect_Pulses2_SRlatch_SampleDelay1_q_to_Control_CmdFifo_Detect_Pulses2_SRlatch_Or_a_q;
    Control_CmdFifo_Detect_Pulses2_SRlatch_Or_b <= Control_CmdFifo_And3_q;
    Control_CmdFifo_Detect_Pulses2_SRlatch_Or_q <= Control_CmdFifo_Detect_Pulses2_SRlatch_Or_a or Control_CmdFifo_Detect_Pulses2_SRlatch_Or_b;

	--Control_CmdFifo_Detect_Pulses2_SRlatch_And(LOGICAL,46)@6
    Control_CmdFifo_Detect_Pulses2_SRlatch_And_a <= Control_CmdFifo_Detect_Pulses2_SRlatch_Or_q;
    Control_CmdFifo_Detect_Pulses2_SRlatch_And_b <= Control_CmdFifo_Detect_Pulses2_SRlatch_Not_q;
    Control_CmdFifo_Detect_Pulses2_SRlatch_And_q <= Control_CmdFifo_Detect_Pulses2_SRlatch_And_a and Control_CmdFifo_Detect_Pulses2_SRlatch_And_b;

	--Control_CmdFifo_Detect_Pulses2_And1(LOGICAL,43)@5
    Control_CmdFifo_Detect_Pulses2_And1_a <= Control_CmdFifo_Detect_Pulses2_SRlatch_And_q;
    Control_CmdFifo_Detect_Pulses2_And1_b <= Control_CmdFifo_Detect_Pulses2_SRlatch1_And_q;
    Control_CmdFifo_Detect_Pulses2_And1_q <= Control_CmdFifo_Detect_Pulses2_And1_a and Control_CmdFifo_Detect_Pulses2_And1_b;

	--Control_CmdFifo_Detect_Pulses2_SampleDelay(DELAY,54)@5
    Control_CmdFifo_Detect_Pulses2_SampleDelay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => Control_CmdFifo_Detect_Pulses2_And1_q, xout => Control_CmdFifo_Detect_Pulses2_SampleDelay_q, clk => clk, aclr => areset );

	--Control_CmdFifo_Detect_Pulses2_Not(LOGICAL,45)@5
    Control_CmdFifo_Detect_Pulses2_Not_a <= Control_CmdFifo_Detect_Pulses2_SampleDelay_q;
    Control_CmdFifo_Detect_Pulses2_Not_q <= not Control_CmdFifo_Detect_Pulses2_Not_a;

	--Control_CmdFifo_Detect_Pulses2_And2(LOGICAL,44)@5
    Control_CmdFifo_Detect_Pulses2_And2_a <= Control_CmdFifo_Detect_Pulses2_Not_q;
    Control_CmdFifo_Detect_Pulses2_And2_b <= Control_CmdFifo_Detect_Pulses2_And1_q;
    Control_CmdFifo_Detect_Pulses2_And2_q <= Control_CmdFifo_Detect_Pulses2_And2_a and Control_CmdFifo_Detect_Pulses2_And2_b;

	--ld_Control_CmdFifo_Detect_Pulses2_And2_q_to_Control_CmdFifo_SRlatch_Not_a(DELAY,392)@5
    ld_Control_CmdFifo_Detect_Pulses2_And2_q_to_Control_CmdFifo_SRlatch_Not_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => Control_CmdFifo_Detect_Pulses2_And2_q, xout => ld_Control_CmdFifo_Detect_Pulses2_And2_q_to_Control_CmdFifo_SRlatch_Not_a_q, clk => clk, aclr => areset );

	--Control_CmdFifo_SRlatch_Not(LOGICAL,68)@6
    Control_CmdFifo_SRlatch_Not_a <= ld_Control_CmdFifo_Detect_Pulses2_And2_q_to_Control_CmdFifo_SRlatch_Not_a_q;
    Control_CmdFifo_SRlatch_Not_q <= not Control_CmdFifo_SRlatch_Not_a;

	--ld_Control_CmdFifo_SRlatch_SampleDelay1_q_to_Control_CmdFifo_SRlatch_Or_a(DELAY,393)@5
    ld_Control_CmdFifo_SRlatch_SampleDelay1_q_to_Control_CmdFifo_SRlatch_Or_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => Control_CmdFifo_SRlatch_And_q, xout => ld_Control_CmdFifo_SRlatch_SampleDelay1_q_to_Control_CmdFifo_SRlatch_Or_a_q, clk => clk, aclr => areset );

	--Control_CmdFifo_SRlatch_Or(LOGICAL,69)@6
    Control_CmdFifo_SRlatch_Or_a <= ld_Control_CmdFifo_SRlatch_SampleDelay1_q_to_Control_CmdFifo_SRlatch_Or_a_q;
    Control_CmdFifo_SRlatch_Or_b <= Control_CmdFifo_And3_q;
    Control_CmdFifo_SRlatch_Or_q <= Control_CmdFifo_SRlatch_Or_a or Control_CmdFifo_SRlatch_Or_b;

	--Control_CmdFifo_SRlatch_And(LOGICAL,67)@6
    Control_CmdFifo_SRlatch_And_a <= Control_CmdFifo_SRlatch_Or_q;
    Control_CmdFifo_SRlatch_And_b <= Control_CmdFifo_SRlatch_Not_q;
    Control_CmdFifo_SRlatch_And_q <= Control_CmdFifo_SRlatch_And_a and Control_CmdFifo_SRlatch_And_b;

	--Control_CmdFifo_Not(LOGICAL,63)@5
    Control_CmdFifo_Not_a <= Control_CmdFifo_SRlatch_And_q;
    Control_CmdFifo_Not_q <= not Control_CmdFifo_Not_a;

	--Control_CmdFifo_FIFO2(FIFO,58)@5
    Control_CmdFifo_FIFO2_reset <= areset;

    Control_CmdFifo_FIFO2_fifo : scfifo
    GENERIC MAP (
      add_ram_output_register => "ON",
      almost_empty_value => 4,
      almost_full_value => 488,
      intended_device_family => "Stratix IV",
      lpm_numwords => 496,
      lpm_showahead => "ON",
      lpm_type => "scfifo",
      lpm_width => 7,
      lpm_widthu => 9,
      overflow_checking => "ON",
      underflow_checking => "ON",
      use_eab => "ON"
    )
    PORT MAP (
      rdreq => Control_CmdFifo_Or_q(0),
      aclr => Control_CmdFifo_FIFO2_reset,
      clock => clk,
      wrreq => Control_MasterLoops_ForChan_FLB_v(0),
      data => Control_MasterLoops_ForChan_FLB_c,
      almost_full => Control_CmdFifo_FIFO2_f(0),
      almost_empty => Control_CmdFifo_FIFO2_t(0),
      empty => Control_CmdFifo_FIFO2_empty(0),
      q => Control_CmdFifo_FIFO2_q
    );
    Control_CmdFifo_FIFO2_v <= not Control_CmdFifo_FIFO2_empty;
    Control_CmdFifo_FIFO2_e <= not Control_CmdFifo_FIFO2_t;

	--Control_CmdFifo_And1(LOGICAL,12)@5
    Control_CmdFifo_And1_a <= Control_CmdFifo_FIFO2_v;
    Control_CmdFifo_And1_b <= Control_CmdFifo_Not_q;
    Control_CmdFifo_And1_q <= Control_CmdFifo_And1_a and Control_CmdFifo_And1_b;

	--Control_CmdFifo_And2(LOGICAL,16)@5
    Control_CmdFifo_And2_a <= Control_CmdFifo_Detect_Pulses2_And2_q;
    Control_CmdFifo_And2_b <= Control_CmdFifo_SRlatch_And_q;
    Control_CmdFifo_And2_c <= Control_CmdFifo_FIFO2_v;
    Control_CmdFifo_And2_q <= Control_CmdFifo_And2_a and Control_CmdFifo_And2_b and Control_CmdFifo_And2_c;

	--Control_CmdFifo_Or(LOGICAL,66)@5
    Control_CmdFifo_Or_a <= Control_CmdFifo_And2_q;
    Control_CmdFifo_Or_b <= Control_CmdFifo_And1_q;
    Control_CmdFifo_Or_q <= Control_CmdFifo_Or_a or Control_CmdFifo_Or_b;

	--ld_Control_CmdFifo_Or_q_to_Control_CmdFifo_FIFO1_r(DELAY,375)@5
    ld_Control_CmdFifo_Or_q_to_Control_CmdFifo_FIFO1_r : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => Control_CmdFifo_Or_q, xout => ld_Control_CmdFifo_Or_q_to_Control_CmdFifo_FIFO1_r_q, clk => clk, aclr => areset );

	--GND(CONSTANT,0)
    GND_q <= "0";

	--Control_MasterLoops_latch_0L2_SampleDelay(DELAY,119)@2
    Control_MasterLoops_latch_0L2_SampleDelay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => Control_MasterLoops_latch_0L2_Mux_q, xout => Control_MasterLoops_latch_0L2_SampleDelay_q, clk => clk, aclr => areset );

	--Control_MasterLoops_latch_0L2_Mux(MUX,118)@2
    Control_MasterLoops_latch_0L2_Mux_s <= FwDone_s;
    Control_MasterLoops_latch_0L2_Mux: PROCESS (Control_MasterLoops_latch_0L2_Mux_s, Control_MasterLoops_latch_0L2_SampleDelay_q, BsProcLower_s)
    BEGIN
            CASE Control_MasterLoops_latch_0L2_Mux_s IS
                  WHEN "0" => Control_MasterLoops_latch_0L2_Mux_q <= Control_MasterLoops_latch_0L2_SampleDelay_q;
                  WHEN "1" => Control_MasterLoops_latch_0L2_Mux_q <= BsProcLower_s;
                  WHEN OTHERS => Control_MasterLoops_latch_0L2_Mux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_Control_MasterLoops_latch_0L2_Mux_q_to_Control_Commands_Mux_sel_inv_a(DELAY,618)@2
    ld_Control_MasterLoops_latch_0L2_Mux_q_to_Control_Commands_Mux_sel_inv_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => Control_MasterLoops_latch_0L2_Mux_q, xout => ld_Control_MasterLoops_latch_0L2_Mux_q_to_Control_Commands_Mux_sel_inv_a_q, clk => clk, aclr => areset );

	--Control_Commands_Mux_sel_inv(LOGICAL,259)@5
    Control_Commands_Mux_sel_inv_a <= ld_Control_MasterLoops_latch_0L2_Mux_q_to_Control_Commands_Mux_sel_inv_a_q;
    Control_Commands_Mux_sel_inv_q <= not Control_Commands_Mux_sel_inv_a;

	--Control_MasterLoops_Const4(CONSTANT,98)
    Control_MasterLoops_Const4_q <= "1100100000";

	--Control_MasterLoops_Const10(CONSTANT,93)
    Control_MasterLoops_Const10_q <= "11001000";

	--Control_MasterLoops_For_yMem_FLA(FLA,113)@5
    Control_MasterLoops_For_yMem_FLA_el <= Control_MasterLoops_For_yMem_FLB_el;
    Control_MasterLoops_For_yMem_FLA_ll <= Control_MasterLoops_For_yMem_FLB_ll;
    Control_MasterLoops_For_yMem_FLA_bd <= Control_MasterLoops_For_yMem_FLB_bs;
    Control_MasterLoops_For_yMem_FLA_la <= (not Control_MasterLoops_For_yMem_FLA_el) and Control_MasterLoops_For_yMem_FLA_bd;
    Control_MasterLoops_For_yMem_FLA_ld <= Control_MasterLoops_For_yMem_FLA_el or (Control_MasterLoops_For_yMem_FLA_bd and Control_MasterLoops_For_yMem_FLA_ll);

	--Control_MasterLoops_For_yMem_FLB(FLB,114)@5
    Control_MasterLoops_For_yMem_FLB_ls <= Control_MasterLoops_ForRow_FLB_bs;
    Control_MasterLoops_For_yMem_FLB_la <= Control_MasterLoops_For_yMem_FLA_la;
    Control_MasterLoops_For_yMem_FLB_en <= Control_MasterLoops_Not_q;
    Control_MasterLoops_For_yMem_FLB_init <= STD_LOGIC_VECTOR("00000" & Control_MasterLoops_Const1_q);
    Control_MasterLoops_For_yMem_FLB_step <= STD_LOGIC_VECTOR("0000" & Control_MasterLoops_Const10_q);
    Control_MasterLoops_For_yMem_FLB_limit <= STD_LOGIC_VECTOR("00" & Control_MasterLoops_Const4_q);

    Control_MasterLoops_For_yMem_FLB_count <=
        Control_MasterLoops_For_yMem_FLB_init when Control_MasterLoops_For_yMem_FLB_ls(0) = '1' else
        Control_MasterLoops_For_yMem_FLB_prevnextcount when Control_MasterLoops_For_yMem_FLB_la(0) = '1' else
        Control_MasterLoops_For_yMem_FLB_prevcount;

    Control_MasterLoops_For_yMem_FLB_nextcount <= STD_LOGIC_VECTOR(SIGNED(Control_MasterLoops_For_yMem_FLB_count) + SIGNED(Control_MasterLoops_For_yMem_FLB_step));
    Control_MasterLoops_For_yMem_FLB_firstloop <=
        Control_MasterLoops_For_yMem_FLB_firstpass when Control_MasterLoops_For_yMem_FLB_ls(0) = '1' else
        '0' when Control_MasterLoops_For_yMem_FLB_la(0) = '1' else
        Control_MasterLoops_For_yMem_FLB_fl(0);

    Control_MasterLoops_For_yMem_FLB_pass <=
        Control_MasterLoops_For_yMem_FLB_firstpass when Control_MasterLoops_For_yMem_FLB_ls(0) = '1' else
        Control_MasterLoops_For_yMem_FLB_prevnextpass when Control_MasterLoops_For_yMem_FLB_la(0) = '1' else
        Control_MasterLoops_For_yMem_FLB_prevpass;

    Control_MasterLoops_For_yMem_FLB_firstpass <= '1' when SIGNED(Control_MasterLoops_For_yMem_FLB_init) <= SIGNED(Control_MasterLoops_For_yMem_FLB_limit) else '0';
    Control_MasterLoops_For_yMem_FLB_nextpass <=
        Control_MasterLoops_For_yMem_FLB_firstnextpass when Control_MasterLoops_For_yMem_FLB_ls(0) = '1' else
        Control_MasterLoops_For_yMem_FLB_nextnextpass when Control_MasterLoops_For_yMem_FLB_la(0) = '1' else
        Control_MasterLoops_For_yMem_FLB_prevnextpass;

    Control_MasterLoops_For_yMem_FLB_nextnextpass <= '1' when SIGNED(Control_MasterLoops_For_yMem_FLB_prevnextcount) <= SIGNED(Control_MasterLoops_For_yMem_FLB_limit2) else '0';
    Control_MasterLoops_For_yMem_FLB_firstnextpass <= '1' when SIGNED(Control_MasterLoops_For_yMem_FLB_init) <= SIGNED(Control_MasterLoops_For_yMem_FLB_limit2) else '0';
    Control_MasterLoops_For_yMem_FLB_limit2 <= STD_LOGIC_VECTOR(SIGNED(Control_MasterLoops_For_yMem_FLB_limit) - SIGNED(Control_MasterLoops_For_yMem_FLB_step));

    Control_MasterLoops_For_yMem_FLB: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Control_MasterLoops_For_yMem_FLB_prevcount <= (others => '0');
            Control_MasterLoops_For_yMem_FLB_prevnextcount <= (others => '0');
            Control_MasterLoops_For_yMem_FLB_prevpass <= '0';
            Control_MasterLoops_For_yMem_FLB_prevnextpass <= '0';
            Control_MasterLoops_For_yMem_FLB_el <= (others => '0');
            Control_MasterLoops_For_yMem_FLB_fl <= (others => '0');
            Control_MasterLoops_For_yMem_FLB_ll <= (others => '0');
            Control_MasterLoops_For_yMem_FLB_bs <= (others => '0');
            Control_MasterLoops_For_yMem_FLB_v <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (Control_MasterLoops_For_yMem_FLB_en = "1") THEN
                Control_MasterLoops_For_yMem_FLB_prevcount <= Control_MasterLoops_For_yMem_FLB_count;
                Control_MasterLoops_For_yMem_FLB_prevnextcount <= Control_MasterLoops_For_yMem_FLB_nextcount;
                Control_MasterLoops_For_yMem_FLB_prevpass <= Control_MasterLoops_For_yMem_FLB_pass;
                Control_MasterLoops_For_yMem_FLB_prevnextpass <= Control_MasterLoops_For_yMem_FLB_nextpass;
                Control_MasterLoops_For_yMem_FLB_el(0) <= Control_MasterLoops_For_yMem_FLB_ls(0) and (not Control_MasterLoops_For_yMem_FLB_firstpass);
                Control_MasterLoops_For_yMem_FLB_fl(0) <= Control_MasterLoops_For_yMem_FLB_firstloop;
                Control_MasterLoops_For_yMem_FLB_ll(0) <= Control_MasterLoops_For_yMem_FLB_pass and (not Control_MasterLoops_For_yMem_FLB_nextpass);
                Control_MasterLoops_For_yMem_FLB_bs(0) <= (Control_MasterLoops_For_yMem_FLB_ls(0) or Control_MasterLoops_For_yMem_FLB_la(0)) and Control_MasterLoops_For_yMem_FLB_pass;
            END IF;
            Control_MasterLoops_For_yMem_FLB_v(0) <= Control_MasterLoops_For_yMem_FLB_en(0) and Control_MasterLoops_For_yMem_FLB_pass;
        END IF;
    END PROCESS;

    Control_MasterLoops_For_yMem_FLB_c <= Control_MasterLoops_For_yMem_FLB_prevcount(9 downto 0);

	--Control_Commands_Add3_add(ADD,74)@5
    Control_Commands_Add3_add_a <= STD_LOGIC_VECTOR('0' & "000000" & Control_MasterLoops_For_yMem_FLB_c);
    Control_Commands_Add3_add_b <= STD_LOGIC_VECTOR((16 downto 8 => Control_MasterLoops_ForColumn_FLB_c(7)) & Control_MasterLoops_ForColumn_FLB_c);
            Control_Commands_Add3_add_o <= STD_LOGIC_VECTOR(SIGNED(Control_Commands_Add3_add_a) + SIGNED(Control_Commands_Add3_add_b));
    Control_Commands_Add3_add_q <= Control_Commands_Add3_add_o(15 downto 0);


	--Control_Commands_Const1(CONSTANT,85)
    Control_Commands_Const1_q <= "1100011111";

	--Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged(SUB,260)@5
    Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged_cin <= GND_q;
    Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged_a <= STD_LOGIC_VECTOR("0000000" & Control_Commands_Const1_q) & '0';
    Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged_b <= STD_LOGIC_VECTOR("0" & Control_Commands_Add3_add_q) & Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged_cin(0);
    Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged_i <= Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged_b;
    Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (Control_Commands_Mux_sel_inv_q = "1") THEN
                Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged_o <= Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged_i;
            ELSE
                Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged_a) - UNSIGNED(Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged_b));
            END IF;
        END IF;
    END PROCESS;
    Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged_q <= Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged_o(16 downto 1);


	--ld_Control_MasterLoops_ForChan_FLB_v_to_Control_CmdFifo_FIFO1_v(DELAY,373)@5
    ld_Control_MasterLoops_ForChan_FLB_v_to_Control_CmdFifo_FIFO1_v : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => Control_MasterLoops_ForChan_FLB_v, xout => ld_Control_MasterLoops_ForChan_FLB_v_to_Control_CmdFifo_FIFO1_v_q, clk => clk, aclr => areset );

	--Control_CmdFifo_FIFO1(FIFO,57)@6
    Control_CmdFifo_FIFO1_reset <= areset;

    Control_CmdFifo_FIFO1_fifo : scfifo
    GENERIC MAP (
      add_ram_output_register => "ON",
      almost_empty_value => 4,
      almost_full_value => 488,
      intended_device_family => "Stratix IV",
      lpm_numwords => 496,
      lpm_showahead => "ON",
      lpm_type => "scfifo",
      lpm_width => 16,
      lpm_widthu => 9,
      overflow_checking => "ON",
      underflow_checking => "ON",
      use_eab => "ON"
    )
    PORT MAP (
      rdreq => ld_Control_CmdFifo_Or_q_to_Control_CmdFifo_FIFO1_r_q(0),
      aclr => Control_CmdFifo_FIFO1_reset,
      clock => clk,
      wrreq => ld_Control_MasterLoops_ForChan_FLB_v_to_Control_CmdFifo_FIFO1_v_q(0),
      data => Control_Commands_Sub2_R_sub_Control_Commands_WrEnMux_merged_q,
      almost_full => Control_CmdFifo_FIFO1_f(0),
      almost_empty => Control_CmdFifo_FIFO1_t(0),
      empty => Control_CmdFifo_FIFO1_empty(0),
      q => Control_CmdFifo_FIFO1_q
    );
    Control_CmdFifo_FIFO1_v <= not Control_CmdFifo_FIFO1_empty;
    Control_CmdFifo_FIFO1_e <= not Control_CmdFifo_FIFO1_t;

	--Control_CmdFifo_And12(LOGICAL,15)@5
    Control_CmdFifo_And12_a <= Control_CmdFifo_Or_q;
    Control_CmdFifo_And12_b <= Control_CmdFifo_BitExtract1_5_b;
    Control_CmdFifo_And12_q <= Control_CmdFifo_And12_a and Control_CmdFifo_And12_b;

	--ld_Control_CmdFifo_And12_q_to_Control_CmdFifo_FIFO_WrBkAddr_v(DELAY,382)@5
    ld_Control_CmdFifo_And12_q_to_Control_CmdFifo_FIFO_WrBkAddr_v : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => Control_CmdFifo_And12_q, xout => ld_Control_CmdFifo_And12_q_to_Control_CmdFifo_FIFO_WrBkAddr_v_q, clk => clk, aclr => areset );

	--Control_CmdFifo_FIFO_WrBkAddr(FIFO,62)@6
    Control_CmdFifo_FIFO_WrBkAddr_reset <= areset;

    Control_CmdFifo_FIFO_WrBkAddr_fifo : scfifo
    GENERIC MAP (
      add_ram_output_register => "ON",
      almost_empty_value => 1,
      almost_full_value => 5,
      intended_device_family => "Stratix IV",
      lpm_numwords => 12,
      lpm_showahead => "ON",
      lpm_type => "scfifo",
      lpm_width => 16,
      lpm_widthu => 4,
      overflow_checking => "ON",
      underflow_checking => "ON",
      use_eab => "ON"
    )
    PORT MAP (
      rdreq => AutoMinDelay_replace_mem_q(0),
      aclr => Control_CmdFifo_FIFO_WrBkAddr_reset,
      clock => clk,
      wrreq => ld_Control_CmdFifo_And12_q_to_Control_CmdFifo_FIFO_WrBkAddr_v_q(0),
      data => Control_CmdFifo_FIFO1_q,
      almost_full => Control_CmdFifo_FIFO_WrBkAddr_f(0),
      almost_empty => Control_CmdFifo_FIFO_WrBkAddr_t(0),
      empty => Control_CmdFifo_FIFO_WrBkAddr_empty(0),
      q => Control_CmdFifo_FIFO_WrBkAddr_q
    );
    Control_CmdFifo_FIFO_WrBkAddr_v <= not Control_CmdFifo_FIFO_WrBkAddr_empty;
    Control_CmdFifo_FIFO_WrBkAddr_e <= not Control_CmdFifo_FIFO_WrBkAddr_t;

	--Control_CmdFifo_Not1(LOGICAL,64)@6
    Control_CmdFifo_Not1_a <= Control_CmdFifo_FIFO_WrBkAddr_v;
    Control_CmdFifo_Not1_q <= not Control_CmdFifo_Not1_a;

	--AutoMinDelay_nor(LOGICAL,646)
    AutoMinDelay_nor_a <= AutoMinDelay_notEnable_q;
    AutoMinDelay_nor_b <= AutoMinDelay_sticky_ena_q;
    AutoMinDelay_nor_q <= not (AutoMinDelay_nor_a or AutoMinDelay_nor_b);

	--AutoMinDelay_mem_top(CONSTANT,642)
    AutoMinDelay_mem_top_q <= "011110";

	--AutoMinDelay_cmp(LOGICAL,643)
    AutoMinDelay_cmp_a <= AutoMinDelay_mem_top_q;
    AutoMinDelay_cmp_b <= STD_LOGIC_VECTOR("0" & AutoMinDelay_replace_rdcnt_q);
    AutoMinDelay_cmp_q <= "1" when AutoMinDelay_cmp_a = AutoMinDelay_cmp_b else "0";

	--AutoMinDelay_cmpReg(REG,644)
    AutoMinDelay_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            AutoMinDelay_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            AutoMinDelay_cmpReg_q <= AutoMinDelay_cmp_q;
        END IF;
    END PROCESS;


	--AutoMinDelay_sticky_ena(REG,647)
    AutoMinDelay_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            AutoMinDelay_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (AutoMinDelay_nor_q = "1") THEN
                AutoMinDelay_sticky_ena_q <= AutoMinDelay_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--AutoMinDelay_enaAnd(LOGICAL,648)
    AutoMinDelay_enaAnd_a <= AutoMinDelay_sticky_ena_q;
    AutoMinDelay_enaAnd_b <= VCC_q;
    AutoMinDelay_enaAnd_q <= AutoMinDelay_enaAnd_a and AutoMinDelay_enaAnd_b;

	--SyncFifo_BitExtract1_3(BITSELECT,204)@5
    SyncFifo_BitExtract1_3_in <= SyncFifo_FIFO1_q;
    SyncFifo_BitExtract1_3_b <= SyncFifo_BitExtract1_3_in(3 downto 3);

	--SyncFifo_And6(LOGICAL,199)@5
    SyncFifo_And6_a <= SyncFifo_BitExtract1_3_b;
    SyncFifo_And6_b <= SyncFifo_Or_q;
    SyncFifo_And6_q <= SyncFifo_And6_a and SyncFifo_And6_b;

	--ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_nor(LOGICAL,711)
    ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_nor_a <= AutoMinDelay_notEnable_q;
    ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_nor_b <= ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_sticky_ena_q;
    ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_nor_q <= not (ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_nor_a or ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_nor_b);

	--ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_mem_top(CONSTANT,707)
    ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_mem_top_q <= "010";

	--ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_cmp(LOGICAL,708)
    ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_cmp_a <= ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_mem_top_q;
    ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_cmp_b <= STD_LOGIC_VECTOR("0" & ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_rdcnt_q);
    ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_cmp_q <= "1" when ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_cmp_a = ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_cmp_b else "0";

	--ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_cmpReg(REG,709)
    ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_cmpReg_q <= ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_cmp_q;
        END IF;
    END PROCESS;


	--ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_sticky_ena(REG,712)
    ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_nor_q = "1") THEN
                ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_sticky_ena_q <= ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_enaAnd(LOGICAL,713)
    ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_enaAnd_a <= ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_sticky_ena_q;
    ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_enaAnd_b <= VCC_q;
    ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_enaAnd_q <= ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_enaAnd_a and ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_enaAnd_b;

	--DataPath_Mux_re_2_cast(FLOATCAST,243)@5
    DataPath_Mux_re_2_cast_reset <= areset;
    DataPath_Mux_re_2_cast_a <= DataPath_AccFifo_re_q;
    DataPath_Mux_re_2_cast_inst : cast_sInternal_2_sIEEE
      PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => DataPath_Mux_re_2_cast_reset,
    		dataa	 => DataPath_Mux_re_2_cast_a,
    		result	 => DataPath_Mux_re_2_cast_q
    	);
    -- synopsys translate off
    DataPath_Mux_re_2_cast_q_real <= sIEEE_2_real(DataPath_Mux_re_2_cast_q);
    -- synopsys translate on

	--DataPath_Const1(FLOATCONSTANT,140)

	--ld_SyncFifo_And6_q_to_DataPath_Mux1_re_b(DELAY,470)@5
    ld_SyncFifo_And6_q_to_DataPath_Mux1_re_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 7 )
    PORT MAP ( xin => SyncFifo_And6_q, xout => ld_SyncFifo_And6_q_to_DataPath_Mux1_re_b_q, clk => clk, aclr => areset );

	--DataPath_Mux1_re(MUX,151)@12
    DataPath_Mux1_re_s <= ld_SyncFifo_And6_q_to_DataPath_Mux1_re_b_q;
    DataPath_Mux1_re: PROCESS (DataPath_Mux1_re_s, DataPath_Const1_q, DataPath_Mux_re_2_cast_q)
    BEGIN
            CASE DataPath_Mux1_re_s IS
                  WHEN "0" => DataPath_Mux1_re_q <= DataPath_Const1_q;
                  WHEN "1" => DataPath_Mux1_re_q <= DataPath_Mux_re_2_cast_q;
                  WHEN OTHERS => DataPath_Mux1_re_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_wrreg(REG,706)
    ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_wrreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_wrreg_q <= "00";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_wrreg_q <= ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_rdcnt(COUNTER,705)
    -- every=1, low=0, high=2, step=1, init=1
    ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_rdcnt_i <= TO_UNSIGNED(1,2);
            ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_rdcnt_i = 1 THEN
                  ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_rdcnt_eq <= '1';
                ELSE
                  ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_rdcnt_eq <= '0';
                END IF;
                IF (ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_rdcnt_eq = '1') THEN
                    ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_rdcnt_i <= ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_rdcnt_i - 2;
                ELSE
                    ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_rdcnt_i <= ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_rdcnt_i,2));


	--ld_DataPath_Mux1_re_q_to_DataPath_Add_R_add_f_1_cast_a_replace_mem(DUALMEM,746)
    ld_DataPath_Mux1_re_q_to_DataPath_Add_R_add_f_1_cast_a_replace_mem_reset0 <= areset;
    ld_DataPath_Mux1_re_q_to_DataPath_Add_R_add_f_1_cast_a_replace_mem_ia <= DataPath_Mux1_re_q;
    ld_DataPath_Mux1_re_q_to_DataPath_Add_R_add_f_1_cast_a_replace_mem_aa <= ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_wrreg_q;
    ld_DataPath_Mux1_re_q_to_DataPath_Add_R_add_f_1_cast_a_replace_mem_ab <= ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_rdcnt_q;
    ld_DataPath_Mux1_re_q_to_DataPath_Add_R_add_f_1_cast_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 32,
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
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken1 => ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_enaAnd_q(0),
        clocken0 => VCC_q(0),
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_DataPath_Mux1_re_q_to_DataPath_Add_R_add_f_1_cast_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_DataPath_Mux1_re_q_to_DataPath_Add_R_add_f_1_cast_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_DataPath_Mux1_re_q_to_DataPath_Add_R_add_f_1_cast_a_replace_mem_iq,
        address_a => ld_DataPath_Mux1_re_q_to_DataPath_Add_R_add_f_1_cast_a_replace_mem_aa,
        data_a => ld_DataPath_Mux1_re_q_to_DataPath_Add_R_add_f_1_cast_a_replace_mem_ia
    );
        ld_DataPath_Mux1_re_q_to_DataPath_Add_R_add_f_1_cast_a_replace_mem_q <= ld_DataPath_Mux1_re_q_to_DataPath_Add_R_add_f_1_cast_a_replace_mem_iq(31 downto 0);

	--DataPath_Add_R_add_f_1_cast(FLOATCAST,247)@16
    DataPath_Add_R_add_f_1_cast_reset <= areset;
    DataPath_Add_R_add_f_1_cast_a <= ld_DataPath_Mux1_re_q_to_DataPath_Add_R_add_f_1_cast_a_replace_mem_q;
    DataPath_Add_R_add_f_1_cast_inst : cast_sIEEE_2_sInternal
      PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => DataPath_Add_R_add_f_1_cast_reset,
    		dataa	 => DataPath_Add_R_add_f_1_cast_a,
    		result	 => DataPath_Add_R_add_f_1_cast_q
    	);
    -- synopsys translate off
    DataPath_Add_R_add_f_1_cast_q_real <= sInternal_2_real(DataPath_Add_R_add_f_1_cast_q);
    -- synopsys translate on

	--ld_SyncFifo_Or_q_to_SyncFifo_And_a(DELAY,520)@5
    ld_SyncFifo_Or_q_to_SyncFifo_And_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => SyncFifo_Or_q, xout => ld_SyncFifo_Or_q_to_SyncFifo_And_a_q, clk => clk, aclr => areset );

	--ld_ChannelIn_Lij_y_im_to_InPort_WrBack_InPort_FIFO2_im_d_replace_mem(DUALMEM,714)
    ld_ChannelIn_Lij_y_im_to_InPort_WrBack_InPort_FIFO2_im_d_replace_mem_reset0 <= areset;
    ld_ChannelIn_Lij_y_im_to_InPort_WrBack_InPort_FIFO2_im_d_replace_mem_ia <= Lij_y_im;
    ld_ChannelIn_Lij_y_im_to_InPort_WrBack_InPort_FIFO2_im_d_replace_mem_aa <= ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_wrreg_q;
    ld_ChannelIn_Lij_y_im_to_InPort_WrBack_InPort_FIFO2_im_d_replace_mem_ab <= ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_rdcnt_q;
    ld_ChannelIn_Lij_y_im_to_InPort_WrBack_InPort_FIFO2_im_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 32,
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
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken1 => ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_enaAnd_q(0),
        clocken0 => VCC_q(0),
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_ChannelIn_Lij_y_im_to_InPort_WrBack_InPort_FIFO2_im_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_ChannelIn_Lij_y_im_to_InPort_WrBack_InPort_FIFO2_im_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_ChannelIn_Lij_y_im_to_InPort_WrBack_InPort_FIFO2_im_d_replace_mem_iq,
        address_a => ld_ChannelIn_Lij_y_im_to_InPort_WrBack_InPort_FIFO2_im_d_replace_mem_aa,
        data_a => ld_ChannelIn_Lij_y_im_to_InPort_WrBack_InPort_FIFO2_im_d_replace_mem_ia
    );
        ld_ChannelIn_Lij_y_im_to_InPort_WrBack_InPort_FIFO2_im_d_replace_mem_q <= ld_ChannelIn_Lij_y_im_to_InPort_WrBack_InPort_FIFO2_im_d_replace_mem_iq(31 downto 0);

	--ld_ChannelIn_Lij_y_im_to_L_Mem_im_dd_outputreg(DELAY,735)
    ld_ChannelIn_Lij_y_im_to_L_Mem_im_dd_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => ld_ChannelIn_Lij_y_im_to_InPort_WrBack_InPort_FIFO2_im_d_replace_mem_q, xout => ld_ChannelIn_Lij_y_im_to_L_Mem_im_dd_outputreg_q, clk => clk, aclr => areset );

	--ld_ChannelIn_BsInLowerTri_s_to_InPort_WrBack_InPort_Mux_sel_inv_a(DELAY,632)@2
    ld_ChannelIn_BsInLowerTri_s_to_InPort_WrBack_InPort_Mux_sel_inv_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => BsInLowerTri_s, xout => ld_ChannelIn_BsInLowerTri_s_to_InPort_WrBack_InPort_Mux_sel_inv_a_q, clk => clk, aclr => areset );

	--InPort_WrBack_InPort_Mux_sel_inv(LOGICAL,279)@3
    InPort_WrBack_InPort_Mux_sel_inv_a <= ld_ChannelIn_BsInLowerTri_s_to_InPort_WrBack_InPort_Mux_sel_inv_a_q;
    InPort_WrBack_InPort_Mux_sel_inv_q <= not InPort_WrBack_InPort_Mux_sel_inv_a;

	--ld_InPort_WrBack_InPort_Mux_sel_inv_q_to_InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_l(DELAY,630)@3
    ld_InPort_WrBack_InPort_Mux_sel_inv_q_to_InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_l : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => InPort_WrBack_InPort_Mux_sel_inv_q, xout => ld_InPort_WrBack_InPort_Mux_sel_inv_q_to_InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_l_q, clk => clk, aclr => areset );

	--InPort_WrBack_InPort_BsInColIdx2BankAddr(LOOKUP,161)@2
    InPort_WrBack_InPort_BsInColIdx2BankAddr: PROCESS (RowIdx_s)
    BEGIN
        -- Begin reserved scope level
            CASE (RowIdx_s) IS
                WHEN "0000000" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00000000000000";
                WHEN "0000001" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00000000000000";
                WHEN "0000010" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00000000000000";
                WHEN "0000011" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00000001100101";
                WHEN "0000100" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00000011001010";
                WHEN "0000101" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00000100101111";
                WHEN "0000110" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00000110010100";
                WHEN "0000111" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00000111111001";
                WHEN "0001000" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00001001011110";
                WHEN "0001001" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00001011000011";
                WHEN "0001010" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00001100101000";
                WHEN "0001011" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00001110001101";
                WHEN "0001100" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00001111110010";
                WHEN "0001101" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00010001010111";
                WHEN "0001110" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00010010111100";
                WHEN "0001111" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00010100100001";
                WHEN "0010000" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00010110000110";
                WHEN "0010001" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00010111101011";
                WHEN "0010010" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00011001010000";
                WHEN "0010011" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00011010110101";
                WHEN "0010100" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00011100011010";
                WHEN "0010101" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00011101111111";
                WHEN "0010110" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00011111100100";
                WHEN "0010111" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00100001001001";
                WHEN "0011000" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00100010101110";
                WHEN "0011001" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00100100010011";
                WHEN "0011010" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00100101111000";
                WHEN "0011011" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00100111011101";
                WHEN "0011100" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00101001000010";
                WHEN "0011101" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00101010100111";
                WHEN "0011110" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00101100001100";
                WHEN "0011111" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00101101110001";
                WHEN "0100000" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00101111010110";
                WHEN "0100001" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00110000111011";
                WHEN "0100010" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00110010100000";
                WHEN "0100011" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00110100000101";
                WHEN "0100100" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00110101101010";
                WHEN "0100101" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00110111001111";
                WHEN "0100110" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00111000110100";
                WHEN "0100111" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00111010011001";
                WHEN "0101000" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00111011111110";
                WHEN "0101001" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00111101100011";
                WHEN "0101010" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "00111111001000";
                WHEN "0101011" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01000000101101";
                WHEN "0101100" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01000010010010";
                WHEN "0101101" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01000011110111";
                WHEN "0101110" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01000101011100";
                WHEN "0101111" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01000111000001";
                WHEN "0110000" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01001000100110";
                WHEN "0110001" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01001010001011";
                WHEN "0110010" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01001011110000";
                WHEN "0110011" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01001101010101";
                WHEN "0110100" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01001110111010";
                WHEN "0110101" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01010000011111";
                WHEN "0110110" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01010010000100";
                WHEN "0110111" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01010011101001";
                WHEN "0111000" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01010101001110";
                WHEN "0111001" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01010110110011";
                WHEN "0111010" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01011000011000";
                WHEN "0111011" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01011001111101";
                WHEN "0111100" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01011011100010";
                WHEN "0111101" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01011101000111";
                WHEN "0111110" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01011110101100";
                WHEN "0111111" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01100000010001";
                WHEN "1000000" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01100001110110";
                WHEN "1000001" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01100011011011";
                WHEN "1000010" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01100101000000";
                WHEN "1000011" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01100110100101";
                WHEN "1000100" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01101000001010";
                WHEN "1000101" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01101001101111";
                WHEN "1000110" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01101011010100";
                WHEN "1000111" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01101100111001";
                WHEN "1001000" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01101110011110";
                WHEN "1001001" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01110000000011";
                WHEN "1001010" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01110001101000";
                WHEN "1001011" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01110011001101";
                WHEN "1001100" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01110100110010";
                WHEN "1001101" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01110110010111";
                WHEN "1001110" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01110111111100";
                WHEN "1001111" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01111001100001";
                WHEN "1010000" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01111011000110";
                WHEN "1010001" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01111100101011";
                WHEN "1010010" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01111110010000";
                WHEN "1010011" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "01111111110101";
                WHEN "1010100" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "10000001011010";
                WHEN "1010101" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "10000010111111";
                WHEN "1010110" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "10000100100100";
                WHEN "1010111" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "10000110001001";
                WHEN "1011000" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "10000111101110";
                WHEN "1011001" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "10001001010011";
                WHEN "1011010" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "10001010111000";
                WHEN "1011011" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "10001100011101";
                WHEN "1011100" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "10001110000010";
                WHEN "1011101" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "10001111100111";
                WHEN "1011110" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "10010001001100";
                WHEN "1011111" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "10010010110001";
                WHEN "1100000" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "10010100010110";
                WHEN "1100001" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "10010101111011";
                WHEN "1100010" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "10010111100000";
                WHEN "1100011" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "10011001000101";
                WHEN "1100100" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "10011010101010";
                WHEN "1100101" =>  InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= "10011100001111";
                WHEN OTHERS =>
                    InPort_WrBack_InPort_BsInColIdx2BankAddr_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--InPort_WrBack_InPort_Add1_add(ADD,157)@2
    InPort_WrBack_InPort_Add1_add_a <= STD_LOGIC_VECTOR("0000000" & ColumnIdx_s);
    InPort_WrBack_InPort_Add1_add_b <= InPort_WrBack_InPort_BsInColIdx2BankAddr_q;
    InPort_WrBack_InPort_Add1_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InPort_WrBack_InPort_Add1_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            InPort_WrBack_InPort_Add1_add_o <= STD_LOGIC_VECTOR(UNSIGNED(InPort_WrBack_InPort_Add1_add_a) + UNSIGNED(InPort_WrBack_InPort_Add1_add_b));
        END IF;
    END PROCESS;
    InPort_WrBack_InPort_Add1_add_q <= InPort_WrBack_InPort_Add1_add_o(13 downto 0);


	--ld_InPort_WrBack_InPort_Add1_add_q_to_InPort_WrBack_InPort_Add2_add_b(DELAY,478)@3
    ld_InPort_WrBack_InPort_Add1_add_q_to_InPort_WrBack_InPort_Add2_add_b : dspba_delay
    GENERIC MAP ( width => 14, depth => 2 )
    PORT MAP ( xin => InPort_WrBack_InPort_Add1_add_q, xout => ld_InPort_WrBack_InPort_Add1_add_q_to_InPort_WrBack_InPort_Add2_add_b_q, clk => clk, aclr => areset );

	--ld_InPort_WrBack_InPort_Add1_add_q_to_InPort_WrBack_InPort_Add2_add_b_outputreg(DELAY,703)
    ld_InPort_WrBack_InPort_Add1_add_q_to_InPort_WrBack_InPort_Add2_add_b_outputreg : dspba_delay
    GENERIC MAP ( width => 14, depth => 1 )
    PORT MAP ( xin => ld_InPort_WrBack_InPort_Add1_add_q_to_InPort_WrBack_InPort_Add2_add_b_q, xout => ld_InPort_WrBack_InPort_Add1_add_q_to_InPort_WrBack_InPort_Add2_add_b_outputreg_q, clk => clk, aclr => areset );

	--Control_MasterLoops_Const12(CONSTANT,95)
    Control_MasterLoops_Const12_q <= "10011101110100";

	--InPort_WrBack_InPort_Mult(MULT,169)@2
    InPort_WrBack_InPort_Mult_a <= ChIdx_s;
    InPort_WrBack_InPort_Mult_b <= Control_MasterLoops_Const12_q;
    InPort_WrBack_InPort_Mult_reset <= areset;

    InPort_WrBack_InPort_Mult_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 8,
    lpm_widthb => 14,
    lpm_widthp => 22,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "UNSIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 3
    )
    PORT MAP (
    dataa => InPort_WrBack_InPort_Mult_a,
    datab => InPort_WrBack_InPort_Mult_b,
    clken => VCC_q(0),
    aclr => InPort_WrBack_InPort_Mult_reset,
    clock => clk,
    result => InPort_WrBack_InPort_Mult_s1
    );
    InPort_WrBack_InPort_Mult: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InPort_WrBack_InPort_Mult_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            InPort_WrBack_InPort_Mult_q <= InPort_WrBack_InPort_Mult_s1;
        END IF;
    END PROCESS;

	--InPort_WrBack_InPort_Add2_add(ADD,158)@6
    InPort_WrBack_InPort_Add2_add_a <= InPort_WrBack_InPort_Mult_q(15 downto 0);
    InPort_WrBack_InPort_Add2_add_b <= STD_LOGIC_VECTOR("00" & ld_InPort_WrBack_InPort_Add1_add_q_to_InPort_WrBack_InPort_Add2_add_b_outputreg_q);
            InPort_WrBack_InPort_Add2_add_o <= STD_LOGIC_VECTOR(UNSIGNED(InPort_WrBack_InPort_Add2_add_a) + UNSIGNED(InPort_WrBack_InPort_Add2_add_b));
    InPort_WrBack_InPort_Add2_add_q <= InPort_WrBack_InPort_Add2_add_o(15 downto 0);


	--Control_Commands_Const2(CONSTANT,86)
    Control_Commands_Const2_q <= "1001110111001111";

	--InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged(SUB,278)@6
    InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_cin <= GND_q;
    InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_a <= STD_LOGIC_VECTOR("0" & Control_Commands_Const2_q) & '0';
    InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_b <= STD_LOGIC_VECTOR("0" & InPort_WrBack_InPort_Add2_add_q) & InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_cin(0);
    InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_i <= InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_b;
    InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_InPort_WrBack_InPort_Mux_sel_inv_q_to_InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_l_q = "1") THEN
                InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_o <= InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_i;
            ELSE
                InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_a) - UNSIGNED(InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_b));
            END IF;
        END IF;
    END PROCESS;
    InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_q <= InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_o(16 downto 1);


	--ld_ChannelIn_Lij_v_s_to_L_Mem_re_b(DELAY,507)@2
    ld_ChannelIn_Lij_v_s_to_L_Mem_re_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 5 )
    PORT MAP ( xin => Lij_v_s, xout => ld_ChannelIn_Lij_v_s_to_L_Mem_re_b_q, clk => clk, aclr => areset );

	--ld_Control_CmdFifo_Or_q_to_Control_CmdFifo_FIFO4_r(DELAY,381)@5
    ld_Control_CmdFifo_Or_q_to_Control_CmdFifo_FIFO4_r : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => Control_CmdFifo_Or_q, xout => ld_Control_CmdFifo_Or_q_to_Control_CmdFifo_FIFO4_r_q, clk => clk, aclr => areset );

	--ld_Control_Commands_Mux_sel_inv_q_to_Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_l(DELAY,616)@5
    ld_Control_Commands_Mux_sel_inv_q_to_Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_l : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => Control_Commands_Mux_sel_inv_q, xout => ld_Control_Commands_Mux_sel_inv_q_to_Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_l_q, clk => clk, aclr => areset );

	--Control_Commands_BsColIdx2BankAddr(LOOKUP,80)@5
    Control_Commands_BsColIdx2BankAddr: PROCESS (Control_MasterLoops_ForColumn_FLB_c)
    BEGIN
        -- Begin reserved scope level
            CASE (Control_MasterLoops_ForColumn_FLB_c) IS
                WHEN "00000000" =>  Control_Commands_BsColIdx2BankAddr_q <= "00000000000000";
                WHEN "00000001" =>  Control_Commands_BsColIdx2BankAddr_q <= "00000001100101";
                WHEN "00000010" =>  Control_Commands_BsColIdx2BankAddr_q <= "00000011001010";
                WHEN "00000011" =>  Control_Commands_BsColIdx2BankAddr_q <= "00000100101111";
                WHEN "00000100" =>  Control_Commands_BsColIdx2BankAddr_q <= "00000110010100";
                WHEN "00000101" =>  Control_Commands_BsColIdx2BankAddr_q <= "00000111111001";
                WHEN "00000110" =>  Control_Commands_BsColIdx2BankAddr_q <= "00001001011110";
                WHEN "00000111" =>  Control_Commands_BsColIdx2BankAddr_q <= "00001011000011";
                WHEN "00001000" =>  Control_Commands_BsColIdx2BankAddr_q <= "00001100101000";
                WHEN "00001001" =>  Control_Commands_BsColIdx2BankAddr_q <= "00001110001101";
                WHEN "00001010" =>  Control_Commands_BsColIdx2BankAddr_q <= "00001111110010";
                WHEN "00001011" =>  Control_Commands_BsColIdx2BankAddr_q <= "00010001010111";
                WHEN "00001100" =>  Control_Commands_BsColIdx2BankAddr_q <= "00010010111100";
                WHEN "00001101" =>  Control_Commands_BsColIdx2BankAddr_q <= "00010100100001";
                WHEN "00001110" =>  Control_Commands_BsColIdx2BankAddr_q <= "00010110000110";
                WHEN "00001111" =>  Control_Commands_BsColIdx2BankAddr_q <= "00010111101011";
                WHEN "00010000" =>  Control_Commands_BsColIdx2BankAddr_q <= "00011001010000";
                WHEN "00010001" =>  Control_Commands_BsColIdx2BankAddr_q <= "00011010110101";
                WHEN "00010010" =>  Control_Commands_BsColIdx2BankAddr_q <= "00011100011010";
                WHEN "00010011" =>  Control_Commands_BsColIdx2BankAddr_q <= "00011101111111";
                WHEN "00010100" =>  Control_Commands_BsColIdx2BankAddr_q <= "00011111100100";
                WHEN "00010101" =>  Control_Commands_BsColIdx2BankAddr_q <= "00100001001001";
                WHEN "00010110" =>  Control_Commands_BsColIdx2BankAddr_q <= "00100010101110";
                WHEN "00010111" =>  Control_Commands_BsColIdx2BankAddr_q <= "00100100010011";
                WHEN "00011000" =>  Control_Commands_BsColIdx2BankAddr_q <= "00100101111000";
                WHEN "00011001" =>  Control_Commands_BsColIdx2BankAddr_q <= "00100111011101";
                WHEN "00011010" =>  Control_Commands_BsColIdx2BankAddr_q <= "00101001000010";
                WHEN "00011011" =>  Control_Commands_BsColIdx2BankAddr_q <= "00101010100111";
                WHEN "00011100" =>  Control_Commands_BsColIdx2BankAddr_q <= "00101100001100";
                WHEN "00011101" =>  Control_Commands_BsColIdx2BankAddr_q <= "00101101110001";
                WHEN "00011110" =>  Control_Commands_BsColIdx2BankAddr_q <= "00101111010110";
                WHEN "00011111" =>  Control_Commands_BsColIdx2BankAddr_q <= "00110000111011";
                WHEN "00100000" =>  Control_Commands_BsColIdx2BankAddr_q <= "00110010100000";
                WHEN "00100001" =>  Control_Commands_BsColIdx2BankAddr_q <= "00110100000101";
                WHEN "00100010" =>  Control_Commands_BsColIdx2BankAddr_q <= "00110101101010";
                WHEN "00100011" =>  Control_Commands_BsColIdx2BankAddr_q <= "00110111001111";
                WHEN "00100100" =>  Control_Commands_BsColIdx2BankAddr_q <= "00111000110100";
                WHEN "00100101" =>  Control_Commands_BsColIdx2BankAddr_q <= "00111010011001";
                WHEN "00100110" =>  Control_Commands_BsColIdx2BankAddr_q <= "00111011111110";
                WHEN "00100111" =>  Control_Commands_BsColIdx2BankAddr_q <= "00111101100011";
                WHEN "00101000" =>  Control_Commands_BsColIdx2BankAddr_q <= "00111111001000";
                WHEN "00101001" =>  Control_Commands_BsColIdx2BankAddr_q <= "01000000101101";
                WHEN "00101010" =>  Control_Commands_BsColIdx2BankAddr_q <= "01000010010010";
                WHEN "00101011" =>  Control_Commands_BsColIdx2BankAddr_q <= "01000011110111";
                WHEN "00101100" =>  Control_Commands_BsColIdx2BankAddr_q <= "01000101011100";
                WHEN "00101101" =>  Control_Commands_BsColIdx2BankAddr_q <= "01000111000001";
                WHEN "00101110" =>  Control_Commands_BsColIdx2BankAddr_q <= "01001000100110";
                WHEN "00101111" =>  Control_Commands_BsColIdx2BankAddr_q <= "01001010001011";
                WHEN "00110000" =>  Control_Commands_BsColIdx2BankAddr_q <= "01001011110000";
                WHEN "00110001" =>  Control_Commands_BsColIdx2BankAddr_q <= "01001101010101";
                WHEN "00110010" =>  Control_Commands_BsColIdx2BankAddr_q <= "01001110111010";
                WHEN "00110011" =>  Control_Commands_BsColIdx2BankAddr_q <= "01010000011111";
                WHEN "00110100" =>  Control_Commands_BsColIdx2BankAddr_q <= "01010010000100";
                WHEN "00110101" =>  Control_Commands_BsColIdx2BankAddr_q <= "01010011101001";
                WHEN "00110110" =>  Control_Commands_BsColIdx2BankAddr_q <= "01010101001110";
                WHEN "00110111" =>  Control_Commands_BsColIdx2BankAddr_q <= "01010110110011";
                WHEN "00111000" =>  Control_Commands_BsColIdx2BankAddr_q <= "01011000011000";
                WHEN "00111001" =>  Control_Commands_BsColIdx2BankAddr_q <= "01011001111101";
                WHEN "00111010" =>  Control_Commands_BsColIdx2BankAddr_q <= "01011011100010";
                WHEN "00111011" =>  Control_Commands_BsColIdx2BankAddr_q <= "01011101000111";
                WHEN "00111100" =>  Control_Commands_BsColIdx2BankAddr_q <= "01011110101100";
                WHEN "00111101" =>  Control_Commands_BsColIdx2BankAddr_q <= "01100000010001";
                WHEN "00111110" =>  Control_Commands_BsColIdx2BankAddr_q <= "01100001110110";
                WHEN "00111111" =>  Control_Commands_BsColIdx2BankAddr_q <= "01100011011011";
                WHEN "01000000" =>  Control_Commands_BsColIdx2BankAddr_q <= "01100101000000";
                WHEN "01000001" =>  Control_Commands_BsColIdx2BankAddr_q <= "01100110100101";
                WHEN "01000010" =>  Control_Commands_BsColIdx2BankAddr_q <= "01101000001010";
                WHEN "01000011" =>  Control_Commands_BsColIdx2BankAddr_q <= "01101001101111";
                WHEN "01000100" =>  Control_Commands_BsColIdx2BankAddr_q <= "01101011010100";
                WHEN "01000101" =>  Control_Commands_BsColIdx2BankAddr_q <= "01101100111001";
                WHEN "01000110" =>  Control_Commands_BsColIdx2BankAddr_q <= "01101110011110";
                WHEN "01000111" =>  Control_Commands_BsColIdx2BankAddr_q <= "01110000000011";
                WHEN "01001000" =>  Control_Commands_BsColIdx2BankAddr_q <= "01110001101000";
                WHEN "01001001" =>  Control_Commands_BsColIdx2BankAddr_q <= "01110011001101";
                WHEN "01001010" =>  Control_Commands_BsColIdx2BankAddr_q <= "01110100110010";
                WHEN "01001011" =>  Control_Commands_BsColIdx2BankAddr_q <= "01110110010111";
                WHEN "01001100" =>  Control_Commands_BsColIdx2BankAddr_q <= "01110111111100";
                WHEN "01001101" =>  Control_Commands_BsColIdx2BankAddr_q <= "01111001100001";
                WHEN "01001110" =>  Control_Commands_BsColIdx2BankAddr_q <= "01111011000110";
                WHEN "01001111" =>  Control_Commands_BsColIdx2BankAddr_q <= "01111100101011";
                WHEN "01010000" =>  Control_Commands_BsColIdx2BankAddr_q <= "01111110010000";
                WHEN "01010001" =>  Control_Commands_BsColIdx2BankAddr_q <= "01111111110101";
                WHEN "01010010" =>  Control_Commands_BsColIdx2BankAddr_q <= "10000001011010";
                WHEN "01010011" =>  Control_Commands_BsColIdx2BankAddr_q <= "10000010111111";
                WHEN "01010100" =>  Control_Commands_BsColIdx2BankAddr_q <= "10000100100100";
                WHEN "01010101" =>  Control_Commands_BsColIdx2BankAddr_q <= "10000110001001";
                WHEN "01010110" =>  Control_Commands_BsColIdx2BankAddr_q <= "10000111101110";
                WHEN "01010111" =>  Control_Commands_BsColIdx2BankAddr_q <= "10001001010011";
                WHEN "01011000" =>  Control_Commands_BsColIdx2BankAddr_q <= "10001010111000";
                WHEN "01011001" =>  Control_Commands_BsColIdx2BankAddr_q <= "10001100011101";
                WHEN "01011010" =>  Control_Commands_BsColIdx2BankAddr_q <= "10001110000010";
                WHEN "01011011" =>  Control_Commands_BsColIdx2BankAddr_q <= "10001111100111";
                WHEN "01011100" =>  Control_Commands_BsColIdx2BankAddr_q <= "10010001001100";
                WHEN "01011101" =>  Control_Commands_BsColIdx2BankAddr_q <= "10010010110001";
                WHEN "01011110" =>  Control_Commands_BsColIdx2BankAddr_q <= "10010100010110";
                WHEN "01011111" =>  Control_Commands_BsColIdx2BankAddr_q <= "10010101111011";
                WHEN "01100000" =>  Control_Commands_BsColIdx2BankAddr_q <= "10010111100000";
                WHEN "01100001" =>  Control_Commands_BsColIdx2BankAddr_q <= "10011001000101";
                WHEN "01100010" =>  Control_Commands_BsColIdx2BankAddr_q <= "10011010101010";
                WHEN "01100011" =>  Control_Commands_BsColIdx2BankAddr_q <= "10011100001111";
                WHEN "01100100" =>  Control_Commands_BsColIdx2BankAddr_q <= "00000000000000";
                WHEN "01100101" =>  Control_Commands_BsColIdx2BankAddr_q <= "00000000000000";
                WHEN OTHERS =>
                    Control_Commands_BsColIdx2BankAddr_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--Control_Commands_Add1_add(ADD,72)@5
    Control_Commands_Add1_add_a <= STD_LOGIC_VECTOR((14 downto 8 => Control_MasterLoops_ForRow_FLB_c(7)) & Control_MasterLoops_ForRow_FLB_c);
    Control_Commands_Add1_add_b <= STD_LOGIC_VECTOR('0' & Control_Commands_BsColIdx2BankAddr_q);
    Control_Commands_Add1_add: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Control_Commands_Add1_add_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Control_Commands_Add1_add_o <= STD_LOGIC_VECTOR(SIGNED(Control_Commands_Add1_add_a) + SIGNED(Control_Commands_Add1_add_b));
        END IF;
    END PROCESS;
    Control_Commands_Add1_add_q <= Control_Commands_Add1_add_o(13 downto 0);


	--ld_Control_MasterLoops_Not_q_to_Control_MasterLoops_ForMatMem_FLB_en(DELAY,440)@5
    ld_Control_MasterLoops_Not_q_to_Control_MasterLoops_ForMatMem_FLB_en : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => Control_MasterLoops_Not_q, xout => ld_Control_MasterLoops_Not_q_to_Control_MasterLoops_ForMatMem_FLB_en_q, clk => clk, aclr => areset );

	--Control_MasterLoops_Const11(CONSTANT,94)
    Control_MasterLoops_Const11_q <= "1001110111010000";

	--Control_MasterLoops_ForMatMem_FLA(FLA,109)@6
    Control_MasterLoops_ForMatMem_FLA_el <= Control_MasterLoops_ForMatMem_FLB_el;
    Control_MasterLoops_ForMatMem_FLA_ll <= Control_MasterLoops_ForMatMem_FLB_ll;
    Control_MasterLoops_ForMatMem_FLA_bd <= Control_MasterLoops_ForMatMem_FLB_bs;
    Control_MasterLoops_ForMatMem_FLA_la <= (not Control_MasterLoops_ForMatMem_FLA_el) and Control_MasterLoops_ForMatMem_FLA_bd;
    Control_MasterLoops_ForMatMem_FLA_ld <= Control_MasterLoops_ForMatMem_FLA_el or (Control_MasterLoops_ForMatMem_FLA_bd and Control_MasterLoops_ForMatMem_FLA_ll);

	--ld_Control_MasterLoops_ForRow_FLB_bs_to_Control_MasterLoops_ForMatMem_FLB_ls(DELAY,438)@5
    ld_Control_MasterLoops_ForRow_FLB_bs_to_Control_MasterLoops_ForMatMem_FLB_ls : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => Control_MasterLoops_ForRow_FLB_bs, xout => ld_Control_MasterLoops_ForRow_FLB_bs_to_Control_MasterLoops_ForMatMem_FLB_ls_q, clk => clk, aclr => areset );

	--Control_MasterLoops_ForMatMem_FLB(FLB,110)@6
    Control_MasterLoops_ForMatMem_FLB_ls <= ld_Control_MasterLoops_ForRow_FLB_bs_to_Control_MasterLoops_ForMatMem_FLB_ls_q;
    Control_MasterLoops_ForMatMem_FLB_la <= Control_MasterLoops_ForMatMem_FLA_la;
    Control_MasterLoops_ForMatMem_FLB_en <= ld_Control_MasterLoops_Not_q_to_Control_MasterLoops_ForMatMem_FLB_en_q;
    Control_MasterLoops_ForMatMem_FLB_init <= STD_LOGIC_VECTOR("00000000000" & Control_MasterLoops_Const1_q);
    Control_MasterLoops_ForMatMem_FLB_step <= STD_LOGIC_VECTOR("0000" & Control_MasterLoops_Const12_q);
    Control_MasterLoops_ForMatMem_FLB_limit <= STD_LOGIC_VECTOR("00" & Control_MasterLoops_Const11_q);

    Control_MasterLoops_ForMatMem_FLB_count <=
        Control_MasterLoops_ForMatMem_FLB_init when Control_MasterLoops_ForMatMem_FLB_ls(0) = '1' else
        Control_MasterLoops_ForMatMem_FLB_prevnextcount when Control_MasterLoops_ForMatMem_FLB_la(0) = '1' else
        Control_MasterLoops_ForMatMem_FLB_prevcount;

    Control_MasterLoops_ForMatMem_FLB_nextcount <= STD_LOGIC_VECTOR(SIGNED(Control_MasterLoops_ForMatMem_FLB_count) + SIGNED(Control_MasterLoops_ForMatMem_FLB_step));
    Control_MasterLoops_ForMatMem_FLB_firstloop <=
        Control_MasterLoops_ForMatMem_FLB_firstpass when Control_MasterLoops_ForMatMem_FLB_ls(0) = '1' else
        '0' when Control_MasterLoops_ForMatMem_FLB_la(0) = '1' else
        Control_MasterLoops_ForMatMem_FLB_fl(0);

    Control_MasterLoops_ForMatMem_FLB_pass <=
        Control_MasterLoops_ForMatMem_FLB_firstpass when Control_MasterLoops_ForMatMem_FLB_ls(0) = '1' else
        Control_MasterLoops_ForMatMem_FLB_prevnextpass when Control_MasterLoops_ForMatMem_FLB_la(0) = '1' else
        Control_MasterLoops_ForMatMem_FLB_prevpass;

    Control_MasterLoops_ForMatMem_FLB_firstpass <= '1' when SIGNED(Control_MasterLoops_ForMatMem_FLB_init) <= SIGNED(Control_MasterLoops_ForMatMem_FLB_limit) else '0';
    Control_MasterLoops_ForMatMem_FLB_nextpass <=
        Control_MasterLoops_ForMatMem_FLB_firstnextpass when Control_MasterLoops_ForMatMem_FLB_ls(0) = '1' else
        Control_MasterLoops_ForMatMem_FLB_nextnextpass when Control_MasterLoops_ForMatMem_FLB_la(0) = '1' else
        Control_MasterLoops_ForMatMem_FLB_prevnextpass;

    Control_MasterLoops_ForMatMem_FLB_nextnextpass <= '1' when SIGNED(Control_MasterLoops_ForMatMem_FLB_prevnextcount) <= SIGNED(Control_MasterLoops_ForMatMem_FLB_limit2) else '0';
    Control_MasterLoops_ForMatMem_FLB_firstnextpass <= '1' when SIGNED(Control_MasterLoops_ForMatMem_FLB_init) <= SIGNED(Control_MasterLoops_ForMatMem_FLB_limit2) else '0';
    Control_MasterLoops_ForMatMem_FLB_limit2 <= STD_LOGIC_VECTOR(SIGNED(Control_MasterLoops_ForMatMem_FLB_limit) - SIGNED(Control_MasterLoops_ForMatMem_FLB_step));

    Control_MasterLoops_ForMatMem_FLB: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Control_MasterLoops_ForMatMem_FLB_prevcount <= (others => '0');
            Control_MasterLoops_ForMatMem_FLB_prevnextcount <= (others => '0');
            Control_MasterLoops_ForMatMem_FLB_prevpass <= '0';
            Control_MasterLoops_ForMatMem_FLB_prevnextpass <= '0';
            Control_MasterLoops_ForMatMem_FLB_el <= (others => '0');
            Control_MasterLoops_ForMatMem_FLB_fl <= (others => '0');
            Control_MasterLoops_ForMatMem_FLB_ll <= (others => '0');
            Control_MasterLoops_ForMatMem_FLB_bs <= (others => '0');
            Control_MasterLoops_ForMatMem_FLB_v <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (Control_MasterLoops_ForMatMem_FLB_en = "1") THEN
                Control_MasterLoops_ForMatMem_FLB_prevcount <= Control_MasterLoops_ForMatMem_FLB_count;
                Control_MasterLoops_ForMatMem_FLB_prevnextcount <= Control_MasterLoops_ForMatMem_FLB_nextcount;
                Control_MasterLoops_ForMatMem_FLB_prevpass <= Control_MasterLoops_ForMatMem_FLB_pass;
                Control_MasterLoops_ForMatMem_FLB_prevnextpass <= Control_MasterLoops_ForMatMem_FLB_nextpass;
                Control_MasterLoops_ForMatMem_FLB_el(0) <= Control_MasterLoops_ForMatMem_FLB_ls(0) and (not Control_MasterLoops_ForMatMem_FLB_firstpass);
                Control_MasterLoops_ForMatMem_FLB_fl(0) <= Control_MasterLoops_ForMatMem_FLB_firstloop;
                Control_MasterLoops_ForMatMem_FLB_ll(0) <= Control_MasterLoops_ForMatMem_FLB_pass and (not Control_MasterLoops_ForMatMem_FLB_nextpass);
                Control_MasterLoops_ForMatMem_FLB_bs(0) <= (Control_MasterLoops_ForMatMem_FLB_ls(0) or Control_MasterLoops_ForMatMem_FLB_la(0)) and Control_MasterLoops_ForMatMem_FLB_pass;
            END IF;
            Control_MasterLoops_ForMatMem_FLB_v(0) <= Control_MasterLoops_ForMatMem_FLB_en(0) and Control_MasterLoops_ForMatMem_FLB_pass;
        END IF;
    END PROCESS;

    Control_MasterLoops_ForMatMem_FLB_c <= Control_MasterLoops_ForMatMem_FLB_prevcount(15 downto 0);

	--Control_Commands_Add2_add(ADD,73)@6
    Control_Commands_Add2_add_a <= Control_MasterLoops_ForMatMem_FLB_c;
    Control_Commands_Add2_add_b <= STD_LOGIC_VECTOR("00" & Control_Commands_Add1_add_q);
            Control_Commands_Add2_add_o <= STD_LOGIC_VECTOR(UNSIGNED(Control_Commands_Add2_add_a) + UNSIGNED(Control_Commands_Add2_add_b));
    Control_Commands_Add2_add_q <= Control_Commands_Add2_add_o(15 downto 0);


	--Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged(SUB,258)@6
    Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_cin <= GND_q;
    Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_a <= STD_LOGIC_VECTOR("0" & Control_Commands_Const2_q) & '0';
    Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_b <= STD_LOGIC_VECTOR("0" & Control_Commands_Add2_add_q) & Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_cin(0);
    Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_i <= Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_b;
    Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_Control_Commands_Mux_sel_inv_q_to_Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_l_q = "1") THEN
                Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_o <= Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_i;
            ELSE
                Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_a) - UNSIGNED(Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_b));
            END IF;
        END IF;
    END PROCESS;
    Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_q <= Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_o(16 downto 1);


	--ld_Control_MasterLoops_ForChan_FLB_v_to_Control_CmdFifo_FIFO4_v(DELAY,379)@5
    ld_Control_MasterLoops_ForChan_FLB_v_to_Control_CmdFifo_FIFO4_v : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => Control_MasterLoops_ForChan_FLB_v, xout => ld_Control_MasterLoops_ForChan_FLB_v_to_Control_CmdFifo_FIFO4_v_q, clk => clk, aclr => areset );

	--Control_CmdFifo_FIFO4(FIFO,61)@7
    Control_CmdFifo_FIFO4_reset <= areset;

    Control_CmdFifo_FIFO4_fifo : scfifo
    GENERIC MAP (
      add_ram_output_register => "ON",
      almost_empty_value => 4,
      almost_full_value => 488,
      intended_device_family => "Stratix IV",
      lpm_numwords => 496,
      lpm_showahead => "ON",
      lpm_type => "scfifo",
      lpm_width => 16,
      lpm_widthu => 9,
      overflow_checking => "ON",
      underflow_checking => "ON",
      use_eab => "ON"
    )
    PORT MAP (
      rdreq => ld_Control_CmdFifo_Or_q_to_Control_CmdFifo_FIFO4_r_q(0),
      aclr => Control_CmdFifo_FIFO4_reset,
      clock => clk,
      wrreq => ld_Control_MasterLoops_ForChan_FLB_v_to_Control_CmdFifo_FIFO4_v_q(0),
      data => Control_Commands_Sub1_R_sub_Control_Commands_Mux_merged_q,
      almost_full => Control_CmdFifo_FIFO4_f(0),
      almost_empty => Control_CmdFifo_FIFO4_t(0),
      empty => Control_CmdFifo_FIFO4_empty(0),
      q => Control_CmdFifo_FIFO4_q
    );
    Control_CmdFifo_FIFO4_v <= not Control_CmdFifo_FIFO4_empty;
    Control_CmdFifo_FIFO4_e <= not Control_CmdFifo_FIFO4_t;

	--L_Mem_im(DUALMEM,185)@7
    L_Mem_im_reset0 <= areset;
    L_Mem_im_ia <= ld_ChannelIn_Lij_y_im_to_L_Mem_im_dd_outputreg_q;
    L_Mem_im_aa <= InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_q;
    L_Mem_im_ab <= Control_CmdFifo_FIFO4_q;
    L_Mem_im_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M144K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 16,
        numwords_a => 40400,
        width_b => 32,
        widthad_b => 16,
        numwords_b => 40400,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("cholesky_solver_mc/CholFwBw/BwSub/cholesky_solver_mc_CholFwBw_BwSub_L_Mem_im.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        wren_a => ld_ChannelIn_Lij_v_s_to_L_Mem_re_b_q(0),
        aclr0 => L_Mem_im_reset0,
        clock0 => clk,
        address_b => L_Mem_im_ab,
        -- data_b => (others => '0'),
        q_b => L_Mem_im_iq,
        q_a => L_Mem_im_ir,
        address_a => L_Mem_im_aa,
        data_a => L_Mem_im_ia
    );
        L_Mem_im_q <= L_Mem_im_iq(31 downto 0);
        L_Mem_im_r <= L_Mem_im_ir(31 downto 0);

	--ld_Control_CmdFifo_Or_q_to_SyncFifo_FIFO_re_v(DELAY,545)@5
    ld_Control_CmdFifo_Or_q_to_SyncFifo_FIFO_re_v : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => Control_CmdFifo_Or_q, xout => ld_Control_CmdFifo_Or_q_to_SyncFifo_FIFO_re_v_q, clk => clk, aclr => areset );

	--SyncFifo_FIFO2_im(FIFO,210)@9
    SyncFifo_FIFO2_im_reset <= areset;

    SyncFifo_FIFO2_im_fifo : scfifo
    GENERIC MAP (
      add_ram_output_register => "ON",
      almost_empty_value => 4,
      almost_full_value => 30,
      intended_device_family => "Stratix IV",
      lpm_numwords => 32,
      lpm_showahead => "ON",
      lpm_type => "scfifo",
      lpm_width => 32,
      lpm_widthu => 5,
      overflow_checking => "ON",
      underflow_checking => "ON",
      use_eab => "ON"
    )
    PORT MAP (
      rdreq => ld_SyncFifo_Or_q_to_SyncFifo_And_a_q(0),
      aclr => SyncFifo_FIFO2_im_reset,
      clock => clk,
      wrreq => ld_Control_CmdFifo_Or_q_to_SyncFifo_FIFO_re_v_q(0),
      data => L_Mem_im_q,
      almost_full => SyncFifo_FIFO2_im_f(0),
      almost_empty => SyncFifo_FIFO2_im_t(0),
      empty => SyncFifo_FIFO2_im_empty(0),
      q => SyncFifo_FIFO2_im_q
    );
    SyncFifo_FIFO2_im_v <= not SyncFifo_FIFO2_im_empty;
    SyncFifo_FIFO2_im_e <= not SyncFifo_FIFO2_im_t;

	--ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_nor(LOGICAL,763)
    ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_nor_a <= AutoMinDelay_notEnable_q;
    ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_nor_b <= ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_sticky_ena_q;
    ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_nor_q <= not (ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_nor_a or ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_nor_b);

	--ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_mem_top(CONSTANT,759)
    ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_mem_top_q <= "01010";

	--ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_cmp(LOGICAL,760)
    ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_cmp_a <= ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_mem_top_q;
    ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_cmp_b <= STD_LOGIC_VECTOR("0" & ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_rdcnt_q);
    ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_cmp_q <= "1" when ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_cmp_a = ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_cmp_b else "0";

	--ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_cmpReg(REG,761)
    ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_cmpReg_q <= ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_cmp_q;
        END IF;
    END PROCESS;


	--ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_sticky_ena(REG,764)
    ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_nor_q = "1") THEN
                ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_sticky_ena_q <= ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_enaAnd(LOGICAL,765)
    ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_enaAnd_a <= ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_sticky_ena_q;
    ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_enaAnd_b <= VCC_q;
    ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_enaAnd_q <= ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_enaAnd_a and ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_enaAnd_b;

	--ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_mem(DUALMEM,704)
    ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_mem_reset0 <= areset;
    ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_mem_ia <= Lij_y_re;
    ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_mem_aa <= ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_wrreg_q;
    ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_mem_ab <= ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_rdcnt_q;
    ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 32,
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
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken1 => ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_enaAnd_q(0),
        clocken0 => VCC_q(0),
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_mem_iq,
        address_a => ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_mem_aa,
        data_a => ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_mem_ia
    );
        ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_mem_q <= ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_mem_iq(31 downto 0);

	--ld_ChannelIn_Lij_y_re_to_L_Mem_re_dd_outputreg(DELAY,724)
    ld_ChannelIn_Lij_y_re_to_L_Mem_re_dd_outputreg : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_mem_q, xout => ld_ChannelIn_Lij_y_re_to_L_Mem_re_dd_outputreg_q, clk => clk, aclr => areset );

	--L_Mem_re(DUALMEM,184)@7
    L_Mem_re_reset0 <= areset;
    L_Mem_re_ia <= ld_ChannelIn_Lij_y_re_to_L_Mem_re_dd_outputreg_q;
    L_Mem_re_aa <= InPort_WrBack_InPort_Sub1_R_sub_InPort_WrBack_InPort_Mux_merged_q;
    L_Mem_re_ab <= Control_CmdFifo_FIFO4_q;
    L_Mem_re_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M144K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 16,
        numwords_a => 40400,
        width_b => 32,
        widthad_b => 16,
        numwords_b => 40400,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("cholesky_solver_mc/CholFwBw/BwSub/cholesky_solver_mc_CholFwBw_BwSub_L_Mem_re.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        wren_a => ld_ChannelIn_Lij_v_s_to_L_Mem_re_b_q(0),
        aclr0 => L_Mem_re_reset0,
        clock0 => clk,
        address_b => L_Mem_re_ab,
        -- data_b => (others => '0'),
        q_b => L_Mem_re_iq,
        q_a => L_Mem_re_ir,
        address_a => L_Mem_re_aa,
        data_a => L_Mem_re_ia
    );
        L_Mem_re_q <= L_Mem_re_iq(31 downto 0);
        L_Mem_re_r <= L_Mem_re_ir(31 downto 0);

	--SyncFifo_FIFO2_re(FIFO,209)@9
    SyncFifo_FIFO2_re_reset <= areset;

    SyncFifo_FIFO2_re_fifo : scfifo
    GENERIC MAP (
      add_ram_output_register => "ON",
      almost_empty_value => 4,
      almost_full_value => 30,
      intended_device_family => "Stratix IV",
      lpm_numwords => 32,
      lpm_showahead => "ON",
      lpm_type => "scfifo",
      lpm_width => 32,
      lpm_widthu => 5,
      overflow_checking => "ON",
      underflow_checking => "ON",
      use_eab => "ON"
    )
    PORT MAP (
      rdreq => ld_SyncFifo_Or_q_to_SyncFifo_And_a_q(0),
      aclr => SyncFifo_FIFO2_re_reset,
      clock => clk,
      wrreq => ld_Control_CmdFifo_Or_q_to_SyncFifo_FIFO_re_v_q(0),
      data => L_Mem_re_q,
      almost_full => SyncFifo_FIFO2_re_f(0),
      almost_empty => SyncFifo_FIFO2_re_t(0),
      empty => SyncFifo_FIFO2_re_empty(0),
      q => SyncFifo_FIFO2_re_q
    );
    SyncFifo_FIFO2_re_v <= not SyncFifo_FIFO2_re_empty;
    SyncFifo_FIFO2_re_e <= not SyncFifo_FIFO2_re_t;

	--ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_wrreg(REG,758)
    ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_wrreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_wrreg_q <= "0000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_wrreg_q <= ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_rdcnt(COUNTER,757)
    -- every=1, low=0, high=10, step=1, init=1
    ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_rdcnt_i <= TO_UNSIGNED(1,4);
            ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_rdcnt_i = 9 THEN
                  ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_rdcnt_eq <= '1';
                ELSE
                  ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_rdcnt_eq <= '0';
                END IF;
                IF (ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_rdcnt_eq = '1') THEN
                    ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_rdcnt_i <= ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_rdcnt_i - 10;
                ELSE
                    ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_rdcnt_i <= ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_rdcnt_i,4));


	--ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_mem(DUALMEM,756)
    ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_mem_reset0 <= areset;
    ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_mem_ia <= SyncFifo_FIFO2_re_q;
    ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_mem_aa <= ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_wrreg_q;
    ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_mem_ab <= ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_rdcnt_q;
    ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 4,
        numwords_a => 11,
        width_b => 32,
        widthad_b => 4,
        numwords_b => 11,
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
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken1 => ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_enaAnd_q(0),
        clocken0 => VCC_q(0),
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_mem_iq,
        address_a => ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_mem_aa,
        data_a => ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_mem_ia
    );
        ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_mem_q <= ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_mem_iq(31 downto 0);

	--DataPath_Mult_aR_x_bR_f_1_cast(FLOATCAST,249)@21
    DataPath_Mult_aR_x_bR_f_1_cast_reset <= areset;
    DataPath_Mult_aR_x_bR_f_1_cast_a <= ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_mem_q;
    DataPath_Mult_aR_x_bR_f_1_cast_inst : cast_sIEEE_2_sNorm
      PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => DataPath_Mult_aR_x_bR_f_1_cast_reset,
    		dataa	 => DataPath_Mult_aR_x_bR_f_1_cast_a,
    		result	 => DataPath_Mult_aR_x_bR_f_1_cast_q
    	);
    -- synopsys translate off
    DataPath_Mult_aR_x_bR_f_1_cast_q_real <= sNorm_2_real(DataPath_Mult_aR_x_bR_f_1_cast_q);
    -- synopsys translate on

	--DataPath_Mux_im_3_cast_q_const(FLOATCONSTANT,257)

	--ld_SyncFifo_And6_q_to_DataPath_AccFifo_im_r(DELAY,463)@5
    ld_SyncFifo_And6_q_to_DataPath_AccFifo_im_r : dspba_delay
    GENERIC MAP ( width => 1, depth => 8 )
    PORT MAP ( xin => SyncFifo_And6_q, xout => ld_SyncFifo_And6_q_to_DataPath_AccFifo_im_r_q, clk => clk, aclr => areset );

	--DataPath_AutoMinDelay1_im_im_nor(LOGICAL,656)
    DataPath_AutoMinDelay1_im_im_nor_a <= AutoMinDelay_notEnable_q;
    DataPath_AutoMinDelay1_im_im_nor_b <= DataPath_AutoMinDelay1_im_im_sticky_ena_q;
    DataPath_AutoMinDelay1_im_im_nor_q <= not (DataPath_AutoMinDelay1_im_im_nor_a or DataPath_AutoMinDelay1_im_im_nor_b);

	--DataPath_AutoMinDelay1_im_im_mem_top(CONSTANT,652)
    DataPath_AutoMinDelay1_im_im_mem_top_q <= "0110";

	--DataPath_AutoMinDelay1_im_im_cmp(LOGICAL,653)
    DataPath_AutoMinDelay1_im_im_cmp_a <= DataPath_AutoMinDelay1_im_im_mem_top_q;
    DataPath_AutoMinDelay1_im_im_cmp_b <= STD_LOGIC_VECTOR("0" & DataPath_AutoMinDelay1_im_im_replace_rdcnt_q);
    DataPath_AutoMinDelay1_im_im_cmp_q <= "1" when DataPath_AutoMinDelay1_im_im_cmp_a = DataPath_AutoMinDelay1_im_im_cmp_b else "0";

	--DataPath_AutoMinDelay1_im_im_cmpReg(REG,654)
    DataPath_AutoMinDelay1_im_im_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            DataPath_AutoMinDelay1_im_im_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            DataPath_AutoMinDelay1_im_im_cmpReg_q <= DataPath_AutoMinDelay1_im_im_cmp_q;
        END IF;
    END PROCESS;


	--DataPath_AutoMinDelay1_im_im_sticky_ena(REG,657)
    DataPath_AutoMinDelay1_im_im_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            DataPath_AutoMinDelay1_im_im_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (DataPath_AutoMinDelay1_im_im_nor_q = "1") THEN
                DataPath_AutoMinDelay1_im_im_sticky_ena_q <= DataPath_AutoMinDelay1_im_im_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--DataPath_AutoMinDelay1_im_im_enaAnd(LOGICAL,658)
    DataPath_AutoMinDelay1_im_im_enaAnd_a <= DataPath_AutoMinDelay1_im_im_sticky_ena_q;
    DataPath_AutoMinDelay1_im_im_enaAnd_b <= VCC_q;
    DataPath_AutoMinDelay1_im_im_enaAnd_q <= DataPath_AutoMinDelay1_im_im_enaAnd_a and DataPath_AutoMinDelay1_im_im_enaAnd_b;

	--DataPath_Mux1_im(MUX,152)@13
    DataPath_Mux1_im_s <= ld_SyncFifo_And6_q_to_DataPath_AccFifo_im_r_q;
    DataPath_Mux1_im: PROCESS (DataPath_Mux1_im_s, DataPath_Mux_im_3_cast_q_const_q, DataPath_AccFifo_im_q)
    BEGIN
            CASE DataPath_Mux1_im_s IS
                  WHEN "0" => DataPath_Mux1_im_q <= DataPath_Mux_im_3_cast_q_const_q;
                  WHEN "1" => DataPath_Mux1_im_q <= DataPath_AccFifo_im_q;
                  WHEN OTHERS => DataPath_Mux1_im_q <= (others => '0');
            END CASE;
    END PROCESS;


	--DataPath_Mux1_im_0_norm_DataPath_Add_I_add_f_1(fixed,300)@13
    DataPath_Mux1_im_0_norm_DataPath_Add_I_add_f_1_reset <= areset;
    DataPath_Mux1_im_0_norm_DataPath_Add_I_add_f_1_inst : fp_norm_sInternal_2_sInternal
      PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => DataPath_Mux1_im_0_norm_DataPath_Add_I_add_f_1_reset,
    		dataa	 => DataPath_Mux1_im_q,
    		result	 => DataPath_Mux1_im_0_norm_DataPath_Add_I_add_f_1_q
    	);
    -- synopsys translate off
    DataPath_Mux1_im_0_norm_DataPath_Add_I_add_f_1_q_real <= sInternal_2_real(DataPath_Mux1_im_0_norm_DataPath_Add_I_add_f_1_q);
    -- synopsys translate on

	--DataPath_ConjMult1_Multri_f(FLOATMULT,229)@9
    DataPath_ConjMult1_Multri_f_reset <= areset;
    DataPath_ConjMult1_Multri_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix IV", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => DataPath_ConjMult1_Multri_f_reset,
    		dataa	 => SyncFifo_FIFO_re_q,
    		datab	 => SyncFifo_FIFO2_im_q,
    		result	 => DataPath_ConjMult1_Multri_f_q
    	);
    -- synopsys translate off
    DataPath_ConjMult1_Multri_f_a_real <= sIEEE_2_real(SyncFifo_FIFO_re_q);
    DataPath_ConjMult1_Multri_f_b_real <= sIEEE_2_real(SyncFifo_FIFO2_im_q);
    DataPath_ConjMult1_Multri_f_q_real <= sInternalSM_2_real(DataPath_ConjMult1_Multri_f_q);
    -- synopsys translate on

	--DataPath_ConjMult1_Multir_f(FLOATMULT,228)@9
    DataPath_ConjMult1_Multir_f_reset <= areset;
    DataPath_ConjMult1_Multir_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix IV", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => DataPath_ConjMult1_Multir_f_reset,
    		dataa	 => SyncFifo_FIFO_im_q,
    		datab	 => SyncFifo_FIFO2_re_q,
    		result	 => DataPath_ConjMult1_Multir_f_q
    	);
    -- synopsys translate off
    DataPath_ConjMult1_Multir_f_a_real <= sIEEE_2_real(SyncFifo_FIFO_im_q);
    DataPath_ConjMult1_Multir_f_b_real <= sIEEE_2_real(SyncFifo_FIFO2_re_q);
    DataPath_ConjMult1_Multir_f_q_real <= sInternalSM_2_real(DataPath_ConjMult1_Multir_f_q);
    -- synopsys translate on

	--DataPath_ConjMult1_Sub_R_sub_f(FLOATADDSUB,231)@13
    DataPath_ConjMult1_Sub_R_sub_f_reset <= areset;
    DataPath_ConjMult1_Sub_R_sub_f_add_sub	 <= not GND_q;
    DataPath_ConjMult1_Sub_R_sub_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '1'
    ) PORT MAP (
    	add_sub	 => DataPath_ConjMult1_Sub_R_sub_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => DataPath_ConjMult1_Sub_R_sub_f_reset,
    	dataa	 => DataPath_ConjMult1_Multir_f_q,
    	datab	 => DataPath_ConjMult1_Multri_f_q,
    	result	 => DataPath_ConjMult1_Sub_R_sub_f_q
   	);
    DataPath_ConjMult1_Sub_R_sub_f_p <= not DataPath_ConjMult1_Sub_R_sub_f_q(41 downto 41);
    DataPath_ConjMult1_Sub_R_sub_f_n <= DataPath_ConjMult1_Sub_R_sub_f_q(41 downto 41);
    -- synopsys translate off
    DataPath_ConjMult1_Sub_R_sub_f_a_real <= sInternalSM_2_real(DataPath_ConjMult1_Multir_f_q);
    DataPath_ConjMult1_Sub_R_sub_f_b_real <= sInternalSM_2_real(DataPath_ConjMult1_Multri_f_q);
    DataPath_ConjMult1_Sub_R_sub_f_q_real <= sInternal_2_real(DataPath_ConjMult1_Sub_R_sub_f_q);
    -- synopsys translate on

	--DataPath_Add_I_add_f(FLOATADDSUB,224)@18
    DataPath_Add_I_add_f_reset <= areset;
    DataPath_Add_I_add_f_add_sub	 <= not VCC_q;
    DataPath_Add_I_add_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => DataPath_Add_I_add_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => DataPath_Add_I_add_f_reset,
    	dataa	 => DataPath_ConjMult1_Sub_R_sub_f_q,
    	datab	 => DataPath_Mux1_im_0_norm_DataPath_Add_I_add_f_1_q,
    	result	 => DataPath_Add_I_add_f_q
   	);
    DataPath_Add_I_add_f_p <= not DataPath_Add_I_add_f_q(41 downto 41);
    DataPath_Add_I_add_f_n <= DataPath_Add_I_add_f_q(41 downto 41);
    -- synopsys translate off
    DataPath_Add_I_add_f_a_real <= sInternal_2_real(DataPath_ConjMult1_Sub_R_sub_f_q);
    DataPath_Add_I_add_f_b_real <= sInternal_2_real(DataPath_Mux1_im_0_norm_DataPath_Add_I_add_f_1_q);
    DataPath_Add_I_add_f_q_real <= sInternal_2_real(DataPath_Add_I_add_f_q);
    -- synopsys translate on

	--DataPath_AutoMinDelay1_im_im_replace_wrreg(REG,651)
    DataPath_AutoMinDelay1_im_im_replace_wrreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            DataPath_AutoMinDelay1_im_im_replace_wrreg_q <= "000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            DataPath_AutoMinDelay1_im_im_replace_wrreg_q <= DataPath_AutoMinDelay1_im_im_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--DataPath_AutoMinDelay1_im_im_replace_rdcnt(COUNTER,650)
    -- every=1, low=0, high=6, step=1, init=1
    DataPath_AutoMinDelay1_im_im_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            DataPath_AutoMinDelay1_im_im_replace_rdcnt_i <= TO_UNSIGNED(1,3);
            DataPath_AutoMinDelay1_im_im_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF DataPath_AutoMinDelay1_im_im_replace_rdcnt_i = 5 THEN
                  DataPath_AutoMinDelay1_im_im_replace_rdcnt_eq <= '1';
                ELSE
                  DataPath_AutoMinDelay1_im_im_replace_rdcnt_eq <= '0';
                END IF;
                IF (DataPath_AutoMinDelay1_im_im_replace_rdcnt_eq = '1') THEN
                    DataPath_AutoMinDelay1_im_im_replace_rdcnt_i <= DataPath_AutoMinDelay1_im_im_replace_rdcnt_i - 6;
                ELSE
                    DataPath_AutoMinDelay1_im_im_replace_rdcnt_i <= DataPath_AutoMinDelay1_im_im_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    DataPath_AutoMinDelay1_im_im_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(DataPath_AutoMinDelay1_im_im_replace_rdcnt_i,3));


	--DataPath_AutoMinDelay1_im_im_replace_mem(DUALMEM,649)
    DataPath_AutoMinDelay1_im_im_replace_mem_reset0 <= areset;
    DataPath_AutoMinDelay1_im_im_replace_mem_ia <= DataPath_Add_I_add_f_q;
    DataPath_AutoMinDelay1_im_im_replace_mem_aa <= DataPath_AutoMinDelay1_im_im_replace_wrreg_q;
    DataPath_AutoMinDelay1_im_im_replace_mem_ab <= DataPath_AutoMinDelay1_im_im_replace_rdcnt_q;
    DataPath_AutoMinDelay1_im_im_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 45,
        widthad_a => 3,
        numwords_a => 7,
        width_b => 45,
        widthad_b => 3,
        numwords_b => 7,
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
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken1 => DataPath_AutoMinDelay1_im_im_enaAnd_q(0),
        clocken0 => VCC_q(0),
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => DataPath_AutoMinDelay1_im_im_replace_mem_reset0,
        clock1 => clk,
        address_b => DataPath_AutoMinDelay1_im_im_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => DataPath_AutoMinDelay1_im_im_replace_mem_iq,
        address_a => DataPath_AutoMinDelay1_im_im_replace_mem_aa,
        data_a => DataPath_AutoMinDelay1_im_im_replace_mem_ia
    );
        DataPath_AutoMinDelay1_im_im_replace_mem_q <= DataPath_AutoMinDelay1_im_im_replace_mem_iq(44 downto 0);

	--ld_DataPath_AutoMinDelay_q_to_DataPath_AccFifo_im_v(DELAY,462)@5
    ld_DataPath_AutoMinDelay_q_to_DataPath_AccFifo_im_v : dspba_delay
    GENERIC MAP ( width => 1, depth => 8 )
    PORT MAP ( xin => DataPath_AutoMinDelay_q, xout => ld_DataPath_AutoMinDelay_q_to_DataPath_AccFifo_im_v_q, clk => clk, aclr => areset );

	--DataPath_AccFifo_im(FIFO,123)@13
    DataPath_AccFifo_im_reset <= areset;

    DataPath_AccFifo_im_fifo : scfifo
    GENERIC MAP (
      add_ram_output_register => "ON",
      almost_empty_value => 1,
      almost_full_value => 401,
      intended_device_family => "Stratix IV",
      lpm_numwords => 402,
      lpm_showahead => "ON",
      lpm_type => "scfifo",
      lpm_width => 45,
      lpm_widthu => 9,
      overflow_checking => "ON",
      underflow_checking => "ON",
      use_eab => "ON"
    )
    PORT MAP (
      rdreq => ld_SyncFifo_And6_q_to_DataPath_AccFifo_im_r_q(0),
      aclr => DataPath_AccFifo_im_reset,
      clock => clk,
      wrreq => ld_DataPath_AutoMinDelay_q_to_DataPath_AccFifo_im_v_q(0),
      data => DataPath_AutoMinDelay1_im_im_replace_mem_q,
      almost_full => DataPath_AccFifo_im_f(0),
      almost_empty => DataPath_AccFifo_im_t(0),
      empty => DataPath_AccFifo_im_empty(0),
      q => DataPath_AccFifo_im_q
    );
    DataPath_AccFifo_im_v <= not DataPath_AccFifo_im_empty;
    DataPath_AccFifo_im_e <= not DataPath_AccFifo_im_t;

	--ld_SyncFifo_Or_q_to_SyncFifo_And4_b(DELAY,530)@5
    ld_SyncFifo_Or_q_to_SyncFifo_And4_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 7 )
    PORT MAP ( xin => SyncFifo_Or_q, xout => ld_SyncFifo_Or_q_to_SyncFifo_And4_b_q, clk => clk, aclr => areset );

	--SyncFifo_BitExtract1_1(BITSELECT,202)@5
    SyncFifo_BitExtract1_1_in <= SyncFifo_FIFO1_q;
    SyncFifo_BitExtract1_1_b <= SyncFifo_BitExtract1_1_in(1 downto 1);

	--ld_SyncFifo_BitExtract1_1_b_to_SyncFifo_And4_a(DELAY,529)@5
    ld_SyncFifo_BitExtract1_1_b_to_SyncFifo_And4_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 7 )
    PORT MAP ( xin => SyncFifo_BitExtract1_1_b, xout => ld_SyncFifo_BitExtract1_1_b_to_SyncFifo_And4_a_q, clk => clk, aclr => areset );

	--SyncFifo_And4(LOGICAL,197)@12
    SyncFifo_And4_a <= ld_SyncFifo_BitExtract1_1_b_to_SyncFifo_And4_a_q;
    SyncFifo_And4_b <= ld_SyncFifo_Or_q_to_SyncFifo_And4_b_q;
    SyncFifo_And4_q <= SyncFifo_And4_a and SyncFifo_And4_b;

	--ld_SyncFifo_And4_q_to_DataPath_Mux_im_b(DELAY,468)@12
    ld_SyncFifo_And4_q_to_DataPath_Mux_im_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => SyncFifo_And4_q, xout => ld_SyncFifo_And4_q_to_DataPath_Mux_im_b_q, clk => clk, aclr => areset );

	--DataPath_Mux_im(MUX,150)@13
    DataPath_Mux_im_s <= ld_SyncFifo_And4_q_to_DataPath_Mux_im_b_q;
    DataPath_Mux_im: PROCESS (DataPath_Mux_im_s, DataPath_AccFifo_im_q, DataPath_Mux_im_3_cast_q_const_q)
    BEGIN
            CASE DataPath_Mux_im_s IS
                  WHEN "0" => DataPath_Mux_im_q <= DataPath_AccFifo_im_q;
                  WHEN "1" => DataPath_Mux_im_q <= DataPath_Mux_im_3_cast_q_const_q;
                  WHEN OTHERS => DataPath_Mux_im_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_SyncFifo_FIFO_im_q_to_DataPath_x_top_I_sub_f_0_cast_a(DELAY,612)@9
    ld_SyncFifo_FIFO_im_q_to_DataPath_x_top_I_sub_f_0_cast_a : dspba_delay
    GENERIC MAP ( width => 32, depth => 2 )
    PORT MAP ( xin => SyncFifo_FIFO_im_q, xout => ld_SyncFifo_FIFO_im_q_to_DataPath_x_top_I_sub_f_0_cast_a_q, clk => clk, aclr => areset );

	--DataPath_x_top_I_sub_f_0_cast(FLOATCAST,254)@11
    DataPath_x_top_I_sub_f_0_cast_reset <= areset;
    DataPath_x_top_I_sub_f_0_cast_a <= ld_SyncFifo_FIFO_im_q_to_DataPath_x_top_I_sub_f_0_cast_a_q;
    DataPath_x_top_I_sub_f_0_cast_inst : cast_sIEEE_2_sInternal
      PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => DataPath_x_top_I_sub_f_0_cast_reset,
    		dataa	 => DataPath_x_top_I_sub_f_0_cast_a,
    		result	 => DataPath_x_top_I_sub_f_0_cast_q
    	);
    -- synopsys translate off
    DataPath_x_top_I_sub_f_0_cast_q_real <= sInternal_2_real(DataPath_x_top_I_sub_f_0_cast_q);
    -- synopsys translate on

	--DataPath_x_top_I_sub_f(FLOATADDSUB,240)@13
    DataPath_x_top_I_sub_f_reset <= areset;
    DataPath_x_top_I_sub_f_add_sub	 <= not GND_q;
    DataPath_x_top_I_sub_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '1'
    ) PORT MAP (
    	add_sub	 => DataPath_x_top_I_sub_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => DataPath_x_top_I_sub_f_reset,
    	dataa	 => DataPath_x_top_I_sub_f_0_cast_q,
    	datab	 => DataPath_Mux_im_q,
    	result	 => DataPath_x_top_I_sub_f_q
   	);
    DataPath_x_top_I_sub_f_p <= not DataPath_x_top_I_sub_f_q(41 downto 41);
    DataPath_x_top_I_sub_f_n <= DataPath_x_top_I_sub_f_q(41 downto 41);
    -- synopsys translate off
    DataPath_x_top_I_sub_f_a_real <= sInternal_2_real(DataPath_x_top_I_sub_f_0_cast_q);
    DataPath_x_top_I_sub_f_b_real <= sInternal_2_real(DataPath_Mux_im_q);
    DataPath_x_top_I_sub_f_q_real <= sInternal_2_real(DataPath_x_top_I_sub_f_q);
    -- synopsys translate on

	--ld_DataPath_x_top_I_sub_f_q_to_DataPath_Mult_aI_x_bI_f_0_cast_a(DELAY,608)@18
    ld_DataPath_x_top_I_sub_f_q_to_DataPath_Mult_aI_x_bI_f_0_cast_a : dspba_delay
    GENERIC MAP ( width => 45, depth => 1 )
    PORT MAP ( xin => DataPath_x_top_I_sub_f_q, xout => ld_DataPath_x_top_I_sub_f_q_to_DataPath_Mult_aI_x_bI_f_0_cast_a_q, clk => clk, aclr => areset );

	--DataPath_Mult_aI_x_bI_f_0_cast(FLOATCAST,250)@19
    DataPath_Mult_aI_x_bI_f_0_cast_reset <= areset;
    DataPath_Mult_aI_x_bI_f_0_cast_a <= ld_DataPath_x_top_I_sub_f_q_to_DataPath_Mult_aI_x_bI_f_0_cast_a_q;
    DataPath_Mult_aI_x_bI_f_0_cast_inst : cast_sInternal_2_sNorm
      PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => DataPath_Mult_aI_x_bI_f_0_cast_reset,
    		dataa	 => DataPath_Mult_aI_x_bI_f_0_cast_a,
    		result	 => DataPath_Mult_aI_x_bI_f_0_cast_q
    	);
    -- synopsys translate off
    DataPath_Mult_aI_x_bI_f_0_cast_q_real <= sNorm_2_real(DataPath_Mult_aI_x_bI_f_0_cast_q);
    -- synopsys translate on

	--DataPath_Mult_aI_x_bR_f(FLOATMULT,238)@23
    DataPath_Mult_aI_x_bR_f_reset <= areset;
    DataPath_Mult_aI_x_bR_f_inst : fp_mult_sNorm_2_sInternal
        GENERIC MAP ( m_family => "Stratix IV")
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => DataPath_Mult_aI_x_bR_f_reset,
    		dataa	 => DataPath_Mult_aI_x_bI_f_0_cast_q,
    		datab	 => DataPath_Mult_aR_x_bR_f_1_cast_q,
    		result	 => DataPath_Mult_aI_x_bR_f_q
    	);
    -- synopsys translate off
    DataPath_Mult_aI_x_bR_f_a_real <= sNorm_2_real(DataPath_Mult_aI_x_bI_f_0_cast_q);
    DataPath_Mult_aI_x_bR_f_b_real <= sNorm_2_real(DataPath_Mult_aR_x_bR_f_1_cast_q);
    DataPath_Mult_aI_x_bR_f_q_real <= sInternal_2_real(DataPath_Mult_aI_x_bR_f_q);
    -- synopsys translate on

	--ld_SyncFifo_FIFO2_im_q_to_DataPath_Mult_aI_x_bI_f_1_cast_a_replace_mem(DUALMEM,766)
    ld_SyncFifo_FIFO2_im_q_to_DataPath_Mult_aI_x_bI_f_1_cast_a_replace_mem_reset0 <= areset;
    ld_SyncFifo_FIFO2_im_q_to_DataPath_Mult_aI_x_bI_f_1_cast_a_replace_mem_ia <= SyncFifo_FIFO2_im_q;
    ld_SyncFifo_FIFO2_im_q_to_DataPath_Mult_aI_x_bI_f_1_cast_a_replace_mem_aa <= ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_wrreg_q;
    ld_SyncFifo_FIFO2_im_q_to_DataPath_Mult_aI_x_bI_f_1_cast_a_replace_mem_ab <= ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_replace_rdcnt_q;
    ld_SyncFifo_FIFO2_im_q_to_DataPath_Mult_aI_x_bI_f_1_cast_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 4,
        numwords_a => 11,
        width_b => 32,
        widthad_b => 4,
        numwords_b => 11,
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
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken1 => ld_SyncFifo_FIFO2_re_q_to_DataPath_Mult_aR_x_bR_f_1_cast_a_enaAnd_q(0),
        clocken0 => VCC_q(0),
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_SyncFifo_FIFO2_im_q_to_DataPath_Mult_aI_x_bI_f_1_cast_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_SyncFifo_FIFO2_im_q_to_DataPath_Mult_aI_x_bI_f_1_cast_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_SyncFifo_FIFO2_im_q_to_DataPath_Mult_aI_x_bI_f_1_cast_a_replace_mem_iq,
        address_a => ld_SyncFifo_FIFO2_im_q_to_DataPath_Mult_aI_x_bI_f_1_cast_a_replace_mem_aa,
        data_a => ld_SyncFifo_FIFO2_im_q_to_DataPath_Mult_aI_x_bI_f_1_cast_a_replace_mem_ia
    );
        ld_SyncFifo_FIFO2_im_q_to_DataPath_Mult_aI_x_bI_f_1_cast_a_replace_mem_q <= ld_SyncFifo_FIFO2_im_q_to_DataPath_Mult_aI_x_bI_f_1_cast_a_replace_mem_iq(31 downto 0);

	--DataPath_Mult_aI_x_bI_f_1_cast(FLOATCAST,251)@21
    DataPath_Mult_aI_x_bI_f_1_cast_reset <= areset;
    DataPath_Mult_aI_x_bI_f_1_cast_a <= ld_SyncFifo_FIFO2_im_q_to_DataPath_Mult_aI_x_bI_f_1_cast_a_replace_mem_q;
    DataPath_Mult_aI_x_bI_f_1_cast_inst : cast_sIEEE_2_sNorm
      PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => DataPath_Mult_aI_x_bI_f_1_cast_reset,
    		dataa	 => DataPath_Mult_aI_x_bI_f_1_cast_a,
    		result	 => DataPath_Mult_aI_x_bI_f_1_cast_q
    	);
    -- synopsys translate off
    DataPath_Mult_aI_x_bI_f_1_cast_q_real <= sNorm_2_real(DataPath_Mult_aI_x_bI_f_1_cast_q);
    -- synopsys translate on

	--DataPath_Mux_re(MUX,149)@12
    DataPath_Mux_re_s <= SyncFifo_And4_q;
    DataPath_Mux_re: PROCESS (DataPath_Mux_re_s, DataPath_Mux_re_2_cast_q, DataPath_Const1_q)
    BEGIN
            CASE DataPath_Mux_re_s IS
                  WHEN "0" => DataPath_Mux_re_q <= DataPath_Mux_re_2_cast_q;
                  WHEN "1" => DataPath_Mux_re_q <= DataPath_Const1_q;
                  WHEN OTHERS => DataPath_Mux_re_q <= (others => '0');
            END CASE;
    END PROCESS;


	--DataPath_x_top_R_sub_f_1_cast(FLOATCAST,253)@12
    DataPath_x_top_R_sub_f_1_cast_reset <= areset;
    DataPath_x_top_R_sub_f_1_cast_a <= DataPath_Mux_re_q;
    DataPath_x_top_R_sub_f_1_cast_inst : cast_sIEEE_2_sInternal
      PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => DataPath_x_top_R_sub_f_1_cast_reset,
    		dataa	 => DataPath_x_top_R_sub_f_1_cast_a,
    		result	 => DataPath_x_top_R_sub_f_1_cast_q
    	);
    -- synopsys translate off
    DataPath_x_top_R_sub_f_1_cast_q_real <= sInternal_2_real(DataPath_x_top_R_sub_f_1_cast_q);
    -- synopsys translate on

	--ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_nor(LOGICAL,781)
    ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_nor_a <= AutoMinDelay_notEnable_q;
    ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_nor_b <= ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_sticky_ena_q;
    ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_nor_q <= not (ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_nor_a or ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_nor_b);

	--ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_cmpReg(REG,779)
    ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_cmpReg_q <= VCC_q;
        END IF;
    END PROCESS;


	--ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_sticky_ena(REG,782)
    ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_nor_q = "1") THEN
                ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_sticky_ena_q <= ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_enaAnd(LOGICAL,783)
    ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_enaAnd_a <= ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_sticky_ena_q;
    ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_enaAnd_b <= VCC_q;
    ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_enaAnd_q <= ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_enaAnd_a and ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_enaAnd_b;

	--ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_wrreg(REG,778)
    ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_wrreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_wrreg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_wrreg_q <= ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_rdcnt(COUNTER,777)
    -- every=1, low=0, high=1, step=1, init=1
    ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_rdcnt_i <= TO_UNSIGNED(1,1);
        ELSIF (clk'EVENT AND clk = '1') THEN
                ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_rdcnt_i <= ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_rdcnt_i + 1;
        END IF;
    END PROCESS;
    ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_rdcnt_i,1));


	--ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_mem(DUALMEM,776)
    ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_mem_reset0 <= areset;
    ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_mem_ia <= SyncFifo_FIFO_re_q;
    ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_mem_aa <= ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_wrreg_q;
    ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_mem_ab <= ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_rdcnt_q;
    ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 32,
        widthad_b => 1,
        numwords_b => 2,
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
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken1 => ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_enaAnd_q(0),
        clocken0 => VCC_q(0),
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_mem_iq,
        address_a => ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_mem_aa,
        data_a => ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_mem_ia
    );
        ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_mem_q <= ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_mem_iq(31 downto 0);

	--DataPath_x_top_R_sub_f_0_cast(FLOATCAST,252)@12
    DataPath_x_top_R_sub_f_0_cast_reset <= areset;
    DataPath_x_top_R_sub_f_0_cast_a <= ld_SyncFifo_FIFO_re_q_to_DataPath_x_top_R_sub_f_0_cast_a_replace_mem_q;
    DataPath_x_top_R_sub_f_0_cast_inst : cast_sIEEE_2_sInternal
      PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => DataPath_x_top_R_sub_f_0_cast_reset,
    		dataa	 => DataPath_x_top_R_sub_f_0_cast_a,
    		result	 => DataPath_x_top_R_sub_f_0_cast_q
    	);
    -- synopsys translate off
    DataPath_x_top_R_sub_f_0_cast_q_real <= sInternal_2_real(DataPath_x_top_R_sub_f_0_cast_q);
    -- synopsys translate on

	--DataPath_x_top_R_sub_f(FLOATADDSUB,239)@14
    DataPath_x_top_R_sub_f_reset <= areset;
    DataPath_x_top_R_sub_f_add_sub	 <= not GND_q;
    DataPath_x_top_R_sub_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '1'
    ) PORT MAP (
    	add_sub	 => DataPath_x_top_R_sub_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => DataPath_x_top_R_sub_f_reset,
    	dataa	 => DataPath_x_top_R_sub_f_0_cast_q,
    	datab	 => DataPath_x_top_R_sub_f_1_cast_q,
    	result	 => DataPath_x_top_R_sub_f_q
   	);
    DataPath_x_top_R_sub_f_p <= not DataPath_x_top_R_sub_f_q(41 downto 41);
    DataPath_x_top_R_sub_f_n <= DataPath_x_top_R_sub_f_q(41 downto 41);
    -- synopsys translate off
    DataPath_x_top_R_sub_f_a_real <= sInternal_2_real(DataPath_x_top_R_sub_f_0_cast_q);
    DataPath_x_top_R_sub_f_b_real <= sInternal_2_real(DataPath_x_top_R_sub_f_1_cast_q);
    DataPath_x_top_R_sub_f_q_real <= sInternal_2_real(DataPath_x_top_R_sub_f_q);
    -- synopsys translate on

	--DataPath_Mult_aR_x_bR_f_0_cast(FLOATCAST,248)@19
    DataPath_Mult_aR_x_bR_f_0_cast_reset <= areset;
    DataPath_Mult_aR_x_bR_f_0_cast_a <= DataPath_x_top_R_sub_f_q;
    DataPath_Mult_aR_x_bR_f_0_cast_inst : cast_sInternal_2_sNorm
      PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => DataPath_Mult_aR_x_bR_f_0_cast_reset,
    		dataa	 => DataPath_Mult_aR_x_bR_f_0_cast_a,
    		result	 => DataPath_Mult_aR_x_bR_f_0_cast_q
    	);
    -- synopsys translate off
    DataPath_Mult_aR_x_bR_f_0_cast_q_real <= sNorm_2_real(DataPath_Mult_aR_x_bR_f_0_cast_q);
    -- synopsys translate on

	--DataPath_Mult_aR_x_bI_f(FLOATMULT,237)@23
    DataPath_Mult_aR_x_bI_f_reset <= areset;
    DataPath_Mult_aR_x_bI_f_inst : fp_mult_sNorm_2_sInternal
        GENERIC MAP ( m_family => "Stratix IV")
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => DataPath_Mult_aR_x_bI_f_reset,
    		dataa	 => DataPath_Mult_aR_x_bR_f_0_cast_q,
    		datab	 => DataPath_Mult_aI_x_bI_f_1_cast_q,
    		result	 => DataPath_Mult_aR_x_bI_f_q
    	);
    -- synopsys translate off
    DataPath_Mult_aR_x_bI_f_a_real <= sNorm_2_real(DataPath_Mult_aR_x_bR_f_0_cast_q);
    DataPath_Mult_aR_x_bI_f_b_real <= sNorm_2_real(DataPath_Mult_aI_x_bI_f_1_cast_q);
    DataPath_Mult_aR_x_bI_f_q_real <= sInternal_2_real(DataPath_Mult_aR_x_bI_f_q);
    -- synopsys translate on

	--DataPath_Mult_I_add_f(FLOATADDSUB,234)@26
    DataPath_Mult_I_add_f_reset <= areset;
    DataPath_Mult_I_add_f_add_sub	 <= not VCC_q;
    DataPath_Mult_I_add_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => DataPath_Mult_I_add_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => DataPath_Mult_I_add_f_reset,
    	dataa	 => DataPath_Mult_aR_x_bI_f_q,
    	datab	 => DataPath_Mult_aI_x_bR_f_q,
    	result	 => DataPath_Mult_I_add_f_q
   	);
    DataPath_Mult_I_add_f_p <= not DataPath_Mult_I_add_f_q(41 downto 41);
    DataPath_Mult_I_add_f_n <= DataPath_Mult_I_add_f_q(41 downto 41);
    -- synopsys translate off
    DataPath_Mult_I_add_f_a_real <= sInternal_2_real(DataPath_Mult_aR_x_bI_f_q);
    DataPath_Mult_I_add_f_b_real <= sInternal_2_real(DataPath_Mult_aI_x_bR_f_q);
    DataPath_Mult_I_add_f_q_real <= sInternal_2_real(DataPath_Mult_I_add_f_q);
    -- synopsys translate on

	--InPort_WrBack_Input_WrBk_Mux_Mux3_im_3_cast(FLOATCAST,246)@0
    InPort_WrBack_Input_WrBk_Mux_Mux3_im_3_cast_reset <= areset;
    InPort_WrBack_Input_WrBk_Mux_Mux3_im_3_cast_a <= DataPath_Mult_I_add_f_q;
    InPort_WrBack_Input_WrBk_Mux_Mux3_im_3_cast_inst : cast_sInternal_2_sIEEE
      PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => InPort_WrBack_Input_WrBk_Mux_Mux3_im_3_cast_reset,
    		dataa	 => InPort_WrBack_Input_WrBk_Mux_Mux3_im_3_cast_a,
    		result	 => InPort_WrBack_Input_WrBk_Mux_Mux3_im_3_cast_q
    	);
    -- synopsys translate off
    InPort_WrBack_Input_WrBk_Mux_Mux3_im_3_cast_q_real <= sIEEE_2_real(InPort_WrBack_Input_WrBk_Mux_Mux3_im_3_cast_q);
    -- synopsys translate on

	--InPort_WrBack_InPort_FIFO2_re(FIFO,167)@6
    InPort_WrBack_InPort_FIFO2_re_reset <= areset;

    InPort_WrBack_InPort_FIFO2_re_fifo : scfifo
    GENERIC MAP (
      add_ram_output_register => "ON",
      almost_empty_value => 4,
      almost_full_value => 399,
      intended_device_family => "Stratix IV",
      lpm_numwords => 400,
      lpm_showahead => "ON",
      lpm_type => "scfifo",
      lpm_width => 32,
      lpm_widthu => 9,
      overflow_checking => "ON",
      underflow_checking => "ON",
      use_eab => "ON"
    )
    PORT MAP (
      rdreq => InPort_WrBack_InPort_And_q(0),
      aclr => InPort_WrBack_InPort_FIFO2_re_reset,
      clock => clk,
      wrreq => ld_ChannelIn_y_v_s_to_InPort_WrBack_InPort_FIFO1_v_q(0),
      data => ld_ChannelIn_Lij_y_re_to_InPort_WrBack_InPort_FIFO2_re_d_replace_mem_q,
      almost_full => InPort_WrBack_InPort_FIFO2_re_f(0),
      almost_empty => InPort_WrBack_InPort_FIFO2_re_t(0),
      empty => InPort_WrBack_InPort_FIFO2_re_empty(0),
      q => InPort_WrBack_InPort_FIFO2_re_q
    );
    InPort_WrBack_InPort_FIFO2_re_v <= not InPort_WrBack_InPort_FIFO2_re_empty;
    InPort_WrBack_InPort_FIFO2_re_e <= not InPort_WrBack_InPort_FIFO2_re_t;

	--Control_CmdFifo_Detect_Done_Not2(LOGICAL,34)@6
    Control_CmdFifo_Detect_Done_Not2_a <= AutoMinDelay_replace_mem_q;
    Control_CmdFifo_Detect_Done_Not2_q <= not Control_CmdFifo_Detect_Done_Not2_a;

	--InPort_WrBack_InPort_And(LOGICAL,160)@6
    InPort_WrBack_InPort_And_a <= Control_CmdFifo_Detect_Done_Not2_q;
    InPort_WrBack_InPort_And_b <= InPort_WrBack_InPort_FIFO2_re_v;
    InPort_WrBack_InPort_And_q <= InPort_WrBack_InPort_And_a and InPort_WrBack_InPort_And_b;

	--ld_ChannelIn_y_v_s_to_InPort_WrBack_InPort_FIFO1_v(DELAY,484)@2
    ld_ChannelIn_y_v_s_to_InPort_WrBack_InPort_FIFO1_v : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => y_v_s, xout => ld_ChannelIn_y_v_s_to_InPort_WrBack_InPort_FIFO1_v_q, clk => clk, aclr => areset );

	--InPort_WrBack_InPort_FIFO2_im(FIFO,168)@6
    InPort_WrBack_InPort_FIFO2_im_reset <= areset;

    InPort_WrBack_InPort_FIFO2_im_fifo : scfifo
    GENERIC MAP (
      add_ram_output_register => "ON",
      almost_empty_value => 4,
      almost_full_value => 399,
      intended_device_family => "Stratix IV",
      lpm_numwords => 400,
      lpm_showahead => "ON",
      lpm_type => "scfifo",
      lpm_width => 32,
      lpm_widthu => 9,
      overflow_checking => "ON",
      underflow_checking => "ON",
      use_eab => "ON"
    )
    PORT MAP (
      rdreq => InPort_WrBack_InPort_And_q(0),
      aclr => InPort_WrBack_InPort_FIFO2_im_reset,
      clock => clk,
      wrreq => ld_ChannelIn_y_v_s_to_InPort_WrBack_InPort_FIFO1_v_q(0),
      data => ld_ChannelIn_Lij_y_im_to_InPort_WrBack_InPort_FIFO2_im_d_replace_mem_q,
      almost_full => InPort_WrBack_InPort_FIFO2_im_f(0),
      almost_empty => InPort_WrBack_InPort_FIFO2_im_t(0),
      empty => InPort_WrBack_InPort_FIFO2_im_empty(0),
      q => InPort_WrBack_InPort_FIFO2_im_q
    );
    InPort_WrBack_InPort_FIFO2_im_v <= not InPort_WrBack_InPort_FIFO2_im_empty;
    InPort_WrBack_InPort_FIFO2_im_e <= not InPort_WrBack_InPort_FIFO2_im_t;

	--ld_InPort_WrBack_InPort_FIFO2_im_q_to_InPort_WrBack_Input_WrBk_Mux_Mux3_im_c(DELAY,504)@6
    ld_InPort_WrBack_InPort_FIFO2_im_q_to_InPort_WrBack_Input_WrBk_Mux_Mux3_im_c : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => InPort_WrBack_InPort_FIFO2_im_q, xout => ld_InPort_WrBack_InPort_FIFO2_im_q_to_InPort_WrBack_Input_WrBk_Mux_Mux3_im_c_q, clk => clk, aclr => areset );

	--ld_AutoMinDelay_q_to_InPort_WrBack_Input_WrBk_Mux_Mux2_b(DELAY,497)@6
    ld_AutoMinDelay_q_to_InPort_WrBack_Input_WrBk_Mux_Mux2_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => AutoMinDelay_replace_mem_q, xout => ld_AutoMinDelay_q_to_InPort_WrBack_Input_WrBk_Mux_Mux2_b_q, clk => clk, aclr => areset );

	--InPort_WrBack_Input_WrBk_Mux_Mux3_im(MUX,179)@7
    InPort_WrBack_Input_WrBk_Mux_Mux3_im_s <= ld_AutoMinDelay_q_to_InPort_WrBack_Input_WrBk_Mux_Mux2_b_q;
    InPort_WrBack_Input_WrBk_Mux_Mux3_im: PROCESS (InPort_WrBack_Input_WrBk_Mux_Mux3_im_s, ld_InPort_WrBack_InPort_FIFO2_im_q_to_InPort_WrBack_Input_WrBk_Mux_Mux3_im_c_q, InPort_WrBack_Input_WrBk_Mux_Mux3_im_3_cast_q)
    BEGIN
            CASE InPort_WrBack_Input_WrBk_Mux_Mux3_im_s IS
                  WHEN "0" => InPort_WrBack_Input_WrBk_Mux_Mux3_im_q <= ld_InPort_WrBack_InPort_FIFO2_im_q_to_InPort_WrBack_Input_WrBk_Mux_Mux3_im_c_q;
                  WHEN "1" => InPort_WrBack_Input_WrBk_Mux_Mux3_im_q <= InPort_WrBack_Input_WrBk_Mux_Mux3_im_3_cast_q;
                  WHEN OTHERS => InPort_WrBack_Input_WrBk_Mux_Mux3_im_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_Control_CmdFifo_FIFO_WrBkAddr_q_to_InPort_WrBack_Input_WrBk_Mux_Mux2_d(DELAY,499)@6
    ld_Control_CmdFifo_FIFO_WrBkAddr_q_to_InPort_WrBack_Input_WrBk_Mux_Mux2_d : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => Control_CmdFifo_FIFO_WrBkAddr_q, xout => ld_Control_CmdFifo_FIFO_WrBkAddr_q_to_InPort_WrBack_Input_WrBk_Mux_Mux2_d_q, clk => clk, aclr => areset );

	--InPort_WrBack_InPort_Mult1_shift2(BITSHIFT,275)@2
    InPort_WrBack_InPort_Mult1_shift2_q_int <= ChIdx_s & "0000";
    InPort_WrBack_InPort_Mult1_shift2_q <= InPort_WrBack_InPort_Mult1_shift2_q_int(11 downto 0);

	--InPort_WrBack_InPort_Mult1_shift0(BITSHIFT,273)@2
    InPort_WrBack_InPort_Mult1_shift0_q_int <= ChIdx_s & "000";
    InPort_WrBack_InPort_Mult1_shift0_q <= InPort_WrBack_InPort_Mult1_shift0_q_int(10 downto 0);

	--InPort_WrBack_InPort_Mult1_add_1(ADD,274)@2
    InPort_WrBack_InPort_Mult1_add_1_a <= STD_LOGIC_VECTOR("0000" & ChIdx_s);
    InPort_WrBack_InPort_Mult1_add_1_b <= STD_LOGIC_VECTOR("0" & InPort_WrBack_InPort_Mult1_shift0_q);
            InPort_WrBack_InPort_Mult1_add_1_o <= STD_LOGIC_VECTOR(UNSIGNED(InPort_WrBack_InPort_Mult1_add_1_a) + UNSIGNED(InPort_WrBack_InPort_Mult1_add_1_b));
    InPort_WrBack_InPort_Mult1_add_1_q <= InPort_WrBack_InPort_Mult1_add_1_o(11 downto 0);


	--InPort_WrBack_InPort_Mult1_add_3(ADD,276)@2
    InPort_WrBack_InPort_Mult1_add_3_a <= STD_LOGIC_VECTOR("0" & InPort_WrBack_InPort_Mult1_add_1_q);
    InPort_WrBack_InPort_Mult1_add_3_b <= STD_LOGIC_VECTOR("0" & InPort_WrBack_InPort_Mult1_shift2_q);
            InPort_WrBack_InPort_Mult1_add_3_o <= STD_LOGIC_VECTOR(UNSIGNED(InPort_WrBack_InPort_Mult1_add_3_a) + UNSIGNED(InPort_WrBack_InPort_Mult1_add_3_b));
    InPort_WrBack_InPort_Mult1_add_3_q <= InPort_WrBack_InPort_Mult1_add_3_o(12 downto 0);


	--InPort_WrBack_InPort_Mult1_shift4(BITSHIFT,277)@2
    InPort_WrBack_InPort_Mult1_shift4_q_int <= InPort_WrBack_InPort_Mult1_add_3_q & "000";
    InPort_WrBack_InPort_Mult1_shift4_q <= InPort_WrBack_InPort_Mult1_shift4_q_int(15 downto 0);

	--reg_InPort_WrBack_InPort_Mult1_shift4_0_to_InPort_WrBack_InPort_Add3_add_1(REG,302)@2
    reg_InPort_WrBack_InPort_Mult1_shift4_0_to_InPort_WrBack_InPort_Add3_add_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_InPort_WrBack_InPort_Mult1_shift4_0_to_InPort_WrBack_InPort_Add3_add_1_q <= "0000000000000000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_InPort_WrBack_InPort_Mult1_shift4_0_to_InPort_WrBack_InPort_Add3_add_1_q <= InPort_WrBack_InPort_Mult1_shift4_q;
        END IF;
    END PROCESS;


	--ld_ChannelIn_ColumnIdx_s_to_InPort_WrBack_InPort_Add3_add_a(DELAY,479)@2
    ld_ChannelIn_ColumnIdx_s_to_InPort_WrBack_InPort_Add3_add_a : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => ColumnIdx_s, xout => ld_ChannelIn_ColumnIdx_s_to_InPort_WrBack_InPort_Add3_add_a_q, clk => clk, aclr => areset );

	--InPort_WrBack_InPort_Add3_add(ADD,159)@3
    InPort_WrBack_InPort_Add3_add_a <= STD_LOGIC_VECTOR("000" & ld_ChannelIn_ColumnIdx_s_to_InPort_WrBack_InPort_Add3_add_a_q);
    InPort_WrBack_InPort_Add3_add_b <= reg_InPort_WrBack_InPort_Mult1_shift4_0_to_InPort_WrBack_InPort_Add3_add_1_q(9 downto 0);
            InPort_WrBack_InPort_Add3_add_o <= STD_LOGIC_VECTOR(UNSIGNED(InPort_WrBack_InPort_Add3_add_a) + UNSIGNED(InPort_WrBack_InPort_Add3_add_b));
    InPort_WrBack_InPort_Add3_add_q <= InPort_WrBack_InPort_Add3_add_o(9 downto 0);


	--InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged(SUB,280)@3
    InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_cin <= GND_q;
    InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_a <= STD_LOGIC_VECTOR("0" & Control_Commands_Const1_q) & '0';
    InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_b <= STD_LOGIC_VECTOR("0" & InPort_WrBack_InPort_Add3_add_q) & InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_cin(0);
    InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_i <= InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_b;
    InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (InPort_WrBack_InPort_Mux_sel_inv_q = "1") THEN
                InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_o <= InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_i;
            ELSE
                InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_o <= STD_LOGIC_VECTOR(UNSIGNED(InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_a) - UNSIGNED(InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_b));
            END IF;
        END IF;
    END PROCESS;
    InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_q <= InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_o(10 downto 1);


	--ld_InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_q_to_InPort_WrBack_InPort_FIFO1_d(DELAY,485)@4
    ld_InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_q_to_InPort_WrBack_InPort_FIFO1_d : dspba_delay
    GENERIC MAP ( width => 10, depth => 2 )
    PORT MAP ( xin => InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_q, xout => ld_InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_q_to_InPort_WrBack_InPort_FIFO1_d_q, clk => clk, aclr => areset );

	--InPort_WrBack_InPort_FIFO1(FIFO,166)@6
    InPort_WrBack_InPort_FIFO1_reset <= areset;

    InPort_WrBack_InPort_FIFO1_fifo : scfifo
    GENERIC MAP (
      add_ram_output_register => "ON",
      almost_empty_value => 4,
      almost_full_value => 399,
      intended_device_family => "Stratix IV",
      lpm_numwords => 400,
      lpm_showahead => "ON",
      lpm_type => "scfifo",
      lpm_width => 10,
      lpm_widthu => 9,
      overflow_checking => "ON",
      underflow_checking => "ON",
      use_eab => "ON"
    )
    PORT MAP (
      rdreq => InPort_WrBack_InPort_And_q(0),
      aclr => InPort_WrBack_InPort_FIFO1_reset,
      clock => clk,
      wrreq => ld_ChannelIn_y_v_s_to_InPort_WrBack_InPort_FIFO1_v_q(0),
      data => ld_InPort_WrBack_InPort_Sub2_R_sub_InPort_WrBack_InPort_WrEnMux_merged_q_to_InPort_WrBack_InPort_FIFO1_d_q,
      almost_full => InPort_WrBack_InPort_FIFO1_f(0),
      almost_empty => InPort_WrBack_InPort_FIFO1_t(0),
      empty => InPort_WrBack_InPort_FIFO1_empty(0),
      q => InPort_WrBack_InPort_FIFO1_q
    );
    InPort_WrBack_InPort_FIFO1_v <= not InPort_WrBack_InPort_FIFO1_empty;
    InPort_WrBack_InPort_FIFO1_e <= not InPort_WrBack_InPort_FIFO1_t;

	--ld_InPort_WrBack_InPort_FIFO1_q_to_InPort_WrBack_Input_WrBk_Mux_Mux2_c(DELAY,498)@6
    ld_InPort_WrBack_InPort_FIFO1_q_to_InPort_WrBack_Input_WrBk_Mux_Mux2_c : dspba_delay
    GENERIC MAP ( width => 10, depth => 1 )
    PORT MAP ( xin => InPort_WrBack_InPort_FIFO1_q, xout => ld_InPort_WrBack_InPort_FIFO1_q_to_InPort_WrBack_Input_WrBk_Mux_Mux2_c_q, clk => clk, aclr => areset );

	--InPort_WrBack_Input_WrBk_Mux_Mux2(MUX,177)@7
    InPort_WrBack_Input_WrBk_Mux_Mux2_s <= ld_AutoMinDelay_q_to_InPort_WrBack_Input_WrBk_Mux_Mux2_b_q;
    InPort_WrBack_Input_WrBk_Mux_Mux2: PROCESS (InPort_WrBack_Input_WrBk_Mux_Mux2_s, ld_InPort_WrBack_InPort_FIFO1_q_to_InPort_WrBack_Input_WrBk_Mux_Mux2_c_q, ld_Control_CmdFifo_FIFO_WrBkAddr_q_to_InPort_WrBack_Input_WrBk_Mux_Mux2_d_q)
    BEGIN
            CASE InPort_WrBack_Input_WrBk_Mux_Mux2_s IS
                  WHEN "0" => InPort_WrBack_Input_WrBk_Mux_Mux2_q <= STD_LOGIC_VECTOR("000000" & ld_InPort_WrBack_InPort_FIFO1_q_to_InPort_WrBack_Input_WrBk_Mux_Mux2_c_q);
                  WHEN "1" => InPort_WrBack_Input_WrBk_Mux_Mux2_q <= ld_Control_CmdFifo_FIFO_WrBkAddr_q_to_InPort_WrBack_Input_WrBk_Mux_Mux2_d_q;
                  WHEN OTHERS => InPort_WrBack_Input_WrBk_Mux_Mux2_q <= (others => '0');
            END CASE;
    END PROCESS;


	--InPort_WrBack_Input_WrBk_Mux_Mux1(MUX,176)@6
    InPort_WrBack_Input_WrBk_Mux_Mux1_s <= AutoMinDelay_replace_mem_q;
    InPort_WrBack_Input_WrBk_Mux_Mux1: PROCESS (InPort_WrBack_Input_WrBk_Mux_Mux1_s, InPort_WrBack_InPort_And_q, AutoMinDelay_replace_mem_q)
    BEGIN
            CASE InPort_WrBack_Input_WrBk_Mux_Mux1_s IS
                  WHEN "0" => InPort_WrBack_Input_WrBk_Mux_Mux1_q <= InPort_WrBack_InPort_And_q;
                  WHEN "1" => InPort_WrBack_Input_WrBk_Mux_Mux1_q <= AutoMinDelay_replace_mem_q;
                  WHEN OTHERS => InPort_WrBack_Input_WrBk_Mux_Mux1_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_InPort_WrBack_Input_WrBk_Mux_Mux1_q_to_yMem_re_b(DELAY,565)@6
    ld_InPort_WrBack_Input_WrBk_Mux_Mux1_q_to_yMem_re_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => InPort_WrBack_Input_WrBk_Mux_Mux1_q, xout => ld_InPort_WrBack_Input_WrBk_Mux_Mux1_q_to_yMem_re_b_q, clk => clk, aclr => areset );

	--ld_Control_CmdFifo_FIFO1_q_to_yMem_re_a(DELAY,564)@6
    ld_Control_CmdFifo_FIFO1_q_to_yMem_re_a : dspba_delay
    GENERIC MAP ( width => 16, depth => 1 )
    PORT MAP ( xin => Control_CmdFifo_FIFO1_q, xout => ld_Control_CmdFifo_FIFO1_q_to_yMem_re_a_q, clk => clk, aclr => areset );

	--yMem_im(DUALMEM,221)@7
    yMem_im_reset0 <= areset;
    yMem_im_ia <= InPort_WrBack_Input_WrBk_Mux_Mux3_im_q;
    yMem_im_aa <= InPort_WrBack_Input_WrBk_Mux_Mux2_q(9 downto 0);
    yMem_im_ab <= ld_Control_CmdFifo_FIFO1_q_to_yMem_re_a_q(9 downto 0);
    yMem_im_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 10,
        numwords_a => 800,
        width_b => 32,
        widthad_b => 10,
        numwords_b => 800,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("cholesky_solver_mc/CholFwBw/BwSub/cholesky_solver_mc_CholFwBw_BwSub_yMem_im.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        wren_a => ld_InPort_WrBack_Input_WrBk_Mux_Mux1_q_to_yMem_re_b_q(0),
        aclr0 => yMem_im_reset0,
        clock0 => clk,
        address_b => yMem_im_ab,
        -- data_b => (others => '0'),
        q_b => yMem_im_iq,
        q_a => yMem_im_ir,
        address_a => yMem_im_aa,
        data_a => yMem_im_ia
    );
        yMem_im_q <= yMem_im_iq(31 downto 0);
        yMem_im_r <= yMem_im_ir(31 downto 0);

	--SyncFifo_FIFO_im(FIFO,207)@9
    SyncFifo_FIFO_im_reset <= areset;

    SyncFifo_FIFO_im_fifo : scfifo
    GENERIC MAP (
      add_ram_output_register => "ON",
      almost_empty_value => 4,
      almost_full_value => 30,
      intended_device_family => "Stratix IV",
      lpm_numwords => 32,
      lpm_showahead => "ON",
      lpm_type => "scfifo",
      lpm_width => 32,
      lpm_widthu => 5,
      overflow_checking => "ON",
      underflow_checking => "ON",
      use_eab => "ON"
    )
    PORT MAP (
      rdreq => ld_SyncFifo_Or_q_to_SyncFifo_And_a_q(0),
      aclr => SyncFifo_FIFO_im_reset,
      clock => clk,
      wrreq => ld_Control_CmdFifo_Or_q_to_SyncFifo_FIFO_re_v_q(0),
      data => yMem_im_q,
      almost_full => SyncFifo_FIFO_im_f(0),
      almost_empty => SyncFifo_FIFO_im_t(0),
      empty => SyncFifo_FIFO_im_empty(0),
      q => SyncFifo_FIFO_im_q
    );
    SyncFifo_FIFO_im_v <= not SyncFifo_FIFO_im_empty;
    SyncFifo_FIFO_im_e <= not SyncFifo_FIFO_im_t;

	--DataPath_ConjMult1_Multii_f(FLOATMULT,227)@9
    DataPath_ConjMult1_Multii_f_reset <= areset;
    DataPath_ConjMult1_Multii_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix IV", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => DataPath_ConjMult1_Multii_f_reset,
    		dataa	 => SyncFifo_FIFO_im_q,
    		datab	 => SyncFifo_FIFO2_im_q,
    		result	 => DataPath_ConjMult1_Multii_f_q
    	);
    -- synopsys translate off
    DataPath_ConjMult1_Multii_f_a_real <= sIEEE_2_real(SyncFifo_FIFO_im_q);
    DataPath_ConjMult1_Multii_f_b_real <= sIEEE_2_real(SyncFifo_FIFO2_im_q);
    DataPath_ConjMult1_Multii_f_q_real <= sInternalSM_2_real(DataPath_ConjMult1_Multii_f_q);
    -- synopsys translate on

	--DataPath_ConjMult1_Multrr_f(FLOATMULT,230)@9
    DataPath_ConjMult1_Multrr_f_reset <= areset;
    DataPath_ConjMult1_Multrr_f_inst : fp_mult_sIEEE_2_sInternalSM
        GENERIC MAP ( m_family => "Stratix IV", m_dotopt => 2)
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => DataPath_ConjMult1_Multrr_f_reset,
    		dataa	 => SyncFifo_FIFO_re_q,
    		datab	 => SyncFifo_FIFO2_re_q,
    		result	 => DataPath_ConjMult1_Multrr_f_q
    	);
    -- synopsys translate off
    DataPath_ConjMult1_Multrr_f_a_real <= sIEEE_2_real(SyncFifo_FIFO_re_q);
    DataPath_ConjMult1_Multrr_f_b_real <= sIEEE_2_real(SyncFifo_FIFO2_re_q);
    DataPath_ConjMult1_Multrr_f_q_real <= sInternalSM_2_real(DataPath_ConjMult1_Multrr_f_q);
    -- synopsys translate on

	--DataPath_ConjMult1_Add1_add_f(FLOATADDSUB,225)@13
    DataPath_ConjMult1_Add1_add_f_reset <= areset;
    DataPath_ConjMult1_Add1_add_f_add_sub	 <= not VCC_q;
    DataPath_ConjMult1_Add1_add_f_inst : fp_addsub_sInternalSM_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => DataPath_ConjMult1_Add1_add_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => DataPath_ConjMult1_Add1_add_f_reset,
    	dataa	 => DataPath_ConjMult1_Multrr_f_q,
    	datab	 => DataPath_ConjMult1_Multii_f_q,
    	result	 => DataPath_ConjMult1_Add1_add_f_q
   	);
    DataPath_ConjMult1_Add1_add_f_p <= not DataPath_ConjMult1_Add1_add_f_q(41 downto 41);
    DataPath_ConjMult1_Add1_add_f_n <= DataPath_ConjMult1_Add1_add_f_q(41 downto 41);
    -- synopsys translate off
    DataPath_ConjMult1_Add1_add_f_a_real <= sInternalSM_2_real(DataPath_ConjMult1_Multrr_f_q);
    DataPath_ConjMult1_Add1_add_f_b_real <= sInternalSM_2_real(DataPath_ConjMult1_Multii_f_q);
    DataPath_ConjMult1_Add1_add_f_q_real <= sInternal_2_real(DataPath_ConjMult1_Add1_add_f_q);
    -- synopsys translate on

	--DataPath_Add_R_add_f(FLOATADDSUB,223)@18
    DataPath_Add_R_add_f_reset <= areset;
    DataPath_Add_R_add_f_add_sub	 <= not VCC_q;
    DataPath_Add_R_add_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '0'
    ) PORT MAP (
    	add_sub	 => DataPath_Add_R_add_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => DataPath_Add_R_add_f_reset,
    	dataa	 => DataPath_ConjMult1_Add1_add_f_q,
    	datab	 => DataPath_Add_R_add_f_1_cast_q,
    	result	 => DataPath_Add_R_add_f_q
   	);
    DataPath_Add_R_add_f_p <= not DataPath_Add_R_add_f_q(41 downto 41);
    DataPath_Add_R_add_f_n <= DataPath_Add_R_add_f_q(41 downto 41);
    -- synopsys translate off
    DataPath_Add_R_add_f_a_real <= sInternal_2_real(DataPath_ConjMult1_Add1_add_f_q);
    DataPath_Add_R_add_f_b_real <= sInternal_2_real(DataPath_Add_R_add_f_1_cast_q);
    DataPath_Add_R_add_f_q_real <= sInternal_2_real(DataPath_Add_R_add_f_q);
    -- synopsys translate on

	--SyncFifo_BitExtract1_2(BITSELECT,203)@5
    SyncFifo_BitExtract1_2_in <= SyncFifo_FIFO1_q;
    SyncFifo_BitExtract1_2_b <= SyncFifo_BitExtract1_2_in(2 downto 2);

	--SyncFifo_And5(LOGICAL,198)@5
    SyncFifo_And5_a <= SyncFifo_BitExtract1_2_b;
    SyncFifo_And5_b <= SyncFifo_Or_q;
    SyncFifo_And5_q <= SyncFifo_And5_a and SyncFifo_And5_b;

	--DataPath_AutoMinDelay(DELAY,127)@5
    DataPath_AutoMinDelay : dspba_delay
    GENERIC MAP ( width => 1, depth => 18 )
    PORT MAP ( xin => SyncFifo_And5_q, xout => DataPath_AutoMinDelay_q, clk => clk, aclr => areset );

	--DataPath_AccFifo_re(FIFO,122)@5
    DataPath_AccFifo_re_reset <= areset;

    DataPath_AccFifo_re_fifo : scfifo
    GENERIC MAP (
      add_ram_output_register => "ON",
      almost_empty_value => 1,
      almost_full_value => 401,
      intended_device_family => "Stratix IV",
      lpm_numwords => 402,
      lpm_showahead => "ON",
      lpm_type => "scfifo",
      lpm_width => 45,
      lpm_widthu => 9,
      overflow_checking => "ON",
      underflow_checking => "ON",
      use_eab => "ON"
    )
    PORT MAP (
      rdreq => SyncFifo_And6_q(0),
      aclr => DataPath_AccFifo_re_reset,
      clock => clk,
      wrreq => DataPath_AutoMinDelay_q(0),
      data => DataPath_Add_R_add_f_q,
      almost_full => DataPath_AccFifo_re_f(0),
      almost_empty => DataPath_AccFifo_re_t(0),
      empty => DataPath_AccFifo_re_empty(0),
      q => DataPath_AccFifo_re_q
    );
    DataPath_AccFifo_re_v <= not DataPath_AccFifo_re_empty;
    DataPath_AccFifo_re_e <= not DataPath_AccFifo_re_t;

	--Control_CmdFifo_BitExtract1_0(BITSELECT,24)@5
    Control_CmdFifo_BitExtract1_0_in <= Control_CmdFifo_FIFO_q;
    Control_CmdFifo_BitExtract1_0_b <= Control_CmdFifo_BitExtract1_0_in(0 downto 0);

	--Control_CmdFifo_And7(LOGICAL,20)@5
    Control_CmdFifo_And7_a <= Control_CmdFifo_Or_q;
    Control_CmdFifo_And7_b <= Control_CmdFifo_BitExtract1_0_b;
    Control_CmdFifo_And7_q <= Control_CmdFifo_And7_a and Control_CmdFifo_And7_b;

	--Control_CmdFifo_BitExtract1_3(BITSELECT,27)@5
    Control_CmdFifo_BitExtract1_3_in <= Control_CmdFifo_FIFO_q;
    Control_CmdFifo_BitExtract1_3_b <= Control_CmdFifo_BitExtract1_3_in(3 downto 3);

	--Control_CmdFifo_And10(LOGICAL,13)@5
    Control_CmdFifo_And10_a <= Control_CmdFifo_Or_q;
    Control_CmdFifo_And10_b <= Control_CmdFifo_BitExtract1_3_b;
    Control_CmdFifo_And10_q <= Control_CmdFifo_And10_a and Control_CmdFifo_And10_b;

	--Control_CmdFifo_BitExtract1_2(BITSELECT,26)@5
    Control_CmdFifo_BitExtract1_2_in <= Control_CmdFifo_FIFO_q;
    Control_CmdFifo_BitExtract1_2_b <= Control_CmdFifo_BitExtract1_2_in(2 downto 2);

	--Control_CmdFifo_And9(LOGICAL,22)@5
    Control_CmdFifo_And9_a <= Control_CmdFifo_Or_q;
    Control_CmdFifo_And9_b <= Control_CmdFifo_BitExtract1_2_b;
    Control_CmdFifo_And9_q <= Control_CmdFifo_And9_a and Control_CmdFifo_And9_b;

	--Control_CmdFifo_BitExtract1_1(BITSELECT,25)@5
    Control_CmdFifo_BitExtract1_1_in <= Control_CmdFifo_FIFO_q;
    Control_CmdFifo_BitExtract1_1_b <= Control_CmdFifo_BitExtract1_1_in(1 downto 1);

	--Control_CmdFifo_And8(LOGICAL,21)@5
    Control_CmdFifo_And8_a <= Control_CmdFifo_Or_q;
    Control_CmdFifo_And8_b <= Control_CmdFifo_BitExtract1_1_b;
    Control_CmdFifo_And8_q <= Control_CmdFifo_And8_a and Control_CmdFifo_And8_b;

	--SyncFifo_BitCombine1(BITJOIN,200)@5
    SyncFifo_BitCombine1_q <= Control_CmdFifo_And7_q & Control_CmdFifo_And10_q & Control_CmdFifo_And9_q & Control_CmdFifo_And8_q & Control_CmdFifo_And12_q;

	--SyncFifo_FIFO1(FIFO,208)@5
    SyncFifo_FIFO1_reset <= areset;

    SyncFifo_FIFO1_fifo : scfifo
    GENERIC MAP (
      add_ram_output_register => "ON",
      almost_empty_value => 4,
      almost_full_value => 30,
      intended_device_family => "Stratix IV",
      lpm_numwords => 32,
      lpm_showahead => "ON",
      lpm_type => "scfifo",
      lpm_width => 5,
      lpm_widthu => 5,
      overflow_checking => "ON",
      underflow_checking => "ON",
      use_eab => "ON"
    )
    PORT MAP (
      rdreq => SyncFifo_Or_q(0),
      aclr => SyncFifo_FIFO1_reset,
      clock => clk,
      wrreq => Control_CmdFifo_Or_q(0),
      data => SyncFifo_BitCombine1_q,
      almost_full => SyncFifo_FIFO1_f(0),
      almost_empty => SyncFifo_FIFO1_t(0),
      empty => SyncFifo_FIFO1_empty(0),
      q => SyncFifo_FIFO1_q
    );
    SyncFifo_FIFO1_v <= not SyncFifo_FIFO1_empty;
    SyncFifo_FIFO1_e <= not SyncFifo_FIFO1_t;

	--SyncFifo_BitExtract1_4(BITSELECT,205)@5
    SyncFifo_BitExtract1_4_in <= SyncFifo_FIFO1_q;
    SyncFifo_BitExtract1_4_b <= SyncFifo_BitExtract1_4_in(4 downto 4);

	--SyncFifo_Not3(LOGICAL,212)@5
    SyncFifo_Not3_a <= SyncFifo_BitExtract1_4_b;
    SyncFifo_Not3_q <= not SyncFifo_Not3_a;

	--SyncFifo_And3(LOGICAL,196)@5
    SyncFifo_And3_a <= SyncFifo_Not3_q;
    SyncFifo_And3_b <= SyncFifo_FIFO1_v;
    SyncFifo_And3_c <= DataPath_AccFifo_re_v;
    SyncFifo_And3_q <= SyncFifo_And3_a and SyncFifo_And3_b and SyncFifo_And3_c;

	--SyncFifo_And2(LOGICAL,195)@5
    SyncFifo_And2_a <= SyncFifo_BitExtract1_4_b;
    SyncFifo_And2_b <= SyncFifo_FIFO1_v;
    SyncFifo_And2_q <= SyncFifo_And2_a and SyncFifo_And2_b;

	--SyncFifo_Or(LOGICAL,213)@5
    SyncFifo_Or_a <= SyncFifo_And2_q;
    SyncFifo_Or_b <= SyncFifo_And3_q;
    SyncFifo_Or_q <= SyncFifo_Or_a or SyncFifo_Or_b;

	--SyncFifo_BitExtract1_0(BITSELECT,201)@5
    SyncFifo_BitExtract1_0_in <= SyncFifo_FIFO1_q;
    SyncFifo_BitExtract1_0_b <= SyncFifo_BitExtract1_0_in(0 downto 0);

	--SyncFifo_And1(LOGICAL,194)@5
    SyncFifo_And1_a <= SyncFifo_BitExtract1_0_b;
    SyncFifo_And1_b <= SyncFifo_Or_q;
    SyncFifo_And1_q <= SyncFifo_And1_a and SyncFifo_And1_b;

	--AutoMinDelay_replace_wrreg(REG,641)
    AutoMinDelay_replace_wrreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            AutoMinDelay_replace_wrreg_q <= "00000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            AutoMinDelay_replace_wrreg_q <= AutoMinDelay_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--AutoMinDelay_replace_rdcnt(COUNTER,640)
    -- every=1, low=0, high=30, step=1, init=1
    AutoMinDelay_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            AutoMinDelay_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            AutoMinDelay_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF AutoMinDelay_replace_rdcnt_i = 29 THEN
                  AutoMinDelay_replace_rdcnt_eq <= '1';
                ELSE
                  AutoMinDelay_replace_rdcnt_eq <= '0';
                END IF;
                IF (AutoMinDelay_replace_rdcnt_eq = '1') THEN
                    AutoMinDelay_replace_rdcnt_i <= AutoMinDelay_replace_rdcnt_i - 30;
                ELSE
                    AutoMinDelay_replace_rdcnt_i <= AutoMinDelay_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    AutoMinDelay_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(AutoMinDelay_replace_rdcnt_i,5));


	--AutoMinDelay_replace_mem(DUALMEM,639)
    AutoMinDelay_replace_mem_reset0 <= areset;
    AutoMinDelay_replace_mem_ia <= SyncFifo_And1_q;
    AutoMinDelay_replace_mem_aa <= AutoMinDelay_replace_wrreg_q;
    AutoMinDelay_replace_mem_ab <= AutoMinDelay_replace_rdcnt_q;
    AutoMinDelay_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 31,
        width_b => 1,
        widthad_b => 5,
        numwords_b => 31,
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
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken1 => AutoMinDelay_enaAnd_q(0),
        clocken0 => VCC_q(0),
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => AutoMinDelay_replace_mem_reset0,
        clock1 => clk,
        address_b => AutoMinDelay_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => AutoMinDelay_replace_mem_iq,
        address_a => AutoMinDelay_replace_mem_aa,
        data_a => AutoMinDelay_replace_mem_ia
    );
        AutoMinDelay_replace_mem_q <= AutoMinDelay_replace_mem_iq(0 downto 0);

	--Control_CmdFifo_And5(LOGICAL,19)@6
    Control_CmdFifo_And5_a <= AutoMinDelay_replace_mem_q;
    Control_CmdFifo_And5_b <= Control_CmdFifo_Not1_q;
    Control_CmdFifo_And5_q <= Control_CmdFifo_And5_a and Control_CmdFifo_And5_b;

	--ld_Control_CmdFifo_And5_q_to_Or_rsrvd_fix_f(DELAY,519)@6
    ld_Control_CmdFifo_And5_q_to_Or_rsrvd_fix_f : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => Control_CmdFifo_And5_q, xout => ld_Control_CmdFifo_And5_q_to_Or_rsrvd_fix_f_q, clk => clk, aclr => areset );

	--DataPath_Mult_aI_x_bI_f(FLOATMULT,236)@23
    DataPath_Mult_aI_x_bI_f_reset <= areset;
    DataPath_Mult_aI_x_bI_f_inst : fp_mult_sNorm_2_sInternal
        GENERIC MAP ( m_family => "Stratix IV")
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => DataPath_Mult_aI_x_bI_f_reset,
    		dataa	 => DataPath_Mult_aI_x_bI_f_0_cast_q,
    		datab	 => DataPath_Mult_aI_x_bI_f_1_cast_q,
    		result	 => DataPath_Mult_aI_x_bI_f_q
    	);
    -- synopsys translate off
    DataPath_Mult_aI_x_bI_f_a_real <= sNorm_2_real(DataPath_Mult_aI_x_bI_f_0_cast_q);
    DataPath_Mult_aI_x_bI_f_b_real <= sNorm_2_real(DataPath_Mult_aI_x_bI_f_1_cast_q);
    DataPath_Mult_aI_x_bI_f_q_real <= sInternal_2_real(DataPath_Mult_aI_x_bI_f_q);
    -- synopsys translate on

	--DataPath_Mult_aR_x_bR_f(FLOATMULT,235)@23
    DataPath_Mult_aR_x_bR_f_reset <= areset;
    DataPath_Mult_aR_x_bR_f_inst : fp_mult_sNorm_2_sInternal
        GENERIC MAP ( m_family => "Stratix IV")
        PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => DataPath_Mult_aR_x_bR_f_reset,
    		dataa	 => DataPath_Mult_aR_x_bR_f_0_cast_q,
    		datab	 => DataPath_Mult_aR_x_bR_f_1_cast_q,
    		result	 => DataPath_Mult_aR_x_bR_f_q
    	);
    -- synopsys translate off
    DataPath_Mult_aR_x_bR_f_a_real <= sNorm_2_real(DataPath_Mult_aR_x_bR_f_0_cast_q);
    DataPath_Mult_aR_x_bR_f_b_real <= sNorm_2_real(DataPath_Mult_aR_x_bR_f_1_cast_q);
    DataPath_Mult_aR_x_bR_f_q_real <= sInternal_2_real(DataPath_Mult_aR_x_bR_f_q);
    -- synopsys translate on

	--DataPath_Mult_R_sub_f(FLOATADDSUB,233)@26
    DataPath_Mult_R_sub_f_reset <= areset;
    DataPath_Mult_R_sub_f_add_sub	 <= not GND_q;
    DataPath_Mult_R_sub_f_inst : fp_addsub_sInternal_2_sInternal
    GENERIC MAP (
       addsub_resetval => '1'
    ) PORT MAP (
    	add_sub	 => DataPath_Mult_R_sub_f_add_sub,
    	clk_en	 => '1',
    	clock	 => clk,
    	reset    => DataPath_Mult_R_sub_f_reset,
    	dataa	 => DataPath_Mult_aR_x_bR_f_q,
    	datab	 => DataPath_Mult_aI_x_bI_f_q,
    	result	 => DataPath_Mult_R_sub_f_q
   	);
    DataPath_Mult_R_sub_f_p <= not DataPath_Mult_R_sub_f_q(41 downto 41);
    DataPath_Mult_R_sub_f_n <= DataPath_Mult_R_sub_f_q(41 downto 41);
    -- synopsys translate off
    DataPath_Mult_R_sub_f_a_real <= sInternal_2_real(DataPath_Mult_aR_x_bR_f_q);
    DataPath_Mult_R_sub_f_b_real <= sInternal_2_real(DataPath_Mult_aI_x_bI_f_q);
    DataPath_Mult_R_sub_f_q_real <= sInternal_2_real(DataPath_Mult_R_sub_f_q);
    -- synopsys translate on

	--InPort_WrBack_Input_WrBk_Mux_Mux3_re_3_cast(FLOATCAST,245)@0
    InPort_WrBack_Input_WrBk_Mux_Mux3_re_3_cast_reset <= areset;
    InPort_WrBack_Input_WrBk_Mux_Mux3_re_3_cast_a <= DataPath_Mult_R_sub_f_q;
    InPort_WrBack_Input_WrBk_Mux_Mux3_re_3_cast_inst : cast_sInternal_2_sIEEE
      PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => InPort_WrBack_Input_WrBk_Mux_Mux3_re_3_cast_reset,
    		dataa	 => InPort_WrBack_Input_WrBk_Mux_Mux3_re_3_cast_a,
    		result	 => InPort_WrBack_Input_WrBk_Mux_Mux3_re_3_cast_q
    	);
    -- synopsys translate off
    InPort_WrBack_Input_WrBk_Mux_Mux3_re_3_cast_q_real <= sIEEE_2_real(InPort_WrBack_Input_WrBk_Mux_Mux3_re_3_cast_q);
    -- synopsys translate on

	--ld_InPort_WrBack_InPort_FIFO2_re_q_to_InPort_WrBack_Input_WrBk_Mux_Mux3_re_c(DELAY,501)@6
    ld_InPort_WrBack_InPort_FIFO2_re_q_to_InPort_WrBack_Input_WrBk_Mux_Mux3_re_c : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => InPort_WrBack_InPort_FIFO2_re_q, xout => ld_InPort_WrBack_InPort_FIFO2_re_q_to_InPort_WrBack_Input_WrBk_Mux_Mux3_re_c_q, clk => clk, aclr => areset );

	--InPort_WrBack_Input_WrBk_Mux_Mux3_re(MUX,178)@7
    InPort_WrBack_Input_WrBk_Mux_Mux3_re_s <= ld_AutoMinDelay_q_to_InPort_WrBack_Input_WrBk_Mux_Mux2_b_q;
    InPort_WrBack_Input_WrBk_Mux_Mux3_re: PROCESS (InPort_WrBack_Input_WrBk_Mux_Mux3_re_s, ld_InPort_WrBack_InPort_FIFO2_re_q_to_InPort_WrBack_Input_WrBk_Mux_Mux3_re_c_q, InPort_WrBack_Input_WrBk_Mux_Mux3_re_3_cast_q)
    BEGIN
            CASE InPort_WrBack_Input_WrBk_Mux_Mux3_re_s IS
                  WHEN "0" => InPort_WrBack_Input_WrBk_Mux_Mux3_re_q <= ld_InPort_WrBack_InPort_FIFO2_re_q_to_InPort_WrBack_Input_WrBk_Mux_Mux3_re_c_q;
                  WHEN "1" => InPort_WrBack_Input_WrBk_Mux_Mux3_re_q <= InPort_WrBack_Input_WrBk_Mux_Mux3_re_3_cast_q;
                  WHEN OTHERS => InPort_WrBack_Input_WrBk_Mux_Mux3_re_q <= (others => '0');
            END CASE;
    END PROCESS;


	--yMem_re(DUALMEM,220)@7
    yMem_re_reset0 <= areset;
    yMem_re_ia <= InPort_WrBack_Input_WrBk_Mux_Mux3_re_q;
    yMem_re_aa <= InPort_WrBack_Input_WrBk_Mux_Mux2_q(9 downto 0);
    yMem_re_ab <= ld_Control_CmdFifo_FIFO1_q_to_yMem_re_a_q(9 downto 0);
    yMem_re_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 10,
        numwords_a => 800,
        width_b => 32,
        widthad_b => 10,
        numwords_b => 800,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("cholesky_solver_mc/CholFwBw/BwSub/cholesky_solver_mc_CholFwBw_BwSub_yMem_re.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        wren_a => ld_InPort_WrBack_Input_WrBk_Mux_Mux1_q_to_yMem_re_b_q(0),
        aclr0 => yMem_re_reset0,
        clock0 => clk,
        address_b => yMem_re_ab,
        -- data_b => (others => '0'),
        q_b => yMem_re_iq,
        q_a => yMem_re_ir,
        address_a => yMem_re_aa,
        data_a => yMem_re_ia
    );
        yMem_re_q <= yMem_re_iq(31 downto 0);
        yMem_re_r <= yMem_re_ir(31 downto 0);

	--SyncFifo_FIFO_re(FIFO,206)@9
    SyncFifo_FIFO_re_reset <= areset;

    SyncFifo_FIFO_re_fifo : scfifo
    GENERIC MAP (
      add_ram_output_register => "ON",
      almost_empty_value => 4,
      almost_full_value => 30,
      intended_device_family => "Stratix IV",
      lpm_numwords => 32,
      lpm_showahead => "ON",
      lpm_type => "scfifo",
      lpm_width => 32,
      lpm_widthu => 5,
      overflow_checking => "ON",
      underflow_checking => "ON",
      use_eab => "ON"
    )
    PORT MAP (
      rdreq => ld_SyncFifo_Or_q_to_SyncFifo_And_a_q(0),
      aclr => SyncFifo_FIFO_re_reset,
      clock => clk,
      wrreq => ld_Control_CmdFifo_Or_q_to_SyncFifo_FIFO_re_v_q(0),
      data => yMem_re_q,
      almost_full => SyncFifo_FIFO_re_f(0),
      almost_empty => SyncFifo_FIFO_re_t(0),
      empty => SyncFifo_FIFO_re_empty(0),
      q => SyncFifo_FIFO_re_q
    );
    SyncFifo_FIFO_re_v <= not SyncFifo_FIFO_re_empty;
    SyncFifo_FIFO_re_e <= not SyncFifo_FIFO_re_t;

	--SyncFifo_Not1(LOGICAL,211)@9
    SyncFifo_Not1_a <= SyncFifo_FIFO2_re_v;
    SyncFifo_Not1_q <= not SyncFifo_Not1_a;

	--SyncFifo_And(LOGICAL,193)@9
    SyncFifo_And_a <= ld_SyncFifo_Or_q_to_SyncFifo_And_a_q;
    SyncFifo_And_b <= SyncFifo_Not1_q;
    SyncFifo_And_q <= SyncFifo_And_a and SyncFifo_And_b;

	--ld_DataPath_AccFifo_re_f_to_Or_rsrvd_fix_c(DELAY,516)@5
    ld_DataPath_AccFifo_re_f_to_Or_rsrvd_fix_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => DataPath_AccFifo_re_f, xout => ld_DataPath_AccFifo_re_f_to_Or_rsrvd_fix_c_q, clk => clk, aclr => areset );

	--DataPath_Not1(LOGICAL,153)@5
    DataPath_Not1_a <= DataPath_AccFifo_re_v;
    DataPath_Not1_q <= not DataPath_Not1_a;

	--DataPath_And(LOGICAL,126)@5
    DataPath_And_a <= SyncFifo_And6_q;
    DataPath_And_b <= DataPath_Not1_q;
    DataPath_And_q <= DataPath_And_a and DataPath_And_b;

	--ld_DataPath_And_q_to_Or_rsrvd_fix_b(DELAY,515)@5
    ld_DataPath_And_q_to_Or_rsrvd_fix_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 4 )
    PORT MAP ( xin => DataPath_And_q, xout => ld_DataPath_And_q_to_Or_rsrvd_fix_b_q, clk => clk, aclr => areset );

	--ld_InPort_WrBack_InPort_FIFO1_f_to_Or_rsrvd_fix_a(DELAY,514)@6
    ld_InPort_WrBack_InPort_FIFO1_f_to_Or_rsrvd_fix_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => InPort_WrBack_InPort_FIFO1_f, xout => ld_InPort_WrBack_InPort_FIFO1_f_to_Or_rsrvd_fix_a_q, clk => clk, aclr => areset );

	--Or_rsrvd_fix(LOGICAL,191)@9
    Or_rsrvd_fix_a <= ld_InPort_WrBack_InPort_FIFO1_f_to_Or_rsrvd_fix_a_q;
    Or_rsrvd_fix_b <= ld_DataPath_And_q_to_Or_rsrvd_fix_b_q;
    Or_rsrvd_fix_c <= ld_DataPath_AccFifo_re_f_to_Or_rsrvd_fix_c_q;
    Or_rsrvd_fix_d <= SyncFifo_And_q;
    Or_rsrvd_fix_e <= SyncFifo_FIFO_re_f;
    Or_rsrvd_fix_f <= ld_Control_CmdFifo_And5_q_to_Or_rsrvd_fix_f_q;
    Or_rsrvd_fix_q <= Or_rsrvd_fix_a or Or_rsrvd_fix_b or Or_rsrvd_fix_c or Or_rsrvd_fix_d or Or_rsrvd_fix_e or Or_rsrvd_fix_f;

	--ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_wrreg(REG,695)
    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_wrreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_wrreg_q <= "00000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_wrreg_q <= ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_rdcnt(COUNTER,694)
    -- every=1, low=0, high=26, step=1, init=1
    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_rdcnt_i = 25 THEN
                  ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_rdcnt_eq <= '1';
                ELSE
                  ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_rdcnt_eq <= '0';
                END IF;
                IF (ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_rdcnt_eq = '1') THEN
                    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_rdcnt_i <= ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_rdcnt_i - 26;
                ELSE
                    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_rdcnt_i <= ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_rdcnt_i,5));


	--ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_mem(DUALMEM,693)
    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_mem_reset0 <= areset;
    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_mem_ia <= Or_rsrvd_fix_q;
    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_mem_aa <= ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_wrreg_q;
    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_mem_ab <= ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_rdcnt_q;
    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 27,
        width_b => 1,
        widthad_b => 5,
        numwords_b => 27,
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
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken1 => ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_enaAnd_q(0),
        clocken0 => VCC_q(0),
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_mem_iq,
        address_a => ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_mem_aa,
        data_a => ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_mem_ia
    );
        ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_mem_q <= ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_mem_iq(0 downto 0);

	--ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_outputreg(DELAY,692)
    ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_outputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_replace_mem_q, xout => ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_outputreg_q, clk => clk, aclr => areset );

	--ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_nor(LOGICAL,689)
    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_nor_a <= AutoMinDelay_notEnable_q;
    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_nor_b <= ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_sticky_ena_q;
    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_nor_q <= not (ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_nor_a or ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_nor_b);

	--ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_mem_top(CONSTANT,685)
    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_mem_top_q <= "011101";

	--ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_cmp(LOGICAL,686)
    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_cmp_a <= ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_mem_top_q;
    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_cmp_b <= STD_LOGIC_VECTOR("0" & ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_rdcnt_q);
    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_cmp_q <= "1" when ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_cmp_a = ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_cmp_b else "0";

	--ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_cmpReg(REG,687)
    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_cmpReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_cmpReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_cmpReg_q <= ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_cmp_q;
        END IF;
    END PROCESS;


	--ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_sticky_ena(REG,690)
    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_sticky_ena: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_sticky_ena_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_nor_q = "1") THEN
                ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_sticky_ena_q <= ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_cmpReg_q;
            END IF;
        END IF;
    END PROCESS;


	--ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_enaAnd(LOGICAL,691)
    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_enaAnd_a <= ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_sticky_ena_q;
    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_enaAnd_b <= VCC_q;
    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_enaAnd_q <= ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_enaAnd_a and ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_enaAnd_b;

	--Control_CmdFifo_Detect_Done_SRlatch1_Not(LOGICAL,37)@5
    Control_CmdFifo_Detect_Done_SRlatch1_Not_a <= Control_CmdFifo_Detect_Done_And14_q;
    Control_CmdFifo_Detect_Done_SRlatch1_Not_q <= not Control_CmdFifo_Detect_Done_SRlatch1_Not_a;

	--Control_CmdFifo_BitExtract1_4(BITSELECT,28)@5
    Control_CmdFifo_BitExtract1_4_in <= Control_CmdFifo_FIFO_q;
    Control_CmdFifo_BitExtract1_4_b <= Control_CmdFifo_BitExtract1_4_in(4 downto 4);

	--Control_CmdFifo_And11(LOGICAL,14)@5
    Control_CmdFifo_And11_a <= Control_CmdFifo_Or_q;
    Control_CmdFifo_And11_b <= Control_CmdFifo_BitExtract1_4_b;
    Control_CmdFifo_And11_q <= Control_CmdFifo_And11_a and Control_CmdFifo_And11_b;

	--Control_CmdFifo_Detect_Done_Not4(LOGICAL,35)@5
    Control_CmdFifo_Detect_Done_Not4_a <= Control_CmdFifo_And11_q;
    Control_CmdFifo_Detect_Done_Not4_q <= not Control_CmdFifo_Detect_Done_Not4_a;

	--Control_CmdFifo_Detect_Done_SampleDelay4(DELAY,41)@5
    Control_CmdFifo_Detect_Done_SampleDelay4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => Control_CmdFifo_And11_q, xout => Control_CmdFifo_Detect_Done_SampleDelay4_q, clk => clk, aclr => areset );

	--Control_CmdFifo_Detect_Done_And13(LOGICAL,31)@5
    Control_CmdFifo_Detect_Done_And13_a <= Control_CmdFifo_Detect_Done_SampleDelay4_q;
    Control_CmdFifo_Detect_Done_And13_b <= Control_CmdFifo_Detect_Done_Not4_q;
    Control_CmdFifo_Detect_Done_And13_q <= Control_CmdFifo_Detect_Done_And13_a and Control_CmdFifo_Detect_Done_And13_b;

	--Control_CmdFifo_Detect_Done_SRlatch1_Or(LOGICAL,38)@5
    Control_CmdFifo_Detect_Done_SRlatch1_Or_a <= Control_CmdFifo_Detect_Done_SRlatch1_SampleDelay1_q;
    Control_CmdFifo_Detect_Done_SRlatch1_Or_b <= Control_CmdFifo_Detect_Done_And13_q;
    Control_CmdFifo_Detect_Done_SRlatch1_Or_q <= Control_CmdFifo_Detect_Done_SRlatch1_Or_a or Control_CmdFifo_Detect_Done_SRlatch1_Or_b;

	--Control_CmdFifo_Detect_Done_SRlatch1_And(LOGICAL,36)@5
    Control_CmdFifo_Detect_Done_SRlatch1_And_a <= Control_CmdFifo_Detect_Done_SRlatch1_Or_q;
    Control_CmdFifo_Detect_Done_SRlatch1_And_b <= Control_CmdFifo_Detect_Done_SRlatch1_Not_q;
    Control_CmdFifo_Detect_Done_SRlatch1_And_q <= Control_CmdFifo_Detect_Done_SRlatch1_And_a and Control_CmdFifo_Detect_Done_SRlatch1_And_b;

	--Control_CmdFifo_Detect_Done_SRlatch1_SampleDelay1(DELAY,39)@5
    Control_CmdFifo_Detect_Done_SRlatch1_SampleDelay1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => Control_CmdFifo_Detect_Done_SRlatch1_And_q, xout => Control_CmdFifo_Detect_Done_SRlatch1_SampleDelay1_q, clk => clk, aclr => areset );

	--reg_Control_CmdFifo_Detect_Done_SRlatch1_SampleDelay1_0_to_Control_CmdFifo_Detect_Done_And14_1(REG,301)@5
    reg_Control_CmdFifo_Detect_Done_SRlatch1_SampleDelay1_0_to_Control_CmdFifo_Detect_Done_And14_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_Control_CmdFifo_Detect_Done_SRlatch1_SampleDelay1_0_to_Control_CmdFifo_Detect_Done_And14_1_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_Control_CmdFifo_Detect_Done_SRlatch1_SampleDelay1_0_to_Control_CmdFifo_Detect_Done_And14_1_q <= Control_CmdFifo_Detect_Done_SRlatch1_SampleDelay1_q;
        END IF;
    END PROCESS;


	--Control_CmdFifo_Detect_Done_And6(LOGICAL,33)@6
    Control_CmdFifo_Detect_Done_And6_a <= Control_CmdFifo_Detect_Done_SampleDelay2_q;
    Control_CmdFifo_Detect_Done_And6_b <= Control_CmdFifo_Detect_Done_Not2_q;
    Control_CmdFifo_Detect_Done_And6_q <= Control_CmdFifo_Detect_Done_And6_a and Control_CmdFifo_Detect_Done_And6_b;

	--Control_CmdFifo_Detect_Done_And14(LOGICAL,32)@6
    Control_CmdFifo_Detect_Done_And14_a <= Control_CmdFifo_Detect_Done_And6_q;
    Control_CmdFifo_Detect_Done_And14_b <= reg_Control_CmdFifo_Detect_Done_SRlatch1_SampleDelay1_0_to_Control_CmdFifo_Detect_Done_And14_1_q;
    Control_CmdFifo_Detect_Done_And14_q <= Control_CmdFifo_Detect_Done_And14_a and Control_CmdFifo_Detect_Done_And14_b;

	--ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_wrreg(REG,684)
    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_wrreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_wrreg_q <= "00000";
        ELSIF(clk'EVENT AND clk = '1') THEN
            ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_wrreg_q <= ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_rdcnt_q;
        END IF;
    END PROCESS;


	--ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_rdcnt(COUNTER,683)
    -- every=1, low=0, high=29, step=1, init=1
    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_rdcnt: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_rdcnt_i <= TO_UNSIGNED(1,5);
            ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
                IF ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_rdcnt_i = 28 THEN
                  ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_rdcnt_eq <= '1';
                ELSE
                  ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_rdcnt_eq <= '0';
                END IF;
                IF (ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_rdcnt_eq = '1') THEN
                    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_rdcnt_i <= ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_rdcnt_i - 29;
                ELSE
                    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_rdcnt_i <= ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_rdcnt_i + 1;
                END IF;
        END IF;
    END PROCESS;
    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_rdcnt_q <= STD_LOGIC_VECTOR(RESIZE(ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_rdcnt_i,5));


	--ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_mem(DUALMEM,682)
    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_mem_reset0 <= areset;
    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_mem_ia <= Control_CmdFifo_Detect_Done_And14_q;
    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_mem_aa <= ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_wrreg_q;
    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_mem_ab <= ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_rdcnt_q;
    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 1,
        widthad_a => 5,
        numwords_a => 30,
        width_b => 1,
        widthad_b => 5,
        numwords_b => 30,
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
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken1 => ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_enaAnd_q(0),
        clocken0 => VCC_q(0),
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_mem_iq,
        address_a => ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_mem_aa,
        data_a => ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_mem_ia
    );
        ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_mem_q <= ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_mem_iq(0 downto 0);

	--ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_outputreg(DELAY,681)
    ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_outputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_replace_mem_q, xout => ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_outputreg_q, clk => clk, aclr => areset );

	--ChannelOut_3_cast(FLOATCAST,242)@31
    ChannelOut_3_cast_reset <= areset;
    ChannelOut_3_cast_a <= DataPath_Mult_I_add_f_q;
    ChannelOut_3_cast_inst : cast_sInternal_2_sIEEE
      PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => ChannelOut_3_cast_reset,
    		dataa	 => ChannelOut_3_cast_a,
    		result	 => ChannelOut_3_cast_q
    	);
    -- synopsys translate off
    ChannelOut_3_cast_q_real <= sIEEE_2_real(ChannelOut_3_cast_q);
    -- synopsys translate on

	--ChannelOut_2_cast(FLOATCAST,241)@31
    ChannelOut_2_cast_reset <= areset;
    ChannelOut_2_cast_a <= DataPath_Mult_R_sub_f_q;
    ChannelOut_2_cast_inst : cast_sInternal_2_sIEEE
      PORT MAP (
    		clk_en	 => '1',
    		clock	 => clk,
    		reset    => ChannelOut_2_cast_reset,
    		dataa	 => ChannelOut_2_cast_a,
    		result	 => ChannelOut_2_cast_q
    	);
    -- synopsys translate off
    ChannelOut_2_cast_q_real <= sIEEE_2_real(ChannelOut_2_cast_q);
    -- synopsys translate on

	--ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_replace_mem(DUALMEM,671)
    ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_replace_mem_reset0 <= areset;
    ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_replace_mem_ia <= Control_CmdFifo_FIFO2_q;
    ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_replace_mem_aa <= AutoMinDelay_replace_wrreg_q;
    ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_replace_mem_ab <= AutoMinDelay_replace_rdcnt_q;
    ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_replace_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 7,
        widthad_a => 5,
        numwords_a => 31,
        width_b => 7,
        widthad_b => 5,
        numwords_b => 31,
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
        intended_device_family => "Stratix IV"
    )
    PORT MAP (
        clocken1 => AutoMinDelay_enaAnd_q(0),
        clocken0 => VCC_q(0),
        wren_a => VCC_q(0),
        clock0 => clk,
        aclr1 => ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_replace_mem_reset0,
        clock1 => clk,
        address_b => ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_replace_mem_ab,
        -- data_b => (others => '0'),
        q_b => ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_replace_mem_iq,
        address_a => ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_replace_mem_aa,
        data_a => ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_replace_mem_ia
    );
        ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_replace_mem_q <= ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_replace_mem_iq(6 downto 0);

	--ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_outputreg(DELAY,670)
    ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_outputreg : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_replace_mem_q, xout => ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_outputreg_q, clk => clk, aclr => areset );

	--ld_SyncFifo_And1_q_to_ChannelOut_xv_s_outputreg(DELAY,659)
    ld_SyncFifo_And1_q_to_ChannelOut_xv_s_outputreg : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => AutoMinDelay_replace_mem_q, xout => ld_SyncFifo_And1_q_to_ChannelOut_xv_s_outputreg_q, clk => clk, aclr => areset );

	--ChannelOut(PORTOUT,9)@38
    xv_s <= ld_SyncFifo_And1_q_to_ChannelOut_xv_s_outputreg_q;
    xc_s <= STD_LOGIC_VECTOR("0" & ld_Control_CmdFifo_FIFO2_q_to_ChannelOut_xc_s_outputreg_q);
    xd_re <= ChannelOut_2_cast_q;
    xd_im <= ChannelOut_3_cast_q;
    xBwSubDone_s <= ld_Control_CmdFifo_Detect_Done_And14_q_to_ChannelOut_xBwSubDone_s_outputreg_q;
    xBsFifoErr_s <= ld_Or_rsrvd_fix_q_to_ChannelOut_xBsFifoErr_s_outputreg_q;


end normal;
