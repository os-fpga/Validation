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

ENTITY p0300_m00027_s_v01_train_fsm IS
   PORT( 
      clk_i              : IN     std_logic;
      cnti_rdy_i         : IN     std_logic;
      cntj_rdy_i         : IN     std_logic;
      ctrl_clear_epoch_i : IN     std_logic;
      ctrl_maxepoch_i    : IN     WB_DATA_WIDTH_T;
      ctrl_rdy1_i        : IN     std_logic;
      ctrl_rdy2_i        : IN     std_logic;
      ctrl_rdy7_i        : IN     std_logic;
      ctrl_start_i       : IN     std_logic;
      ctrl_wchgd_i       : IN     std_logic;
      rst_n_i            : IN     std_logic;
      ctrl_epoch_o       : OUT    WB_DATA_WIDTH_T;
      ctrl_int_o         : OUT    std_logic;
      ctrl_not_rdy_o     : OUT    std_logic;
      ctrl_rdy_o         : OUT    std_logic;
      ctrl_start1_o      : OUT    std_logic;
      ctrl_start2_o      : OUT    std_logic
   );

-- Declarations

END p0300_m00027_s_v01_train_fsm ;
-- COPYRIGHT (C) 2022 Jens Gutschmidt /
-- VIVARE GmbH Switzerland
-- (email: opencores@vivare-services.com)
-- 
-- Versions:
-- Revision 1.0  2022/07/04
-- -- First draft
-- 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
--USE ieee.numeric_std.all;
LIBRARY work;
USE work.memory_vhd_v03_pkg.ALL;
 
