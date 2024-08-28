-------------------------------------------------------------------------------
-- Title      : UART communication simulator for traffic generator
-- Project    : 
-------------------------------------------------------------------------------
-- File       : uart_sim.vhd
-- Author     :   <alhonena@BUMMALO>
-- Company    : 
-- Last update: 2009/09/30
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: Used in simulation instead of uart_ctrl. Reads a text file
-- and feeds it character by character in a similar way as uart_ctrl. Outputs
-- incoming characters to a text file.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2009/06/08  1.0      alhonena        Created
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

library std;
use std.textio.all;

use work.tg_pkg.all;

entity uart_sim is

  generic (
    tx_rate_g         : integer := 5;   -- how many clk cycles to wait
    -- after sending a byte
    registered_outs_g : integer := 1;
    input_file_name_g : string := "input.txt";
    output_file_name_g : string := "output.txt");

  port (

    -- TX ports
    data_in      : in  std_logic_vector(7 downto 0);
    we_in        : in  std_logic;
    tx_ready_out : out std_logic;

    -- RX ports
    data_out           : out std_logic_vector(7 downto 0);
    data_available_out : out std_logic;
    re_in              : in  std_logic;

    -- UART
    tx_out : out std_logic;
    rx_in  : in  std_logic;

    -- Clock and reset
    clk   : in std_logic;
    rst_n : in std_logic);

end uart_sim;

architecture behavioral of uart_sim is

  file input_f  : text open read_mode is input_file_name_g;
  file output_f : text open write_mode is output_file_name_g;

  signal tx_ready_r       : std_logic;
  signal data_available_r : std_logic;
  signal wait_counter_r   : integer range 0 to tx_rate_g;
  signal end_of_file_r : std_logic;

begin  -- behavioral

  assert tx_rate_g > 1 report "Illegal tx_rate_g" severity failure;

  rx                     : process (clk, rst_n)
    variable read_line_v : line;
    variable read_char_v : character;
    variable is_good_v   : boolean := false;
  begin  -- process tx
    if rst_n = '0' then                 -- asynchronous reset (active low)
      is_good_v                    := false;
      data_available_r <= '0';
      wait_counter_r   <= 0;
      end_of_file_r <= '0';
    elsif clk'event and clk = '1' then  -- rising clock edge

      if re_in = '0' then


        data_available_r <= '0';
        if wait_counter_r /= tx_rate_g then
          wait_counter_r <= wait_counter_r + 1;

        elsif end_of_file_r = '0' then
          wait_counter_r <= 0;
          if is_good_v = false then
            if not endfile(input_f) then
              readline(input_f, read_line_v);
            else
              end_of_file_r <= '1';
            end if;
          end if;

          read(read_line_v, read_char_v, is_good_v);

          if is_good_v = true then
            data_out         <= std_logic_vector(to_unsigned(character'pos(read_char_v), 8));
            data_available_r <= '1';

          else
            -- The line has ended
            data_out         <= std_logic_vector(to_unsigned(character'pos(lf), 8));
            data_available_r <= '1';

          end if;

        end if;
      end if;
    end if;
  end process rx;

  reg : if registered_outs_g = 1 generate
    -- Now one clock cycle is needed before tx_ready_out changes.
    tx_ready_out       <= tx_ready_r;
    -- Same goes for data_available_out.
    data_available_out <= data_available_r;
  end generate reg;

  nonreg : if registered_outs_g = 0 generate
    -- Now tx_ready_out changes immediately when data is written.
    -- Very useful, making the sender block simpler. But may cause
    -- the critical path to get quite long, depending on the sender
    -- block.
    tx_ready_out       <= tx_ready_r and not we_in;
    -- And same for data_available_out.
    data_available_out <= data_available_r and not re_in;
  end generate nonreg;

  tx : process (clk, rst_n)
    variable write_line_v : line;
    variable write_char_v : character;
  begin  -- process tx
    if rst_n = '0' then                 -- asynchronous reset (active low)
      tx_ready_r <= '0';
    elsif clk'event and clk = '1' then  -- rising clock edge
      tx_ready_r <= '1';
      if we_in = '1' then

        tx_ready_r <= '0';

        write_char_v := character'val(to_integer(unsigned(data_in)));

        -- cr is ignored; lf ends the line.
        if write_char_v = lf then
          writeline(output_f, write_line_v);

        elsif write_char_v /= cr then
          write(write_line_v, write_char_v, left, 1);
        end if;

      end if;
    end if;
  end process tx;

end behavioral;
