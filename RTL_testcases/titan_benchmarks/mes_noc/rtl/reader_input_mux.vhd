-------------------------------------------------------------------------------
-- Title      : Reader<->input mux
-- Project    : 
-------------------------------------------------------------------------------
-- File       : reader_input_mux.vhd
-- Author     :   <alhonena@BUMMALO>
-- Company    : 
-- Last update: 2009/09/30
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2009/06/09  1.0      alhonena        Created
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



library ieee;
use ieee.std_logic_1164.all;

entity reader_input_mux is

  generic (
    data_width_g : integer := 32);

  port (
    sel_in    : in  std_logic;
    empty_out : out std_logic;
    data_out  : out std_logic_vector(data_width_g-1 downto 0);
    re_in     : in  std_logic;
    empty0_in : in  std_logic;
    empty1_in : in  std_logic;
    data0_in  : in  std_logic_vector(data_width_g-1 downto 0);
    data1_in  : in  std_logic_vector(data_width_g-1 downto 0);
    re0_out   : out std_logic;
    re1_out   : out std_logic);

end reader_input_mux;

architecture combinational of reader_input_mux is

begin  -- combinational

  comb: process (sel_in, re_in, empty0_in, empty1_in, data0_in, data1_in)
  begin  -- process comb
    if sel_in = '0' then

      -- 0 selected
      data_out <= data0_in;
      empty_out <= empty0_in;
      re0_out <= re_in;
      re1_out <= '0';

    else

      -- 1 selected
      data_out <= data1_in;
      empty_out <= empty1_in;
      re0_out <= '0';
      re1_out <= re_in;
                  
    end if;
  end process comb;

end combinational;
