----------------------------------------------------------------------
----                                                              ----
---- WISHBONE I2S Interface IP Core                               ----
----                                                              ----
---- This file is part of the I2S Interface project               ----
---- http://www.opencores.org/cores/i2s_interface/                ----
----                                                              ----
---- Description                                                  ----
---- I2S transmitter Wishbone bus cycle decoder.                  ----
----                                                              ----
----                                                              ----
---- To Do:                                                       ----
---- -                                                            ----
----                                                              ----
---- Author(s):                                                   ----
---- - Geir Drange, gedra@opencores.org                           ----
----                                                              ----
----------------------------------------------------------------------
----                                                              ----
---- Copyright (C) 2004 Authors and OPENCORES.ORG                 ----
----                                                              ----
---- This source file may be used and distributed without         ----
---- restriction provided that this copyright statement is not    ----
---- removed from the file and that any derivative work contains  ----
---- the original copyright notice and the associated disclaimer. ----
----                                                              ----
---- This source file is free software; you can redistribute it   ----
---- and/or modify it under the terms of the GNU General          ----
---- Public License as published by the Free Software Foundation; ----
---- either version 2.0 of the License, or (at your option) any   ----
---- later version.                                               ----
----                                                              ----
---- This source is distributed in the hope that it will be       ----
---- useful, but WITHOUT ANY WARRANTY; without even the implied   ----
---- warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ----
---- PURPOSE. See the GNU General Public License for more details.----
----                                                              ----
---- You should have received a copy of the GNU General           ----
---- Public License along with this source; if not, download it   ----
---- from http://www.gnu.org/licenses/gpl.txt                     ----
----                                                              ----
----------------------------------------------------------------------
--
-- CVS Revision History
--
-- $Log: not supported by cvs2svn $
-- Revision 1.3  2005/01/17 17:26:49  gedra
-- Bugfix of register read/write strobes
--
-- Revision 1.2  2004/08/06 18:55:43  gedra
-- De-linting.
--
-- Revision 1.1  2004/08/03 18:50:51  gedra
-- Transmitter Wishbone cycle decoder.
--
--
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tx_i2s_wbd is
   generic (DATA_WIDTH : integer;
            ADDR_WIDTH : integer);
   port (
      wb_clk_i   : in  std_logic;       -- wishbone clock
      wb_rst_i   : in  std_logic;       -- reset signal
      wb_sel_i   : in  std_logic;       -- select input
      wb_stb_i   : in  std_logic;       -- strobe input
      wb_we_i    : in  std_logic;       -- write enable
      wb_cyc_i   : in  std_logic;       -- cycle input
      wb_bte_i   : in  std_logic_vector(1 downto 0);  -- burts type extension
      wb_cti_i   : in  std_logic_vector(2 downto 0);  -- cycle type identifier
      wb_adr_i   : in  std_logic_vector(ADDR_WIDTH - 1 downto 0);  -- address
      data_out   : in  std_logic_vector(DATA_WIDTH - 1 downto 0);  -- internal bus
      wb_ack_o   : out std_logic;       -- acknowledge
      wb_dat_o   : out std_logic_vector(DATA_WIDTH - 1 downto 0);  -- data out
      version_rd : out std_logic;       -- Version register read 
      config_rd  : out std_logic;       -- Config register read
      config_wr  : out std_logic;       -- Config register write
      intmask_rd : out std_logic;       -- Interrupt mask register read
      intmask_wr : out std_logic;       -- Interrupt mask register write
      intstat_rd : out std_logic;       -- Interrupt status register read
      intstat_wr : out std_logic;       -- Interrupt status register read
      mem_wr     : out std_logic);      -- Sample memory write
end tx_i2s_wbd;

architecture rtl of tx_i2s_wbd is
   
   constant REG_TXVERSION : std_logic_vector(3 downto 0) := "0000";
   constant REG_TXCONFIG  : std_logic_vector(3 downto 0) := "0001";
   constant REG_TXINTMASK : std_logic_vector(3 downto 0) := "0010";
   constant REG_TXINTSTAT : std_logic_vector(3 downto 0) := "0011";
   signal iack, iwr, ird  : std_logic;
   signal acnt            : integer range 0 to 2**(ADDR_WIDTH - 1) - 1;
   signal rdout           : std_logic_vector(DATA_WIDTH - 1 downto 0);
   
