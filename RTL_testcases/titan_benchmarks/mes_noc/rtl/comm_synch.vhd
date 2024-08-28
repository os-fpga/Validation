-------------------------------------------------------------------------------
-- Title      : Command synchronizer
-- Project    : 
-------------------------------------------------------------------------------
-- File       : comm_synch.vhd
-- Author     :   <alhonena@BUMMALO>
-- Company    : 
-- Last update: 2009/09/30
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: Synchronizes n-bit command bus between two clock domains to
-- prevent metastabilities, also taking care that the data cannot corrupt so
-- that bus bits would be out of sync. Causes 4-cycle delay (of lower clock).
-- The command bus should have the same value for at least two
-- clock cycles of slower clock!
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2009/07/08  1.0      alhonena	Created
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



-- EXAMPLE HOW IT WORKS
-- Slower clock is half of the faster.
-- 2-bit bus.
-- Input sequence 00, 00, 00, 00, 11, 11, 11, 11, 11, 11
-- Output sequence after plain synchronizer (2xDF) can sometimes (rarely)
-- be for example: 00, 00, 10, 11, 11.
--
-- But there is two DF's more and difference detector (XOR) in the outputs of
-- these two extra DF's. If there's a difference (00 and 10 in the example),
-- the mux between these last DF's takes the stabilized value between the
-- 2nd and 3rd DF.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comm_synch is
  
  generic (
    bus_width_g : integer := 2;
    reset_value_g : integer := 0);      -- vhdl doesn't allow bus_width_g-
                                        -- dependent vector here, that's why integer.

  port (
    clk_slower : in std_logic;
    rst_n      : in std_logic := '1';
    bus_in  : in  std_logic_vector(bus_width_g-1 downto 0);
    bus_out : out std_logic_vector(bus_width_g-1 downto 0));

end comm_synch;

architecture rtl of comm_synch is

  signal Q1_r, Q2_r, Q3_r, Q4_r : std_logic_vector(bus_width_g-1 downto 0);

begin  -- rtl

  synch: process (clk_slower, rst_n)
  begin  -- process synch
    if rst_n = '0' then                 -- asynchronous reset (active low)
      Q1_r <= std_logic_vector(to_unsigned(reset_value_g, bus_width_g));
      Q2_r <= std_logic_vector(to_unsigned(reset_value_g, bus_width_g));
      Q3_r <= std_logic_vector(to_unsigned(reset_value_g, bus_width_g));
      Q4_r <= std_logic_vector(to_unsigned(reset_value_g, bus_width_g));
      
    elsif clk_slower'event and clk_slower = '1' then  -- rising clock edge
      Q1_r <= bus_in;
      Q2_r <= Q1_r;
      Q3_r <= Q2_r;
      if Q4_r /= Q3_r then
        Q4_r <= Q2_r;
        -- There is the edge and it will be smoothed away by discarding
        -- one sampled value. (Q3 is discarded.)
        -- Now, if this synchronizer is used correctly, there cannot be
        -- fast changes; that means Q2 cannot be Q4 again, the signal has
        -- to change between this discarded edge.
        assert Q2_r /= Q4_r report
          "comm_synch may be used incorrectly! Please refer to comm_synch.vhd." severity error;
      else
        Q4_r <= Q3_r;
      end if;
    end if;
  end process synch;

  bus_out <= Q4_r;

end rtl;
