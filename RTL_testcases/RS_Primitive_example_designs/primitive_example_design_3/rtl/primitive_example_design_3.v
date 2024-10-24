module primitive_example_design_3(
    input [19:0] A, 
    input [17:0] B, 
    input [37:0] i_buft_oe,
    output [37:0] Z,
    output reg [17:0] DLY_B,
    input CLK,
    input RESET,
    input [2:0] FEEDBACK,
    input LOAD_ACC,
    input SATURATE,
    input [5:0] SHIFT_RIGHT,
    input ROUND,
    input SUBTRACT,
    input UNSIGNED_A,
    input UNSIGNED_B,
    input [19:0] ibuf1_en,
    input [17:0] ibuf2_en,
    input [5:0] ibuf3_en,
    input [17:0] ibuf4_en
  );

  wire [37:0] z_out;
  wire [19:0] a_out;
  wire [17:0] b_out;
  wire [37:0] i_buft_oe_in;
  wire i_buf_reset,i_buf_load_acc,i_buf_saturate,i_buf_clk;
  wire [2:0] i_buf_feedback;
  wire [5:0] i_buf_shift_right;
  wire i_buf_round,i_buf_subtract,i_buf_unsigned_a,i_buf_unsigned_b;

  genvar i;
  generate
    for (i = 0; i < 20; i = i + 1) begin : gen_i_buf
      I_BUF i_buf_instance (.I(A[i]),.EN(ibuf1_en[i]),.O(a_out[i]));
    end
  endgenerate

  genvar j;
  generate
    for (j = 0; j < 18; j = j + 1) begin : gen_i_buf
      I_BUF i_buf_instance_b (.I(B[j]),.EN(ibuf2_en[j]),.O(b_out[j]));
    end
  endgenerate

  genvar j;
  generate
    for (j = 0; j < 6; j = j + 1) begin : gen_i_buf
      I_BUF i_buf_instance_shift (.I(SHIFT_RIGHT[j]),.EN(ibuf3_en[j]),.O(i_buf_shift_right[j]));
    end
  endgenerate

  I_BUF i_buf_instance2 (.I(CLK),.EN(ibuf4_en[0]),.O(i_buf_clk));
  genvar j;
  generate
    for (j = 0; j < 38; j = j + 1) begin : gen_i_buf
    I_BUF i_buf_instance3 (.I(i_buft_oe[j]),.EN(ibuf4_en[1]),.O(i_buft_oe_in[j]));
    end
  endgenerate
  
  I_BUF i_buf_instance10 (.I(RESET),.EN(ibuf4_en[8]),.O(i_buf_reset));
  I_BUF i_buf_instance11 (.I(FEEDBACK[0]),.EN(ibuf4_en[9]),.O(i_buf_feedback[0]));
  I_BUF i_buf_instance12 (.I(FEEDBACK[1]),.EN(ibuf4_en[10]),.O(i_buf_feedback[1]));
  I_BUF i_buf_instance13 (.I(FEEDBACK[2]),.EN(ibuf4_en[11]),.O(i_buf_feedback[2]));
  I_BUF i_buf_instance14 (.I(LOAD_ACC),.EN(ibuf4_en[12]),.O(i_buf_load_acc));
  I_BUF i_buf_instance15 (.I(SATURATE),.EN(ibuf4_en[13]),.O(i_buf_saturate));
  I_BUF i_buf_instance16 (.I(ROUND),.EN(ibuf4_en[14]),.O(i_buf_round));
  I_BUF i_buf_instance17 (.I(SUBTRACT),.EN(ibuf4_en[15]),.O(i_buf_subtract));
  I_BUF i_buf_instance18 (.I(UNSIGNED_A),.EN(ibuf4_en[16]),.O(i_buf_unsigned_a));
  I_BUF i_buf_instance19 (.I(UNSIGNED_B),.EN(ibuf4_en[17]),.O(i_buf_unsigned_b));


  genvar j;
  generate
    for (j = 0; j < 38; j = j + 1) begin : gen_o_buft
        O_BUFT o_buft_inst (.I(z_out[j]),.T(i_buft_oe_in[j]),.O(Z[j]));
    end
  endgenerate

  genvar j;
  generate
    for (j = 0; j < 18; j = j + 1) begin : gen_o_buf
      O_BUF o_buf_instance_a (.I(o_buf_dly_b[j]),.O(DLY_B[j]));
    end
  endgenerate

    DSP38 #(
      .DSP_MODE("MULTIPLY_ACCUMULATE"), 
      .COEFF_0(20'h00000), 
      .COEFF_1(20'h00000), 
      .COEFF_2(20'h00000), 
      .COEFF_3(20'h00000), 
      .OUTPUT_REG_EN("TRUE"), 
      .INPUT_REG_EN("TRUE") 
    )dsp38_inst (.A(a_out),
      .B(b_out),
      .CLK(i_buf_clk),
      .FEEDBACK(i_buf_feedback),
      .LOAD_ACC(i_buf_load_acc),
      .RESET(i_buf_reset),
      .ROUND(i_buf_round),
      .SATURATE(i_buf_saturate),
      .SHIFT_RIGHT(i_buf_shift_right),
      .SUBTRACT(i_buf_subtract),
      .UNSIGNED_A(i_buf_unsigned_a),
      .UNSIGNED_B(i_buf_unsigned_b),
      .Z(z_out));

endmodule
