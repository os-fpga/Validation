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

ENTITY p0300_m00021_s_v03_wishbone_fsm IS
   PORT( 
      clk_i              : IN     std_logic;
      ctrl_alllat_i      : IN     MEM_LAT_CNT_WIDTH_T;
      ctrl_complete_i    : IN     std_logic;
      ctrl_dout_i        : IN     DATA_T;
      ctrl_dout_valid_i  : IN     std_logic;
      ctrl_epoch_i       : IN     WB_DATA_WIDTH_T;
      ctrl_int_test_i    : IN     std_logic;
      ctrl_int_train_i   : IN     std_logic;
      ctrl_memerr_i      : IN     std_logic;
      ctrl_not_rdy6_i    : IN     std_logic;
      ctrl_rdlat_i       : IN     MEM_LAT_CNT_WIDTH_T;
      ctrl_rdy1_i        : IN     std_logic;
      ctrl_rdy2_i        : IN     std_logic;
      ctrl_rdy3_i        : IN     std_logic;
      ctrl_rdy4_i        : IN     std_logic;
      ctrl_rdy5_i        : IN     std_logic;
      ctrl_rdy6_i        : IN     std_logic;
      ctrl_run7_i        : IN     std_logic;
      ctrl_wrlat_i       : IN     MEM_LAT_CNT_WIDTH_T;
      rst_n_i            : IN     std_logic;
      wb_adr_i           : IN     WB_ADDR_WIDTH_T;
      wb_cyc_i           : IN     std_logic;
      wb_dat_i           : IN     WB_DATA_WIDTH_T;
      wb_stb_i           : IN     std_logic;
      wb_we_i            : IN     std_logic;
      ctrl_bias_o        : OUT    DATA_T;
      ctrl_clear_epoch_o : OUT    std_logic;
      ctrl_din_o         : OUT    DATA_T;
      ctrl_int_o         : OUT    std_logic;
      ctrl_maxepoch_o    : OUT    WB_DATA_WIDTH_T;
      ctrl_offset_o      : OUT    DATA_T;
      ctrl_rd_vec_o      : OUT    MEM_WR_LINES_T;
      ctrl_set_starti_o  : OUT    std_logic;
      ctrl_set_startj_o  : OUT    std_logic;
      ctrl_start3_o      : OUT    std_logic;
      ctrl_start4_o      : OUT    std_logic;
      ctrl_start5_o      : OUT    std_logic;
      ctrl_start6_o      : OUT    std_logic;
      ctrl_starti_val_o  : OUT    ADDRESS_S_T;
      ctrl_startj_val_o  : OUT    ADDRESS_T_T;
      ctrl_stopi_val_o   : OUT    ADDRESS_S_T;
      ctrl_stopj_val_o   : OUT    ADDRESS_T_T;
      ctrl_thres_o       : OUT    DATA_T;
      ctrl_wr_vec_o      : OUT    MEM_WR_LINES_T;
      wb_ack_o           : OUT    std_logic;
      wb_dat_o           : OUT    WB_DATA_WIDTH_T
   );

-- Declarations

END p0300_m00021_s_v03_wishbone_fsm ;
-- COPYRIGHT (C) 2022 Jens Gutschmidt /
-- VIVARE GmbH Switzerland
-- (email: opencores@vivare-services.com)
-- 
-- Versions:
-- Revision 3.0  2022/07/21
-- - Delete alpha register and output
-- - Consolidate # cycles
-- Revision 2.0  2022/06/18
-- - Introduce self-resets for status signals
-- - Remove states introduced for debugging
-- Revision 1.0  2022/06/11
-- -- First draft
-- 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
LIBRARY work;
USE work.memory_vhd_v03_pkg.ALL;
 
