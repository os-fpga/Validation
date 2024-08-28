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

-- VHDL created from DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_latch_1L
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
entity DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_latch_1L is
    port (
        d : in std_logic_vector(0 downto 0);
        e : in std_logic_vector(0 downto 0);
        q : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC2_latch_1L is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal SampleDelay_q : std_logic_vector (0 downto 0);
    signal Mux_s : std_logic_vector (0 downto 0);
    signal Mux_q : std_logic_vector (0 downto 0);
begin


	--GND(CONSTANT,0)

	--VCC(CONSTANT,1)

	--d_auto(GPIN,4)

	--e_auto(GPIN,5)

	--Mux(MUX,2)
    Mux_s <= e;
    Mux: PROCESS (Mux_s, SampleDelay_q, d)
    BEGIN
            CASE Mux_s IS
                  WHEN "0" => Mux_q <= SampleDelay_q;
                  WHEN "1" => Mux_q <= d;
                  WHEN OTHERS => Mux_q <= (others => '0');
            END CASE;
    END PROCESS;


	--SampleDelay(DELAY,3)
    SampleDelay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => Mux_q, xout => SampleDelay_q, clk => clk, aclr => areset );

	--q_auto(GPOUT,6)
    q <= SampleDelay_q;


end normal;
