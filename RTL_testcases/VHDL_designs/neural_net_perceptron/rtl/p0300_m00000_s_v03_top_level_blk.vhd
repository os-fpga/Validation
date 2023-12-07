-- COPYRIGHT (C) 2022 by Jens Gutschmidt / VIVARE GmbH Switzerland
-- (email: opencores@vivare-services.com)
-- 
-- This program is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or any
-- later version.
-- 
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-- See the GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
-- 
-- 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
--USE ieee.numeric_std.all;
LIBRARY work;
USE work.memory_vhd_v03_pkg.ALL;

ENTITY p0300_m00000_s_v03_top_level_blk IS
   PORT( 
      wb_adr_i   : IN     WB_ADDR_WIDTH_T;
      wb_clk_i   : IN     std_logic;
      wb_cyc_i   : IN     std_logic;
      wb_dat_i   : IN     WB_DATA_WIDTH_T;
      wb_rst_i   : IN     std_logic;
      wb_stb_i   : IN     std_logic;
      wb_we_i    : IN     std_logic;
      ctrl_int_o : OUT    std_logic;
      wb_ack_o   : OUT    std_logic;
      wb_dat_o   : OUT    WB_DATA_WIDTH_T
   );

-- Declarations

END p0300_m00000_s_v03_top_level_blk ;
-- COPYRIGHT (C) 2022 Jens Gutschmidt /
-- VIVARE GmbH Switzerland
-- (email: opencores@vivare-services.com)
-- 
-- Versions:
-- 
-- Revision 3.0  2022/07/04
-- - Update wiring and connections
-- - Insert new versioned symbol of U_0
-- Revision 2.0  2022/06/13
-- - Insert new versioned symbol of U_0
-- Revision 1.0  2022/06/12
-- -- First draft
-- 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
--USE ieee.numeric_std.all;
LIBRARY work;
USE work.memory_vhd_v03_pkg.ALL;


