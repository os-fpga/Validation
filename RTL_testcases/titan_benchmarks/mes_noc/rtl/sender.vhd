-------------------------------------------------------------------------------
-- Title      : Sender
-- Project    : 
-------------------------------------------------------------------------------
-- File       : sender.vhd
-- Author     : Jussi Nieminen  <niemin95@mustatikli.cs.tut.fi>
-- Company    : 
-- Created    : 2009-05-28
-- Last update: 2009/09/30
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: Sender for traffic generator
--      In normal mode transfers are initiated by the Trigger block. Trigger
--      also gives Sender target addresses, datatypes and tx lengths. Sender
--      sends data to net spesific Wrapper block, that works as an adapter
--      between net and traffic generator.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2009-05-28  1.0      niemin95        Created
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

use work.tg_pkg.all;


entity sender is

  generic (
    own_number_g : integer := 0
    );

  port (
    clk               : in std_logic;
    rst_n             : in std_logic;
    config_mode_en_in : in std_logic;

    -- sender <-> trigger
    addr_in            : in  std_logic_vector(address_w_c-1 downto 0);
    datatype_in        : in  std_logic_vector(datatype_w_c-1 downto 0);
    tx_length_in       : in  std_logic_vector(tx_length_w_c-1 downto 0);
    measure_path_in    : in  std_logic;
    new_path_in        : in  std_logic;
    path_start_time_in : in  std_logic_vector( timestamp_w_c-1 downto 0 );
    start_tx_in        : in  std_logic;
    ack_trigger_out    : out std_logic;

    -- sender <-> noc wrapper
    full_in    : in  std_logic;
    we_out     : out std_logic;
    data_out   : out std_logic_vector(bus_w_c-1 downto 0);
    tx_len_out : out std_logic_vector(tx_length_w_c-1 downto 0);

    -- when switching to config mode after running, the sender must be allowed
    -- to finish it's transfer or the routers will get invalid pkt lengths and
    -- the net might get jammed
    mux_switch_allowed_out : out std_logic
    );

end sender;


architecture rtl of sender is

  constant max_tx_length_c : integer := 2**tx_length_w_c-1;


  -- FSM states:
  --    wait_data:      wait for the trigger to send some data
  --    wait_empty:     if the noc is full, wait for it to become free
  --    send_first:     send the starting word (not done, if tx_length = 2)
  --    send_data:      send data (type+running counter value) (if tx_length > 2)
  --    send_last:      send the end word (this is sent every time)
  type state_type is (wait_data, wait_empty, send_first, send_data, send_path, send_last, wait_last);

  signal state_r : state_type;

  -- counters to keep track of number of sent words to each TG
  type word_cntr_array is array (0 to num_of_tgs_c-1) of std_logic_vector( seqnum_w_c-1 downto 0 );
  signal word_counters_r : word_cntr_array;

  -- clk cycle counter
  signal   cycle_counter_r   : integer range 0 to 2**timestamp_w_c-1;
  signal   cycle_counter_slv : std_logic_vector( timestamp_w_c-1 downto 0 );


  -- registers to hold the address, tx_length, datatype and path measuring stuff
  signal addr_r      : integer;
  signal tx_length_r : integer range 0 to max_tx_length_c;
  signal type_r      : std_logic_vector( datatype_w_c-1 downto 0 );
  signal measure_path_r : std_logic;
  signal new_path_r : std_logic;
  signal path_start_time_r : std_logic_vector( timestamp_w_c-1 downto 0 );

  -- tx_length as an integer
  signal tx_length_int : integer range 0 to max_tx_length_c;

  -- own address
  signal own_addr : std_logic_vector( address_w_c-1 downto 0 );

  -- connected to output:
  signal data_to_write_r : std_logic_vector( bus_w_c-1 downto 0 );

  -- counting sent words of one tx
  signal words_sent_r : integer;

  signal ack_trigger_r : std_logic;

  signal vhdl_rules_tmp : std_logic_vector(0 downto 0);

