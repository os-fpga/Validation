--vhdl_comparator.vhd

library ieee; 
use ieee.std_logic_1164.all;

entity vhdl_comparator is
  port(
    x, y : in std_logic;
    eq : out std_logic
  ); 
end vhdl_comparator;

architecture dataflow1Bit of vhdl_comparator is
  signal s0, s1: std_logic; 
begin
  s0 <= (not x) and (not y);
  s1 <= x and y;
  
  eq <= s0 or s1;
end dataflow1Bit; 