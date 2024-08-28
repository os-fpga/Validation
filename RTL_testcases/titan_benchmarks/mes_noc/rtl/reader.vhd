-------------------------------------------------------------------------------
-- Title      : Reader
-- Project    : 
-------------------------------------------------------------------------------
-- File       : reader.vhd
-- Author     :   <alhonena@BUMMALO>
-- Company    : 
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: Reader block for traffic generator
-- Has a simple interface which may need a separate wrapper with some networks
-- When there is data available, reader reads a word from the wrapper and
-- acknowledges the read operation by read enable signal.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2009/05/25  1.0      alhonena        Created
-- 2009/07/02  1.0001   JN              Support for path latency measurements
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
use work.tg_pkg.all;

entity reader is

  generic (
    own_address_g : integer := -1;
    dep_flag_w_g  : integer);

  port (
    -- communication with NoC wrapper
    data_in         : in  std_logic_vector(bus_w_c-1 downto 0);
    empty_in        : in  std_logic;
    read_enable_out : out std_logic;

    -- communication with triggering block
    busy_in             : in  std_logic;
    valid_out           : out std_logic;
    sender_addr_out     : out std_logic_vector(address_w_c-1 downto 0);
    data_type_out       : out std_logic_vector(datatype_w_c-1 downto 0);
    conf_addr_out       : out std_logic_vector(address_w_c-1 downto 0);
    conf_dtype_out      : out std_logic_vector(datatype_w_c-1 downto 0);
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
    path_start_time_out : out std_logic_vector( timestamp_w_c-1 downto 0 );
    dep_en_out          : out std_logic;
    dep_flag_out        : out std_logic_vector( integer(ceil(log2(real( dep_flag_w_g-1 ))))-1 downto 0 );
    dont_wait_dep_out   : out std_logic;
    set_dep_en_out      : out std_logic;
    dep_flag_to_set_out : out std_logic_vector( integer(ceil(log2(real( dep_flag_w_g-1 ))))-1 downto 0 );
    block_others_out    : out std_logic;

    -- statistics communication
    stat_full_in  : in  std_logic;
    stat_we_out   : out std_logic;
    stat_data_out : out std_logic_vector(bus_w_c-1 downto 0);
    stat_pkt_len_out : out std_logic_vector(tx_length_w_c-1 downto 0);
    relay_reps_out : out std_logic;

    -- Global signals
    config_mode_en_in : in std_logic;
    clk               : in std_logic;
    rst_n             : in std_logic);

end reader;

