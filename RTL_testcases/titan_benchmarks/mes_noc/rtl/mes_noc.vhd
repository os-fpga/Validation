-------------------------------------------------------------------------------
-- Title      : TG:s with network
-- Project    : 
-------------------------------------------------------------------------------
-- File       : tgs_with_mesh_syn_toplevel.vhd
-- Author     : Jussi Nieminen  <niemin95@galapagosinkeiju.cs.tut.fi>
-- Company    : 
-- Last update: 2009/12/01
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: Testing TG:s with a real network. This is a ready-to-synthesize
-- with the other files supplied.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2009/06/04  1.0      niemin95        Created
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
use work.mon_pkg.all;
use work.mes_noc_pkg.all;

entity mes_noc is
  port (
    clk         : in  std_logic;
    rst_n       : in  std_logic;
    uart_rx_in  : in  std_logic;
    uart_tx_out : out std_logic;
    failure_out : out std_logic
    );
end mes_noc;



architecture structural of mes_noc is

  -- Use pll to create clocks, or derive both clocks from clk
  constant use_pll_c : integer := 1;
  constant use_node_pll : integer := 0;
  constant common_ip_noc_clk_c : integer := 0;
  
  constant ip_freq_c  : integer := clk_rate_c;
  -- 1 NOC clock
  constant noc_freq_c : freq_array := (others => 100000000);
  -- 2 NOC clocks
--  constant noc_freq_c : freq_array := (100000000,
--													100000000);
	-- 4 NOC clocks
--  constant noc_freq_c : freq_array := (100000000,
--													110000000,
--													120000000,
--													130000000);
  
  -- for hibi only:
  constant rel_ip_freq_c : integer := 1;
  constant rel_noc_freq_c : integer := 1;

  signal clk_noc     	: std_logic_vector( num_noc_clk_domains_c-1 downto 0 );
  signal clk_ip    		: std_logic;
  signal locked_pll 		: std_logic;
  signal locked_noc_pll	: std_logic_vector( num_noc_clk_domains_c-1 downto 0);
  signal rst_n_noc 		: std_logic;

  -- select the net type:
  --    0: mesh
  --    1: ring
  --    2: hibi
  --    3: xbar
  constant net_type_c : integer := 0;

  constant stfwd_en_c      : integer := 0;  -- at least 0 works
  constant fill_packet_c   : integer := 0;  -- 1 for pkt switched xbar
--  constant fifo_depth_c    : integer := 6;  -- should be packet_length_c for ring
--  constant packet_length_c : integer := 6;
  -- Temporarily setting these to 8 due to fifo limitations
  constant fifo_depth_c    : integer := 4;  -- should be packet_length_c for ring
  constant packet_length_c : integer := 4;
  constant len_flit_en_c   : integer := 1;
  constant oaddr_flit_en_c : integer := 0;


  constant dbg_en_c    : integer := 0;

  -- ring constants
  -- without diagonal links ring gets jammed very easily, but it's size is much
  -- smaller
  constant ring_diag_en_c : integer := 0;

  -- hibi constants
  constant n_hibi_segments_c : integer := 1;

  -- xbar constants
  constant xbar_pkt_switched_c : integer := 0;  -- 1 for pkt, 0 for circuit switched
  
  
  -- store the number of triggers and events in a constant table to ease the instantiation
  -- currently there must be at least one of each in every tg!
  type trigger_table_type is array (0 to num_of_tgs_c-1) of integer;

  --4 tgs
--  constant trigger_table_c : trigger_table_type := (5, 5, 5, 5);
--  constant event_table_c   : trigger_table_type := (5, 5, 5, 5);
  --16 tgs
--  constant trigger_table_c : trigger_table_type := (5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5);
--  constant event_table_c   : trigger_table_type := (5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5);
  -- 36 tgs
