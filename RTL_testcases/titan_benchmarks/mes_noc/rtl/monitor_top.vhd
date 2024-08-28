-------------------------------------------------------------------------------
-- Title      : Monitor
-- Project    : 
-------------------------------------------------------------------------------
-- File       : monitor.vhd
-- Author     :   <alhonena@BUMMALO>
-- Company    : 
-- Last update: 2009/09/30
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: 
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
use work.tg_pkg.all;

entity monitor_top is

  generic (
    num_of_links_g : integer := 0);

  port (
    emptys_in : in std_logic_vector(num_of_links_g-1 downto 0);
    res_in    : in std_logic_vector(num_of_links_g-1 downto 0);

    uart_rx_in  : in  std_logic;
    uart_tx_out : out std_logic;

    clk   : in std_logic;
    rst_n : in std_logic;

    mon_command_in :  in std_logic_vector(mon_command_width_c-1 downto 0));

end monitor_top;

architecture structural of monitor_top is

  component mon
    generic (
      num_of_links_g           : integer);
    port (
      read_enables_in       : in  std_logic_vector(num_of_links_g-1 downto 0);
      emptys_in             : in  std_logic_vector(num_of_links_g-1 downto 0);
      clk                   : in  std_logic;
      rst_n                 : in  std_logic;
      report_addr_in        : in  std_logic_vector(
      integer(ceil(log2(real(num_of_links_g-1))))-1 downto 0);
      re_count_out          : out std_logic_vector(re_count_bits_c-1 downto 0);
      not_re_count_out      : out std_logic_vector(not_re_count_bits_c-1 downto 0);
      not_re_case_count_out : out std_logic_vector(not_re_case_count_bits_c-1 downto 0);
      not_re_max_count_out  : out std_logic_vector(not_re_max_count_bits_c-1 downto 0);
      mon_command_in        :  in std_logic_vector(mon_command_width_c-1 downto 0));
  end component;

  component interface
    generic (
      num_of_links_g : integer);
    port (
      clk                         : in  std_logic;
      rst_n                       : in  std_logic;
      report_addr_out             : out std_logic_vector(integer(ceil(log2(real(num_of_links_g-1))))-1 downto 0);
      re_count_in                 : in  std_logic_vector(re_count_bits_c-1 downto 0)                 := (others => '0');
      not_re_count_in             : in  std_logic_vector(not_re_count_bits_c-1 downto 0)             := (others => '0');
      not_re_case_count_in        : in  std_logic_vector(not_re_case_count_bits_c-1 downto 0)        := (others => '0');
      not_re_max_count_in         : in  std_logic_vector(not_re_max_count_bits_c-1 downto 0)         := (others => '0');
      av_count_in                 : in  std_logic_vector(av_count_bits_c-1 downto 0)                 := (others => '0');
      lock_count_in               : in  std_logic_vector(lock_count_bits_c-1 downto 0)               := (others => '0');
      transfer_min_in             : in  std_logic_vector(transfer_min_bits_c-1 downto 0)             := (others => '0');
      transfer_max_in             : in  std_logic_vector(transfer_max_bits_c-1 downto 0)             := (others => '0');
      transfer_tot_in             : in  std_logic_vector(transfer_tot_bits_c-1 downto 0)             := (others => '0');
      num_transfers_in            : in  std_logic_vector(num_transfers_bits_c-1 downto 0)            := (others => '0');
      target_fifo_fulls_in        : in  std_logic_vector(target_fifo_fulls_bits_c-1 downto 0)        := (others => '0');
      target_fifo_full_cases_in   : in  std_logic_vector(target_fifo_full_cases_bits_c-1 downto 0)   := (others => '0');
      target_fifo_full_maxcase_in : in  std_logic_vector(target_fifo_full_maxcase_bits_c-1 downto 0) := (others => '0');
      holds_in                    : in  std_logic_vector(hold_bits_c-1 downto 0) := (others => '0');
      grantwaits_in               : in  std_logic_vector(grantwait_bits_c-1 downto 0) := (others => '0');
      grantwait_cases_in          : in  std_logic_vector(grantwait_case_bits_c-1 downto 0) := (others => '0');
      grantwait_max_cases_in      : in  std_logic_vector(grantwait_max_bits_c-1 downto 0) := (others => '0');
      data_to_UART_out            : out std_logic_vector(7 downto 0);
      we_to_UART_out              : out std_logic;
      tx_ready_from_UART_in       : in  std_logic;
      data_from_UART_in           : in  std_logic_vector(7 downto 0);
      data_available_from_UART_in : in  std_logic;
      re_to_UART_out              : out std_logic;
      mon_command_in              : in  std_logic_vector(mon_command_width_c-1 downto 0));
  end component;
  
  component uart_ctrl
    generic (
      freq_g      : integer;
      baud_rate_g : integer;
      data_bits_g : integer;
      stop_bits_g : integer);
    port (
      clk               : in  std_logic;
      rst_n             : in  std_logic;
      rx_in             : in  std_logic;
      re_in             : in  std_logic;
      rx_data_out       : out std_logic_vector( data_bits_g-1 downto 0 );
      rx_data_valid_out : out std_logic;
      tx_data_in        : in  std_logic_vector( data_bits_g-1 downto 0 );
      we_in             : in  std_logic;
      tx_ready_out      : out std_logic;
      tx_out            : out std_logic;
      failure_out       : out std_logic);
  end component;

  component uart_sim
    generic (
      tx_rate_g          :     integer;
      registered_outs_g  :     integer;
      input_file_name_g  :     string;
      output_file_name_g :     string);
    port (
      data_in            : in  std_logic_vector(7 downto 0);
      we_in              : in  std_logic;
      tx_ready_out       : out std_logic;
      data_out           : out std_logic_vector(7 downto 0);
      data_available_out : out std_logic;
      re_in              : in  std_logic;
      tx_out             : out std_logic;
      rx_in              : in  std_logic;
      clk                : in  std_logic;
      rst_n              : in  std_logic);
  end component;

  component comm_synch
    generic (
      bus_width_g   : integer;
      reset_value_g : integer);
    port (
      clk_slower : in  std_logic;
      rst_n      : in  std_logic := '1';
      bus_in     : in  std_logic_vector(bus_width_g-1 downto 0);
      bus_out    : out std_logic_vector(bus_width_g-1 downto 0));
  end component;

  signal report_addr : std_logic_vector(integer(ceil(log2(real(num_of_links_g-1))))-1 downto 0);
  signal re_count                 : std_logic_vector(re_count_bits_c-1 downto 0);
  signal not_re_count             : std_logic_vector(not_re_count_bits_c-1 downto 0);
  signal not_re_case_count        : std_logic_vector(not_re_case_count_bits_c-1 downto 0);
  signal not_re_max_count         : std_logic_vector(not_re_max_count_bits_c-1 downto 0);  

  signal data_to_UART, data_from_UART : std_logic_vector(7 downto 0);
  signal we_to_UART, tx_ready_from_UART, data_available_from_UART, re_to_UART : std_logic;

  signal mon_command : std_logic_vector(mon_command_width_c-1 downto 0);
  
