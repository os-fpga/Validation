-------------------------------------------------------------------------------
-- Title      : Tg wrapper
-- Project    : 
-------------------------------------------------------------------------------
-- File       : wrapper.vhd
-- Author     : Jussi Nieminen  <niemin95@galapagosinkeiju.cs.tut.fi>
-- Company    : 
-- Last update: 2009/09/30
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: Works as an adapter between tg and noc.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2009/06/03  1.0      niemin95        Created
-- net_empty_in was removed as unused
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


entity wrapper is

  generic (
    net_type_g        : integer := 0;   -- 0 = mesh, 1 = ring, 2 = hibi, 3 = xbar
    addr_width_g      : integer := 32;
    hibi_addr_g       : integer := -1;  -- Omitted for now.
    mesh_columns_g    : integer := 4;
    mesh_rows_g       : integer := 4;
    hibi_segments_g   : integer := 1;
    wrappers_per_segment_g : integer := 4
    );

  port (
    clk            : in std_logic;
    rst_n          : in std_logic;
    config_mode_in : in std_logic;

    -- sender side signals
    net_sndr_full_in  : in  std_logic;
    net_av_out        : out std_logic;
    net_we_out        : out std_logic;
    net_data_out      : out std_logic_vector( bus_w_c-1 downto 0 );
    tx_len_out        : out std_logic_vector( tx_length_w_c-1 downto 0 );

    sndr_net_we_in     : in  std_logic;
    sndr_net_data_in   : in  std_logic_vector( bus_w_c-1 downto 0 );
    sndr_net_tx_len_in : in  std_logic_vector( tx_length_w_c-1 downto 0 );
    sndr_full_out      : out std_logic;

    -- reader side signals
    net_rdr_av_in    : in  std_logic;
    net_rdr_empty_in : in  std_logic;
    net_rdr_data_in  : in  std_logic_vector( bus_w_c-1 downto 0 );
    net_re_out       : out std_logic;

    rdr_net_re_in : in  std_logic;
    rdr_empty_out : out std_logic;
    rdr_data_out  : out std_logic_vector( bus_w_c-1 downto 0 )
    );

end wrapper;



architecture structural of wrapper is

  component sender_wrapper
    generic (
      net_type_g        :     integer;
      addr_width_g      :     integer;
      mesh_columns_g    :     integer;
      mesh_rows_g       :     integer;
      hibi_segments_g   :     integer; -- used if address not given (-1)
      wrappers_per_segment_g : integer -- used if address not given (-1)
      );
    port (
      clk               : in  std_logic;
      rst_n             : in  std_logic;
      config_mode_in    : in  std_logic;
      net_full_in       : in  std_logic;
      av_out            : out std_logic;
      net_we_out        : out std_logic;
      net_data_out      : out std_logic_vector( bus_w_c-1 downto 0 );
      tx_len_out        : out std_logic_vector( tx_length_w_c-1 downto 0 );
      sndr_we_in        : in  std_logic;
      sndr_data_in      : in  std_logic_vector( bus_w_c-1 downto 0 );
      sndr_tx_len_in    : in  std_logic_vector( tx_length_w_c-1 downto 0 );
      sndr_full_out     : out std_logic);
  end component;

  component reader_wrapper
    port (
      clk            : in  std_logic;
      rst_n          : in  std_logic;
      config_mode_in : in  std_logic;
      av_in          : in  std_logic;
      net_empty_in   : in  std_logic;
      net_data_in    : in  std_logic_vector( bus_w_c-1 downto 0 );
      net_re_out     : out std_logic;
      rdr_re_in      : in  std_logic;
      rdr_empty_out  : out std_logic;
      rdr_data_out   : out std_logic_vector( bus_w_c-1 downto 0 ));
  end component;

begin  -- structural

  swrapper : sender_wrapper
    generic map (
      net_type_g        => net_type_g,
      addr_width_g      => addr_width_g,
      mesh_columns_g    => mesh_columns_g,
      mesh_rows_g       => mesh_rows_g,
      hibi_segments_g   => hibi_segments_g,
      wrappers_per_segment_g => wrappers_per_segment_g
      )
    port map (
      clk               => clk,
      rst_n             => rst_n,
      config_mode_in    => config_mode_in,
      net_full_in       => net_sndr_full_in,
      av_out            => net_av_out,
      net_we_out        => net_we_out,
      net_data_out      => net_data_out,
      tx_len_out        => tx_len_out,
      sndr_we_in        => sndr_net_we_in,
      sndr_data_in      => sndr_net_data_in,
      sndr_tx_len_in    => sndr_net_tx_len_in,
      sndr_full_out     => sndr_full_out
      );


  rwrapper : reader_wrapper
    port map (
      clk            => clk,
      rst_n          => rst_n,
      config_mode_in => config_mode_in,
      av_in          => net_rdr_av_in,
      net_empty_in   => net_rdr_empty_in,
      net_data_in    => net_rdr_data_in,
      net_re_out     => net_re_out,
      rdr_re_in      => rdr_net_re_in,
      rdr_empty_out  => rdr_empty_out,
      rdr_data_out   => rdr_data_out
      );

end structural;
