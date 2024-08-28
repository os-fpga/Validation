-------------------------------------------------------------------------------
-- Title      : Monitoring unit
-- Project    : 
-------------------------------------------------------------------------------
-- File       : mon.vhd
-- Author     :   <alhonena@BUMMALO>
-- Company    : 
-- Last update: 2009/09/30
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: Monitors NoC signals, stores statistics and gives statistics
-- out for reporting.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2009/06/25  1.0      alhonena        Created
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
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.mon_pkg.all;

-------------------------------------------------------------------------------
entity mon is
-------------------------------------------------------------------------------

  generic (
    num_of_links_g : integer := 0
    );

  port (

    -- Monitored signals
    read_enables_in : in std_logic_vector(num_of_links_g-1 downto 0);
    emptys_in       : in std_logic_vector(num_of_links_g-1 downto 0);

    -- Clock and reset
    clk   : in std_logic;
    rst_n : in std_logic;

    -- Reporting data out
    -- report_addr_in is used as a mux select signal. No registers after mux.
    -- Output signals will change immediately after changing report_addr_in.

    report_addr_in        : in  std_logic_vector(
      integer(ceil(log2(real(num_of_links_g-1))))-1 downto 0);
    re_count_out          : out std_logic_vector(re_count_bits_c-1 downto 0);
    not_re_count_out      : out std_logic_vector(not_re_count_bits_c-1 downto 0);
    not_re_case_count_out : out std_logic_vector(not_re_case_count_bits_c-1 downto 0);
    not_re_max_count_out  : out std_logic_vector(not_re_max_count_bits_c-1 downto 0);

    -- Commands:
    mon_command_in : in std_logic_vector(mon_command_width_c-1 downto 0)

    );

end mon;

-------------------------------------------------------------------------------
architecture rtl of mon is
-------------------------------------------------------------------------------

  constant cur_not_read_count_bits_c : integer := 12;


  -- How many times re is high:
  type re_count_array_t is array (0 to num_of_links_g-1) of
    unsigned(re_count_bits_c-1 downto 0);
  signal re_counters_r : re_count_array_t;

  -- How many times empty is low but data is not read (re is also low):
  type not_re_count_array_t is array (0 to num_of_links_g-1) of
    unsigned(not_re_count_bits_c-1 downto 0);
  signal not_read_counters_r : not_re_count_array_t;

  -- How many different cases of "data is not read" has occured
  type not_re_case_count_array_t is array (0 to num_of_links_g-1) of
    unsigned(not_re_case_count_bits_c-1 downto 0);
  signal not_read_case_counters_r : not_re_case_count_array_t;

  -- Average length of "not read" situation can be calculated as:
  -- not_read_counter/not_read_case_counter.

  -- Current "not read" situation counters. Resetted when data is read.
  type cur_not_read_count_array_t is array (0 to num_of_links_g-1) of
    unsigned(not_re_max_count_bits_c-1 downto 0);
  signal cur_not_read_counters_r : cur_not_read_count_array_t;

  -- Maximum "not read" situation length.
  type not_read_max_count_array_t is array (0 to num_of_links_g-1) of
    unsigned(not_re_max_count_bits_c-1 downto 0);
  signal not_read_max_counters_r : not_read_max_count_array_t;

  signal not_read_situation_going_r : std_logic_vector(num_of_links_g-1 downto 0);

  signal emptys_in_r : std_logic_vector(num_of_links_g-1 downto 0);

  signal tmp_addr : integer range 0 to num_of_links_g-1;

-------------------------------------------------------------------------------
begin  -- rtl
-------------------------------------------------------------------------------

  tmp_addr              <= to_integer(unsigned(report_addr_in));
  re_count_out          <= std_logic_vector(re_counters_r(tmp_addr));
  not_re_count_out      <= std_logic_vector(not_read_counters_r(tmp_addr));
  not_re_case_count_out <= std_logic_vector(not_read_case_counters_r(tmp_addr));
  not_re_max_count_out  <= std_logic_vector(not_read_max_counters_r(tmp_addr));

  empty_delay : process (clk)
  begin  -- process empty_delay
    if clk'event and clk = '1' then     -- rising clock edge
      emptys_in_r <= emptys_in;
    end if;
  end process empty_delay;

  counting : process (clk, rst_n)
  begin  -- process counting
    if rst_n = '0' then                 -- asynchronous reset (active low)

      for i in 0 to num_of_links_g-1 loop
        re_counters_r(i)              <= (others => '0');
        not_read_counters_r(i)        <= (others => '0');
        not_read_case_counters_r(i)   <= (others => '0');
        cur_not_read_counters_r(i)    <= (others => '0');
        not_read_max_counters_r(i)    <= (others => '0');
        not_read_situation_going_r(i) <= '0';
      end loop;  -- i

    elsif clk'event and clk = '1' then  -- rising clock edge

      if mon_command_in = "00" then
        -----------------------------------------------------------------------        
        -- NORMAL OPERATION MODE
        -----------------------------------------------------------------------

        for i in 0 to num_of_links_g-1 loop

          if read_enables_in(i) = '1' then
            re_counters_r(i) <= re_counters_r(i) + 1;

            if not_read_situation_going_r(i) = '1' then
              -- Situation was resolved.
              not_read_situation_going_r(i) <= '0';
              not_read_case_counters_r(i)   <= not_read_case_counters_r(i) + 1;

              if cur_not_read_counters_r(i) > not_read_max_counters_r(i) then
                not_read_max_counters_r(i) <= cur_not_read_counters_r(i);
              end if;

              cur_not_read_counters_r(i) <= (others => '0');

            end if;

          elsif emptys_in_r(i) = '0' and emptys_in(i) = '0' then
            -- There was data but it is not read.
            
            -- "and emptys_in(i) = '0'" was added because some networks know the
            -- packet size and thus re goes low at the same time when empty_in
            -- goes high.

            not_read_counters_r(i)     <= not_read_counters_r(i) + 1;
            cur_not_read_counters_r(i) <= cur_not_read_counters_r(i) + 1;

            if not_read_situation_going_r(i) = '0' then
              not_read_situation_going_r(i) <= '1';
            end if;

          end if;


        end loop;  -- i

      elsif mon_command_in = "10" then
        -----------------------------------------------------------------------
        -- RESET COUNTERS
        -----------------------------------------------------------------------

        for i in 0 to num_of_links_g-1 loop
          re_counters_r(i)              <= (others => '0');
          not_read_counters_r(i)        <= (others => '0');
          not_read_case_counters_r(i)   <= (others => '0');
          cur_not_read_counters_r(i)    <= (others => '0');
          not_read_max_counters_r(i)    <= (others => '0');
          not_read_situation_going_r(i) <= '0';
        end loop;  -- i        

      -- Else situations:
      -- 01: stall: just don't count
      -- 11: report: just don't count
        
      end if;    -- mon_command_in = "00"

    end if;
  end process counting;

end rtl;
