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

ENTITY p0300_m00100_s_v01_mem_gen_blk IS
   PORT( 
      addr_i_i   : IN     ADDRESS_S_T;
      addr_j_i   : IN     ADDRESS_T_T;
      clk_i      : IN     std_logic;
      din1_i     : IN     DATA_T;
      din2_i     : IN     DATA_T;
      din3_i     : IN     DATA_T;
      din4_i     : IN     DATA_T;
      din5_i     : IN     DATA_T;
      din7_i     : IN     DATA_T;
      we_bias2_i : IN     std_logic;
      we_bias3_i : IN     std_logic;
      we_bias5_i : IN     std_logic;
      we_s3_i    : IN     std_logic;
      we_s4_i    : IN     std_logic;
      we_s5_i    : IN     std_logic;
      we_t3_i    : IN     std_logic;
      we_t4_i    : IN     std_logic;
      we_t5_i    : IN     std_logic;
      we_w2_i    : IN     std_logic;
      we_w3_i    : IN     std_logic;
      we_w4_i    : IN     std_logic;
      we_w5_i    : IN     std_logic;
      we_w7_i    : IN     std_logic;
      we_y1_i    : IN     std_logic;
      we_y3_i    : IN     std_logic;
      we_y5_i    : IN     std_logic;
      dbias_o    : OUT    DATA_T;
      ds_o       : OUT    DATA_T;
      dt_o       : OUT    DATA_T;
      dw_o       : OUT    DATA_T;
      dy_o       : OUT    DATA_T
   );

-- Declarations

END p0300_m00100_s_v01_mem_gen_blk ;
-- COPYRIGHT (C) 2022 Jens Gutschmidt /
-- VIVARE GmbH Switzerland
-- (email: opencores@vivare-services.com)
-- 
-- Versions:
-- Revision 1.0  2022/05/25
-- -- First draft
-- 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
--USE ieee.numeric_std.all;
LIBRARY work;
USE work.memory_vhd_v03_pkg.ALL;


ARCHITECTURE struct OF p0300_m00100_s_v01_mem_gen_blk IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL addr_ij_oi : ADDRESS_W_T;
   SIGNAL din_oi     : DATA_T;
   SIGNAL we_bias_oi : std_logic;
   SIGNAL we_s_oi    : std_logic;
   SIGNAL we_t_oi    : std_logic;
   SIGNAL we_w_oi    : std_logic;
   SIGNAL we_y_oi    : std_logic;


   -- Component Declarations
   COMPONENT p0300_m00101_m_v01_mem_t
   PORT (
      addr_i : IN     ADDRESS_T_T;
      clk_i  : IN     std_logic;
      d_i    : IN     DATA_T;
      we_i   : IN     std_logic;
      d_o    : OUT    DATA_T
   );
   END COMPONENT;
   COMPONENT p0300_m00102_s_v01_mem_w
   PORT (
      addr_i : IN     ADDRESS_W_T;
      clk_i  : IN     std_logic;
      d_i    : IN     DATA_T;
      we_i   : IN     std_logic;
      d_o    : OUT    DATA_T
   );
   END COMPONENT;
   COMPONENT p0300_m00103_s_v01_mem_s
   PORT (
      addr_i : IN     ADDRESS_S_T;
      clk_i  : IN     std_logic;
      d_i    : IN     DATA_T;
      we_i   : IN     std_logic;
      d_o    : OUT    DATA_T
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : p0300_m00101_m_v01_mem_t USE ENTITY work.p0300_m00101_m_v01_mem_t;
   FOR ALL : p0300_m00102_s_v01_mem_w USE ENTITY work.p0300_m00102_s_v01_mem_w;
   FOR ALL : p0300_m00103_s_v01_mem_s USE ENTITY work.p0300_m00103_s_v01_mem_s;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 2 eb2
   -- eb1 1
   addr_ij_oi <= addr_j_i & addr_i_i;
   we_s_oi <= we_s3_i OR we_s4_i OR we_s5_i;
   we_t_oi <= we_t3_i OR we_t4_i OR we_t5_i;
   we_w_oi <= we_w2_i OR we_w3_i OR we_w4_i OR we_w5_i OR we_w7_i;
   we_y_oi <= we_y1_i OR we_y3_i OR we_y5_i;
   we_bias_oi <= we_bias2_i OR we_bias3_i OR we_bias5_i;
   din_oi <= din1_i OR din2_i OR din3_i OR din4_i OR din5_i OR din7_i;


   -- Instance port mappings.
   U_1 : p0300_m00101_m_v01_mem_t
      PORT MAP (
         clk_i  => clk_i,
         we_i   => we_t_oi,
         d_i    => din_oi,
         addr_i => addr_j_i,
         d_o    => dt_o
      );
   U_2 : p0300_m00101_m_v01_mem_t
      PORT MAP (
         clk_i  => clk_i,
         we_i   => we_y_oi,
         d_i    => din_oi,
         addr_i => addr_j_i,
         d_o    => dy_o
      );
   U_3 : p0300_m00101_m_v01_mem_t
      PORT MAP (
         clk_i  => clk_i,
         we_i   => we_bias_oi,
         d_i    => din_oi,
         addr_i => addr_j_i,
         d_o    => dbias_o
      );
   U_4 : p0300_m00102_s_v01_mem_w
      PORT MAP (
         clk_i  => clk_i,
         we_i   => we_w_oi,
         d_i    => din_oi,
         addr_i => addr_ij_oi,
         d_o    => dw_o
      );
   U_0 : p0300_m00103_s_v01_mem_s
      PORT MAP (
         clk_i  => clk_i,
         we_i   => we_s_oi,
         d_i    => din_oi,
         addr_i => addr_i_i,
         d_o    => ds_o
      );

END struct;
