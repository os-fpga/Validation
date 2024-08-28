-------------------------------------------------------------------------------
-- Title      : Sender side wrapper for tg
-- Project    : 
-------------------------------------------------------------------------------
-- File       : sender_wrapper.vhd
-- Author     : Jussi Nieminen  <niemin95@hupputikli.cs.tut.fi>
-- Company    : 
-- Last update: 2009/09/30
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: Adapter between tg sender and a network.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2009/06/03  1.0      niemin95        Created
-- 2009/07/31  alhonena, net_empty_in port was removed as unused.
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
use work.hibi_addr_pkg.all;

entity sender_wrapper is

  generic (
    net_type_g        : integer := 0;   -- 0 = mesh, 1 = ring, 2 = hibi, 3 = xbar
    addr_width_g      : integer := 32;
    mesh_columns_g    : integer := 4;
    mesh_rows_g       : integer := 4;
    hibi_segments_g   : integer := 1;
    wrappers_per_segment_g : integer := 4
    );

  port (
    clk            : in std_logic;
    rst_n          : in std_logic;
    config_mode_in : in std_logic;

    net_full_in  : in  std_logic;
    av_out       : out std_logic;
    net_we_out   : out std_logic;
    net_data_out : out std_logic_vector( bus_w_c-1 downto 0 );
    tx_len_out   : out std_logic_vector( tx_length_w_c-1 downto 0 );

    sndr_we_in     : in  std_logic;
    sndr_data_in   : in  std_logic_vector( bus_w_c-1 downto 0 );
    sndr_tx_len_in : in  std_logic_vector( tx_length_w_c-1 downto 0 );
    sndr_full_out  : out std_logic
    );

end sender_wrapper;



architecture rtl of sender_wrapper is

  -- FSM states:
  --    wait_data:      Waiting for sender to send something
  --    address:        Read the first data, store it and send address to the noc
  --    read_n_write:   Read and write data, when noc is not full
  --    store_n_wait:   If noc gets full, store the waiting data and lift sndr_full
  type states_type is (wait_data, address, read_n_write, store_n_wait);
  signal state_r : states_type;

  -- register that stores the data when neede
  signal data_r      : std_logic_vector( bus_w_c-1 downto 0 );
  signal net_data_r  : std_logic_vector( bus_w_c-1 downto 0 );
  signal sndr_full_r : std_logic;
  signal amount_sent_r : integer range 0 to 2**tx_length_w_c-1;
  signal tx_len_r : integer range 0 to 2**tx_length_w_c-1;
  
  component mesh_addr_resolver
    generic (
      number_width_g    :     integer;
      mesh_addr_width_g :     integer;
      mesh_columns_g    :     integer;
      mesh_rows_g       :     integer);
    port (
      number_in         : in  std_logic_vector( number_width_g-1 downto 0 );
      mesh_addr_out     : out std_logic_vector( mesh_addr_width_g-1 downto 0 ));
  end component;

  signal mesh_addr : std_logic_vector( addr_width_g-1 downto 0 );


  component hibi_addr_resolver
    generic (
      number_width_g         : integer;
      hibi_addr_width_g      : integer;
      hibi_segments_g        : integer;
      wrappers_per_segment_g : integer);
    port (
      number_in        : in  std_logic_vector( number_width_g-1 downto 0 );
      hibi_seg_out     : out std_logic_vector( hibi_addr_width_g-1 downto 0 );
      hibi_wrapper_out : out std_logic_vector( hibi_addr_width_g-1 downto 0 ));
  end component;

  signal hibi_seg : std_logic_vector( addr_width_g-1 downto 0 );
  signal hibi_wra : std_logic_vector( addr_width_g-1 downto 0 );
  signal hibi_seg_int : integer range 0 to hibi_segments_g-1;
  signal hibi_wra_int : integer range 0 to wrappers_per_segment_g-1;
  signal hibi_addr : integer;

