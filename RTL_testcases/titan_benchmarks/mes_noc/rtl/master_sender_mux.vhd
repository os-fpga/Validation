-------------------------------------------------------------------------------
-- Title      : Mux for selecting between master, sender and reader blocks.
-- Project    : 
-------------------------------------------------------------------------------
-- File       : master_sender_mux.vhd
-- Author     :   <alhonena@BUMMALO>
-- Company    : 
-- Last update: 2009/09/30
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: This mux is instantiated both for slaves and master. When used
--              with master, it selects between sender and master blocks. When
--              used with slave, it selects between sender and reader blocks.
--              Normally, sender sends. When conf_mode_en_in is active, master
--              or reader sends. This block remains always the same; change
--              the instantiation (signal connections) depending on master/slave
--              status.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2009/05/28  1.0      alhonena	Created
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

entity master_sender_mux is
  
  generic (
    data_width_g : integer := 32);

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
    pkt_len_from_master_or_reader_in : in std_logic_vector(tx_length_w_c-1 downto 0)
    );

end master_sender_mux;

architecture combinational of master_sender_mux is

begin  -- gate

  comb: process (sel_in, full_in, data_from_sender_in,
                 data_from_master_or_reader_in, we_from_master_or_reader_in,
                 we_from_sender_in, pkt_len_from_master_or_reader_in,
                 pkt_len_from_sender_in)
  begin  -- process comb
    if sel_in = '0' then
      -- SENDER SELECTED
      -- Prevent the non-selected block from writing by asserting the full signal.
      full_to_master_or_reader_out <= '1';
      full_to_sender_out <= full_in;
      we_out <= we_from_sender_in;
      data_out <= data_from_sender_in;
      pkt_len_out <= pkt_len_from_sender_in;

    else
      -- MASTER OR READER SELECTED
      -- Prevent the non-selected block from writing by asserting the full signal.
      full_to_sender_out <= '1';
      full_to_master_or_reader_out <= full_in;
      we_out <= we_from_master_or_reader_in;
      data_out <= data_from_master_or_reader_in;
      pkt_len_out <= pkt_len_from_master_or_reader_in;
      
    end if;
  end process comb;

end combinational;
