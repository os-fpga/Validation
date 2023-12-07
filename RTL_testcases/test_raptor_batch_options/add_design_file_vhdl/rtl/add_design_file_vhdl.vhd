--add_design_file_vhdl.vhd

library ieee; 
use ieee.std_logic_1164.all;

entity add_design_file_vhdl is
  port(
    x, y : in std_logic;
    eq : out std_logic
  ); 
end add_design_file_vhdl;

architecture dataflow1Bit of add_design_file_vhdl is
  signal s0, s1: std_logic; 
begin
  s0 <= (not x) and (not y);
  s1 <= x and y;
  
  eq <= s0 or s1;
end dataflow1Bit; 