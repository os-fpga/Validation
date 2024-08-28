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

-- VHDL created from dspbaChanOut8
-- VHDL created on Thu Oct  4 07:10:10 2012


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;

ENTITY DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut8 IS
    port (
-- Text written from /data/rkay/daily_build/13.0/38.3/p4/ip/aion/src/sfunc_common/sim_blackbox.cpp:47
        a0 : in std_logic_vector(13 downto 0);
        q0 : out std_logic_vector(13 downto 0)
    );
END;

ARCHITECTURE normal OF DirectRFTest_and_DPD_SV_DirectRFDesign_dspbaChanOut8 IS


BEGIN
    -- allblocks_alteradspbuilder2_HDL_Output
        q0 <= a0;

END normal;
