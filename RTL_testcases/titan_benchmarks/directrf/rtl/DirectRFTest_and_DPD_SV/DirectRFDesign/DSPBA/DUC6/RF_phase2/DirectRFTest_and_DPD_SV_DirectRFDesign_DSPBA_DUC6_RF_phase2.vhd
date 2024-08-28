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

-- VHDL created from DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_RF_phase2
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
entity DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_RF_phase2 is
    port (
        out_00 : out std_logic_vector(17 downto 0);
        out_01 : out std_logic_vector(17 downto 0);
        out_02 : out std_logic_vector(17 downto 0);
        out_03 : out std_logic_vector(17 downto 0);
        out_04 : out std_logic_vector(17 downto 0);
        out_05 : out std_logic_vector(17 downto 0);
        out_06 : out std_logic_vector(17 downto 0);
        out_07 : out std_logic_vector(17 downto 0);
        out_08 : out std_logic_vector(17 downto 0);
        out_09 : out std_logic_vector(17 downto 0);
        out_10 : out std_logic_vector(17 downto 0);
        out_11 : out std_logic_vector(17 downto 0);
        out_12 : out std_logic_vector(17 downto 0);
        out_13 : out std_logic_vector(17 downto 0);
        out_14 : out std_logic_vector(17 downto 0);
        out_15 : out std_logic_vector(17 downto 0);
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

architecture normal of DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC6_RF_phase2 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal VCC_q : std_logic_vector (0 downto 0);
    signal busReadSelector_q : std_logic_vector (63 downto 0);
    signal busReadSelector_v : std_logic_vector (0 downto 0);
    signal RegField1_dec_q : std_logic_vector(0 downto 0);
    signal RegField1_dec_h : std_logic_vector(0 downto 0);
    signal RegField1_q : std_logic_vector (17 downto 0);
    signal RegField10_dec_q : std_logic_vector(0 downto 0);
    signal RegField10_dec_h : std_logic_vector(0 downto 0);
    signal RegField10_q : std_logic_vector (17 downto 0);
    signal RegField11_dec_q : std_logic_vector(0 downto 0);
    signal RegField11_dec_h : std_logic_vector(0 downto 0);
    signal RegField11_q : std_logic_vector (17 downto 0);
    signal RegField12_dec_q : std_logic_vector(0 downto 0);
    signal RegField12_dec_h : std_logic_vector(0 downto 0);
    signal RegField12_q : std_logic_vector (17 downto 0);
    signal RegField13_dec_q : std_logic_vector(0 downto 0);
    signal RegField13_dec_h : std_logic_vector(0 downto 0);
    signal RegField13_q : std_logic_vector (17 downto 0);
    signal RegField14_dec_q : std_logic_vector(0 downto 0);
    signal RegField14_dec_h : std_logic_vector(0 downto 0);
    signal RegField14_q : std_logic_vector (17 downto 0);
    signal RegField15_dec_q : std_logic_vector(0 downto 0);
    signal RegField15_dec_h : std_logic_vector(0 downto 0);
    signal RegField15_q : std_logic_vector (17 downto 0);
    signal RegField16_dec_q : std_logic_vector(0 downto 0);
    signal RegField16_dec_h : std_logic_vector(0 downto 0);
    signal RegField16_q : std_logic_vector (17 downto 0);
    signal RegField2_dec_q : std_logic_vector(0 downto 0);
    signal RegField2_dec_h : std_logic_vector(0 downto 0);
    signal RegField2_q : std_logic_vector (17 downto 0);
    signal RegField3_dec_q : std_logic_vector(0 downto 0);
    signal RegField3_dec_h : std_logic_vector(0 downto 0);
    signal RegField3_q : std_logic_vector (17 downto 0);
    signal RegField4_dec_q : std_logic_vector(0 downto 0);
    signal RegField4_dec_h : std_logic_vector(0 downto 0);
    signal RegField4_q : std_logic_vector (17 downto 0);
    signal RegField5_dec_q : std_logic_vector(0 downto 0);
    signal RegField5_dec_h : std_logic_vector(0 downto 0);
    signal RegField5_q : std_logic_vector (17 downto 0);
    signal RegField6_dec_q : std_logic_vector(0 downto 0);
    signal RegField6_dec_h : std_logic_vector(0 downto 0);
    signal RegField6_q : std_logic_vector (17 downto 0);
    signal RegField7_dec_q : std_logic_vector(0 downto 0);
    signal RegField7_dec_h : std_logic_vector(0 downto 0);
    signal RegField7_q : std_logic_vector (17 downto 0);
    signal RegField8_dec_q : std_logic_vector(0 downto 0);
    signal RegField8_dec_h : std_logic_vector(0 downto 0);
    signal RegField8_q : std_logic_vector (17 downto 0);
    signal RegField9_dec_q : std_logic_vector(0 downto 0);
    signal RegField9_dec_h : std_logic_vector(0 downto 0);
    signal RegField9_q : std_logic_vector (17 downto 0);
begin


	--GND(CONSTANT,0)

	--RegField1_dec(DECODE,24)
    RegField1_dec: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField1_dec_q <= (others => '0');
            RegField1_dec_h <= (others => '0');
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF UNSIGNED(busIn_a(11 downto 0)) = 1216 THEN
                RegField1_dec_q <= busIn_w;
                RegField1_dec_h <= "1";
            ELSE
                RegField1_dec_q <= "0";
                RegField1_dec_h <= "0";
            END IF;
        END IF;
    END PROCESS;


	--busIn(BUSIN,18)

	--RegField1(REG,25)
    RegField1: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField1_q <= "000000000000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (RegField1_dec_q = "1") THEN
                RegField1_q <= busIn_d(17 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u0_out_auto(GPOUT,2)
    out_00 <= RegField1_q;


	--RegField2_dec(DECODE,64)
    RegField2_dec: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField2_dec_q <= (others => '0');
            RegField2_dec_h <= (others => '0');
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF UNSIGNED(busIn_a(11 downto 0)) = 1217 THEN
                RegField2_dec_q <= busIn_w;
                RegField2_dec_h <= "1";
            ELSE
                RegField2_dec_q <= "0";
                RegField2_dec_h <= "0";
            END IF;
        END IF;
    END PROCESS;


	--RegField2(REG,65)
    RegField2: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField2_q <= "001101011100000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (RegField2_dec_q = "1") THEN
                RegField2_q <= busIn_d(17 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u1_out_auto(GPOUT,3)
    out_01 <= RegField2_q;


	--RegField3_dec(DECODE,69)
    RegField3_dec: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField3_dec_q <= (others => '0');
            RegField3_dec_h <= (others => '0');
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF UNSIGNED(busIn_a(11 downto 0)) = 1218 THEN
                RegField3_dec_q <= busIn_w;
                RegField3_dec_h <= "1";
            ELSE
                RegField3_dec_q <= "0";
                RegField3_dec_h <= "0";
            END IF;
        END IF;
    END PROCESS;


	--RegField3(REG,70)
    RegField3: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField3_q <= "011010111000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (RegField3_dec_q = "1") THEN
                RegField3_q <= busIn_d(17 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u2_out_auto(GPOUT,4)
    out_02 <= RegField3_q;


	--RegField4_dec(DECODE,74)
    RegField4_dec: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField4_dec_q <= (others => '0');
            RegField4_dec_h <= (others => '0');
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF UNSIGNED(busIn_a(11 downto 0)) = 1219 THEN
                RegField4_dec_q <= busIn_w;
                RegField4_dec_h <= "1";
            ELSE
                RegField4_dec_q <= "0";
                RegField4_dec_h <= "0";
            END IF;
        END IF;
    END PROCESS;


	--RegField4(REG,75)
    RegField4: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField4_q <= "101000010100000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (RegField4_dec_q = "1") THEN
                RegField4_q <= busIn_d(17 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u3_out_auto(GPOUT,5)
    out_03 <= RegField4_q;


	--RegField5_dec(DECODE,79)
    RegField5_dec: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField5_dec_q <= (others => '0');
            RegField5_dec_h <= (others => '0');
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF UNSIGNED(busIn_a(11 downto 0)) = 1220 THEN
                RegField5_dec_q <= busIn_w;
                RegField5_dec_h <= "1";
            ELSE
                RegField5_dec_q <= "0";
                RegField5_dec_h <= "0";
            END IF;
        END IF;
    END PROCESS;


	--RegField5(REG,80)
    RegField5: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField5_q <= "110101110000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (RegField5_dec_q = "1") THEN
                RegField5_q <= busIn_d(17 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u4_out_auto(GPOUT,6)
    out_04 <= RegField5_q;


	--RegField6_dec(DECODE,84)
    RegField6_dec: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField6_dec_q <= (others => '0');
            RegField6_dec_h <= (others => '0');
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF UNSIGNED(busIn_a(11 downto 0)) = 1221 THEN
                RegField6_dec_q <= busIn_w;
                RegField6_dec_h <= "1";
            ELSE
                RegField6_dec_q <= "0";
                RegField6_dec_h <= "0";
            END IF;
        END IF;
    END PROCESS;


	--RegField6(REG,85)
    RegField6: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField6_q <= "000011001100000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (RegField6_dec_q = "1") THEN
                RegField6_q <= busIn_d(17 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u5_out_auto(GPOUT,7)
    out_05 <= RegField6_q;


	--RegField7_dec(DECODE,89)
    RegField7_dec: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField7_dec_q <= (others => '0');
            RegField7_dec_h <= (others => '0');
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF UNSIGNED(busIn_a(11 downto 0)) = 1222 THEN
                RegField7_dec_q <= busIn_w;
                RegField7_dec_h <= "1";
            ELSE
                RegField7_dec_q <= "0";
                RegField7_dec_h <= "0";
            END IF;
        END IF;
    END PROCESS;


	--RegField7(REG,90)
    RegField7: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField7_q <= "010000101000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (RegField7_dec_q = "1") THEN
                RegField7_q <= busIn_d(17 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u6_out_auto(GPOUT,8)
    out_06 <= RegField7_q;


	--RegField8_dec(DECODE,94)
    RegField8_dec: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField8_dec_q <= (others => '0');
            RegField8_dec_h <= (others => '0');
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF UNSIGNED(busIn_a(11 downto 0)) = 1223 THEN
                RegField8_dec_q <= busIn_w;
                RegField8_dec_h <= "1";
            ELSE
                RegField8_dec_q <= "0";
                RegField8_dec_h <= "0";
            END IF;
        END IF;
    END PROCESS;


	--RegField8(REG,95)
    RegField8: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField8_q <= "011110000100000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (RegField8_dec_q = "1") THEN
                RegField8_q <= busIn_d(17 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u7_out_auto(GPOUT,9)
    out_07 <= RegField8_q;


	--RegField9_dec(DECODE,99)
    RegField9_dec: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField9_dec_q <= (others => '0');
            RegField9_dec_h <= (others => '0');
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF UNSIGNED(busIn_a(11 downto 0)) = 1224 THEN
                RegField9_dec_q <= busIn_w;
                RegField9_dec_h <= "1";
            ELSE
                RegField9_dec_q <= "0";
                RegField9_dec_h <= "0";
            END IF;
        END IF;
    END PROCESS;


	--RegField9(REG,100)
    RegField9: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField9_q <= "101011100000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (RegField9_dec_q = "1") THEN
                RegField9_q <= busIn_d(17 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u8_out_auto(GPOUT,10)
    out_08 <= RegField9_q;


	--RegField10_dec(DECODE,29)
    RegField10_dec: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField10_dec_q <= (others => '0');
            RegField10_dec_h <= (others => '0');
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF UNSIGNED(busIn_a(11 downto 0)) = 1225 THEN
                RegField10_dec_q <= busIn_w;
                RegField10_dec_h <= "1";
            ELSE
                RegField10_dec_q <= "0";
                RegField10_dec_h <= "0";
            END IF;
        END IF;
    END PROCESS;


	--RegField10(REG,30)
    RegField10: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField10_q <= "111000111100000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (RegField10_dec_q = "1") THEN
                RegField10_q <= busIn_d(17 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u9_out_auto(GPOUT,11)
    out_09 <= RegField10_q;


	--RegField11_dec(DECODE,34)
    RegField11_dec: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField11_dec_q <= (others => '0');
            RegField11_dec_h <= (others => '0');
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF UNSIGNED(busIn_a(11 downto 0)) = 1226 THEN
                RegField11_dec_q <= busIn_w;
                RegField11_dec_h <= "1";
            ELSE
                RegField11_dec_q <= "0";
                RegField11_dec_h <= "0";
            END IF;
        END IF;
    END PROCESS;


	--RegField11(REG,35)
    RegField11: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField11_q <= "000110011000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (RegField11_dec_q = "1") THEN
                RegField11_q <= busIn_d(17 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u10_out_auto(GPOUT,12)
    out_10 <= RegField11_q;


	--RegField12_dec(DECODE,39)
    RegField12_dec: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField12_dec_q <= (others => '0');
            RegField12_dec_h <= (others => '0');
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF UNSIGNED(busIn_a(11 downto 0)) = 1227 THEN
                RegField12_dec_q <= busIn_w;
                RegField12_dec_h <= "1";
            ELSE
                RegField12_dec_q <= "0";
                RegField12_dec_h <= "0";
            END IF;
        END IF;
    END PROCESS;


	--RegField12(REG,40)
    RegField12: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField12_q <= "010011110100000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (RegField12_dec_q = "1") THEN
                RegField12_q <= busIn_d(17 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u11_out_auto(GPOUT,13)
    out_11 <= RegField12_q;


	--RegField13_dec(DECODE,44)
    RegField13_dec: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField13_dec_q <= (others => '0');
            RegField13_dec_h <= (others => '0');
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF UNSIGNED(busIn_a(11 downto 0)) = 1228 THEN
                RegField13_dec_q <= busIn_w;
                RegField13_dec_h <= "1";
            ELSE
                RegField13_dec_q <= "0";
                RegField13_dec_h <= "0";
            END IF;
        END IF;
    END PROCESS;


	--RegField13(REG,45)
    RegField13: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField13_q <= "100001010000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (RegField13_dec_q = "1") THEN
                RegField13_q <= busIn_d(17 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u12_out_auto(GPOUT,14)
    out_12 <= RegField13_q;


	--RegField14_dec(DECODE,49)
    RegField14_dec: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField14_dec_q <= (others => '0');
            RegField14_dec_h <= (others => '0');
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF UNSIGNED(busIn_a(11 downto 0)) = 1229 THEN
                RegField14_dec_q <= busIn_w;
                RegField14_dec_h <= "1";
            ELSE
                RegField14_dec_q <= "0";
                RegField14_dec_h <= "0";
            END IF;
        END IF;
    END PROCESS;


	--RegField14(REG,50)
    RegField14: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField14_q <= "101110101100000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (RegField14_dec_q = "1") THEN
                RegField14_q <= busIn_d(17 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u13_out_auto(GPOUT,15)
    out_13 <= RegField14_q;


	--RegField15_dec(DECODE,54)
    RegField15_dec: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField15_dec_q <= (others => '0');
            RegField15_dec_h <= (others => '0');
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF UNSIGNED(busIn_a(11 downto 0)) = 1230 THEN
                RegField15_dec_q <= busIn_w;
                RegField15_dec_h <= "1";
            ELSE
                RegField15_dec_q <= "0";
                RegField15_dec_h <= "0";
            END IF;
        END IF;
    END PROCESS;


	--RegField15(REG,55)
    RegField15: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField15_q <= "111100001000000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (RegField15_dec_q = "1") THEN
                RegField15_q <= busIn_d(17 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u14_out_auto(GPOUT,16)
    out_14 <= RegField15_q;


	--RegField16_dec(DECODE,59)
    RegField16_dec: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField16_dec_q <= (others => '0');
            RegField16_dec_h <= (others => '0');
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF UNSIGNED(busIn_a(11 downto 0)) = 1231 THEN
                RegField16_dec_q <= busIn_w;
                RegField16_dec_h <= "1";
            ELSE
                RegField16_dec_q <= "0";
                RegField16_dec_h <= "0";
            END IF;
        END IF;
    END PROCESS;


	--RegField16(REG,60)
    RegField16: PROCESS (bus_clk, bus_areset)
    BEGIN
        IF (bus_areset = '1') THEN
            RegField16_q <= "001001100100000000";
        ELSIF(bus_clk'EVENT AND bus_clk = '1') THEN
            IF (RegField16_dec_q = "1") THEN
                RegField16_q <= busIn_d(17 downto 0);
            END IF;
        END IF;
    END PROCESS;


	--u15_out_auto(GPOUT,17)
    out_15 <= RegField16_q;


	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--busReadSelector(SELECTOR,19)
    busReadSelector_q <= (others => '0');
    busReadSelector_v <= "0";

	--busOut(BUSOUT,20)
    busOut_v <= busReadSelector_v;
    busOut_r <= busReadSelector_q(31 downto 0);


end normal;
