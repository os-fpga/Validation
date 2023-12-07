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

ENTITY p0300_m00025_s_v02_init_fsm IS
   PORT( 
      clk_i        : IN     std_logic;
      cnti_end_i   : IN     std_logic;
      cntj_end_i   : IN     std_logic;
      ctrl_bias_i  : IN     DATA_T;
      ctrl_rdlat_i : IN     MEM_LAT_CNT_WIDTH_T;
      ctrl_rdy7_i  : IN     std_logic;
      ctrl_start_i : IN     std_logic;
      ctrl_wrlat_i : IN     MEM_LAT_CNT_WIDTH_T;
      rst_n_i      : IN     std_logic;
      cnteni_o     : OUT    std_logic;
      cntenj_o     : OUT    std_logic;
      ctrl_rdy_o   : OUT    std_logic;
      dout_o       : OUT    DATA_T;
      we_bias_o    : OUT    std_logic;
      we_s_o       : OUT    std_logic;
      we_t_o       : OUT    std_logic;
      we_w_o       : OUT    std_logic;
      we_y_o       : OUT    std_logic
   );

-- Declarations

END p0300_m00025_s_v02_init_fsm ;
-- COPYRIGHT (C) 2022 Jens Gutschmidt /
-- VIVARE GmbH Switzerland
-- (email: opencores@vivare-services.com)
-- 
-- Versions:
-- Revision 2.0  2022/07/03
-- - Introduced latency for write
-- Revision 1.0  2022/06/12
-- -- First draft
-- 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
--USE ieee.numeric_std.all;
LIBRARY work;
USE work.memory_vhd_v03_pkg.ALL;
 
ARCHITECTURE fsm OF p0300_m00025_s_v02_init_fsm IS

   -- Architecture Declarations
   SIGNAL ctrl_rdlat_reg : MEM_LAT_CNT_WIDTH_T;  
   SIGNAL ctrl_start_reg : std_logic;  
   SIGNAL ctrl_wrlat_reg : MEM_LAT_CNT_WIDTH_T;  

   TYPE STATE_TYPE IS (
      S00,
      S06,
      S02,
      S03,
      S04,
      S01,
      S08,
      S07,
      S05
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
            ctrl_rdlat_reg <= (others => '0');
            ctrl_start_reg <= '0';
            ctrl_wrlat_reg <= (others => '0');
         ELSE
            current_state <= next_state;
            -- Default Assignment To Internals
            ctrl_rdlat_reg <= ctrl_rdlat_reg;
            ctrl_start_reg <= ctrl_start_i;
            ctrl_wrlat_reg <= ctrl_wrlat_reg;

            -- Combined Actions
            CASE current_state IS
               -- Write W, S. Next i.
               -- S also on j-path
               WHEN S04 => 
                  ctrl_rdlat_reg <= ctrl_rdlat_i;
                  ctrl_wrlat_reg <= ctrl_wrlat_i;
               -- Dummy cycles to
               -- equalize latency.
               -- End-path
               WHEN S08 => 
                  ctrl_rdlat_reg <= '0' & ctrl_rdlat_reg ( MEM_LAT_CNT_WIDTH - 1 downto 1 );
               -- Dummy cycles to
               -- equalize latency.
               -- j-path
               WHEN S07 => 
                  ctrl_rdlat_reg <= '0' & ctrl_rdlat_reg ( MEM_LAT_CNT_WIDTH - 1 downto 1 );
               -- Dummy cycles to
               -- equalize latency.
               -- i-path
               WHEN S05 => 
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
      cnti_end_i,
      cntj_end_i,
      ctrl_rdlat_reg,
      ctrl_rdy7_i,
      ctrl_start_reg,
      ctrl_wrlat_reg,
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         -- Reset state
         WHEN S00 => 
            IF (ctrl_rdy7_i = '1') THEN 
               next_state <= S01;
            ELSE
               next_state <= S00;
            END IF;
         -- Next j
         WHEN S06 => 
            IF (cntj_end_i = '1') THEN 
               next_state <= S08;
            ELSE
               next_state <= S07;
            END IF;
         -- Write BIAS
         WHEN S02 => 
            next_state <= S03;
         -- Write T and Y
         WHEN S03 => 
            next_state <= S04;
         -- Write W, S. Next i.
         -- S also on j-path
         WHEN S04 => 
            IF (cnti_end_i = '1') THEN 
               next_state <= S06;
            ELSE
               next_state <= S05;
            END IF;
         -- Wait for next
         -- INIT request
         WHEN S01 => 
            IF (ctrl_start_reg = '1') THEN 
               next_state <= S02;
            ELSE
               next_state <= S01;
            END IF;
         -- Dummy cycles to
         -- equalize latency.
         -- End-path
         WHEN S08 => 
            IF (unsigned ( ctrl_rdlat_reg ) <= 7) THEN 
               next_state <= S01;
            ELSE
               next_state <= S08;
            END IF;
         -- Dummy cycles to
         -- equalize latency.
         -- j-path
         WHEN S07 => 
            IF (unsigned ( ctrl_rdlat_reg ) <= 7) THEN 
               next_state <= S02;
            ELSE
               next_state <= S07;
            END IF;
         -- Dummy cycles to
         -- equalize latency.
         -- i-path
         WHEN S05 => 
            IF (unsigned ( ctrl_rdlat_reg ) <= 7 AND
                unsigned ( ctrl_wrlat_reg ) <= 7) THEN 
               next_state <= S04;
            ELSE
               next_state <= S05;
            END IF;
         WHEN OTHERS =>
            next_state <= S00;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      ctrl_bias_i,
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      cnteni_o <= '0';
      cntenj_o <= '0';
      ctrl_rdy_o <= '0';
      dout_o <= (others => '0');
      we_bias_o <= '0';
      we_s_o <= '0';
      we_t_o <= '0';
      we_w_o <= '0';
      we_y_o <= '0';

      -- Combined Actions
      CASE current_state IS
         -- Next j
         WHEN S06 => 
            cntenj_o <= '1';
         -- Write BIAS
         WHEN S02 => 
            dout_o <= ctrl_bias_i;
            we_bias_o <= '1';
         -- Write T and Y
         WHEN S03 => 
            dout_o <= (others => '0');
            we_t_o <= '1';
            we_y_o <= '1';
         -- Write W, S. Next i.
         -- S also on j-path
         WHEN S04 => 
            dout_o <= (others => '0');
            we_w_o <= '1';
            we_s_o <= '1';
            cnteni_o <= '1';
         -- Wait for next
         -- INIT request
         WHEN S01 => 
            ctrl_rdy_o <= '1';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;
