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

-- VHDL created from DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_CarrierSumI3
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
entity DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_CarrierSumI3 is
    port (
        vin : in std_logic_vector(0 downto 0);
        cin : in std_logic_vector(7 downto 0);
        i1 : in std_logic_vector(32 downto 0);
        i2 : in std_logic_vector(32 downto 0);
        vout : out std_logic_vector(0 downto 0);
        cout : out std_logic_vector(7 downto 0);
        iout1 : out std_logic_vector(34 downto 0);
        iout2 : out std_logic_vector(34 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_CarrierSumI3 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal Add_I_Accum_a : std_logic_vector(34 downto 0);
    signal Add_I_Accum_b : std_logic_vector(34 downto 0);
    signal Add_I_Accum_i : std_logic_vector (34 downto 0);
    signal Add_I_Accum_a1 : std_logic_vector(34 downto 0);
    signal Add_I_Accum_b1 : std_logic_vector(34 downto 0);
    signal Add_I_Accum_o : std_logic_vector (34 downto 0);
    signal Add_I_Accum_q : std_logic_vector (34 downto 0);
    signal Add_I_Accum1_a : std_logic_vector(34 downto 0);
    signal Add_I_Accum1_b : std_logic_vector(34 downto 0);
    signal Add_I_Accum1_i : std_logic_vector (34 downto 0);
    signal Add_I_Accum1_a1 : std_logic_vector(34 downto 0);
    signal Add_I_Accum1_b1 : std_logic_vector(34 downto 0);
    signal Add_I_Accum1_o : std_logic_vector (34 downto 0);
    signal Add_I_Accum1_q : std_logic_vector (34 downto 0);
    signal DelayValidAccum_q : std_logic_vector (0 downto 0);
    signal three_q : std_logic_vector (1 downto 0);
    signal ld_AllValidAndChannelEq3_q_to_ChannelOut_vout_q : std_logic_vector (0 downto 0);
    signal ld_ChannelIn_cin_to_ChannelOut_cout_q : std_logic_vector (7 downto 0);
    signal BitExtract_in : std_logic_vector (7 downto 0);
    signal BitExtract_b : std_logic_vector (1 downto 0);
    signal ChannelEq3_a : std_logic_vector(7 downto 0);
    signal ChannelEq3_b : std_logic_vector(7 downto 0);
    signal ChannelEq3_q : std_logic_vector(0 downto 0);
    signal Channel_0_a : std_logic_vector(1 downto 0);
    signal Channel_0_b : std_logic_vector(1 downto 0);
    signal Channel_0_q : std_logic_vector(0 downto 0);
    signal Mux2_s : std_logic_vector (0 downto 0);
    signal Mux2_q : std_logic_vector (0 downto 0);
    signal AndValidSoFar_a : std_logic_vector(0 downto 0);
    signal AndValidSoFar_b : std_logic_vector(0 downto 0);
    signal AndValidSoFar_q : std_logic_vector(0 downto 0);
    signal AllValidAndChannelEq3_a : std_logic_vector(0 downto 0);
    signal AllValidAndChannelEq3_b : std_logic_vector(0 downto 0);
    signal AllValidAndChannelEq3_q : std_logic_vector(0 downto 0);
begin


	--BitExtract(BITSELECT,8)@0
    BitExtract_in <= cin;
    BitExtract_b <= BitExtract_in(1 downto 0);

	--GND(CONSTANT,0)
    GND_q <= "0";

	--Channel_0(LOGICAL,12)@0
    Channel_0_a <= STD_LOGIC_VECTOR("0" & GND_q);
    Channel_0_b <= BitExtract_b;
    Channel_0_q <= "1" when Channel_0_a = Channel_0_b else "0";

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--ChannelIn(PORTIN,10)@0

	--Add_I_Accum1(ADD,3)@0
    Add_I_Accum1_a <= Add_I_Accum1_q;
    Add_I_Accum1_b <= STD_LOGIC_VECTOR((34 downto 33 => i2(32)) & i2);
    Add_I_Accum1_i <= Add_I_Accum1_b;
    Add_I_Accum1_a1 <= Add_I_Accum1_i WHEN (Channel_0_q = "1") ELSE Add_I_Accum1_a;
    Add_I_Accum1_b1 <= (others => '0') WHEN (Channel_0_q = "1") ELSE Add_I_Accum1_b;
    Add_I_Accum1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_I_Accum1_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_I_Accum1_o <= STD_LOGIC_VECTOR(SIGNED(Add_I_Accum1_a1) + SIGNED(Add_I_Accum1_b1));
        END IF;
    END PROCESS;
    Add_I_Accum1_q <= Add_I_Accum1_o(34 downto 0);


	--Add_I_Accum(ADD,2)@0
    Add_I_Accum_a <= Add_I_Accum_q;
    Add_I_Accum_b <= STD_LOGIC_VECTOR((34 downto 33 => i1(32)) & i1);
    Add_I_Accum_i <= Add_I_Accum_b;
    Add_I_Accum_a1 <= Add_I_Accum_i WHEN (Channel_0_q = "1") ELSE Add_I_Accum_a;
    Add_I_Accum_b1 <= (others => '0') WHEN (Channel_0_q = "1") ELSE Add_I_Accum_b;
    Add_I_Accum: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            Add_I_Accum_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            Add_I_Accum_o <= STD_LOGIC_VECTOR(SIGNED(Add_I_Accum_a1) + SIGNED(Add_I_Accum_b1));
        END IF;
    END PROCESS;
    Add_I_Accum_q <= Add_I_Accum_o(34 downto 0);


	--ld_ChannelIn_cin_to_ChannelOut_cout(DELAY,38)@0
    ld_ChannelIn_cin_to_ChannelOut_cout : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => cin, xout => ld_ChannelIn_cin_to_ChannelOut_cout_q, clk => clk, aclr => areset );

	--three(CONSTANT,21)
    three_q <= "11";

	--ChannelEq3(LOGICAL,9)@0
    ChannelEq3_a <= cin;
    ChannelEq3_b <= STD_LOGIC_VECTOR("000000" & three_q);
    ChannelEq3_q <= "1" when ChannelEq3_a = ChannelEq3_b else "0";

	--DelayValidAccum(DELAY,13)@0
    DelayValidAccum : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => AndValidSoFar_q, xout => DelayValidAccum_q, clk => clk, aclr => areset );

	--Mux2(MUX,14)@0
    Mux2_s <= Channel_0_q;
    Mux2: PROCESS (Mux2_s, DelayValidAccum_q, vin)
    BEGIN
            CASE Mux2_s IS
                  WHEN "0" => Mux2_q <= DelayValidAccum_q;
                  WHEN "1" => Mux2_q <= vin;
                  WHEN OTHERS => Mux2_q <= (others => '0');
            END CASE;
    END PROCESS;


	--AndValidSoFar(LOGICAL,7)@0
    AndValidSoFar_a <= Mux2_q;
    AndValidSoFar_b <= vin;
    AndValidSoFar_q <= AndValidSoFar_a and AndValidSoFar_b;

	--AllValidAndChannelEq3(LOGICAL,6)@0
    AllValidAndChannelEq3_a <= AndValidSoFar_q;
    AllValidAndChannelEq3_b <= ChannelEq3_q;
    AllValidAndChannelEq3_q <= AllValidAndChannelEq3_a and AllValidAndChannelEq3_b;

	--ld_AllValidAndChannelEq3_q_to_ChannelOut_vout(DELAY,37)@0
    ld_AllValidAndChannelEq3_q_to_ChannelOut_vout : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => AllValidAndChannelEq3_q, xout => ld_AllValidAndChannelEq3_q_to_ChannelOut_vout_q, clk => clk, aclr => areset );

	--ChannelOut(PORTOUT,11)@1
    vout <= ld_AllValidAndChannelEq3_q_to_ChannelOut_vout_q;
    cout <= ld_ChannelIn_cin_to_ChannelOut_cout_q;
    iout1 <= Add_I_Accum_q;
    iout2 <= Add_I_Accum1_q;


end normal;