architecture rtl of reader is
  
  signal read_enable_r : std_logic;

  signal sndr_addr_r : std_logic_vector( address_w_c-1 downto 0 );

  -- we must have separate datatype registers for each sender, because
  -- transfers may overlap, and last packet from some tx may contain only the
  -- last word (and if it arrives after packets from other transfers, this is
  -- the only way to keep datatypes in memory)
  type datatype_array is array (0 to num_of_tgs_c-1) of std_logic_vector( datatype_w_c-1 downto 0 );
  signal datatypes_r  : datatype_array;

  -- this also has one bit for each sender
  signal sndr_and_type_valid_r : std_logic_vector( num_of_tgs_c-1 downto 0 );

  signal valid_r          : std_logic;

  -- Current transfers
  type word_counts_array_t is array (0 to num_of_tgs_c-1) of integer range 0 to max_packet_size_c;
  signal current_word_counts_r : word_counts_array_t;




  
  signal rep_cur_sending_r : integer range 0 to num_of_tgs_c-1;

  -- Configuration and reporting
  type conf_state_type is (idle, conf2, conf3, conf4, conf5, path_conf, rep);
  signal conf_state_r : conf_state_type;

  -- REMEMBER TO UPDATE stat_words_c WHEN ADDING NEW REPORT DATA!!!!!!!!!!!
  type rep_state_type is (idle, repmin, repmax, reptot1, reptot2, repnum1, repnum2,
                          stoplatmin, stoplatmax, stoplattot1, stoplattot2,
                          errcounts, pathamount, pathlat1, pathlat2,
                          relayrep, finished);
  signal rep_state_r : rep_state_type;
  constant stat_words_c : integer := 11;
  constant path_stat_words_c : integer := 3;

  -- we will be configuring only once, so after config_mode_en_in has been
  -- zero, lifting it back up causes reader to go to report mode 
  signal conf_done_r : std_logic;
  signal report_idle_done_r : std_logic;
  signal report_idle_counter_r : integer range 0 to report_idle_time_c;
  signal start_rep_r : std_logic;

  signal stat_we_r : std_logic;         -- stat_we_out

  -- Latency counter counts clock cycles, started when config_mode_en gets '0'.
  -- Compared with sender's latency counter value in start/stop words.
  signal lat_counter_r : unsigned(timestamp_w_c-1 downto 0);


  signal erase_mem_r : std_logic;
  signal cur_erasing_r : integer range 0 to num_of_tgs_c-1;

  signal data_in_r : std_logic_vector(bus_w_c-1 downto 0);
  signal read_enable_r_r : std_logic;
  signal empty_in_r : std_logic;

  signal word_count_error : std_logic;

  
  -- signals for path measurements
  -- this TG's location number in path
  signal path_location_r : std_logic_vector( address_w_c-1 downto 0 );
  -- path measuring words must come from this tg in order to be acknowledged:
  signal prev_tg_in_path_r : std_logic_vector( address_w_c-1 downto 0 );
  
  -- this is set by master's path measuring config pkt
  signal path_measuring_en_r : std_logic;
  signal last_in_path_r : std_logic;

  type path_data_record is record
    amount       : std_logic_vector( path_amount_w_c-1 downto 0 );
    latency      : std_logic_vector( path_latency_w_c-1 downto 0 );
  end record;
  
  signal path_measurements_r : path_data_record;
  signal path_m_waiting_r : std_logic;

  -- Error counters are saturated to their maximums (so no overflowing can occur).
  constant error_bits_c : integer := 8;
  constant error_max_c : integer := 2**error_bits_c-1;
  signal word_count_error_count_r : unsigned(error_bits_c-1 downto 0);
  signal wrong_destination_error_count_r : unsigned(error_bits_c-1 downto 0);

  constant stat_min_wirepos_c : integer := 0;
  constant stat_max_wirepos_c : integer := stat_min_wirepos_c + stat_min_w_c;
  constant stat_num_wirepos_c : integer := stat_max_wirepos_c + stat_max_w_c;
  constant stat_tot_wirepos_c : integer := stat_num_wirepos_c + stat_num_w_c;
  constant stat_minlat_wirepos_c : integer := stat_tot_wirepos_c + stat_tot_w_c;
  constant stat_maxlat_wirepos_c : integer := stat_minlat_wirepos_c + stat_minlat_w_c;
  constant stat_totlat_wirepos_c : integer := stat_maxlat_wirepos_c + stat_maxlat_w_c;
  constant stat_ram_width_c : integer := stat_totlat_wirepos_c + stat_totlat_w_c;

  component dpram_general
    generic (
      data_width_g : integer);
    port (
      clock     : IN  STD_LOGIC;
      data      : IN  STD_LOGIC_VECTOR (data_width_g-1 DOWNTO 0);
      rdaddress : IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
      wraddress : IN  STD_LOGIC_VECTOR (5 DOWNTO 0);
      wren      : IN  STD_LOGIC := '1';
      q         : OUT STD_LOGIC_VECTOR (data_width_g-1 DOWNTO 0));
  end component;  
  

  constant max_tgs_for_ram_c : integer := 64;

  signal ram_read_addr : std_logic_vector(5 downto 0);
  signal ram_write_addr : std_logic_vector(5 downto 0);
  signal ram_wren : std_logic;
  signal ram_d : std_logic_vector(stat_ram_width_c-1 downto 0);
  signal ram_q : std_logic_vector(stat_ram_width_c-1 downto 0);
  
-------------------------------------------------------------------------------
begin  -- rtl
-------------------------------------------------------------------------------

  -- Check that the constants are okay:
  assert (2*address_w_c + mode_w_c + timestamp_w_c) = bus_w_c and
    (datatype_w_c + seqnum_w_c) = timestamp_w_c
    report "The constants that declare the protocol are wrong!"
    severity failure;

  assert own_address_g > -1 report "Own address not set" severity failure;

-------------------------------------------------------------------------------
-- Delay for data_in (needed with RAM addressing)
-------------------------------------------------------------------------------

  data_in_delay: process (clk)
  begin  -- process data_in_delay
    if clk'event and clk = '1' then  -- rising clock edge
      data_in_r <= data_in;
      read_enable_r_r <= read_enable_r;
      empty_in_r <= empty_in;
    end if;
  end process data_in_delay;

-------------------------------------------------------------------------------
-- Error detection
-------------------------------------------------------------------------------
  errors: process (clk, rst_n)
  begin  -- process errors
    if rst_n = '0' then                 -- asynchronous reset (active low)
      word_count_error_count_r <= (others => '0');
      
    elsif clk'event and clk = '1' then  -- rising clock edge
      if word_count_error = '1' and config_mode_en_in = '0' then
        assert false report "Word count doesn't match!" severity error;
        if to_integer(word_count_error_count_r) /= error_max_c then
          word_count_error_count_r <= word_count_error_count_r + 1;          
        end if;

      end if;      
    end if;
  end process errors;
  
