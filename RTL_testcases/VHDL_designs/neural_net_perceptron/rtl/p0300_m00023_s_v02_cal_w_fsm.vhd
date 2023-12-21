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

ENTITY p0300_m00023_s_v02_cal_w_fsm IS
   PORT( 
      clk_i        : IN     std_logic;
      cnti_end_i   : IN     std_logic;
      cntj_end_i   : IN     std_logic;
      ctrl_rdlat_i : IN     MEM_LAT_CNT_WIDTH_T;
      ctrl_rdy7_i  : IN     std_logic;
      ctrl_start_i : IN     std_logic;
      ctrl_wrlat_i : IN     MEM_LAT_CNT_WIDTH_T;
      dbias_i      : IN     DATA_T;
      ds_i         : IN     DATA_T;
      dt_i         : IN     DATA_T;
      dw_i         : IN     DATA_T;
      dy_i         : IN     DATA_T;
      rst_n_i      : IN     std_logic;
      cnteni_o     : OUT    std_logic;
      cntenj_o     : OUT    std_logic;
      ctrl_rdy_o   : OUT    std_logic;
      ctrl_wchgd_o : OUT    std_logic;
      dout_o       : OUT    DATA_T;
      we_bias_o    : OUT    std_logic;
      we_w_o       : OUT    std_logic
   );

-- Declarations

END p0300_m00023_s_v02_cal_w_fsm ;
-- COPYRIGHT (C) 2022 Jens Gutschmidt /
-- VIVARE GmbH Switzerland
-- (email: opencores@vivare-services.com)
-- 
-- Versions:
-- Revision 2.0  2022/07/02
-- - Introduced latency for write
-- Revision 1.0  2022/06/29
-- -- First draft
-- 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
--USE ieee.numeric_std.all;
LIBRARY work;
USE work.memory_vhd_v03_pkg.ALL;
 
