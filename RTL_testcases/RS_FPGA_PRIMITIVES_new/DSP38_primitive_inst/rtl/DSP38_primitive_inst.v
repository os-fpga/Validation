
module DSP38_primitive_inst (
  input [19:0] A, // 20-bit data input for multipluier or accumulator loading
  input [17:0] B, // 18-bit data input for multiplication
  input [5:0] ACC_FIR, // 6-bit left shift A input
  output [37:0] Z, // 38-bit data output
  output reg [17:0] DLY_B, // 18-bit B registered output
  input CLK, // Clock
  input RESET, // Active high reset
  input [2:0] FEEDBACK, // 3-bit feedback input selects coefficient
  input LOAD_ACC, // Load accumulator input
  input SATURATE, // Saturate enable
  input [5:0] SHIFT_RIGHT, // 6-bit Shift right
  input ROUND, // Round
  input SUBTRACT, // Add or subtract
  input UNSIGNED_A, // Selects signed or unsigned data for A input
  input UNSIGNED_B // Selects signed or unsigned data for B input
);

  // Instantiate the CLK_BUF module
  DSP38 #(
    .DSP_MODE("MULTIPLY_ACCUMULATE"), // DSP arithmetic mode (MULTIPLY/MULTIPLY_ADD_SUB/MULTIPLY_ACCUMULATE)
    .COEFF_0(20'h00000), // 20-bit A input coefficient 0
    .COEFF_1(20'h00000), // 20-bit A input coefficient 1
    .COEFF_2(20'h00000), // 20-bit A input coefficient 2
    .COEFF_3(20'h00000), // 20-bit A input coefficient 3
    .OUTPUT_REG_EN("TRUE"), // Enable output register (TRUE/FALSE)
    .INPUT_REG_EN("TRUE") 
  )dsp38_inst (.A(A),
    .ACC_FIR(ACC_FIR),
    .B(B),
    .CLK(CLK),
    .DLY_B(DLY_B),
    .FEEDBACK(FEEDBACK),
    .LOAD_ACC(LOAD_ACC),
    .RESET(RESET),
    .ROUND(ROUND),
    .SATURATE(SATURATE),
    .SHIFT_RIGHT(SHIFT_RIGHT),
    .SUBTRACT(SUBTRACT),
    .UNSIGNED_A(UNSIGNED_A),
    .UNSIGNED_B(UNSIGNED_B),
    .Z(Z));

endmodule