--  constant trigger_table_c : trigger_table_type := (5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5);
--  constant event_table_c   : trigger_table_type := (5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5);
  -- 49 tgs
  --constant trigger_table_c : trigger_table_type := (1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
  --constant event_table_c   : trigger_table_type := (1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
  -- 64 tgs
  constant trigger_table_c : trigger_table_type := (1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
  constant event_table_c   : trigger_table_type := (1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
  -- 81 tgs
--  constant trigger_table_c : trigger_table_type := (1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
--  constant event_table_c   : trigger_table_type := (1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

  -- how many debendency flags do we need?
  -- at least at the moment dep flags should consume very little resources, so
  -- no need to do as above with triggers and events
  constant dep_flag_w_c : integer := 16;
  
  -- data is easier to follow, when using arrays
  type data_array is array (0 to num_of_tgs_c-1) of std_logic_vector( bus_w_c-1 downto 0 );
  type tx_len_array is array (0 to num_of_tgs_c-1) of std_logic_vector( tx_length_w_c-1 downto 0 );

  -- THESE ARE ALTERA'S PLL BLOCKS
  -- This is used if use_pll_c = 1.
  -- Feel free to replace with the PLL block of the technology you use.
  -- You need to generate a new block every time you want to change the noc frequency
  
  -- Used by the nodes
  component pll
    port (
      areset : IN  STD_LOGIC := '0';
      inclk0 : IN  STD_LOGIC := '0';
      c0     : OUT STD_LOGIC;
      locked : OUT STD_LOGIC);
  end component;
  
  -- Various PLLs to be used by the network
  -- A different PLL instantiation is required for each desired frequency
  component pll_noc_type0
		port (
      areset : IN  STD_LOGIC := '0';
      inclk0 : IN  STD_LOGIC := '0';
      c0     : OUT STD_LOGIC;
      locked : OUT STD_LOGIC);
  end component;

  component pll_noc_type1
		port (
      areset : IN  STD_LOGIC := '0';
      inclk0 : IN  STD_LOGIC := '0';
      c0     : OUT STD_LOGIC;
      locked : OUT STD_LOGIC);
  end component;
  
  component pll_noc_type2
		port (
      areset : IN  STD_LOGIC := '0';
      inclk0 : IN  STD_LOGIC := '0';
      c0     : OUT STD_LOGIC;
      locked : OUT STD_LOGIC);
  end component;
  
  component pll_noc_type3
		port (
      areset : IN  STD_LOGIC := '0';
      inclk0 : IN  STD_LOGIC := '0';
      c0     : OUT STD_LOGIC;
      locked : OUT STD_LOGIC);
  end component;
  
  component pll_noc_type4
		port (
      areset : IN  STD_LOGIC := '0';
      inclk0 : IN  STD_LOGIC := '0';
      c0     : OUT STD_LOGIC;
      locked : OUT STD_LOGIC);
  end component;
  
  component pll_noc_type5
		port (
      areset : IN  STD_LOGIC := '0';
      inclk0 : IN  STD_LOGIC := '0';
      c0     : OUT STD_LOGIC;
      locked : OUT STD_LOGIC);
  end component;
  
  component pll_noc_type6
		port (
      areset : IN  STD_LOGIC := '0';
      inclk0 : IN  STD_LOGIC := '0';
      c0     : OUT STD_LOGIC;
      locked : OUT STD_LOGIC);
  end component;
  
  component pll_noc_type7
		port (
      areset : IN  STD_LOGIC := '0';
      inclk0 : IN  STD_LOGIC := '0';
      c0     : OUT STD_LOGIC;
      locked : OUT STD_LOGIC);
  end component;
  
  component tg_top
    generic (
      own_addr_g              :     integer;
      is_master_g             :     integer;
      n_triggers_g            :     integer;
      n_events_g              :     integer;
      dep_flag_w_g            :     integer
      );
    port (
      r_empty_in              : in  std_logic;
      r_data_in               : in  std_logic_vector(bus_w_c-1 downto 0);
      r_re_out                : out std_logic;
      w_full_in               : in  std_logic;
      w_we_out                : out std_logic;
      w_data_out              : out std_logic_vector(bus_w_c-1 downto 0);
      w_tx_len_out            : out std_logic_vector(tx_length_w_c-1 downto 0);
      UART_rx_in              : in  std_logic;
      UART_tx_out             : out std_logic;
      config_mode_en_out      : out std_logic;
      config_mode_en_in       : in  std_logic;
      clk                     : in  std_logic;
      rst_n                   : in  std_logic;
      monitor_command_out     : out std_logic_vector(1 downto 0);
      select_monitor_UART_out : out std_logic;
      failure_out             : out std_logic
      );
  end component;

  signal empty_wra_tg       : std_logic_vector( num_of_tgs_c-1 downto 0 );
  signal data_wra_tg        : data_array;
  signal re_tg_wra          : std_logic_vector( num_of_tgs_c-1 downto 0 );
  signal full_wra_tg        : std_logic_vector( num_of_tgs_c-1 downto 0 );
  signal we_tg_wra          : std_logic_vector( num_of_tgs_c-1 downto 0 );
  signal data_tg_wra        : data_array;
  signal tx_len_tg_wra      : tx_len_array;
  signal config_mode_master : std_logic;
  signal tmp_conf_master    : std_logic;
  signal tmp_slave_uart_rx  : std_logic;

  component wrapper
    generic (
      net_type_g             :     integer;
      addr_width_g           :     integer;
      mesh_columns_g         :     integer;
      mesh_rows_g            :     integer;
      hibi_segments_g        :     integer;
      wrappers_per_segment_g :     integer
      );
    port (
      clk                    : in  std_logic;
      rst_n                  : in  std_logic;
      config_mode_in         : in  std_logic;
      net_sndr_full_in       : in  std_logic;
      net_av_out             : out std_logic;
      net_we_out             : out std_logic;
      net_data_out           : out std_logic_vector( bus_w_c-1 downto 0 );
      tx_len_out             : out std_logic_vector( tx_length_w_c-1 downto 0 );
      sndr_net_we_in         : in  std_logic;
      sndr_net_data_in       : in  std_logic_vector( bus_w_c-1 downto 0 );
      sndr_net_tx_len_in     : in  std_logic_vector( tx_length_w_c-1 downto 0 );
      sndr_full_out          : out std_logic;
      net_rdr_av_in          : in  std_logic;
      net_rdr_empty_in       : in  std_logic;
      net_rdr_data_in        : in  std_logic_vector( bus_w_c-1 downto 0 );
      net_re_out             : out std_logic;
      rdr_net_re_in          : in  std_logic;
      rdr_empty_out          : out std_logic;
      rdr_data_out           : out std_logic_vector( bus_w_c-1 downto 0 ));
  end component;

  signal full_enc_wra   : std_logic_vector( num_of_tgs_c-1 downto 0 );
  signal empty_enc_wra  : std_logic_vector( num_of_tgs_c-1 downto 0 );
  signal av_wra_enc     : std_logic_vector( num_of_tgs_c-1 downto 0 );
  signal we_wra_enc     : std_logic_vector( num_of_tgs_c-1 downto 0 );
  signal data_wra_enc   : std_logic_vector( num_of_tgs_c*bus_w_c-1 downto 0 );
  signal tx_len_wra_enc : std_logic_vector( num_of_tgs_c*tx_length_w_c-1 downto 0 );
  signal av_dec_wra     : std_logic_vector( num_of_tgs_c-1 downto 0 );
  signal empty_dec_wra  : std_logic_vector( num_of_tgs_c-1 downto 0 );
  signal data_dec_wra   : std_logic_vector( num_of_tgs_c*bus_w_c-1 downto 0 );
  signal re_wra_dec     : std_logic_vector( num_of_tgs_c-1 downto 0 );


  component enc_dec_1d
    generic (
      n_ag_g            :     integer;
      wait_empty_fifo_g :     integer;
      data_width_g      :     integer;
      addr_width_g      :     integer;
      packet_length_g   :     integer;
      tx_len_width_g    :     integer;
      timeout_g         :     integer;
      fill_packet_g     :     integer;
      lut_en_g          :     integer;
      net_type_g        :     integer;
      len_flit_en_g     :     integer;
      oaddr_flit_en_g   :     integer;
      status_en_g       :     integer);
    port (
      Clk               : in  std_logic;
      Rst_n             : in  std_logic;
      av_ip_enc_in      : in  std_logic_vector (n_ag_g-1 downto 0);
      data_ip_enc_in    : in  std_logic_vector (n_ag_g * data_width_g -1 downto 0);
      we_ip_enc_in      : in  std_logic_vector (n_ag_g-1 downto 0);
      len_ip_enc_in     : in  std_logic_vector (n_ag_g*tx_len_width_g-1 downto 0);
      full_enc_ip_out   : out std_logic_vector (n_ag_g-1 downto 0);
      empty_enc_ip_out  : out std_logic_vector (n_ag_g-1 downto 0);
      av_enc_net_out    : out std_logic_vector (n_ag_g-1 downto 0);
      data_enc_net_out  : out std_logic_vector (n_ag_g * data_width_g -1 downto 0);
      we_enc_net_out    : out std_logic_vector (n_ag_g-1 downto 0);
      full_net_enc_in   : in  std_logic_vector (n_ag_g-1 downto 0);
      empty_net_enc_in  : in  std_logic_vector (n_ag_g-1 downto 0);
      data_net_dec_in   : in  std_logic_vector (n_ag_g * data_width_g -1 downto 0);
      re_dec_net_out    : out std_logic_vector (n_ag_g-1 downto 0);
      full_net_dec_in   : in  std_logic_vector (n_ag_g-1 downto 0);
      empty_net_dec_in  : in  std_logic_vector (n_ag_g-1 downto 0);
      av_dec_ip_out     : out std_logic_vector (n_ag_g-1 downto 0);
      data_dec_ip_out   : out std_logic_vector (n_ag_g * data_width_g -1 downto 0);
      re_ip_dec_in      : in  std_logic_vector (n_ag_g-1 downto 0);
      empty_dec_ip_out  : out std_logic_vector (n_ag_g-1 downto 0));
  end component;

  signal av_enc_net    : std_logic_vector( num_of_tgs_c-1 downto 0 );
  signal data_enc_net  : std_logic_vector( num_of_tgs_c*bus_w_c-1 downto 0 );
  signal we_enc_net    : std_logic_vector( num_of_tgs_c-1 downto 0 );
  signal full_net_enc  : std_logic_vector( num_of_tgs_c-1 downto 0 );
  signal empty_net_enc : std_logic_vector( num_of_tgs_c-1 downto 0 );
  signal data_net_dec  : std_logic_vector( num_of_tgs_c*bus_w_c-1 downto 0 );
  signal re_dec_net    : std_logic_vector( num_of_tgs_c-1 downto 0 );
  signal full_net_dec  : std_logic_vector( num_of_tgs_c-1 downto 0 );
  signal empty_net_dec : std_logic_vector( num_of_tgs_c-1 downto 0 );


  component mesh_2d
    generic (
      stfwd_en_g        :     integer;
      data_width_g      :     integer;
      addr_width_g      :     integer;
      fifo_depth_g      :     integer;
      pkt_len_g         :     integer;
      len_flit_en_g     :     integer;
      oaddr_flit_en_g   :     integer;
		common_ip_noc_clk :     integer;
		num_noc_clks      :     integer;
      mesh_freq_g       :     freq_array := (others => 1);
      ip_freq_g         :     integer;
      rows_g            :     integer;
      cols_g            :     integer;
      debug_ena_g       :     integer;
      debug_width_g     :     integer);
    port (
      rst_n           : in  std_logic;
      clk_mesh        : in  std_logic_vector(num_noc_clks-1 downto 0);
      clk_ip          : in  std_logic;
      tx_data_in      : in  std_logic_vector(rows_g*cols_g*data_width_g-1 downto 0);
      tx_we_in        : in  std_logic_vector(rows_g*cols_g-1 downto 0);
      rx_re_in        : in  std_logic_vector(rows_g*cols_g-1 downto 0);
      rx_data_out     : out std_logic_vector(rows_g*cols_g*data_width_g-1 downto 0);
      rx_empty_out    : out std_logic_vector(rows_g*cols_g-1 downto 0);
      rx_full_out     : out std_logic_vector(rows_g*cols_g-1 downto 0);
      tx_full_out     : out std_logic_vector(rows_g*cols_g-1 downto 0);
      tx_empty_out    : out std_logic_vector(rows_g*cols_g-1 downto 0);
      debug_out       : out std_logic_vector(debug_width_g-1 downto 0));
  end component;

  component mesh_2d_with_monitor
    generic (
      stfwd_en_g      :     integer;
      data_width_g    :     integer;
      addr_width_g    :     integer;
      fifo_depth_g    :     integer;
      pkt_len_g       :     integer;
      len_flit_en_g   :     integer;
      oaddr_flit_en_g :     integer;
      mesh_freq_g     :     integer;
      ip_freq_g       :     integer;
      rows_g          :     integer;
      cols_g          :     integer;
      debug_ena_g     :     integer;
      debug_width_g   :     integer);
    port (
      rst_n           : in  std_logic;
      clk_mesh        : in  std_logic;
      clk_ip          : in  std_logic;
      tx_data_in      : in  std_logic_vector(rows_g*cols_g*data_width_g-1 downto 0);
      tx_we_in        : in  std_logic_vector(rows_g*cols_g-1 downto 0);
      rx_re_in        : in  std_logic_vector(rows_g*cols_g-1 downto 0);
      rx_data_out     : out std_logic_vector(rows_g*cols_g*data_width_g-1 downto 0);
      rx_empty_out    : out std_logic_vector(rows_g*cols_g-1 downto 0);
      rx_full_out     : out std_logic_vector(rows_g*cols_g-1 downto 0);
      tx_full_out     : out std_logic_vector(rows_g*cols_g-1 downto 0);
      tx_empty_out    : out std_logic_vector(rows_g*cols_g-1 downto 0);
      debug_out       : out std_logic_vector(debug_width_g-1 downto 0);
      mon_UART_rx_in  : in  std_logic;
      mon_UART_tx_out : out std_logic;
      mon_command_in  : in  std_logic_vector(mon_command_width_c-1 downto 0));
  end component;

  constant mesh_dbg_w_c : integer := mesh_rows_c*(mesh_cols_c-1)*8;
  signal   mesh_dbg     : std_logic_vector( mesh_dbg_w_c-1 downto 0 );

  component ring
    generic (
      nbr_of_routers_g :     integer;
      diag_en_g        :     integer;
      data_width_g     :     integer;
      stfwd_en_g       :     integer;
      pkt_len_g        :     integer;
      len_flit_en_g    :     integer;
      oaddr_flit_en_g  :     integer;
      fifo_depth_g     :     integer;
      net_freq_g       :     integer;
      ip_freq_g        :     integer);
    port (
      clk_net          : in  std_logic;
      clk_ip           : in  std_logic;
      rst_n            : in  std_logic;
      tx_data_in       : in  std_logic_vector( nbr_of_routers_g * data_width_g-1 downto 0 );
      tx_we_in         : in  std_logic_vector ( nbr_of_routers_g - 1 downto 0 );
      tx_empty_out     : out std_logic_vector ( nbr_of_routers_g - 1 downto 0 );
      tx_full_out      : out std_logic_vector ( nbr_of_routers_g - 1 downto 0 );
      rx_data_out      : out std_logic_vector( nbr_of_routers_g*data_width_g-1 downto 0 );
      rx_re_in         : in  std_logic_vector (nbr_of_routers_g-1 downto 0);
      rx_empty_out     : out std_logic_vector (nbr_of_routers_g-1 downto 0);
      rx_full_out      : out std_logic_vector (nbr_of_routers_g-1 downto 0));
  end component;

  component ring_with_monitor
    generic (
      nbr_of_routers_g :     integer;
      diag_en_g        :     integer;
      data_width_g     :     integer;
      stfwd_en_g       :     integer;
      pkt_len_g        :     integer;
      len_flit_en_g    :     integer;
      oaddr_flit_en_g  :     integer;
      fifo_depth_g     :     integer;
      net_freq_g       :     integer;
      ip_freq_g        :     integer);
    port (
      clk_net          : in  std_logic;
      clk_ip           : in  std_logic;
      rst_n            : in  std_logic;
      tx_data_in       : in  std_logic_vector( nbr_of_routers_g * data_width_g-1 downto 0 );
      tx_we_in         : in  std_logic_vector ( nbr_of_routers_g - 1 downto 0 );
      tx_empty_out     : out std_logic_vector ( nbr_of_routers_g - 1 downto 0 );
      tx_full_out      : out std_logic_vector ( nbr_of_routers_g - 1 downto 0 );
      rx_data_out      : out std_logic_vector( nbr_of_routers_g*data_width_g-1 downto 0 );
      rx_re_in         : in  std_logic_vector (nbr_of_routers_g-1 downto 0);
      rx_empty_out     : out std_logic_vector (nbr_of_routers_g-1 downto 0);
      rx_full_out      : out std_logic_vector (nbr_of_routers_g-1 downto 0);
      mon_UART_rx_in   : in  std_logic;
      mon_UART_tx_out  : out std_logic;
      mon_command_in   : in  std_logic_vector(mon_command_width_c-1 downto 0));
  end component;

  component hibiv2
    generic (
      use_monitor_g  :     integer;      
      data_width_g   :     integer;
      n_agents_g     :     integer;
      n_segments_g   :     integer;
      rel_ip_freq_g  :     integer;
      rel_noc_freq_g :     integer);
    port (
      clk_ip         : in  std_logic;
      clk_noc        : in  std_logic;
      rst_n          : in  std_logic;
      av_in          : in  std_logic_vector( n_agents_g-1 downto 0 );
      data_in        : in  std_logic_vector( n_agents_g*data_width_g-1 downto 0 );
      we_in          : in  std_logic_vector( n_agents_g-1 downto 0 );
      full_out       : out std_logic_vector( n_agents_g-1 downto 0 );
      one_p_out      : out std_logic_vector( n_agents_g-1 downto 0 );
      av_out         : out std_logic_vector( n_agents_g-1 downto 0 );
      data_out       : out std_logic_vector( n_agents_g*data_width_g-1 downto 0 );
      re_in          : in  std_logic_vector( n_agents_g-1 downto 0 );
      empty_out      : out std_logic_vector( n_agents_g-1 downto 0 );
      one_d_out      : out std_logic_vector( n_agents_g-1 downto 0 );
      mon_UART_rx_in : in std_logic;
      mon_UART_tx_out : out std_logic;
      mon_command_in : in std_logic_vector(mon_command_width_c-1 downto 0)
      );
  end component;

  component crossbar
    generic (
      n_ag_g          : integer;
      data_width_g    : integer;
      pkt_switch_en_g : integer;
      stfwd_en_g      : integer;
      max_send_g      : integer;
      net_freq_g      : integer;
      lut_en_g        : integer;
      ip_freq_g       : integer;
      fifo_depth_g    : integer;
      sim_dbg_en_g    : integer;
      dbg_en_g        : integer;
      dbg_width_g     : integer);
    port (
      rst_n        : in  std_logic;
      clk_net      : in  std_logic;
      clk_ip       : in  std_logic;
      tx_av_in     : in  std_logic_vector (n_ag_g - 1 downto 0);
      tx_data_in   : in  std_logic_vector (n_ag_g * data_width_g - 1 downto 0);
      tx_we_in     : in  std_logic_vector (n_ag_g - 1 downto 0);
      tx_full_out  : out std_logic_vector (n_ag_g - 1 downto 0);
      tx_empty_out : out std_logic_vector (n_ag_g - 1 downto 0);
      rx_av_out    : out std_logic_vector (n_ag_g - 1 downto 0);
      rx_data_out  : out std_logic_vector (n_ag_g * data_width_g - 1 downto 0);
      rx_empty_out : out std_logic_vector (n_ag_g - 1 downto 0);
      rx_full_out  : out std_logic_vector (n_ag_g - 1 downto 0);
      rx_re_in     : in  std_logic_vector (n_ag_g - 1 downto 0);
      dbg_out      : out std_logic_vector (dbg_width_g - 1 downto 0));
  end component;

  component crossbar_with_monitor
    generic (
      n_ag_g          : integer;
      data_width_g    : integer;
      pkt_switch_en_g : integer;
      stfwd_en_g      : integer;
      max_send_g      : integer;
      net_freq_g      : integer;
      lut_en_g        : integer;
      ip_freq_g       : integer;
      fifo_depth_g    : integer;
      sim_dbg_en_g    : integer;
      dbg_en_g        : integer;
      dbg_width_g     : integer);
    port (
      rst_n           : in  std_logic;
      clk_net         : in  std_logic;
      clk_ip          : in  std_logic;
      tx_av_in        : in  std_logic_vector (n_ag_g - 1 downto 0);
      tx_data_in      : in  std_logic_vector (n_ag_g * data_width_g - 1 downto 0);
      tx_we_in        : in  std_logic_vector (n_ag_g - 1 downto 0);
      tx_full_out     : out std_logic_vector (n_ag_g - 1 downto 0);
      tx_empty_out    : out std_logic_vector (n_ag_g - 1 downto 0);
      rx_av_out       : out std_logic_vector (n_ag_g - 1 downto 0);
      rx_data_out     : out std_logic_vector (n_ag_g * data_width_g - 1 downto 0);
      rx_empty_out    : out std_logic_vector (n_ag_g - 1 downto 0);
      rx_full_out     : out std_logic_vector (n_ag_g - 1 downto 0);
      rx_re_in        : in  std_logic_vector (n_ag_g - 1 downto 0);
      dbg_out         : out std_logic_vector (dbg_width_g - 1 downto 0);
      mon_UART_rx_in  : in  std_logic;
      mon_UART_tx_out : out std_logic;
      mon_command_in  : in  std_logic_vector(mon_command_width_c-1 downto 0));
  end component;  
  
  signal UART_to_master_tg   : std_logic;
  signal UART_from_master_tg : std_logic;
  signal UART_to_monitor     : std_logic;
  signal UART_from_monitor   : std_logic;
  signal UART_select_monitor : std_logic;  -- when 1, monitor is selected.

  signal command_to_monitor : std_logic_vector(mon_command_width_c-1 downto 0);

-------------------------------------------------------------------------------
begin  -- structural
-------------------------------------------------------------------------------

  UART_mux : process (UART_select_monitor, UART_from_master_tg, UART_from_monitor, UART_rx_in)
  begin  -- process UART_mux
    if UART_select_monitor = '1' then
      UART_tx_out       <= UART_from_monitor;
      UART_to_monitor   <= UART_rx_in;
      UART_to_master_tg <= '1';
    else
      UART_tx_out       <= UART_from_master_tg;
      UART_to_monitor   <= '1';
      UART_to_master_tg <= UART_rx_in;
    end if;
  end process UART_mux;

  using_pll: if use_pll_c = 1 generate

		-- The PLL used by the nodes
		pll_for_nodes: if use_node_pll = 1 generate
		node_pll: pll
			port map (
			  areset => not rst_n,
			  inclk0 => clk,
			  c0     => clk_ip,
			  locked => locked_pll
			  );
		end generate pll_for_nodes;
		
		no_pll_for_nodes: if use_node_pll = 0 generate
			clk_ip <= clk;
			locked_pll <= rst_n;
		end generate no_pll_for_nodes;
  
		common_clk: if common_ip_noc_clk_c = 1 generate
			assert (num_noc_clk_domains_c = 1);
			clk_noc(0) <= clk_ip;
			locked_noc_pll(0) <= locked_pll;
		end generate common_clk;
		
		-- The PLLs used by the network
		-- Originally I tried to do this in a for loop, but VHDL doesn't like it when you use a variable in the name of the type of component you're trying to instantiate
		separate_clk: if common_ip_noc_clk_c = 0 generate
			noc_pll_0: pll_noc_type0
				port map (
				  areset => not rst_n,
				  inclk0 => clk,
				  c0     => clk_noc(0),
				  locked => locked_noc_pll(0)
				  );
		end generate separate_clk;
		
		use_noc_pll_1: if num_noc_clk_domains_c > 1 generate
			noc_pll_1: pll_noc_type1
				port map (
				  areset => not rst_n,
				  inclk0 => clk,
				  c0     => clk_noc(1),
				  locked => locked_noc_pll(1)
				  );
		end generate use_noc_pll_1;
		
		use_noc_pll_2: if num_noc_clk_domains_c > 2 generate
			noc_pll_2: pll_noc_type2
				port map (
				  areset => not rst_n,
				  inclk0 => clk,
				  c0     => clk_noc(2),
				  locked => locked_noc_pll(2)
				  );
		end generate use_noc_pll_2;

		use_noc_pll_3: if num_noc_clk_domains_c > 3 generate
			noc_pll_3: pll_noc_type3
				port map (
				  areset => not rst_n,
				  inclk0 => clk,
				  c0     => clk_noc(3),
				  locked => locked_noc_pll(3)
				  );
		end generate use_noc_pll_3;
		
		use_noc_pll_4: if num_noc_clk_domains_c > 4 generate
			noc_pll_4: pll_noc_type4
				port map (
				  areset => not rst_n,
				  inclk0 => clk,
				  c0     => clk_noc(4),
				  locked => locked_noc_pll(4)
				  );
		end generate use_noc_pll_4;
		
		use_noc_pll_5: if num_noc_clk_domains_c > 5 generate
			noc_pll_5: pll_noc_type5
				port map (
				  areset => not rst_n,
				  inclk0 => clk,
				  c0     => clk_noc(5),
				  locked => locked_noc_pll(5)
				  );
		end generate use_noc_pll_5;
		
		use_noc_pll_6: if num_noc_clk_domains_c > 6 generate
			noc_pll_6: pll_noc_type6
				port map (
				  areset => not rst_n,
				  inclk0 => clk,
				  c0     => clk_noc(6),
				  locked => locked_noc_pll(6)
				  );
		end generate use_noc_pll_6;
		
		use_noc_pll_7: if num_noc_clk_domains_c > 7 generate
			noc_pll_7: pll_noc_type7
				port map (
				  areset => not rst_n,
				  inclk0 => clk,
				  c0     => clk_noc(7),
				  locked => locked_noc_pll(7)
				  );
		end generate use_noc_pll_7;
	
	-- Some versions of VHDL might support elses in generates, but to be safe I've made these separate ifs
	reset_1_noc_clk: if num_noc_clk_domains_c = 1 generate
		rst_n_noc <= locked_pll and locked_noc_pll(0);
	end generate reset_1_noc_clk;
	
	reset_2_noc_clk: if num_noc_clk_domains_c = 2 generate
		rst_n_noc <= locked_pll and locked_noc_pll(0) and locked_noc_pll(1);
	end generate reset_2_noc_clk;
	
	reset_3_noc_clk: if num_noc_clk_domains_c = 3 generate
		rst_n_noc <= locked_pll and locked_noc_pll(0) and locked_noc_pll(1) and locked_noc_pll(2);
	end generate reset_3_noc_clk;
	
	reset_4_noc_clk: if num_noc_clk_domains_c = 4 generate
		rst_n_noc <= locked_pll and locked_noc_pll(0) and locked_noc_pll(1) and locked_noc_pll(2) and locked_noc_pll(3);
	end generate reset_4_noc_clk;
	
	reset_5_noc_clk: if num_noc_clk_domains_c = 5 generate
		rst_n_noc <= locked_pll and locked_noc_pll(0) and locked_noc_pll(1) and locked_noc_pll(2) and locked_noc_pll(3) and locked_noc_pll(4);
	end generate reset_5_noc_clk;
	
	reset_6_noc_clk: if num_noc_clk_domains_c = 6 generate
		rst_n_noc <= locked_pll and locked_noc_pll(0) and locked_noc_pll(1) and locked_noc_pll(2) and locked_noc_pll(3) and locked_noc_pll(4) and locked_noc_pll(5);
	end generate reset_6_noc_clk;
	
	reset_7_noc_clk: if num_noc_clk_domains_c = 7 generate
		rst_n_noc <= locked_pll and locked_noc_pll(0) and locked_noc_pll(1) and locked_noc_pll(2) and locked_noc_pll(3) and locked_noc_pll(4) and locked_noc_pll(5) and locked_noc_pll(6);
	end generate reset_7_noc_clk;
	
	reset_8_noc_clk: if num_noc_clk_domains_c = 8 generate
		rst_n_noc <= locked_pll and locked_noc_pll(0) and locked_noc_pll(1) and locked_noc_pll(2) and locked_noc_pll(3) and locked_noc_pll(4) and locked_noc_pll(5) and locked_noc_pll(6) and locked_noc_pll(7);
	end generate reset_8_noc_clk;

  end generate using_pll;

  no_pll: if use_pll_c /= 1 generate

    -- Note: If not using PLLs then the number of clock domains should always be 1
	 assert (num_noc_clk_domains_c = 1);
    clk_noc(0) <= clk;
    clk_ip  <= clk;
    rst_n_noc <= rst_n;
    
  end generate no_pll;
  

  master_tg : tg_top
    generic map (
      own_addr_g              => 0,
      is_master_g             => 1,
      n_triggers_g            => trigger_table_c(0),
      n_events_g              => event_table_c(0),
      dep_flag_w_g            => dep_flag_w_c
      )
    port map (
      r_empty_in              => empty_wra_tg(0),
      r_data_in               => data_wra_tg(0),
      r_re_out                => re_tg_wra(0),
      w_full_in               => full_wra_tg(0),
      w_we_out                => we_tg_wra(0),
      w_data_out              => data_tg_wra(0),
      w_tx_len_out            => tx_len_tg_wra(0),
      UART_rx_in              => UART_to_master_tg,
      UART_tx_out             => UART_from_master_tg,
      config_mode_en_out      => config_mode_master,
      config_mode_en_in       => tmp_conf_master,
      clk                     => clk_ip,
      rst_n                   => rst_n_noc,
      monitor_command_out     => command_to_monitor,
      select_monitor_UART_out => UART_select_monitor,
      failure_out             => failure_out
      );


  slave_tgs : for n in 1 to num_of_tgs_c-1 generate

    tg : tg_top
      generic map (
        own_addr_g              => n,
        is_master_g             => 0,
        n_triggers_g            => trigger_table_c(n),
        n_events_g              => event_table_c(n),
        dep_flag_w_g            => dep_flag_w_c
        )
      port map (
        r_empty_in              => empty_wra_tg(n),
        r_data_in               => data_wra_tg(n),
        r_re_out                => re_tg_wra(n),
        w_full_in               => full_wra_tg(n),
        w_we_out                => we_tg_wra(n),
        w_data_out              => data_tg_wra(n),
        w_tx_len_out            => tx_len_tg_wra(n),
        UART_rx_in              => tmp_slave_uart_rx,
        UART_tx_out             => open,
        config_mode_en_out      => open,
        config_mode_en_in       => config_mode_master,
        clk                     => clk_ip,
        rst_n                   => rst_n_noc,
        monitor_command_out     => open,
        select_monitor_UART_out => open,
        failure_out             => open
        );

  end generate slave_tgs;

  wrappers : for n in 0 to num_of_tgs_c-1 generate

    wra : wrapper
      generic map (
        net_type_g             => net_type_c,
        addr_width_g           => bus_w_c,
        mesh_columns_g         => mesh_cols_c,
        mesh_rows_g            => mesh_rows_c,
        hibi_segments_g        => n_hibi_segments_c,
        wrappers_per_segment_g => num_of_tgs_c / n_hibi_segments_c
        )
      port map (
        clk                    => clk_ip,
        rst_n                  => rst_n_noc,
        config_mode_in         => config_mode_master,
        net_sndr_full_in       => full_enc_wra(n),
        net_av_out             => av_wra_enc(n),
        net_we_out             => we_wra_enc(n),
        net_data_out           => data_wra_enc( (n+1)*bus_w_c-1 downto n*bus_w_c ),
        tx_len_out             => tx_len_wra_enc( (n+1)*tx_length_w_c-1 downto n*tx_length_w_c ),
        sndr_net_we_in         => we_tg_wra(n),
        sndr_net_data_in       => data_tg_wra(n),
        sndr_net_tx_len_in     => tx_len_tg_wra(n),
        sndr_full_out          => full_wra_tg(n),
        net_rdr_av_in          => av_dec_wra(n),
        net_rdr_empty_in       => empty_dec_wra(n),
        net_rdr_data_in        => data_dec_wra( (n+1)*bus_w_c-1 downto n*bus_w_c ),
        net_re_out             => re_wra_dec(n),
        rdr_net_re_in          => re_tg_wra(n),
        rdr_empty_out          => empty_wra_tg(n),
        rdr_data_out           => data_wra_tg(n)
        );

  end generate wrappers;

  encode_decode_sys : if net_type_c /= 2 and (net_type_c /= 3 or xbar_pkt_switched_c = 1)
  generate

    enc_dec : enc_dec_1d
      generic map (
        n_ag_g            => num_of_tgs_c,
        wait_empty_fifo_g => stfwd_en_c,
        data_width_g      => bus_w_c,
        addr_width_g      => bus_w_c,
        packet_length_g   => packet_length_c,
        tx_len_width_g    => tx_length_w_c,
        timeout_g         => 5,
        fill_packet_g     => fill_packet_c,
        lut_en_g          => 0,
        net_type_g        => net_type_c,
        len_flit_en_g     => len_flit_en_c,
        oaddr_flit_en_g   => oaddr_flit_en_c,
        status_en_g       => 0
        )
      port map (
        Clk               => clk_ip,
        Rst_n             => rst_n_noc,
        av_ip_enc_in      => av_wra_enc,
        data_ip_enc_in    => data_wra_enc,
        we_ip_enc_in      => we_wra_enc,
        len_ip_enc_in     => tx_len_wra_enc,
        full_enc_ip_out   => full_enc_wra,
        empty_enc_ip_out  => empty_enc_wra,
        av_enc_net_out    => av_enc_net,
        data_enc_net_out  => data_enc_net,
        we_enc_net_out    => we_enc_net,
        full_net_enc_in   => full_net_enc,
        empty_net_enc_in  => empty_net_enc,
        data_net_dec_in   => data_net_dec,
        re_dec_net_out    => re_dec_net,
        full_net_dec_in   => full_net_dec,
        empty_net_dec_in  => empty_net_dec,
        av_dec_ip_out     => av_dec_wra,
        data_dec_ip_out   => data_dec_wra,
        re_ip_dec_in      => re_wra_dec,
        empty_dec_ip_out  => empty_dec_wra
        );

  end generate encode_decode_sys;


  mesh_selected : if net_type_c = 0 generate

    nonmonitor_mesh : if use_monitor_c = 0 generate
      mesh          : mesh_2d
        generic map (
          stfwd_en_g      => stfwd_en_c,
          data_width_g    => bus_w_c,
          addr_width_g    => bus_w_c,
          fifo_depth_g    => fifo_depth_c,
          pkt_len_g       => packet_length_c,
          len_flit_en_g   => len_flit_en_c,
          oaddr_flit_en_g => oaddr_flit_en_c,
			 common_ip_noc_clk=>common_ip_noc_clk_c,
          num_noc_clks    => num_noc_clk_domains_c,
			 mesh_freq_g     => noc_freq_c,
          ip_freq_g       => ip_freq_c,
          rows_g          => mesh_rows_c,
          cols_g          => mesh_cols_c,
          debug_ena_g     => 1,
          debug_width_g   => mesh_dbg_w_c
          )
        port map (
          rst_n           => rst_n_noc,
          clk_mesh        => clk_noc,
          clk_ip          => clk_ip,
          tx_data_in      => data_enc_net,
          tx_we_in        => we_enc_net,
          rx_re_in        => re_dec_net,
          rx_data_out     => data_net_dec,
          rx_empty_out    => empty_net_dec,
          rx_full_out     => full_net_dec,
          tx_full_out     => full_net_enc,
          tx_empty_out    => empty_net_enc,
          debug_out       => mesh_dbg);
    end generate nonmonitor_mesh;

    monitor_mesh        : if use_monitor_c = 1 generate
      assert (num_noc_clk_domains_c = 1);
		mesh_with_monitor : mesh_2d_with_monitor
        generic map (
          stfwd_en_g      => stfwd_en_c,
          data_width_g    => bus_w_c,
          addr_width_g    => bus_w_c,
          fifo_depth_g    => fifo_depth_c,
          pkt_len_g       => packet_length_c,
          len_flit_en_g   => len_flit_en_c,
          oaddr_flit_en_g => oaddr_flit_en_c,
          mesh_freq_g     => noc_freq_c(0),
          ip_freq_g       => ip_freq_c,
          rows_g          => mesh_rows_c,
          cols_g          => mesh_cols_c,
          debug_ena_g     => 1,
          debug_width_g   => mesh_dbg_w_c
          )
        port map (
          rst_n           => rst_n_noc,
          clk_mesh        => clk_noc(0),
          clk_ip          => clk_ip,
          tx_data_in      => data_enc_net,
          tx_we_in        => we_enc_net,
          rx_re_in        => re_dec_net,
          rx_data_out     => data_net_dec,
          rx_empty_out    => empty_net_dec,
          rx_full_out     => full_net_dec,
          tx_full_out     => full_net_enc,
          tx_empty_out    => empty_net_enc,
          debug_out       => mesh_dbg,
          mon_UART_rx_in  => UART_to_monitor,
          mon_UART_tx_out => UART_from_monitor,
          mon_command_in  => command_to_monitor
          );
    end generate monitor_mesh;


  end generate mesh_selected;


  ring_selected : if net_type_c = 1 generate
  
    assert (num_noc_clk_domains_c = 1);
    nonmonitor_ring : if use_monitor_c = 0 generate
      ring_noc      : ring
        generic map (
          nbr_of_routers_g => num_of_tgs_c,
          diag_en_g        => ring_diag_en_c,
          data_width_g     => bus_w_c,
          stfwd_en_g       => stfwd_en_c,
          pkt_len_g        => packet_length_c,
          len_flit_en_g    => len_flit_en_c,
          oaddr_flit_en_g  => oaddr_flit_en_c,
          fifo_depth_g     => fifo_depth_c,
          net_freq_g       => noc_freq_c(0),
          ip_freq_g        => ip_freq_c
          )
        port map (
          clk_net          => clk_noc(0),
          clk_ip           => clk_ip,
          rst_n            => rst_n_noc,
          tx_data_in       => data_enc_net,
          tx_we_in         => we_enc_net,
          tx_empty_out     => empty_net_enc,
          tx_full_out      => full_net_enc,
          rx_data_out      => data_net_dec,
          rx_re_in         => re_dec_net,
          rx_empty_out     => empty_net_dec,
          rx_full_out      => full_net_dec
          );
    end generate nonmonitor_ring;

    monitor_ring : if use_monitor_c = 1 generate


      ring_noc : ring_with_monitor
        generic map (
          nbr_of_routers_g => num_of_tgs_c,
          diag_en_g        => ring_diag_en_c,
          data_width_g     => bus_w_c,
          stfwd_en_g       => stfwd_en_c,
          pkt_len_g        => packet_length_c,
          len_flit_en_g    => len_flit_en_c,
          oaddr_flit_en_g  => oaddr_flit_en_c,
          fifo_depth_g     => fifo_depth_c,
          net_freq_g       => noc_freq_c(0),
          ip_freq_g        => ip_freq_c
          )
        port map (
          clk_net          => clk_noc(0),
          clk_ip           => clk_ip,
          rst_n            => rst_n_noc,
          tx_data_in       => data_enc_net,
          tx_we_in         => we_enc_net,
          tx_empty_out     => empty_net_enc,
          tx_full_out      => full_net_enc,
          rx_data_out      => data_net_dec,
          rx_re_in         => re_dec_net,
          rx_empty_out     => empty_net_dec,
          rx_full_out      => full_net_dec,
          mon_UART_rx_in   => UART_to_monitor,
          mon_UART_tx_out  => UART_from_monitor,
          mon_command_in   => command_to_monitor
          );
    end generate monitor_ring;

  end generate ring_selected;


  hibi_selected : if net_type_c = 2 generate

    assert (num_noc_clk_domains_c = 1);
	 hibi_noc : hibiv2
      generic map (
        use_monitor_g  => use_monitor_c,        
        data_width_g   => bus_w_c,
        n_agents_g     => num_of_tgs_c,
        n_segments_g   => n_hibi_segments_c,
        rel_ip_freq_g  => rel_ip_freq_c,
        rel_noc_freq_g => rel_noc_freq_c
        )
      port map (
        clk_ip         => clk_ip,
        clk_noc        => clk_noc(0),
        rst_n          => rst_n_noc,
        av_in          => av_wra_enc,
        data_in        => data_wra_enc,
        we_in          => we_wra_enc,
        full_out       => full_enc_wra,
        one_p_out      => open,
        av_out         => av_dec_wra,
        data_out       => data_dec_wra,
        re_in          => re_wra_dec,
        empty_out      => empty_dec_wra,
        one_d_out      => open,
        mon_UART_rx_in => UART_to_monitor,
        mon_UART_tx_out => UART_from_monitor,
        mon_command_in => command_to_monitor        
        );

  end generate hibi_selected;

  xbar_selected : if net_type_c = 3 generate

    assert (num_noc_clk_domains_c = 1);
	 pkt_sw : if xbar_pkt_switched_c = 1 generate

      pkt_sw_nonmon : if use_monitor_c = 0 generate
        xbar        : crossbar
          generic map (
            n_ag_g          => num_of_tgs_c,
            data_width_g    => bus_w_c,
            pkt_switch_en_g => xbar_pkt_switched_c,
            stfwd_en_g      => stfwd_en_c,
            max_send_g      => packet_length_c,
            net_freq_g      => noc_freq_c(0),
            lut_en_g        => 0,
            ip_freq_g       => ip_freq_c,
            fifo_depth_g    => fifo_depth_c,
            sim_dbg_en_g    => 0,
            dbg_en_g        => 0,
            dbg_width_g     => 1
            )
          port map (
            rst_n           => rst_n_noc,
            clk_net         => clk_noc(0),
            clk_ip          => clk_ip,
            tx_av_in        => av_enc_net,
            tx_data_in      => data_enc_net,
            tx_we_in        => we_enc_net,
            tx_full_out     => full_net_enc,
            tx_empty_out    => empty_net_enc,
            rx_av_out       => open,
            rx_data_out     => data_net_dec,
            rx_empty_out    => empty_net_dec,
            rx_full_out     => full_net_dec,
            rx_re_in        => re_dec_net,
            dbg_out         => open
            );
      end generate pkt_sw_nonmon;

      pkt_sw_yesmon : if use_monitor_c = 1 generate
        xbar        : crossbar_with_monitor
          generic map (
            n_ag_g          => num_of_tgs_c,
            data_width_g    => bus_w_c,
            pkt_switch_en_g => xbar_pkt_switched_c,
            stfwd_en_g      => stfwd_en_c,
            max_send_g      => packet_length_c,
            net_freq_g      => noc_freq_c(0),
            lut_en_g        => 0,
            ip_freq_g       => ip_freq_c,
            fifo_depth_g    => fifo_depth_c,
            sim_dbg_en_g    => 0,
            dbg_en_g        => 0,
            dbg_width_g     => 1
            )
          port map (
            rst_n           => rst_n_noc,
            clk_net         => clk_noc(0),
            clk_ip          => clk_ip,
            tx_av_in        => av_enc_net,
            tx_data_in      => data_enc_net,
            tx_we_in        => we_enc_net,
            tx_full_out     => full_net_enc,
            tx_empty_out    => empty_net_enc,
            rx_av_out       => open,
            rx_data_out     => data_net_dec,
            rx_empty_out    => empty_net_dec,
            rx_full_out     => full_net_dec,
            rx_re_in        => re_dec_net,
            dbg_out         => open,
            mon_UART_rx_in  => UART_to_monitor,
            mon_UART_tx_out => UART_from_monitor,
            mon_command_in  => command_to_monitor
            );
      end generate pkt_sw_yesmon;

    end generate pkt_sw;


    circ_sw : if xbar_pkt_switched_c = 0 generate

      circ_sw_nonmon : if use_monitor_c = 0 generate
        xbar         : crossbar
          generic map (
            n_ag_g          => num_of_tgs_c,
            data_width_g    => bus_w_c,
            pkt_switch_en_g => xbar_pkt_switched_c,
            stfwd_en_g      => stfwd_en_c,
            max_send_g      => packet_length_c,
            net_freq_g      => noc_freq_c(0),
            lut_en_g        => 0,
            ip_freq_g       => ip_freq_c,
            fifo_depth_g    => fifo_depth_c,
            sim_dbg_en_g    => 0,
            dbg_en_g        => 0,
            dbg_width_g     => 1
            )
          port map (
            rst_n           => rst_n_noc,
            clk_net         => clk_noc(0),
            clk_ip          => clk_ip,
            tx_av_in        => av_wra_enc,
            tx_data_in      => data_wra_enc,
            tx_we_in        => we_wra_enc,
            tx_full_out     => full_enc_wra,
            tx_empty_out    => empty_enc_wra,
            rx_av_out       => av_dec_wra,
            rx_data_out     => data_dec_wra,
            rx_empty_out    => empty_dec_wra,
            rx_full_out     => open,
            rx_re_in        => re_wra_dec,
            dbg_out         => open
            );
      end generate circ_sw_nonmon;
      circ_sw_yesmon : if use_monitor_c = 1 generate
        xbar         : crossbar_with_monitor
          generic map (
            n_ag_g          => num_of_tgs_c,
            data_width_g    => bus_w_c,
            pkt_switch_en_g => xbar_pkt_switched_c,
            stfwd_en_g      => stfwd_en_c,
            max_send_g      => packet_length_c,
            net_freq_g      => noc_freq_c(0),
            lut_en_g        => 0,
            ip_freq_g       => ip_freq_c,
            fifo_depth_g    => fifo_depth_c,
            sim_dbg_en_g    => 0,
            dbg_en_g        => 0,
            dbg_width_g     => 1
            )
          port map (
            rst_n           => rst_n_noc,
            clk_net         => clk_noc(0),
            clk_ip          => clk_ip,
            tx_av_in        => av_wra_enc,
            tx_data_in      => data_wra_enc,
            tx_we_in        => we_wra_enc,
            tx_full_out     => full_enc_wra,
            tx_empty_out    => empty_enc_wra,
            rx_av_out       => av_dec_wra,
            rx_data_out     => data_dec_wra,
            rx_empty_out    => empty_dec_wra,
            rx_full_out     => open,
            rx_re_in        => re_wra_dec,
            dbg_out         => open,
            mon_UART_rx_in  => UART_to_monitor,
            mon_UART_tx_out => UART_from_monitor,
            mon_command_in  => command_to_monitor
            );        
      end generate circ_sw_yesmon;
    end generate circ_sw;
    
  end generate xbar_selected;
  
end structural;
