-------------------------------------------------------------------------------
-- Title      : DPRAM model for simulation and synthesis
-- Project    : 
-------------------------------------------------------------------------------
-- File       : dpram_non_altera.vhd
-- Author     :   <alhonena@BUMMALO>
-- Company    : 
-- Last update: 2009/09/30
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: Dual-port RAM
-- DPRAM with the following features:
-- data_width_g bit wide data in and out
-- same address can be simultaneously written and read, output has the NEW
-- value (that means the previous value because of the input or output registers).
-- 1 clk delay from input to output, that is, either inputs or outputs are
-- registered but not both.
--
-- This file may and should produce inferred memory elements when synthesized,
-- but if not, please use an another way to infer memory; failing to infer memory
-- results in a very large amount of registers.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2009/06/22  1.0      alhonena	Created
-------------------------------------------------------------------------------
-- Copyright (c) 2009 by Tampere University of Technology

-- This file is part of Traffic generator.

-- Traffic generator is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as
-- published by the Free Software Foundation, either version 3 of
-- the License, or (at your option) any later version.

-- Traffic generator is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Lesser General Public License for more details.

-- You should have received a copy of the GNU Lesser General Public
-- License along with Traffic generator.
-- If not, see <http://www.gnu.org/licenses/>.

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.tg_pkg.all;

ENTITY dpram_general IS
  generic
    (
    data_width_g : integer
    );
  
	PORT
	(
		clock	  : IN STD_LOGIC ;
		data	  : IN STD_LOGIC_VECTOR (data_width_g-1 DOWNTO 0);
		rdaddress : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		wraddress : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		wren	  : IN STD_LOGIC  := '1';
		q	  : OUT STD_LOGIC_VECTOR (data_width_g-1 DOWNTO 0)
	);
END dpram_general;


ARCHITECTURE rtl OF dpram_general IS

--  type mem_type is array (0 to num_of_tgs_c-1) of std_logic_vector(data_width_g-1 downto 0);
  type mem_type is array (0 to 32) of std_logic_vector(data_width_g-1 downto 0);
  signal mem_r : mem_type;

  signal rdaddress_reg_r : std_logic_vector(5 downto 0);
  signal rdaddress_clipped : integer range 0 to num_of_tgs_c-1;
  
BEGIN

  -- NO RESET. The memory contents should be cleared before using it.
  memory: process (clock)
  begin  -- process memory
    if clock'event and clock = '1' then  -- rising clock edge

      rdaddress_reg_r <= rdaddress;
      
      if wren = '1' then
        assert to_integer(unsigned(wraddress)) < num_of_tgs_c
          report "Writing RAM outside the legal range!"
          severity failure;
        mem_r(to_integer(unsigned(wraddress))) <= data;
      end if;
      
    end if;
  end process memory;

--  simul: if simulating_c = 1 generate
    -- Simulating: we have to care about address correctness
    -- because else the simulation fails (out of range).
--    clip_addr: process (rdaddress_reg_r)
--      variable tmp_v : integer;
--    begin  -- process clip_addr
--      tmp_v := to_integer(unsigned(rdaddress_reg_r));
--      if tmp_v > num_of_tgs_c-1 then
--        tmp_v := num_of_tgs_c-1;
--      end if;
--
--      rdaddress_clipped <= tmp_v;
--    end process clip_addr;
--    q <= mem_r(rdaddress_clipped);
--  end generate simul;
--
--  synth: if simulating_c = 0 generate
    -- Not simulating: don't care about address correctness.
    q <= mem_r(to_integer(unsigned(rdaddress_reg_r)));
--  end generate synth;

  
END rtl;
