-------------------------------------------------------------------------------
-- Title      : Monitor user interface
-- Project    : 
-------------------------------------------------------------------------------
-- File       : interface.vhd
-- Author     :   <alhonena@BUMMALO>
-- Company    : 
-- Last update: 2009/09/30
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: Gives report to UART when asked.
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

entity interface is

  generic (
    num_of_links_g : integer := 0);

  port (
    clk   : in std_logic;
    rst_n : in std_logic;

    -- COMMON SIGNALS WITH MON, MON_HIBI AND MON_XBAR
    report_addr_out : out std_logic_vector(integer(ceil(log2(real(num_of_links_g-1))))-1 downto 0);

    -- SIGNALS WITH MON

    re_count_in          : in std_logic_vector(re_count_bits_c-1 downto 0) := (others => '0');
    not_re_count_in      : in std_logic_vector(not_re_count_bits_c-1 downto 0) := (others => '0');
    not_re_case_count_in : in std_logic_vector(not_re_case_count_bits_c-1 downto 0) := (others => '0');
    not_re_max_count_in  : in std_logic_vector(not_re_max_count_bits_c-1 downto 0) := (others => '0');

    -- SIGNALS WITH MON_HIBI
    av_count_in                 : in std_logic_vector(av_count_bits_c-1 downto 0) := (others => '0');
    lock_count_in               : in std_logic_vector(lock_count_bits_c-1 downto 0) := (others => '0');
    transfer_min_in             : in std_logic_vector(transfer_min_bits_c-1 downto 0) := (others => '0');
    transfer_max_in             : in std_logic_vector(transfer_max_bits_c-1 downto 0) := (others => '0');
    transfer_tot_in             : in std_logic_vector(transfer_tot_bits_c-1 downto 0) := (others => '0');
    num_transfers_in            : in std_logic_vector(num_transfers_bits_c-1 downto 0) := (others => '0');
    target_fifo_fulls_in        : in std_logic_vector(target_fifo_fulls_bits_c-1 downto 0) := (others => '0');
    target_fifo_full_cases_in   : in std_logic_vector(target_fifo_full_cases_bits_c-1 downto 0) := (others => '0');
    target_fifo_full_maxcase_in : in std_logic_vector(target_fifo_full_maxcase_bits_c-1 downto 0) := (others => '0');

    -- SIGNALS WITH MON_XBAR

    holds_in               : in std_logic_vector(hold_bits_c-1 downto 0) := (others => '0');
    grantwaits_in          : in std_logic_vector(grantwait_bits_c-1 downto 0) := (others => '0');
    grantwait_cases_in     : in std_logic_vector(grantwait_case_bits_c-1 downto 0) := (others => '0');
    grantwait_max_cases_in : in std_logic_vector(grantwait_max_bits_c-1 downto 0) := (others => '0');

    -- UART

    data_to_UART_out            : out std_logic_vector(7 downto 0);
    we_to_UART_out              : out std_logic;
    tx_ready_from_UART_in       : in  std_logic;
    data_from_UART_in           : in  std_logic_vector(7 downto 0);
    data_available_from_UART_in : in  std_logic;
    re_to_UART_out              : out std_logic;

    -- COMMAND
    mon_command_in : in std_logic_vector(mon_command_width_c-1 downto 0)

    );

end interface;

