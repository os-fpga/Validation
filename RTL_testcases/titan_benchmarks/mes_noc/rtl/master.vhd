-------------------------------------------------------------------------------
-- Title      : Extra block used by the master TG.
-- Project    : 
-------------------------------------------------------------------------------
-- File       : master.vhd
-- Author     :   <alhonena@BUMMALO>
-- Company    : 
-- Last update: 2009/09/30
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: Includes UART-based configuration and reporting system.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2009/05/27  1.0      alhonena        Created
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

entity master is

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

end master;

architecture rtl of master is

  signal config_mode_en_out_r  : std_logic;
  signal own_conf_or_own_rep_r : std_logic;
  signal config_data_we_r : std_logic;
  
  type main_state_type is (wait_for_input, check_char, send1, send2, send3,
                           send4, send5, prepare_to_start, start, print_rep_header2,
                           print_rep_header2b,
                           wait_rep, send_rep_cmd, rep_cmd_sent, ask_monitor,
                           ask_monitor2, finished, send_path_pkts, print_path_rep);

  signal state_r              : main_state_type;

  type sub_state_type is (idle, addip1, addip2, addmode1, addmode2, addaddr1,
                          addaddr2, addtag, addtime1, addtime2, addtime3,
                          addtime4, addonetime, addsendaddr1, addsendaddr2,
                          addsendtag, addsendamount1, addsendamount2,
                          addsendamount3, addsendamount4, addblockothers,
                          addproctime1, addproctime2, addproctime3, addproctime4,
                          addranddest, addrandsize, runtime1,
                          runtime2, runtime3, runtime4,
                          runtime5, runtime6, runtime7, runtime8,
                          add_tg_to_path1, add_tg_to_path2,
                          add_depen, add_depflag, add_dontwaitdep,
                          addsetdep, addflagtoset);
  signal substate_r : sub_state_type;

  signal read_data_r         : std_logic_vector(uart_bits_c-1 downto 0);
  signal read_data_r_hex2bin : std_logic_vector(3 downto 0);

  signal tg_addr_r         : std_logic_vector(7 downto 0);
  signal addmode_r         : std_logic_vector(1 downto 0);
  signal add_addr_r        : std_logic_vector(7 downto 0);
  signal add_typetag_r     : std_logic_vector(3 downto 0);
  signal add_time_r        : std_logic_vector(15 downto 0);
  signal add_onetime_r     : std_logic;
  signal add_sendaddr_r    : std_logic_vector(7 downto 0);
  signal add_sendtag_r     : std_logic_vector(3 downto 0);
  signal add_sendamount_r  : std_logic_vector(tx_length_w_c-1 downto 0);
  signal add_proctime_r    : std_logic_vector(processing_time_w_c-1 downto 0);
  signal add_blockothers_r : std_logic;

  signal add_randdest_r    : std_logic;
  signal add_randsize_r    : std_logic;
  signal add_dep_en_r      : std_logic;
  signal add_dep_flag_r    : std_logic_vector( 3 downto 0 );
  signal add_dontwaitdep_r : std_logic;
  signal add_set_dep_r     : std_logic;
  signal add_flag_to_set_r : std_logic_vector( 3 downto 0 );

  signal config_data_full : std_logic;

  constant messages_c           : integer := 25;
  constant string_len_c         : integer := 23;
  signal   print_message_r      : integer range 0 to messages_c-1;
  signal   prev_print_message_r : integer range 0 to messages_c-1;
  type stringarray is array (0 to messages_c-1) of string(1 to string_len_c);

  constant strings_c : stringarray :=
    (lf & cr & "Give a command.    > ",      -- 0
     lf & cr & "TG Address?        > ",
     lf & cr & "MODE bits?         > ",
     lf & cr & "Trig. address?     > ",
     lf & cr & "Trig. datatype?    > ",
     lf & cr & "Waiting time?      > ",          -- 5
     lf & cr & "Only once event?   > ",
     lf & cr & "Packet dest?       > ",
     lf & cr & "Packet datatype?   > ",
     lf & cr & "Packet size?       > ",
     lf & cr & "Processing time?   > ",     -- 10
     lf & cr & "TG MIN  MAX   TOTAL  ",  -- 11
     lf & cr & "Running time?      > ",
               "  NUM   LMIN LMAX TOT" & lf & cr,  -- 13
     lf & cr & "Randomize dest.?   > ",  -- 14
     lf & cr & "Randomize size?    > ",
     lf & cr & "Reply to sender?   > ",  -- 16
     lf & cr & "MONITOR REPORT:    " & lf & cr,
     lf & cr & "PATH: pos tg am lat" & lf & cr,
     lf & cr & "Dependency?        > ",
     lf & cr & "Dep. flag number?  > ",  -- 20
     lf & cr & "Don't wait dep.    > ", 
     lf & cr & "Set dep. flag?     > ",
     lf & cr & "Block others?      > ",
     lf & cr & "Error. Try again.  > "  -- 24
     );

  signal printing_r    : std_logic;
  signal print_count_r : integer range 1 to string_len_c;
  signal reprint_msg_r : std_logic;

  -- Report gathering

  -- min, max, tot, num, latmin, latmax, lattot ,   errors
  -- 16   16   32   32     16     16       32        8+8
  constant rep_values_to_print_c : integer := 4+4+8+8+4+4+8 + 4;
  
  type bin16_report_array_t is array (0 to rep_values_to_print_c/4-1) of std_logic_vector(15 downto 0);
  type report_array_t is array (0 to num_of_tgs_c-1) of bin16_report_array_t;
 
  signal report_data_r : report_array_t;
  signal report_read_cnt_r : integer range 0 to rep_values_to_print_c;

  signal rep_read_cur_tg_r : integer range 0 to num_of_tgs_c-1;

  signal report_data_re_out_r : std_logic;

  signal rep_print_cur_tg : integer range 0 to num_of_tgs_c-1;
  signal print_report_r : std_logic;
  signal printing_report_r : std_logic;

  -- UART data mux
  signal data_to_UART_txt_r : std_logic_vector(uart_bits_c-1 downto 0);
  signal data_to_UART_rep : std_logic_vector(uart_bits_c-1 downto 0);
  signal data_to_UART_bin2hex : std_logic_vector(4 downto 0);  -- 10000 means spacebar


  type print_state_type is (print_reporter1, print_reporter2, firstlf, firstcr,
                            printtg1, printtg2, printval1, printval2, print_extra_space,
                            printval3, printval4, printspace, printlf, printcr, finish);

  signal print_state_r : print_state_type;

  signal report_print_cnt_r : integer range 0 to rep_values_to_print_c-1;
  
  signal run_time_r : std_logic_vector(31 downto 0);
  signal run_counter_r : integer;       -- 32 bit
  signal rep_idle_counter_r : integer range 0 to report_idle_time_c;

  signal cur_reporter_r : integer range 0 to num_of_tgs_c;

  signal report_printed_r : std_logic;

  signal monitor_command_out_wait_count_r : integer range 0 to mon_cmd_synch_time_c-1;

  -- Path measurement signals
  signal path_conf_r : std_logic;
  signal path_tg_ptr_r : integer range 0 to num_of_tgs_c-1;
  signal last_path_tg_r : integer range 0 to num_of_tgs_c-1;
  type path_tg_array is array (0 to num_of_tgs_c-1) of std_logic_vector( address_w_c-1 downto 0 );
  -- contains the path tg numbers
  signal path_tgs_r : path_tg_array;
  signal path_conf_word_r : integer range 0 to 2;

  signal last_in_path_r : std_logic;
  signal wait_own_reader_r : std_logic;

  -- path report signals
  type path_report_state_type is (amount, latency1, latency2);
  signal path_report_state_r : path_report_state_type;
  signal read_path_report_r : std_logic;

  type path_data_record is record
    valid    : std_logic;
    location : std_logic_vector( address_w_c-1 downto 0 );
    amount   : std_logic_vector( path_amount_w_c-1 downto 0 );
    latency  : std_logic_vector( path_latency_w_c-1 downto 0 );
  end record;
  type path_data_array is array (0 to num_of_tgs_c-1) of path_data_record;
  signal path_report_data_r : path_data_array;

  signal printing_path_rep_r : std_logic;
  signal print_path_report_r : std_logic;
  signal path_report_printed_r : std_logic;
  type path_print_state_type is (pos1, pos2, space, tg1, tg2, amount, lat, lf, cr);
  signal path_print_state_r : path_print_state_type;
  signal prev_path_print_state_r : path_print_state_type;
  signal path_print_ptr_r : integer range 0 to num_of_tgs_c-1;
  signal path_print_lat_cnt_r : integer range 0 to 7;

  -- failure detection
  signal not_hex : std_logic;
  signal command_failed_r : std_logic;
  signal we_to_UART_r : std_logic;
  signal read_failure_r : std_logic;

  -- Comments starting with # are ignored
  signal ignoring_comment_r : std_logic;

