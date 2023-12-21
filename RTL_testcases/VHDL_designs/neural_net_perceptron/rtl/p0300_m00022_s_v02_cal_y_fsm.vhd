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

ENTITY p0300_m00022_s_v02_cal_y_fsm IS
   PORT( 
      clk_i        : IN     std_logic;
      cnti_end_i   : IN     std_logic;
      cntj_end_i   : IN     std_logic;
      ctrl_rdlat_i : IN     MEM_LAT_CNT_WIDTH_T;
      ctrl_rdy7_i  : IN     std_logic;
      ctrl_start_i : IN     std_logic;
      ctrl_thres_i : IN     DATA_T;
      ctrl_wrlat_i : IN     MEM_LAT_CNT_WIDTH_T;
      dbias_i      : IN     DATA_T;
      ds_i         : IN     DATA_T;
      dw_i         : IN     DATA_T;
      rst_n_i      : IN     std_logic;
      cnteni_o     : OUT    std_logic;
      cntenj_o     : OUT    std_logic;
      ctrl_rdy_o   : OUT    std_logic;
      dout_o       : OUT    DATA_T;
      we_y_o       : OUT    std_logic
   );

-- Declarations

END p0300_m00022_s_v02_cal_y_fsm ;
-- COPYRIGHT (C) 2022 Jens Gutschmidt /
-- VIVARE GmbH Switzerland
-- (email: opencores@vivare-services.com)
-- 
-- Versions:
-- Revision 2.0  2022/07/04
-- - Introduced latency for write
-- Revision 1.0  2022/06/25
-- -- First draft
-- 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
--USE ieee.numeric_std.all;
LIBRARY work;
USE work.memory_vhd_v03_pkg.ALL;
 
