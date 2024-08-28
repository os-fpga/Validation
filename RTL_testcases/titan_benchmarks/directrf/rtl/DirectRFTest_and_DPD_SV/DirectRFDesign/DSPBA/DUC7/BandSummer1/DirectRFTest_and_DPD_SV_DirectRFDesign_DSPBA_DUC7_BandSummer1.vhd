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

-- VHDL created from DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_BandSummer1
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
entity DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_BandSummer1 is
    port (
        vin_s : in std_logic_vector(0 downto 0);
        cin_s : in std_logic_vector(7 downto 0);
        band0_a_0 : in std_logic_vector(28 downto 0);
        band0_a_1 : in std_logic_vector(28 downto 0);
        band0_a_2 : in std_logic_vector(28 downto 0);
        band0_a_3 : in std_logic_vector(28 downto 0);
        band0_a_4 : in std_logic_vector(28 downto 0);
        band0_a_5 : in std_logic_vector(28 downto 0);
        band0_a_6 : in std_logic_vector(28 downto 0);
        band0_a_7 : in std_logic_vector(28 downto 0);
        band1_a_0 : in std_logic_vector(28 downto 0);
        band1_a_1 : in std_logic_vector(28 downto 0);
        band1_a_2 : in std_logic_vector(28 downto 0);
        band1_a_3 : in std_logic_vector(28 downto 0);
        band1_a_4 : in std_logic_vector(28 downto 0);
        band1_a_5 : in std_logic_vector(28 downto 0);
        band1_a_6 : in std_logic_vector(28 downto 0);
        band1_a_7 : in std_logic_vector(28 downto 0);
        band0_b_0 : in std_logic_vector(28 downto 0);
        band0_b_1 : in std_logic_vector(28 downto 0);
        band0_b_2 : in std_logic_vector(28 downto 0);
        band0_b_3 : in std_logic_vector(28 downto 0);
        band0_b_4 : in std_logic_vector(28 downto 0);
        band0_b_5 : in std_logic_vector(28 downto 0);
        band0_b_6 : in std_logic_vector(28 downto 0);
        band0_b_7 : in std_logic_vector(28 downto 0);
        band1_b_0 : in std_logic_vector(28 downto 0);
        band1_b_1 : in std_logic_vector(28 downto 0);
        band1_b_2 : in std_logic_vector(28 downto 0);
        band1_b_3 : in std_logic_vector(28 downto 0);
        band1_b_4 : in std_logic_vector(28 downto 0);
        band1_b_5 : in std_logic_vector(28 downto 0);
        band1_b_6 : in std_logic_vector(28 downto 0);
        band1_b_7 : in std_logic_vector(28 downto 0);
        vout_s : out std_logic_vector(0 downto 0);
        cout_s : out std_logic_vector(7 downto 0);
        a_0 : out std_logic_vector(29 downto 0);
        a_1 : out std_logic_vector(29 downto 0);
        a_2 : out std_logic_vector(29 downto 0);
        a_3 : out std_logic_vector(29 downto 0);
        a_4 : out std_logic_vector(29 downto 0);
        a_5 : out std_logic_vector(29 downto 0);
        a_6 : out std_logic_vector(29 downto 0);
        a_7 : out std_logic_vector(29 downto 0);
        b_0 : out std_logic_vector(29 downto 0);
        b_1 : out std_logic_vector(29 downto 0);
        b_2 : out std_logic_vector(29 downto 0);
        b_3 : out std_logic_vector(29 downto 0);
        b_4 : out std_logic_vector(29 downto 0);
        b_5 : out std_logic_vector(29 downto 0);
        b_6 : out std_logic_vector(29 downto 0);
        b_7 : out std_logic_vector(29 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC7_BandSummer1 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal VCC_q : std_logic_vector (0 downto 0);
    signal Add_0_add_a : std_logic_vector(29 downto 0);
    signal Add_0_add_b : std_logic_vector(29 downto 0);
    signal Add_0_add_o : std_logic_vector (29 downto 0);
    signal Add_0_add_q : std_logic_vector (29 downto 0);
    signal Add_1_add_a : std_logic_vector(29 downto 0);
    signal Add_1_add_b : std_logic_vector(29 downto 0);
    signal Add_1_add_o : std_logic_vector (29 downto 0);
    signal Add_1_add_q : std_logic_vector (29 downto 0);
    signal Add_2_add_a : std_logic_vector(29 downto 0);
    signal Add_2_add_b : std_logic_vector(29 downto 0);
    signal Add_2_add_o : std_logic_vector (29 downto 0);
    signal Add_2_add_q : std_logic_vector (29 downto 0);
    signal Add_3_add_a : std_logic_vector(29 downto 0);
    signal Add_3_add_b : std_logic_vector(29 downto 0);
    signal Add_3_add_o : std_logic_vector (29 downto 0);
    signal Add_3_add_q : std_logic_vector (29 downto 0);
    signal Add_4_add_a : std_logic_vector(29 downto 0);
    signal Add_4_add_b : std_logic_vector(29 downto 0);
    signal Add_4_add_o : std_logic_vector (29 downto 0);
    signal Add_4_add_q : std_logic_vector (29 downto 0);
    signal Add_5_add_a : std_logic_vector(29 downto 0);
    signal Add_5_add_b : std_logic_vector(29 downto 0);
    signal Add_5_add_o : std_logic_vector (29 downto 0);
    signal Add_5_add_q : std_logic_vector (29 downto 0);
    signal Add_6_add_a : std_logic_vector(29 downto 0);
    signal Add_6_add_b : std_logic_vector(29 downto 0);
    signal Add_6_add_o : std_logic_vector (29 downto 0);
    signal Add_6_add_q : std_logic_vector (29 downto 0);
    signal Add_7_add_a : std_logic_vector(29 downto 0);
    signal Add_7_add_b : std_logic_vector(29 downto 0);
    signal Add_7_add_o : std_logic_vector (29 downto 0);
    signal Add_7_add_q : std_logic_vector (29 downto 0);
    signal Add1_0_add_a : std_logic_vector(29 downto 0);
    signal Add1_0_add_b : std_logic_vector(29 downto 0);
    signal Add1_0_add_o : std_logic_vector (29 downto 0);
    signal Add1_0_add_q : std_logic_vector (29 downto 0);
    signal Add1_1_add_a : std_logic_vector(29 downto 0);
    signal Add1_1_add_b : std_logic_vector(29 downto 0);
    signal Add1_1_add_o : std_logic_vector (29 downto 0);
    signal Add1_1_add_q : std_logic_vector (29 downto 0);
    signal Add1_2_add_a : std_logic_vector(29 downto 0);
    signal Add1_2_add_b : std_logic_vector(29 downto 0);
    signal Add1_2_add_o : std_logic_vector (29 downto 0);
    signal Add1_2_add_q : std_logic_vector (29 downto 0);
    signal Add1_3_add_a : std_logic_vector(29 downto 0);
    signal Add1_3_add_b : std_logic_vector(29 downto 0);
    signal Add1_3_add_o : std_logic_vector (29 downto 0);
    signal Add1_3_add_q : std_logic_vector (29 downto 0);
    signal Add1_4_add_a : std_logic_vector(29 downto 0);
    signal Add1_4_add_b : std_logic_vector(29 downto 0);
    signal Add1_4_add_o : std_logic_vector (29 downto 0);
    signal Add1_4_add_q : std_logic_vector (29 downto 0);
    signal Add1_5_add_a : std_logic_vector(29 downto 0);
    signal Add1_5_add_b : std_logic_vector(29 downto 0);
    signal Add1_5_add_o : std_logic_vector (29 downto 0);
    signal Add1_5_add_q : std_logic_vector (29 downto 0);
    signal Add1_6_add_a : std_logic_vector(29 downto 0);
    signal Add1_6_add_b : std_logic_vector(29 downto 0);
    signal Add1_6_add_o : std_logic_vector (29 downto 0);
    signal Add1_6_add_q : std_logic_vector (29 downto 0);
    signal Add1_7_add_a : std_logic_vector(29 downto 0);
    signal Add1_7_add_b : std_logic_vector(29 downto 0);
    signal Add1_7_add_o : std_logic_vector (29 downto 0);
    signal Add1_7_add_q : std_logic_vector (29 downto 0);
begin


	--GND(CONSTANT,0)

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--Add1_7_add(ADD,17)@0
    Add1_7_add_a <= STD_LOGIC_VECTOR((29 downto 29 => band0_b_7(28)) & band0_b_7);
    Add1_7_add_b <= STD_LOGIC_VECTOR((29 downto 29 => band1_b_7(28)) & band1_b_7);
            Add1_7_add_o <= STD_LOGIC_VECTOR(SIGNED(Add1_7_add_a) + SIGNED(Add1_7_add_b));
    Add1_7_add_q <= Add1_7_add_o(29 downto 0);


	--Add1_6_add(ADD,16)@0
    Add1_6_add_a <= STD_LOGIC_VECTOR((29 downto 29 => band0_b_6(28)) & band0_b_6);
    Add1_6_add_b <= STD_LOGIC_VECTOR((29 downto 29 => band1_b_6(28)) & band1_b_6);
            Add1_6_add_o <= STD_LOGIC_VECTOR(SIGNED(Add1_6_add_a) + SIGNED(Add1_6_add_b));
    Add1_6_add_q <= Add1_6_add_o(29 downto 0);


	--Add1_5_add(ADD,15)@0
    Add1_5_add_a <= STD_LOGIC_VECTOR((29 downto 29 => band0_b_5(28)) & band0_b_5);
    Add1_5_add_b <= STD_LOGIC_VECTOR((29 downto 29 => band1_b_5(28)) & band1_b_5);
            Add1_5_add_o <= STD_LOGIC_VECTOR(SIGNED(Add1_5_add_a) + SIGNED(Add1_5_add_b));
    Add1_5_add_q <= Add1_5_add_o(29 downto 0);


	--Add1_4_add(ADD,14)@0
    Add1_4_add_a <= STD_LOGIC_VECTOR((29 downto 29 => band0_b_4(28)) & band0_b_4);
    Add1_4_add_b <= STD_LOGIC_VECTOR((29 downto 29 => band1_b_4(28)) & band1_b_4);
            Add1_4_add_o <= STD_LOGIC_VECTOR(SIGNED(Add1_4_add_a) + SIGNED(Add1_4_add_b));
    Add1_4_add_q <= Add1_4_add_o(29 downto 0);


	--Add1_3_add(ADD,13)@0
    Add1_3_add_a <= STD_LOGIC_VECTOR((29 downto 29 => band0_b_3(28)) & band0_b_3);
    Add1_3_add_b <= STD_LOGIC_VECTOR((29 downto 29 => band1_b_3(28)) & band1_b_3);
            Add1_3_add_o <= STD_LOGIC_VECTOR(SIGNED(Add1_3_add_a) + SIGNED(Add1_3_add_b));
    Add1_3_add_q <= Add1_3_add_o(29 downto 0);


	--Add1_2_add(ADD,12)@0
    Add1_2_add_a <= STD_LOGIC_VECTOR((29 downto 29 => band0_b_2(28)) & band0_b_2);
    Add1_2_add_b <= STD_LOGIC_VECTOR((29 downto 29 => band1_b_2(28)) & band1_b_2);
            Add1_2_add_o <= STD_LOGIC_VECTOR(SIGNED(Add1_2_add_a) + SIGNED(Add1_2_add_b));
    Add1_2_add_q <= Add1_2_add_o(29 downto 0);


	--Add1_1_add(ADD,11)@0
    Add1_1_add_a <= STD_LOGIC_VECTOR((29 downto 29 => band0_b_1(28)) & band0_b_1);
    Add1_1_add_b <= STD_LOGIC_VECTOR((29 downto 29 => band1_b_1(28)) & band1_b_1);
            Add1_1_add_o <= STD_LOGIC_VECTOR(SIGNED(Add1_1_add_a) + SIGNED(Add1_1_add_b));
    Add1_1_add_q <= Add1_1_add_o(29 downto 0);


	--Add1_0_add(ADD,10)@0
    Add1_0_add_a <= STD_LOGIC_VECTOR((29 downto 29 => band0_b_0(28)) & band0_b_0);
    Add1_0_add_b <= STD_LOGIC_VECTOR((29 downto 29 => band1_b_0(28)) & band1_b_0);
            Add1_0_add_o <= STD_LOGIC_VECTOR(SIGNED(Add1_0_add_a) + SIGNED(Add1_0_add_b));
    Add1_0_add_q <= Add1_0_add_o(29 downto 0);


	--Add_7_add(ADD,9)@0
    Add_7_add_a <= STD_LOGIC_VECTOR((29 downto 29 => band0_a_7(28)) & band0_a_7);
    Add_7_add_b <= STD_LOGIC_VECTOR((29 downto 29 => band1_a_7(28)) & band1_a_7);
            Add_7_add_o <= STD_LOGIC_VECTOR(SIGNED(Add_7_add_a) + SIGNED(Add_7_add_b));
    Add_7_add_q <= Add_7_add_o(29 downto 0);


	--Add_6_add(ADD,8)@0
    Add_6_add_a <= STD_LOGIC_VECTOR((29 downto 29 => band0_a_6(28)) & band0_a_6);
    Add_6_add_b <= STD_LOGIC_VECTOR((29 downto 29 => band1_a_6(28)) & band1_a_6);
            Add_6_add_o <= STD_LOGIC_VECTOR(SIGNED(Add_6_add_a) + SIGNED(Add_6_add_b));
    Add_6_add_q <= Add_6_add_o(29 downto 0);


	--Add_5_add(ADD,7)@0
    Add_5_add_a <= STD_LOGIC_VECTOR((29 downto 29 => band0_a_5(28)) & band0_a_5);
    Add_5_add_b <= STD_LOGIC_VECTOR((29 downto 29 => band1_a_5(28)) & band1_a_5);
            Add_5_add_o <= STD_LOGIC_VECTOR(SIGNED(Add_5_add_a) + SIGNED(Add_5_add_b));
    Add_5_add_q <= Add_5_add_o(29 downto 0);


	--Add_4_add(ADD,6)@0
    Add_4_add_a <= STD_LOGIC_VECTOR((29 downto 29 => band0_a_4(28)) & band0_a_4);
    Add_4_add_b <= STD_LOGIC_VECTOR((29 downto 29 => band1_a_4(28)) & band1_a_4);
            Add_4_add_o <= STD_LOGIC_VECTOR(SIGNED(Add_4_add_a) + SIGNED(Add_4_add_b));
    Add_4_add_q <= Add_4_add_o(29 downto 0);


	--Add_3_add(ADD,5)@0
    Add_3_add_a <= STD_LOGIC_VECTOR((29 downto 29 => band0_a_3(28)) & band0_a_3);
    Add_3_add_b <= STD_LOGIC_VECTOR((29 downto 29 => band1_a_3(28)) & band1_a_3);
            Add_3_add_o <= STD_LOGIC_VECTOR(SIGNED(Add_3_add_a) + SIGNED(Add_3_add_b));
    Add_3_add_q <= Add_3_add_o(29 downto 0);


	--Add_2_add(ADD,4)@0
    Add_2_add_a <= STD_LOGIC_VECTOR((29 downto 29 => band0_a_2(28)) & band0_a_2);
    Add_2_add_b <= STD_LOGIC_VECTOR((29 downto 29 => band1_a_2(28)) & band1_a_2);
            Add_2_add_o <= STD_LOGIC_VECTOR(SIGNED(Add_2_add_a) + SIGNED(Add_2_add_b));
    Add_2_add_q <= Add_2_add_o(29 downto 0);


	--Add_1_add(ADD,3)@0
    Add_1_add_a <= STD_LOGIC_VECTOR((29 downto 29 => band0_a_1(28)) & band0_a_1);
    Add_1_add_b <= STD_LOGIC_VECTOR((29 downto 29 => band1_a_1(28)) & band1_a_1);
            Add_1_add_o <= STD_LOGIC_VECTOR(SIGNED(Add_1_add_a) + SIGNED(Add_1_add_b));
    Add_1_add_q <= Add_1_add_o(29 downto 0);


	--Add_0_add(ADD,2)@0
    Add_0_add_a <= STD_LOGIC_VECTOR((29 downto 29 => band0_a_0(28)) & band0_a_0);
    Add_0_add_b <= STD_LOGIC_VECTOR((29 downto 29 => band1_a_0(28)) & band1_a_0);
            Add_0_add_o <= STD_LOGIC_VECTOR(SIGNED(Add_0_add_a) + SIGNED(Add_0_add_b));
    Add_0_add_q <= Add_0_add_o(29 downto 0);


	--ChannelIn(PORTIN,18)@0

	--ChannelOut(PORTOUT,19)@0
    vout_s <= vin_s;
    cout_s <= cin_s;
    a_0 <= Add_0_add_q;
    a_1 <= Add_1_add_q;
    a_2 <= Add_2_add_q;
    a_3 <= Add_3_add_q;
    a_4 <= Add_4_add_q;
    a_5 <= Add_5_add_q;
    a_6 <= Add_6_add_q;
    a_7 <= Add_7_add_q;
    b_0 <= Add1_0_add_q;
    b_1 <= Add1_1_add_q;
    b_2 <= Add1_2_add_q;
    b_3 <= Add1_3_add_q;
    b_4 <= Add1_4_add_q;
    b_5 <= Add1_5_add_q;
    b_6 <= Add1_6_add_q;
    b_7 <= Add1_7_add_q;


end normal;
