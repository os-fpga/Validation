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

ENTITY p0300_m00020_s_v03_perceptron_blk IS
   PORT( 
      clk_i      : IN     std_logic;
      dbias_i    : IN     DATA_T;
      ds_i       : IN     DATA_T;
      dt_i       : IN     DATA_T;
      dw_i       : IN     DATA_T;
      dy_i       : IN     DATA_T;
      rst_i      : IN     std_logic;
      wb_adr_i   : IN     WB_ADDR_WIDTH_T;
      wb_cyc_i   : IN     std_logic;
      wb_dat_i   : IN     WB_DATA_WIDTH_T;
      wb_stb_i   : IN     std_logic;
      wb_we_i    : IN     std_logic;
      addr_i_o   : OUT    ADDRESS_S_T;
      addr_j_o   : OUT    ADDRESS_T_T;
      ctrl_int_o : OUT    std_logic;
      dout1_o    : OUT    DATA_T;
      dout2_o    : OUT    DATA_T;
      dout3_o    : OUT    DATA_T;
      dout4_o    : OUT    DATA_T;
      dout5_o    : OUT    DATA_T;
      dout7_o    : OUT    DATA_T;
      wb_ack_o   : OUT    std_logic;
      wb_dat_o   : OUT    WB_DATA_WIDTH_T;
      we_bias2_o : OUT    std_logic;
      we_bias3_o : OUT    std_logic;
      we_bias5_o : OUT    std_logic;
      we_s3_o    : OUT    std_logic;
      we_s4_o    : OUT    std_logic;
      we_s5_o    : OUT    std_logic;
      we_t3_o    : OUT    std_logic;
      we_t4_o    : OUT    std_logic;
      we_t5_o    : OUT    std_logic;
      we_w2_o    : OUT    std_logic;
      we_w3_o    : OUT    std_logic;
      we_w4_o    : OUT    std_logic;
      we_w5_o    : OUT    std_logic;
      we_w7_o    : OUT    std_logic;
      we_y1_o    : OUT    std_logic;
      we_y3_o    : OUT    std_logic;
      we_y5_o    : OUT    std_logic
   );

-- Declarations

END p0300_m00020_s_v03_perceptron_blk ;
-- COPYRIGHT (C) 2022 Jens Gutschmidt /
-- VIVARE GmbH Switzerland
-- (email: opencores@vivare-services.com)
-- 
-- Versions:
-- Revision 3.0  2022/07/04
-- - Update wiring and connections
-- - Insert all new versioned symbols
-- Revision 2.0  2022/06/18
-- - Update wiring and connections
-- - Insert all new versioned symbols
-- Revision 1.0  2022/06/12
-- -- First draft
-- 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
--USE ieee.numeric_std.all;
LIBRARY work;
USE work.memory_vhd_v03_pkg.ALL;