ARCHITECTURE fsm OF p0300_m00023_s_v02_cal_w_fsm IS

   -- Architecture Declarations
   SIGNAL ctrl_rdlat_reg : MEM_LAT_CNT_WIDTH_T;  
   SIGNAL ctrl_start_reg : std_logic;  
   SIGNAL ctrl_wchgd_reg : std_logic;  
   SIGNAL ctrl_wrlat_reg : MEM_LAT_CNT_WIDTH_T;  
   SIGNAL dbias_reg : DATA_T;  
   SIGNAL dt_reg : DATA_T;  
   SIGNAL dw_reg : DATA_T;  

   TYPE STATE_TYPE IS (
      S00,
      S14,
      S06,
      S05,
      S08,
      S07,
      S11,
      S13,
      S03,
      S12,
      S04,
      S15,
      S01,
      S02,
      S10,
      S09
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
            ctrl_wchgd_reg <= '0';
            ctrl_wrlat_reg <= (others => '0');
            dbias_reg <= (others => '0');
            dt_reg <= (others => '0');
            dw_reg <= (others => '0');
         ELSE
            current_state <= next_state;
            -- Default Assignment To Internals
            ctrl_rdlat_reg <= ctrl_rdlat_reg;
            ctrl_start_reg <= ctrl_start_i;
            ctrl_wchgd_reg <= ctrl_wchgd_reg;
            ctrl_wrlat_reg <= ctrl_wrlat_reg;
            dbias_reg <= dbias_i;
            dt_reg <= dt_i;
            dw_reg <= dw_i;

            -- Combined Actions
            CASE current_state IS
               -- Larency counter.
               -- Loop path for
               -- next w-/bias-value..
               WHEN S14 => 
                  ctrl_rdlat_reg <= '0' & ctrl_rdlat_reg ( MEM_LAT_CNT_WIDTH - 1 downto 1 );
               -- Replacement of
               -- multiplication.
               -- W matrix calculation.
               WHEN S05 => 
                  ctrl_rdlat_reg <= ctrl_rdlat_i;
                  ctrl_wrlat_reg <= ctrl_wrlat_i;
               -- Larency counter.
               -- Loop path for
               -- next w-value.
               WHEN S11 => 
                  ctrl_rdlat_reg <= '0' & ctrl_rdlat_reg ( MEM_LAT_CNT_WIDTH - 1 downto 1 );
               -- Increment
               -- j-address
               WHEN S13 => 
                  ctrl_rdlat_reg <= ctrl_rdlat_i;
               -- w-value 
               -- changed.
               -- Last i
               WHEN S12 => 
                  ctrl_wchgd_reg <= '1';
               -- Larency counter.
               -- Return path last j
               WHEN S15 => 
                  ctrl_rdlat_reg <= '0' & ctrl_rdlat_reg ( MEM_LAT_CNT_WIDTH - 1 downto 1 );
               -- Reset "w-value
               -- changed"
               WHEN S02 => 
                  ctrl_wchgd_reg <= '0';
               -- Dummy cycles to
               -- equalize latency.
               WHEN S09 => 
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
      current_state,
      ds_i,
      dt_i,
      dy_i
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
         -- Larency counter.
         -- Loop path for
         -- next w-/bias-value..
         WHEN S14 => 
            IF (unsigned ( ctrl_rdlat_reg ) <= 3) THEN 
               next_state <= S03;
            ELSE
               next_state <= S14;
            END IF;
         -- ADD if
         -- ds GT 0
         WHEN S06 => 
            next_state <= S09;
         -- Replacement of
         -- multiplication.
         -- W matrix calculation.
         WHEN S05 => 
            IF (signed (ds_i) > 0) THEN 
               next_state <= S06;
            ELSIF (signed (ds_i) < 0) THEN 
               next_state <= S08;
            ELSE
               next_state <= S07;
            END IF;
         -- SUB if
         -- ds LT 0
         WHEN S08 => 
            next_state <= S09;
         -- No function
         -- if ds EQ 0
         WHEN S07 => 
            next_state <= S09;
         -- Larency counter.
         -- Loop path for
         -- next w-value.
         WHEN S11 => 
            IF (unsigned ( ctrl_rdlat_reg ) <= 3) THEN 
               next_state <= S05;
            ELSE
               next_state <= S11;
            END IF;
         -- Increment
         -- j-address
         WHEN S13 => 
            IF (cntj_end_i = '1') THEN 
               next_state <= S15;
            ELSE
               next_state <= S14;
            END IF;
         -- Test for
         -- dt EQ dy
         WHEN S03 => 
            IF (dt_i = dy_i) THEN 
               next_state <= S13;
            ELSE
               next_state <= S04;
            END IF;
         -- w-value 
         -- changed.
         -- Last i
         WHEN S12 => 
            next_state <= S13;
         -- Compute
         -- new bias
         WHEN S04 => 
            next_state <= S05;
         -- Larency counter.
         -- Return path last j
         WHEN S15 => 
            IF (unsigned ( ctrl_rdlat_reg ) <= 3) THEN 
               next_state <= S01;
            ELSE
               next_state <= S15;
            END IF;
         -- Wait for next
         -- calculation of
         -- w-/bias-values
         WHEN S01 => 
            IF (ctrl_start_reg = '1') THEN 
               next_state <= S02;
            ELSE
               next_state <= S01;
            END IF;
         -- Reset "w-value
         -- changed"
         WHEN S02 => 
            next_state <= S03;
         -- Increment
         -- i-address
         WHEN S10 => 
            IF (cnti_end_i = '1') THEN 
               next_state <= S12;
            ELSE
               next_state <= S11;
            END IF;
         -- Dummy cycles to
         -- equalize latency.
         WHEN S09 => 
            IF (unsigned ( ctrl_wrlat_reg ) <= 3) THEN 
               next_state <= S10;
            ELSE
               next_state <= S09;
            END IF;
         WHEN OTHERS =>
            next_state <= S00;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      ctrl_wchgd_reg,
      current_state,
      dbias_reg,
      dt_reg,
      dw_reg
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      cnteni_o <= '0';
      cntenj_o <= '0';
      ctrl_rdy_o <= '0';
      ctrl_wchgd_o <= ctrl_wchgd_reg;
      dout_o <= (others => '0');
      we_bias_o <= '0';
      we_w_o <= '0';

      -- Combined Actions
      CASE current_state IS
         -- ADD if
         -- ds GT 0
         WHEN S06 => 
            --dout_o <= signed (dw_i) + signed (dt_i);
            dout_o <= signed (dw_reg) + signed (dt_reg);
            we_w_o <= '1';
         -- SUB if
         -- ds LT 0
         WHEN S08 => 
            --dout_o <= signed (dw_i) - signed (dt_i);
            dout_o <= signed (dw_reg) - signed (dt_reg);
            we_w_o <= '1';
         -- Increment
         -- j-address
         WHEN S13 => 
            cntenj_o <= '1';
         -- Compute
         -- new bias
         WHEN S04 => 
            --dout_o <= signed (dbias_i) + signed (dt_i);
            dout_o <= signed (dbias_reg) + signed (dt_reg);
            we_bias_o <= '1';
         -- Wait for next
         -- calculation of
         -- w-/bias-values
         WHEN S01 => 
            ctrl_rdy_o <= '1';
         -- Increment
         -- i-address
         WHEN S10 => 
            cnteni_o <= '1';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;
