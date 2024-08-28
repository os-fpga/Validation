-------------------------------------------------------------------------------
-- Title      : Trigger
-- Project    : 
-------------------------------------------------------------------------------
-- File       : trigger.vhd
-- Author     : Jussi Nieminen  <niemin95@mustatikli.cs.tut.fi>
-- Company    : 
-- Created    : 2009-05-26
-- Last update: 2009/09/30
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: Triggers traffic generator's transfers
--      Transfers can be initiated by two ways. Events are time based triggers,
--      that go off when spesific counter reaches their waiting_time value.
--      Events can go off either only once or continuously.
--      Normal triggers are triggered by sender address and/or datatype of
--      incoming message. Once activated, both triggers and events initiate a
--      transfer with preset address, datatype and tx length. Start of the
--      transfer is delayed by processing_time of cycles to simulate processing
--      of data.
--
--      Trigger is configured by Reader when config_mode_en_in is set. In this
--      state a new trigger or event is stored every time valid signal is up.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2009-05-26  1.0      niemin95	Created
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
use ieee.math_real.all;


entity trigger is
  
  generic (
    n_triggers_g      : integer := 2;   -- Number of triggers
    n_events_g        : integer := 1;   -- Number of events
    own_address_g     : integer;
    random_w_g        : integer := 4;   -- width of the random number
    dep_flag_w_g      : integer := 16   -- width of dependency flag table
    );

  port (
    clk               : in std_logic;
    rst_n             : in std_logic;
    config_mode_en_in : in std_logic;
    
    -- from reader to trigger
    valid_in           : in  std_logic;
    sender_addr_in     : in  std_logic_vector( address_w_c-1 downto 0 );
    data_type_in       : in  std_logic_vector( datatype_w_c-1 downto 0 );
    path_start_time_in : in  std_logic_vector( timestamp_w_c-1 downto 0 );
    measure_path_in    : in  std_logic;
    -- following input signals only used in config mode:
    measure_path_conf_in : in std_logic;
    conf_addr_in       : in  std_logic_vector( address_w_c-1 downto 0 );
    conf_dtype_in      : in  std_logic_vector( datatype_w_c-1 downto 0 );
    trigger_mode_in    : in  std_logic_vector( mode_w_c-1 downto 0 );
    processing_time_in : in  std_logic_vector( processing_time_w_c-1 downto 0 );
    target_addr_in     : in  std_logic_vector( address_w_c-1 downto 0 );
    tx_type_in         : in  std_logic_vector( datatype_w_c-1 downto 0 );
    tx_length_in       : in  std_logic_vector( tx_length_w_c-1 downto 0 );
    randomize_addr_in  : in  std_logic;
    randomize_len_in   : in  std_logic;
    block_others_in    : in  std_logic;
    -- dependency signals
    dep_en_in          : in  std_logic;
    dep_flag_in        : in  std_logic_vector( integer(ceil(log2(real( dep_flag_w_g-1 ))))-1 downto 0 );
    dont_wait_dep_in   : in  std_logic;
    set_dep_en_in      : in  std_logic;
    dep_flag_to_set_in : in  std_logic_vector( integer(ceil(log2(real( dep_flag_w_g-1 ))))-1 downto 0 );
    -- for events
    waiting_time_in    : in  std_logic_vector( waiting_time_w_c-1 downto 0 );
    once_or_reply_in   : in  std_logic;
    -- making reader wait
    busy_to_rdr_out    : out std_logic;

    -- from trigger to sender
    ack_from_sndr_in    : in std_logic;
    dest_addr_out       : out std_logic_vector( address_w_c-1 downto 0 );
    tx_length_out       : out std_logic_vector( tx_length_w_c-1 downto 0 );
    tx_data_type_out    : out std_logic_vector( datatype_w_c-1 downto 0 );
    measure_path_out    : out std_logic;
    new_path_out        : out std_logic;
    path_start_time_out : out std_logic_vector( timestamp_w_c-1 downto 0 );
    start_tx_out        : out std_logic
    );

end trigger;



