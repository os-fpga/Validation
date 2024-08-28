-------------------------------------------------------------------------------
-- Title      : Uart controller
-- Project    : 
-------------------------------------------------------------------------------
-- File       : uart_ctrl.vhd
-- Author     : Jussi Nieminen  <niemin95@galapagosinkeiju.cs.tut.fi>
-- Company    : 
-- Last update: 2009/09/30
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: Offers uart interface
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2009/07/14  1.0      niemin95	Created
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


entity uart_ctrl is
  
  generic (
    freq_g : integer := 50000000;
    baud_rate_g : integer := 19200;
    data_bits_g : integer := 8;
    stop_bits_g : integer := 1
    );

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
    failure_out       : out std_logic
    );

end uart_ctrl;


architecture rtl of uart_ctrl is

  signal rx_data_cnt_r : integer range 0 to data_bits_g-1;
  signal tx_data_cnt_r : integer range 0 to data_bits_g-1;

  constant cycle_c : integer := freq_g / baud_rate_g;
  constant half_cycle_c : integer := cycle_c / 2;
  signal tx_cnt_r : integer range 0 to cycle_c-1;
  signal rx_cnt_r : integer range 0 to cycle_c-1;

  type tx_state_type is (tx_idle, tx_start, tx_send, tx_stop);
  signal tx_state_r : tx_state_type;

  type rx_state_type is (rx_idle, rx_start, rx_receive, rx_stop);
  signal rx_state_r : rx_state_type;

  signal tx_data_r : std_logic_vector( data_bits_g-1 downto 0 );
  signal rx_data_r : std_logic_vector( data_bits_g-1 downto 0 );

  signal tx_stop_cnt_r : integer range 0 to stop_bits_g-1;
  signal rx_stop_cnt_r : integer range 0 to stop_bits_g-1;

  signal rx_data_valid_r : std_logic;

  signal rx_synch1_r : std_logic;
  signal rx_synch2_r : std_logic;

  -- failure signals
  signal failed_stop_bit_r : std_logic;
  signal failed_read_r : std_logic;
  signal overrun_data_r : std_logic;
  