ARCHITECTURE struct OF p0300_m00000_s_v03_top_level_blk IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL addr_i_oi   : ADDRESS_S_T;
   SIGNAL addr_j_oi   : ADDRESS_T_T;
   SIGNAL dbias_oi    : DATA_T;
   SIGNAL dout1_oi    : DATA_T;
   SIGNAL dout2_oi    : DATA_T;
   SIGNAL dout3_oi    : DATA_T;
   SIGNAL dout4_oi    : DATA_T;
   SIGNAL dout5_oi    : DATA_T;
   SIGNAL dout7_oi    : DATA_T;
   SIGNAL ds_oi       : DATA_T;
   SIGNAL dt_oi       : DATA_T;
   SIGNAL dw_oi       : DATA_T;
   SIGNAL dy_oi       : DATA_T;
   SIGNAL we_bias2_oi : std_logic;
   SIGNAL we_bias3_oi : std_logic;
   SIGNAL we_bias5_oi : std_logic;
   SIGNAL we_s3_oi    : std_logic;
   SIGNAL we_s4_oi    : std_logic;
   SIGNAL we_s5_oi    : std_logic;
   SIGNAL we_t3_oi    : std_logic;
   SIGNAL we_t4_oi    : std_logic;
   SIGNAL we_t5_oi    : std_logic;
   SIGNAL we_w2_oi    : std_logic;
   SIGNAL we_w3_oi    : std_logic;
   SIGNAL we_w4_oi    : std_logic;
   SIGNAL we_w5_oi    : std_logic;
   SIGNAL we_w7_oi    : std_logic;
   SIGNAL we_y1_oi    : std_logic;
   SIGNAL we_y3_oi    : std_logic;
   SIGNAL we_y5_oi    : std_logic;


   -- Component Declarations
   COMPONENT p0300_m00020_s_v03_perceptron_blk
   PORT (
      clk_i      : IN     std_logic ;
      dbias_i    : IN     DATA_T ;
      ds_i       : IN     DATA_T ;
      dt_i       : IN     DATA_T ;
      dw_i       : IN     DATA_T ;
      dy_i       : IN     DATA_T ;
      rst_i      : IN     std_logic ;
      wb_adr_i   : IN     WB_ADDR_WIDTH_T ;
      wb_cyc_i   : IN     std_logic ;
      wb_dat_i   : IN     WB_DATA_WIDTH_T ;
      wb_stb_i   : IN     std_logic ;
      wb_we_i    : IN     std_logic ;
      addr_i_o   : OUT    ADDRESS_S_T ;
      addr_j_o   : OUT    ADDRESS_T_T ;
      ctrl_int_o : OUT    std_logic ;
      dout1_o    : OUT    DATA_T ;
      dout2_o    : OUT    DATA_T ;
      dout3_o    : OUT    DATA_T ;
      dout4_o    : OUT    DATA_T ;
      dout5_o    : OUT    DATA_T ;
      dout7_o    : OUT    DATA_T ;
      wb_ack_o   : OUT    std_logic ;
      wb_dat_o   : OUT    WB_DATA_WIDTH_T ;
      we_bias2_o : OUT    std_logic ;
      we_bias3_o : OUT    std_logic ;
      we_bias5_o : OUT    std_logic ;
      we_s3_o    : OUT    std_logic ;
      we_s4_o    : OUT    std_logic ;
      we_s5_o    : OUT    std_logic ;
      we_t3_o    : OUT    std_logic ;
      we_t4_o    : OUT    std_logic ;
      we_t5_o    : OUT    std_logic ;
      we_w2_o    : OUT    std_logic ;
      we_w3_o    : OUT    std_logic ;
      we_w4_o    : OUT    std_logic ;
      we_w5_o    : OUT    std_logic ;
      we_w7_o    : OUT    std_logic ;
      we_y1_o    : OUT    std_logic ;
      we_y3_o    : OUT    std_logic ;
      we_y5_o    : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT p0300_m00100_s_v01_mem_gen_blk
   PORT (
      addr_i_i   : IN     ADDRESS_S_T ;
      addr_j_i   : IN     ADDRESS_T_T ;
      clk_i      : IN     std_logic ;
      din1_i     : IN     DATA_T ;
      din2_i     : IN     DATA_T ;
      din3_i     : IN     DATA_T ;
      din4_i     : IN     DATA_T ;
      din5_i     : IN     DATA_T ;
      din7_i     : IN     DATA_T ;
      we_bias2_i : IN     std_logic ;
      we_bias3_i : IN     std_logic ;
      we_bias5_i : IN     std_logic ;
      we_s3_i    : IN     std_logic ;
      we_s4_i    : IN     std_logic ;
      we_s5_i    : IN     std_logic ;
      we_t3_i    : IN     std_logic ;
      we_t4_i    : IN     std_logic ;
      we_t5_i    : IN     std_logic ;
      we_w2_i    : IN     std_logic ;
      we_w3_i    : IN     std_logic ;
      we_w4_i    : IN     std_logic ;
      we_w5_i    : IN     std_logic ;
      we_w7_i    : IN     std_logic ;
      we_y1_i    : IN     std_logic ;
      we_y3_i    : IN     std_logic ;
      we_y5_i    : IN     std_logic ;
      dbias_o    : OUT    DATA_T ;
      ds_o       : OUT    DATA_T ;
      dt_o       : OUT    DATA_T ;
      dw_o       : OUT    DATA_T ;
      dy_o       : OUT    DATA_T 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : p0300_m00020_s_v03_perceptron_blk USE ENTITY work.p0300_m00020_s_v03_perceptron_blk;
   FOR ALL : p0300_m00100_s_v01_mem_gen_blk USE ENTITY work.p0300_m00100_s_v01_mem_gen_blk;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_0 : p0300_m00020_s_v03_perceptron_blk
      PORT MAP (
         clk_i      => wb_clk_i,
         dbias_i    => dbias_oi,
         ds_i       => ds_oi,
         dt_i       => dt_oi,
         dw_i       => dw_oi,
         dy_i       => dy_oi,
         rst_i      => wb_rst_i,
         wb_adr_i   => wb_adr_i,
         wb_cyc_i   => wb_cyc_i,
         wb_dat_i   => wb_dat_i,
         wb_stb_i   => wb_stb_i,
         wb_we_i    => wb_we_i,
         addr_i_o   => addr_i_oi,
         addr_j_o   => addr_j_oi,
         ctrl_int_o => ctrl_int_o,
         dout1_o    => dout1_oi,
         dout2_o    => dout2_oi,
         dout3_o    => dout3_oi,
         dout4_o    => dout4_oi,
         dout5_o    => dout5_oi,
         dout7_o    => dout7_oi,
         wb_ack_o   => wb_ack_o,
         wb_dat_o   => wb_dat_o,
         we_bias2_o => we_bias2_oi,
         we_bias3_o => we_bias3_oi,
         we_bias5_o => we_bias5_oi,
         we_s3_o    => we_s3_oi,
         we_s4_o    => we_s4_oi,
         we_s5_o    => we_s5_oi,
         we_t3_o    => we_t3_oi,
         we_t4_o    => we_t4_oi,
         we_t5_o    => we_t5_oi,
         we_w2_o    => we_w2_oi,
         we_w3_o    => we_w3_oi,
         we_w4_o    => we_w4_oi,
         we_w5_o    => we_w5_oi,
         we_w7_o    => we_w7_oi,
         we_y1_o    => we_y1_oi,
         we_y3_o    => we_y3_oi,
         we_y5_o    => we_y5_oi
      );
   U_1 : p0300_m00100_s_v01_mem_gen_blk
      PORT MAP (
         addr_i_i   => addr_i_oi,
         addr_j_i   => addr_j_oi,
         clk_i      => wb_clk_i,
         din1_i     => dout1_oi,
         din2_i     => dout2_oi,
         din3_i     => dout3_oi,
         din4_i     => dout4_oi,
         din5_i     => dout5_oi,
         din7_i     => dout7_oi,
         we_bias2_i => we_bias2_oi,
         we_bias3_i => we_bias3_oi,
         we_bias5_i => we_bias5_oi,
         we_s3_i    => we_s3_oi,
         we_s4_i    => we_s4_oi,
         we_s5_i    => we_s5_oi,
         we_t3_i    => we_t3_oi,
         we_t4_i    => we_t4_oi,
         we_t5_i    => we_t5_oi,
         we_w2_i    => we_w2_oi,
         we_w3_i    => we_w3_oi,
         we_w4_i    => we_w4_oi,
         we_w5_i    => we_w5_oi,
         we_w7_i    => we_w7_oi,
         we_y1_i    => we_y1_oi,
         we_y3_i    => we_y3_oi,
         we_y5_i    => we_y5_oi,
         dbias_o    => dbias_oi,
         ds_o       => ds_oi,
         dt_o       => dt_oi,
         dw_o       => dw_oi,
         dy_o       => dy_oi
      );

END struct;