ARCHITECTURE fsm OF p0300_m00021_s_v03_wishbone_fsm IS

   -- Architecture Declarations
   SIGNAL ctrl_bias_reg : DATA_T;  
   SIGNAL ctrl_complete_reg : std_logic;  
   SIGNAL ctrl_din_reg : DATA_T;  
   SIGNAL ctrl_int_en_reg : std_logic;  
   SIGNAL ctrl_int_test_reg : std_logic;  
   SIGNAL ctrl_int_train_reg : std_logic;  
   SIGNAL ctrl_maxepoch_reg : WB_DATA_WIDTH_T;  
   SIGNAL ctrl_offset_reg : DATA_T;  
   SIGNAL ctrl_rd_vec_reg : MEM_WR_LINES_T;  
   SIGNAL ctrl_rdy_reg : std_logic;  
   SIGNAL ctrl_starti_val_reg : ADDRESS_S_T;  
   SIGNAL ctrl_startj_val_reg : ADDRESS_T_T;  
   SIGNAL ctrl_stat_a_reg : DATA_T;  
   SIGNAL ctrl_stopi_val_reg : ADDRESS_S_T;  
   SIGNAL ctrl_stopj_val_reg : ADDRESS_T_T;  
   SIGNAL ctrl_thres_reg : DATA_T;  
   SIGNAL ctrl_wr_vec_reg : MEM_WR_LINES_T;  
   SIGNAL wb_adr_reg : WB_ADDR_WIDTH_T;  
   SIGNAL wb_cyc_reg : std_logic;  
   SIGNAL wb_dat_reg : WB_DATA_WIDTH_T;  
   SIGNAL wb_stb_reg : std_logic;  
   SIGNAL wb_we_reg : std_logic;  
   SIGNAL zero_net_addrs : ADDRESS_S_ZERO_T;  
   SIGNAL zero_net_addrt : ADDRESS_T_ZERO_T;  

   TYPE STATE_TYPE IS (
      S03,
      S01,
      S04,
      S06,
      S07,
      S08,
      S09,
      S10,
      S11,
      S12,
      S13,
      S17,
      S18,
      S19,
      S20,
      S21,
      S22,
      S23,
      S24,
      S25,
      S26,
      S27,
      S28,
      S29,
      S30,
      S31,
      S32,
      S33,
      S34,
      S35,
      S36,
      S37,
      S38,
      S39,
      S40,
      S41,
      S00,
      S46,
      S47,
      S02,
      S48,
      S14,
      S15,
      S01a
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
            ctrl_bias_reg <= (others => '0');
            ctrl_complete_reg <= '0';
            ctrl_din_reg <= (others => '0');
            ctrl_int_en_reg <= '0';
            ctrl_int_test_reg <= '0';
            ctrl_int_train_reg <= '0';
            ctrl_maxepoch_reg <= (others => '0');
            ctrl_offset_reg <= (others => '0');
            ctrl_rd_vec_reg <= (others => '0');
            ctrl_rdy_reg <= '0';
            ctrl_starti_val_reg <= (others => '0');
            ctrl_startj_val_reg <= (others => '0');
            ctrl_stat_a_reg <= (others => '0');
            ctrl_stopi_val_reg <= zero_net_addrs & '1';
            ctrl_stopj_val_reg <= zero_net_addrt & '1';
            ctrl_thres_reg <= (others => '0');
            ctrl_wr_vec_reg <= (others => '0');
            wb_adr_reg <= (others => '0');
            wb_cyc_reg <= '0';
            wb_dat_reg <= (others => '0');
            wb_stb_reg <= '0';
            wb_we_reg <= '0';
         ELSE
            current_state <= next_state;
            -- Default Assignment To Internals
            ctrl_bias_reg <= ctrl_bias_reg;
            ctrl_complete_reg <= ctrl_complete_reg OR ctrl_complete_i;
            ctrl_din_reg <= ctrl_din_reg;
            ctrl_int_en_reg <= ctrl_int_en_reg;
            ctrl_int_test_reg <= ctrl_int_test_reg OR ctrl_int_test_i;
            ctrl_int_train_reg <= ctrl_int_train_reg OR ctrl_int_train_i;
            ctrl_maxepoch_reg <= ctrl_maxepoch_reg;
            ctrl_offset_reg <= ctrl_offset_reg;
            ctrl_rd_vec_reg <= ctrl_rd_vec_reg;
            ctrl_rdy_reg <= ctrl_rdy1_i AND ctrl_rdy2_i AND ctrl_rdy3_i AND ctrl_rdy4_i AND ctrl_rdy5_i AND ctrl_rdy6_i;
            ctrl_starti_val_reg <= ctrl_starti_val_reg;
            ctrl_startj_val_reg <= ctrl_startj_val_reg;
            ctrl_stat_a_reg <= ctrl_stat_a_reg;
            ctrl_stopi_val_reg <= ctrl_stopi_val_reg;
            ctrl_stopj_val_reg <= ctrl_stopj_val_reg;
            ctrl_thres_reg <= ctrl_thres_reg;
            ctrl_wr_vec_reg <= ctrl_wr_vec_reg;
            wb_adr_reg <= wb_adr_i;
            wb_cyc_reg <= wb_cyc_i;
            wb_dat_reg <= wb_dat_i;
            wb_stb_reg <= wb_stb_i;
            wb_we_reg <= wb_we_i;

            -- Combined Actions
            CASE current_state IS
               -- READ Status A
               WHEN S03 => 
                  ctrl_complete_reg <= ctrl_complete_i OR ( ctrl_complete_reg AND ( NOT (  ctrl_stat_a_reg (STAT_RD_WR_COMPLETE) ) ) );
                  ctrl_int_test_reg <= ctrl_int_test_i OR ( ctrl_int_test_reg AND ( NOT (  ctrl_stat_a_reg (STAT_INT_TEST) ) ) );
                  ctrl_int_train_reg <= ctrl_int_train_i OR ( ctrl_int_train_reg AND ( NOT (  ctrl_stat_a_reg (STAT_INT_TRAIN) ) ) );
               -- Wait for
               -- transfer/phase
               WHEN S01 => 
                  ctrl_stat_a_reg (STAT_RDY) <= ctrl_rdy_reg;
                  ctrl_stat_a_reg (STAT_LAT_RUN) <= ctrl_run7_i;
                  ctrl_stat_a_reg (STAT_NOT_RDY) <= ctrl_not_rdy6_i;
                  ctrl_stat_a_reg (STAT_INT_EN) <= ctrl_int_en_reg;
                  ctrl_stat_a_reg (STAT_MEMERR) <= ctrl_memerr_i;
                  ctrl_stat_a_reg (STAT_RD_WR_COMPLETE) <= ctrl_complete_reg AND ctrl_rdy_reg;
                  ctrl_stat_a_reg (STAT_INT_TEST) <= ctrl_int_test_reg AND ctrl_rdy_reg;
                  ctrl_stat_a_reg (STAT_INT_TRAIN) <= ctrl_int_train_reg AND ctrl_rdy_reg;
               -- WRITE Threshold
               -- register
               WHEN S04 => 
                  ctrl_thres_reg <= wb_dat_reg (DATA_N);
               -- WRITE Bias
               -- register
               WHEN S08 => 
                  ctrl_bias_reg <= wb_dat_reg (DATA_N);
               -- WRITE Offset
               -- register
               WHEN S10 => 
                  ctrl_offset_reg <= wb_dat_reg (DATA_N);
               -- WRITE Maxepochs
               -- register
               WHEN S12 => 
                  ctrl_maxepoch_reg <= wb_dat_reg;
               -- WRITE Start i
               -- register
               WHEN S18 => 
                  ctrl_starti_val_reg <= wb_dat_reg (ADDRESS_S_N);
               -- WRITE Start j
               -- register
               WHEN S20 => 
                  ctrl_startj_val_reg <= wb_dat_reg (ADDRESS_T_N);
               -- WRITE Stop i
               -- register
               WHEN S22 => 
                  ctrl_stopi_val_reg <= wb_dat_reg (ADDRESS_S_N);
               -- WRITE Stop j
               -- register
               WHEN S24 => 
                  ctrl_stopj_val_reg <= wb_dat_reg (ADDRESS_T_N);
               -- WRITE SMEM
               WHEN S32 => 
                  ctrl_rd_vec_reg <= "00001";
                  ctrl_wr_vec_reg <= "00001";
                  ctrl_din_reg <= wb_dat_reg (DATA_N);
               -- WRITE TMEM
               WHEN S33 => 
                  ctrl_rd_vec_reg <= "00010";
                  ctrl_wr_vec_reg <= "00010";
                  ctrl_din_reg <= wb_dat_reg (DATA_N);
               -- WRITE WMEM
               WHEN S34 => 
                  ctrl_rd_vec_reg <= "00100";
                  ctrl_wr_vec_reg <= "00100";
                  ctrl_din_reg <= wb_dat_reg (DATA_N);
               -- WRITE YMEM
               WHEN S35 => 
                  ctrl_rd_vec_reg <= "01000";
                  ctrl_wr_vec_reg <= "01000";
                  ctrl_din_reg <= wb_dat_reg (DATA_N);
               -- WRITE BIASMEM
               WHEN S36 => 
                  ctrl_rd_vec_reg <= "10000";
                  ctrl_wr_vec_reg <= "10000";
                  ctrl_din_reg <= wb_dat_reg (DATA_N);
               -- READ SMEM
               WHEN S37 => 
                  ctrl_rd_vec_reg <= "00001";
               -- READ TMEM
               WHEN S38 => 
                  ctrl_rd_vec_reg <= "00010";
               -- READ WMEM
               WHEN S39 => 
                  ctrl_rd_vec_reg <= "00100";
               -- READ YMEM
               WHEN S40 => 
                  ctrl_rd_vec_reg <= "01000";
               -- READ BIASMEM
               WHEN S41 => 
                  ctrl_rd_vec_reg <= "10000";
               -- WRITE Status A
               WHEN S02 => 
                  ctrl_int_en_reg <= wb_dat_reg (STAT_INT_EN);
               WHEN OTHERS =>
                  NULL;
            END CASE;
         END IF;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      ctrl_rdy3_i,
      ctrl_rdy4_i,
      ctrl_rdy5_i,
      current_state,
      wb_adr_reg,
      wb_cyc_reg,
      wb_stb_reg,
      wb_we_reg
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         -- READ Status A
         WHEN S03 => 
            next_state <= S01a;
         -- Wait for
         -- transfer/phase
         WHEN S01 => 
            IF (unsigned (wb_adr_reg) =  WB_STAT_A AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '0') THEN 
               next_state <= S03;
            ELSIF (unsigned (wb_adr_reg) = WB_THRES AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '0') THEN 
               next_state <= S06;
            ELSIF (unsigned (wb_adr_reg) = WB_BIAS AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '0') THEN 
               next_state <= S07;
            ELSIF (unsigned (wb_adr_reg) = WB_OFFSET AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '0') THEN 
               next_state <= S09;
            ELSIF (unsigned (wb_adr_reg) = WB_MAXEPOCH AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '0') THEN 
               next_state <= S11;
            ELSIF (unsigned (wb_adr_reg) = WB_IMAX AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '0') THEN 
               next_state <= S13;
            ELSIF (unsigned (wb_adr_reg) = WB_STARTI AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '0') THEN 
               next_state <= S17;
            ELSIF (unsigned (wb_adr_reg) = WB_STOPI AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '0') THEN 
               next_state <= S21;
            ELSIF (unsigned (wb_adr_reg) = WB_STARTJ AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '0') THEN 
               next_state <= S19;
            ELSIF (unsigned (wb_adr_reg) = WB_STOPJ AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '0') THEN 
               next_state <= S23;
            ELSIF (unsigned (wb_adr_reg) = WB_EPOCH AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '0') THEN 
               next_state <= S25;
            ELSIF (unsigned (wb_adr_reg) = WB_WRLAT AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '0') THEN 
               next_state <= S26;
            ELSIF (unsigned (wb_adr_reg) = WB_RDLAT AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '0') THEN 
               next_state <= S27;
            ELSIF (unsigned (wb_adr_reg) = WB_ALLLAT AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '0') THEN 
               next_state <= S28;
            ELSIF (unsigned (wb_adr_reg) = WB_START5_S AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '0') THEN 
               next_state <= S37;
            ELSIF (unsigned (wb_adr_reg) = WB_START5_T AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '0') THEN 
               next_state <= S38;
            ELSIF (unsigned (wb_adr_reg) = WB_START5_W AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '0') THEN 
               next_state <= S39;
            ELSIF (unsigned (wb_adr_reg) = WB_START5_Y AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '0') THEN 
               next_state <= S40;
            ELSIF (unsigned (wb_adr_reg) = WB_START5_BIAS AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '0') THEN 
               next_state <= S41;
            ELSIF (unsigned (wb_adr_reg) = WB_THRES AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '1') THEN 
               next_state <= S04;
            ELSIF (unsigned (wb_adr_reg) = WB_BIAS AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '1') THEN 
               next_state <= S08;
            ELSIF (unsigned (wb_adr_reg) = WB_OFFSET AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '1') THEN 
               next_state <= S10;
            ELSIF (unsigned (wb_adr_reg) = WB_MAXEPOCH AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '1') THEN 
               next_state <= S12;
            ELSIF (unsigned (wb_adr_reg) = WB_STARTI AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '1') THEN 
               next_state <= S18;
            ELSIF (unsigned (wb_adr_reg) = WB_STOPI AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '1') THEN 
               next_state <= S22;
            ELSIF (unsigned (wb_adr_reg) = WB_STARTJ AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '1') THEN 
               next_state <= S20;
            ELSIF (unsigned (wb_adr_reg) = WB_STOPJ AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '1') THEN 
               next_state <= S24;
            ELSIF (unsigned (wb_adr_reg) = WB_START3 AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '1') THEN 
               next_state <= S29;
            ELSIF (unsigned (wb_adr_reg) = WB_START4 AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '1') THEN 
               next_state <= S30;
            ELSIF (unsigned (wb_adr_reg) = WB_START5_S AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '1') THEN 
               next_state <= S32;
            ELSIF (unsigned (wb_adr_reg) = WB_START5_T AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '1') THEN 
               next_state <= S33;
            ELSIF (unsigned (wb_adr_reg) = WB_START5_W AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '1') THEN 
               next_state <= S34;
            ELSIF (unsigned (wb_adr_reg) = WB_START5_Y AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '1') THEN 
               next_state <= S35;
            ELSIF (unsigned (wb_adr_reg) = WB_START5_BIAS AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '1') THEN 
               next_state <= S36;
            ELSIF (unsigned (wb_adr_reg) = WB_START6 AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '1') THEN 
               next_state <= S31;
            ELSIF (unsigned (wb_adr_reg) = WB_STAT_A AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '1') THEN 
               next_state <= S02;
            ELSIF (unsigned (wb_adr_reg) = WB_JMAX AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '0') THEN 
               next_state <= S14;
            ELSIF (unsigned (wb_adr_reg) = WB_MEMDATA_WIDTH AND wb_stb_reg = '1' AND wb_cyc_reg = '1' AND wb_we_reg = '0') THEN 
               next_state <= S15;
            ELSIF (wb_stb_reg = '1' AND wb_cyc_reg = '1') THEN 
               next_state <= S48;
            ELSE
               next_state <= S01;
            END IF;
         -- WRITE Threshold
         -- register
         WHEN S04 => 
            next_state <= S01a;
         -- READ Threshold
         -- register
         WHEN S06 => 
            next_state <= S01a;
         -- READ Bias
         -- register
         WHEN S07 => 
            next_state <= S01a;
         -- WRITE Bias
         -- register
         WHEN S08 => 
            next_state <= S01a;
         -- READ Offset
         -- register
         WHEN S09 => 
            next_state <= S01a;
         -- WRITE Offset
         -- register
         WHEN S10 => 
            next_state <= S01a;
         -- READ Maxepochs
         -- register
         WHEN S11 => 
            next_state <= S01a;
         -- WRITE Maxepochs
         -- register
         WHEN S12 => 
            next_state <= S01a;
         -- READ maximum
         -- rows i
         WHEN S13 => 
            next_state <= S01a;
         -- READ Start i
         -- register
         WHEN S17 => 
            next_state <= S01a;
         -- WRITE Start i
         -- register
         WHEN S18 => 
            next_state <= S01a;
         -- READ Start j
         -- register
         WHEN S19 => 
            next_state <= S01a;
         -- WRITE Start j
         -- register
         WHEN S20 => 
            next_state <= S01a;
         -- READ Stop i
         -- register
         WHEN S21 => 
            next_state <= S01a;
         -- WRITE Stop i
         -- register
         WHEN S22 => 
            next_state <= S01a;
         -- READ Stop j
         -- register
         WHEN S23 => 
            next_state <= S01a;
         -- WRITE Stop j
         -- register
         WHEN S24 => 
            next_state <= S01a;
         -- READ Epochs
         -- register
         WHEN S25 => 
            next_state <= S01a;
         -- READ coded
         -- WR Lat 
         -- register
         WHEN S26 => 
            next_state <= S01a;
         -- READ coded
         -- RD Lat
         -- register
         WHEN S27 => 
            next_state <= S01a;
         -- READ decimal
         -- Latency register
         WHEN S28 => 
            next_state <= S01a;
         -- Start INIT
         WHEN S29 => 
            IF (ctrl_rdy3_i = '0') THEN 
               next_state <= S01a;
            ELSE
               next_state <= S29;
            END IF;
         -- Start TEST
         WHEN S30 => 
            IF (ctrl_rdy4_i = '0') THEN 
               next_state <= S01a;
            ELSE
               next_state <= S30;
            END IF;
         -- Start TRAIN
         WHEN S31 => 
            next_state <= S01a;
         -- WRITE SMEM
         WHEN S32 => 
            IF (ctrl_rdy5_i = '0') THEN 
               next_state <= S47;
            END IF;
         -- WRITE TMEM
         WHEN S33 => 
            IF (ctrl_rdy5_i = '0') THEN 
               next_state <= S47;
            END IF;
         -- WRITE WMEM
         WHEN S34 => 
            IF (ctrl_rdy5_i = '0') THEN 
               next_state <= S47;
            END IF;
         -- WRITE YMEM
         WHEN S35 => 
            IF (ctrl_rdy5_i = '0') THEN 
               next_state <= S47;
            END IF;
         -- WRITE BIASMEM
         WHEN S36 => 
            IF (ctrl_rdy5_i = '0') THEN 
               next_state <= S47;
            END IF;
         -- READ SMEM
         WHEN S37 => 
            IF (ctrl_rdy5_i = '0') THEN 
               next_state <= S46;
            END IF;
         -- READ TMEM
         WHEN S38 => 
            IF (ctrl_rdy5_i = '0') THEN 
               next_state <= S46;
            END IF;
         -- READ WMEM
         WHEN S39 => 
            IF (ctrl_rdy5_i = '0') THEN 
               next_state <= S46;
            END IF;
         -- READ YMEM
         WHEN S40 => 
            IF (ctrl_rdy5_i = '0') THEN 
               next_state <= S46;
            END IF;
         -- READ BIASMEM
         WHEN S41 => 
            IF (ctrl_rdy5_i = '0') THEN 
               next_state <= S46;
            END IF;
         -- Reset state
         WHEN S00 => 
            next_state <= S01;
         -- READ xMEM
         WHEN S46 => 
            IF (ctrl_rdy5_i = '1') THEN 
               next_state <= S01a;
            ELSE
               next_state <= S46;
            END IF;
         -- WRITE xMEM
         WHEN S47 => 
            IF (ctrl_rdy5_i = '1') THEN 
               next_state <= S01a;
            ELSE
               next_state <= S47;
            END IF;
         -- WRITE Status A
         WHEN S02 => 
            next_state <= S01a;
         -- Dummy
         -- READ / WRITE
         WHEN S48 => 
            next_state <= S01a;
         -- READ maximum
         -- colums j
         WHEN S14 => 
            next_state <= S01a;
         -- READ memory
         -- data width
         WHEN S15 => 
            next_state <= S01a;
         -- Waite State
         WHEN S01a => 
            next_state <= S01;
         WHEN OTHERS =>
            next_state <= S00;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      ctrl_alllat_i,
      ctrl_bias_reg,
      ctrl_din_reg,
      ctrl_dout_i,
      ctrl_epoch_i,
      ctrl_int_en_reg,
      ctrl_int_test_reg,
      ctrl_int_train_reg,
      ctrl_maxepoch_reg,
      ctrl_offset_reg,
      ctrl_rd_vec_reg,
      ctrl_rdlat_i,
      ctrl_rdy3_i,
      ctrl_rdy4_i,
      ctrl_rdy5_i,
      ctrl_starti_val_reg,
      ctrl_startj_val_reg,
      ctrl_stat_a_reg,
      ctrl_stopi_val_reg,
      ctrl_stopj_val_reg,
      ctrl_thres_reg,
      ctrl_wr_vec_reg,
      ctrl_wrlat_i,
      current_state,
      wb_cyc_i,
      wb_dat_reg,
      wb_stb_i
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      ctrl_bias_o <= ctrl_bias_reg;
      ctrl_clear_epoch_o <= '0';
      ctrl_din_o <= ctrl_din_reg;
      ctrl_int_o <= ctrl_int_en_reg AND (ctrl_int_train_reg OR ctrl_int_test_reg);
      ctrl_maxepoch_o <= ctrl_maxepoch_reg;
      ctrl_offset_o <= ctrl_offset_reg;
      ctrl_rd_vec_o <= ctrl_rd_vec_reg;
      ctrl_set_starti_o <= '0';
      ctrl_set_startj_o <= '0';
      ctrl_start3_o <= '0';
      ctrl_start4_o <= '0';
      ctrl_start5_o <= '0';
      ctrl_start6_o <= '0';
      ctrl_starti_val_o <= ctrl_starti_val_reg;
      ctrl_startj_val_o <= ctrl_startj_val_reg;
      ctrl_stopi_val_o <= ctrl_stopi_val_reg;
      ctrl_stopj_val_o <= ctrl_stopj_val_reg;
      ctrl_thres_o <= ctrl_thres_reg;
      ctrl_wr_vec_o <= ctrl_wr_vec_reg;
      wb_ack_o <= '0';
      wb_dat_o <= (others => '0');
      -- Default Assignment To Internals
      zero_net_addrs <= (others => '0');
      zero_net_addrt <= (others => '0');

      -- Combined Actions
      CASE current_state IS
         -- READ Status A
         WHEN S03 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
            wb_dat_o <= std_logic_vector ( conv_unsigned ( (conv_integer ( unsigned ( ctrl_stat_a_reg ) )), WB_DATA_WIDTH ) );
         -- WRITE Threshold
         -- register
         WHEN S04 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
         -- READ Threshold
         -- register
         WHEN S06 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
            wb_dat_o <= std_logic_vector ( conv_unsigned ( (conv_integer ( unsigned ( ctrl_thres_reg ) )), WB_DATA_WIDTH ) );
         -- READ Bias
         -- register
         WHEN S07 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
            wb_dat_o <= std_logic_vector ( conv_unsigned ( (conv_integer ( unsigned ( ctrl_bias_reg ) )), WB_DATA_WIDTH ) );
         -- WRITE Bias
         -- register
         WHEN S08 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
         -- READ Offset
         -- register
         WHEN S09 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
            wb_dat_o <= std_logic_vector ( conv_unsigned ( (conv_integer ( unsigned ( ctrl_offset_reg ) )), WB_DATA_WIDTH ) );
         -- WRITE Offset
         -- register
         WHEN S10 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
         -- READ Maxepochs
         -- register
         WHEN S11 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
            wb_dat_o <= ctrl_maxepoch_reg;
         -- WRITE Maxepochs
         -- register
         WHEN S12 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
         -- READ maximum
         -- rows i
         WHEN S13 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
            wb_dat_o <= std_logic_vector ( conv_unsigned ( (conv_integer (  ( I_MAX ) )), WB_DATA_WIDTH ) );
         -- READ Start i
         -- register
         WHEN S17 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
            wb_dat_o <= std_logic_vector ( conv_unsigned ( (conv_integer ( unsigned ( ctrl_starti_val_reg ) )), WB_DATA_WIDTH ) );
         -- WRITE Start i
         -- register
         WHEN S18 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
         -- READ Start j
         -- register
         WHEN S19 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
            wb_dat_o <= std_logic_vector ( conv_unsigned ( (conv_integer ( unsigned ( ctrl_startj_val_reg ) )), WB_DATA_WIDTH ) );
         -- WRITE Start j
         -- register
         WHEN S20 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
         -- READ Stop i
         -- register
         WHEN S21 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
            wb_dat_o <= std_logic_vector ( conv_unsigned ( (conv_integer ( unsigned ( ctrl_stopi_val_reg ) )), WB_DATA_WIDTH ) );
         -- WRITE Stop i
         -- register
         WHEN S22 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
         -- READ Stop j
         -- register
         WHEN S23 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
            wb_dat_o <= std_logic_vector ( conv_unsigned ( (conv_integer ( unsigned ( ctrl_stopj_val_reg ) )), WB_DATA_WIDTH ) );
         -- WRITE Stop j
         -- register
         WHEN S24 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
         -- READ Epochs
         -- register
         WHEN S25 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
            wb_dat_o <= ctrl_epoch_i;
         -- READ coded
         -- WR Lat 
         -- register
         WHEN S26 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
            wb_dat_o <= std_logic_vector ( conv_unsigned ( (conv_integer ( unsigned ( ctrl_wrlat_i ) )), WB_DATA_WIDTH ) );
         -- READ coded
         -- RD Lat
         -- register
         WHEN S27 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
            wb_dat_o <= std_logic_vector ( conv_unsigned ( (conv_integer ( unsigned ( ctrl_rdlat_i ) )), WB_DATA_WIDTH ) );
         -- READ decimal
         -- Latency register
         WHEN S28 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
            wb_dat_o <= std_logic_vector ( conv_unsigned ( (conv_integer ( unsigned ( ctrl_alllat_i ) )), WB_DATA_WIDTH ) );
         -- Start INIT
         WHEN S29 => 
            wb_ack_o <= NOT ctrl_rdy3_i AND wb_stb_i AND wb_cyc_i;
            ctrl_start3_o <= '1';
         -- Start TEST
         WHEN S30 => 
            wb_ack_o <= NOT ctrl_rdy4_i AND wb_stb_i AND wb_cyc_i;
            ctrl_start4_o <= '1';
         -- Start TRAIN
         WHEN S31 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
            ctrl_start6_o <= '1';
            ctrl_clear_epoch_o <= wb_dat_reg (0);
         -- WRITE SMEM
         WHEN S32 => 
            ctrl_start5_o <= '1';
         -- WRITE TMEM
         WHEN S33 => 
            ctrl_start5_o <= '1';
         -- WRITE WMEM
         WHEN S34 => 
            ctrl_start5_o <= '1';
         -- WRITE YMEM
         WHEN S35 => 
            ctrl_start5_o <= '1';
         -- WRITE BIASMEM
         WHEN S36 => 
            ctrl_start5_o <= '1';
         -- READ SMEM
         WHEN S37 => 
            ctrl_start5_o <= '1';
         -- READ TMEM
         WHEN S38 => 
            ctrl_start5_o <= '1';
         -- READ WMEM
         WHEN S39 => 
            ctrl_start5_o <= '1';
         -- READ YMEM
         WHEN S40 => 
            ctrl_start5_o <= '1';
         -- READ BIASMEM
         WHEN S41 => 
            ctrl_start5_o <= '1';
         -- READ xMEM
         WHEN S46 => 
            wb_ack_o <= ctrl_rdy5_i AND wb_stb_i AND wb_cyc_i;
            wb_dat_o <= std_logic_vector ( conv_signed ( (conv_integer ( signed ( ctrl_dout_i ) )), WB_DATA_WIDTH ) );
         -- WRITE xMEM
         WHEN S47 => 
            wb_ack_o <= ctrl_rdy5_i AND wb_stb_i AND wb_cyc_i;
         -- WRITE Status A
         WHEN S02 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
         -- Dummy
         -- READ / WRITE
         WHEN S48 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
            wb_dat_o <= (others => '0');
         -- READ maximum
         -- colums j
         WHEN S14 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
            wb_dat_o <= std_logic_vector ( conv_unsigned ( (conv_integer (  ( J_MAX ) )), WB_DATA_WIDTH ) );
         -- READ memory
         -- data width
         WHEN S15 => 
            wb_ack_o <= wb_stb_i AND wb_cyc_i;
            wb_dat_o <= std_logic_vector ( conv_unsigned ( (conv_integer (  ( DATA_WIDTH ) )), WB_DATA_WIDTH ) );
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;