begin  -- rtl

  rx_data_out <= rx_data_r;
  rx_data_valid_out <= rx_data_valid_r;

  tx_ctrl: process (clk, rst_n)
    variable tx_cycle_v : std_logic;
  begin  -- process tx_ctrl
    if rst_n = '0' then                 -- asynchronous reset (active low)

      tx_data_cnt_r <= 0;
      tx_cnt_r      <= 0;
      tx_out        <= '1';
      tx_ready_out  <= '1';
      tx_stop_cnt_r <= 0;
      tx_data_r     <= (others => '0');
      tx_state_r    <= tx_idle;
      
    elsif clk'event and clk = '1' then  -- rising clock edge

      -- defaults
      tx_cycle_v := '0';
      
      -- timing
      if tx_state_r /= tx_idle then
        if tx_cnt_r = cycle_c-1 then
          tx_cnt_r <= 0;
          tx_cycle_v := '1';
        else
          tx_cnt_r <= tx_cnt_r + 1;
        end if;
      end if;


      -- state machine
      case tx_state_r is
        
        when tx_idle =>

          tx_out <= '1';
          tx_ready_out <= '1';
          tx_cnt_r <= 0;
          tx_data_cnt_r <= 0;
          
          if we_in = '1' then
            tx_data_r <= tx_data_in;
            tx_state_r <= tx_start;
            tx_ready_out <= '0';
          end if;


        when tx_start =>

          -- start bit, '0'
          tx_out <= '0';
          if tx_cycle_v = '1' then
            -- it has been a cycle
            tx_state_r <= tx_send;
          end if;


        when tx_send =>

          -- data bit
          tx_out <= tx_data_r( tx_data_cnt_r );

          if tx_cycle_v = '1' then
            if tx_data_cnt_r = data_bits_g-1 then
              tx_state_r <= tx_stop;
              tx_data_cnt_r <= 0;
            else
              tx_data_cnt_r <= tx_data_cnt_r + 1;
            end if;
          end if;


        when tx_stop =>

          -- stop bit, '1'
          tx_out <= '1';
          if tx_cycle_v = '1' then

            -- if stop bits transfered
            if tx_stop_cnt_r = stop_bits_g-1 then
              tx_state_r <= tx_idle;
              tx_stop_cnt_r <= 0;
            else
              tx_stop_cnt_r <= tx_stop_cnt_r + 1;
            end if;
          end if;

          
        when others => tx_state_r <= tx_idle;
      end case;
      
      
    end if;
  end process tx_ctrl;



  rx_ctrl: process (clk, rst_n)
    variable rx_cycle_v : std_logic;
    variable rx_half_cycle_v : std_logic;
  begin  -- process rx_ctrl
    if rst_n = '0' then                 -- asynchronous reset (active low)

      rx_data_r         <= (others => '0');
      rx_data_cnt_r     <= 0;
      rx_cnt_r          <= 0;
      rx_state_r        <= rx_idle;
      rx_data_valid_r   <= '0';
      rx_stop_cnt_r     <= 0;
      failed_stop_bit_r <= '0';
      failed_read_r     <= '0';
      overrun_data_r    <= '0';
      rx_synch1_r       <= '1';
      rx_synch2_r       <= '1';
      
    elsif clk'event and clk = '1' then  -- rising clock edge

      -- defaults
      rx_cycle_v := '0';
      rx_half_cycle_v := '0';

      -- metastability prevention
      rx_synch1_r <= rx_in;
      rx_synch2_r <= rx_synch1_r;
      
      -- timing
      if rx_state_r /= rx_idle then
        
        if rx_cnt_r = cycle_c-1 then
          rx_cnt_r <= 0;
          rx_cycle_v := '1';
        else
          rx_cnt_r <= rx_cnt_r + 1;
        end if;

        -- half cycle detection, + 1 because of rx registers
        if rx_cnt_r = half_cycle_c + 1 then
          rx_half_cycle_v := '1';
        end if;
        
      end if;


      -- state machine
      case rx_state_r is
        
        when rx_idle =>

          rx_cnt_r <= 0;
          rx_data_cnt_r <= 0;
          
          if rx_synch2_r = '0' then
            -- start bit

            -- overrun detection
            overrun_data_r <= rx_data_valid_r;
            
            rx_state_r <= rx_start;
          end if;


        when rx_start =>

          if rx_cycle_v = '1' then
            -- start bit received
            rx_state_r <= rx_receive;
          end if;


        when rx_receive =>

          if rx_half_cycle_v = '1' then
            rx_data_r( rx_data_cnt_r ) <= rx_synch2_r;
          end if;

          if rx_cycle_v = '1' then
            if rx_data_cnt_r = data_bits_g-1 then
              rx_data_cnt_r <= 0;
              rx_state_r    <= rx_stop;
            else
              rx_data_cnt_r <= rx_data_cnt_r + 1;
            end if;
          end if;


        when rx_stop =>

          if rx_half_cycle_v = '1' then
            -- check that it really is a stop bit
            failed_stop_bit_r <= not rx_synch2_r;
          end if;
          
          if rx_cycle_v = '1' then
            if rx_stop_cnt_r = stop_bits_g-1 then
              rx_state_r <= rx_idle;
              rx_data_valid_r <= '1';
              rx_stop_cnt_r <= 0;
            else
              rx_stop_cnt_r <= rx_stop_cnt_r + 1;
            end if;
          end if;

          
        when others => null;
      end case;

      
      if re_in = '1' then
        failed_read_r <= not rx_data_valid_r;
        rx_data_valid_r <= '0';
      end if;
      
      
    end if;
  end process rx_ctrl;


  -- failure detection
  failures: process (clk, rst_n)
  begin  -- process failures
    if rst_n = '0' then                 -- asynchronous reset (active low)
      failure_out <= '0';
    elsif clk'event and clk = '1' then  -- rising clock edge

      if failed_stop_bit_r = '1' or
        failed_read_r = '1' or
        overrun_data_r = '1'
      then
        failure_out <= '1';
        report "UART error" severity failure;
      end if;
      
    end if;
  end process failures;

end rtl;