begin

   wb_ack_o <= iack;

-- acknowledge generation
   ACK : process (wb_clk_i, wb_rst_i)
   begin
      if wb_rst_i = '1' then
         iack <= '0';
      elsif rising_edge(wb_clk_i) then
         if wb_cyc_i = '1' and wb_sel_i = '1' and wb_stb_i = '1' then
            case wb_cti_i is
               when "010" =>            -- incrementing burst
                  case wb_bte_i is      -- burst extension
                     when "00" =>       -- linear burst
                        iack <= '1';
                     when others =>  -- all other treated assert classic cycle
                        iack <= not iack;
                  end case;
               when "111" =>            -- end of burst
                  iack <= not iack;
               when others =>        -- all other treated assert classic cycle 
                  iack <= not iack;
            end case;
         else
            iack <= '0';
         end if;
      end if;
   end process ACK;

-- write generation      
   WR : process (wb_clk_i, wb_rst_i)
   begin
      if wb_rst_i = '1' then
         iwr <= '0';
      elsif rising_edge(wb_clk_i) then
         if wb_cyc_i = '1' and wb_sel_i = '1' and wb_stb_i = '1' and
            wb_we_i = '1' then
            case wb_cti_i is
               when "010" =>            -- incrementing burst
                  case wb_bte_i is      -- burst extension
                     when "00" =>       -- linear burst
                        iwr <= '1';
                     when others =>     -- all other treated as classic cycle
                        iwr <= not iwr;
                  end case;
               when "111" =>            -- end of burst
                  iwr <= not iwr;
               when others =>        -- all other treated as classic cycle   
                  iwr <= not iwr;
            end case;
         else
            iwr <= '0';
         end if;
      end if;
   end process WR;

-- read generation
   ird <= '1' when wb_cyc_i = '1' and wb_sel_i = '1' and wb_stb_i = '1' and
          wb_we_i = '0' else '0';

   wb_dat_o <= data_out when wb_adr_i(ADDR_WIDTH - 1) = '1' else rdout;

   DREG : process (wb_clk_i)            -- clock data from registers
   begin
      if rising_edge(wb_clk_i) then
         rdout <= data_out;
      end if;
   end process DREG;

-- read and write strobe generation

   version_rd <= '1' when wb_adr_i(3 downto 0) = REG_TXVERSION and ird = '1'
                 and wb_adr_i(ADDR_WIDTH - 1) = '0' else '0';
   config_rd <= '1' when wb_adr_i(3 downto 0) = REG_TXCONFIG and ird = '1'
                and wb_adr_i(ADDR_WIDTH - 1) = '0' else '0';
   config_wr <= '1' when wb_adr_i(3 downto 0) = REG_TXCONFIG and iwr = '1'
                and wb_adr_i(ADDR_WIDTH - 1) = '0' else '0';
   intmask_rd <= '1' when wb_adr_i(3 downto 0) = REG_TXINTMASK and ird = '1'
                 and wb_adr_i(ADDR_WIDTH - 1) = '0' else '0';
   intmask_wr <= '1' when wb_adr_i(3 downto 0) = REG_TXINTMASK and iwr = '1'
                 and wb_adr_i(ADDR_WIDTH - 1) = '0' else '0';
   intstat_rd <= '1' when wb_adr_i(3 downto 0) = REG_TXINTSTAT and ird = '1'
                 and wb_adr_i(ADDR_WIDTH - 1) = '0' else '0';
   intstat_wr <= '1' when wb_adr_i(3 downto 0) = REG_TXINTSTAT and iwr = '1'
                 and wb_adr_i(ADDR_WIDTH - 1) = '0' else '0';
   mem_wr <= '1' when wb_adr_i(ADDR_WIDTH - 1) = '1' and iwr = '1' else '0';
   
end rtl;