-------------------------------------------------------------------------------
begin  -- rtl
-------------------------------------------------------------------------------

  -- concurrent statements:

  tx_length_int <= to_integer( unsigned( tx_length_in ));

  own_addr      <= std_logic_vector( to_unsigned( own_number_g, address_w_c ));

  cycle_counter_slv <= std_logic_vector( to_unsigned( cycle_counter_r, timestamp_w_c ));

  data_out        <= data_to_write_r;
  ack_trigger_out <= ack_trigger_r;

  vhdl_rules_tmp(0) <= measure_path_r;
  tx_len_out      <= std_logic_vector( to_unsigned( tx_length_r + to_integer( unsigned( vhdl_rules_tmp )), tx_length_w_c ));

  -----------------------------------------------------------------------------
  -- sequential part:

  main : process (clk, rst_n)
    variable tmp_cnt_v : integer;
  begin  -- process main
    if rst_n = '0' then                 -- asynchronous reset (active low)

      state_r         <= wait_data;
      we_out          <= '0';
      cycle_counter_r <= 0;
      addr_r          <= 0;
      tx_length_r     <= 0;
      type_r          <= (others => '0');
      measure_path_r  <= '0';
      path_start_time_r <= (others => '0');
      new_path_r      <= '0';
      data_to_write_r <= (others => '0');
      words_sent_r    <= 0;
      ack_trigger_r   <= '0';
      mux_switch_allowed_out <= '1';
      word_counters_r <= (others => (others => '0'));

    elsif clk'event and clk = '1' then  -- rising clock edge
      ---------------------------------------------------------------------------

      -- cycle counter is flipped, when it reaches top value
      if cycle_counter_r = 2**timestamp_w_c-1 then
        cycle_counter_r <= 0;
      else
        cycle_counter_r <= cycle_counter_r + 1;
      end if;


      -- all words contain target and sender addresses, so we can set them separately
      if state_r /= wait_data then
        data_to_write_r( bus_w_c-1 downto bus_w_c-address_w_c )               <= std_logic_vector( to_unsigned( addr_r, address_w_c ));
        data_to_write_r( bus_w_c-address_w_c-1 downto bus_w_c-2*address_w_c ) <= own_addr;
      else
        data_to_write_r( bus_w_c-1 downto bus_w_c-2*address_w_c )             <= (others => '0');
      end if;



      -- FSM
      case state_r is

        when wait_data =>

          if config_mode_en_in = '1' then

            -- *** CONFIG MODE ***
            -- stop all transmissions. In config mode sender has no tasks, so it
            -- should be quiet and stay out of the way
            we_out          <= '0';
            mux_switch_allowed_out <= '1';

          else
            
            -- *** RUN MODE ***
            -- waiting for data

            -- don't allow sender/master mux to change before all transfers are
            -- complete and config_mode_en_in is up
            mux_switch_allowed_out <= '0';
            words_sent_r                                        <= 0;
            data_to_write_r( bus_w_c-2*address_w_c-1 downto 0 ) <= (others => '0');
            we_out                                              <= '0';
            ack_trigger_r                                       <= '0';

            if start_tx_in = '1' then
              -- and now we have some data

              addr_r      <= to_integer( unsigned ( addr_in ));
              tx_length_r <= tx_length_int;
              type_r      <= datatype_in;
              ack_trigger_r <= '1';
              measure_path_r <= measure_path_in;
              path_start_time_r <= path_start_time_in;
              new_path_r <= new_path_in;

              -- at the moment only packets of size at least 3 cause
              -- triggering, so having a path measuring packet of size under 3
              -- is pretty much useless (unless it's the last packet, but still
              -- this shouldn't happen)
              assert tx_length_int > 2 or measure_path_in = '0' report "Path measuring transfers must be at least 3 words long" severity failure;

              if full_in = '1' then
                -- start waiting
                state_r <= wait_empty;

              else
                -- start sending

                if tx_length_int = 1 then
                  state_r <= send_last;
                else
                  state_r <= send_first;
                end if;
              end if;
            end if;
          end if;


        when wait_empty =>

          -- waiting for the network to become available
          ack_trigger_r <= '0';

          if full_in = '0' then
            -- move on

            if tx_length_r = 1 then
              state_r <= send_last;
            else
              state_r <= send_first;
            end if;
          end if;


        when send_first =>

          ack_trigger_r <= '0';
          
          if full_in = '0' then

            -- sending the first word (mode "10")              
            data_to_write_r( bus_w_c-2*address_w_c-1 downto bus_w_c-2*address_w_c-mode_w_c) <= "10";
            data_to_write_r( timestamp_w_c-1 downto 0 )                                     <= cycle_counter_slv;

            we_out                      <= '1';
            words_sent_r                <= words_sent_r + 1;
            
            tmp_cnt_v := to_integer( unsigned( word_counters_r(addr_r) ));
            word_counters_r(addr_r) <= std_logic_vector( to_unsigned( tmp_cnt_v + 1, seqnum_w_c ));

            if tx_length_r = 2 then
              state_r <= send_last;
            else
              state_r <= send_data;
            end if;

          else

            -- net full, stay in a same state
            state_r <= send_first;

          end if;


        when send_data =>

          -- sending data words (datatype + running nbr) (mode "00")
          if full_in = '0' then

            data_to_write_r( bus_w_c-2*address_w_c-1 downto bus_w_c-2*address_w_c-mode_w_c ) <= "00";
            data_to_write_r( seqnum_w_c+datatype_w_c-1 downto seqnum_w_c )                   <= type_r;
            data_to_write_r( seqnum_w_c-1 downto 0 )                                         <= word_counters_r(addr_r);

            we_out                      <= '1';
            words_sent_r                <= words_sent_r + 1;

            tmp_cnt_v := to_integer( unsigned( word_counters_r(addr_r) ));
            word_counters_r(addr_r) <= std_logic_vector( to_unsigned( tmp_cnt_v + 1, seqnum_w_c ));

            -- if this word is the second last
            if words_sent_r = tx_length_r - 2 then
              -- measuring path latency?
              if measure_path_r = '1' then
                state_r <= send_path;
              else
                state_r <= send_last;
              end if;
            else
              state_r <= send_data;
            end if;

          else

            state_r <= send_data;

          end if;


        when send_path =>
          -- send path measuring command word

          if full_in = '0' then
            data_to_write_r( bus_w_c-2*address_w_c-1 downto bus_w_c-2*address_w_c-mode_w_c ) <= "01";

            -- if starting a new path, use cycle counter value. Otherwise put
            -- in the value gotten from Trigger
            if new_path_r = '1' then
              data_to_write_r( timestamp_w_c-1 downto 0 ) <= cycle_counter_slv;
            else
              data_to_write_r( timestamp_w_c-1 downto 0 ) <= path_start_time_r;
            end if;

            we_out <= '1';

            -- do not increase the word counter, path measuring words are
            -- ninjas and they don't want to be noticed...
            state_r <= send_last;

          else
            -- full
            state_r <= send_path;
          end if;
          
          

        when send_last =>

          ack_trigger_r <= '0';

          -- assert is here, because only mode "11" is sure to be sent
          assert addr_r /= own_number_g report "Error : Trying to send to one self" severity failure;

          -- sending the last word (mode "11")
          if full_in = '0' then

            data_to_write_r( bus_w_c-2*address_w_c-1 downto bus_w_c-2*address_w_c-mode_w_c ) <= "11";
            data_to_write_r( timestamp_w_c-1 downto 0 )                                      <= cycle_counter_slv;

            we_out                      <= '1';
            words_sent_r                <= words_sent_r + 1;

            tmp_cnt_v := to_integer( unsigned( word_counters_r(addr_r) ));
            word_counters_r(addr_r) <= std_logic_vector( to_unsigned( tmp_cnt_v + 1, seqnum_w_c ));

            state_r <= wait_last;

          else

            state_r <= send_last;

          end if;


        when wait_last =>

          if full_in = '0' then
            -- last word is sent
            we_out        <= '0';
            state_r       <= wait_data;
            measure_path_r <= '0';
          end if;

      end case;

    end if;

  end process main;
end rtl;