ARCHITECTURE struct OF p0300_m00020_s_v03_perceptron_blk IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL cnt_alllat_oi       : MEM_LAT_CNT_WIDTH_T;
   SIGNAL cnteni1_oi          : std_logic;
   SIGNAL cnteni2_oi          : std_logic;
   SIGNAL cnteni3_oi          : std_logic;
   SIGNAL cnteni4_oi          : std_logic;
   SIGNAL cnteni5_oi          : std_logic;
   SIGNAL cnteni7_oi          : std_logic;
   SIGNAL cntenj1_oi          : std_logic;
   SIGNAL cntenj2_oi          : std_logic;
   SIGNAL cntenj3_oi          : std_logic;
   SIGNAL cntenj4_oi          : std_logic;
   SIGNAL cntenj5_oi          : std_logic;
   SIGNAL cntenj7_oi          : std_logic;
   SIGNAL cnti_end_oi         : std_logic;
   SIGNAL cnti_rdy_oi         : std_logic;
   SIGNAL cntj_end_oi         : std_logic;
   SIGNAL cntj_rdy_oi         : std_logic;
   SIGNAL ctrl_bias_oi        : DATA_T;
   SIGNAL ctrl_clear_epoch_oi : std_logic;
   SIGNAL ctrl_complete_oi    : std_logic;
   SIGNAL ctrl_din_oi         : DATA_T;
   SIGNAL ctrl_dout_oi        : DATA_T;
   SIGNAL ctrl_dout_valid_oi  : std_logic;
   SIGNAL ctrl_epoch_oi       : WB_DATA_WIDTH_T;
   SIGNAL ctrl_int4_o         : std_logic;
   SIGNAL ctrl_int6_o         : std_logic;
   SIGNAL ctrl_maxepoch_oi    : WB_DATA_WIDTH_T;
   SIGNAL ctrl_memerr_oi      : std_logic;
   SIGNAL ctrl_not_rdy6_oi    : std_logic;
   SIGNAL ctrl_offset_oi      : DATA_T;
   SIGNAL ctrl_rd_vec_oi      : MEM_WR_LINES_T;
   SIGNAL ctrl_rdlat_oi       : MEM_LAT_CNT_WIDTH_T;
   SIGNAL ctrl_rdy1_oi        : std_logic;
   SIGNAL ctrl_rdy2_oi        : std_logic;
   SIGNAL ctrl_rdy3_oi        : std_logic;
   SIGNAL ctrl_rdy4_oi        : std_logic;
   SIGNAL ctrl_rdy5_oi        : std_logic;
   SIGNAL ctrl_rdy6_oi        : std_logic;
   SIGNAL ctrl_rdy7_oi        : std_logic;
   SIGNAL ctrl_run7_oi        : std_logic;
   SIGNAL ctrl_start1_oi      : std_logic;
   SIGNAL ctrl_start2_oi      : std_logic;
   SIGNAL ctrl_start3_oi      : std_logic;
   SIGNAL ctrl_start4_oi      : std_logic;
   SIGNAL ctrl_start5_oi      : std_logic;
   SIGNAL ctrl_start6_oi      : std_logic;
   SIGNAL ctrl_thres_oi       : DATA_T;
   SIGNAL ctrl_wchgd_oi       : std_logic;
   SIGNAL ctrl_wr_vec_oi      : MEM_WR_LINES_T;
   SIGNAL ctrl_wrlat_oi       : MEM_LAT_CNT_WIDTH_T;
   SIGNAL rst_n_oi            : std_logic;
   SIGNAL set_initi_oi        : std_logic;
   SIGNAL set_initj_oi        : std_logic;
   SIGNAL starti_val_oi       : ADDRESS_S_T;
   SIGNAL startj_val_oi       : ADDRESS_T_T;
   SIGNAL stopi_val_oi        : ADDRESS_S_T;
   SIGNAL stopj_val_oi        : ADDRESS_T_T;


   -- Component Declarations
   COMPONENT p0300_m00021_s_v03_wishbone_fsm
   PORT (
      clk_i              : IN     std_logic ;
      ctrl_alllat_i      : IN     MEM_LAT_CNT_WIDTH_T ;
      ctrl_complete_i    : IN     std_logic ;
      ctrl_dout_i        : IN     DATA_T ;
      ctrl_dout_valid_i  : IN     std_logic ;
      ctrl_epoch_i       : IN     WB_DATA_WIDTH_T ;
      ctrl_int_test_i    : IN     std_logic ;
      ctrl_int_train_i   : IN     std_logic ;
      ctrl_memerr_i      : IN     std_logic ;
      ctrl_not_rdy6_i    : IN     std_logic ;
      ctrl_rdlat_i       : IN     MEM_LAT_CNT_WIDTH_T ;
      ctrl_rdy1_i        : IN     std_logic ;
      ctrl_rdy2_i        : IN     std_logic ;
      ctrl_rdy3_i        : IN     std_logic ;
      ctrl_rdy4_i        : IN     std_logic ;
      ctrl_rdy5_i        : IN     std_logic ;
      ctrl_rdy6_i        : IN     std_logic ;
      ctrl_run7_i        : IN     std_logic ;
      ctrl_wrlat_i       : IN     MEM_LAT_CNT_WIDTH_T ;
      rst_n_i            : IN     std_logic ;
      wb_adr_i           : IN     WB_ADDR_WIDTH_T ;
      wb_cyc_i           : IN     std_logic ;
      wb_dat_i           : IN     WB_DATA_WIDTH_T ;
      wb_stb_i           : IN     std_logic ;
      wb_we_i            : IN     std_logic ;
      ctrl_bias_o        : OUT    DATA_T ;
      ctrl_clear_epoch_o : OUT    std_logic ;
      ctrl_din_o         : OUT    DATA_T ;
      ctrl_int_o         : OUT    std_logic ;
      ctrl_maxepoch_o    : OUT    WB_DATA_WIDTH_T ;
      ctrl_offset_o      : OUT    DATA_T ;
      ctrl_rd_vec_o      : OUT    MEM_WR_LINES_T ;
      ctrl_set_starti_o  : OUT    std_logic ;
      ctrl_set_startj_o  : OUT    std_logic ;
      ctrl_start3_o      : OUT    std_logic ;
      ctrl_start4_o      : OUT    std_logic ;
      ctrl_start5_o      : OUT    std_logic ;
      ctrl_start6_o      : OUT    std_logic ;
      ctrl_starti_val_o  : OUT    ADDRESS_S_T ;
      ctrl_startj_val_o  : OUT    ADDRESS_T_T ;
      ctrl_stopi_val_o   : OUT    ADDRESS_S_T ;
      ctrl_stopj_val_o   : OUT    ADDRESS_T_T ;
      ctrl_thres_o       : OUT    DATA_T ;
      ctrl_wr_vec_o      : OUT    MEM_WR_LINES_T ;
      wb_ack_o           : OUT    std_logic ;
      wb_dat_o           : OUT    WB_DATA_WIDTH_T 
   );
   END COMPONENT;
   COMPONENT p0300_m00022_s_v02_cal_y_fsm
   PORT (
      clk_i        : IN     std_logic ;
      cnti_end_i   : IN     std_logic ;
      cntj_end_i   : IN     std_logic ;
      ctrl_rdlat_i : IN     MEM_LAT_CNT_WIDTH_T ;
      ctrl_rdy7_i  : IN     std_logic ;
      ctrl_start_i : IN     std_logic ;
      ctrl_thres_i : IN     DATA_T ;
      ctrl_wrlat_i : IN     MEM_LAT_CNT_WIDTH_T ;
      dbias_i      : IN     DATA_T ;
      ds_i         : IN     DATA_T ;
      dw_i         : IN     DATA_T ;
      rst_n_i      : IN     std_logic ;
      cnteni_o     : OUT    std_logic ;
      cntenj_o     : OUT    std_logic ;
      ctrl_rdy_o   : OUT    std_logic ;
      dout_o       : OUT    DATA_T ;
      we_y_o       : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT p0300_m00023_s_v02_cal_w_fsm
   PORT (
      clk_i        : IN     std_logic ;
      cnti_end_i   : IN     std_logic ;
      cntj_end_i   : IN     std_logic ;
      ctrl_rdlat_i : IN     MEM_LAT_CNT_WIDTH_T ;
      ctrl_rdy7_i  : IN     std_logic ;
      ctrl_start_i : IN     std_logic ;
      ctrl_wrlat_i : IN     MEM_LAT_CNT_WIDTH_T ;
      dbias_i      : IN     DATA_T ;
      ds_i         : IN     DATA_T ;
      dt_i         : IN     DATA_T ;
      dw_i         : IN     DATA_T ;
      dy_i         : IN     DATA_T ;
      rst_n_i      : IN     std_logic ;
      cnteni_o     : OUT    std_logic ;
      cntenj_o     : OUT    std_logic ;
      ctrl_rdy_o   : OUT    std_logic ;
      ctrl_wchgd_o : OUT    std_logic ;
      dout_o       : OUT    DATA_T ;
      we_bias_o    : OUT    std_logic ;
      we_w_o       : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT p0300_m00024_s_v02_test_fsm
   PORT (
      clk_i        : IN     std_logic ;
      cnti_end_i   : IN     std_logic ;
      cntj_end_i   : IN     std_logic ;
      ctrl_rdlat_i : IN     MEM_LAT_CNT_WIDTH_T ;
      ctrl_rdy7_i  : IN     std_logic ;
      ctrl_start_i : IN     std_logic ;
      ctrl_wrlat_i : IN     MEM_LAT_CNT_WIDTH_T ;
      ds_i         : IN     DATA_T ;
      dt_i         : IN     DATA_T ;
      dw_i         : IN     DATA_T ;
      offset_i     : IN     DATA_T ;
      rst_n_i      : IN     std_logic ;
      cnteni_o     : OUT    std_logic ;
      cntenj_o     : OUT    std_logic ;
      ctrl_int_o   : OUT    std_logic ;
      ctrl_rdy_o   : OUT    std_logic ;
      dout_o       : OUT    DATA_T ;
      we_s_o       : OUT    std_logic ;
      we_t_o       : OUT    std_logic ;
      we_w_o       : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT p0300_m00025_s_v02_init_fsm
   PORT (
      clk_i        : IN     std_logic ;
      cnti_end_i   : IN     std_logic ;
      cntj_end_i   : IN     std_logic ;
      ctrl_bias_i  : IN     DATA_T ;
      ctrl_rdlat_i : IN     MEM_LAT_CNT_WIDTH_T ;
      ctrl_rdy7_i  : IN     std_logic ;
      ctrl_start_i : IN     std_logic ;
      ctrl_wrlat_i : IN     MEM_LAT_CNT_WIDTH_T ;
      rst_n_i      : IN     std_logic ;
      cnteni_o     : OUT    std_logic ;
      cntenj_o     : OUT    std_logic ;
      ctrl_rdy_o   : OUT    std_logic ;
      dout_o       : OUT    DATA_T ;
      we_bias_o    : OUT    std_logic ;
      we_s_o       : OUT    std_logic ;
      we_t_o       : OUT    std_logic ;
      we_w_o       : OUT    std_logic ;
      we_y_o       : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT p0300_m00026_s_v02_rd_wr_fsm
   PORT (
      clk_i             : IN     std_logic ;
      cnti_end_i        : IN     std_logic ;
      cntj_end_i        : IN     std_logic ;
      ctrl_din_i        : IN     DATA_T ;
      ctrl_rd_vec_i     : IN     MEM_WR_LINES_T ;
      ctrl_rdlat_i      : IN     MEM_LAT_CNT_WIDTH_T ;
      ctrl_rdy7_i       : IN     std_logic ;
      ctrl_start_i      : IN     std_logic ;
      ctrl_wr_vec_i     : IN     MEM_WR_LINES_T ;
      ctrl_wrlat_i      : IN     MEM_LAT_CNT_WIDTH_T ;
      dbias_i           : IN     DATA_T ;
      ds_i              : IN     DATA_T ;
      dt_i              : IN     DATA_T ;
      dw_i              : IN     DATA_T ;
      dy_i              : IN     DATA_T ;
      rst_n_i           : IN     std_logic ;
      cnteni_o          : OUT    std_logic ;
      cntenj_o          : OUT    std_logic ;
      ctrl_complete_o   : OUT    std_logic ;
      ctrl_dout_o       : OUT    DATA_T ;
      ctrl_dout_valid_o : OUT    std_logic ;
      ctrl_rdy_o        : OUT    std_logic ;
      dout_o            : OUT    DATA_T ;
      we_bias_o         : OUT    std_logic ;
      we_s_o            : OUT    std_logic ;
      we_t_o            : OUT    std_logic ;
      we_w_o            : OUT    std_logic ;
      we_y_o            : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT p0300_m00027_s_v01_train_fsm
   PORT (
      clk_i              : IN     std_logic ;
      cnti_rdy_i         : IN     std_logic ;
      cntj_rdy_i         : IN     std_logic ;
      ctrl_clear_epoch_i : IN     std_logic ;
      ctrl_maxepoch_i    : IN     WB_DATA_WIDTH_T ;
      ctrl_rdy1_i        : IN     std_logic ;
      ctrl_rdy2_i        : IN     std_logic ;
      ctrl_rdy7_i        : IN     std_logic ;
      ctrl_start_i       : IN     std_logic ;
      ctrl_wchgd_i       : IN     std_logic ;
      rst_n_i            : IN     std_logic ;
      ctrl_epoch_o       : OUT    WB_DATA_WIDTH_T ;
      ctrl_int_o         : OUT    std_logic ;
      ctrl_not_rdy_o     : OUT    std_logic ;
      ctrl_rdy_o         : OUT    std_logic ;
      ctrl_start1_o      : OUT    std_logic ;
      ctrl_start2_o      : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT p0300_m00028_s_v02_latency_fsm
   PORT (
      clk_i         : IN     std_logic ;
      dw_i          : IN     DATA_T ;
      rst_n_i       : IN     std_logic ;
      cnt_alllat_o  : OUT    MEM_LAT_CNT_WIDTH_T ;
      cnteni_o      : OUT    std_logic ;
      cntenj_o      : OUT    std_logic ;
      ctrl_memerr_o : OUT    std_logic ;
      ctrl_rdlat_o  : OUT    MEM_LAT_CNT_WIDTH_T ;
      ctrl_rdy_o    : OUT    std_logic ;
      ctrl_run_o    : OUT    std_logic ;
      ctrl_wrlat_o  : OUT    MEM_LAT_CNT_WIDTH_T ;
      dout_o        : OUT    DATA_T ;
      we_w_o        : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT p0300_m00033_s_v01_for_loop_memwi_fsm
   PORT (
      clk_i        : IN     std_logic ;
      cnten1_i     : IN     std_logic ;
      cnten2_i     : IN     std_logic ;
      cnten3_i     : IN     std_logic ;
      cnten4_i     : IN     std_logic ;
      cnten5_i     : IN     std_logic ;
      cnten7_i     : IN     std_logic ;
      rst_n_i      : IN     std_logic ;
      set_init_i   : IN     std_logic ;
      start_vali_i : IN     ADDRESS_S_T ;
      stop_vali_i  : IN     ADDRESS_S_T ;
      cnt_end_o    : OUT    std_logic ;
      cnt_rdy_o    : OUT    std_logic ;
      cnt_val_o    : OUT    ADDRESS_S_T 
   );
   END COMPONENT;
   COMPONENT p0300_m00034_s_v01_for_loop_memwj_fsm
   PORT (
      clk_i        : IN     std_logic ;
      cnten1_i     : IN     std_logic ;
      cnten2_i     : IN     std_logic ;
      cnten3_i     : IN     std_logic ;
      cnten4_i     : IN     std_logic ;
      cnten5_i     : IN     std_logic ;
      cnten7_i     : IN     std_logic ;
      rst_n_i      : IN     std_logic ;
      set_init_i   : IN     std_logic ;
      start_valj_i : IN     ADDRESS_T_T ;
      stop_valj_i  : IN     ADDRESS_T_T ;
      cnt_end_o    : OUT    std_logic ;
      cnt_rdy_o    : OUT    std_logic ;
      cnt_val_o    : OUT    ADDRESS_T_T 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : p0300_m00021_s_v03_wishbone_fsm USE ENTITY work.p0300_m00021_s_v03_wishbone_fsm;
   FOR ALL : p0300_m00022_s_v02_cal_y_fsm USE ENTITY work.p0300_m00022_s_v02_cal_y_fsm;
   FOR ALL : p0300_m00023_s_v02_cal_w_fsm USE ENTITY work.p0300_m00023_s_v02_cal_w_fsm;
   FOR ALL : p0300_m00024_s_v02_test_fsm USE ENTITY work.p0300_m00024_s_v02_test_fsm;
   FOR ALL : p0300_m00025_s_v02_init_fsm USE ENTITY work.p0300_m00025_s_v02_init_fsm;
   FOR ALL : p0300_m00026_s_v02_rd_wr_fsm USE ENTITY work.p0300_m00026_s_v02_rd_wr_fsm;
   FOR ALL : p0300_m00027_s_v01_train_fsm USE ENTITY work.p0300_m00027_s_v01_train_fsm;
   FOR ALL : p0300_m00028_s_v02_latency_fsm USE ENTITY work.p0300_m00028_s_v02_latency_fsm;
   FOR ALL : p0300_m00033_s_v01_for_loop_memwi_fsm USE ENTITY work.p0300_m00033_s_v01_for_loop_memwi_fsm;
   FOR ALL : p0300_m00034_s_v01_for_loop_memwj_fsm USE ENTITY work.p0300_m00034_s_v01_for_loop_memwj_fsm;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   -- eb1 1
   rst_n_oi <= NOT ( rst_i );


   -- Instance port mappings.
   U_14 : p0300_m00021_s_v03_wishbone_fsm
      PORT MAP (
         clk_i              => clk_i,
         ctrl_alllat_i      => cnt_alllat_oi,
         ctrl_complete_i    => ctrl_complete_oi,
         ctrl_dout_i        => ctrl_dout_oi,
         ctrl_dout_valid_i  => ctrl_dout_valid_oi,
         ctrl_epoch_i       => ctrl_epoch_oi,
         ctrl_int_test_i    => ctrl_int4_o,
         ctrl_int_train_i   => ctrl_int6_o,
         ctrl_memerr_i      => ctrl_memerr_oi,
         ctrl_not_rdy6_i    => ctrl_not_rdy6_oi,
         ctrl_rdlat_i       => ctrl_rdlat_oi,
         ctrl_rdy1_i        => ctrl_rdy1_oi,
         ctrl_rdy2_i        => ctrl_rdy2_oi,
         ctrl_rdy3_i        => ctrl_rdy3_oi,
         ctrl_rdy4_i        => ctrl_rdy4_oi,
         ctrl_rdy5_i        => ctrl_rdy5_oi,
         ctrl_rdy6_i        => ctrl_rdy6_oi,
         ctrl_run7_i        => ctrl_run7_oi,
         ctrl_wrlat_i       => ctrl_wrlat_oi,
         rst_n_i            => rst_n_oi,
         wb_adr_i           => wb_adr_i,
         wb_cyc_i           => wb_cyc_i,
         wb_dat_i           => wb_dat_i,
         wb_stb_i           => wb_stb_i,
         wb_we_i            => wb_we_i,
         ctrl_bias_o        => ctrl_bias_oi,
         ctrl_clear_epoch_o => ctrl_clear_epoch_oi,
         ctrl_din_o         => ctrl_din_oi,
         ctrl_int_o         => ctrl_int_o,
         ctrl_maxepoch_o    => ctrl_maxepoch_oi,
         ctrl_offset_o      => ctrl_offset_oi,
         ctrl_rd_vec_o      => ctrl_rd_vec_oi,
         ctrl_set_starti_o  => set_initi_oi,
         ctrl_set_startj_o  => set_initj_oi,
         ctrl_start3_o      => ctrl_start3_oi,
         ctrl_start4_o      => ctrl_start4_oi,
         ctrl_start5_o      => ctrl_start5_oi,
         ctrl_start6_o      => ctrl_start6_oi,
         ctrl_starti_val_o  => starti_val_oi,
         ctrl_startj_val_o  => startj_val_oi,
         ctrl_stopi_val_o   => stopi_val_oi,
         ctrl_stopj_val_o   => stopj_val_oi,
         ctrl_thres_o       => ctrl_thres_oi,
         ctrl_wr_vec_o      => ctrl_wr_vec_oi,
         wb_ack_o           => wb_ack_o,
         wb_dat_o           => wb_dat_o
      );
   U_0 : p0300_m00022_s_v02_cal_y_fsm
      PORT MAP (
         clk_i        => clk_i,
         cnti_end_i   => cnti_end_oi,
         cntj_end_i   => cntj_end_oi,
         ctrl_rdlat_i => ctrl_rdlat_oi,
         ctrl_rdy7_i  => ctrl_rdy7_oi,
         ctrl_start_i => ctrl_start1_oi,
         ctrl_thres_i => ctrl_thres_oi,
         ctrl_wrlat_i => ctrl_wrlat_oi,
         dbias_i      => dbias_i,
         ds_i         => ds_i,
         dw_i         => dw_i,
         rst_n_i      => rst_n_oi,
         cnteni_o     => cnteni1_oi,
         cntenj_o     => cntenj1_oi,
         ctrl_rdy_o   => ctrl_rdy1_oi,
         dout_o       => dout1_o,
         we_y_o       => we_y1_o
      );
   U_8 : p0300_m00023_s_v02_cal_w_fsm
      PORT MAP (
         clk_i        => clk_i,
         cnti_end_i   => cnti_end_oi,
         cntj_end_i   => cntj_end_oi,
         ctrl_rdlat_i => ctrl_rdlat_oi,
         ctrl_rdy7_i  => ctrl_rdy7_oi,
         ctrl_start_i => ctrl_start2_oi,
         ctrl_wrlat_i => ctrl_wrlat_oi,
         dbias_i      => dbias_i,
         ds_i         => ds_i,
         dt_i         => dt_i,
         dw_i         => dw_i,
         dy_i         => dy_i,
         rst_n_i      => rst_n_oi,
         cnteni_o     => cnteni2_oi,
         cntenj_o     => cntenj2_oi,
         ctrl_rdy_o   => ctrl_rdy2_oi,
         ctrl_wchgd_o => ctrl_wchgd_oi,
         dout_o       => dout2_o,
         we_bias_o    => we_bias2_o,
         we_w_o       => we_w2_o
      );
   U_10 : p0300_m00024_s_v02_test_fsm
      PORT MAP (
         clk_i        => clk_i,
         cnti_end_i   => cnti_end_oi,
         cntj_end_i   => cntj_end_oi,
         ctrl_rdlat_i => ctrl_rdlat_oi,
         ctrl_rdy7_i  => ctrl_rdy7_oi,
         ctrl_start_i => ctrl_start4_oi,
         ctrl_wrlat_i => ctrl_wrlat_oi,
         ds_i         => ds_i,
         dt_i         => dt_i,
         dw_i         => dw_i,
         offset_i     => ctrl_offset_oi,
         rst_n_i      => rst_n_oi,
         cnteni_o     => cnteni4_oi,
         cntenj_o     => cntenj4_oi,
         ctrl_int_o   => ctrl_int4_o,
         ctrl_rdy_o   => ctrl_rdy4_oi,
         dout_o       => dout4_o,
         we_s_o       => we_s4_o,
         we_t_o       => we_t4_o,
         we_w_o       => we_w4_o
      );
   U_9 : p0300_m00025_s_v02_init_fsm
      PORT MAP (
         clk_i        => clk_i,
         cnti_end_i   => cnti_end_oi,
         cntj_end_i   => cntj_end_oi,
         ctrl_bias_i  => ctrl_bias_oi,
         ctrl_rdlat_i => ctrl_rdlat_oi,
         ctrl_rdy7_i  => ctrl_rdy7_oi,
         ctrl_start_i => ctrl_start3_oi,
         ctrl_wrlat_i => ctrl_wrlat_oi,
         rst_n_i      => rst_n_oi,
         cnteni_o     => cnteni3_oi,
         cntenj_o     => cntenj3_oi,
         ctrl_rdy_o   => ctrl_rdy3_oi,
         dout_o       => dout3_o,
         we_bias_o    => we_bias3_o,
         we_s_o       => we_s3_o,
         we_t_o       => we_t3_o,
         we_w_o       => we_w3_o,
         we_y_o       => we_y3_o
      );
   U_11 : p0300_m00026_s_v02_rd_wr_fsm
      PORT MAP (
         clk_i             => clk_i,
         cnti_end_i        => cnti_end_oi,
         cntj_end_i        => cntj_end_oi,
         ctrl_din_i        => ctrl_din_oi,
         ctrl_rd_vec_i     => ctrl_rd_vec_oi,
         ctrl_rdlat_i      => ctrl_rdlat_oi,
         ctrl_rdy7_i       => ctrl_rdy7_oi,
         ctrl_start_i      => ctrl_start5_oi,
         ctrl_wr_vec_i     => ctrl_wr_vec_oi,
         ctrl_wrlat_i      => ctrl_wrlat_oi,
         dbias_i           => dbias_i,
         ds_i              => ds_i,
         dt_i              => dt_i,
         dw_i              => dw_i,
         dy_i              => dy_i,
         rst_n_i           => rst_n_oi,
         cnteni_o          => cnteni5_oi,
         cntenj_o          => cntenj5_oi,
         ctrl_complete_o   => ctrl_complete_oi,
         ctrl_dout_o       => ctrl_dout_oi,
         ctrl_dout_valid_o => ctrl_dout_valid_oi,
         ctrl_rdy_o        => ctrl_rdy5_oi,
         dout_o            => dout5_o,
         we_bias_o         => we_bias5_o,
         we_s_o            => we_s5_o,
         we_t_o            => we_t5_o,
         we_w_o            => we_w5_o,
         we_y_o            => we_y5_o
      );
   U_12 : p0300_m00027_s_v01_train_fsm
      PORT MAP (
         clk_i              => clk_i,
         cnti_rdy_i         => cnti_rdy_oi,
         cntj_rdy_i         => cntj_rdy_oi,
         ctrl_clear_epoch_i => ctrl_clear_epoch_oi,
         ctrl_maxepoch_i    => ctrl_maxepoch_oi,
         ctrl_rdy1_i        => ctrl_rdy1_oi,
         ctrl_rdy2_i        => ctrl_rdy2_oi,
         ctrl_rdy7_i        => ctrl_rdy7_oi,
         ctrl_start_i       => ctrl_start6_oi,
         ctrl_wchgd_i       => ctrl_wchgd_oi,
         rst_n_i            => rst_n_oi,
         ctrl_epoch_o       => ctrl_epoch_oi,
         ctrl_int_o         => ctrl_int6_o,
         ctrl_not_rdy_o     => ctrl_not_rdy6_oi,
         ctrl_rdy_o         => ctrl_rdy6_oi,
         ctrl_start1_o      => ctrl_start1_oi,
         ctrl_start2_o      => ctrl_start2_oi
      );
   U_13 : p0300_m00028_s_v02_latency_fsm
      PORT MAP (
         clk_i         => clk_i,
         dw_i          => dw_i,
         rst_n_i       => rst_n_oi,
         cnt_alllat_o  => cnt_alllat_oi,
         cnteni_o      => cnteni7_oi,
         cntenj_o      => cntenj7_oi,
         ctrl_memerr_o => ctrl_memerr_oi,
         ctrl_rdlat_o  => ctrl_rdlat_oi,
         ctrl_rdy_o    => ctrl_rdy7_oi,
         ctrl_run_o    => ctrl_run7_oi,
         ctrl_wrlat_o  => ctrl_wrlat_oi,
         dout_o        => dout7_o,
         we_w_o        => we_w7_o
      );
   U_2 : p0300_m00033_s_v01_for_loop_memwi_fsm
      PORT MAP (
         clk_i        => clk_i,
         cnten1_i     => cnteni1_oi,
         cnten2_i     => cnteni2_oi,
         cnten3_i     => cnteni3_oi,
         cnten4_i     => cnteni4_oi,
         cnten5_i     => cnteni5_oi,
         cnten7_i     => cnteni7_oi,
         rst_n_i      => rst_n_oi,
         set_init_i   => set_initi_oi,
         start_vali_i => starti_val_oi,
         stop_vali_i  => stopi_val_oi,
         cnt_end_o    => cnti_end_oi,
         cnt_rdy_o    => cnti_rdy_oi,
         cnt_val_o    => addr_i_o
      );
   U_1 : p0300_m00034_s_v01_for_loop_memwj_fsm
      PORT MAP (
         clk_i        => clk_i,
         cnten1_i     => cntenj1_oi,
         cnten2_i     => cntenj2_oi,
         cnten3_i     => cntenj3_oi,
         cnten4_i     => cntenj4_oi,
         cnten5_i     => cntenj5_oi,
         cnten7_i     => cntenj7_oi,
         rst_n_i      => rst_n_oi,
         set_init_i   => set_initj_oi,
         start_valj_i => startj_val_oi,
         stop_valj_i  => stopj_val_oi,
         cnt_end_o    => cntj_end_oi,
         cnt_rdy_o    => cntj_rdy_oi,
         cnt_val_o    => addr_j_o
      );

END struct;
