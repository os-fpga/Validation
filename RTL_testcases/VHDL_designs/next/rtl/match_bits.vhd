library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_bit.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity match_bits is
    port (a, b: in bit_vector (7 downto 0);
    matches: out bit_vector (7 downto 0));
end match_bits;

architecture functional of match_bits is
    begin
        process (a, b)
        begin
        Loop_X: for i in 7 downto 0 loop
            matches (i) <= not (a(i) xor b(i));
            Loop_Y: for j in 7 downto 0 loop
                matches (j) <= (a(i) or b(i));
--                    next when j = 7;
                if j = 7 then
                    next Loop_X;
                end if;
            end loop;
        end loop;
    end process;
end functional;



