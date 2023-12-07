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

ENTITY p0300_m00028_s_v02_latency_fsm IS
   PORT( 
      clk_i         : IN     std_logic;
      dw_i          : IN     DATA_T;
      rst_n_i       : IN     std_logic;
      cnt_alllat_o  : OUT    MEM_LAT_CNT_WIDTH_T;
      cnteni_o      : OUT    std_logic;
      cntenj_o      : OUT    std_logic;
      ctrl_memerr_o : OUT    std_logic;
      ctrl_rdlat_o  : OUT    MEM_LAT_CNT_WIDTH_T;
      ctrl_rdy_o    : OUT    std_logic;
      ctrl_run_o    : OUT    std_logic;
      ctrl_wrlat_o  : OUT    MEM_LAT_CNT_WIDTH_T;
      dout_o        : OUT    DATA_T;
      we_w_o        : OUT    std_logic
   );

-- Declarations

END p0300_m00028_s_v02_latency_fsm ;
-- COPYRIGHT (C) 2022 Jens Gutschmidt /
-- VIVARE GmbH Switzerland
-- (email: opencores@vivare-services.com)
-- 
-- Versions:
-- Revision 2.0  2022/07/04
-- - Introsuced latency for write
-- Revision 1.0  2022/07/02
-- -- First draft
-- 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
--USE ieee.numeric_std.all;
LIBRARY work;
USE work.memory_vhd_v03_pkg.ALL;
 
