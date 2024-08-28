-------------------------------------------------------------------------------
-- Title      : Tg reader wrapper
-- Project    : 
-------------------------------------------------------------------------------
-- File       : reader_wrapper.vhd
-- Author     : Jussi Nieminen  <niemin95@galapagosinkeiju.cs.tut.fi>
-- Company    : 
-- Last update: 2009/09/30
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: Adapter between tg reader and a NoC
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2009/06/03  1.0      niemin95	Created
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
use work.tg_pkg.all;


entity reader_wrapper is
  
  port (
    clk            : in  std_logic;
    rst_n          : in  std_logic;
    config_mode_in : in  std_logic;
    av_in          : in  std_logic;
    net_empty_in   : in  std_logic;
    net_data_in    : in  std_logic_vector( bus_w_c-1 downto 0 );
    net_re_out     : out std_logic;
    rdr_re_in      : in  std_logic;
    rdr_empty_out  : out std_logic;
    rdr_data_out   : out std_logic_vector( bus_w_c-1 downto 0 )
    );

end reader_wrapper;


architecture rtl of reader_wrapper is

  signal buffer_r : std_logic_vector( bus_w_c-1 downto 0 );
  signal net_re_r : std_logic;
  signal output_valid_r : std_logic;
  signal buffer_valid_r : std_logic;
  signal end_of_tx_r : std_logic;
  
-------------------------------------------------------------------------------
begin  -- rtl
-------------------------------------------------------------------------------

  net_re_out <= net_re_r;

  
  main: process (clk, rst_n)
    
    variable output_valid_v : std_logic;
    variable buffer_valid_v : std_logic;
    
  begin  -- process main
    if rst_n = '0' then                 -- asynchronous reset (active low)

      output_valid_r <= '0';
      buffer_valid_r <= '0';
      buffer_r       <= (others => '0');
      net_re_r       <= '0';
      rdr_empty_out  <= '1';
      rdr_data_out   <= (others => '0');
      end_of_tx_r    <= '0';
      
    elsif clk'event and clk = '1' then  -- rising clock edge


      output_valid_v := output_valid_r;
      buffer_valid_v := buffer_valid_r;
      
      if rdr_re_in = '1' then
        -- reader is reading        
        if buffer_valid_v = '1' then
          -- there is data in the buffer, put it out
          rdr_data_out <= buffer_r;
          buffer_valid_v := '0';
          output_valid_v := '1';
        else
          output_valid_v := '0';
        end if;
      end if;

      if net_re_r = '1' and av_in = '1' then
        -- clear the end_of_tx_r flag
        end_of_tx_r <= '0';
      end if;

      -- don't really read the address, we don't need it
      -- don't read fillings either
      if net_re_r = '1' and net_empty_in = '0' and av_in = '0' and end_of_tx_r = '0' then
        -- we are supposed to read, but the read destination depends on the situation
        if output_valid_v = '0' then
          rdr_data_out <= net_data_in;
          output_valid_v := '1';
        else
          assert buffer_valid_v = '0' report "Error: Trying to read to full buffer" severity failure;
          buffer_r <= net_data_in;
          buffer_valid_v := '1';
        end if;

        -- end of tx detection is needed, when network is using constant size
        -- packets (fill_packet = 1)
        if config_mode_in = '0' and
          net_data_in(bus_w_c-2*address_w_c-1 downto bus_w_c-2*address_w_c-mode_w_c) = "11"
        then
          end_of_tx_r <= '1';
        end if;
      end if;

      
      if net_empty_in = '0' and buffer_valid_v = '0' then
        -- if there's data in the net and room in the buffer (or output), we read
        net_re_r <= '1';
      else
        net_re_r <= '0';
      end if;


      if output_valid_v = '1' or
        (net_empty_in = '0' and net_re_r = '1' and av_in = '0' and end_of_tx_r = '0')
      then
        -- either we already have data or at least we will have soon
        rdr_empty_out <= '0';
      else
        rdr_empty_out <= '1';
      end if;

      output_valid_r <= output_valid_v;
      buffer_valid_r <= buffer_valid_v;
      
    end if;
  end process main;
  

end rtl;