architecture rtl of interface is
  
  function headertext
    return string is
  begin  -- headertext
    if mon_noc_type_c = 0 then
      return lf & cr & "LI DATA_AM NOTREAD NOTCASES MAXDUR" & lf & cr;
    elsif mon_noc_type_c = 1 then
      return lf & cr & "AV COUNT LOCK CNT AG MINMAX  TOT    NUM  FULLS FULLCASES FULLMAXLEN" & lf & cr;
    else  -- if mon_noc_type_c = 2
      return lf & cr & "LI   HOLDS  WAIT CAS MAX" & lf & cr;
    end if;
  end headertext;

  constant header_text_c : string := headertext;

  signal data_to_UART_bin2hex : std_logic_vector(4 downto 0);
  signal data_to_UART_rep     : std_logic_vector(7 downto 0);
  signal data_to_UART_head_r  : std_logic_vector(7 downto 0);

  type rep_state_type is (idle, header, start, print, print_lf, print_cr,
                          print_last_lf, print_last_cr, finished);

  signal rep_state_r : rep_state_type;

  -- This data is shift-registered and fed to data_to_UART_bin2hex.

  constant link_number_bits_c : integer := 8;

  function reportdatalen
    return integer is
  begin  -- reportdatalen
    if mon_noc_type_c = 0 then
      -- Space bars take also 4 bits here:
      return
        link_number_bits_c +
        4 +
        re_count_bits_c +
        4 +
        not_re_count_bits_c +
        4 +
        not_re_case_count_bits_c +
        4 +
        not_re_max_count_bits_c;

    elsif mon_noc_type_c = 1 then
      return
        av_count_bits_c +
        4 +
        lock_count_bits_c +
        4 +
        link_number_bits_c +
        4 +
        transfer_min_bits_c +
        4 +
        transfer_max_bits_c +
        4 +
        transfer_tot_bits_c +
        4 +
        num_transfers_bits_c +
        4 +
        target_fifo_fulls_bits_c +
        4 +
        target_fifo_full_cases_bits_c +
        4 +
        target_fifo_full_maxcase_bits_c;
    else  -- if mon_noc_type_c = 2
      return
        link_number_bits_c +
        4 +
        hold_bits_c +
        4 +
        grantwait_bits_c +
        4 +
        grantwait_case_bits_c +
        4 +
        grantwait_max_bits_c;
    end if;
  end reportdatalen;

  constant report_data_len_c : integer := reportdatalen;

  subtype lol is std_logic_vector(report_data_len_c/4-1 downto 0);
  
  -- '0': This is a character, determined by 4 bits of report_data_r.
  -- '1': This is a space; corresponding 4 bits of report_data_r have to be "0000".
  function reportspaces
    return lol is
  begin  -- reportspaces
    if mon_noc_type_c = 0 then
      return "00100001000010001000";

    elsif mon_noc_type_c = 1 then
      return "000000001000000001000010000100100000000100001000010000100";

    else  -- if mon_noc_type_c = 2
      return "001000000001000010001000";
    end if;
  end reportspaces;


  -- This has "0000" always when space is needed:
  signal report_data_r   : std_logic_vector(report_data_len_c-1 downto 0);
  constant report_data_space_c : std_logic_vector(3 downto 0) := "0000";
  -- This has '1' always when space is needed:
  signal report_spaces_r : std_logic_vector(report_data_len_c/4-1 downto 0);

  constant report_spaces_c : std_logic_vector(report_data_len_c/4-1 downto 0)
                   := reportspaces;


  signal head_print_count_r   : integer range header_text_c'range;
  signal report_print_count_r : integer range 0 to report_data_len_c/4-1;

  signal cur_link_r : integer range 0 to num_of_links_g-1;

  signal start_report_r : std_logic;    -- will only work once.
  signal we_to_UART_r : std_logic;
  signal re_to_UART_r : std_logic;

