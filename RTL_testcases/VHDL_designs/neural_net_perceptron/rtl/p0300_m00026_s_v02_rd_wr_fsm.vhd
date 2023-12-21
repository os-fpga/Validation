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

ENTITY p0300_m00026_s_v02_rd_wr_fsm IS
   PORT( 
      clk_i             : IN     std_logic;
      cnti_end_i        : IN     std_logic;
      cntj_end_i        : IN     std_logic;
      ctrl_din_i        : IN     DATA_T;
      ctrl_rd_vec_i     : IN     MEM_WR_LINES_T;
      ctrl_rdlat_i      : IN     MEM_LAT_CNT_WIDTH_T;
      ctrl_rdy7_i       : IN     std_logic;
      ctrl_start_i      : IN     std_logic;
      ctrl_wr_vec_i     : IN     MEM_WR_LINES_T;
      ctrl_wrlat_i      : IN     MEM_LAT_CNT_WIDTH_T;
      dbias_i           : IN     DATA_T;
      ds_i              : IN     DATA_T;
      dt_i              : IN     DATA_T;
      dw_i              : IN     DATA_T;
      dy_i              : IN     DATA_T;
      rst_n_i           : IN     std_logic;
      cnteni_o          : OUT    std_logic;
      cntenj_o          : OUT    std_logic;
      ctrl_complete_o   : OUT    std_logic;
      ctrl_dout_o       : OUT    DATA_T;
      ctrl_dout_valid_o : OUT    std_logic;
      ctrl_rdy_o        : OUT    std_logic;
      dout_o            : OUT    DATA_T;
      we_bias_o         : OUT    std_logic;
      we_s_o            : OUT    std_logic;
      we_t_o            : OUT    std_logic;
      we_w_o            : OUT    std_logic;
      we_y_o            : OUT    std_logic
   );

-- Declarations

END p0300_m00026_s_v02_rd_wr_fsm ;
-- COPYRIGHT (C) 2022 Jens Gutschmidt /
-- VIVARE GmbH Switzerland
-- (email: opencores@vivare-services.com)
-- 
-- Versions:
-- Revision 2.0  2022/07/02
-- - Introduced latency for write
-- Revision 1.0  2022/06/09
-- -- First draft
-- 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
--USE ieee.numeric_std.all;
LIBRARY work;
USE work.memory_vhd_v03_pkg.ALL;
 
ARCHITECTURE fsm OF p0300_m00026_s_v02_rd_wr_fsm IS

   -- Architecture Declarations
   SIGNAL ctrl_complete_reg : std_logic;  
   SIGNAL ctrl_dout_reg : DATA_T;  
   SIGNAL ctrl_dout_valid_reg : std_logic;  
   SIGNAL ctrl_rdlat_reg : MEM_LAT_CNT_WIDTH_T;  
   SIGNAL ctrl_start_reg : std_logic;  
   SIGNAL ctrl_wrlat_reg : MEM_LAT_CNT_WIDTH_T;  

   TYPE STATE_TYPE IS (
      S01,
      S02,
      S12,
      S22,
      S32,
      S42,
      S03,
      S00
   );
 
   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