architecture rtl of trigger is


  -- constants to be added:
  -- processing_time_w_c
  -- tx_length_w_c
  -- waiting_time_w_c

  constant max_processing_time_c : integer := 2**processing_time_w_c - 1;
  constant max_waiting_time_c : integer := 2**waiting_time_w_c - 1;
  constant max_tx_length_c : integer := 2**tx_length_w_c - 1;


  
  -- run mode's FSM states:
  --    wait_data   :   wait until reader sets the valid signal
  --    operate     :   simulate processing by waiting a given number of cycles
  --    initiate_tx :   make sender start a transfer
  --    wait_tx     :   wait until the tx is done before allowing new data
  
  type run_state_type is (wait_data, operate, initiate_tx, wait_tx);
  signal run_state_r : run_state_type;

  
  -- trigger holds the triggering parameters and parameters for a transfer that
  -- is initiated after triggering match
  type trigger_type is record
    mode            : std_logic_vector( mode_w_c-1 downto 0 );  -- address/type
    sender          : std_logic_vector( address_w_c-1 downto 0 );
    type_in         : std_logic_vector( datatype_w_c-1 downto 0 );
    path_measuring  : std_logic;
    processing_time : integer range 0 to max_processing_time_c;
    idle_times      : integer range 0 to max_waiting_time_c;  -- trigger activates 
    idle_counter    : integer range 0 to max_waiting_time_c;  -- after idle_times of hits
    reply_to_sender : std_logic;        -- ignore the target addr
    target          : std_logic_vector( address_w_c-1 downto 0 );
    randomize_addr  : std_logic;
    tx_length       : integer range 0 to max_tx_length_c;
    randomize_len   : std_logic;
    type_out        : std_logic_vector( datatype_w_c-1 downto 0 );
    dep_en          : std_logic;        -- is this trigger dependent of flag status
    dep_flag        : integer range 0 to dep_flag_w_g-1;  -- which flag
    dont_wait_dep   : std_logic;        -- wait until dependency met, or discard
    set_dep_en      : std_logic;        -- does this trigger set dependency flags
    dep_flag_to_set : integer range 0 to dep_flag_w_g-1;
    block_others    : std_logic;
  end record;

  -- event is a trigger that goes off after waiting_time of cycles either once
  -- or continuously
  type event_type is record
    waiting_time    : integer range 0 to max_waiting_time_c;
    path_measuring  : std_logic;
    once_only       : std_logic;
    active          : std_logic;
    processing_time : integer range 0 to max_processing_time_c;
    target          : std_logic_vector( address_w_c-1 downto 0 );
    randomize_addr  : std_logic;
    tx_length       : integer range 0 to max_tx_length_c;
    randomize_len   : std_logic;
    type_out        : std_logic_vector( datatype_w_c-1 downto 0 );
    dep_en          : std_logic;        -- is this event dependent of flag status
    dep_flag        : integer range 0 to dep_flag_w_g-1;  -- which flag
    dont_wait_dep   : std_logic;        -- wait until dependency met, or discard
    set_dep_en      : std_logic;        -- does this event set dependency flags
    dep_flag_to_set : integer range 0 to dep_flag_w_g-1;
    block_others    : std_logic;
  end record;

  type trigger_array is array (0 to n_triggers_g-1) of trigger_type;
  type event_array is array (0 to n_events_g-1) of event_type;

  -- triggers and events
  signal triggers_r : trigger_array;
  signal events_r : event_array;

  -- signals pointing to the next available trigger or event slot
  -- (note: length must be n_xxx_g + 1, because after conf the final value will
  -- be n_xxx_g)
  signal trigger_pointer_r : integer range 0 to n_triggers_g;
  signal event_pointer_r : integer range 0 to n_events_g;

  -- to activate the events
  type event_counter_array is array (0 to n_events_g-1) of integer range 0 to max_waiting_time_c;
  signal event_counters_r : event_counter_array;
  -- telling the FSM to run an event
  signal event_waiting_r : std_logic;
  -- telling which of the events has/have been activated
  signal event_status_r : std_logic_vector( n_events_g-1 downto 0 );
  -- which event should be run
  signal event_to_run_r : integer range 0 to n_events_g;
  -- this makes the choice between events and triggers in later FSM states
  signal run_event_r : std_logic;

  -- which trigger should be run
  signal trigger_to_run_r : integer range 0 to n_triggers_g;
  signal trigger_waiting_r : std_logic;
  signal trigger_status_r : std_logic_vector( n_triggers_g-1 downto 0 );

  -- registers holding information for path latency measurements
  signal measure_path_r : std_logic;
  signal path_start_time_r : std_logic_vector( timestamp_w_c-1 downto 0 );

  -- counter counting the "operation" time
  signal processing_counter_r : integer range 0 to max_processing_time_c;

  -- processing and waiting times and tx length as integers
  signal processing_time_int : integer range 0 to max_processing_time_c;
  signal waiting_time_int : integer range 0 to max_waiting_time_c;
  signal tx_length_int : integer range 0 to max_tx_length_c;


  -- RANDOMIZING STUFF
  -- random generator
  component lfsr
    generic (
      width_g : integer range 1 to 36;
		index_g : integer);
    port (
      rst_n     : in  std_logic;
      enable_in : in  std_logic;
      q_out     : out std_logic_vector(width_g-1 downto 0);
      clk       : in  std_logic);
  end component;

  signal rnd_en_r : std_logic;
  signal random : std_logic_vector( random_w_g-1 downto 0 );
  signal old_random_r : std_logic_vector( random_w_g-1 downto 0 );
  signal random_int : integer range -2**(random_w_g-1) to 2**(random_w_g-1)-1;
  
  -- "randomizing" target address is done with a counter, that is updated
  -- somehow weirdly...
  signal rnd_addr_counter_r : integer range 0 to num_of_tgs_c;
  signal rnd_addr_base_r : integer range 0 to num_of_tgs_c-1;
  signal rnd_addr_cnt_dup : integer range 0 to num_of_tgs_c;

  -- we can't initialize triggers and events in reset, because there might be none
  signal triggers_reseted_r : std_logic;

  -- config_mode_en_in and last valid from reader can rise simultaniously, so
  -- we need to make sure that there's no configuration attempts in report state
  signal config_done_r : std_logic;


  -- DEPENDENCY STUFF
  -- Dependency flags. These are set and monitored by triggers/events, that are
  -- dependent on other triggers/events.
  signal dep_flags_r : std_logic_vector( dep_flag_w_g-1 downto 0 );
  
