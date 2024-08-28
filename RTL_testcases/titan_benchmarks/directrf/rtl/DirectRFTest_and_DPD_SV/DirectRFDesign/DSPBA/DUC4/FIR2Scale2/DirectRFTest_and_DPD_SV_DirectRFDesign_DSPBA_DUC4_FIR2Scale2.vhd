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

-- VHDL created from DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR2Scale2
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
entity DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR2Scale2 is
    port (
        xIn_v : in std_logic_vector(0 downto 0);
        xIn_c : in std_logic_vector(7 downto 0);
        xIn_0 : in std_logic_vector(30 downto 0);
        xIn_1 : in std_logic_vector(30 downto 0);
        gain_i : in std_logic_vector(0 downto 0);
        qOut_v : out std_logic_vector(0 downto 0);
        qOut_c : out std_logic_vector(7 downto 0);
        qOut_0 : out std_logic_vector(15 downto 0);
        qOut_1 : out std_logic_vector(15 downto 0);
        eOut_0 : out std_logic_vector(0 downto 0);
        eOut_1 : out std_logic_vector(0 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of DirectRFTest_and_DPD_SV_DirectRFDesign_DSPBA_DUC4_FIR2Scale2 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal gainReg_q : std_logic_vector (0 downto 0);
    signal u0_rnd_in : std_logic_vector (31 downto 0);
    signal u0_rnd_q : std_logic_vector (20 downto 0);
    signal u0_lowconst_q : std_logic_vector (15 downto 0);
    signal u0_highconst_q : std_logic_vector (15 downto 0);
    signal u0_low_a : std_logic_vector(23 downto 0);
    signal u0_low_b : std_logic_vector(23 downto 0);
    signal u0_low_o : std_logic_vector (23 downto 0);
    signal u0_low_cin : std_logic_vector (0 downto 0);
    signal u0_low_c : std_logic_vector (0 downto 0);
    signal u0_high_a : std_logic_vector(23 downto 0);
    signal u0_high_b : std_logic_vector(23 downto 0);
    signal u0_high_o : std_logic_vector (23 downto 0);
    signal u0_high_cin : std_logic_vector (0 downto 0);
    signal u0_high_n : std_logic_vector (0 downto 0);
    signal u0_mux_q : std_logic_vector (15 downto 0);
    signal u0_mux_v : std_logic_vector (0 downto 0);
    signal u1_rnd_in : std_logic_vector (31 downto 0);
    signal u1_rnd_q : std_logic_vector (20 downto 0);
    signal u1_low_a : std_logic_vector(23 downto 0);
    signal u1_low_b : std_logic_vector(23 downto 0);
    signal u1_low_o : std_logic_vector (23 downto 0);
    signal u1_low_cin : std_logic_vector (0 downto 0);
    signal u1_low_c : std_logic_vector (0 downto 0);
    signal u1_high_a : std_logic_vector(23 downto 0);
    signal u1_high_b : std_logic_vector(23 downto 0);
    signal u1_high_o : std_logic_vector (23 downto 0);
    signal u1_high_cin : std_logic_vector (0 downto 0);
    signal u1_high_n : std_logic_vector (0 downto 0);
    signal u1_mux_q : std_logic_vector (15 downto 0);
    signal u1_mux_v : std_logic_vector (0 downto 0);
    signal ld_xIn_v_to_u0_low_e_q : std_logic_vector (0 downto 0);
    signal ld_xIn_v_to_u0_mux_e_q : std_logic_vector (0 downto 0);
    signal ld_u0_rnd_q_to_u0_mux_cc_q : std_logic_vector (20 downto 0);
    signal ld_xIn_v_to_u0_exp_and_b_q : std_logic_vector (0 downto 0);
    signal ld_u1_rnd_q_to_u1_mux_cc_q : std_logic_vector (20 downto 0);
    signal ld_xIn_c_to_qOut_c_q : std_logic_vector (7 downto 0);
    signal u0_shiftsel_q_int : std_logic_vector (31 downto 0);
    signal u0_shiftsel_q : std_logic_vector (31 downto 0);
    signal u1_shiftsel_q_int : std_logic_vector (31 downto 0);
    signal u1_shiftsel_q : std_logic_vector (31 downto 0);
    signal u0_exp_and_a : std_logic_vector(0 downto 0);
    signal u0_exp_and_b : std_logic_vector(0 downto 0);
    signal u0_exp_and_q : std_logic_vector(0 downto 0);
    signal u1_exp_and_a : std_logic_vector(0 downto 0);
    signal u1_exp_and_b : std_logic_vector(0 downto 0);
    signal u1_exp_and_q : std_logic_vector(0 downto 0);
begin


	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--xIn(PORTIN,2)@0

	--gainReg(REG,3)@0
    gainReg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            gainReg_q <= "0";
        ELSIF(clk'EVENT AND clk = '1') THEN
            gainReg_q <= gain_i;
        END IF;
    END PROCESS;


	--u1_exp_and(LOGICAL,19)@3
    u1_exp_and_a <= u1_mux_v;
    u1_exp_and_b <= ld_xIn_v_to_u0_exp_and_b_q;
    u1_exp_and_q <= u1_exp_and_a and u1_exp_and_b;

	--u0_exp_and(LOGICAL,11)@3
    u0_exp_and_a <= u0_mux_v;
    u0_exp_and_b <= ld_xIn_v_to_u0_exp_and_b_q;
    u0_exp_and_q <= u0_exp_and_a and u0_exp_and_b;

	--u1_shiftsel(BITSHIFT,12)@0
    u1_shiftsel_q_int <= xIn_1 & "0";
    u1_shiftsel_q <= u1_shiftsel_q_int(31 downto 0);

	--u1_rnd(ROUND,13)@0
    u1_rnd_in <= u1_shiftsel_q;
    u1_rnd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_rnd_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u1_rnd_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u1_rnd_in(31 downto 11)), 21) + SIGNED(STD_LOGIC_VECTOR'("00000000000000000000" & u1_rnd_in(10 downto 10))));
            END IF;
        END IF;
    END PROCESS;


	--ld_u1_rnd_q_to_u1_mux_cc(DELAY,45)@1
    ld_u1_rnd_q_to_u1_mux_cc : dspba_delay
    GENERIC MAP ( width => 21, depth => 1 )
    PORT MAP ( xin => u1_rnd_q, xout => ld_u1_rnd_q_to_u1_mux_cc_q, clk => clk, aclr => areset );

	--u0_highconst(CONSTANT,7)
    u0_highconst_q <= "0111111111111111";

	--GND(CONSTANT,0)
    GND_q <= "0";

	--ld_xIn_v_to_u0_low_e(DELAY,26)@0
    ld_xIn_v_to_u0_low_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => xIn_v, xout => ld_xIn_v_to_u0_low_e_q, clk => clk, aclr => areset );

	--u1_high(COMPARE,17)@1
    u1_high_cin <= GND_q;
    u1_high_a <= STD_LOGIC_VECTOR((22 downto 21 => u1_rnd_q(20)) & u1_rnd_q) & '0';
    u1_high_b <= STD_LOGIC_VECTOR((22 downto 16 => u0_highconst_q(15)) & u0_highconst_q) & u1_high_cin(0);
    u1_high: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_high_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u1_high_o <= STD_LOGIC_VECTOR(SIGNED(u1_high_a) - SIGNED(u1_high_b));
            END IF;
        END IF;
    END PROCESS;
    u1_high_n(0) <= not u1_high_o(23);


	--u0_lowconst(CONSTANT,6)
    u0_lowconst_q <= "1000000000000001";

	--u1_low(COMPARE,16)@1
    u1_low_cin <= GND_q;
    u1_low_a <= STD_LOGIC_VECTOR((22 downto 21 => u1_rnd_q(20)) & u1_rnd_q) & '0';
    u1_low_b <= STD_LOGIC_VECTOR((22 downto 16 => u0_lowconst_q(15)) & u0_lowconst_q) & u1_low_cin(0);
    u1_low: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_low_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u1_low_o <= STD_LOGIC_VECTOR(SIGNED(u1_low_a) - SIGNED(u1_low_b));
            END IF;
        END IF;
    END PROCESS;
    u1_low_c(0) <= u1_low_o(23);


	--ld_xIn_v_to_u0_mux_e(DELAY,29)@0
    ld_xIn_v_to_u0_mux_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => xIn_v, xout => ld_xIn_v_to_u0_mux_e_q, clk => clk, aclr => areset );

	--u1_mux(SELECTOR,18)@2
    u1_mux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u1_mux_q <= (others => '0');
            u1_mux_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_mux_e_q = "1") THEN
                u1_mux_q <= ld_u1_rnd_q_to_u1_mux_cc_q(15 downto 0);
                u1_mux_v <= (others => '0');
                IF (u1_high_n = "1") THEN
                    u1_mux_q <= u0_highconst_q;
                    u1_mux_v <= "1";
                END IF;
                IF (u1_low_c = "1") THEN
                    u1_mux_q <= u0_lowconst_q;
                    u1_mux_v <= "1";
                END IF;
            END IF;
        END IF;
    END PROCESS;


	--u0_shiftsel(BITSHIFT,4)@0
    u0_shiftsel_q_int <= xIn_0 & "0";
    u0_shiftsel_q <= u0_shiftsel_q_int(31 downto 0);

	--u0_rnd(ROUND,5)@0
    u0_rnd_in <= u0_shiftsel_q;
    u0_rnd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_rnd_q <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (xIn_v = "1") THEN
                u0_rnd_q <= STD_LOGIC_VECTOR(RESIZE(SIGNED(u0_rnd_in(31 downto 11)), 21) + SIGNED(STD_LOGIC_VECTOR'("00000000000000000000" & u0_rnd_in(10 downto 10))));
            END IF;
        END IF;
    END PROCESS;


	--ld_u0_rnd_q_to_u0_mux_cc(DELAY,32)@1
    ld_u0_rnd_q_to_u0_mux_cc : dspba_delay
    GENERIC MAP ( width => 21, depth => 1 )
    PORT MAP ( xin => u0_rnd_q, xout => ld_u0_rnd_q_to_u0_mux_cc_q, clk => clk, aclr => areset );

	--u0_high(COMPARE,9)@1
    u0_high_cin <= GND_q;
    u0_high_a <= STD_LOGIC_VECTOR((22 downto 21 => u0_rnd_q(20)) & u0_rnd_q) & '0';
    u0_high_b <= STD_LOGIC_VECTOR((22 downto 16 => u0_highconst_q(15)) & u0_highconst_q) & u0_high_cin(0);
    u0_high: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_high_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u0_high_o <= STD_LOGIC_VECTOR(SIGNED(u0_high_a) - SIGNED(u0_high_b));
            END IF;
        END IF;
    END PROCESS;
    u0_high_n(0) <= not u0_high_o(23);


	--u0_low(COMPARE,8)@1
    u0_low_cin <= GND_q;
    u0_low_a <= STD_LOGIC_VECTOR((22 downto 21 => u0_rnd_q(20)) & u0_rnd_q) & '0';
    u0_low_b <= STD_LOGIC_VECTOR((22 downto 16 => u0_lowconst_q(15)) & u0_lowconst_q) & u0_low_cin(0);
    u0_low: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_low_o <= (others => '0');
        ELSIF(clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_low_e_q = "1") THEN
                u0_low_o <= STD_LOGIC_VECTOR(SIGNED(u0_low_a) - SIGNED(u0_low_b));
            END IF;
        END IF;
    END PROCESS;
    u0_low_c(0) <= u0_low_o(23);


	--u0_mux(SELECTOR,10)@2
    u0_mux: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_mux_q <= (others => '0');
            u0_mux_v <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (ld_xIn_v_to_u0_mux_e_q = "1") THEN
                u0_mux_q <= ld_u0_rnd_q_to_u0_mux_cc_q(15 downto 0);
                u0_mux_v <= (others => '0');
                IF (u0_high_n = "1") THEN
                    u0_mux_q <= u0_highconst_q;
                    u0_mux_v <= "1";
                END IF;
                IF (u0_low_c = "1") THEN
                    u0_mux_q <= u0_lowconst_q;
                    u0_mux_v <= "1";
                END IF;
            END IF;
        END IF;
    END PROCESS;


	--ld_xIn_c_to_qOut_c(DELAY,49)@0
    ld_xIn_c_to_qOut_c : dspba_delay
    GENERIC MAP ( width => 8, depth => 3 )
    PORT MAP ( xin => xIn_c, xout => ld_xIn_c_to_qOut_c_q, clk => clk, aclr => areset );

	--ld_xIn_v_to_u0_exp_and_b(DELAY,34)@0
    ld_xIn_v_to_u0_exp_and_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => xIn_v, xout => ld_xIn_v_to_u0_exp_and_b_q, clk => clk, aclr => areset );

	--qOut(PORTOUT,20)@3
    qOut_v <= ld_xIn_v_to_u0_exp_and_b_q;
    qOut_c <= ld_xIn_c_to_qOut_c_q;
    qOut_0 <= u0_mux_q;
    qOut_1 <= u1_mux_q;
    eOut_0 <= u0_exp_and_q;
    eOut_1 <= u1_exp_and_q;


end normal;
