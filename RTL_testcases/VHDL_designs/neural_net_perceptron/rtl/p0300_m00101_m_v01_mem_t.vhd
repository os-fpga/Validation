-- COPYRIGHT (C) 2022 by Jens Gutschmidt / VIVARE GmbH Switzerland
-- (email: opencores@vivare-services.com)
-- 
-- This program is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or any
-- later version.
-- 
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-- See the GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
-- 
-- 
-- Versions:
-- 
-- Revision 1.0  2022/06/12
-- -- First draft
-- 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
--USE ieee.numeric_std.all;
LIBRARY work;
USE work.memory_vhd_v03_pkg.all;

LIBRARY work;

entity p0300_m00101_m_v01_mem_t is
   port( 
      clk_i      : in     std_logic;         -- Single Clock Input
      we_i       : in     std_logic;         -- Write Enable Input
      d_i        : in     DATA_T;            -- Data Input
      addr_i     : in     ADDRESS_T_T;       -- Address Input
      d_o        : out    DATA_T             -- Data Output 
   );
end entity p0300_m00101_m_v01_mem_t;

--
architecture p0300_mem_t_arch of p0300_m00101_m_v01_mem_t is

  signal addr_reg   : ADDRESS_T_T;             -- Address register
  signal din_reg    : DATA_T;
  signal we_reg     : std_logic;
  signal t_ram      : T_RAM_T;                    -- "t output" memory array
  attribute logic_block : boolean;
  attribute logic_block of t_ram : signal is true;


begin

  mem_s_proc: process (clk_i)
  begin
     if (clk_i'event and clk_i='1') then
        if (we_reg = '1') then
           t_ram(CONV_INTEGER(unsigned(addr_i))) <= din_reg;
        end if;
        addr_reg  <= addr_i;
        din_reg   <= d_i;
        we_reg    <= we_i;
     end if;
  end process mem_s_proc;
  d_o <= t_ram(CONV_INTEGER(unsigned(addr_reg)));

end architecture p0300_mem_t_arch;