-------------------------------------------------------------------------------
begin  -- rtl
-------------------------------------------------------------------------------

  random_gen: lfsr
    generic map (
        width_g => random_w_g,
		  index_g => own_address_g
        )
    port map (
        rst_n     => rst_n,
        enable_in => rnd_en_r,
        q_out     => random,
        clk       => clk
        );
  
  -- concurrent assignments
  processing_time_int <= to_integer( unsigned( processing_time_in ) );
  waiting_time_int    <= to_integer( unsigned( waiting_time_in ) );
  tx_length_int       <= to_integer( unsigned( tx_length_in ) );

  random_int <= to_integer( signed( random ));
  
  fsm: process (clk, rst_n)

    -- these help to select a trigger/event with lowest index
    variable num_events_v : integer range 0 to n_events_g;
    variable event_activated_v : std_logic;
    variable num_triggers_v : integer range 0 to n_triggers_g;
    variable trigger_activated_v : std_logic;

    -- helping in random tx_len generation
    variable tx_len_v : integer range 0 to 2**tx_length_w_c-1;
    variable tx_len_div_8_v : integer range 0 to 2**(tx_length_w_c-3)-1;
    variable final_tx_len_v : integer range 0 to 2**tx_length_w_c-1;

    -- enabling blocking
    variable block_others_v : std_logic;

    variable new_event_activating_v : std_logic;
    
  begin  -- process fsm
    if rst_n = '0' then                 -- asynchronous reset (active low)

      busy_to_rdr_out      <= '0';
      dest_addr_out        <= (others => '0');
      tx_length_out        <= (others => '0');
      tx_data_type_out     <= (others => '0');
      start_tx_out         <= '0';
      measure_path_out     <= '0';
      new_path_out         <= '0';
      path_start_time_out  <= (others => '0');
      measure_path_r       <= '0';
      path_start_time_r    <= (others => '0');
      run_state_r          <= wait_data;
      trigger_pointer_r    <= 0;
      event_pointer_r      <= 0;
      event_counters_r     <= (others => 0);
      event_waiting_r      <= '0';
      event_status_r       <= (others => '0');
      event_to_run_r       <= 0;
      trigger_to_run_r     <= 0;
      trigger_waiting_r    <= '0';
      trigger_status_r     <= (others => '0');
      run_event_r          <= '0';
      processing_counter_r <= 0;
      rnd_en_r             <= '0';
      rnd_addr_counter_r   <= 0;
      old_random_r         <= (others => '0');
      triggers_reseted_r   <= '0';
      config_done_r        <= '0';
      dep_flags_r          <= (others => '0');
      
    elsif clk'event and clk = '1' then  -- rising clock edge

      
      -- we have two modes, config and run
      
      if config_mode_en_in = '1' then
        -----------------------------------------------------------------------
        -- ** CONFIG MODE ** --

        if config_done_r = '1' then
          -- after running, in the report stage, make sure that the trigger
          -- returns to idle state and lowers the busy signal
          busy_to_rdr_out <= '0';
          rnd_en_r <= '0';
        else
          
          if triggers_reseted_r = '0' then
            if n_triggers_g /= 0 then
              triggers_r <= (others => ( (others => '0'), (others => '0'), (others => '0'), '0', 0, 0, 0, '0', (others => '0'), '0', 0, '0', (others => '0'), '0', 0, '0', '0', 0, '0' ));
            end if;
            if n_events_g /= 0 then
              events_r   <= (others => ( 0, '0', '0', '0', 0, (others => '0'), '0', 0, '0', (others => '0'), '0', 0, '0', '0', 0, '0' ));
            end if;
            triggers_reseted_r <= '1';
          end if;
        
          -- no need to enable the random generator
          rnd_en_r <= '0';
          
          if valid_in = '1' then
            case trigger_mode_in is

              when "00" =>

                if event_pointer_r = n_events_g then

                  -- error signal up?
                  assert false report "Error: Trying to add an event to a full array" severity failure;

                else
                  -- set up an event instead of a trigger
                  events_r(event_pointer_r).waiting_time    <= waiting_time_int;
                  events_r(event_pointer_r).path_measuring  <= measure_path_conf_in;
                  events_r(event_pointer_r).once_only       <= once_or_reply_in;
                  events_r(event_pointer_r).active          <= '1';
                  events_r(event_pointer_r).processing_time <= processing_time_int;
                  events_r(event_pointer_r).target          <= target_addr_in;
                  events_r(event_pointer_r).randomize_addr  <= randomize_addr_in;
                  events_r(event_pointer_r).tx_length       <= tx_length_int;
                  events_r(event_pointer_r).randomize_len   <= randomize_len_in;
                  events_r(event_pointer_r).type_out        <= tx_type_in;
                  events_r(event_pointer_r).dep_en          <= dep_en_in;
                  events_r(event_pointer_r).dep_flag        <= to_integer( unsigned( dep_flag_in ));
                  events_r(event_pointer_r).dont_wait_dep   <= dont_wait_dep_in;
                  events_r(event_pointer_r).set_dep_en      <= set_dep_en_in;
                  events_r(event_pointer_r).dep_flag_to_set <= to_integer( unsigned( dep_flag_to_set_in ));
                  events_r(event_pointer_r).block_others    <= block_others_in;

                  event_pointer_r <= event_pointer_r + 1;
                
                end if;

              
              when others =>

                if trigger_pointer_r = n_triggers_g then
                
                  -- error signal up?
                  assert false report "Error: Trying to add a trigger to a full array" severity failure;
                
                else
                  -- trigger using address and/or datatype
                  triggers_r(trigger_pointer_r).mode            <= trigger_mode_in;
                  triggers_r(trigger_pointer_r).sender          <= conf_addr_in;
                  triggers_r(trigger_pointer_r).type_in         <= conf_dtype_in;
                  triggers_r(trigger_pointer_r).path_measuring  <= measure_path_conf_in;
                  triggers_r(trigger_pointer_r).processing_time <= processing_time_int;
                  triggers_r(trigger_pointer_r).idle_times      <= waiting_time_int;
                  triggers_r(trigger_pointer_r).idle_counter    <= 0;
                  triggers_r(trigger_pointer_r).reply_to_sender <= once_or_reply_in;
                  triggers_r(trigger_pointer_r).target          <= target_addr_in;
                  triggers_r(trigger_pointer_r).randomize_addr  <= randomize_addr_in;
                  triggers_r(trigger_pointer_r).tx_length       <= tx_length_int;
                  triggers_r(trigger_pointer_r).randomize_len   <= randomize_len_in;
                  triggers_r(trigger_pointer_r).type_out        <= tx_type_in;
                  triggers_r(trigger_pointer_r).dep_en          <= dep_en_in;
                  triggers_r(trigger_pointer_r).dep_flag        <= to_integer( unsigned( dep_flag_in ));
                  triggers_r(trigger_pointer_r).dont_wait_dep   <= dont_wait_dep_in;
                  triggers_r(trigger_pointer_r).set_dep_en      <= set_dep_en_in;
                  triggers_r(trigger_pointer_r).dep_flag_to_set <= to_integer( unsigned( dep_flag_to_set_in ));
                  triggers_r(trigger_pointer_r).block_others    <= block_others_in;

                  trigger_pointer_r <= trigger_pointer_r + 1;

                end if;

            end case;
          end if;
        end if;

        -- ** END OF CONFIG MODE ** --
        -----------------------------------------------------------------------
      else
        -----------------------------------------------------------------------
        -- ** RUN MODE ** --

        -- no more configuring
        config_done_r <= '1';
        
        -- enable the random generator here, so that it is in the same state every
        -- time we start running (before it was enabled all the time, and
        -- because configuring takes a random amount of time, measurements were
        -- changing between runs)
        rnd_en_r <= '1';

        -- random addr counter is incremented according to random generator bits
        old_random_r <= random;
        --if (old_random_r(random_w_g-1) xor random(0)) = '1' then
		  if random(0) = '1' then

          if rnd_addr_counter_r = num_of_tgs_c-1 or
            (rnd_addr_counter_r+1 = own_address_g and rnd_addr_counter_r = num_of_tgs_c-2)
          then
            -- last address or second last but own address would be the last
            assert own_address_g /= 1 report "rnd_addr_counter reseting cnt: " & integer'image(rnd_addr_counter_r) & ", own addr: " & integer'image(own_address_g) & ", num_tgs: " & integer'image(num_of_tgs_c);
            if own_address_g = 0 then
              -- if own addr is 0, we naturally can't flip the counter to it
              rnd_addr_counter_r <= 1;
            else
              rnd_addr_counter_r <= 0;
            end if;
            
          elsif rnd_addr_counter_r+1 = own_address_g then
            -- avoiding own address
				assert own_address_g /= 1 report "rnd_addr_counter skipping cnt: " & integer'image(rnd_addr_counter_r) & ", own addr: " & integer'image(own_address_g) & ", num_tgs: " & integer'image(num_of_tgs_c);
            rnd_addr_counter_r <= rnd_addr_counter_r + 2;
          else
				assert own_address_g /= 1 report "rnd_addr_counter incr cnt: " & integer'image(rnd_addr_counter_r) & ", own addr: " & integer'image(own_address_g) & ", num_tgs: " & integer'image(num_of_tgs_c);
            rnd_addr_counter_r <= rnd_addr_counter_r + 1;
          end if;
        end if;
			
			

		  
        

        -----------------------------------------------------------------------

        block_others_v := '0';
        new_event_activating_v := '0';
        -- event counters are running all the time, if there is events
        if event_pointer_r /= 0 then

          for n in 0 to n_events_g-1 loop

            if events_r(n).active = '1' then

              event_counters_r(n) <= event_counters_r(n) + 1;
              if event_counters_r(n) = events_r(n).waiting_time then

                if block_others_v = '0' and
                  ( events_r(n).dep_en = '0' or
                  dep_flags_r( events_r(n).dep_flag ) = '1' or
                  events_r(n).dont_wait_dep = '0' )
                then

                  -- if this is supposed to block all others
                  if events_r(n).block_others = '1' then
                    event_status_r <= (others => '0');
                    trigger_status_r <= (others => '0');
                    trigger_waiting_r <= '0';
                    block_others_v := '1';
                  end if;
                  
                  -- make the event happen next time FSM is in the wait_data state
                  event_waiting_r <= '1';
                  event_status_r(n) <= '1';

                  -- this prevents event_waiting from going down in later
                  -- phases, if two events activate on two clk cycles one right
                  -- after the other 
                  new_event_activating_v := '1';

                end if;
                -- reset the counter anyway
                event_counters_r(n) <= 0;
              
              end if;
            end if;                        
          end loop;  -- n
        end if;

        -----------------------------------------------------------------------
        -- valid signal is also being monitored
        if valid_in = '1' then
          -- compare data with triggers
          for n in 0 to n_triggers_g-1 loop

            -- triggers mode tells us if we use either address ("01"),
            -- datatype ("10") of both ("11") for triggering.
            -- If trigger's mode is "00", it means that it is not
            -- initialized at all and we should ignore it
            if (sender_addr_in = triggers_r(n).sender or triggers_r(n).mode(0) = '0')
              and (data_type_in = triggers_r(n).type_in or triggers_r(n).mode(1) = '0')
              and (triggers_r(n).mode /= "00")
            then

              -- if we have idle_times set up:
              if triggers_r(n).idle_times = triggers_r(n).idle_counter then

                -- make sure that dependencies are ok, or we are at least
                -- waiting for them to get ok
                if block_others_v = '0' and
                  ( triggers_r(n).dep_en = '0' or
                  dep_flags_r( triggers_r(n).dep_flag ) = '1' or
                  triggers_r(n).dont_wait_dep = '0' )
                then
                  
                  -- if dependencies haven't been met, don't try to be busy
                  if triggers_r(n).dep_en = '0' or dep_flags_r( triggers_r(n).dep_flag ) = '1' then
                    -- busy signal must rise right away, to block reader from
                    -- starting to read a new tx
                    busy_to_rdr_out <= '1';

                    -- if this is a trigger with block_others set, we will prevent
                    -- all other triggers and events from activating
                    if triggers_r(n).block_others = '1' then
                      trigger_status_r <= (others => '0');
                      event_status_r <= (others => '0');
                      event_waiting_r <= '0';
                      block_others_v := '1';
                    end if;
                  end if;
                  
                  trigger_waiting_r <= '1';
                  trigger_status_r(n) <= '1';

                  -- if trigger is type reply_to_sender, we need to store the
                  -- sender address. Luckily we have spare room in target
                  if triggers_r(n).reply_to_sender = '1' then
                    triggers_r(n).target <= sender_addr_in;
                  end if;
                
                  -- store the path measuring starting time too, if needed
                  if measure_path_in = '1' then
                    measure_path_r <= '1';
                    path_start_time_r <= path_start_time_in;
                  end if;

                end if;

                -- reset the counter anyway
                triggers_r(n).idle_counter <= 0;

              else
                triggers_r(n).idle_counter <= triggers_r(n).idle_counter + 1;
              end if;
              
            end if;
          end loop;  -- n

        end if;

        -----------------------------------------------------------------------
        
        -- * FSM * --
        case run_state_r is
        
          when wait_data =>

            event_activated_v := '0';
            -- events have higher priority
            if event_waiting_r = '1' then

              -- we select an event with a lowest index
              num_events_v := 0;
              
              for n in 0 to n_events_g-1 loop
                -- dependencies must have been met
                if event_status_r(n) = '1' then

                  if events_r(n).dep_en = '0' or dep_flags_r( events_r(n).dep_flag ) = '1' then
                  
                    if event_activated_v = '0' then

                      -- this event has lowest index and will be run
                      -- others wait for the next round
                      event_to_run_r    <= n;
                      run_event_r       <= '1';
                      busy_to_rdr_out   <= '1';
                      run_state_r       <= operate;
                      event_status_r(n) <= '0';
                      -- clear the active state if necessary
                      if events_r(n).once_only = '1' then
                        events_r(n).active <= '0';
                      end if;

                      -- clear dependency flag if necessary
                      if events_r(n).dep_en = '1' then
                        dep_flags_r( events_r(n).dep_flag ) <= '0';
                      end if;

                      -- set a flag?
                      if events_r(n).set_dep_en = '1' then
                        dep_flags_r( events_r(n).dep_flag_to_set ) <= '1';
                      end if;

                      event_activated_v := '1';

                    elsif events_r(n).dep_en = '1' then
                      -- possibly depending on the same flag, so we can't let it be cleared
                      dep_flags_r( events_r(n).dep_flag ) <= '1';
                      
                    end if;
                  end if;

                  -- also count waiting events with unmet dependencies
                  num_events_v := num_events_v + 1;
                  
                end if;
              end loop;  -- n

              if num_events_v = 1 and event_activated_v = '1' and new_event_activating_v = '0' then
                -- only one event, clear the event_waiting_r flag
                event_waiting_r <= '0';
              end if;
            end if;

            
            if event_activated_v = '0' and trigger_waiting_r = '1' then

              num_triggers_v := 0;
              trigger_activated_v := '0';

              for n in 0 to n_triggers_g-1 loop

                if trigger_status_r(n) = '1' then
                  if triggers_r(n).dep_en = '0' or dep_flags_r( triggers_r(n).dep_flag ) = '1' then

                    if trigger_activated_v = '0' then
                      -- this is the trigger with lowest index, others will wait
                      trigger_to_run_r    <= n;
                      busy_to_rdr_out     <= '1';
                      run_state_r         <= operate;

                      if triggers_r(n).block_others = '0' then
                        -- if this is normal (not blocking) trigger, we clear only
                        -- its own flag
                        trigger_status_r(n) <= '0';
                      else
                        -- if this is a blocking trigger, clear all flags
                        trigger_status_r <= (others => '0');
                        trigger_waiting_r <= '0';
                      end if;

                      -- clear dependency flag if necessary
                      if triggers_r(n).dep_en = '1' then
                        dep_flags_r( triggers_r(n).dep_flag ) <= '0';
                      end if;

                      -- check if we want to set a flag
                      if triggers_r(n).set_dep_en = '1' then
                        dep_flags_r( triggers_r(n).dep_flag_to_set ) <= '1';
                      end if;

                      trigger_activated_v := '1';

                    elsif triggers_r(n).dep_en = '1' then
                      -- possibly depending on the same flag, so we can't let it be cleared
                      dep_flags_r( triggers_r(n).dep_flag ) <= '1';

                    end if;
                  end if;
                  
                  num_triggers_v := num_triggers_v + 1;
                  
                end if;
                
              end loop;  -- n

              if num_triggers_v = 1 and trigger_activated_v = '1' then
                -- only one trigger, clear the flag
                trigger_waiting_r <= '0';
              end if;
              
            end if;



          when operate =>

            -- "process data"
            processing_counter_r <= processing_counter_r + 1;

            if n_events_g /= 0 then
              if (processing_counter_r = events_r(event_to_run_r).processing_time and
                run_event_r = '1')
              then
                -- start sending, if there is something to send. if not, return
                -- to waiting state
                if events_r( event_to_run_r ).tx_length /= 0 then
                  run_state_r <= initiate_tx;
                else
                  run_state_r <= wait_data;
                  run_event_r <= '0';
                  busy_to_rdr_out <= '0';
                end if;
                
                -- clear the counter
                processing_counter_r <= 0;
              end if;
            end if;

            if n_triggers_g /= 0 then
              if (processing_counter_r = triggers_r(trigger_to_run_r).processing_time and
                  run_event_r = '0')
              then
                if triggers_r(trigger_to_run_r).tx_length /= 0 then
                  run_state_r <= initiate_tx;
                else
                  run_state_r <= wait_data;
                  busy_to_rdr_out <= '0';
                end if;
                
                processing_counter_r <= 0;
              end if;
            end if;

            
          when initiate_tx =>

            -- initiate transfer
            if run_event_r = '1' then

              -- use either given or random address
              if events_r(event_to_run_r).randomize_addr = '1' then
				    assert own_address_g /= 1 report "Value of randomize addr is: 1";
                dest_addr_out <= std_logic_vector(to_unsigned( rnd_addr_counter_r, address_w_c ));
              else
					assert own_address_g /= 1 report "Value of randomize addr is: 0";
                dest_addr_out <= events_r(event_to_run_r).target;
              end if;
              
              tx_len_v := events_r(event_to_run_r).tx_length;

              -- use either given tx length, or one that is varying around the
              -- given length
              if events_r(event_to_run_r).randomize_len = '1' then
                tx_len_div_8_v := events_r(event_to_run_r).tx_length / 8;
              else
                -- this times random value is added to the original tx length, so if
                -- this is zero, out going tx length will be the original one
                tx_len_div_8_v := 0;
              end if;
              
              tx_data_type_out <= events_r(event_to_run_r).type_out;

              -- path measuring stuff:
              measure_path_out <= events_r(event_to_run_r).path_measuring;
              -- new_path_out is ignored if measure_path_out = '0'
              new_path_out     <= '1';

            else

              -- we can use either given address, sender's address or random address
              if triggers_r(trigger_to_run_r).randomize_addr = '1' then
						assert own_address_g /= 1 report "Value of randomize addr is: 1";
                dest_addr_out <= std_logic_vector(to_unsigned( rnd_addr_counter_r, address_w_c ));
              else
                -- if reply_to_sender, the sender address was saved to
                -- 'target' when trigger activated
					 assert own_address_g /= 1 report "Value of randomize addr is: 0";
                dest_addr_out <= triggers_r(trigger_to_run_r).target;
              end if;

              tx_len_v := triggers_r(trigger_to_run_r).tx_length;

              if triggers_r(trigger_to_run_r).randomize_len = '1' then
                tx_len_div_8_v := triggers_r(trigger_to_run_r).tx_length / 8;
              else
                tx_len_div_8_v := 0;
              end if;
              
              tx_data_type_out <= triggers_r(trigger_to_run_r).type_out;

              -- path measuring:
              measure_path_out <= measure_path_r or triggers_r(trigger_to_run_r).path_measuring;
              -- others ignored if measure_path_out = '0'
              -- if measure_path_r = '1' then we are not setting up a new
              -- measurement but continuing an old one
              if measure_path_r = '1' then
                new_path_out <= '0';
                path_start_time_out <= path_start_time_r;
              else
                new_path_out <= '1';
              end if;
              
              
            end if;

            
            final_tx_len_v := tx_len_v + tx_len_div_8_v * random_int;
            if final_tx_len_v < 3 then
              final_tx_len_v := 3;
            end if;
            tx_length_out <= std_logic_vector( to_unsigned( final_tx_len_v, tx_length_w_c ) );
            start_tx_out  <= '1';
            run_state_r   <= wait_tx;
            

          when wait_tx =>

            if ack_from_sndr_in = '1' then

              start_tx_out <= '0';

              -- nullify measure_path only if there was just one trigger to activate
              if trigger_waiting_r = '0' then
                measure_path_r <= '0';
              end if;
              measure_path_out <= '0';
              busy_to_rdr_out <= '0';
              run_state_r <= wait_data;
              run_event_r <= '0';
              
            end if;
          
        end case;

        -- ** END OF RUN MODE ** --
        -----------------------------------------------------------------------
      end if;
      
    end if;
  end process fsm;
			rnd_addr_cnt_dup <= rnd_addr_counter_r;
end rtl;