ARCHITECTURE fsm OF p0300_m00022_s_v02_cal_y_fsm IS

   -- Architecture Declarations
   SIGNAL ctrl_rdlat_reg : MEM_LAT_CNT_WIDTH_T;  
   SIGNAL ctrl_start_reg : std_logic;  
   SIGNAL ctrl_wrlat_reg : MEM_LAT_CNT_WIDTH_T;  
   SIGNAL dbias_reg : DATA_T;  
   SIGNAL dw_reg : DATA_T;  
   SIGNAL y_inj_reg : DATA_T;  

   TYPE STATE_TYPE IS (
      S00,
      S03,
      S02,
      S05,
      S04,
      S07,
      S08,
      S10,
      S11,
      S12,
      S13,
      S01,
      S16,
      S06,
      S15,
      S09,
      S14
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
            dbias_reg <= (others => '0');
            dw_reg <= (others => '0');
            y_inj_reg <= (others => '0');
         ELSE
            current_state <= next_state;
            -- Default Assignment To Internals
            ctrl_rdlat_reg <= ctrl_rdlat_reg;
            ctrl_start_reg <= ctrl_start_i;
            ctrl_wrlat_reg <= ctrl_wrlat_reg;
            dbias_reg <= dbias_i;
            dw_reg <= dw_i;
            y_inj_reg <= y_inj_reg;

            -- Combined Actions
            CASE current_state IS
               -- ADD if
               -- ds GT 0
               WHEN S03 => 
                  --y_inj_reg <= signed (y_inj_reg) + signed (dw_i);
                  y_inj_reg <= signed (y_inj_reg) + signed (dw_reg);
               -- Replacement of multiplication.
               -- y_inj calculation and increment
               -- i-address.
               WHEN S02 => 
                  ctrl_rdlat_reg <= ctrl_rdlat_i;
               -- SUB if
               -- ds LT 0
               WHEN S05 => 
                  --y_inj_reg <= signed (y_inj_reg) - signed (dw_i);
                  y_inj_reg <= signed (y_inj_reg) - signed (dw_reg);
               -- Dummy cycles.
               -- Loop path for
               -- next y_inj-value..
               WHEN S07 => 
                  ctrl_rdlat_reg <= '0' & ctrl_rdlat_reg ( MEM_LAT_CNT_WIDTH - 1 downto 1 );
               -- Update y_inj-value
               -- with bias
               WHEN S08 => 
                  --y_inj_reg <= (signed (y_inj_reg)) + (signed (dbias_i));
                  y_inj_reg <= (signed (y_inj_reg)) + (signed (dbias_reg));
               -- Replacement of
               -- multiplication.
               -- y calculation.
               WHEN S10 => 
                  ctrl_wrlat_reg <= ctrl_wrlat_i;
               -- Larency counter.
               -- Return path last j
               WHEN S16 => 
                  ctrl_rdlat_reg <= '0' & ctrl_rdlat_reg ( MEM_LAT_CNT_WIDTH - 1 downto 1 );
               -- Dummy cycles to
               -- equalize latency.
               WHEN S06 => 
                  ctrl_rdlat_reg <= '0' & ctrl_rdlat_reg ( MEM_LAT_CNT_WIDTH - 1 downto 1 );
               -- Increment
               -- j-address
               WHEN S15 => 
                  y_inj_reg <= (others => '0');
                  ctrl_rdlat_reg <= ctrl_rdlat_i;
               -- Dummy cycles to
               -- equalize latency.
               WHEN S09 => 
                  ctrl_rdlat_reg <= '0' & ctrl_rdlat_reg ( MEM_LAT_CNT_WIDTH - 1 downto 1 );
               -- Dummy cycles to
               -- equalize latency.
               WHEN S14 => 
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
      ctrl_thres_i,
      ctrl_wrlat_reg,
      current_state,
      ds_i,
      y_inj_reg
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
         -- ADD if
         -- ds GT 0
         WHEN S03 => 
            next_state <= S06;
         -- Replacement of multiplication.
         -- y_inj calculation and increment
         -- i-address.
         WHEN S02 => 
            IF (cnti_end_i = '1') THEN 
               next_state <= S08;
            ELSIF (signed (ds_i) > 0) THEN 
               next_state <= S03;
            ELSIF (signed (ds_i) < 0) THEN 
               next_state <= S05;
            ELSE
               next_state <= S04;
            END IF;
         -- SUB if
         -- ds LT 0
         WHEN S05 => 
            next_state <= S06;
         -- No function
         -- if ds EQ 0
         WHEN S04 => 
            next_state <= S06;
         -- Dummy cycles.
         -- Loop path for
         -- next y_inj-value..
         WHEN S07 => 
            IF (unsigned ( ctrl_rdlat_reg ) <= 3) THEN 
               next_state <= S02;
            ELSE
               next_state <= S07;
            END IF;
         -- Update y_inj-value
         -- with bias
         WHEN S08 => 
            next_state <= S09;
         -- Replacement of
         -- multiplication.
         -- y calculation.
         WHEN S10 => 
            IF (signed (y_inj_reg) < signed (ctrl_thres_i)) THEN 
               next_state <= S11;
            ELSIF (signed (y_inj_reg) > signed (ctrl_thres_i)) THEN 
               next_state <= S13;
            ELSE
               next_state <= S12;
            END IF;
         -- ADD if
         -- y_inj GT thres
         WHEN S11 => 
            next_state <= S14;
         -- No function if
         -- y_inj EQ thres
         WHEN S12 => 
            next_state <= S14;
         -- SUB if
         -- y_inj LT thres
         WHEN S13 => 
            next_state <= S14;
         -- Wait for next
         -- calculation of
         -- y-values
         WHEN S01 => 
            IF (ctrl_start_reg = '1') THEN 
               next_state <= S02;
            ELSE
               next_state <= S01;
            END IF;
         -- Larency counter.
         -- Return path last j
         WHEN S16 => 
            IF (unsigned ( ctrl_rdlat_reg ) <= 3) THEN 
               next_state <= S01;
            ELSE
               next_state <= S16;
            END IF;
         -- Dummy cycles to
         -- equalize latency.
         WHEN S06 => 
            IF (unsigned ( ctrl_rdlat_reg ) <= 7) THEN 
               next_state <= S02;
            ELSE
               next_state <= S06;
            END IF;
         -- Increment
         -- j-address
         WHEN S15 => 
            IF (cntj_end_i = '1') THEN 
               next_state <= S16;
            ELSE
               next_state <= S07;
            END IF;
         -- Dummy cycles to
         -- equalize latency.
         WHEN S09 => 
            IF (unsigned ( ctrl_rdlat_reg ) <= 7) THEN 
               next_state <= S10;
            ELSE
               next_state <= S09;
            END IF;
         -- Dummy cycles to
         -- equalize latency.
         WHEN S14 => 
            IF (unsigned ( ctrl_wrlat_reg ) <= 3) THEN 
               next_state <= S15;
            ELSE
               next_state <= S14;
            END IF;
         WHEN OTHERS =>
            next_state <= S00;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      cnteni_o <= '0';
      cntenj_o <= '0';
      ctrl_rdy_o <= '0';
      dout_o <= (others => '0');
      we_y_o <= '0';

      -- Combined Actions
      CASE current_state IS
         -- Replacement of multiplication.
         -- y_inj calculation and increment
         -- i-address.
         WHEN S02 => 
            cnteni_o <= '1';
         -- ADD if
         -- y_inj GT thres
         WHEN S11 => 
            dout_o <= (others => '1');
            we_y_o <= '1';
         -- No function if
         -- y_inj EQ thres
         WHEN S12 => 
            dout_o <= (others => '0');
            we_y_o <= '1';
         -- SUB if
         -- y_inj LT thres
         WHEN S13 => 
            dout_o(0) <= '1';
            we_y_o <= '1';
         -- Wait for next
         -- calculation of
         -- y-values
         WHEN S01 => 
            ctrl_rdy_o <= '1';
         -- Increment
         -- j-address
         WHEN S15 => 
            cntenj_o <= '1';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;