begin  -- structural

  assert mon_noc_type_c = 0
    report "Using monitor_top.vhd but mon_noc_type_c is not 0." severity failure;

  command_synchronizer: comm_synch
    generic map (
        bus_width_g   => mon_command_width_c,
        reset_value_g => 0)
    port map (
        clk_slower => clk,
        rst_n      => rst_n,
        bus_in     => mon_command_in,
        bus_out    => mon_command);

  pokemon: mon
    generic map (
        num_of_links_g        => num_of_links_g)
    port map (
        read_enables_in       => res_in,
        emptys_in             => emptys_in,
        clk                   => clk,
        rst_n                 => rst_n,
        report_addr_in        => report_addr,
        re_count_out          => re_count,
        not_re_count_out      => not_re_count,
        not_re_case_count_out => not_re_case_count,
        not_re_max_count_out  => not_re_max_count,
        mon_command_in        => mon_command);

  
  internet: interface
    generic map (
        num_of_links_g => num_of_links_g)
    port map (
        clk                         => clk,
        rst_n                       => rst_n,
        report_addr_out             => report_addr,
        re_count_in                 => re_count,
        not_re_count_in             => not_re_count,
        not_re_case_count_in        => not_re_case_count,
        not_re_max_count_in         => not_re_max_count,
        data_to_UART_out            => data_to_UART,
        we_to_UART_out              => we_to_UART,
        tx_ready_from_UART_in       => tx_ready_from_UART,
        data_from_UART_in           => data_from_UART,
        data_available_from_UART_in => data_available_from_UART,
        re_to_UART_out              => re_to_UART,
        mon_command_in              => mon_command);

  simu: if simulating_c = 1 generate
    uart: uart_sim
      generic map (
          tx_rate_g          => 80,
          registered_outs_g  => 1,
          input_file_name_g  => "mon_input.txt",
          output_file_name_g => "mon_output.txt")
      port map (
          data_in            => data_to_UART,
          we_in              => we_to_UART,
          tx_ready_out       => tx_ready_from_UART,
          data_out           => data_from_UART,
          data_available_out => data_available_from_UART,
          re_in              => re_to_UART,
          tx_out             => open,
          rx_in              => '0',
          clk                => clk,
          rst_n              => rst_n);
  end generate simu;

  syna: if simulating_c /= 1 generate
    uart: uart_ctrl
      generic map (
          baud_rate_g       => baud_rate_c,
          freq_g            => mon_clk_rate_c,
          data_bits_g       => uart_bits_c,
          stop_bits_g       => stop_bits_c)
      port map (
          tx_data_in         => data_to_UART,
          we_in              => we_to_UART,
          tx_ready_out       => tx_ready_from_UART,
          rx_data_out        => data_from_UART,
          rx_data_valid_out  => data_available_from_UART,
          re_in              => re_to_UART,
          tx_out             => uart_tx_out,
          rx_in              => uart_rx_in,
          clk                => clk,
          rst_n              => rst_n,
          failure_out        => open);
  end generate syna;
  
end structural;
