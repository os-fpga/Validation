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

-- VHDL created from DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Interleaver3
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
entity DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Interleaver3 is
    port (
        vin : in std_logic_vector(0 downto 0);
        cin : in std_logic_vector(7 downto 0);
        i1 : in std_logic_vector(34 downto 0);
        i2 : in std_logic_vector(34 downto 0);
        q1 : in std_logic_vector(34 downto 0);
        q2 : in std_logic_vector(34 downto 0);
        vout : out std_logic_vector(0 downto 0);
        cout : out std_logic_vector(7 downto 0);
        qout : out std_logic_vector(34 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_Interleaver3 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal SelectData_q : std_logic_vector (34 downto 0);
    signal SelectData_v : std_logic_vector (0 downto 0);
    signal SelectValid_q : std_logic_vector (0 downto 0);
    signal SelectValid_v : std_logic_vector (0 downto 0);
    signal ValidDelay_q : std_logic_vector (0 downto 0);
    signal ValidDelay1_q : std_logic_vector (0 downto 0);
    signal ValidDelay2_q : std_logic_vector (0 downto 0);
    signal delay_q : std_logic_vector (0 downto 0);
    signal delay1_q : std_logic_vector (0 downto 0);
    signal delay2_q : std_logic_vector (0 downto 0);
    signal delayChanBy3_q : std_logic_vector (7 downto 0);
    signal delayi2by1_q : std_logic_vector (34 downto 0);
    signal delayq1by2_q : std_logic_vector (34 downto 0);
    signal delayq2by3_q : std_logic_vector (34 downto 0);
    signal reg_delay2_0_to_SelectValid_7_q : std_logic_vector (0 downto 0);
    signal reg_delay1_0_to_SelectValid_5_q : std_logic_vector (0 downto 0);
    signal reg_delay_0_to_SelectValid_3_q : std_logic_vector (0 downto 0);
    signal reg_CmpEQ0_0_to_SelectValid_1_q : std_logic_vector (0 downto 0);
    signal reg_delay2_0_to_SelectData_7_q : std_logic_vector (0 downto 0);
    signal reg_delay1_0_to_SelectData_5_q : std_logic_vector (0 downto 0);
    signal reg_delay_0_to_SelectData_3_q : std_logic_vector (0 downto 0);
    signal reg_CmpEQ0_0_to_SelectData_1_q : std_logic_vector (0 downto 0);
    signal ld_delayChanBy3_q_to_ChannelOut_cout_q : std_logic_vector (7 downto 0);
    signal delayq2by3_outputreg_q : std_logic_vector (34 downto 0);
    signal CmpEQ0_a : std_logic_vector(7 downto 0);
    signal CmpEQ0_b : std_logic_vector(7 downto 0);
    signal CmpEQ0_q : std_logic_vector(0 downto 0);
begin


	--GND(CONSTANT,0)
    GND_q <= "0";

	--delayq2by3(DELAY,18)@1
    delayq2by3 : dspba_delay
    GENERIC MAP ( width => 35, depth => 2 )
    PORT MAP ( xin => q2, xout => delayq2by3_q, clk => clk, aclr => areset );

	--delayq2by3_outputreg(DELAY,60)
    delayq2by3_outputreg : dspba_delay
    GENERIC MAP ( width => 35, depth => 1 )
    PORT MAP ( xin => delayq2by3_q, xout => delayq2by3_outputreg_q, clk => clk, aclr => areset );

	--delayChanBy3(DELAY,15)@1
    delayChanBy3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2 )
    PORT MAP ( xin => cin, xout => delayChanBy3_q, clk => clk, aclr => areset );

	--CmpEQ0(LOGICAL,4)@0
    CmpEQ0_a <= delayChanBy3_q;
    CmpEQ0_b <= STD_LOGIC_VECTOR("0000000" & GND_q);
    CmpEQ0_q <= "1" when CmpEQ0_a = CmpEQ0_b else "0";

	--delay(DELAY,12)@0
    delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => CmpEQ0_q, xout => delay_q, clk => clk, aclr => areset );

	--delay1(DELAY,13)@0
    delay1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => delay_q, xout => delay1_q, clk => clk, aclr => areset );

	--delay2(DELAY,14)@0
    delay2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => delay1_q, xout => delay2_q, clk => clk, aclr => areset );

	--reg_delay2_0_to_SelectData_7(REG,32)@0
    reg_delay2_0_to_SelectData_7: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_delay2_0_to_SelectData_7_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_delay2_0_to_SelectData_7_q <= delay2_q;
        END IF;
    END PROCESS;


	--delayq1by2(DELAY,17)@1
    delayq1by2 : dspba_delay
    GENERIC MAP ( width => 35, depth => 2 )
    PORT MAP ( xin => q1, xout => delayq1by2_q, clk => clk, aclr => areset );

	--reg_delay1_0_to_SelectData_5(REG,33)@0
    reg_delay1_0_to_SelectData_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_delay1_0_to_SelectData_5_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_delay1_0_to_SelectData_5_q <= delay1_q;
        END IF;
    END PROCESS;


	--delayi2by1(DELAY,16)@1
    delayi2by1 : dspba_delay
    GENERIC MAP ( width => 35, depth => 1 )
    PORT MAP ( xin => i2, xout => delayi2by1_q, clk => clk, aclr => areset );

	--reg_delay_0_to_SelectData_3(REG,34)@0
    reg_delay_0_to_SelectData_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_delay_0_to_SelectData_3_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_delay_0_to_SelectData_3_q <= delay_q;
        END IF;
    END PROCESS;


	--ChannelIn(PORTIN,2)@1

	--reg_CmpEQ0_0_to_SelectData_1(REG,35)@0
    reg_CmpEQ0_0_to_SelectData_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_CmpEQ0_0_to_SelectData_1_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_CmpEQ0_0_to_SelectData_1_q <= CmpEQ0_q;
        END IF;
    END PROCESS;


	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--SelectData(SELECTOR,5)@1
    SelectData: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            SelectData_q <= (others => '0');
            SelectData_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            SelectData_q <= STD_LOGIC_VECTOR("0000" & GND_q & "000000000000000000000000000000");
            SelectData_v <= (others => '0');
            IF (reg_delay2_0_to_SelectData_7_q = "1") THEN
                SelectData_q <= delayq2by3_outputreg_q;
                SelectData_v <= "1";
            END IF;
            IF (reg_delay1_0_to_SelectData_5_q = "1") THEN
                SelectData_q <= delayq1by2_q;
                SelectData_v <= "1";
            END IF;
            IF (reg_delay_0_to_SelectData_3_q = "1") THEN
                SelectData_q <= delayi2by1_q;
                SelectData_v <= "1";
            END IF;
            IF (reg_CmpEQ0_0_to_SelectData_1_q = "1") THEN
                SelectData_q <= i1;
                SelectData_v <= "1";
            END IF;
        END IF;
    END PROCESS;


	--ld_delayChanBy3_q_to_ChannelOut_cout(DELAY,37)@0
    ld_delayChanBy3_q_to_ChannelOut_cout : dspba_delay
    GENERIC MAP ( width => 8, depth => 2 )
    PORT MAP ( xin => delayChanBy3_q, xout => ld_delayChanBy3_q_to_ChannelOut_cout_q, clk => clk, aclr => areset );

	--ValidDelay2(DELAY,9)@1
    ValidDelay2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => ValidDelay1_q, xout => ValidDelay2_q, clk => clk, aclr => areset );

	--reg_delay2_0_to_SelectValid_7(REG,28)@0
    reg_delay2_0_to_SelectValid_7: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_delay2_0_to_SelectValid_7_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_delay2_0_to_SelectValid_7_q <= delay2_q;
        END IF;
    END PROCESS;


	--ValidDelay1(DELAY,8)@1
    ValidDelay1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => ValidDelay_q, xout => ValidDelay1_q, clk => clk, aclr => areset );

	--reg_delay1_0_to_SelectValid_5(REG,29)@0
    reg_delay1_0_to_SelectValid_5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_delay1_0_to_SelectValid_5_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_delay1_0_to_SelectValid_5_q <= delay1_q;
        END IF;
    END PROCESS;


	--ValidDelay(DELAY,7)@1
    ValidDelay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vin, xout => ValidDelay_q, clk => clk, aclr => areset );

	--reg_delay_0_to_SelectValid_3(REG,30)@0
    reg_delay_0_to_SelectValid_3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_delay_0_to_SelectValid_3_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_delay_0_to_SelectValid_3_q <= delay_q;
        END IF;
    END PROCESS;


	--reg_CmpEQ0_0_to_SelectValid_1(REG,31)@0
    reg_CmpEQ0_0_to_SelectValid_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_CmpEQ0_0_to_SelectValid_1_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            reg_CmpEQ0_0_to_SelectValid_1_q <= CmpEQ0_q;
        END IF;
    END PROCESS;


	--SelectValid(SELECTOR,6)@1
    SelectValid: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            SelectValid_q <= (others => '0');
            SelectValid_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            SelectValid_q <= GND_q;
            SelectValid_v <= (others => '0');
            IF (reg_delay2_0_to_SelectValid_7_q = "1") THEN
                SelectValid_q <= ValidDelay2_q;
                SelectValid_v <= "1";
            END IF;
            IF (reg_delay1_0_to_SelectValid_5_q = "1") THEN
                SelectValid_q <= ValidDelay1_q;
                SelectValid_v <= "1";
            END IF;
            IF (reg_delay_0_to_SelectValid_3_q = "1") THEN
                SelectValid_q <= ValidDelay_q;
                SelectValid_v <= "1";
            END IF;
            IF (reg_CmpEQ0_0_to_SelectValid_1_q = "1") THEN
                SelectValid_q <= vin;
                SelectValid_v <= "1";
            END IF;
        END IF;
    END PROCESS;


	--ChannelOut(PORTOUT,3)@2
    vout <= SelectValid_q;
    cout <= ld_delayChanBy3_q_to_ChannelOut_cout_q;
    qout <= SelectData_q;


end normal;
