///////////////////////////////////////////////////////////////////////////////
//
// Filename:      hodgkin_huxley.v
// Date Created:  Mar. 2012
// Last Modified: Mar. 2012
//
// Devices:   Stratix-4  FPGA
// Purpose:   Hodgkin Huxley Neuron Model
// Contact:   Kalin Ovtcharov
//
// Description: Single compartment Hodgkin Huxley neuron model
//
// TODO: Compartment Input Parameters for Multi-Compartment Model (OLM, 2006)
//
// Single Precision Format:
// -----------------------
//   ______ _________ __________   
//  |  31  |30     23| 22     0 |
//  |s-1bit| e-8bits | m-23bits |
//   ------ --------- ----------
// NOTE: Only supports round-to-nearest even mode.
//
// To convert between floating-point and binary representation, refer to the
// tool: http://www.h-schmidt.net/FloatApplet/IEEE754.html
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ns / 1 ps

  module hodgkin_huxley # (
    parameter
      MSB        = 31,
      LSB        =  0,
      NUM_REP    = "SINGLE_FP", // Number Representation
                                // "SINGLE_FP"  - Single Precision Floating Point, 32-bits
                                // "DOUBLE_FP"  - Double Precision Floating Point, 64-bits
                                // "FIXED"      - Fixed Point
      // Initial parameters
      g_NA_bar   = 32'h42F00000, // 120.0 IEEE-754, 32-bit floating-point representation
      g_K_bar    = 32'h40666666, // 3.6,
      g_leak     = 32'hBAAA64C3, // -0.0013, leakage current
      E_leak     = 32'hC2480000, // -50.0, leakage current
      E_NA       = 32'h42685604, // 58.0840
      E_K        = 32'hC2980F91, // -76.0304
      C_M        = 32'h3F800000, // 1.0, cell capacitance
      delta_t    = 32'h3C23D70A  // 10us, timestep
  ) (
    // Clocks and Resets
    input               i_clk,
    input               i_rst,
    // Input Valid
    input [MSB:LSB]     i_s,     // current input
    input               i_valid, // current input enable
    // Model Output
    output [MSB:LSB]    o_V,
    output              o_valid,
    output              o_rdy
  )/* synthesis multstyle = "dsp" */;

  // Pipeline Delay of a single Floating Point Unit (FPU)
  localparam FPU_DLY = 17;

  localparam Y1_INIT = 32'hC28C0000; // -70.0
  localparam Y2_INIT = 32'h3C7C5048; // 0.0154
  localparam Y3_INIT = 32'h3F5D7DBF; // 0.8652
  localparam Y4_INIT = 32'h3E395810; // 0.1810

  // Fixed-point type represented as a binary integer with b bits in two's
  // complement format, with a scaling factor of 1/2f (that is, the last f bits
  // are fraction bits): the minimum representable value is (-2^(b-1))/2f and
  // the maximum value is ((2^(b-1))-1)/2f

  // Y feedback registers, y(1) = V, y(2) = m_NA, y(3) = h_NA, y(4) = m_K
  reg            rdy;
  wire [MSB:LSB] y [1:4];
  reg  [MSB:LSB] y_reg [1:4];
  wire [MSB:LSB] y_new [1:4];
  wire [MSB:LSB] y1_new;
  wire           y1_new_en;
  wire [MSB:LSB] y2_new;
  reg  [MSB:LSB] y2_new_d [FPU_DLY-1:0];
  wire           y2_new_en;
  wire [MSB:LSB] y3_new;
  reg  [MSB:LSB] y3_new_d [FPU_DLY-1:0];
  wire           y3_new_en;
  wire [MSB:LSB] y4_new;
  wire           y4_new_en;
  reg  [MSB:LSB] y1_d [11*FPU_DLY-1:0];
  reg  [MSB:LSB] y2_d [11*FPU_DLY-1:0];
  reg  [MSB:LSB] y3_d [11*FPU_DLY-1:0];
  reg  [MSB:LSB] y4_d [11*FPU_DLY-1:0];
  wire [MSB:LSB] f [1:4];
  wire [1:4]     f_en;
  reg  [MSB:LSB] s_d [6*FPU_DLY-1:0];
  // Activation Parameters for I_NA (Sodium Current)
  wire [MSB:LSB] alpha_mNA;
  reg  [MSB:LSB] alpha_mNA_d[FPU_DLY-1:0];
  wire           alpha_mNA_en;
  wire [MSB:LSB] alpha_mNA_1;
  wire           alpha_mNA_1_en;
  wire [MSB:LSB] alpha_mNA_0;
  wire           alpha_mNA_0_en;
  reg  [MSB:LSB] alpha_mNA_0_d[FPU_DLY-1:0];
  wire [MSB:LSB] beta_mNA;
  reg  [MSB:LSB] beta_mNA_d[FPU_DLY-1:0];
  wire           beta_mNA_en;
  wire [MSB:LSB] t_m_NA;
  reg  [MSB:LSB] t_m_NA_d[FPU_DLY-1:0];
  wire           t_m_NA_en;
  wire [MSB:LSB] m_NA_infinity;
  wire           m_NA_infinity_en;
  // Inactivation Parameters for I_NA (Sodium Current)
  wire [MSB:LSB] alpha_hNA;
  reg  [MSB:LSB] alpha_hNA_d[2*FPU_DLY-1:0];
  wire           alpha_hNA_en;
  wire [MSB:LSB] beta_hNA_0;
  wire           beta_hNA_0_en;
  wire [MSB:LSB] beta_hNA_1;
  wire           beta_hNA_1_en;
  wire [MSB:LSB] beta_hNA;
  wire           beta_hNA_en;
  wire [MSB:LSB] h_NA_infinity;
  wire           h_NA_infinity_en;
  wire [MSB:LSB] t_h_NA;
  reg  [MSB:LSB] t_h_NA_d[FPU_DLY-1:0];
  wire           t_h_NA_en;
  // Activation Parameters for I_K (Potassium Current)
  wire [MSB:LSB] alpha_mK;
  reg  [MSB:LSB] alpha_mK_d[FPU_DLY-1:0];
  wire [MSB:LSB] alpha_mK_0;
  wire           alpha_mK_0_en;
  reg  [MSB:LSB] alpha_mK_0_d[FPU_DLY-1:0];
  wire [MSB:LSB] alpha_mK_1;
  wire           alpha_mK_en;
  wire [MSB:LSB] beta_mK;
  reg  [MSB:LSB] beta_mK_d[2*FPU_DLY-1:0];
  wire           beta_mK_en;
  wire [MSB:LSB] m_K_infinity;
  wire           m_K_infinity_en;
  wire [MSB:LSB] t_m_K;
  reg  [MSB:LSB] t_m_K_d[FPU_DLY-1:0];
  wire           t_m_K_en;
  wire [MSB:LSB] I_NA;
  wire           I_NA_en;
  wire [MSB:LSB] I_leak;
  reg  [MSB:LSB] I_leak_d[6*FPU_DLY-1:0];
  wire           I_leak_en;
  wire [MSB:LSB] I_K;
  reg  [MSB:LSB] I_K_d[FPU_DLY-1:0];
  wire           I_K_en;
  // Adder
  wire [MSB:LSB] y1_p30;
  wire           y1_p30_en;
  wire [MSB:LSB] y1_p30_neg;
  wire           y1_p30_neg_en;
  reg  [MSB:LSB] y1_p30_d [4*FPU_DLY-1:0];
  wire [MSB:LSB] y1_p35;
  wire           y1_p35_en;
  reg  [MSB:LSB] y1_p35_d [99:0];
  wire [MSB:LSB] y1_p35_neg;
  wire           y1_p35_neg_en;
  wire [MSB:LSB] y1_p50;
  reg  [MSB:LSB] y1_p50_d[5*FPU_DLY-1:0];
  wire           y1_p50_en;
  wire [MSB:LSB] y1_p50_neg;
  wire           y1_p50_neg_en;
  wire [MSB:LSB] y1_p60;
  wire           y1_p60_en;
  wire [MSB:LSB] y1_p60_neg;
  wire           y1_p60_neg_en;
  // Adder
  wire [MSB:LSB] add_4_result;
  wire           add_4_result_en;
  wire [MSB:LSB] add_5_result;
  wire           add_5_result_en;
  wire [MSB:LSB] add_6_result;
  wire           add_6_result_en;
  wire [MSB:LSB] add_7_result;
  wire           add_7_result_en;
  wire [MSB:LSB] add_8_result;
  wire           add_8_result_en;
  // Multiplier
  wire [MSB:LSB] mult_0_result;
  wire           mult_0_result_en;
  wire [MSB:LSB] mult_0_result_pos;
  wire           mult_0_result_pos_en;
  reg  [MSB:LSB] mult_0_result_d [FPU_DLY-1:0];
  wire [MSB:LSB] mult_1_result;
  wire           mult_1_result_en;
  wire [MSB:LSB] mult_4_result;
  wire           mult_4_result_en;
  wire [MSB:LSB] mult_5_result;
  wire           mult_5_result_en;
  wire [MSB:LSB] mult_6_result;
  wire           mult_6_result_en;
  wire [MSB:LSB] mult_7_result;
  wire           mult_7_result_en;
  wire [MSB:LSB] mult_8_result;
  wire           mult_8_result_en;
  wire [MSB:LSB] mult_9_result;
  wire           mult_9_result_en;
  wire [MSB:LSB] mult_10_result;
  wire           mult_10_result_en;
  wire [MSB:LSB] mult_11_result;
  wire           mult_11_result_en;
  wire [MSB:LSB] mult_12_result;
  wire           mult_12_result_en;
  wire [MSB:LSB] mult_13_result;
  wire           mult_13_result_en;
  wire [MSB:LSB] mult_14_result;
  wire           mult_14_result_en;
  wire [MSB:LSB] mult_15_result;
  wire           mult_15_result_en;
  wire [MSB:LSB] mult_16_result;
  wire           mult_16_result_en;
  wire [MSB:LSB] mult_17_result;
  wire           mult_17_result_en;
  wire [MSB:LSB] mult_18_result;
  wire           mult_18_result_en;
  wire [MSB:LSB] mult_19_result;
  wire           mult_19_result_en;
  wire [MSB:LSB] mult_20_result;
  wire           mult_20_result_en;
  wire [MSB:LSB] mult_21_result;
  wire           mult_21_result_en;
  wire [MSB:LSB] mult_22_result;
  wire           mult_22_result_en;
  wire [MSB:LSB] mult_23_result;
  wire           mult_23_result_en;
  // Exponent
  wire [MSB:LSB] exp_0_result;
  wire           exp_0_result_en;
  wire [MSB:LSB] exp_1_result;
  wire           exp_1_result_en;
  wire [MSB:LSB] exp_2_result;
  wire           exp_2_result_en;
  wire [MSB:LSB] exp_3_result;
  wire           exp_3_result_en;
  wire [MSB:LSB] exp_4_result;
  wire           exp_4_result_en;
  wire [MSB:LSB] exp_5_result;
  wire           exp_5_result_en;
  reg  [MSB:LSB] exp_5_result_d [FPU_DLY-1:0];
  reg  [FPU_DLY-1:0] exp_5_result_en_d;
  wire [MSB:LSB] exp_6_result;
  wire           exp_6_result_en;
  wire [MSB:LSB] exp_7_result;
  wire           exp_7_result_en;
  wire [MSB:LSB] exp_8_result;
  wire           exp_8_result_en;
  // Subtractor
  wire [MSB:LSB] sub_0_result;
  wire           sub_0_result_en;
  wire [MSB:LSB] sub_1_result;
  wire           sub_1_result_en;
  wire [MSB:LSB] sub_2_result;
  wire           sub_2_result_en;
  wire [MSB:LSB] sub_3_result;
  wire           sub_3_result_en;
  wire [MSB:LSB] sub_4_result;
  wire           sub_4_result_en;
  wire [MSB:LSB] sub_5_result;
  wire           sub_5_result_en;
  wire [MSB:LSB] sub_6_result;
  reg  [MSB:LSB] sub_6_result_d[FPU_DLY-1:0];
  wire           sub_6_result_en;
  wire [MSB:LSB] sub_8_result;
  wire           sub_8_result_en;
  wire [MSB:LSB] sub_9_result;
  wire           sub_9_result_en;
  wire [MSB:LSB] sub_10_result;
  wire           sub_10_result_en;
  wire [MSB:LSB] sub_11_result;
  wire           sub_11_result_en;
  wire [MSB:LSB] sub_12_result;
  wire           sub_12_result_en;
  wire [MSB:LSB] sub_13_result;
  wire           sub_13_result_en;
  // Divisor
  wire [MSB:LSB] div_2_result;
  wire           div_2_result_en;
  wire [MSB:LSB] div_6_result;
  wire           div_6_result_en;
  wire [MSB:LSB] div_7_result;
  wire           div_7_result_en;
  wire [MSB:LSB] div_7_result_neg;
  wire           div_7_result_neg_en;
  wire [MSB:LSB] div_13_result;
  wire           div_13_result_en;
  wire [MSB:LSB] div_13_result_neg;
  wire           div_13_result_neg_en;
  // adder errors
  wire            add_0_oflow;
  wire            add_0_uflow;
  wire            add_1_oflow;
  wire            add_1_uflow;
  wire            add_2_oflow;
  wire            add_2_uflow;
  wire            add_3_oflow;
  wire            add_3_uflow;
  wire            add_4_oflow;
  wire            add_4_uflow;
  wire            add_5_oflow;
  wire            add_5_uflow;
  wire            add_6_oflow;
  wire            add_6_uflow;
  wire            add_7_oflow;
  wire            add_7_uflow;
  wire            add_8_oflow;
  wire            add_8_uflow;
  wire            add_9_oflow;
  wire            add_9_uflow;
  wire            add_10_oflow;
  wire            add_10_uflow;
  wire            add_11_oflow;
  wire            add_11_uflow;
  wire            add_12_oflow;
  wire            add_12_uflow;
  // subtract errors
  wire            sub_0_oflow;
  wire            sub_0_uflow;
  wire            sub_1_oflow;
  wire            sub_1_uflow;
  wire            sub_2_oflow;
  wire            sub_2_uflow;
  wire            sub_3_oflow;
  wire            sub_3_uflow;
  wire            sub_4_oflow;
  wire            sub_4_uflow;
  wire            sub_5_oflow;
  wire            sub_5_uflow;
  wire            sub_6_oflow;
  wire            sub_6_uflow;
  wire            sub_7_oflow;
  wire            sub_7_uflow;
  wire            sub_8_oflow;
  wire            sub_8_uflow;
  wire            sub_9_oflow;
  wire            sub_9_uflow;
  wire            sub_10_oflow;
  wire            sub_10_uflow;
  wire            sub_11_oflow;
  wire            sub_11_uflow;
  wire            sub_12_oflow;
  wire            sub_12_uflow;
  wire            sub_13_oflow;
  wire            sub_13_uflow;
  // multiplier errors
  wire            mult_0_oflow;
  wire            mult_0_uflow;
  wire            mult_1_oflow;
  wire            mult_1_uflow;
  wire            mult_2_oflow;
  wire            mult_2_uflow;
  wire            mult_3_oflow;
  wire            mult_3_uflow;
  wire            mult_4_oflow;
  wire            mult_4_uflow;
  wire            mult_5_oflow;
  wire            mult_5_uflow;
  wire            mult_6_oflow;
  wire            mult_6_uflow;
  wire            mult_7_oflow;
  wire            mult_7_uflow;
  wire            mult_8_oflow;
  wire            mult_8_uflow;
  wire            mult_9_oflow;
  wire            mult_9_uflow;
  wire            mult_10_oflow;
  wire            mult_10_uflow;
  wire            mult_11_oflow;
  wire            mult_11_uflow;
  wire            mult_12_oflow;
  wire            mult_12_uflow;
  wire            mult_13_oflow;
  wire            mult_13_uflow;
  wire            mult_14_oflow;
  wire            mult_14_uflow;
  wire            mult_15_oflow;
  wire            mult_15_uflow;
  wire            mult_16_oflow;
  wire            mult_16_uflow;
  wire            mult_17_oflow;
  wire            mult_17_uflow;
  wire            mult_18_oflow;
  wire            mult_18_uflow;
  wire            mult_19_oflow;
  wire            mult_19_uflow;
  wire            mult_20_oflow;
  wire            mult_20_uflow;
  wire            mult_21_oflow;
  wire            mult_21_uflow;
  wire            mult_22_oflow;
  wire            mult_22_uflow;
  wire            mult_23_oflow;
  wire            mult_23_uflow;
  // exponent errors
  wire            exp_0_oflow;
  wire            exp_0_uflow;
  wire            exp_1_oflow;
  wire            exp_1_uflow;
  wire            exp_2_oflow;
  wire            exp_2_uflow;
  wire            exp_3_oflow;
  wire            exp_3_uflow;
  wire            exp_4_oflow;
  wire            exp_4_uflow;
  wire            exp_5_oflow;
  wire            exp_5_uflow;
  // divider errors
  wire            div_0_divbyzero;
  wire            div_0_oflow;
  wire            div_0_uflow;
  wire            div_1_divbyzero;
  wire            div_1_oflow;
  wire            div_1_uflow;
  wire            div_2_divbyzero;
  wire            div_2_oflow;
  wire            div_2_uflow;
  wire            div_3_divbyzero;
  wire            div_3_oflow;
  wire            div_3_uflow;
  wire            div_4_divbyzero;
  wire            div_4_oflow;
  wire            div_4_uflow;
  wire            div_5_divbyzero;
  wire            div_5_oflow;
  wire            div_5_uflow;
  wire            div_6_divbyzero;
  wire            div_6_oflow;
  wire            div_6_uflow;
  wire            div_7_divbyzero;
  wire            div_7_oflow;
  wire            div_7_uflow;
  wire            div_8_divbyzero;
  wire            div_8_oflow;
  wire            div_8_uflow;
  wire            div_9_divbyzero;
  wire            div_9_oflow;
  wire            div_9_uflow;
  wire            div_10_divbyzero;
  wire            div_10_oflow;
  wire            div_10_uflow;
  wire            div_11_divbyzero;
  wire            div_11_oflow;
  wire            div_11_uflow;
  wire            div_12_divbyzero;
  wire            div_12_oflow;
  wire            div_12_uflow;
  wire            div_13_divbyzero;
  wire            div_13_oflow;
  wire            div_13_uflow;
  wire            div_14_divbyzero;
  wire            div_14_oflow;
  wire            div_14_uflow;
  wire            div_15_divbyzero;
  wire            div_15_oflow;
  wire            div_15_uflow;
  wire            div_16_divbyzero;
  wire            div_16_oflow;
  wire            div_16_uflow;
  wire            div_17_divbyzero;
  wire            div_17_oflow;
  wire            div_17_uflow;
  wire            div_18_divbyzero;
  wire            div_18_oflow;
  wire            div_18_uflow;
  wire            div_19_divbyzero;
  wire            div_19_oflow;
  wire            div_19_uflow;

  generate
  /////////////////////////////////////////////////////////////////////
  // Single Precision Floating Point Number Representation (32-bits) //
  /////////////////////////////////////////////////////////////////////
  if (NUM_REP == "SINGLE_FP") begin : gen_single_fp
    // Delay data
    integer i;
    always @(posedge i_clk) begin
      s_d[0]             <= i_s;
      y1_d[0]            <= y[1];
      y2_d[0]            <= y[2];
      y3_d[0]            <= y[3];
      y4_d[0]            <= y[4];
      y2_new_d[0]        <= y2_new;
      y3_new_d[0]        <= y3_new;
      y1_p30_d[0]        <= y1_p30;
      y1_p35_d[0]        <= y1_p35;
      y1_p50_d[0]        <= y1_p50;
      alpha_mNA_0_d[0]   <= alpha_mNA_0;
      alpha_mNA_d[0]     <= alpha_mNA;
      alpha_hNA_d[0]     <= alpha_hNA;
      alpha_mK_d[0]      <= alpha_mK;
      alpha_mK_0_d[0]    <= alpha_mK_0;
      beta_mNA_d[0]      <= beta_mNA;
      beta_mK_d[0]       <= beta_mK;
      t_m_NA_d[0]        <= t_m_NA;
      t_h_NA_d[0]        <= t_h_NA;
      t_m_K_d[0]         <= t_m_K;
      I_K_d[0]           <= I_K;
      I_leak_d[0]        <= I_leak;
      mult_0_result_d[0] <= mult_0_result;
      exp_5_result_d[0]  <= exp_5_result;
      sub_6_result_d[0]  <= sub_6_result;
      // One FPU pipeline delay
      for (i=1; i<FPU_DLY; i=i+1) begin
        y2_new_d[i]        <= y2_new_d[i-1];
        y3_new_d[i]        <= y3_new_d[i-1];
        alpha_mNA_0_d[i]   <= alpha_mNA_0_d[i-1];
        alpha_mNA_d[i]     <= alpha_mNA_d[i-1];
        alpha_mK_d[i]      <= alpha_mK_d[i-1];
        alpha_mK_0_d[i]    <= alpha_mK_0_d[i-1];
        beta_mNA_d[i]      <= beta_mNA_d[i-1];
        t_m_NA_d[i]        <= t_m_NA_d[i-1];
        t_h_NA_d[i]        <= t_h_NA_d[i-1];
        t_m_K_d[i]         <= t_m_K_d[i-1];
        I_K_d[i]           <= I_K_d[i-1];
        mult_0_result_d[i] <= mult_0_result_d[i-1];
        exp_5_result_d[i]  <= exp_5_result_d[i-1];
        sub_6_result_d[i]  <= sub_6_result_d[i-1];
      end
      for (i=1; i<2*FPU_DLY; i=i+1) begin
        alpha_hNA_d[i] <= alpha_hNA_d[i-1];
        beta_mK_d[i]   <= beta_mK_d[i-1];
      end
      for (i=1; i<4*FPU_DLY; i=i+1) begin
        y1_p30_d[i] <= y1_p30_d[i-1];
      end
      for (i=1; i<5*FPU_DLY; i=i+1) begin
        y1_p35_d[i] <= y1_p35_d[i-1];
        y1_p50_d[i] <= y1_p50_d[i-1];
      end
      for (i=1; i<6*FPU_DLY; i=i+1) begin
        s_d[i]      <= s_d[i-1];
        I_leak_d[i] <= I_leak_d[i-1];
      end
      for (i=1; i<11*FPU_DLY; i=i+1) begin
        y1_d[i] <= y1_d[i-1];
        y2_d[i] <= y2_d[i-1];
        y3_d[i] <= y3_d[i-1];
        y4_d[i] <= y4_d[i-1];
      end
    end

    // Generate feedback
    always @(posedge i_clk) begin
      if (i_rst) begin
        y_reg[1] <= Y1_INIT;
        y_reg[2] <= Y2_INIT;
        y_reg[3] <= Y3_INIT;
        y_reg[4] <= Y4_INIT;
      end else begin
        // Capture output for next delta timestep calculation
        if (o_valid == 1'b1) begin
          y_reg[1] <= y_new[1];
          y_reg[2] <= y_new[2];
          y_reg[3] <= y_new[3];
          y_reg[4] <= y_new[4];
        end
      end
    end

    // For simulation
//    assign y[1] = (i_valid) ? y_reg[1] : 32'hxxxxxxxx;
//    assign y[2] = (i_valid) ? y_reg[2] : 32'hxxxxxxxx;
//    assign y[3] = (i_valid) ? y_reg[3] : 32'hxxxxxxxx;
//    assign y[4] = (i_valid) ? y_reg[4] : 32'hxxxxxxxx;
	 
	 assign y[1] = y_reg[1];
    assign y[2] = y_reg[2];
    assign y[3] = y_reg[3];
    assign y[4] = y_reg[4];

    // Generate Ready
    always @(posedge i_clk) begin
      if (i_rst) begin
        rdy <= 1'b1;
      end else begin
        if (i_valid == 1'b1) begin
          rdy <= 1'b0;
        end else if (o_valid == 1'b1) begin
          rdy <= 1'b1;
        end
      end
    end
    assign o_rdy = rdy;

    // 
    // Some common additions
    //
    // Add: y1 + 30.0
    altfp_add_sub_mf u_altfp_add_0 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b1), // add
      .dataa     (y[1]),
      .datab     (32'h41F00000), // 30.0
      .dataen    (i_valid),
      .zero      (),
      .nan       (),
      // Output
      .result    (y1_p30),
      .resulten  (y1_p30_en),
      // Errors
      .overflow  (add_0_oflow),
      .underflow (add_0_uflow)
    );

    // Negate: -y1_p30
    assign y1_p30_neg = {~y1_p30[31],y1_p30[30:0]};
    assign y1_p30_neg_en = y1_p30_en;

    // Add: y1 + 35.0
    altfp_add_sub_mf u_altfp_add_1 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b1), // add
      .dataa     (y[1]),
      .datab     (32'h420C0000), // 35
      .dataen    (i_valid),
      .zero      (),
      .nan       (),
      // Output
      .result    (y1_p35),
      .resulten  (y1_p35_en),
      // Errors
      .overflow  (add_1_oflow),
      .underflow (add_1_uflow)
    );

    // Negate: -y1_p35
    assign y1_p35_neg = {~y1_p35[31],y1_p35[30:0]};
    assign y1_p35_neg_en = y1_p35_en;

    // Add: y1 + 50.0
    altfp_add_sub_mf u_altfp_add_2 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b1), // add
      .dataa     (y[1]),
      .datab     (32'h42480000), // 50
      .dataen    (i_valid),
      .zero      (),
      .nan       (),
      // Output
      .result    (y1_p50),
      .resulten  (y1_p50_en),
      // Errors
      .overflow  (add_2_oflow),
      .underflow (add_2_uflow)
    );

    // Negate: -y1_p50
    assign y1_p50_neg = {~y1_p50[31],y1_p50[30:0]};
    assign y1_p50_neg_en = y1_p50_en;

    // Add: y1 + 60.0
    altfp_add_sub_mf u_altfp_add_3 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b1), // add
      .dataa     (y[1]),
      .datab     (32'h42700000), // 60
      .dataen    (i_valid),
      .zero      (),
      .nan       (),
      // Output
      .result    (y1_p60),
      .resulten  (y1_p60_en),
      // Errors
      .overflow  (add_3_oflow),
      .underflow (add_3_uflow)
    );

    // Negate: -y1_p60
    assign y1_p60_neg = {~y1_p60[31],y1_p60[30:0]};
    assign y1_p60_neg_en = y1_p60_en;


    ////////////////////
    // Sodium Current //
    ////////////////////

    // 
    // Activation Parameter for I_NA
    //
    ////////////////////////////////////////////////////////////////////////////
    // Calculate: alpha_mNA_0 = (-0.10 * y1_p35) / (exp(-1 * (y1_p35)) - 1)

    // Multiplication: (-0.10) * (y1_p35)
    altfp_mult_mf u_altfp_mult_0 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (y1_p35),
      .datab     (32'hBDCCCCCD), // -0.10
      .dataen    (y1_p35_en),
      .zero      (),
      .nan       (),
      // Output
      .result    (mult_0_result),
      .resulten  (mult_0_result_en),
      // Errors
      .overflow  (mult_0_oflow),
      .underflow (mult_0_uflow)
    );
    assign mult_0_result_pos = {~mult_0_result[MSB],mult_0_result[MSB-1:LSB]}; // (0.1 * y1_p35)
    assign mult_0_result_pos_en = mult_0_result_en;

    // Exponent: exp(-1 * (y1_p35)) 
    altfp_exp_mf u_altfp_exp_0 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .data      (y1_p35_neg),
      .dataen    (y1_p35_neg_en),
      // Output
      .result    (exp_0_result),
      .resulten  (exp_0_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (exp_0_oflow),
      .underflow (exp_0_uflow)
    );

    // Subtract: (exp(-1 * (y1_p35))) - (1))
    altfp_add_sub_mf u_altfp_sub_0 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b0),
      .dataa     (exp_0_result),
      .datab     (32'hBF800000), // -1
      .dataen    (exp_0_result_en),
      .zero      (),
      .nan       (),
      // Output
      .result    (sub_0_result),
      .resulten  (sub_0_result_en),
      // Errors
      .overflow  (sub_0_oflow),
      .underflow (sub_0_uflow)
    );

    // Division: ((-0.10) * (y1_p35)) / (exp(-1 * (y1_p35)) - 1)
    altfp_div_mf u_altfp_div_0 (
      .aclr              (i_rst),
      .clk_en            (1'b1),
      .clock             (i_clk),
      // Input
      .dataa             (mult_0_result_d[FPU_DLY-1]),
      .datab             (sub_0_result),
      .dataen            (sub_0_result_en),
      // Output
      .result            (alpha_mNA_0),
      .resulten          (alpha_mNA_0_en),
      .zero              (),
      .nan               (),
      // Errors
      .division_by_zero  (div_0_divbyzero),
      .overflow          (div_0_oflow),
      .underflow         (div_0_uflow)
    );
    // End Calculate: alpha_mNA_0
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    // Calculate: alpha_mNA_1 = (-0.1 * y1_p35 * exp(0.1 * y1_p35)) / (1 - exp(0.1 * y1_p35))

    // Exponentiation: exp((0.1 * y1_p35)) 
    altfp_exp_mf u_altfp_exp_1 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .data      (mult_0_result_pos),
      .dataen    (mult_0_result_pos_en),
      // Output
      .result    (exp_1_result),
      .resulten  (exp_1_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (exp_1_oflow),
      .underflow (exp_1_uflow)
    );

    // Multiplication: (-0.1 * y1_p35) * (exp(0.1 * y1_p35))
    altfp_mult_mf u_altfp_mult_1 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (mult_0_result_d[FPU_DLY-1]),
      .datab     (exp_1_result),
      .dataen    (exp_1_result_en),
      // Output
      .result    (mult_1_result),
      .resulten  (mult_1_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_1_oflow),
      .underflow (mult_1_uflow)
    );

    // Subtract: (1) - (exp(0.1 * y1_p35))
    altfp_add_sub_mf u_altfp_sub_1 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b0), // sub
      .dataa     (32'h3F800000), // 1
      .datab     (exp_1_result),
      .dataen    (exp_1_result_en),
      .zero      (),
      .nan       (),
      // Output
      .result    (sub_1_result),
      .resulten  (sub_1_result_en),
      // Errors
      .overflow  (sub_1_oflow),
      .underflow (sub_1_uflow)
    );

    // Division: (-0.1 * y1_p35 * exp(0.1 * y1_p35)) / (1 - exp(0.1 * y1_p35))
    altfp_div_mf u_altfp_div_1 (
      .aclr              (i_rst),
      .clk_en            (1'b1),
      .clock             (i_clk),
      // Input
      .dataa             (mult_1_result),
      .datab             (sub_1_result),
      .dataen            (sub_1_result_en),
      // Output
      .result            (alpha_mNA_1),
      .resulten          (alpha_mNA_1_en),
      .zero              (),
      .nan               (),
      // Errors
      .division_by_zero  (div_1_divbyzero),
      .overflow          (div_1_oflow),
      .underflow         (div_1_uflow)
    );
    // End Calculate: alpha_mNA_1
    ////////////////////////////////////////////////////////////////////////////

    // Multiplex depending on value of y1_p35
    assign alpha_mNA = ((y1_p35_d[4*FPU_DLY-1][31] == 1'b0) && (|y1_p35_d[4*FPU_DLY-1][30:0] == 1'b1)) ? // y1_p35_d > 0
                        alpha_mNA_0_d[FPU_DLY-1] : alpha_mNA_1;
    assign alpha_mNA_en = alpha_mNA_1_en;

    ////////////////////////////////////////////////////////////////////////////
    // Calculate: beta_mNA = 4 * exp((-1 * y1_p60) / 18)

    // Division: (-1 * y1_p60) / (18)
    altfp_div_mf u_altfp_div_2 (
      .aclr              (i_rst),
      .clk_en            (1'b1),
      .clock             (i_clk),
      // Input
      .dataa             (y1_p60_neg),
      .datab             (32'h41900000), // 18.0
      .dataen            (y1_p60_neg_en),
      // Output
      .result            (div_2_result),
      .resulten          (div_2_result_en),
      .zero              (),
      .nan               (),
      // Errors
      .division_by_zero  (div_2_divbyzero),
      .overflow          (div_2_oflow),
      .underflow         (div_2_uflow)
    );

    // Exponent: exp((-1 * y1_p60) / 18) 
    altfp_exp_mf u_altfp_exp_2 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .data      (div_2_result),
      .dataen    (div_2_result_en),
      // Output
      .result    (exp_2_result),
      .resulten  (exp_2_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (exp_2_oflow),
      .underflow (exp_2_uflow)
    );

    // Multiplication: (4) * (exp((-1 * y1_p60) / 18))
    altfp_mult_mf u_altfp_mult_2 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (exp_2_result),
      .datab     (32'h40800000), // 4.0
      .dataen    (exp_2_result_en),
      // Output
      .result    (beta_mNA),
      .resulten  (beta_mNA_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_2_oflow),
      .underflow (mult_2_uflow)
    );
    // End Calculate: beta_mNA
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    // Calculate: m_NA_infinity = alpha_mNA / (alpha_mNA + beta_mNA)

    // Add: (alpha_mNA) + (beta_mNA)
    altfp_add_sub_mf u_altfp_add_4 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b1), // add
      .dataa     (alpha_mNA),
      .datab     (beta_mNA_d[FPU_DLY-1]),
      .dataen    (alpha_mNA_en),
      .zero      (),
      .nan       (),
      // Output
      .result    (add_4_result),
      .resulten  (add_4_result_en),
      // Errors
      .overflow  (add_4_oflow),
      .underflow (add_4_uflow)
    );

    // Division: (alpha_mNA) / (alpha_mNA + beta_mNA)
    altfp_div_mf u_altfp_div_3 (
      .aclr              (i_rst),
      .clk_en            (1'b1),
      .clock             (i_clk),
      // Input
      .dataa             (alpha_mNA_d[FPU_DLY-1]),
      .datab             (add_4_result),
      .dataen            (add_4_result_en),
      // Output
      .result            (m_NA_infinity),
      .resulten          (m_NA_infinity_en),
      .zero              (),
      .nan               (),
      // Errors
      .division_by_zero  (div_3_divbyzero),
      .overflow          (div_3_oflow),
      .underflow         (div_3_uflow)
    );
    // End Calculate: m_NA_infinity
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    // Calculate: t_m_NA = 1 / (alpha_mNA + beta_mNA)
    altfp_div_mf u_altfp_div_4 (
      .aclr              (i_rst),
      .clk_en            (1'b1),
      .clock             (i_clk),
      // Input
      .dataa             (32'h3F800000), // 1
      .datab             (add_4_result),
      .dataen            (add_4_result_en),
      // Output
      .result            (t_m_NA),
      .resulten          (t_m_NA_en),
      .zero              (),
      .nan               (),
      // Errors
      .division_by_zero  (div_4_divbyzero),
      .overflow          (div_4_oflow),
      .underflow         (div_4_uflow)
    );
    // End Calculate: t_m_NA
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    // Calculate: f2 (m_NA) = (m_NA_infinity - y[2]) / t_m_NA

    // Subtract:  (m_NA_infinity) - (y[2])
    altfp_add_sub_mf u_altfp_sub_2 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b0), // sub
      .dataa     (m_NA_infinity),
      .datab     (y2_d[7*FPU_DLY-1]), // m_NA
      .dataen    (m_NA_infinity_en),
      .zero      (),
      .nan       (),
      // Output
      .result    (sub_2_result),
      .resulten  (sub_2_result_en),
      // Errors
      .overflow  (sub_2_oflow),
      .underflow (sub_2_uflow)
    );

    // Division: (m_NA_infinity - y[2]) / (t_m_NA)
    altfp_div_mf u_altfp_div_5 (
      .aclr              (i_rst),
      .clk_en            (1'b1),
      .clock             (i_clk),
      // Input
      .dataa             (sub_2_result),
      .datab             (t_m_NA_d[FPU_DLY-1]),
      .dataen            (sub_2_result_en),
      // Output
      .result            (f[2]),
      .resulten          (f_en[2]),
      .zero              (),
      .nan               (),
      // Errors
      .division_by_zero  (div_5_divbyzero),
      .overflow          (div_5_oflow),
      .underflow         (div_5_uflow)
    );

    // End Calculate: f2 (m_NA)
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    // Calculate: alpha_hNA = 0.07 * exp(-1 * y1_p60 / 20);

    // Division: (-1 * y1_p60) / (20)
    altfp_div_mf u_altfp_div_6 (
      .aclr              (i_rst),
      .clk_en            (1'b1),
      .clock             (i_clk),
      // Input
      .dataa             (y1_p60_neg),
      .datab             (32'h41A00000), // 20.0
      .dataen            (y1_p60_neg_en),
      // Output
      .result            (div_6_result),
      .resulten          (div_6_result_en),
      .zero              (),
      .nan               (),
      // Errors
      .division_by_zero  (div_6_divbyzero),
      .overflow          (div_6_oflow),
      .underflow         (div_6_uflow)
    );

    // Exponent: exp(-1 * y1_p60 / 20)
    altfp_exp_mf u_altfp_exp_3 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .data      (div_6_result),
      .dataen    (div_6_result_en),
      // Output
      .result    (exp_3_result),
      .resulten  (exp_3_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (exp_3_oflow),
      .underflow (exp_3_uflow)
    );

    // Multiplication: (0.07) * (exp(-1 * y1_p60 / 20))
    altfp_mult_mf u_altfp_mult_3 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (exp_3_result),
      .datab     (32'h3D8F5C29), // 0.07
      .dataen    (exp_3_result_en),
      // Output
      .result    (alpha_hNA),
      .resulten  (alpha_hNA_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_3_oflow),
      .underflow (mult_3_uflow)
    );

    // End Calculate: alpha_hNA
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    // Calculate: beta_hNA_0 = 1 / (1 + exp(-1 * y1_p30 / 10));

    // Division: (-y1_p35) / (10)
    altfp_div_mf u_altfp_div_7 (
      .aclr              (i_rst),
      .clk_en            (1'b1),
      .clock             (i_clk),
      // Input
      .dataa             (y1_p30_neg),
      .datab             (32'h41200000), // 10.0
      .dataen            (y1_p30_neg_en),
      // Output
      .result            (div_7_result),
      .resulten          (div_7_result_en),
      .zero              (),
      .nan               (),
      // Errors
      .division_by_zero  (div_7_divbyzero),
      .overflow          (div_7_oflow),
      .underflow         (div_7_uflow)
    );
    assign div_7_result_neg = {~div_7_result[MSB],div_7_result[MSB-1:LSB]};
    assign div_7_result_neg_en = div_7_result_en;

    // Exponent: exp(-1 * y1_p30 / 10)
    altfp_exp_mf u_altfp_exp_4 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .data      (div_7_result),
      .dataen    (div_7_result_en),
      // Output
      .result    (exp_4_result),
      .resulten  (exp_4_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (exp_4_oflow),
      .underflow (exp_4_uflow)
    );

    // Addition: (1) + (exp(-1 * y1_p30 / 10))
    altfp_add_sub_mf u_altfp_add_5 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b1), // add
      .dataa     (exp_4_result),
      .datab     (32'h3F800000), // 1.0
      .dataen    (exp_4_result_en),
      .zero      (),
      .nan       (),
      // Output
      .result    (add_5_result),
      .resulten  (add_5_result_en),
      // Errors
      .overflow  (add_5_oflow),
      .underflow (add_5_uflow)
    );

    // Reciprocal: (1) / (1 + exp(-1 * y1_p30 / 10))
    altfp_div_mf u_altfp_div_8 (
      .aclr              (i_rst),
      .clk_en            (1'b1),
      .clock             (i_clk),
      // Input
      .dataa             (32'h3F800000), // 1.0
      .datab             (add_5_result),
      .dataen            (add_5_result_en),
      // Output
      .result            (beta_hNA_0),
      .resulten          (beta_hNA_0_en),
      .zero              (),
      .nan               (),
      // Errors
      .division_by_zero  (div_8_divbyzero),
      .overflow          (div_8_oflow),
      .underflow         (div_8_uflow)
    );

    // End Calculate: beta_hNA_0
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    // Calculate: beta_hNA_1 = exp(y1_p30 / 10) / (exp(y1_p30 / 10) + 1)

    // Division: (y1_p30) / (10) already calculated -> div_7_result_neg

    // Exponent: exp(y1_p30 / 10)
    altfp_exp_mf u_altfp_exp_5 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .data      (div_7_result_neg),
      .dataen    (div_7_result_neg_en),
      // Output
      .result    (exp_5_result),
      .resulten  (exp_5_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (exp_5_oflow),
      .underflow (exp_5_uflow)
    );

    // Addition: (exp(y1_p30 / 10)) + (1)
    altfp_add_sub_mf u_altfp_add_6 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b1), // add
      .dataa     (exp_5_result),
      .datab     (32'h3F800000), // 1.0
      .dataen    (exp_5_result_en),
      .zero      (),
      .nan       (),
      // Output
      .result    (add_6_result),
      .resulten  (add_6_result_en),
      // Errors
      .overflow  (add_6_oflow),
      .underflow (add_6_uflow)
    );

    // Division: (exp(y1_p30 / 10)) / (exp(y1_p30 / 10) + 1)
    altfp_div_mf u_altfp_div_9 (
      .aclr              (i_rst),
      .clk_en            (1'b1),
      .clock             (i_clk),
      // Input
      .dataa             (exp_5_result_d[FPU_DLY-1]),
      .datab             (add_6_result),
      .dataen            (add_6_result_en),
      // Output
      .result            (beta_hNA_1),
      .resulten          (beta_hNA_1_en),
      .zero              (),
      .nan               (),
      // Errors
      .division_by_zero  (div_9_divbyzero),
      .overflow          (div_9_oflow),
      .underflow         (div_9_uflow)
    );

    // End Calculate: beta_hNA_1
    ////////////////////////////////////////////////////////////////////////////
    assign beta_hNA = ((y1_p30_d[4*FPU_DLY-1][MSB] == 1'b0) && (|y1_p30_d[4*FPU_DLY-1][MSB-1:LSB] == 1'b1)) ? // y1_p30 > 0
                        beta_hNA_0 : beta_hNA_1;
    assign beta_hNA_en = beta_hNA_0_en;

    ////////////////////////////////////////////////////////////////////////////
    // Calculate: h_NA_infinity   = alpha_hNA/(alpha_hNA + beta_hNA)

    // Addition: (alpha_hNA + beta_hNA)
    altfp_add_sub_mf u_altfp_add_7 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b1), // add
      .dataa     (alpha_hNA_d[FPU_DLY-1]),
      .datab     (beta_hNA),
      .dataen    (beta_hNA_en),
      .zero      (),
      .nan       (),
      // Output
      .result    (add_7_result),
      .resulten  (add_7_result_en),
      // Errors
      .overflow  (add_7_oflow),
      .underflow (add_7_uflow)
    );

    // Division: (alpha_hNA) / (alpha_hNA + beta_hNA)
    altfp_div_mf u_altfp_div_10 (
      .aclr              (i_rst),
      .clk_en            (1'b1),
      .clock             (i_clk),
      // Input
      .dataa             (alpha_hNA_d[2*FPU_DLY-1]),
      .datab             (add_7_result),
      .dataen            (add_7_result_en),
      // Output
      .result            (h_NA_infinity),
      .resulten          (h_NA_infinity_en),
      .zero              (),
      .nan               (),
      // Errors
      .division_by_zero  (div_10_divbyzero),
      .overflow          (div_10_oflow),
      .underflow         (div_10_uflow)
    );

    // End Calculate: h_NA_infinity
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    // Calculate: t_h_NA = 1.0/(alpha_hNA + beta_hNA)

    // Division: (1.0) / (alpha_hNA + beta_hNA)
    altfp_div_mf u_altfp_div_11 (
      .aclr              (i_rst),
      .clk_en            (1'b1),
      .clock             (i_clk),
      // Input
      .dataa             (32'h3F800000), // 1.0
      .datab             (add_7_result),
      .dataen            (add_7_result_en),
      // Output
      .result            (t_h_NA),
      .resulten          (t_h_NA_en),
      .zero              (),
      .nan               (),
      // Errors
      .division_by_zero  (div_11_divbyzero),
      .overflow          (div_11_oflow),
      .underflow         (div_11_uflow)
    );

    // End Calculate: 
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    // Calculate: f3 = (h_NA_infinity - y3)/t_h_NA

    // Subtraction: (h_NA_infinity - y3)
    altfp_add_sub_mf u_altfp_sub_3 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b0), // sub
      .dataa     (h_NA_infinity),
      .datab     (y3_d[7*FPU_DLY-1]), // h_NA delayed
      .dataen    (h_NA_infinity_en),
      .zero      (),
      .nan       (),
      // Output
      .result    (sub_3_result),
      .resulten  (sub_3_result_en),
      // Errors
      .overflow  (sub_3_oflow),
      .underflow (sub_3_uflow)
    );

    // Division: (h_NA_infinity - y3) / (t_h_NA)
    altfp_div_mf u_altfp_div_12 (
      .aclr              (i_rst),
      .clk_en            (1'b1),
      .clock             (i_clk),
      // Input
      .dataa             (sub_3_result),
      .datab             (t_h_NA_d[FPU_DLY-1]),
      .dataen            (sub_3_result_en),
      // Output
      .result            (f[3]),
      .resulten          (f_en[3]),
      .zero              (),
      .nan               (),
      // Errors
      .division_by_zero  (div_12_divbyzero),
      .overflow          (div_12_oflow),
      .underflow         (div_12_uflow)
    );

    // End Calculate: f3
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    // Calculate: I_NA = g_NA_bar * (y1 - E_NA) * y2*y2*y2*y3

    // Subtraction: (y1 - E_NA)
    altfp_add_sub_mf u_altfp_sub_4 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b0), // sub
      .dataa     (y[1]),
      .datab     (E_NA),
      .dataen    (i_valid),
      .zero      (),
      .nan       (),
      // Output
      .result    (sub_4_result),
      .resulten  (sub_4_result_en),
      // Errors
      .overflow  (sub_4_oflow),
      .underflow (sub_4_uflow)
    );

    // Multiplication: (g_NA_bar) * (y1 - E_NA)
    altfp_mult_mf u_altfp_mult_4 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (g_NA_bar), // localparam
      .datab     (sub_4_result),
      .dataen    (sub_4_result_en),
      // Output
      .result    (mult_4_result),
      .resulten  (mult_4_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_4_oflow),
      .underflow (mult_4_uflow)
    );

    // Multiplication: (g_NA_bar * (y1 - E_NA)) * (y2)
    altfp_mult_mf u_altfp_mult_5 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (mult_4_result),
      .datab     (y2_d[2*FPU_DLY-1]),
      .dataen    (mult_4_result_en),
      // Output
      .result    (mult_5_result),
      .resulten  (mult_5_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_5_oflow),
      .underflow (mult_5_uflow)
    );

    // Multiplication: (g_NA_bar * (y1 - E_NA) * y2) * (y2)
    altfp_mult_mf u_altfp_mult_6 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (mult_5_result),
      .datab     (y2_d[3*FPU_DLY-1]),
      .dataen    (mult_5_result_en),
      // Output
      .result    (mult_6_result),
      .resulten  (mult_6_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_6_oflow),
      .underflow (mult_6_uflow)
    );

    // Multiplication: (g_NA_bar * (y1 - E_NA) * y2 * y2) * (y2)
    altfp_mult_mf u_altfp_mult_7 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (mult_6_result),
      .datab     (y2_d[4*FPU_DLY-1]),
      .dataen    (mult_6_result_en),
      // Output
      .result    (mult_7_result),
      .resulten  (mult_7_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_7_oflow),
      .underflow (mult_7_uflow)
    );

    // Multiplication: (g_NA_bar * (y1 - E_NA) * y2 * y2 * y2) * (y3)
    altfp_mult_mf u_altfp_mult_8 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (mult_7_result),
      .datab     (y3_d[5*FPU_DLY-1]),
      .dataen    (mult_7_result_en),
      // Output
      .result    (I_NA),
      .resulten  (I_NA_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_8_oflow),
      .underflow (mult_8_uflow)
    );

    // End Calculate: I_NA
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////
    // Potassium Current, I_K //
    ////////////////////////////
    ////////////////////////////////////////////////////////////////////////////
    // Calculate: alpha_mK_0 = -0.01*sum/(exp(-sum/10.0)-1.0), sum=y(1)+50.0

    // Division: (-y1_p50)/(10.0)
    altfp_div_mf u_altfp_div_13 (
      .aclr              (i_rst),
      .clk_en            (1'b1),
      .clock             (i_clk),
      // Input
      .dataa             (y1_p50_neg),
      .datab             (32'h41200000), // 10.0
      .dataen            (y1_p50_neg_en),
      // Output
      .result            (div_13_result),
      .resulten          (div_13_result_en),
      .zero              (),
      .nan               (),
      // Errors
      .division_by_zero  (div_13_divbyzero),
      .overflow          (div_13_oflow),
      .underflow         (div_13_uflow)
    );
    assign div_13_result_neg = {~div_13_result[MSB],div_13_result[MSB-1:LSB]};
    assign div_13_result_neg_en = div_13_result_en;

    // Exponent: exp(-y1_p50/10.0)
    altfp_exp_mf u_altfp_exp_6 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .data      (div_13_result),
      .dataen    (div_13_result_en),
      // Output
      .result    (exp_6_result),
      .resulten  (exp_6_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (exp_6_oflow),
      .underflow (exp_6_uflow)
    );

    // Subtract: (exp(-y1_p50/10.0)) - (1.0)
    altfp_add_sub_mf u_altfp_sub_5 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b0), // sub
      .dataa     (exp_6_result),
      .datab     (32'h3F800000),  // 1.0
      .dataen    (exp_6_result_en),
      .zero      (),
      .nan       (),
      // Output
      .result    (sub_5_result),
      .resulten  (sub_5_result_en),
      // Errors
      .overflow  (sub_5_oflow),
      .underflow (sub_5_uflow)
    );

    // Multiplication: (-0.01) * (y1_p50)
    altfp_mult_mf u_altfp_mult_9 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (y1_p50_d[2*FPU_DLY-1]),
      .datab     (32'hBC23D70A), // -0.01
      .dataen    (y1_p50_en),
      // Output
      .result    (mult_9_result),
      .resulten  (mult_9_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_9_oflow),
      .underflow (mult_9_uflow)
    );

    // Divide: (-0.01*y1_p50) / (exp(-y1_p50/10.0)-1.0)
    altfp_div_mf u_altfp_div_14 (
      .aclr              (i_rst),
      .clk_en            (1'b1),
      .clock             (i_clk),
      // Input
      .dataa             (mult_9_result),
      .datab             (sub_5_result),
      .dataen            (mult_9_result_en),
      // Output
      .result            (alpha_mK_0),
      .resulten          (alpha_mK_0_en),
      .zero              (),
      .nan               (),
      // Errors
      .division_by_zero  (div_14_divbyzero),
      .overflow          (div_14_oflow),
      .underflow         (div_14_uflow)
    );

    // End Calculate: alpha_mK_0
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    // Calculate: alpha_mK_1 = -0.01*exp(sum/10.0)*sum/(1.0-exp(sum/10.0)), sum=y(1)+50.0

    // Exponent: exp(y1_p50/10.0)
    altfp_exp_mf u_altfp_exp_7 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .data      (div_13_result_neg),
      .dataen    (div_13_result_neg_en),
      // Output
      .result    (exp_7_result),
      .resulten  (exp_7_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (exp_7_oflow),
      .underflow (exp_7_uflow)
    );

    // Multiply: (-0.01) * (exp(y1_p50/10.0))
    altfp_mult_mf u_altfp_mult_10 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (exp_7_result),
      .datab     (32'hBC23D70A), // -0.01
      .dataen    (exp_7_result_en),
      // Output
      .result    (mult_10_result),
      .resulten  (mult_10_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_10_oflow),
      .underflow (mult_10_uflow)
    );

    // Multiply: (-0.01*exp(y1_p50/10.0)) * (y1_p50)
    altfp_mult_mf u_altfp_mult_11 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (mult_10_result),
      .datab     (y1_p50_d[3*FPU_DLY-1]),
      .dataen    (mult_10_result_en),
      // Output
      .result    (mult_11_result),
      .resulten  (mult_11_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_11_oflow),
      .underflow (mult_11_uflow)
    );

    // Subtract: (1.0) - (exp(y1_p50/10.0))
    altfp_add_sub_mf u_altfp_sub_6 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b0), // sub
      .dataa     (32'h3F800000), // 1.0
      .datab     (exp_7_result),
      .dataen    (exp_7_result_en),
      .zero      (),
      .nan       (),
      // Output
      .result    (sub_6_result),
      .resulten  (sub_6_result_en),
      // Errors
      .overflow  (sub_6_oflow),
      .underflow (sub_6_uflow)
    );

    // Divide: (-0.01*exp(y1_p50/10.0)*y1_p50) / (1.0-exp(y1_p50/10.0))
    altfp_div_mf u_altfp_div_15 (
      .aclr              (i_rst),
      .clk_en            (1'b1),
      .clock             (i_clk),
      // Input
      .dataa             (mult_11_result),
      .datab             (sub_6_result_d[FPU_DLY-1]),
      .dataen            (mult_11_result_en),
      // Output
      .result            (alpha_mK_1),
      .resulten          (alpha_mK_1_en),
      .zero              (),
      .nan               (),
      // Errors
      .division_by_zero  (div_15_divbyzero),
      .overflow          (div_15_oflow),
      .underflow         (div_15_uflow)
    );

    // End Calculate: alpha_mK_1
    ////////////////////////////////////////////////////////////////////////////
    assign alpha_mK = ((y1_p50_d[5*FPU_DLY-1][31] == 1'b0) && (|y1_p50_d[5*FPU_DLY-1][30:0] == 1'b1)) ? // y1_p30 > 0
                        alpha_mK_0_d[FPU_DLY-1] : alpha_mK_1;
    assign alpha_mK_en = alpha_mK_1_en;

    ////////////////////////////////////////////////////////////////////////////
    // Calculate: beta_mK = 0.125*exp(-0.0125*sum), sum=y(1)+60.0

    // Multiply: (-0.0125) * (y1_p60)
    altfp_mult_mf u_altfp_mult_12 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (y1_p60),
      .datab     (32'hBC4CCCCD), // -0.0125
      .dataen    (y1_p60_en),
      // Output
      .result    (mult_12_result),
      .resulten  (mult_12_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_12_oflow),
      .underflow (mult_12_uflow)
    );


    // Exponent: exp(-0.0125*y1_p50)
    altfp_exp_mf u_altfp_exp_8 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .data      (mult_12_result),
      .dataen    (mult_12_result_en),
      // Output
      .result    (exp_8_result),
      .resulten  (exp_8_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (exp_8_oflow),
      .underflow (exp_8_uflow)
    );

    // Multiply: (0.125) * (exp(-0.0125*y1_p50))
    altfp_mult_mf u_altfp_mult_13 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (exp_8_result),
      .datab     (32'h3E000000),
      .dataen    (exp_8_result_en),
      // Output
      .result    (beta_mK),
      .resulten  (beta_mK_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_13_oflow),
      .underflow (mult_13_uflow)
    );

    // End Calculate: beta_mK
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    // Calculate: t_m_K = 1.0/(alpha_mK + beta_mK)

    // Add: (alpha_mK) + (beta_mK)
    altfp_add_sub_mf u_altfp_add_8 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b1), // add
      .dataa     (alpha_mK),
      .datab     (beta_mK_d[2*FPU_DLY-1]),
      .dataen    (alpha_mK_en),
      .zero      (),
      .nan       (),
      // Output
      .result    (add_8_result),
      .resulten  (add_8_result_en),
      // Errors
      .overflow  (add_8_oflow),
      .underflow (add_8_uflow)
    );

    // Reciprocal: (1.0) / (alpha_mK + beta_mK)
    altfp_div_mf u_altfp_div_16 (
      .aclr              (i_rst),
      .clk_en            (1'b1),
      .clock             (i_clk),
      // Input
      .dataa             (32'h3F800000),
      .datab             (add_8_result),
      .dataen            (add_8_result_en),
      // Output
      .result            (t_m_K),
      .resulten          (t_m_K_en),
      .zero              (),
      .nan               (),
      // Errors
      .division_by_zero  (div_16_divbyzero),
      .overflow          (div_16_oflow),
      .underflow         (div_16_uflow)
    );

    // End Calculate: t_m_K
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    // Calculate: m_K_infinity = alpha_mK / (alpha_mK + beta_mK)

    // Divide: (alpha_mK) / (alpha_mK + beta_mK)
    altfp_div_mf u_altfp_div_17 (
      .aclr              (i_rst),
      .clk_en            (1'b1),
      .clock             (i_clk),
      // Input
      .dataa             (alpha_mK_d[FPU_DLY-1]),
      .datab             (add_8_result),
      .dataen            (add_8_result_en),
      // Output
      .result            (m_K_infinity),
      .resulten          (m_K_infinity_en),
      .zero              (),
      .nan               (),
      // Errors
      .division_by_zero  (div_17_divbyzero),
      .overflow          (div_17_oflow),
      .underflow         (div_17_uflow)
    );

    // End Calculate: m_K_infinity
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    // Calculate: f4 = (m_K_infinity - y(4))/t_m_K;

    // Subtract: (m_K_infinity) - (y(4))
    altfp_add_sub_mf u_altfp_sub_8 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b0), // sub
      .dataa     (m_K_infinity),
      .datab     (y4_d[8*FPU_DLY-1]),
      .dataen    (m_K_infinity_en),
      .zero      (),
      .nan       (),
      // Output
      .result    (sub_8_result),
      .resulten  (sub_8_result_en),
      // Errors
      .overflow  (sub_8_oflow),
      .underflow (sub_8_uflow)
    );

    // Divide: (m_K_infinity - y(4)) / (t_m_K);
    altfp_div_mf u_altfp_div_18 (
      .aclr              (i_rst),
      .clk_en            (1'b1),
      .clock             (i_clk),
      // Input
      .dataa             (sub_8_result),
      .datab             (t_m_K_d[FPU_DLY-1]),
      .dataen            (sub_8_result_en),
      // Output
      .result            (f[4]),
      .resulten          (f_en[4]),
      .zero              (),
      .nan               (),
      // Errors
      .division_by_zero  (div_18_divbyzero),
      .overflow          (div_18_oflow),
      .underflow         (div_18_uflow)
    );

    // End Calculate: f4
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    // Calculate: I_K = g_K_bar*(y1-E_K)*y4*y4*y4*y4

    // Subtract: (y1) - (E_K)
    altfp_add_sub_mf u_altfp_sub_9 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b0), // sub
      .dataa     (y[1]),
      .datab     (E_K),
      .dataen    (i_valid),
      .zero      (),
      .nan       (),
      // Output
      .result    (sub_9_result),
      .resulten  (sub_9_result_en),
      // Errors
      .overflow  (sub_9_oflow),
      .underflow (sub_9_uflow)
    );

    // Multiply: (g_K_bar) * (y1-E_K)
    altfp_mult_mf u_altfp_mult_14 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (g_K_bar),
      .datab     (sub_9_result),
      .dataen    (sub_9_result_en),
      // Output
      .result    (mult_14_result),
      .resulten  (mult_14_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_14_oflow),
      .underflow (mult_14_uflow)
    );

    // Multiply: ((g_K_bar)*(y1-E_K)) * (y4)
    altfp_mult_mf u_altfp_mult_15 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (y4_d[2*FPU_DLY-1]),
      .datab     (mult_14_result),
      .dataen    (mult_14_result_en),
      // Output
      .result    (mult_15_result),
      .resulten  (mult_15_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_15_oflow),
      .underflow (mult_15_uflow)
    );

    // Multiply: ((g_K_bar)*(y1-E_K)*y4) * (y4)
    altfp_mult_mf u_altfp_mult_16 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (y4_d[3*FPU_DLY-1]),
      .datab     (mult_15_result),
      .dataen    (mult_15_result_en),
      // Output
      .result    (mult_16_result),
      .resulten  (mult_16_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_16_oflow),
      .underflow (mult_16_uflow)
    );

    // Multiply: ((g_K_bar)*(y1-E_K)*y4*y4) * (y4)
    altfp_mult_mf u_altfp_mult_17 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (y4_d[4*FPU_DLY-1]),
      .datab     (mult_16_result),
      .dataen    (mult_16_result_en),
      // Output
      .result    (mult_17_result),
      .resulten  (mult_17_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_17_oflow),
      .underflow (mult_17_uflow)
    );

    // Multiply: ((g_K_bar)*(y1-E_K)*y4*y4*y4) * (y4)
    altfp_mult_mf u_altfp_mult_18 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (y4_d[5*FPU_DLY-1]),
      .datab     (mult_17_result),
      .dataen    (mult_17_result_en),
      // Output
      .result    (I_K),
      .resulten  (I_K_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_18_oflow),
      .underflow (mult_18_uflow)
    );

    // End Calculate: I_K
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    // Calculate: I_leak = g_leak*(y(1)-E_leak)

    // Subtract: (y(1)) - (E_leak)
    altfp_add_sub_mf u_altfp_sub_10 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b0), // sub
      .dataa     (y[1]),
      .datab     (E_leak),
      .dataen    (i_valid),
      .zero      (),
      .nan       (),
      // Output
      .result    (sub_10_result),
      .resulten  (sub_10_result_en),
      // Errors
      .overflow  (sub_10_oflow),
      .underflow (sub_10_uflow)
    );

    // Multiply: (g_leak) * (y(1)-E_leak)
    altfp_mult_mf u_altfp_mult_19 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (g_leak),
      .datab     (sub_10_result),
      .dataen    (sub_10_result_en),
      // Output
      .result    (I_leak),
      .resulten  (I_leak_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_19_oflow),
      .underflow (mult_19_uflow)
    );

    // End Calculate: I_leak
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    // Calculate: f1 = (s - I_NA - I_K - I_leak)/C_M

    // Subtract: (s) - (I_NA)
    altfp_add_sub_mf u_altfp_sub_11 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b0), // sub
      .dataa     (s_d[6*FPU_DLY-1]),
      .datab     (I_NA),
      .dataen    (I_NA_en),
      .zero      (),
      .nan       (),
      // Output
      .result    (sub_11_result),
      .resulten  (sub_11_result_en),
      // Errors
      .overflow  (sub_11_oflow),
      .underflow (sub_11_uflow)
    );

    // Subtract: (s-I_NA) - (I_K)
    altfp_add_sub_mf u_altfp_sub_12 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b0), // sub
      .dataa     (sub_11_result),
      .datab     (I_K_d[FPU_DLY-1]),
      .dataen    (sub_11_result_en),
      .zero      (),
      .nan       (),
      // Output
      .result    (sub_12_result),
      .resulten  (sub_12_result_en),
      // Errors
      .overflow  (sub_12_oflow),
      .underflow (sub_12_uflow)
    );

    // Subtract: (s-I_NA-I_K) - (I_leak)
    altfp_add_sub_mf u_altfp_sub_13 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b0), // sub
      .dataa     (sub_12_result),
      .datab     (I_leak_d[6*FPU_DLY-1]),
      .dataen    (sub_12_result_en),
      .zero      (),
      .nan       (),
      // Output
      .result    (sub_13_result),
      .resulten  (sub_13_result_en),
      // Errors
      .overflow  (sub_13_oflow),
      .underflow (sub_13_uflow)
    );

    // Divide: (s-I_NA-I_K-I_leak) / (C_M)
    altfp_div_mf u_altfp_div_19 (
      .aclr              (i_rst),
      .clk_en            (1'b1),
      .clock             (i_clk),
      // Input
      .dataa             (sub_13_result),
      .datab             (C_M),
      .dataen            (sub_13_result_en),
      // Output
      .result            (f[1]),
      .resulten          (f_en[1]),
      .zero              (),
      .nan               (),
      // Errors
      .division_by_zero  (div_19_divbyzero),
      .overflow          (div_19_oflow),
      .underflow         (div_19_uflow)
    );

    // End Calculate: f1
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    // Calculate Output: y_new = y_old + f * delta_t
    
    // Calculate y1_new
    altfp_mult_mf u_altfp_mult_20 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (f[1]),
      .datab     (delta_t),
      .dataen    (f_en[1]),
      // Output
      .result    (mult_20_result),
      .resulten  (mult_20_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_20_oflow),
      .underflow (mult_20_uflow)
    );

    altfp_add_sub_mf u_altfp_add_9 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b1), // add
      .dataa     (y1_d[11*FPU_DLY-1]),
      .datab     (mult_20_result),
      .dataen    (mult_20_result_en),
      .zero      (),
      .nan       (),
      // Output
      .result    (y1_new),
      .resulten  (y1_new_en),
      // Errors
      .overflow  (add_9_oflow),
      .underflow (add_9_uflow)
    );

    // Calculate y2_new
    altfp_mult_mf u_altfp_mult_21 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (f[2]),
      .datab     (delta_t),
      .dataen    (f_en[2]),
      // Output
      .result    (mult_21_result),
      .resulten  (mult_21_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_21_oflow),
      .underflow (mult_21_uflow)
    );

    altfp_add_sub_mf u_altfp_add_10 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b1), // add
      .dataa     (y2_d[10*FPU_DLY-1]),
      .datab     (mult_21_result),
      .dataen    (mult_21_result_en),
      .zero      (),
      .nan       (),
      // Output
      .result    (y2_new),
      .resulten  (y2_new_en),
      // Errors
      .overflow  (add_10_oflow),
      .underflow (add_10_uflow)
    );

    // Calculate y3_new
    altfp_mult_mf u_altfp_mult_22 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (f[3]),
      .datab     (delta_t),
      .dataen    (f_en[3]),
      // Output
      .result    (mult_22_result),
      .resulten  (mult_22_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_22_oflow),
      .underflow (mult_22_uflow)
    );

    altfp_add_sub_mf u_altfp_add_11 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b1), // add
      .dataa     (y3_d[10*FPU_DLY-1]),
      .datab     (mult_22_result),
      .dataen    (mult_22_result_en),
      .zero      (),
      .nan       (),
      // Output
      .result    (y3_new),
      .resulten  (y3_new_en),
      // Errors
      .overflow  (add_11_oflow),
      .underflow (add_11_uflow)
    );

    // Calculate y4_new
    altfp_mult_mf u_altfp_mult_23 (
      // Clock
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .dataa     (f[4]),
      .datab     (delta_t),
      .dataen    (f_en[4]),
      // Output
      .result    (mult_23_result),
      .resulten  (mult_23_result_en),
      .zero      (),
      .nan       (),
      // Errors
      .overflow  (mult_23_oflow),
      .underflow (mult_23_uflow)
    );

    altfp_add_sub_mf u_altfp_add_12 (
      // Clocks
      .aclr      (i_rst),
      .clk_en    (1'b1),
      .clock     (i_clk),
      // Input
      .add_sub   (1'b1), // add
      .dataa     (y4_d[11*FPU_DLY-1]),
      .datab     (mult_23_result),
      .dataen    (mult_23_result_en),
      .zero      (),
      .nan       (),
      // Output
      .result    (y4_new),
      .resulten  (y4_new_en),
      // Errors
      .overflow  (add_12_oflow),
      .underflow (add_12_uflow)
    );

    // Allign data ouput
    assign y_new[1] = y1_new;
    assign y_new[2] = y2_new_d[FPU_DLY-1];
    assign y_new[3] = y3_new_d[FPU_DLY-1];
    assign y_new[4] = y4_new;

    assign o_V      = y1_new;
    assign o_valid  = y1_new_en;

    // End Calculate: y_new
    ////////////////////////////////////////////////////////////////////////////

  end else if (NUM_REP == "DOUBLE_FP") begin : gen_double_fp
  ///////////////////////////////////////////////////////////
  // Double Floating Point Number Representation (64-bits) //
  ///////////////////////////////////////////////////////////
  end else if (NUM_REP == "FIXED") begin : gen_fixed
  ///////////////////////////////////////
  // Fixed Point Number Representation //
  ///////////////////////////////////////
  end
  endgenerate

endmodule

// vim: set sw=2 ts=2 sts=2 expandtab
