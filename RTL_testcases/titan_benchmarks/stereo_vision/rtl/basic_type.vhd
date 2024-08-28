library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
package basic_type is 
	type tap_array is array(16 downto 0) of std_logic_vector(7 downto 0);
--- correlation results type-------------------------------------------
--- scale 1
	type type_array_8_20 is array(20 downto 0) of std_logic_vector(7 downto 0); 
	type type_array_9_20 is array(20 downto 0) of std_logic_vector(8 downto 0); 
	type type_array_16_20 is array(20 downto 0) of std_logic_vector(15 downto 0); 
	type type_array_18_20 is array(20 downto 0) of std_logic_vector(17 downto 0); 
	type type_array_11_20 is array(20 downto 0) of std_logic_vector(10 downto 0); 
	
-- scale 2
	type type_array_8_10 is array(10 downto 0) of std_logic_vector(7 downto 0); 
	type type_array_9_10 is array(10 downto 0) of std_logic_vector(8 downto 0); 
	type type_array_16_10 is array(10 downto 0) of std_logic_vector(15 downto 0); 
	type type_array_18_10 is array(10 downto 0) of std_logic_vector(17 downto 0); 
-- scalle 4
	type type_array_8_5 is array(5 downto 0) of std_logic_vector(7 downto 0); 
	type type_array_9_5 is array(5 downto 0) of std_logic_vector(8 downto 0); 
	type type_array_16_5 is array(5 downto 0) of std_logic_vector(15 downto 0); 
	type type_array_18_5 is array(5 downto 0) of std_logic_vector(17 downto 0); 
-----------------------------------------------------------------------
	constant fltr_din_w: integer := 8;
end; 