BEGIN

   -----------------------------------------------------------------
   clocked_proc : PROCESS ( 
      clk_i
   )
   -----------------------------------------------------------------
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (rst_n_i = '0') THEN
            current_state <= S00;
            -- Default Reset Values
            ctrl_complete_reg <= '0';
            ctrl_dout_reg <= (others => '0');
            ctrl_dout_valid_reg <= '0';
            ctrl_rdlat_reg <= (others => '0');
            ctrl_start_reg <= '0';
            ctrl_wrlat_reg <= (others => '0');
         ELSE
            current_state <= next_state;
            -- Default Assignment To Internals
            ctrl_complete_reg <= '0';
            ctrl_dout_reg <= ctrl_dout_reg;
            ctrl_dout_valid_reg <= '0';
            ctrl_rdlat_reg <= ctrl_rdlat_reg;
            ctrl_start_reg <= ctrl_start_i;
            ctrl_wrlat_reg <= ctrl_wrlat_reg;

            -- Combined Actions
            CASE current_state IS
               -- Wait for next
               -- RD/WR.
               WHEN S01 => 
                  ctrl_rdlat_reg <= ctrl_rdlat_i;
                  ctrl_wrlat_reg <= ctrl_wrlat_i;
               -- RD/WR W
               WHEN S02 => 
                  ctrl_dout_reg <= dw_i;
                  ctrl_dout_valid_reg <= '1';
                  ctrl_complete_reg <= cnti_end_i AND cntj_end_i;
               -- RD/WR S
               WHEN S12 => 
                  ctrl_dout_reg <= ds_i;
                  ctrl_dout_valid_reg <= '1';
                  ctrl_complete_reg <= cnti_end_i;
               -- RD/WR Y
               WHEN S22 => 
                  ctrl_dout_reg <= dy_i;
                  ctrl_dout_valid_reg <= '1';
                  ctrl_complete_reg <= cntj_end_i;
               -- RD/WR BIAS
               WHEN S32 => 
                  ctrl_dout_reg <= dbias_i;
                  ctrl_dout_valid_reg <= '1';
                  ctrl_complete_reg <= cntj_end_i;
               -- RD/WR T
               WHEN S42 => 
                  ctrl_dout_reg <= dt_i;
                  ctrl_dout_valid_reg <= '1';
                  ctrl_complete_reg <= cntj_end_i;
               -- Dummy cycles to
               -- equalize latency.
               WHEN S03 => 
                  ctrl_rdlat_reg <= '0' & ctrl_rdlat_reg ( MEM_LAT_CNT_WIDTH - 1 downto 1 );
                  ctrl_wrlat_reg <= '0' & ctrl_wrlat_reg ( MEM_LAT_CNT_WIDTH - 1 downto 1 );
               WHEN OTHERS =>
                  NULL;
            END CASE;
         END IF;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      ctrl_rd_vec_i,
      ctrl_rdlat_reg,
      ctrl_rdy7_i,
      ctrl_start_reg,
      ctrl_wrlat_reg,
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         -- Wait for next
         -- RD/WR.
         WHEN S01 => 
            IF (ctrl_start_reg = '1' AND
                 (ctrl_rd_vec_i( MEM_W_BITPOS ) = '1')) THEN 
               next_state <= S02;
            ELSIF (ctrl_start_reg = '1' AND
                    (ctrl_rd_vec_i( MEM_S_BITPOS ) = '1')) THEN 
               next_state <= S12;
            ELSIF (ctrl_start_reg = '1' AND
                    (ctrl_rd_vec_i( MEM_Y_BITPOS ) = '1')) THEN 
               next_state <= S22;
            ELSIF (ctrl_start_reg = '1' AND
                    (ctrl_rd_vec_i( MEM_BIAS_BITPOS ) = '1')) THEN 
               next_state <= S32;
            ELSIF (ctrl_start_reg = '1' AND
                    (ctrl_rd_vec_i( MEM_T_BITPOS ) = '1')) THEN 
               next_state <= S42;
            ELSE
               next_state <= S01;
            END IF;
         -- RD/WR W
         WHEN S02 => 
            next_state <= S03;
         -- RD/WR S
         WHEN S12 => 
            next_state <= S03;
         -- RD/WR Y
         WHEN S22 => 
            next_state <= S03;
         -- RD/WR BIAS
         WHEN S32 => 
            next_state <= S03;
         -- RD/WR T
         WHEN S42 => 
            next_state <= S03;
         -- Dummy cycles to
         -- equalize latency.
         WHEN S03 => 
            IF (unsigned ( ctrl_rdlat_reg ) <= 3 AND
                unsigned ( ctrl_wrlat_reg ) <= 3) THEN 
               next_state <= S01;
            ELSE
               next_state <= S03;
            END IF;
         -- Reset state
         WHEN S00 => 
            IF (ctrl_rdy7_i = '1') THEN 
               next_state <= S01;
            ELSE
               next_state <= S00;
            END IF;
         WHEN OTHERS =>
            next_state <= S00;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      cnti_end_i,
      ctrl_complete_reg,
      ctrl_din_i,
      ctrl_dout_reg,
      ctrl_dout_valid_reg,
      ctrl_wr_vec_i,
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      cnteni_o <= '0';
      cntenj_o <= '0';
      ctrl_complete_o <= ctrl_complete_reg;
      ctrl_dout_o <= ctrl_dout_reg;
      ctrl_dout_valid_o <= ctrl_dout_valid_reg;
      ctrl_rdy_o <= '0';
      dout_o <= (others => '0');
      we_bias_o <= '0';
      we_s_o <= '0';
      we_t_o <= '0';
      we_w_o <= '0';
      we_y_o <= '0';

      -- Combined Actions
      CASE current_state IS
         -- Wait for next
         -- RD/WR.
         WHEN S01 => 
            ctrl_rdy_o <= '1';
         -- RD/WR W
         WHEN S02 => 
            cnteni_o <= '1';
            cntenj_o <= cnti_end_i;
            dout_o <= ctrl_din_i;
            we_w_o <= ctrl_wr_vec_i( MEM_W_BITPOS );
         -- RD/WR S
         WHEN S12 => 
            cnteni_o <= '1';
            dout_o <= ctrl_din_i;
            we_s_o <= ctrl_wr_vec_i( MEM_S_BITPOS );
         -- RD/WR Y
         WHEN S22 => 
            cntenj_o <= '1';
            dout_o <= ctrl_din_i;
            we_y_o <= ctrl_wr_vec_i( MEM_Y_BITPOS );
         -- RD/WR BIAS
         WHEN S32 => 
            cntenj_o <= '1';
            dout_o <= ctrl_din_i;
            we_bias_o <= ctrl_wr_vec_i( MEM_BIAS_BITPOS );
         -- RD/WR T
         WHEN S42 => 
            cntenj_o <= '1';
            dout_o <= ctrl_din_i;
            we_t_o <= ctrl_wr_vec_i( MEM_T_BITPOS );
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;
