-------------------------------------------------------------------------------
-- Title      : Traffic generator top-level
-- Project    : 
-------------------------------------------------------------------------------
-- File       : tg_top.vhd
-- Author     :   <alhonena@BUMMALO>
-- Company    : 
-- Last update: 2009/09/30
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: Master or slave TG.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2009/05/28  1.0      alhonena        Created
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




-- This toplevel describes one TG IP without a network wrapper.
-- HOW TO USE TG IPS
-- 1. Generate master TG. Master usually has address 0.
-- 2. Generate slave TGs with different addresses.
-- 3. Connect all TGs to NoC wrappers. In this context, master
--    is identical with slaves.
-- 4. Connect master TG's config_mode_en_out to every slave's
--    config_mode_en_in. (Slave's config_mode_en_out and master's
--    config_mode_en_in can be left open. They're not connected.)
-- 5. If using a NoC monitor, connect master's monitor_command_out to NoC
--    monitor and use select_monitor_UART_out in toplevel to select
--    between master's and monitor's UART. With slaves, these
--    two signals can be left open and are optimized away in synthesis.


library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

use work.tg_pkg.all;

entity tg_top is

  generic (
    own_addr_g   : integer := 0;
    is_master_g  : integer := 0;        -- is this master
    n_triggers_g : integer := 3;        -- Maximum number of triggers
    n_events_g   : integer := 2;        -- Maximum number of events
    random_w_g   : integer := 4;        -- Width of random generator
    dep_flag_w_g : integer := 16
    );
    
  port (
    -- Wrapper read signals
    r_empty_in : in  std_logic;
    r_data_in  : in  std_logic_vector(bus_w_c-1 downto 0);
    r_re_out   : out std_logic;

    -- Wrapper write signals
    w_full_in  : in  std_logic;
    w_we_out   : out std_logic;
    w_data_out : out std_logic_vector(bus_w_c-1 downto 0);
    w_tx_len_out : out std_logic_vector(tx_length_w_c-1 downto 0);

    -- Global signals
    UART_rx_in         : in  std_logic;  -- Used only by master.
    UART_tx_out        : out std_logic;  -- Used only by master.
    config_mode_en_out : out std_logic;  -- Used only by master.
    config_mode_en_in  : in  std_logic;  -- Used only by slaves.
    clk                : in  std_logic;
    rst_n              : in  std_logic;

    monitor_command_out     : out std_logic_vector(1 downto 0);  -- Master only
    select_monitor_UART_out : out std_logic;  -- Master only
    failure_out             : out std_logic);  -- Master only

end tg_top;

architecture structural of tg_top is
  component master
    port (
      data_to_UART_out            : out std_logic_vector(uart_bits_c-1 downto 0);
      we_to_UART_out              : out std_logic;
      tx_ready_from_UART_in       : in  std_logic;
      data_from_UART_in           : in  std_logic_vector(uart_bits_c-1 downto 0);
      data_available_from_UART_in : in  std_logic;
      re_to_UART_out              : out std_logic;
      clk                         : in  std_logic;
      rst_n                       : in  std_logic;
      config_mode_en_out          : out std_logic;
      config_data_out             : out std_logic_vector(31 downto 0);
      config_data_full_in         : in  std_logic;
      config_data_we_out          : out std_logic;
      report_data_empty_in        : in  std_logic;
      report_data_re_out          : out std_logic;
      report_data_data_in         : in  std_logic_vector(bus_w_c-1 downto 0);
      own_conf_or_own_rep_out     : out std_logic;
      conf_pkt_len_out            : out std_logic_vector(tx_length_w_c-1 downto 0);
      monitor_command_out         : out std_logic_vector(1 downto 0);
      monitor_UART_sel_out        : out std_logic;
      failure_out                 : out std_logic
      );
  end component;

  component reader
    generic (
      own_address_g       :     integer;
      dep_flag_w_g        :     integer);
    port (
      data_in             : in  std_logic_vector(bus_w_c-1 downto 0);
      empty_in            : in  std_logic;
      read_enable_out     : out std_logic;
      busy_in             : in  std_logic;
      valid_out           : out std_logic;
      conf_addr_out       : out std_logic_vector(address_w_c-1 downto 0);
      conf_dtype_out      : out std_logic_vector(datatype_w_c-1 downto 0);
      sender_addr_out     : out std_logic_vector(address_w_c-1 downto 0);
      data_type_out       : out std_logic_vector(datatype_w_c-1 downto 0);
      target_addr_out     : out std_logic_vector(address_w_c-1 downto 0);
      processing_time_out : out std_logic_vector(processing_time_w_c-1 downto 0);
      trigger_mode_out    : out std_logic_vector(mode_w_c-1 downto 0);
      tx_type_out         : out std_logic_vector(datatype_w_c-1 downto 0);
      tx_length_out       : out std_logic_vector(tx_length_w_c-1 downto 0);
      once_or_reply_out   : out std_logic;
      waiting_time_out    : out std_logic_vector(waiting_time_w_c-1 downto 0);
      randomize_addr_out  : out std_logic;
      randomize_len_out   : out std_logic;
      measure_path_out    : out std_logic;
      measure_path_conf_out : out std_logic;
      path_start_time_out : out std_logic_vector(timestamp_w_c-1 downto 0);
      dep_en_out          : out std_logic;
      dep_flag_out        : out std_logic_vector( integer(ceil(log2(real( dep_flag_w_g-1 ))))-1 downto 0 );
      dont_wait_dep_out   : out std_logic;
      set_dep_en_out      : out std_logic;
      dep_flag_to_set_out : out std_logic_vector( integer(ceil(log2(real( dep_flag_w_g-1 ))))-1 downto 0 );
      block_others_out    : out std_logic;
      stat_full_in        : in  std_logic;
      stat_we_out         : out std_logic;
      stat_data_out       : out std_logic_vector(bus_w_c-1 downto 0);
      stat_pkt_len_out    : out std_logic_vector(tx_length_w_c-1 downto 0);
      relay_reps_out      : out std_logic;      
      config_mode_en_in   : in  std_logic;
      clk                 : in  std_logic;
      rst_n               : in  std_logic);
  end component;

  component sender
    generic (
      own_number_g      :     integer);
    port (
      clk                : in  std_logic;
      rst_n              : in  std_logic;
      config_mode_en_in  : in  std_logic;
      addr_in            : in  std_logic_vector(address_w_c-1 downto 0);
      datatype_in        : in  std_logic_vector(datatype_w_c-1 downto 0);
      tx_length_in       : in  std_logic_vector(tx_length_w_c-1 downto 0);
      measure_path_in    : in  std_logic;
      new_path_in        : in  std_logic;
      path_start_time_in : in  std_logic_vector(timestamp_w_c-1 downto 0);
      start_tx_in        : in  std_logic;
      ack_trigger_out    : out std_logic;
      full_in            : in  std_logic;
      we_out             : out std_logic;
      data_out           : out std_logic_vector(bus_w_c-1 downto 0);
      tx_len_out         : out std_logic_vector(tx_length_w_c-1 downto 0);
      mux_switch_allowed_out : out std_logic
      );
  end component;

  component trigger
    generic (
      n_triggers_g       :     integer;
      n_events_g         :     integer;
      own_address_g      :     integer;
      random_w_g         :     integer;
      dep_flag_w_g       :     integer
      );
    port (
      clk                : in  std_logic;
      rst_n              : in  std_logic;
      config_mode_en_in  : in  std_logic;
      valid_in           : in  std_logic;
      conf_addr_in       : in  std_logic_vector( address_w_c-1 downto 0 );
      conf_dtype_in      : in  std_logic_vector( datatype_w_c-1 downto 0 );
      sender_addr_in     : in  std_logic_vector( address_w_c-1 downto 0 );
      data_type_in       : in  std_logic_vector( datatype_w_c-1 downto 0 );
      measure_path_in    : in  std_logic;
      measure_path_conf_in : in std_logic;
      path_start_time_in : in  std_logic_vector( timestamp_w_c-1 downto 0 );
      trigger_mode_in    : in  std_logic_vector( 2-1 downto 0 );
      processing_time_in : in  std_logic_vector( processing_time_w_c-1 downto 0 );
      target_addr_in     : in  std_logic_vector( address_w_c-1 downto 0 );
      tx_type_in         : in  std_logic_vector( datatype_w_c-1 downto 0 );
      tx_length_in       : in  std_logic_vector( tx_length_w_c-1 downto 0 );
      randomize_addr_in  : in  std_logic;
      randomize_len_in   : in  std_logic;
      block_others_in    : in  std_logic;
      dep_en_in          : in  std_logic;
      dep_flag_in        : in  std_logic_vector( integer(ceil(log2(real( dep_flag_w_g-1 ))))-1 downto 0 );
      dont_wait_dep_in   : in  std_logic;
      set_dep_en_in      : in  std_logic;
      dep_flag_to_set_in : in  std_logic_vector( integer(ceil(log2(real( dep_flag_w_g-1 ))))-1 downto 0 );
      waiting_time_in    : in  std_logic_vector( waiting_time_w_c-1 downto 0 );
      once_or_reply_in   : in  std_logic;
      busy_to_rdr_out    : out std_logic;
      ack_from_sndr_in   : in  std_logic;
      dest_addr_out      : out std_logic_vector( address_w_c-1 downto 0 );
      tx_length_out      : out std_logic_vector( tx_length_w_c-1 downto 0 );
      tx_data_type_out   : out std_logic_vector( datatype_w_c-1 downto 0 );
      measure_path_out   : out std_logic;
      new_path_out       : out std_logic;
      path_start_time_out : out std_logic_vector( timestamp_w_c-1 downto 0 );
      start_tx_out       : out std_logic);
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

  component master_sender_mux
    generic (
      data_width_g                  :     integer);
    port (
    sel_in              : in  std_logic;  -- selection signal
    full_in             : in  std_logic;
    we_out              : out std_logic;
    data_out            : out std_logic_vector(data_width_g-1 downto 0);
    pkt_len_out         : out std_logic_vector(tx_length_w_c-1 downto 0);

    full_to_master_or_reader_out  : out std_logic;
    full_to_sender_out  : out std_logic;

    data_from_master_or_reader_in : in  std_logic_vector(data_width_g-1 downto 0);
    data_from_sender_in : in  std_logic_vector(data_width_g-1 downto 0);

    we_from_master_or_reader_in   : in  std_logic;
    we_from_sender_in   : in  std_logic;

    pkt_len_from_sender_in : in std_logic_vector(tx_length_w_c-1 downto 0);
    pkt_len_from_master_or_reader_in : in std_logic_vector(tx_length_w_c-1 downto 0));
  end component;

  component reader_input_mux
    generic (
      data_width_g : integer);
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
  end component;

  
  signal config_mode_en_internal : std_logic;

  -- Trigger <-> Reader
  signal busy            : std_logic;
  signal valid           : std_logic;
  signal conf_addr       : std_logic_vector(address_w_c-1 downto 0);
  signal conf_dtype      : std_logic_vector(datatype_w_c-1 downto 0);
  signal sender_addr     : std_logic_vector(address_w_c-1 downto 0);
  signal data_type       : std_logic_vector(datatype_w_c-1 downto 0);
  signal target_addr     : std_logic_vector(address_w_c-1 downto 0);
  signal processing_time : std_logic_vector(processing_time_w_c-1 downto 0);
  signal trigger_mode    : std_logic_vector(2-1 downto 0);
  signal tx_type         : std_logic_vector(datatype_w_c-1 downto 0);
  signal tx_length       : std_logic_vector(tx_length_w_c-1 downto 0);
  signal once_or_reply   : std_logic;
  signal waiting_time    : std_logic_vector(waiting_time_w_c-1 downto 0);
  signal randomize_addr  : std_logic;
  signal randomize_len   : std_logic;
  signal dep_en          : std_logic;
  signal dep_flag        : std_logic_vector( integer(ceil(log2(real( dep_flag_w_g-1 ))))-1 downto 0 );
  signal dont_wait_dep   : std_logic;
  signal set_dep_en      : std_logic;
  signal dep_flag_to_set : std_logic_vector( integer(ceil(log2(real( dep_flag_w_g-1 ))))-1 downto 0 );
  signal path_start_time_rdr_trgr : std_logic_vector( timestamp_w_c-1 downto 0 );
  signal measure_path_rdr_trgr : std_logic;
  signal measure_path_conf_rdr_trgr : std_logic;
  signal block_others    : std_logic;
  
  -- Trigger <-> Sender
  signal t_s_data_type        : std_logic_vector(datatype_w_c-1 downto 0);
  signal t_s_destination_addr : std_logic_vector(address_w_c-1 downto 0);
  signal t_s_tx_length        : std_logic_vector(tx_length_w_c-1 downto 0);
  signal t_s_start_tx         : std_logic;
  signal t_s_ack              : std_logic;
  signal path_start_time_trgr_sndr : std_logic_vector( timestamp_w_c-1 downto 0 );
  signal new_path_trgr_sndr : std_logic;
  signal measure_path_trgr_sndr : std_logic;

  -- Sender <-> Mux and Master/Reader <-> Mux
  signal masterdata, senderdata, readerdata : std_logic_vector(bus_w_c-1 downto 0);
  signal masterwe, senderwe, readerwe       : std_logic;
  signal masterfull, senderfull, readerfull : std_logic;

  -- Master <-> UART ctrl
  signal data_to_UART, data_from_UART : std_logic_vector(uart_bits_c-1 downto 0);

  signal we_to_UART, re_to_UART                       : std_logic;
  signal tx_ready_from_UART, data_available_from_UART : std_logic;

  -- Reader -> Master + Sendermux statistics communication
  signal stats_full        : std_logic;
  signal stats_we          : std_logic;
  signal stats_data        : std_logic_vector(bus_w_c-1 downto 0);
  signal statsmaster_re    : std_logic;
  signal statsmaster_empty : std_logic;
  signal statsmaster_data  : std_logic_vector(bus_w_c-1 downto 0);


  -- Input -> Reader or Master -> Reader mux signals
  signal empty_reader : std_logic;
  signal data_reader : std_logic_vector(bus_w_c-1 downto 0);
  signal re_reader : std_logic;

  signal empty_masterreader : std_logic;
  signal data_masterreader : std_logic_vector(bus_w_c-1 downto 0);
  signal re_masterreader : std_logic;

  signal sendermuxsel : std_logic;
  signal sendermux_switch_allowed : std_logic;
  signal readermuxsel : std_logic;
   
  signal own_conf_or_own_rep : std_logic;

  signal readerstat_pkt_len : std_logic_vector(tx_length_w_c-1 downto 0);
  signal masterconf_pkt_len : std_logic_vector(tx_length_w_c-1 downto 0);
  signal sender_pkt_len : std_logic_vector(tx_length_w_c-1 downto 0);

  signal pkt_len_to_mux : std_logic_vector(tx_length_w_c-1 downto 0);


  signal rep_relay_mux_sel : std_logic;

  signal select_monitor_UART : std_logic;

  -- failure signals
  signal failure_from_master : std_logic;
  signal failure_from_UART : std_logic;
  
begin  -- structural

  assert own_addr_g > -1 and own_addr_g < max_addr_c+1
    report "Illegal own address!" severity failure;

  -- failure?
  failure_out <= failure_from_master or failure_from_UART;
  

  reader_master_sendermux_communication : if is_master_g = 1 generate
    -- This is master, so let's connect reader stat output to master block:

    -- N.B.! Statistic communication (reader -> master) is simplified by omitting FIFOs.
    -- This causes the following requirement:
    -- 1. The data must be read immediately after the write enable!
    -- This is not a problem but should be remembered.
    -- ^ this information may be a little obsolete :-).

    stats_full <= '0'; -- This may be the only way this works :-(.

    mux: process (rep_relay_mux_sel, r_empty_in, r_data_in, stats_we, stats_data)
    begin  -- process mux
      if rep_relay_mux_sel = '1' then
        -- Stats relayed from input to master stat input.
        statsmaster_empty <= r_empty_in;
        statsmaster_data <= r_data_in;
      else
        -- Not relayed
        statsmaster_empty <= not stats_we;
        statsmaster_data  <= stats_data;       
      end if;
    end process mux;
      
    pkt_len_to_mux <= masterconf_pkt_len;

  end generate reader_master_sendermux_communication;

  reader_master_sendermux_communication_else : if is_master_g /= 1 generate
    -- This is slave, so let's connect reader stat output to sendermux:

    stats_full <= readerfull;
    readerwe   <= stats_we;
    readerdata <= stats_data;

    pkt_len_to_mux <= readerstat_pkt_len;
    
  end generate reader_master_sendermux_communication_else;

  MASTERGEN1 : if is_master_g = 1 generate

    master_inst : master
      port map (
        data_to_UART_out            => data_to_UART,
        we_to_UART_out              => we_to_UART,
        tx_ready_from_UART_in       => tx_ready_from_UART,
        data_from_UART_in           => data_from_UART,
        data_available_from_UART_in => data_available_from_UART,
        re_to_UART_out              => re_to_UART,
        clk                         => clk,
        rst_n                       => rst_n,
        config_mode_en_out          => config_mode_en_internal,
        config_data_out             => masterdata,
        config_data_full_in         => masterfull,
        config_data_we_out          => masterwe,
        report_data_empty_in        => statsmaster_empty,
        report_data_re_out          => statsmaster_re,
        report_data_data_in         => statsmaster_data,
        own_conf_or_own_rep_out     => own_conf_or_own_rep,
        conf_pkt_len_out            => masterconf_pkt_len,
        monitor_command_out         => monitor_command_out,
        monitor_UART_sel_out        => select_monitor_UART_out,
        failure_out                 => failure_from_master
        );

    syn : if simulating_c = 0 generate

      uart_ctrl_inst: uart_ctrl
        generic map (
            freq_g      => clk_rate_c,
            baud_rate_g => baud_rate_c,
            data_bits_g => uart_bits_c,
            stop_bits_g => stop_bits_c
            )
        port map (
            clk               => clk,
            rst_n             => rst_n,
            rx_in             => UART_rx_in,
            re_in             => re_to_UART,
            rx_data_out       => data_from_UART,
            rx_data_valid_out => data_available_from_UART,
            tx_data_in        => data_to_UART,
            we_in             => we_to_UART,
            tx_ready_out      => tx_ready_from_UART,
            tx_out            => UART_tx_out,
            failure_out       => failure_from_UART
            );
      
    end generate syn;

    sim : if simulating_c = 1 generate

      uart_sim_inst : uart_sim
        generic map (
          tx_rate_g          => 80,
          registered_outs_g  => 0,
          input_file_name_g  => "tg_input.txt",
          output_file_name_g => "tg_output.txt")
        port map (
          data_in            => data_to_UART,
          we_in              => we_to_UART,
          tx_ready_out       => tx_ready_from_UART,
          data_out           => data_from_UART,
          data_available_out => data_available_from_UART,
          re_in              => re_to_UART,
          tx_out             => UART_tx_out,
          rx_in              => UART_rx_in,
          clk                => clk,
          rst_n              => rst_n);
    end generate sim;

  end generate MASTERGEN1;

  slavereader: if is_master_g = 0 generate
  reader_inst : reader
    generic map (
      own_address_g       => own_addr_g,
      dep_flag_w_g        => dep_flag_w_g)
    port map (
      -- These three signals are connected to mux, if this is a master.
      -- Otherwise directly to ports.
      data_in             => data_reader,
      empty_in            => empty_reader,
      read_enable_out     => re_reader,
      busy_in             => busy,
      valid_out           => valid,
      conf_addr_out       => conf_addr,
      conf_dtype_out      => conf_dtype,
      sender_addr_out     => sender_addr,
      data_type_out       => data_type,
      target_addr_out     => target_addr,
      processing_time_out => processing_time,
      trigger_mode_out    => trigger_mode,
      tx_type_out         => tx_type,
      tx_length_out       => tx_length,
      once_or_reply_out   => once_or_reply,
      waiting_time_out    => waiting_time,
      randomize_addr_out  => randomize_addr,
      randomize_len_out   => randomize_len,
      measure_path_out    => measure_path_rdr_trgr,
      measure_path_conf_out => measure_path_conf_rdr_trgr,
      path_start_time_out => path_start_time_rdr_trgr,
      dep_en_out          => dep_en,
      dep_flag_out        => dep_flag,
      dont_wait_dep_out   => dont_wait_dep,
      set_dep_en_out      => set_dep_en,
      dep_flag_to_set_out => dep_flag_to_set,
      block_others_out    => block_others,

      -- These are connected to sendermux (when slave) or master block (when master):
      stat_full_in  => stats_full,
      stat_we_out   => stats_we,
      stat_data_out => stats_data,
      stat_pkt_len_out => readerstat_pkt_len,
      relay_reps_out   => open,         -- slaves don't need report relaying

      config_mode_en_in => config_mode_en_internal,
      clk               => clk,
      rst_n             => rst_n);
  end generate slavereader;

  masterreader: if is_master_g = 1 generate
  reader_inst : reader
    generic map (
      own_address_g       => own_addr_g,
      dep_flag_w_g        => dep_flag_w_g)
    port map (
      -- These three signals are connected to mux, if this is a master.
      -- Otherwise directly to ports.
      data_in             => data_reader,
      empty_in            => empty_reader,
      read_enable_out     => re_reader,
      busy_in             => busy,
      valid_out           => valid,
      conf_addr_out       => conf_addr,
      conf_dtype_out      => conf_dtype,
      sender_addr_out     => sender_addr,
      data_type_out       => data_type,
      target_addr_out     => target_addr,
      processing_time_out => processing_time,
      trigger_mode_out    => trigger_mode,
      tx_type_out         => tx_type,
      tx_length_out       => tx_length,
      once_or_reply_out   => once_or_reply,
      waiting_time_out    => waiting_time,
      randomize_addr_out  => randomize_addr,
      randomize_len_out   => randomize_len,
      measure_path_out    => measure_path_rdr_trgr,
      measure_path_conf_out => measure_path_conf_rdr_trgr,
      path_start_time_out => path_start_time_rdr_trgr,
      dep_en_out          => dep_en,
      dep_flag_out        => dep_flag,
      dont_wait_dep_out   => dont_wait_dep,
      set_dep_en_out      => set_dep_en,
      dep_flag_to_set_out => dep_flag_to_set,
      block_others_out    => block_others,

      -- These are connected to sendermux (when slave) or master block (when master):
      stat_full_in  => '0',             -- !!
      stat_we_out   => stats_we,
      stat_data_out => stats_data,
      stat_pkt_len_out => readerstat_pkt_len,
      relay_reps_out   => rep_relay_mux_sel,

      config_mode_en_in => config_mode_en_internal,
      clk               => clk,
      rst_n             => rst_n);

  
  end generate masterreader;
  
  sender_inst : sender
    generic map (
      own_number_g      => own_addr_g)
    port map (
      clk               => clk,
      rst_n             => rst_n,
      config_mode_en_in => config_mode_en_internal,
      addr_in           => t_s_destination_addr,
      datatype_in       => t_s_data_type,
      tx_length_in      => t_s_tx_length,
      measure_path_in   => measure_path_trgr_sndr,
      new_path_in       => new_path_trgr_sndr,
      path_start_time_in => path_start_time_trgr_sndr,
      start_tx_in       => t_s_start_tx,
      ack_trigger_out   => t_s_ack,
      full_in           => senderfull,
      we_out            => senderwe,
      data_out          => senderdata,
      tx_len_out        => sender_pkt_len,
      mux_switch_allowed_out => sendermux_switch_allowed);

  trigger_inst : trigger
    generic map (
      n_triggers_g       => n_triggers_g,
      n_events_g         => n_events_g,
      own_address_g      => own_addr_g,
      random_w_g         => random_w_g,
      dep_flag_w_g       => dep_flag_w_g
      )
    port map (
      clk                => clk,
      rst_n              => rst_n,
      config_mode_en_in  => config_mode_en_internal,
      valid_in           => valid,
      conf_addr_in       => conf_addr,
      conf_dtype_in      => conf_dtype,
      sender_addr_in     => sender_addr,
      data_type_in       => data_type,
      path_start_time_in => path_start_time_rdr_trgr,
      measure_path_in    => measure_path_rdr_trgr,
      measure_path_conf_in => measure_path_conf_rdr_trgr,
      trigger_mode_in    => trigger_mode,
      processing_time_in => processing_time,
      target_addr_in     => target_addr,
      tx_type_in         => tx_type,
      tx_length_in       => tx_length,
      randomize_addr_in  => randomize_addr,
      randomize_len_in   => randomize_len,
      block_others_in    => block_others,
      dep_en_in          => dep_en,
      dep_flag_in        => dep_flag,
      dont_wait_dep_in   => dont_wait_dep,
      set_dep_en_in      => set_dep_en,
      dep_flag_to_set_in => dep_flag_to_set,
      waiting_time_in    => waiting_time,
      once_or_reply_in   => once_or_reply,
      busy_to_rdr_out    => busy,
      ack_from_sndr_in   => t_s_ack,
      dest_addr_out      => t_s_destination_addr,
      tx_length_out      => t_s_tx_length,
      tx_data_type_out   => t_s_data_type,
      measure_path_out   => measure_path_trgr_sndr,
      new_path_out       => new_path_trgr_sndr,
      path_start_time_out => path_start_time_trgr_sndr,
      start_tx_out       => t_s_start_tx);

  MASTERGEN2 : if is_master_g = 1 generate

    sendermuxsel <= config_mode_en_internal and (not own_conf_or_own_rep)
                    and sendermux_switch_allowed;
    
    mast_send_mux : master_sender_mux
      generic map (
        data_width_g                  => bus_w_c)
      port map (
        sel_in                        => sendermuxsel,
        full_in                       => w_full_in,
        we_out                        => w_we_out,
        data_out                      => w_data_out,
        pkt_len_out                   => w_tx_len_out,
        full_to_master_or_reader_out  => masterfull,  -- !!!
        full_to_sender_out            => senderfull,
        data_from_master_or_reader_in => masterdata,
        data_from_sender_in           => senderdata,
        we_from_master_or_reader_in   => masterwe,
        we_from_sender_in             => senderwe,
        pkt_len_from_sender_in        => sender_pkt_len,
        pkt_len_from_master_or_reader_in => masterconf_pkt_len);

  end generate MASTERGEN2;

  MASTERGEN2ELSE : if is_master_g /= 1 generate

    sendermuxsel <= config_mode_en_internal and sendermux_switch_allowed;

    -- If slave sends something in config mode, it can only be stats,
    -- because only master sends configuration data.
    read_send_mux : master_sender_mux
      generic map (
        data_width_g                  => bus_w_c)
      port map (
        sel_in                        => sendermuxsel,
        full_in                       => w_full_in,
        we_out                        => w_we_out,
        data_out                      => w_data_out,
        pkt_len_out                   => w_tx_len_out,
        full_to_master_or_reader_out  => readerfull,
        full_to_sender_out            => senderfull,
        data_from_master_or_reader_in => readerdata,
        data_from_sender_in           => senderdata,
        we_from_master_or_reader_in   => readerwe,
        we_from_sender_in             => senderwe,
        pkt_len_from_sender_in        => sender_pkt_len,
        pkt_len_from_master_or_reader_in => readerstat_pkt_len);

  end generate MASTERGEN2ELSE;

  MASTERGEN3 : if is_master_g = 1 generate
    -- Master generates config_mode_en signal and feds
    -- it to the output config_mode_en_out...
    config_mode_en_out <= config_mode_en_internal;
  end generate MASTERGEN3;

  MASTERGEN3ELSE : if is_master_g /= 1 generate
    -- ... and slaves read their config_mode_en_internal
    -- from config_mode_en_in.
    config_mode_en_internal <= config_mode_en_in;
  end generate MASTERGEN3ELSE;

  -- If this is master, generate mux to reader input.


  READERMUXGEN: if is_master_g = 1 generate

    readermuxsel <= own_conf_or_own_rep and config_mode_en_internal;

    empty_masterreader <= not masterwe;
--    masterfull <= re_masterreader;   -- !!!
    data_masterreader <= masterdata;
    
    readermux: reader_input_mux
      generic map (
          data_width_g => bus_w_c)
      port map (
          sel_in    => readermuxsel,
          empty_out => empty_reader,
          data_out  => data_reader,
          re_in     => re_reader,
          empty0_in => r_empty_in,
          empty1_in => empty_masterreader,
          data0_in  => r_data_in,
          data1_in  => data_masterreader,
          re0_out   => r_re_out,
          re1_out   => re_masterreader);
  end generate READERMUXGEN;

  READERMUXGENELSE: if is_master_g /= 1 generate
    -- connect reader directly to ports.
    empty_reader <= r_empty_in;
    data_reader <= r_data_in;
    r_re_out <= re_reader;
    
  end generate READERMUXGENELSE;
  


end structural;
