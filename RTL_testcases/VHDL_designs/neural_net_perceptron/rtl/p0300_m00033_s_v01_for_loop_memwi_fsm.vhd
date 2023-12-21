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

ENTITY p0300_m00033_s_v01_for_loop_memwi_fsm IS
   PORT( 
      clk_i        : IN     std_logic;
      cnten1_i     : IN     std_logic;
      cnten2_i     : IN     std_logic;
      cnten3_i     : IN     std_logic;
      cnten4_i     : IN     std_logic;
      cnten5_i     : IN     std_logic;
      cnten7_i     : IN     std_logic;
      rst_n_i      : IN     std_logic;
      set_init_i   : IN     std_logic;
      start_vali_i : IN     ADDRESS_S_T;
      stop_vali_i  : IN     ADDRESS_S_T;
      cnt_end_o    : OUT    std_logic;
      cnt_rdy_o    : OUT    std_logic;
      cnt_val_o    : OUT    ADDRESS_S_T
   );

-- Declarations

END p0300_m00033_s_v01_for_loop_memwi_fsm ;
-- COPYRIGHT (C) 2022 Jens Gutschmidt /
-- VIVARE GmbH Switzerland
-- (email: opencores@vivare-services.com)
-- 
-- Versions:
-- Revision 1.0  2022/06/09
-- -- First draft
-- 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
--USE ieee.numeric_std.all;
LIBRARY work;
USE work.memory_vhd_v03_pkg.ALL;
 
ARCHITECTURE fsm_behv OF p0300_m00033_s_v01_for_loop_memwi_fsm IS

   -- Architecture Declarations
   SIGNAL cnt_end_reg : std_logic;  
   SIGNAL cnt_reg : ADDRESS_S_T;  
   SIGNAL cnten_reg : std_logic;  
   SIGNAL set_init_reg : std_logic;  

   TYPE STATE_TYPE IS (
      S01,
      S02,
      S03,
      S06,
      S04,
      S05,
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
            cnt_end_reg <= '0';
            cnt_reg <= (others => '0');
            cnten_reg <= '0';
            set_init_reg <= '0';
         ELSE
            current_state <= next_state;
            -- Default Assignment To Internals
            cnt_end_reg <= '0';
            cnt_reg <= cnt_reg;
            cnten_reg <= cnten1_i OR cnten2_i OR cnten3_i OR cnten4_i OR cnten5_i OR cnten7_i;
            set_init_reg <= set_init_i;

            -- Combined Actions
            CASE current_state IS
               -- Start loop
               WHEN S01 => 
                  cnt_reg <= start_vali_i;
               -- COUNT +
               WHEN S02 => 
                  cnt_reg <= unsigned (cnt_reg) + 1;
                  IF (cnt_reg = unsigned (stop_vali_i) - 1 OR
                      set_init_reg = '1') THEN 
                     cnt_end_reg <= '1';
                  END IF;
               -- Wait for next
               -- count enable.
               WHEN S03 => 
                  IF (set_init_reg = '1') THEN 
                     cnt_end_reg <= '1';
                  END IF;
               -- COUNT -
               WHEN S04 => 
                  cnt_reg <= unsigned (cnt_reg) - 1;
                  IF (cnt_reg = unsigned (stop_vali_i) + 1 OR
                      set_init_reg = '1') THEN 
                     cnt_end_reg <= '1';
                  END IF;
               -- Wait for next
               -- count enable.
               WHEN S05 => 
                  IF (set_init_reg = '1') THEN 
                     cnt_end_reg <= '1';
                  END IF;
               WHEN OTHERS =>
                  NULL;
            END CASE;
         END IF;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      cnt_reg,
      cnten_reg,
      current_state,
      set_init_reg,
      start_vali_i,
      stop_vali_i
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         -- Start loop
         WHEN S01 => 
            IF (cnten_reg = '1' AND
                unsigned (stop_vali_i) > unsigned (start_vali_i)) THEN 
               next_state <= S02;
            ELSIF (cnten_reg = '1' AND
                   unsigned (stop_vali_i) < unsigned (start_vali_i)) THEN 
               next_state <= S04;
            ELSE
               next_state <= S01;
            END IF;
         -- COUNT +
         WHEN S02 => 
            IF (cnt_reg = unsigned (stop_vali_i) - 1 OR
                set_init_reg = '1') THEN 
               next_state <= S06;
            ELSIF (cnten_reg = '0') THEN 
               next_state <= S03;
            ELSE
               next_state <= S02;
            END IF;
         -- Wait for next
         -- count enable.
         WHEN S03 => 
            IF (set_init_reg = '1') THEN 
               next_state <= S06;
            ELSIF (cnten_reg = '1') THEN 
               next_state <= S02;
            ELSE
               next_state <= S03;
            END IF;
         -- End-of-count
         -- or cancel.
         WHEN S06 => 
            IF (cnten_reg = '1' OR
                set_init_reg = '1') THEN 
               next_state <= S01;
            ELSE
               next_state <= S06;
            END IF;
         -- COUNT -
         WHEN S04 => 
            IF (cnt_reg = unsigned (stop_vali_i) + 1 OR
                set_init_reg = '1') THEN 
               next_state <= S06;
            ELSIF (cnten_reg = '0') THEN 
               next_state <= S05;
            ELSE
               next_state <= S04;
            END IF;
         -- Wait for next
         -- count enable.
         WHEN S05 => 
            IF (set_init_reg = '1') THEN 
               next_state <= S06;
            ELSIF (cnten_reg = '1') THEN 
               next_state <= S04;
            ELSE
               next_state <= S05;
            END IF;
         -- Reset state
         WHEN S00 => 
            next_state <= S01;
         WHEN OTHERS =>
            next_state <= S00;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      cnt_end_reg,
      cnt_reg,
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      cnt_end_o <= cnt_end_reg;
      cnt_rdy_o <= '0';
      cnt_val_o <= cnt_reg;

      -- Combined Actions
      CASE current_state IS
         -- Start loop
         WHEN S01 => 
            cnt_rdy_o <= '1';
         -- End-of-count
         -- or cancel.
         WHEN S06 => 
            cnt_end_o <= '1';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm_behv;