-------------------------------------------------------------------------------
-- MUXES FOR READING AND WRITING MEMORY
-------------------------------------------------------------------------------
  
  ram_addr_sel_mux: process (data_in_r, data_in, start_rep_r, rep_cur_sending_r,
                             erase_mem_r, cur_erasing_r, rep_state_r,
                             stat_full_in)
  begin  -- process ram_read_addr_sel_mux
    if start_rep_r = '0' and erase_mem_r = '0' then
      -- RUNNING
      -- Continous read with tg addr in data_in.
      ram_read_addr <= data_in(bus_w_c-2*address_w_c+5 downto bus_w_c-2*address_w_c);
      -- And the write address is always the same as read address, but one clk
      -- cycle later.
      ram_write_addr <= data_in_r(bus_w_c-2*address_w_c+5 downto bus_w_c-2*address_w_c);
    else
      -- REPORTING OR ERASING MEM.

      -- Reporting only reads memory:
      -- Continous read with rep_cur_sending_r, but compensated for one clk
      -- cycle delay between setting the read address and getting the value.
      -- This maybe could be done in a better way (smaller area & more
      -- maintainable code), I'll think about it.
      if rep_state_r = errcounts and stat_full_in = '0' then
        -- Next state will be rep_min with the next address.
        ram_read_addr <= std_logic_vector(to_unsigned(rep_cur_sending_r+1, 6));
      else
        ram_read_addr <= std_logic_vector(to_unsigned(rep_cur_sending_r, 6));
      end if;

      -- Erasing only writes memory:
      -- No writing when reporting so write address doesn't matter then.
      ram_write_addr <= std_logic_vector(to_unsigned(cur_erasing_r, 6));
    end if;
  end process ram_addr_sel_mux;

  memdatamux: process (current_word_counts_r, data_in_r, ram_q,
                       lat_counter_r, conf_done_r, config_mode_en_in,
                       read_enable_r_r, empty_in_r)
    variable tmp_count_v : integer;
    variable tmp_addr_v : integer;
    variable cur_lat_v : integer;
  begin  -- process minmux

    if conf_done_r = '1' and config_mode_en_in = '0' then
      -- Running.

      tmp_addr_v := to_integer(unsigned(data_in_r(bus_w_c-address_w_c-1
                                         downto bus_w_c-2*address_w_c)));

      tmp_count_v := current_word_counts_r(tmp_addr_v);

      -- MIN (stop word)
      if tmp_count_v < to_integer(unsigned(ram_q(stat_max_wirepos_c-1 downto stat_min_wirepos_c)))
        and data_in_r(bus_w_c-2*address_w_c-1 downto bus_w_c-2*address_w_c-2) = "11"
      then
        ram_d(stat_max_wirepos_c-1 downto stat_min_wirepos_c) <= std_logic_vector(to_unsigned(tmp_count_v, 16));
      else
        ram_d(stat_max_wirepos_c-1 downto stat_min_wirepos_c) <= ram_q(stat_max_wirepos_c-1 downto stat_min_wirepos_c);
      end if;

      -- MAX (stop word)
      if tmp_count_v > to_integer(unsigned(ram_q(stat_num_wirepos_c-1 downto stat_max_wirepos_c)))
        and data_in_r(bus_w_c-2*address_w_c-1 downto bus_w_c-2*address_w_c-2) = "11"
      then
        ram_d(stat_num_wirepos_c-1 downto stat_max_wirepos_c) <= std_logic_vector(to_unsigned(tmp_count_v, 16));
      else
        ram_d(stat_num_wirepos_c-1 downto stat_max_wirepos_c) <= ram_q(stat_num_wirepos_c-1 downto stat_max_wirepos_c);
      end if;

      -- NUM (stop word)
      if data_in_r(bus_w_c-2*address_w_c-1 downto bus_w_c-2*address_w_c-2) = "11"
      then
        ram_d(stat_tot_wirepos_c-1 downto stat_num_wirepos_c) <= std_logic_vector(unsigned(ram_q(stat_tot_wirepos_c-1 downto stat_num_wirepos_c))+1);
      else
        ram_d(stat_tot_wirepos_c-1 downto stat_num_wirepos_c) <= ram_q(stat_tot_wirepos_c-1 downto stat_num_wirepos_c);
      end if;

      -- TOTAL (any word) (don't count path measurement words)
      if data_in_r(bus_w_c-2*address_w_c-1 downto bus_w_c-2*address_w_c-mode_w_c) /= "01"
      then
        ram_d(stat_minlat_wirepos_c-1 downto stat_tot_wirepos_c) <= std_logic_vector(unsigned(ram_q(stat_minlat_wirepos_c-1 downto stat_tot_wirepos_c))+1);
      else
        ram_d(stat_minlat_wirepos_c-1 downto stat_tot_wirepos_c) <= ram_q(stat_minlat_wirepos_c-1 downto stat_tot_wirepos_c);
      end if;

      -- SEQ NUMBER CHECK (any normal word (not start/stop))

      if data_in_r(bus_w_c-2*address_w_c-1 downto bus_w_c-2*address_w_c-mode_w_c) = "00"
         and read_enable_r_r = '1' and empty_in_r = '0'        
      then
        if data_in_r(seqnum_w_c-1 downto 0) /=
          std_logic_vector(unsigned(ram_q(stat_tot_wirepos_c+seqnum_w_c-1 downto stat_tot_wirepos_c))) then
          word_count_error <= '1';
        else
          word_count_error <= '0'; 
        end if;
      else
        word_count_error <= '0';
      end if;

      cur_lat_v := to_integer(lat_counter_r(timestamp_w_c-1 downto 0)
                      - unsigned(data_in_r(timestamp_w_c-1 downto 0)));

      -- MIN LAT (stop word)
      if cur_lat_v < to_integer(unsigned(ram_q(stat_maxlat_wirepos_c-1 downto stat_minlat_wirepos_c)))
        and data_in_r(bus_w_c-2*address_w_c-1 downto bus_w_c-2*address_w_c-2) = "11"
      then
        ram_d(stat_maxlat_wirepos_c-1 downto stat_minlat_wirepos_c) <= std_logic_vector(to_unsigned(cur_lat_v, stat_minlat_w_c));
      else
        ram_d(stat_maxlat_wirepos_c-1 downto stat_minlat_wirepos_c) <= ram_q(stat_maxlat_wirepos_c-1 downto stat_minlat_wirepos_c);
      end if;      

      -- MAX LAT (stop word)
      if cur_lat_v > to_integer(unsigned(ram_q(stat_totlat_wirepos_c-1 downto stat_maxlat_wirepos_c)))
        and data_in_r(bus_w_c-2*address_w_c-1 downto bus_w_c-2*address_w_c-2) = "11"
      then
        ram_d(stat_totlat_wirepos_c-1 downto stat_maxlat_wirepos_c) <= std_logic_vector(to_unsigned(cur_lat_v, stat_maxlat_w_c));
      else
        ram_d(stat_totlat_wirepos_c-1 downto stat_maxlat_wirepos_c) <= ram_q(stat_totlat_wirepos_c-1 downto stat_maxlat_wirepos_c);
      end if;

      -- TOTAL LAT (stop word)
      if data_in_r(bus_w_c-2*address_w_c-1 downto bus_w_c-2*address_w_c-2) = "11"
      then
        ram_d(stat_ram_width_c-1 downto stat_totlat_wirepos_c) <= std_logic_vector(unsigned(ram_q(stat_ram_width_c-1 downto stat_totlat_wirepos_c))
                                                 + to_unsigned(cur_lat_v, stat_totlat_w_c));
      else
        ram_d(stat_ram_width_c-1 downto stat_totlat_wirepos_c) <= ram_q(stat_ram_width_c-1 downto stat_totlat_wirepos_c);

      end if;

    else
    -- conf not done, erasing memory
      ram_d <= "00000000000000000000000000000000"  -- total latency 32 b
             & "0000000000000000"       -- maximum latency 16 b
             & "1111111111111111"       -- minimum latency 16 b
             & "00000000000000000000000000000000"  -- total amount 32 b
             & "00000000000000000000000000000000"       -- num of transgers 32 b
             & "0000000000000000"               -- max amount 8 b
             & "1111111111111111";              -- min amount 8 b.

      word_count_error <= '0';

    end if;
      
  end process memdatamux;

  -- Write when running and there is something to write; or when erasing mem.
  ram_wren <= ((not start_rep_r) and (not config_mode_en_in)
               and read_enable_r_r and (not empty_in_r)) or erase_mem_r;


-------------------------------------------------------------------------------
-- MEMORY INSTANTIATION
-------------------------------------------------------------------------------
  
  -- This RAM type uses general registers and is synthesizable to any technology.
  -- In many cases, the synthesis tool will produce memory bits.
  -- On Altera CycloneII devices, this will produce M4K memory with bypass logic.
  -- Feel free to replace this ram module with your device-specific memory. Make
  -- sure that one clk delay from input to output is maintained.
  -- For example, Cyclone II dual-port M4K blocks need inverted clock for read
  -- operation for 1-clk delay if extra bypass logic is not used.

  statram: dpram_general
    generic map (
      data_width_g => stat_ram_width_c)
    port map (
      clock     => clk,
      data      => ram_d,
      rdaddress => ram_read_addr,
      wraddress => ram_write_addr,
      wren      => ram_wren,
      q         => ram_q);

-------------------------------------------------------------------------------
-- INPUT READING
-------------------------------------------------------------------------------

  read_and_trigger       : process (clk, rst_n)
    variable addr_v      : integer range 0 to 2**address_w_c-1;
    variable cur_lat_v : integer range 0 to 2**timestamp_w_c-1;
  begin  -- process synchronous
    if rst_n = '0' then                 -- asynchronous reset (active low)
      read_enable_r         <= '0';
      valid_r               <= '0';
      conf_addr_out         <= (others => '0');
      conf_dtype_out        <= (others => '0');
      target_addr_out       <= (others => '0');
      processing_time_out   <= (others => '0');
      trigger_mode_out      <= (others => '0');
      tx_type_out           <= (others => '0');
      tx_length_out         <= (others => '0');
      once_or_reply_out     <= '0';
      waiting_time_out      <= (others => '0');
      dep_en_out            <= '0';
      dep_flag_out          <= (others => '0');
      dont_wait_dep_out     <= '0';
      set_dep_en_out        <= '0';
      dep_flag_to_set_out   <= (others => '0');
      block_others_out      <= '0';

      for siwa in 0 to num_of_tgs_c-1 loop
        current_word_counts_r(siwa) <= 0;
      end loop;  -- siwa

      sndr_addr_r           <= (others => '0');
      datatypes_r            <= (others => (others => '0'));
      sndr_and_type_valid_r <= (others => '0');
      conf_done_r           <= '0';
      report_idle_done_r    <= '0';
      report_idle_counter_r <= 0;

      start_rep_r <= '0';

      -- Reset latency counter to -1. Then it will start at 0 one clk cycle
      -- later and compensate one clk cycle delay in data_in_r.
      lat_counter_r <= (others => '1');

      conf_state_r <= idle;

      erase_mem_r <= '1';
      cur_erasing_r <= 0;
      path_measuring_en_r <= '0';
      measure_path_conf_out <= '0';
      prev_tg_in_path_r <= (others => '0');
      path_location_r <= (others => '0');
      last_in_path_r <= '0';

      wrong_destination_error_count_r <= (others => '0');

    elsif clk'event and clk = '1' then  -- rising clock edge

      valid_r         <= '0';
      read_enable_r   <= '0';
      lat_counter_r <= lat_counter_r + 1;

      -- MEM is erased after reset is deactivated.
      if erase_mem_r = '1' then
        if cur_erasing_r /= num_of_tgs_c-1 then
          cur_erasing_r <= cur_erasing_r + 1;
        else
          erase_mem_r <= '0';
        end if;
      end if;
      
      -- no more configuring after being in normal mode
      if config_mode_en_in = '0' then
        conf_done_r <= '1';
      end if;

      -- if config is done and config_mode is up, we are in report mode.
      -- Before we can start doing anything we must wait for the noc to
      -- get empty.
      if config_mode_en_in = '1'
        and conf_done_r = '1'
        and report_idle_done_r = '0'
      then
        if report_idle_counter_r = report_idle_time_c then
          report_idle_done_r <= '1';
          read_enable_r <= '0'; -- Stop reading.
        else
          report_idle_counter_r <= report_idle_counter_r + 1;
          -- Also read the data! Otherwise wrapper won't get empty.
          read_enable_r <= not empty_in;
        end if;
      
      -- read data if there is some, and if trigger is idle (valid_r is there,
      -- because otherwise we might start reading a new transfer at the same
      -- rising clk edge when trigger raises the busy signal)
      elsif empty_in = '0' and (busy_in = '0' and valid_r = '0') then
        read_enable_r <= '1';           -- inform wrapper that the data is read
      end if;
      
      if read_enable_r = '1' and empty_in = '0' then

        if config_mode_en_in = '1' then
          
          -- CONFIG MODE
          case conf_state_r is
            when idle =>
              valid_r        <= '0';
              if conf_done_r = '0' then  -- and data_in(0) = '0'
                
                if data_in(2 downto 0) = "000" then
                  -- normal configuration cmd (triggers and events)
                  conf_state_r <= conf2;
                elsif data_in(2 downto 0) = "011" then
                  -- path measurement cmd
                  conf_state_r <= path_conf;
                end if;
                
              elsif report_idle_done_r = '1' then  -- and data_in(0) = '1'
                start_rep_r  <= '1';
                conf_state_r <= rep; 
                
              else
                -- if there is invalid config command, we should be waiting
                -- for the noc to become empty, otherwise there has been a
                -- failure somewhere
                assert conf_done_r = '1' and report_idle_done_r = '0'
                  report "Invalid config command!" severity error;
              end if;

            when conf2 =>
              trigger_mode_out              <= data_in(24 downto 23);
              conf_addr_out                 <= data_in(22 downto 16);
              conf_dtype_out                <= data_in(15 downto 12);
              waiting_time_out(15 downto 4) <= data_in(11 downto 0);
              conf_state_r                  <= conf3;

            when conf3 =>
              waiting_time_out(3 downto 0)     <= data_in(24 downto 21);
              once_or_reply_out                <= data_in(20);
              target_addr_out                  <= data_in(19 downto 13);
              tx_type_out                      <= data_in(12 downto 9);
              measure_path_conf_out            <= data_in(8);
              processing_time_out(15 downto 8) <= data_in(7 downto 0);
              conf_state_r                     <= conf4;

            when conf4 =>
              processing_time_out(7 downto 0) <= data_in(24 downto 17);
              randomize_len_out               <= data_in(16);
              randomize_addr_out              <= data_in(15);
              dep_en_out                      <= data_in(14);
              dep_flag_out                    <= data_in(13 downto 10);
              dont_wait_dep_out               <= data_in(9);
              set_dep_en_out                  <= data_in(8);
              dep_flag_to_set_out             <= data_in(7 downto 4);
              conf_state_r                    <= conf5;

            when conf5 =>
              tx_length_out    <= data_in(24 downto 9);
              block_others_out <= data_in(8);
              -- All configuration parameters ready!
              valid_r             <= '1';
              conf_state_r        <= idle;


            when path_conf =>
              -- get number in path and sender from who to wait path words
              path_location_r <= data_in(24 downto 18);
              prev_tg_in_path_r <= data_in(17 downto 11);
              last_in_path_r <= data_in(10);
              -- enable path measuring
              path_measuring_en_r <= '1';
              conf_state_r <= idle;

            when rep => null;

            when others => null;
          end case;

        else
          -- NORMAL MODE (not configuring)

          conf_state_r <= idle;
          addr_v := to_integer(unsigned(data_in(bus_w_c-address_w_c-1 downto bus_w_c-2*address_w_c)));

          -- path measurement signals are like ninjas, they want to keep low profile, so
          -- don't count them.
          if data_in(bus_w_c-2*address_w_c-1 downto bus_w_c-2*address_w_c-mode_w_c) /= "01" then
            current_word_counts_r(addr_v)  <= current_word_counts_r(addr_v) + 1;
          end if;

          if to_integer(unsigned(data_in(bus_w_c-1 downto bus_w_c-address_w_c)))
            /= own_address_g then
            assert false report "Data word came to a wrong destination!"
              severity warning;
            
            -- FPGA error reporting.
            if to_integer(wrong_destination_error_count_r) /= error_max_c then
              wrong_destination_error_count_r <= wrong_destination_error_count_r + 1;              
            end if;
              
          end if;

          if data_in(bus_w_c-2*address_w_c-1 downto bus_w_c-2*address_w_c-mode_w_c) = "00" then

            -- normal data word
            -- store the sender addr and datatype
            sndr_addr_r <= data_in(bus_w_c-address_w_c-1 downto bus_w_c-2*address_w_c);
            datatypes_r(addr_v) <= data_in(bus_w_c-2*address_w_c-mode_w_c-1
                                           downto bus_w_c-2*address_w_c-mode_w_c-datatype_w_c);

            -- this is done to prevent a case where same sender first sends a
            -- tx with type field, and then another short tx without a type field.
            -- Without this valid signal also the latter tx would cause
            -- lifting of valid_out to trigger.
            sndr_and_type_valid_r(addr_v) <= '1';
            
          elsif data_in(bus_w_c-2*address_w_c-1) = '1' then
            -- start word or stop word.

            if data_in(bus_w_c-2*address_w_c-2) = '0' then
              -- start word
              current_word_counts_r(addr_v) <= 1;  -- One word already received: this one
            else
              -- stop word

              -- raise the valid signal here, because this way packets from
              -- several different transfers can arrive in a mixed order. We
              -- must also check that current sender address matches with sndr_addr_r
              -- to prevent transfers of length 1 from interfering.
              if sndr_and_type_valid_r(addr_v) = '1' then
                data_type_out                 <= datatypes_r(addr_v);
                sender_addr_out               <= data_in(bus_w_c-address_w_c-1 downto bus_w_c-2*address_w_c);
                valid_r                       <= '1';
                sndr_and_type_valid_r(addr_v) <= '0';
              end if;

            end if;
          end if;

        end if;

      end if;
    end if;
  end process read_and_trigger;

  read_enable_out <= read_enable_r;
  valid_out       <= valid_r;


-------------------------------------------------------------------------------
-- REPORTING
-------------------------------------------------------------------------------
  
  stat_we_out <= stat_we_r;

  stat_data_out(31 downto 25) <= std_logic_vector(to_unsigned(master_addr_c, 7));
  stat_data_out(24 downto 23) <= "00";

  rep_proc : process (clk, rst_n)
    variable vhdl_lol_fix_v : std_logic_vector(31 downto 0);
    
  begin  -- process rep_proc
    if rst_n = '0' then                 -- asynchronous reset (active low)
      stat_we_r   <= '0';
      rep_state_r <= idle;
      rep_cur_sending_r <= 0;
      relay_reps_out <= '0';
      stat_data_out(22 downto 0) <= (others => '0');

    elsif clk'event and clk = '1' then  -- rising clock edge

      if stat_full_in = '0' then

        case rep_state_r is
          when idle =>
            stat_we_r         <= '0';
            if start_rep_r = '1' then
              rep_state_r <= repmin;

              if path_measuring_en_r = '1' then
                stat_pkt_len_out <= std_logic_vector( to_unsigned( num_of_tgs_c *
                                                                   stat_words_c +
                                                                   path_stat_words_c,
                                                                   tx_length_w_c ));
              else
                -- only first path stat is sent
                stat_pkt_len_out <= std_logic_vector(to_unsigned(num_of_tgs_c *
                                                                 stat_words_c + 1,
                                                                 tx_length_w_c ));
              end if;
              
            end if;

          when repmin =>
            stat_we_r <= '1';

             stat_data_out(22 downto 0) <=
                               std_logic_vector(to_unsigned(rep_cur_sending_r, 7))
                              & ram_q(stat_max_wirepos_c-1 downto stat_min_wirepos_c);

            -- if reporting to our own master block:
            -- we don't have the read enable signal from master block, so we'll just
            -- wait for a cycle so that master block gets also the first data            
            if stat_we_r = '1' or own_address_g /= master_addr_c or rep_cur_sending_r /= 0 then
              rep_state_r <= repmax;
            end if;

          when repmax =>
            stat_data_out(22 downto 0) <=
              std_logic_vector(to_unsigned(rep_cur_sending_r, 7)) &
              ram_q(stat_num_wirepos_c-1 downto stat_max_wirepos_c);
            rep_state_r <= reptot1;

          when reptot1 =>
             stat_data_out(22 downto 0) <=
                               std_logic_vector(to_unsigned(rep_cur_sending_r, 7))
                              & ram_q(stat_tot_wirepos_c+31 downto stat_tot_wirepos_c+16);
            rep_state_r   <= reptot2;

          when reptot2 =>
             stat_data_out(22 downto 0) <=
                               std_logic_vector(to_unsigned(rep_cur_sending_r, 7))
                              & ram_q(stat_tot_wirepos_c+15 downto stat_tot_wirepos_c);
            rep_state_r <= repnum1;

          when repnum1 =>
              stat_data_out(22 downto 0) <=
                               std_logic_vector(to_unsigned(rep_cur_sending_r, 7))
                               & ram_q(stat_num_wirepos_c+31 downto stat_num_wirepos_c+16);

            rep_state_r <= repnum2;

          when repnum2 =>
              stat_data_out(22 downto 0) <=
                               std_logic_vector(to_unsigned(rep_cur_sending_r, 7))
                               & ram_q(stat_num_wirepos_c+15 downto stat_num_wirepos_c);

            rep_state_r <= stoplatmin;              

          when stoplatmin =>
            stat_data_out(22 downto 0) <=
                              std_logic_vector(to_unsigned(rep_cur_sending_r, 7))
                              & ram_q(stat_maxlat_wirepos_c-1 downto stat_minlat_wirepos_c);
            rep_state_r <= stoplatmax;

          when stoplatmax =>
            stat_data_out(22 downto 0) <=
                               std_logic_vector(to_unsigned(rep_cur_sending_r, 7))
                              & ram_q(stat_totlat_wirepos_c-1 downto stat_maxlat_wirepos_c);
            rep_state_r <= stoplattot1;

          when stoplattot1 =>
            stat_data_out(22 downto 0) <=
                              std_logic_vector(to_unsigned(rep_cur_sending_r, 7))
                              & ram_q(stat_totlat_wirepos_c+31 downto stat_totlat_wirepos_c+16);
            rep_state_r <= stoplattot2;

          when stoplattot2 =>
            stat_data_out(22 downto 0) <=
                              std_logic_vector(to_unsigned(rep_cur_sending_r, 7))
                              & ram_q(stat_totlat_wirepos_c+15 downto stat_totlat_wirepos_c);
            rep_state_r <= errcounts;

            
          when errcounts =>
            stat_data_out(22 downto 0) <=
              "0000000" &
              std_logic_vector(word_count_error_count_r) &
              std_logic_vector(wrong_destination_error_count_r);

            -- This is last per-TG type data. If more TG's left, go back to
            -- start (repmin), else start path reporting. 

            if rep_cur_sending_r = num_of_tgs_c-1 then
              rep_state_r       <= pathamount;
              rep_cur_sending_r <= 0;
            else
              rep_cur_sending_r <= rep_cur_sending_r + 1;
              rep_state_r       <= repmin;
            end if;

          when pathamount =>
            -- if we have valid path data from this sender
            if path_measuring_en_r = '1' then
              
              -- valid path location is never zero, so master can use location field
              -- to determine if there is more path data to come
              stat_data_out(22 downto 0) <= path_location_r & path_measurements_r.amount;
              rep_state_r <= pathlat1;
            else

              -- data is not valid
              stat_data_out(22 downto 0) <= (others => '0');

              -- if path measuring data isn't valid, don't send any more of it.
              -- Master knows to stop reading after location field has been all
              -- zeros
              rep_state_r       <= relayrep;
              rep_cur_sending_r <= 0;
            
            end if;

          when pathlat1 =>
            -- these are sent only if data is really valid
            stat_data_out(22 downto 0) <=
              path_location_r &
              path_measurements_r.latency( path_latency_w_c-1 downto path_latency_w_c/2 );
            rep_state_r <= pathlat2;

          when pathlat2 =>
            stat_data_out(22 downto 0) <=
              path_location_r &
              path_measurements_r.latency( path_latency_w_c/2-1 downto 0 );
            rep_state_r <= relayrep;

          when relayrep =>
            stat_we_r <= '0';
            relay_reps_out <= '1';
            rep_state_r <= finished;

          when finished => null;
            

          when others => null;
        end case;
      end if;  -- end if stat_full_in = '0'
    end if;
  end process rep_proc;



  path_measurements: process (clk, rst_n)
    variable old_amount_v : integer range 0 to 2**path_amount_w_c-1;
    variable new_latency_v : integer;
    variable old_latency_v : integer;
  begin  -- process path_measurements
    if rst_n = '0' then                 -- asynchronous reset (active low)
      
      measure_path_out <= '0';
      path_m_waiting_r <= '0';
      path_start_time_out <= (others => '0');
      path_measurements_r <= ((others => '0'), (others => '0'));
      
    elsif clk'event and clk = '1' then  -- rising clock edge

      if path_measuring_en_r = '1' and config_mode_en_in = '0' then

        if data_in(bus_w_c-2*address_w_c-1 downto bus_w_c-2*address_w_c-mode_w_c) = "01" and
          data_in(bus_w_c-address_w_c-1 downto bus_w_c-2*address_w_c) = prev_tg_in_path_r
          and read_enable_r = '1' and empty_in = '0'
        then
          -- path measure word from correct sender

          path_start_time_out <= data_in( timestamp_w_c-1 downto 0 );

          -- if this reader is last in path, it will not notify the trigger
          if last_in_path_r = '0' then
            path_m_waiting_r <= '1';
          end if;
          
          new_latency_v := to_integer( lat_counter_r - unsigned( data_in( timestamp_w_c-1 downto 0 ) ));
          old_latency_v := to_integer( unsigned( path_measurements_r.latency ));
          old_amount_v := to_integer( unsigned( path_measurements_r.amount ));

          path_measurements_r.latency <= std_logic_vector( to_unsigned( new_latency_v + old_latency_v, path_latency_w_c ));
          path_measurements_r.amount <= std_logic_vector( to_unsigned( old_amount_v + 1, path_amount_w_c ));
          
        end if;

        -- it is possible that the path measurement word arrives with different
        -- packet than the stop word. There might also be packets of other
        -- transfers between them. For this reason we need to be sure to raise
        -- the measure_path_out at the right time.
        if path_m_waiting_r = '1' and
          data_in(bus_w_c-2*address_w_c-1 downto bus_w_c-2*address_w_c-mode_w_c) = "11" and
          data_in(bus_w_c-address_w_c-1 downto bus_w_c-2*address_w_c) = prev_tg_in_path_r
        then
          -- the right time means that we have received path measurement word
          -- and we receive stop word from the same tg
          measure_path_out <= '1';
          path_m_waiting_r <= '0';
        end if;
  
        if valid_r = '1' and path_m_waiting_r = '0' then
          -- path measuring is reported to trigger, clear the outputs
          measure_path_out <= '0';
          path_start_time_out <= (others => '0');
          
        end if;
      end if;   -- path_measuring_en_r = '1' etc.
    end if;   -- clk'event etc...
  end process path_measurements;
end rtl;
