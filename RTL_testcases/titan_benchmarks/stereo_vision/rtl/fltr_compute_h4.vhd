library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity fltr_compute_h4 is 	port(
	clk: in std_logic;
	din : std_logic_vector(55 downto 0);
	dout : out std_logic_vector(15 downto 0));
end fltr_compute_h4;

architecture arch_fltr_compute_h4 of fltr_compute_h4 is
signal q1,q2,q3,q4,q5,q6,q7: std_logic_vector(16 downto 0);
signal d_out_tmp: std_logic_vector(19 downto 0);



------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component mult_const_h4_2
	port (
	clk: IN std_logic;
	a: IN std_logic_VECTOR(7 downto 0);
	q: OUT std_logic_VECTOR(16 downto 0));
end component;

-- Synplicity black box declaration

-- COMP_TAG_END ------ End COMPONENT Declaration ------------

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component mult_const_h4_3
	port (
	clk: IN std_logic;
	a: IN std_logic_VECTOR(7 downto 0);
	q: OUT std_logic_VECTOR(16 downto 0));
end component;

-- Synplicity black box declaration

-- COMP_TAG_END ------ End COMPONENT Declaration ------------

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component mult_const_h4_4
	port (
	clk: IN std_logic;
	a: IN std_logic_VECTOR(7 downto 0);
	q: OUT std_logic_VECTOR(16 downto 0));
end component;

-- Synplicity black box declaration

-- COMP_TAG_END ------ End COMPONENT Declaration ------------

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component mult_const_h4_5
	port (
	clk: IN std_logic;
	a: IN std_logic_VECTOR(7 downto 0);
	q: OUT std_logic_VECTOR(16 downto 0));
end component;

-- Synplicity black box declaration

-- COMP_TAG_END ------ End COMPONENT Declaration ------------



begin

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name_2 : mult_const_h4_2
		port map (
			clk => clk,
			a => din(55 downto 48),
			q => q1);
-- INST_TAG_END ------ End INSTANTIATION Template ------------

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name_3 : mult_const_h4_3
		port map (
			clk => clk,
			a => din(47 downto 40),
			q => q2);
-- INST_TAG_END ------ End INSTANTIATION Template ------------

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name_4 : mult_const_h4_4
		port map (
			clk => clk,
			a => din(39 downto 32),
			q => q3);
-- INST_TAG_END ------ End INSTANTIATION Template ------------

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name_5 : mult_const_h4_5
		port map (
			clk => clk,
			a => din(31 downto 24),
			q => q4);
-- INST_TAG_END ------ End INSTANTIATION Template ------------

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name_6 : mult_const_h4_4
		port map (
			clk => clk,
			a => din(23 downto 16),
			q => q5);
-- INST_TAG_END ------ End INSTANTIATION Template ------------

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name_7 : mult_const_h4_3
		port map (
			clk => clk,
			a => din(15 downto 8),
			q => q6);
-- INST_TAG_END ------ End INSTANTIATION Template ------------

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name_8 : mult_const_h4_2
		port map (
			clk => clk,
			a => din(7 downto 0),
			q => q7);
-- INST_TAG_END ------ End INSTANTIATION Template ------------


process (clk) begin
	if (clk'event and clk = '1') then

	d_out_tmp <= (q1(16) & q1(16) & q1(16) & q1)+
	(q2(16) & q2(16) & q2(16) & q2)+
	(q3(16) & q3(16) & q3(16) & q3)+
	(q4(16) & q4(16) & q4(16) & q4)+
	(q5(16) & q5(16) & q5(16) & q5)+
	(q6(16) & q6(16) & q6(16) & q6)+
	(q7(16) & q7(16) & q7(16) & q7);

	dout <= d_out_tmp(18 downto 3);
	end if;
end process;
end arch_fltr_compute_h4;