begin  -- rtl

  -- Converts data_to_UART_bin2hex to ASCII hex value and feds it to UART data
  -- out.
  bin2hex : process (data_to_UART_bin2hex)
  begin  -- process bin2hex
    case data_to_UART_bin2hex is
      when "00000" => data_to_UART_rep <= "00110000";
      when "00001" => data_to_UART_rep <= "00110001";
      when "00010" => data_to_UART_rep <= "00110010";
      when "00011" => data_to_UART_rep <= "00110011";
      when "00100" => data_to_UART_rep <= "00110100";
      when "00101" => data_to_UART_rep <= "00110101";
      when "00110" => data_to_UART_rep <= "00110110";
      when "00111" => data_to_UART_rep <= "00110111";
      when "01000" => data_to_UART_rep <= "00111000";
      when "01001" => data_to_UART_rep <= "00111001";
      when "01010" => data_to_UART_rep <= "01100001";
      when "01011" => data_to_UART_rep <= "01100010";
      when "01100" => data_to_UART_rep <= "01100011";
      when "01101" => data_to_UART_rep <= "01100100";
      when "01110" => data_to_UART_rep <= "01100101";
      when "01111" => data_to_UART_rep <= "01100110";
      when "10000" => data_to_UART_rep <= "00100000";  -- space
      when "10001" => data_to_UART_rep <= "00001010";  -- lf
      when "10010" => data_to_UART_rep <= "00001101";  -- cr
      when others  => data_to_UART_rep <= "00100000";
    end case;

  end process bin2hex;

  uart_data_mux : process (data_to_UART_rep, data_to_UART_head_r, rep_state_r)
  begin  -- process uart_data_mux
    if rep_state_r = header then
      data_to_UART_out <= data_to_UART_head_r;
    else
      data_to_UART_out <= data_to_UART_rep;
    end if;

  end process uart_data_mux;

  we_to_UART_out <= we_to_UART_r;
  reportation : process (clk, rst_n)
  begin  -- process report
    if rst_n = '0' then                 -- asynchronous reset (active low)
      rep_state_r          <= idle;
      head_print_count_r   <= header_text_c'low;
      report_print_count_r <= 0;
      cur_link_r           <= 0;
      we_to_UART_r         <= '0';
      report_addr_out      <= (others => '0');
      data_to_UART_bin2hex <= "10010";  -- cr has to be resetted here,
                                        -- otherwise the first line feed won't
                                        -- work at the first run.


    elsif clk'event and clk = '1' then  -- rising clock edge
      we_to_UART_r      <= '0';
      if tx_ready_from_UART_in = '1' and we_to_UART_r = '0' then
        case rep_state_r is
          when idle =>
            if start_report_r = '1' then
              rep_state_r <= header;
            end if;

          when header =>
            we_to_UART_r       <= '1';
            data_to_UART_head_r  <= std_logic_vector(to_unsigned(
              character'pos(header_text_c(head_print_count_r)), 8));
            if head_print_count_r /= header_text_c'high then
              head_print_count_r <= head_print_count_r + 1;
            else
              head_print_count_r <= header_text_c'low;
              rep_state_r        <= start;
              report_addr_out    <= std_logic_vector(to_unsigned(cur_link_r,
                                                                 (integer(ceil(log2(real(num_of_links_g-1)))))));
            end if;

          when start =>
            -- Take the report.
            if mon_noc_type_c = 0 then
              -- MESH or RING
              report_data_r <=
                std_logic_vector(to_unsigned(cur_link_r, link_number_bits_c)) &
                report_data_space_c &
                re_count_in &
                report_data_space_c &
                not_re_count_in &
                report_data_space_c &
                not_re_case_count_in &
                report_data_space_c &
                not_re_max_count_in;

            elsif mon_noc_type_c = 1 then
              -- HIBI
              report_data_r <=
                av_count_in &
                report_data_space_c &
                lock_count_in &
                report_data_space_c &
                std_logic_vector(to_unsigned(cur_link_r, link_number_bits_c)) &
                report_data_space_c &
                transfer_min_in &
                report_data_space_c &
                transfer_max_in &
                report_data_space_c &
                transfer_tot_in &
                report_data_space_c &
                num_transfers_in &
                report_data_space_c &
                target_fifo_fulls_in &
                report_data_space_c &
                target_fifo_full_cases_in &
                report_data_space_c &
                target_fifo_full_maxcase_in;

            else
              -- XBAR
              report_data_r <=
                std_logic_vector(to_unsigned(cur_link_r, link_number_bits_c)) &
                report_data_space_c &
                holds_in &
                report_data_space_c &
                grantwaits_in &
                report_data_space_c &
                grantwait_cases_in &
                report_data_space_c &
                grantwait_max_cases_in;

            end if;
            
            -- Reset the space vector:
            report_spaces_r <= report_spaces_c;


            rep_state_r <= print;

          when print =>
            we_to_UART_r         <= '1';
            data_to_UART_bin2hex   <=
              report_spaces_r(report_data_len_c/4-1)  -- the upmost bit
              & report_data_r(report_data_len_c-1 downto report_data_len_c-4);
            if report_print_count_r /= report_data_len_c/4-1 then
              report_print_count_r <= report_print_count_r + 1;
              -- Shift data and continue printing.
              report_data_r(report_data_len_c-1 downto 4)
                                   <= report_data_r(report_data_len_c-5 downto 0);
              report_spaces_r(report_data_len_c/4-1 downto 1)
                                   <= report_spaces_r(report_data_len_c/4-2 downto 0);
            else
              -- Last character printed...
              report_print_count_r <= 0;

              if cur_link_r /= num_of_links_g-1 then
                -- Next link
                cur_link_r      <= cur_link_r + 1;
                report_addr_out <= std_logic_vector(to_unsigned(cur_link_r + 1,
                                                                (integer(ceil(log2(real(num_of_links_g-1)))))));
                rep_state_r     <= print_lf;
              else
                -- Reporting completed!
                cur_link_r      <= 0;
                rep_state_r     <= print_last_lf;
              end if;

            end if;

          when print_lf =>
            we_to_UART_r       <= '1';
            data_to_UART_bin2hex <= "10001";
            rep_state_r          <= print_cr;

          when print_last_lf =>
            we_to_UART_r       <= '1';
            data_to_UART_bin2hex <= "10001";
            rep_state_r          <= print_last_cr;

          when print_cr =>
            we_to_UART_r       <= '1';
            data_to_UART_bin2hex <= "10010";
            rep_state_r          <= start;

          when print_last_cr =>
            we_to_UART_r       <= '1';
            data_to_UART_bin2hex <= "10010";
            rep_state_r          <= finished;

          when finished =>
            null;

          when others => null;
        end case;

      end if;
    end if;
  end process reportation;

  
  re_to_UART_out <= re_to_UART_r;
  
  read_uart : process (clk, rst_n)
  begin  -- process read_uart
    if rst_n = '0' then                 -- asynchronous reset (active low)
      start_report_r <= '0';
    elsif clk'event and clk = '1' then  -- rising clock edge

      re_to_UART_r <= '0';

      if mon_command_in = "11" then
        start_report_r <= '1';
      end if;

      if data_available_from_UART_in = '1' and re_to_UART_r = '0' then
        re_to_UART_r   <= '1';
        if data_from_UART_in = "01110010" then  -- 'r' = report.
          start_report_r <= '1';
        end if;

      end if;
    end if;
  end process read_uart;

end rtl;