-------------------------------------------------------------------------------
begin  -- rtl
-------------------------------------------------------------------------------
  
  -- Converts read_data_r ascii hex value to binary
  hex2bin : process (read_data_r)
  begin  -- process hex2bin
    not_hex <= '0';
    case read_data_r is
      when "00110000" => read_data_r_hex2bin <= "0000";
      when "00110001" => read_data_r_hex2bin <= "0001";
      when "00110010" => read_data_r_hex2bin <= "0010";
      when "00110011" => read_data_r_hex2bin <= "0011";
      when "00110100" => read_data_r_hex2bin <= "0100";
      when "00110101" => read_data_r_hex2bin <= "0101";
      when "00110110" => read_data_r_hex2bin <= "0110";
      when "00110111" => read_data_r_hex2bin <= "0111";
      when "00111000" => read_data_r_hex2bin <= "1000";
      when "00111001" => read_data_r_hex2bin <= "1001";
      when "01100001" => read_data_r_hex2bin <= "1010";
      when "01100010" => read_data_r_hex2bin <= "1011";
      when "01100011" => read_data_r_hex2bin <= "1100";
      when "01100100" => read_data_r_hex2bin <= "1101";
      when "01100101" => read_data_r_hex2bin <= "1110";
      when "01100110" => read_data_r_hex2bin <= "1111";
      when others     =>
        read_data_r_hex2bin <= "0000";
        if read_data_r = "00100000" or read_data_r = "00001010" or read_data_r = "00001101" then
          -- space, lf and cr
          not_hex <= '0';
        else
          not_hex <= '1';
        end if;
    end case;
  end process hex2bin;

  -- if more failure signals exist, or them here
  failure_out <= read_failure_r;
  
  -- uart failure detection
  failed: process (clk, rst_n)
    variable hex_failure_v : std_logic;
  begin  -- process failed
    if rst_n = '0' then                 -- asynchronous reset (active low)
      read_failure_r <= '0';
    elsif clk'event and clk = '1' then  -- rising clock edge

      hex_failure_v := '0';
      
      -- check if not_hex is up when it shouldn't
      if not_hex = '1' and state_r = check_char then
        if read_data_r /= "00100000" and
          read_data_r /= "00001010" and
          read_data_r /= "00001101" and
          read_data_r /= "00010111" and
          read_data_r /= "00100011" and
          ignoring_comment_r = '0'
        then
          -- not space, lf, cr or tab

          if substate_r /= idle and substate_r /= add_tg_to_path1
          then
            -- we should have a valid hex value in these states
            hex_failure_v := '1';
          else
            -- now we should have either 'a', 's' or 'p'
            if read_data_r /= "01100001" and
              read_data_r /= "01110011" and
              read_data_r /= "01110000"
            then
              hex_failure_v := '1';
            end if;
          end if;
        end if;
      end if;

      
      if hex_failure_v = '1' or command_failed_r = '1' then

        report "Invalid value in the input file!" severity failure;
        read_failure_r <= '1';
      end if;
    end if;
  end process failed;

  
  -- UART data mux
  uart_data_mux: process (printing_report_r, data_to_UART_txt_r, printing_r,
                          data_to_UART_rep, printing_path_rep_r)
  begin  -- process uart_data_mux
    if printing_r = '1' or (printing_report_r = '0' and printing_path_rep_r = '0') then
      data_to_UART_out <= data_to_UART_txt_r;
    else
      data_to_UART_out <= data_to_UART_rep;
    end if;
  end process uart_data_mux;

  -- Converts data_to_UART_bin2hex to ASCII hex value and feds it to UART data
  -- mux.
  bin2hex: process (data_to_UART_bin2hex)
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
      when others =>  data_to_UART_rep <= "00100000";
    end case;
    
  end process bin2hex;
  
  
  report_data_re_out <= report_data_re_out_r;
  we_to_UART_out <= we_to_UART_r;
  
  assert not (report_data_empty_in = '0' and config_mode_en_out_r = '0')
    report "There is report data but config_mode_en is not active!" severity error;

  -- purpose: Gets statistics and stores them to a table.
  stats_gathering : process (clk, rst_n)
  begin  -- process stats_gathering
    if rst_n = '0' then                 -- asynchronous reset (active low)
      report_read_cnt_r <= 0;
      rep_read_cur_tg_r <= 0;
      print_report_r <= '0';
      report_data_re_out_r <= '0';
      path_report_state_r <= amount;
      read_path_report_r <= '0';
      path_report_data_r <= (others => ('0', (others => '0'), (others => '0'), (others => '0')));
      
    elsif clk'event and clk = '1' then  -- rising clock edge
      print_report_r <= '0';
      report_data_re_out_r <= '0';
      if report_data_empty_in = '0' then

        assert print_report_r = '0'
          report "Report data flow did not end!" severity warning;

        report_data_re_out_r <= '1';

        if report_data_re_out_r = '1' then

          -- path report is read to a different register, so we deal with it separately
          if read_path_report_r = '0' then
          
				
			 
            report_data_r(rep_read_cur_tg_r)(report_read_cnt_r)
              <= report_data_data_in(15 downto 0);

            if report_read_cnt_r /= rep_values_to_print_c/4-1 then
              report_read_cnt_r <= report_read_cnt_r + 1;
            else
              report_read_cnt_r <= 0;
				  report "Read Report for TG" & integer'image(rep_read_cur_tg_r);
              if rep_read_cur_tg_r = num_of_tgs_c-1 then
                rep_read_cur_tg_r <= 0;
                
                -- switch to reading path report
                read_path_report_r <= '1';
                path_report_state_r <= amount;
              else
                rep_read_cur_tg_r <= rep_read_cur_tg_r + 1;
              end if;
            end if;

          else
            -- reading the path report

            case path_report_state_r is
              
              when amount =>
              
                -- check if path report valid
                if report_data_data_in(22 downto 16) /= "0000000" then
                  path_report_data_r(cur_reporter_r).valid <= '1';
                  path_report_data_r(cur_reporter_r).location <= report_data_data_in(22 downto 16);
                  path_report_data_r(cur_reporter_r).amount <= report_data_data_in(15 downto 0);
                  path_report_state_r <= latency1;
                else

                  -- not valid, no more path data coming, move on
                  read_path_report_r <= '0';
                  -- Data flow should end now, and when it begins next time, it will
                  -- be from different tg. Let's print a report now.
                  print_report_r <= '1';
                end if;

              when latency1 =>
                -- path report was valid, so lets read more!
                path_report_data_r(cur_reporter_r).latency( path_latency_w_c-1 downto path_latency_w_c/2 )
                  <= report_data_data_in(15 downto 0);
                path_report_state_r <= latency2;

              when latency2 =>
                path_report_data_r(cur_reporter_r).latency( path_latency_w_c/2-1 downto 0 )
                  <= report_data_data_in(15 downto 0);

                -- all done, start printing
                read_path_report_r <= '0';
                print_report_r <= '1';
                              
            end case;

          end if;
        end if;
      end if;
    end if;
  end process stats_gathering;

  
  -- purpose: Prints text to UART
  -- When print_message_r changes its value, the
  -- message is printed.
  printing : process (clk, rst_n)
    variable vhdl_rotfl_fix_v : std_logic_vector(7 downto 0);
    variable path_member_v : integer range 0 to num_of_tgs_c-1;

    type slv_split_type is array (0 to 7) of std_logic_vector(3 downto 0);
    variable data_split_v : slv_split_type;
  begin  -- process printing
    if rst_n = '0' then                 -- asynchronous reset (active low)
      -- reset this to different value than
      -- print_message_r to cause the initial
      -- printing.
      prev_print_message_r <= 1;
      printing_r           <= '0';
      print_count_r        <= 1;
      we_to_UART_r         <= '0';
      printing_report_r    <= '0';
      rep_print_cur_tg     <= 0;
      print_state_r <= print_reporter1;
      printing_path_rep_r  <= '0';
      path_print_state_r   <= pos1;
      path_print_ptr_r     <= 0;
      path_print_lat_cnt_r <= 0;
      path_report_printed_r <= '0';
      report_print_cnt_r   <= 0;
      
    elsif clk'event and clk = '1' then  -- rising clock edge
      prev_print_message_r <= print_message_r;

      if print_message_r /= prev_print_message_r or reprint_msg_r = '1' then
        printing_r    <= '1';
        print_count_r <= 1;
      end if;

      if print_report_r = '1' then
        printing_report_r <= '1';
        rep_print_cur_tg <= 0;
      end if;

      if print_path_report_r = '1' and path_report_printed_r = '0' then
        printing_path_rep_r <= '1';
      end if;

      we_to_UART_r       <= '0';
      if tx_ready_from_UART_in = '1' and we_to_UART_r = '0' then
        if printing_r = '1' then
          data_to_UART_txt_r <= std_logic_vector(to_unsigned(
            character'pos(strings_c(print_message_r)(print_count_r)), 8));
          we_to_UART_r   <= '1';

          if print_count_r = string_len_c then
            printing_r       <= '0';                

          else
            print_count_r    <= print_count_r + 1;
          end if;
        elsif printing_report_r = '1' then

          we_to_UART_r <= '1';
          case print_state_r is
            when print_reporter1 =>
              vhdl_rotfl_fix_v := std_logic_vector(to_unsigned(cur_reporter_r, 8));
              data_to_UART_bin2hex <= '0' & vhdl_rotfl_fix_v(7 downto 4);
              print_state_r <= print_reporter2;
            when print_reporter2 =>
              vhdl_rotfl_fix_v := std_logic_vector(to_unsigned(cur_reporter_r, 8));
              data_to_UART_bin2hex <= '0' & vhdl_rotfl_fix_v(3 downto 0);
              print_state_r <= firstlf;
            when firstlf =>
              data_to_UART_bin2hex <= "10001";
              print_state_r        <= firstcr;
            when firstcr =>
              data_to_UART_bin2hex <= "10010";
              print_state_r        <= printtg1;              
            when printtg1      =>
              vhdl_rotfl_fix_v := std_logic_vector(to_unsigned(rep_print_cur_tg, 8));
              data_to_UART_bin2hex <= '0' & vhdl_rotfl_fix_v(7 downto 4);
              print_state_r        <= printtg2;
            when printtg2      =>
              vhdl_rotfl_fix_v := std_logic_vector(to_unsigned(rep_print_cur_tg, 8));
              data_to_UART_bin2hex <= '0' & vhdl_rotfl_fix_v(3 downto 0);
              print_state_r        <= printspace;
            when printspace  =>
              data_to_UART_bin2hex <= "10000";
              print_state_r        <= printval1;
            when printval1 =>
              data_to_UART_bin2hex <= '0' &
                report_data_r(rep_print_cur_tg)(report_print_cnt_r)(15 downto 12);
              print_state_r <= printval2;
            when printval2 =>
              data_to_UART_bin2hex <= '0' &
                report_data_r(rep_print_cur_tg)(report_print_cnt_r)(11 downto 8);
--              if report_print_cnt_r = 0 then
                -- between 8-bit min and max values.
--                print_state_r <= print_extra_space;
--              else
              print_state_r <= printval3;
--              end if;

--            when print_extra_space =>
--              data_to_UART_bin2hex <= "10000";
--              print_state_r <= printval3;
              
            when printval3 =>
              data_to_UART_bin2hex <= '0' &
                report_data_r(rep_print_cur_tg)(report_print_cnt_r)(7 downto 4);
              print_state_r <= printval4;

            when printval4 =>
              data_to_UART_bin2hex <= '0' &
                report_data_r(rep_print_cur_tg)(report_print_cnt_r)(3 downto 0);
              if report_print_cnt_r /= rep_values_to_print_c/4-1 then
                report_print_cnt_r <= report_print_cnt_r + 1;
                if report_print_cnt_r = 2 or
                   report_print_cnt_r = 4 or
                   report_print_cnt_r = 8 then  -- Ignore space when 32-bit
                                                   -- "total" or "num" value
                  print_state_r <= printval1;
                else
                  print_state_r <= printspace;
                end if;
              else
                print_state_r <= printlf;
              end if;

            when printlf       =>
              report_print_cnt_r <= 0;
              data_to_UART_bin2hex <= "10001";
              print_state_r        <= printcr;
              
            when printcr       =>
              data_to_UART_bin2hex <= "10010";
              print_state_r <= finish;

            when finish        =>
              we_to_UART_r <= '0';    -- override '1'
              if rep_print_cur_tg = num_of_tgs_c-1 then
                -- This was the final row; next time we will be
                -- printing data from a different TG.
                rep_print_cur_tg   <= 0;
                printing_report_r  <= '0';
                print_state_r <= print_reporter1;
              else
                -- Print next row.
                rep_print_cur_tg   <= rep_print_cur_tg + 1;
                print_state_r <= printtg1;                
              end if;


            when others => null;
          end case;


        elsif printing_path_rep_r = '1' then

          -- get path members in correct order from path_tgs_r
          path_member_v := to_integer( unsigned( path_tgs_r(path_print_ptr_r) ));
          we_to_UART_r <= '1';
          
          if path_print_ptr_r = 0 or path_report_data_r(path_member_v).valid = '1' then
            prev_path_print_state_r <= path_print_state_r;
            
            case path_print_state_r is
            
              when pos1 =>
                data_to_UART_bin2hex <= "00" & path_report_data_r(path_member_v).location(6 downto 4);
                path_print_state_r <= pos2;

              when pos2 =>
                data_to_UART_bin2hex <= '0' & path_report_data_r(path_member_v).location(3 downto 0);
                path_print_state_r <= space;

              when space =>
                data_to_UART_bin2hex <= "10000";

                case prev_path_print_state_r is
                  when pos2 =>
                    path_print_state_r <= tg1;
                  when tg2 =>
                    path_print_state_r <= amount;
                    path_print_lat_cnt_r <= 0;
                  when others =>
                    path_print_state_r <= lat;
                    path_print_lat_cnt_r <= 0;
                end case;

              when tg1 =>
                data_to_UART_bin2hex <= "00" & path_tgs_r(path_print_ptr_r)(6 downto 4);
                path_print_state_r <= tg2;

              when tg2 =>
                data_to_UART_bin2hex <= '0' & path_tgs_r(path_print_ptr_r)(3 downto 0);
                path_print_state_r <= space;

              when amount =>

                if path_print_lat_cnt_r = 3 then
                  -- last one
                  path_print_state_r <= space;
                else
                  path_print_state_r <= amount;
                  path_print_lat_cnt_r <= path_print_lat_cnt_r + 1;
                end if;

                -- vhdl doesn't allow non-constant ranges, so we'll have to
                -- split the amount like this
                data_split_v := ( 0 => path_report_data_r(path_member_v).amount(15 downto 12),
                                  1 => path_report_data_r(path_member_v).amount(11 downto 8),
                                  2 => path_report_data_r(path_member_v).amount(7 downto 4),
                                  3 => path_report_data_r(path_member_v).amount(3 downto 0),
                                  others => (others => '0') );

                data_to_UART_bin2hex <=
                  '0' & data_split_v( path_print_lat_cnt_r );

              when lat =>
                if path_print_lat_cnt_r = 7 then
                  -- last of lat chars
                  path_print_state_r <= lf;
                else
                  path_print_state_r <= lat;
                  path_print_lat_cnt_r <= path_print_lat_cnt_r + 1;
                end if;

                -- also the latency is split
                data_split_v := ( path_report_data_r(path_member_v).latency(31 downto 28),
                                     path_report_data_r(path_member_v).latency(27 downto 24),
                                     path_report_data_r(path_member_v).latency(23 downto 20),
                                     path_report_data_r(path_member_v).latency(19 downto 16),
                                     path_report_data_r(path_member_v).latency(15 downto 12),
                                     path_report_data_r(path_member_v).latency(11 downto 8),
                                     path_report_data_r(path_member_v).latency(7 downto 4),
                                     path_report_data_r(path_member_v).latency(3 downto 0) );
                
                data_to_UART_bin2hex <=
                  '0' & data_split_v( path_print_lat_cnt_r );

              when lf =>
                data_to_UART_bin2hex <= "10001";
                path_print_state_r <= cr;
                
              when cr =>
                if path_print_ptr_r = last_path_tg_r then
                  printing_path_rep_r <= '0';
                  path_report_printed_r <= '1';
                else
                  path_print_ptr_r <= path_print_ptr_r + 1;
                end if;

                data_to_UART_bin2hex <= "10010";
                path_print_state_r <= pos1;
                
              when others => null;
            end case;

          else
            -- path report data not valid

            if path_print_ptr_r = last_path_tg_r then
              printing_path_rep_r <= '0';
              path_report_printed_r <= '1';
            else
              path_print_ptr_r <= path_print_ptr_r + 1;
            end if;
          end if;

          
        else
          -- not printing; just echo the typed characters.
          if data_available_from_UART_in = '1' then
            -- Please note that the re is asserted in the another
            -- process. Just read the data here.
            data_to_UART_txt_r <= data_from_UART_in;
            we_to_UART_r     <= '1';

          end if;
        end if;

      end if;
    end if;
  end process printing;

  config_mode_en_out <= config_mode_en_out_r;
  -- when own_conf_or_own_rep_out is '1', master_sender_mux disables connection
  -- between master and noc, and raises full signal. This would be interpreted
  -- as reader being full, so we have to disable the full signal and rely on
  -- reader not getting full in any circumstanses.
  config_data_full        <= config_data_full_in and (not own_conf_or_own_rep_r);
  config_data_we_out      <= config_data_we_r;
  own_conf_or_own_rep_out <= own_conf_or_own_rep_r;
  
  input_reacting : process (clk, rst_n)
  begin  -- process input_reacting
    if rst_n = '0' then                 -- asynchronous reset (active low)
      re_to_UART_out       <= '0';
      state_r              <= wait_for_input;
      substate_r           <= idle;
      print_message_r      <= 0;
      reprint_msg_r        <= '0';
      config_mode_en_out_r <= '1';
      config_data_we_r     <= '0';
      own_conf_or_own_rep_r <= '0';

      add_typetag_r     <= (others => '0');
      add_time_r        <= (others => '0');
      add_onetime_r     <= '0';
      add_addr_r        <= (others => '0');
      tg_addr_r         <= (others => '0');
      add_proctime_r    <= (others => '0');
      addmode_r         <= (others => '0');
      add_sendaddr_r    <= (others => '0');
      add_sendamount_r  <= (others => '0');
      add_sendtag_r     <= (others => '0');
      add_randdest_r    <= '0';
      add_randsize_r    <= '0';
      add_dep_en_r      <= '0';
      add_dep_flag_r    <= (others => '0');
      add_dontwaitdep_r <= '0';
      add_set_dep_r     <= '0';
      add_flag_to_set_r <= (others => '0');
      add_blockothers_r <= '0';

      run_time_r <= (others => '0');

      -- Give one clk cycle more to run time by resetting to -1 to compensate
      -- one clk cycle delay in reader's data_in_r.
      run_counter_r <= -1;
      
      cur_reporter_r <= 0;

      report_printed_r <= '0';
      rep_idle_counter_r <= 0;

      monitor_UART_sel_out <= '0';
      monitor_command_out <= "10";       -- Reset the monitor until started.
      monitor_command_out_wait_count_r <= 0;

      path_conf_r <= '0';
      path_tgs_r <= (others => (others => '0'));
      path_tg_ptr_r <= 0;
      last_path_tg_r <= 0;
      path_conf_word_r <= 0;
      last_in_path_r <= '0';
      wait_own_reader_r <= '0';

      print_path_report_r <= '0';
      command_failed_r <= '0';

      ignoring_comment_r <= '0';

    elsif clk'event and clk = '1' then  -- rising clock edge

      if read_failure_r = '1' then
        print_message_r <= 24;          -- print error message if read failure
                                        -- occured.
        -- Go back to wait for a new command.
        state_r <= wait_for_input;
        substate_r <= idle;
        
      end if;

      
      -- clear reprint flag
      if reprint_msg_r = '1' and printing_r = '1' then
        reprint_msg_r <= '0';
      end if;

      
      case state_r is
        when wait_for_input =>
          config_data_we_r <= '0';
          if data_available_from_UART_in = '1' then
            re_to_UART_out <= '1';
            read_data_r    <= data_from_UART_in;
            state_r        <= check_char;
          end if;

        when check_char =>
          re_to_UART_out <= '0';
          state_r        <= wait_for_input;

          -- Space bar, tab, lf and cr are ignored, as well as comments
          -- starting with #. When # is reached, ignore everything until
          -- lf or cr.

          if read_data_r = "00100011" then
            ignoring_comment_r <= '1';
          end if;

          if read_data_r = "00010111" or read_data_r = "00001010" then
            ignoring_comment_r <= '0';
          end if;

          -- Ignore here space, tab, lf, cr and #
          if read_data_r /= "00100000" and read_data_r /= "00010111" and 
             read_data_r /= "00001010" and read_data_r /= "00001101" and
             read_data_r /= "00100011" and ignoring_comment_r = '0' then

            case substate_r is

              when idle =>
                -- Command:
                config_data_we_r <= '0';

                case read_data_r is
                  when "01100001" =>    -- 'a'
                    substate_r        <= addip1;
                    print_message_r   <= 1;
                  when "01110011" =>    -- 's' (start)
                    substate_r        <= runtime1;
                    print_message_r   <= 12;

                  when "01110000" =>    -- 'p' (path)
                    substate_r <= add_tg_to_path1;
                    print_message_r <= 1;
                    
                  when others     =>
                    command_failed_r <= '1';
                end case;

              when runtime1 =>
                run_time_r(31 downto 28) <= read_data_r_hex2bin;
                substate_r <= runtime2;
              when runtime2 =>
                run_time_r(27 downto 24) <= read_data_r_hex2bin;
                substate_r <= runtime3;
              when runtime3 =>
                run_time_r(23 downto 20) <= read_data_r_hex2bin;
                substate_r <= runtime4;
              when runtime4 =>
                run_time_r(19 downto 16) <= read_data_r_hex2bin;
                substate_r <= runtime5;
              when runtime5 =>
                run_time_r(15 downto 12) <= read_data_r_hex2bin;
                substate_r <= runtime6;
              when runtime6 =>
                run_time_r(11 downto 8) <= read_data_r_hex2bin;
                substate_r <= runtime7;
              when runtime7 =>
                run_time_r(7 downto 4) <= read_data_r_hex2bin;
                substate_r <= runtime8;
              when runtime8 =>
                run_time_r(3 downto 0) <= read_data_r_hex2bin;
                substate_r <= idle;
                state_r <= prepare_to_start;
                
              when addip1 =>
                tg_addr_r(7 downto 4) <= read_data_r_hex2bin;
                substate_r            <= addip2;

              when addip2 =>
                tg_addr_r(3 downto 0) <= read_data_r_hex2bin;
                substate_r            <= addmode1;
                print_message_r       <= 2;

              when addmode1 =>

                -- CHECK IF THIS CONFIG IS FOR MYSELF
                if tg_addr_r = std_logic_vector(to_unsigned(master_addr_c, 8)) then
                  own_conf_or_own_rep_r <= '1';
                else
                  own_conf_or_own_rep_r <= '0';
                end if;

                addmode_r(1) <= read_data_r_hex2bin(0);
                substate_r   <= addmode2;

              when addmode2 =>
                addmode_r(0)      <= read_data_r_hex2bin(0);
                substate_r        <= addmode2;
                if addmode_r(1) = '0' and read_data_r_hex2bin(0) = '0' then
                  -- Mode is '00': a time-triggered event
                  print_message_r <= 5;
                  substate_r      <= addtime1;
                elsif read_data_r_hex2bin(0) = '0' then
                  -- Mode is '10': datatag-triggered.
                  substate_r      <= addtag;
                  print_message_r <= 4;
                else
                  -- Mode is '11' or '01', anyway, first we must take the
                  -- address.
                  substate_r      <= addaddr1;
                  print_message_r <= 3;
                end if;

              when addaddr1 =>
                add_addr_r(7 downto 4) <= read_data_r_hex2bin;
                substate_r             <= addaddr2;

              when addaddr2 =>
                add_addr_r(3 downto 0) <= read_data_r_hex2bin;
                -- Let's see if we need to take datatag too.
                if addmode_r(1) = '1' then
                  substate_r           <= addtag;
                  print_message_r      <= 4;
                else
                  substate_r           <= addtime1;
                  print_message_r      <= 5;
                end if;

              when addtag =>
                add_typetag_r   <= read_data_r_hex2bin;
                -- also triggers need to get the time field in order to get
                -- idle cycles right
                substate_r      <= addtime1;
                print_message_r <= 5;

              when addtime1 =>
                add_time_r(15 downto 12) <= read_data_r_hex2bin;
                substate_r               <= addtime2;

              when addtime2 =>
                add_time_r(11 downto 8) <= read_data_r_hex2bin;
                substate_r              <= addtime3;

              when addtime3 =>
                add_time_r(7 downto 4) <= read_data_r_hex2bin;
                substate_r             <= addtime4;

              when addtime4 =>
                add_time_r(3 downto 0) <= read_data_r_hex2bin;
  
                substate_r <= addonetime;
                if addmode_r = "00" then
                  -- Event. Ask if one time only.
                  print_message_r        <= 6;
                else
                  -- Trigger. Ask if reply to sender.
                  print_message_r        <= 16;
                end if;
                  -- OBS! The next state is same, only the question differs.

              when addonetime =>
                add_onetime_r   <= read_data_r_hex2bin(0);
                if addmode_r /= "00" and read_data_r_hex2bin(0) = '1' then
                  -- This is a TRIGGER and user answerred REPLY TO SENDER, so
                  -- we don't want to know destination or if it's random.
                  substate_r <= addsendtag;
                  print_message_r <= 8;
                else
                  substate_r <= addranddest;
                  print_message_r <= 14;
                end if;

              when addranddest =>
                add_randdest_r <= read_data_r_hex2bin(0);
                if read_data_r_hex2bin(0) = '0' and path_conf_r = '0' then
                  -- Address not randomized: ask address 
                  substate_r <= addsendaddr1;
                  print_message_r <= 7;
                else
                  -- Address randomized or configuring path: skip asking address and
                  -- go directly to data tag.
                  substate_r <= addsendtag;
                  print_message_r <= 8;
                end if;



              when addsendaddr1 =>
                add_sendaddr_r(7 downto 4) <= read_data_r_hex2bin;
                substate_r                 <= addsendaddr2;

              when addsendaddr2 =>
                add_sendaddr_r(3 downto 0) <= read_data_r_hex2bin;
                substate_r                 <= addsendtag;
                print_message_r            <= 8;

              when addsendtag =>
                add_sendtag_r   <= read_data_r_hex2bin;
                substate_r      <= addrandsize;
                print_message_r <= 15;

              when addrandsize =>
                add_randsize_r <= read_data_r_hex2bin(0);
                substate_r <= addsendamount1;
                print_message_r <= 9;

              when addsendamount1 =>
                add_sendamount_r(15 downto 12) <= read_data_r_hex2bin;
                substate_r                     <= addsendamount2;

              when addsendamount2 =>
                add_sendamount_r(11 downto 8) <= read_data_r_hex2bin;
                substate_r                    <= addsendamount3;

              when addsendamount3 =>
                add_sendamount_r(7 downto 4) <= read_data_r_hex2bin;
                substate_r                   <= addsendamount4;

              when addsendamount4 =>
                add_sendamount_r(3 downto 0) <= read_data_r_hex2bin;
                substate_r                   <= add_depen;
                print_message_r              <= 19;

              when addproctime1 =>
                add_proctime_r(15 downto 12) <= read_data_r_hex2bin;
                substate_r                  <= addproctime2;

              when addproctime2 =>
                add_proctime_r(11 downto 8) <= read_data_r_hex2bin;
                substate_r                 <= addproctime3;

              when addproctime3 =>
                add_proctime_r(7 downto 4) <= read_data_r_hex2bin;
                substate_r                 <= addproctime4;

              when addproctime4 =>
                add_proctime_r(3 downto 0) <= read_data_r_hex2bin;
                state_r                    <= send1;  -- Note: state, not substate.
                substate_r                 <= idle;
                print_message_r            <= 0;

              when add_depen =>
                add_dep_en_r <= read_data_r_hex2bin(0);
                
                if read_data_r_hex2bin(0) = '1' then
                  print_message_r <= 20;
                  substate_r      <= add_depflag;
                else
                  print_message_r <= 22;
                  substate_r      <= addsetdep;
                end if;

              when add_depflag =>
                add_dep_flag_r  <= read_data_r_hex2bin;
                substate_r      <= add_dontwaitdep;
                print_message_r <= 21; 

              when add_dontwaitdep =>
                add_dontwaitdep_r <= read_data_r_hex2bin(0);
                substate_r        <= addsetdep;
                print_message_r   <= 22;

              when addsetdep =>
                add_set_dep_r <= read_data_r_hex2bin(0);
                
                if read_data_r_hex2bin(0) = '1' then
                  substate_r      <= addflagtoset;
                  print_message_r <= 20;
                else
                  substate_r      <= addblockothers;
                  print_message_r <= 23;
                end if;

              when addflagtoset =>
                add_flag_to_set_r <= read_data_r_hex2bin;
                substate_r        <= addblockothers;
                print_message_r   <= 23;

              when addblockothers =>
                add_blockothers_r <= read_data_r_hex2bin(0);
                substate_r        <= addproctime1;
                print_message_r   <= 10;


              when add_tg_to_path1 =>

                -- if new 'p'
                if read_data_r = "01110000" then
                  -- now all tgs in the path have been inserted, and it's time
                  -- to add the event/trigger that launches path measurements
                  tg_addr_r <= "0" & path_tgs_r(0);
                  add_sendaddr_r <= "0" & path_tgs_r(1);
                  add_randdest_r <= '0';
                  add_onetime_r <= '0';
                  print_message_r <= 2;
                  substate_r <= addmode1;
                  path_conf_r <= '1';

                  assert path_tg_ptr_r > 1 report "There is no path with only one TG" severity failure;
                  
                  -- compensate the increase in path_tg_ptr_r
                  path_tg_ptr_r <= path_tg_ptr_r-1;

                  -- mark up the last one (to be used in printing)
                  last_path_tg_r <= path_tg_ptr_r-1;

                else

                  path_tgs_r(path_tg_ptr_r)(6 downto 4) <= read_data_r_hex2bin(2 downto 0);
                  substate_r <= add_tg_to_path2;

                end if;

              when add_tg_to_path2 =>

                path_tgs_r(path_tg_ptr_r)(3 downto 0) <= read_data_r_hex2bin;

                -- if path full
                if path_tg_ptr_r = num_of_tgs_c-1 then
                  tg_addr_r <= "0" & path_tgs_r(0);
                  add_sendaddr_r <= "0" & path_tgs_r(1);
                  print_message_r <= 2;
                  substate_r <= addmode1;
                  path_conf_r <= '1';
                  last_path_tg_r <= path_tg_ptr_r;
                else
                  print_message_r <= 1;
                  reprint_msg_r <= '1';
                  path_tg_ptr_r <= path_tg_ptr_r + 1;
                  substate_r <= add_tg_to_path1;
                end if;


              when others => null;
            end case;  -- substate_r



          end if;  -- ignoring

        when send1 =>
          conf_pkt_len_out  <= "0000000000000101";  -- conf command length 5
          if config_data_full = '0' then
            config_data_we_r <= '1';
            config_data_out    <=
              tg_addr_r (6 downto 0) &
              "000000000" &
              "00000000" &
              "00000000";

            -- if confing our own reader:
            -- we don't have the read enable signal from reader, so we'll just
            -- wait for a cycle so that reader gets also the first data
            if config_data_we_r = '1' or own_conf_or_own_rep_r = '0' then
              state_r <= send2;
            end if;
          end if;

        when send2 =>
          if config_data_full = '0' then

            config_data_we_r <= '1';
            config_data_out    <=
              tg_addr_r (6 downto 0) &
              addmode_r (1 downto 0) &
              add_addr_r (6 downto 0) &
              add_typetag_r(3 downto 0) &
              add_time_r (15 downto 4);

            state_r <= send3;
          end if;

        when send3 =>
          if config_data_full = '0' then

            config_data_we_r <= '1';
            config_data_out    <=
              tg_addr_r (6 downto 0) &
              add_time_r (3 downto 0) &
              add_onetime_r &
              add_sendaddr_r (6 downto 0) &
              add_sendtag_r (3 downto 0) &
              path_conf_r &
              add_proctime_r(15 downto 8);

            state_r <= send4;
          end if;

        when send4 =>
          if config_data_full = '0' then

            config_data_we_r <= '1';
            config_data_out    <=
              tg_addr_r (6 downto 0) &
              add_proctime_r (7 downto 0) &
              add_randsize_r &
              add_randdest_r &
              add_dep_en_r &
              add_dep_flag_r &
              add_dontwaitdep_r &
              add_set_dep_r &
              add_flag_to_set_r &
              "0000";

            state_r <= send5;
          end if;

        when send5 =>
          if config_data_full = '0' then

            config_data_we_r <= '1';
            config_data_out  <=
              tg_addr_r( 6 downto 0 ) &
              add_sendamount_r &
              add_blockothers_r &
              "00000000";
            
            if path_conf_r = '1' then
              state_r <= send_path_pkts;
              -- the last one gets configured first, so this can be set here
              last_in_path_r <= '1';
            else
              state_r <= wait_for_input;
            end if;

          end if;

        when wait_rep =>
            -- now we just hang around for a while to make sure that the
            -- noc gets empty before sending any new report commands

            -- While waiting, print the report header.

            if rep_idle_counter_r = report_idle_time_c then

              -- Next we start reporting and the first reporter is the master itself.
              own_conf_or_own_rep_r <= '1';

              -- Don't reset rep_idle_counter_r, stay at this state until
              -- message printing is ready.
              if printing_r = '0' then
                -- Print the second row.
                print_message_r <= 13; 
                state_r <= print_rep_header2;
              end if;

            else
              rep_idle_counter_r <= rep_idle_counter_r + 1;
            end if;

        when print_rep_header2 =>
          state_r <= print_rep_header2b;

        when print_rep_header2b =>
          if printing_r = '0' then
            -- Header printing done, next send the first report request.
            state_r <= send_rep_cmd;
          end if;

        when send_rep_cmd =>
          if config_data_full = '0' then
            config_data_we_r <= '1';
            config_data_out    <=
              std_logic_vector(to_unsigned(cur_reporter_r,7)) &
              "000000000" &
              "00000000" &
              "00000001";

            -- if commanding our own reader:
            -- we don't have the read enable signal from reader, so we'll just
            -- wait for a cycle so that reader gets the data
            if config_data_we_r = '1' or own_conf_or_own_rep_r = '0' then
              state_r <= rep_cmd_sent;
            end if;
          end if;

        when rep_cmd_sent =>
          config_data_we_r <= '0';
          own_conf_or_own_rep_r <= '0';          
          if printing_report_r = '0' and report_printed_r = '1' then
            report_printed_r <= '0';
            if cur_reporter_r /= num_of_tgs_c-1 then
              cur_reporter_r <= cur_reporter_r + 1;
              state_r <= send_rep_cmd;
            else
              state_r <= print_path_rep;
            end if;

          elsif printing_report_r = '1' then
            report_printed_r <= '1';
            
          end if;

        when prepare_to_start =>
          -- Give monitor start command now and start waiting to get it
          -- through the synchronizer.
          monitor_command_out <= "00";
          if monitor_command_out_wait_count_r = mon_cmd_synch_time_c-1 then
            assert false report "NOTE: Starting measurements." severity note;
            state_r <= start;
          else
            monitor_command_out_wait_count_r <= monitor_command_out_wait_count_r + 1;
          end if;

        when print_path_rep =>
          print_message_r <= 18;

          if path_report_printed_r = '1' then
            -- All reportings done! Back to the start - or monitor.
            print_path_report_r <= '0';
            
            if use_monitor_c = 1 then
              state_r <= ask_monitor;
              print_message_r <= 17;
            else
              state_r <= wait_for_input;                
            end if;
          else
            print_path_report_r <= '1';
          end if;
          
        when start =>
          config_mode_en_out_r <= '0';
          own_conf_or_own_rep_r <= '0';
          
          if run_counter_r = to_integer(unsigned(run_time_r))-mon_cmd_synch_time_c then
            -- It's time to give the monitor STALL command.
            monitor_command_out <= "01";
            -- Running still continues.
          end if;

          if std_logic_vector(to_unsigned(run_counter_r,32)) = run_time_r then
            -- Run executed. Now stopping:
            config_mode_en_out_r <= '1';
            print_message_r <= 11;
            state_r <= wait_rep;
            conf_pkt_len_out <= "0000000000000001";  -- "start rep" pkt len = 1.
            assert false report "NOTE: Measurements finished. Starting reporting." severity note;
          else
            run_counter_r <= run_counter_r + 1;
          end if;

        when ask_monitor =>
          state_r <= ask_monitor2;

        when ask_monitor2 =>
          if printing_r = '0' then
            -- message printing done, give UART to monitor
            -- and ask for report.
            assert false report "NOTE: Reporting finished, giving UART to monitor." severity note;
            monitor_UART_sel_out <= '1';
            monitor_command_out <= "11";  -- REPORT command.
            state_r <= finished;
            
          end if;

        when finished =>
          null;

          -- Leave UART for monitor, so it can print all it want.

          
        when send_path_pkts =>

          conf_pkt_len_out  <= "0000000000000010";  -- path conf tx len = 2

            -- path_tg_ptr_r is pointing at the last tg in path. We can nicely configure
            -- them from last to first.
          if config_data_full = '0' or own_conf_or_own_rep_r = '1' then

            -- giving master reader 1 cycle xtra to read the first data (we don't
            -- have read enable from it)
            if wait_own_reader_r = '1' then
              wait_own_reader_r <= '0';
            end if;
            
            
            if path_tg_ptr_r = 0 then
              -- the first tg in path doesn't need path configuration pkt
              state_r <= wait_for_input;
              path_conf_r <= '0';
              config_data_we_r <= '0';
              own_conf_or_own_rep_r <= '0';
            else

              if path_tgs_r(path_tg_ptr_r) = std_logic_vector( to_unsigned( master_addr_c, address_w_c )) then
                own_conf_or_own_rep_r <= '1';
              else
                own_conf_or_own_rep_r <= '0';
              end if;
              
              config_data_we_r <= '1';

              -- if confing master's reader, we have to wait for an extra clk cycle
              -- with write enable up and data on the bus
              if path_tgs_r(path_tg_ptr_r) /= std_logic_vector( to_unsigned( master_addr_c, address_w_c ))
                or wait_own_reader_r = '0'
              then

                if path_conf_word_r = 0 then
                  -- do nothing, just wait. This is done so that sender has
                  -- some time to separate different transfers
                  path_conf_word_r <= 1;
                  config_data_we_r <= '0';
                
                -- using path_conf_word_r also to determine which word to send
                elsif path_conf_word_r = 1 then

                  -- the first word with path command (last 3 bits "011")
                  config_data_out <= path_tgs_r(path_tg_ptr_r)
                                     & "000000000"
                                     & "00000000"
                                     & "00000011";
                  path_conf_word_r <= 2;

                  -- this means nothing unless we are configuring master reader
                  wait_own_reader_r <= '1';

                else
                  -- target tg, its position on path and prev tg that is sending to
                  -- it.
                  config_data_out <= path_tgs_r(path_tg_ptr_r)
                                     & std_logic_vector(to_unsigned(path_tg_ptr_r, address_w_c))
                                     & path_tgs_r(path_tg_ptr_r-1)
                                     & last_in_path_r
                                     & "0000000000";
                  path_conf_word_r <= 0;
                  
                  -- last one is configured first, so now we can clear this
                  last_in_path_r <= '0';
                  path_tg_ptr_r <= path_tg_ptr_r-1;
                end if;
              end if;
            end if;  -- path_tg_ptr_r = 0
          end if;  -- config_data_full = '0'
          
        when others => null;
      end case;  -- state_r


    end if;
  end process input_reacting;

end rtl;