ARCHITECTURE fsm OF p0300_m00027_s_v01_train_fsm IS

   -- Architecture Declarations
   SIGNAL cnti_rdy_reg : std_logic;  
   SIGNAL cntj_rdy_reg : std_logic;  
   SIGNAL ctrl_clear_epoch_reg : std_logic;  
   SIGNAL ctrl_epoch_reg : WB_DATA_WIDTH_T;  
   SIGNAL ctrl_int_reg : std_logic;  
   SIGNAL ctrl_not_rdy_reg : std_logic;  
   SIGNAL ctrl_rdy1_reg : std_logic;  
   SIGNAL ctrl_rdy2_reg : std_logic;  
   SIGNAL ctrl_start_reg : std_logic;  

   TYPE STATE_TYPE IS (
      S00,
      S02,
      S03,
      S06,
      S07,
      S10,
      S01,
      S11,
      S12,
      S05,
      S08,
      S04,
      S09,
      S13
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
            cnti_rdy_reg <= '0';
            cntj_rdy_reg <= '0';
            ctrl_clear_epoch_reg <= '0';
            ctrl_epoch_reg <= (others => '0');
            ctrl_int_reg <= '0';
            ctrl_not_rdy_reg <= '0';
            ctrl_rdy1_reg <= '0';
            ctrl_rdy2_reg <= '0';
            ctrl_start_reg <= '0';
         ELSE
            current_state <= next_state;
            -- Default Assignment To Internals
            cnti_rdy_reg <= cnti_rdy_i;
            cntj_rdy_reg <= cntj_rdy_i;
            ctrl_clear_epoch_reg <= ctrl_clear_epoch_i;
            ctrl_epoch_reg <= ctrl_epoch_reg;
            ctrl_int_reg <= '0';
            ctrl_not_rdy_reg <= ctrl_not_rdy_reg;
            ctrl_rdy1_reg <= ctrl_rdy1_i;
            ctrl_rdy2_reg <= ctrl_rdy2_i;
            ctrl_start_reg <= ctrl_start_i;

            -- Combined Actions
            CASE current_state IS
               -- Clear NOT READY
               -- register and test for
               -- READY
               WHEN S02 => 
                  ctrl_not_rdy_reg <= '0';
               -- Set interrupt
               -- flag
               WHEN S11 => 
                  ctrl_int_reg <= '1';
               -- Set NOT READY
               -- register if modules
               -- are NOT READY
               WHEN S12 => 
                  ctrl_not_rdy_reg <= '1';
               -- Dummy cycle
               -- and update
               -- EPOCH
               WHEN S04 => 
                  ctrl_epoch_reg <= unsigned (ctrl_epoch_reg) + ctrl_wchgd_i;
               -- Clear EPOCH
               -- register
               WHEN S13 => 
                  ctrl_epoch_reg <= (others => '0');
               WHEN OTHERS =>
                  NULL;
            END CASE;
         END IF;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      cnti_rdy_reg,
      ctrl_clear_epoch_reg,
      ctrl_epoch_reg,
      ctrl_maxepoch_i,
      ctrl_rdy1_reg,
      ctrl_rdy2_reg,
      ctrl_rdy7_i,
      ctrl_start_reg,
      ctrl_wchgd_i,
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
         -- Clear NOT READY
         -- register and test for
         -- READY
         WHEN S02 => 
            IF (ctrl_rdy1_reg = '0' OR
                ctrl_rdy2_reg = '0' OR
                cnti_rdy_reg = '0') THEN 
               next_state <= S12;
            ELSE
               next_state <= S03;
            END IF;
         -- Start calculation
         -- of Y
         WHEN S03 => 
            next_state <= S04;
         -- Wait for CAL_Y
         -- is ready
         WHEN S06 => 
            IF (ctrl_rdy1_reg = '1') THEN 
               next_state <= S07;
            ELSE
               next_state <= S06;
            END IF;
         -- Start calculation
         -- of BIAS and W
         WHEN S07 => 
            next_state <= S08;
         -- Loop again if
         -- W was changed
         WHEN S10 => 
            IF (ctrl_rdy2_reg = '1' AND
                ctrl_wchgd_i = '1' AND
                ( unsigned (ctrl_maxepoch_i) = 0 OR
                  unsigned (ctrl_maxepoch_i) >= unsigned (ctrl_epoch_reg) )) THEN 
               next_state <= S03;
            ELSIF (ctrl_rdy2_reg = '1') THEN 
               next_state <= S11;
            ELSE
               next_state <= S10;
            END IF;
         -- Wait for next
         -- training or clear
         -- EPOCH register
         WHEN S01 => 
            IF (ctrl_start_reg = '1' AND
                ctrl_clear_epoch_reg = '1') THEN 
               next_state <= S13;
            ELSIF (ctrl_start_reg = '1') THEN 
               next_state <= S02;
            ELSE
               next_state <= S01;
            END IF;
         -- Set interrupt
         -- flag
         WHEN S11 => 
            next_state <= S01;
         -- Set NOT READY
         -- register if modules
         -- are NOT READY
         WHEN S12 => 
            next_state <= S01;
         -- Dummy cycle
         WHEN S05 => 
            next_state <= S06;
         -- Dummy cycle
         WHEN S08 => 
            next_state <= S09;
         -- Dummy cycle
         -- and update
         -- EPOCH
         WHEN S04 => 
            next_state <= S05;
         -- Dummy cycle
         WHEN S09 => 
            next_state <= S10;
         -- Clear EPOCH
         -- register
         WHEN S13 => 
            next_state <= S02;
         WHEN OTHERS =>
            next_state <= S00;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      ctrl_epoch_reg,
      ctrl_int_reg,
      ctrl_not_rdy_reg,
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      ctrl_epoch_o <= ctrl_epoch_reg;
      ctrl_int_o <= ctrl_int_reg;
      ctrl_not_rdy_o <= ctrl_not_rdy_reg;
      ctrl_rdy_o <= '0';
      ctrl_start1_o <= '0';
      ctrl_start2_o <= '0';

      -- Combined Actions
      CASE current_state IS
         -- Start calculation
         -- of Y
         WHEN S03 => 
            ctrl_start1_o <= '1';
         -- Start calculation
         -- of BIAS and W
         WHEN S07 => 
            ctrl_start2_o <= '1';
         -- Wait for next
         -- training or clear
         -- EPOCH register
         WHEN S01 => 
            ctrl_rdy_o <= '1';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;