ARCHITECTURE fsm OF p0300_m00028_s_v02_latency_fsm IS

   -- Architecture Declarations
   SIGNAL cnt_alllat_reg : MEM_LAT_CNT_WIDTH_T;  
   SIGNAL ctrl_memerr_reg : std_logic;  
   SIGNAL ctrl_rdlat_reg : MEM_LAT_CNT_WIDTH_T;  
   SIGNAL ctrl_rdy_reg : std_logic;  
   SIGNAL ctrl_run_reg : std_logic;  
   SIGNAL ctrl_wrlat_reg : MEM_LAT_CNT_WIDTH_T;  
   SIGNAL dw_reg : DATA_T;  

   TYPE STATE_TYPE IS (
      S00,
      S01,
      S02,
      S03,
      S04,
      S06,
      S05,
      S08,
      SERR,
      S07,
      SRDY,
      S11,
      S7,
      S8
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
            cnt_alllat_reg <= (others => '0');
            ctrl_memerr_reg <= '0';
            ctrl_rdlat_reg <= (others => '0');
            ctrl_rdy_reg <= '0';
            ctrl_run_reg <= '0';
            ctrl_wrlat_reg <= (others => '0');
            dw_reg <= (others => '0');
         ELSE
            current_state <= next_state;
            -- Default Assignment To Internals
            cnt_alllat_reg <= cnt_alllat_reg;
            ctrl_memerr_reg <= ctrl_memerr_reg;
            ctrl_rdlat_reg <= ctrl_rdlat_reg;
            ctrl_rdy_reg <= ctrl_rdy_reg;
            ctrl_run_reg <= ctrl_run_reg;
            ctrl_wrlat_reg <= ctrl_wrlat_reg;
            dw_reg <= dw_i;

            -- Combined Actions
            CASE current_state IS
               -- Reset state
               WHEN S00 => 
                  ctrl_run_reg <= '1';
                  ctrl_rdy_reg <= '0';
               -- Init values
               WHEN S01 => 
                  ctrl_wrlat_reg <= (others => '0');
                  ctrl_memerr_reg <= '0';
               -- Wait for max
               -- latency
               WHEN S03 => 
                  ctrl_wrlat_reg <= ctrl_wrlat_reg ( MEM_LAT_CNT_WIDTH-2 downto 0 ) & '1';
               -- Last address
               -- [1][1]
               WHEN S04 => 
                  ctrl_wrlat_reg <= (others => '0');
               -- Write -1 to
               -- last address
               -- [1][1]
               WHEN S06 => 
                  ctrl_wrlat_reg <= (others => '0');
               -- Wait for max
               -- latency
               WHEN S05 => 
                  ctrl_wrlat_reg <= ctrl_wrlat_reg ( MEM_LAT_CNT_WIDTH-2 downto 0 ) & '1';
               -- Release END
               -- conditions (for)
               WHEN S08 => 
                  cnt_alllat_reg <= (others => '0');
                  ctrl_wrlat_reg <= (others => '0');
                  ctrl_rdlat_reg <= (others => '0');
               -- Memory
               -- ERROR
               WHEN SERR => 
                  ctrl_memerr_reg <= '1';
                  ctrl_run_reg <= '0';
               -- Wait for max
               -- latency
               WHEN S07 => 
                  ctrl_wrlat_reg <= ctrl_wrlat_reg ( MEM_LAT_CNT_WIDTH-2 downto 0 ) & '1';
               -- END / READY
               -- state
               WHEN SRDY => 
                  ctrl_rdy_reg <= '1';
                  ctrl_run_reg <= '0';
               -- Address [0][0]
               -- reaches memory
               -- WS=1...max
               WHEN S11 => 
                  cnt_alllat_reg <= unsigned (cnt_alllat_reg) + 1;
                  ctrl_rdlat_reg <= ctrl_rdlat_reg ( MEM_LAT_CNT_WIDTH-2 downto 0 ) & '1';
                  IF (signed (dw_reg) = 0) THEN 
                     cnt_alllat_reg <= cnt_alllat_reg;
                     ctrl_rdlat_reg <= ctrl_rdlat_reg;
                  END IF;
               -- Wait for
               -- dw_i = -1
               WHEN S8 => 
                  ctrl_wrlat_reg <= ctrl_wrlat_reg ( MEM_LAT_CNT_WIDTH-2 downto 0 ) & '1';
                  IF (signed (dw_reg) = -1) THEN 
                     ctrl_wrlat_reg <= ctrl_wrlat_reg;
                  END IF;
               WHEN OTHERS =>
                  NULL;
            END CASE;
         END IF;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      ctrl_rdlat_reg,
      ctrl_wrlat_reg,
      current_state,
      dw_reg
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         -- Reset state
         WHEN S00 => 
            next_state <= S01;
         -- Init values
         WHEN S01 => 
            next_state <= S02;
         -- Write 0 to
         -- first address
         -- [0][0]
         WHEN S02 => 
            next_state <= S03;
         -- Wait for max
         -- latency
         WHEN S03 => 
            IF (signed (ctrl_wrlat_reg) = -1) THEN 
               next_state <= S04;
            ELSE
               next_state <= S03;
            END IF;
         -- Last address
         -- [1][1]
         WHEN S04 => 
            next_state <= S05;
         -- Write -1 to
         -- last address
         -- [1][1]
         WHEN S06 => 
            next_state <= S07;
         -- Wait for max
         -- latency
         WHEN S05 => 
            IF (signed (ctrl_wrlat_reg) = -1) THEN 
               next_state <= S06;
            ELSE
               next_state <= S05;
            END IF;
         -- Release END
         -- conditions (for)
         WHEN S08 => 
            IF (signed (dw_reg) = -1) THEN 
               next_state <= S11;
            ELSE
               -- -1 not read on dw
               -- after max latency
               -- time causes ERROR
               next_state <= SERR;
            END IF;
         -- Memory
         -- ERROR
         WHEN SERR => 
            next_state <= SERR;
         -- Wait for max
         -- latency
         WHEN S07 => 
            IF (signed (ctrl_wrlat_reg) = -1) THEN 
               next_state <= S08;
            ELSE
               next_state <= S07;
            END IF;
         -- END / READY
         -- state
         WHEN SRDY => 
            next_state <= SRDY;
         -- Address [0][0]
         -- reaches memory
         -- WS=1...max
         WHEN S11 => 
            IF (signed (dw_reg) = 0) THEN 
               next_state <= S7;
            ELSIF (signed (ctrl_rdlat_reg) = -1) THEN 
               next_state <= SERR;
            ELSE
               next_state <= S11;
            END IF;
         -- Write -1 to
         -- last address
         -- [1][1]
         WHEN S7 => 
            next_state <= S8;
         -- Wait for
         -- dw_i = -1
         WHEN S8 => 
            IF (signed (dw_reg) = -1) THEN 
               next_state <= SRDY;
            ELSIF (signed (ctrl_wrlat_reg) = -1) THEN 
               next_state <= SERR;
            ELSE
               next_state <= S8;
            END IF;
         WHEN OTHERS =>
            next_state <= S00;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      cnt_alllat_reg,
      ctrl_memerr_reg,
      ctrl_rdlat_reg,
      ctrl_rdy_reg,
      ctrl_run_reg,
      ctrl_wrlat_reg,
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      cnt_alllat_o <= cnt_alllat_reg;
      cnteni_o <= '0';
      cntenj_o <= '0';
      ctrl_memerr_o <= ctrl_memerr_reg;
      ctrl_rdlat_o <= ctrl_rdlat_reg;
      ctrl_rdy_o <= ctrl_rdy_reg;
      ctrl_run_o <= ctrl_run_reg;
      ctrl_wrlat_o <= ctrl_wrlat_reg;
      dout_o <= (others => '0');
      we_w_o <= '0';

      -- Combined Actions
      CASE current_state IS
         -- Write 0 to
         -- first address
         -- [0][0]
         WHEN S02 => 
            dout_o <= (others => '0');
            we_w_o <= '1';
         -- Last address
         -- [1][1]
         WHEN S04 => 
            cnteni_o <= '1';
            cntenj_o <= '1';
         -- Write -1 to
         -- last address
         -- [1][1]
         WHEN S06 => 
            dout_o <= (others => '1');
            we_w_o <= '1';
         -- Release END
         -- conditions (for)
         WHEN S08 => 
            cnteni_o <= '1';
            cntenj_o <= '1';
         -- Write -1 to
         -- last address
         -- [1][1]
         WHEN S7 => 
            dout_o <= (others => '1');
            we_w_o <= '1';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;