-------------------------------------------------------------------------------
begin  -- rtl
-------------------------------------------------------------------------------


  mesh_addr_logic : if net_type_g = 0 generate

    addr_resolver : mesh_addr_resolver
      generic map (
        number_width_g    => address_w_c,
        mesh_addr_width_g => addr_width_g,
        mesh_columns_g    => mesh_columns_g,
        mesh_rows_g       => mesh_rows_g
        )
      port map (
        number_in         => sndr_data_in( bus_w_c-1 downto bus_w_c-address_w_c ),
        mesh_addr_out     => mesh_addr
        );

  end generate mesh_addr_logic;


  hibi_addr_logic: if net_type_g = 2 generate

    hibi_address_resolver: hibi_addr_resolver
      generic map (
          number_width_g         => address_w_c,
          hibi_addr_width_g      => addr_width_g,
          hibi_segments_g        => hibi_segments_g,
          wrappers_per_segment_g => wrappers_per_segment_g
          )
      port map (
          number_in        => sndr_data_in( bus_w_c-1 downto bus_w_c-address_w_c ),
          hibi_seg_out     => hibi_seg,
          hibi_wrapper_out => hibi_wra
          );

    hibi_seg_int <= to_integer( unsigned( hibi_seg ));
    hibi_wra_int <= to_integer( unsigned( hibi_wra ));
    hibi_addr <= addresses_c( hibi_seg_int )( hibi_wra_int + 1 );
    
  end generate hibi_addr_logic;


  sndr_full_out <= sndr_full_r;
  net_data_out  <= net_data_r;

  main : process (clk, rst_n)
  begin  -- process main
    if rst_n = '0' then                 -- asynchronous reset (active low)

      av_out          <= '0';
      net_we_out      <= '0';
      tx_len_out      <= (others => '0');
      tx_len_r        <= 0;
      sndr_full_r     <= '0';
      data_r          <= (others => '0');
      net_data_r      <= (others => '0');
      state_r         <= wait_data;
      amount_sent_r   <= 0;

    elsif clk'event and clk = '1' then  -- rising clock edge

            
      case state_r is

        when wait_data =>

          net_data_r    <= (others => '0');
          net_we_out    <= '0';
          amount_sent_r <= 0;

          -- if sndr_full_r is up, sender won't write new data to the bus as we
          -- expect in state address. We must wait until it comes down.
          if sndr_we_in = '1' and sndr_full_r = '0' then

            -- raise full signal, because we will first write out only the
            -- address and we have to store the data until that is done
            sndr_full_r <= '1';
            data_r      <= sndr_data_in;
            tx_len_r    <= to_integer( unsigned( sndr_tx_len_in ));

            -- write the address to the net
            if net_type_g = 0 then
              if addr_width_g = bus_w_c then
                net_data_r                                       <= mesh_addr;
              else
                assert addr_width_g < bus_w_c report "Mesh address width cannot be larger than bus width" severity failure;
                net_data_r( bus_w_c-1 downto addr_width_g ) <= (others => '0');
                net_data_r( addr_width_g-1 downto 0 )       <= mesh_addr;
              end if;

            elsif net_type_g = 2 then
              net_data_r <= std_logic_vector( to_unsigned( hibi_addr, addr_width_g ));
            else
              net_data_r( bus_w_c-1 downto address_w_c )         <= (others => '0');
              net_data_r( address_w_c-1 downto 0 )               <= sndr_data_in( bus_w_c-1 downto bus_w_c-address_w_c );
            end if;

            av_out     <= '1';
            net_we_out <= '1';
            state_r    <= address;
            tx_len_out <= sndr_tx_len_in;

          else

            if net_full_in = '1' then
              sndr_full_r <= '1';
            else
              sndr_full_r <= '0';
            end if;

          end if;


        when address =>

          if net_full_in = '0' then

            net_data_r  <= data_r;
            net_we_out  <= '1';
            av_out      <= '0';
            sndr_full_r <= '0';
            tx_len_out  <= (others => '0');

            -- if we had a single word transfer (the first word has mode "11")
            if data_r( bus_w_c-2*address_w_c-1 downto bus_w_c-2*address_w_c-mode_w_c ) = "11" then
              state_r <= wait_data;
            else
              -- there is more to read
              state_r <= read_n_write;
            end if;

          end if;


        when read_n_write =>

          if amount_sent_r = tx_len_r-1 then
            -- last word
            
            if config_mode_in = '0' then
              assert net_data_r( bus_w_c-2*address_w_c-1 downto bus_w_c-2*address_w_c-mode_w_c) = "11"
                report "Wrong mode in last word of tx" severity failure;
            end if;

              
            -- last word is sent, if net is not full
            if net_full_in = '0' then
              net_data_r  <= (others => '0');
              net_we_out  <= '0';
              sndr_full_r <= '0';
              state_r     <= wait_data;
            else
              -- make sure that sender doesn't start a new transfer before this
              -- one is over
              sndr_full_r <= '1';
            end if;

          else
            -- not the last word

            if net_full_in = '1' then
              -- net full and more data to be read
              sndr_full_r <= '1';
              data_r      <= sndr_data_in;
              state_r     <= store_n_wait;

            else

              -- just read and write
              sndr_full_r     <= '0';
              if sndr_we_in = '1' then
                net_data_r    <= sndr_data_in;
                net_we_out    <= '1';
                amount_sent_r <= amount_sent_r + 1;
              else
                net_we_out    <= '0';
              end if;  -- sndr_we_in = '1'

            end if;  -- net_full_in = '1'
          end if;  -- last word 

        when store_n_wait =>

          if net_full_in = '0' then

            net_we_out    <= '1';
            net_data_r    <= data_r;
            sndr_full_r   <= '0';
            amount_sent_r <= amount_sent_r + 1;

            state_r <= read_n_write;

          end if;

      end case;

    end if;
  end process main;

end rtl;
