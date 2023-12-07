module DSP19X2_primitive_inst (
  input [9:0] A1, // Multiplier 1 10-bit data input for multiplier or accumulator loading
  input [8:0] B1, // 9-bit data input for multiplication
  output [18:0] Z1, // Multiplier 1 19-bit data output
  output [8:0] DLY_B1, // Multiplier 1 9-bit B registered output
  input [9:0] A2, // Multiplier 2 10-bit data input for multiplier or accumulator loading
  input [8:0] B2, // Multiplier 2 9-bit data input for multiplication
  output [18:0] Z2, // Multiplier 2 19-bit data output
  output [8:0] DLY_B2, // Multiplier 2 9-bit B registered output
  input CLK, // Clock
  input RESET, // Reset input
  input [4:0] ACC_FIR, // 5-bit left shift A input
  input [2:0] FEEDBACK, // 3-bit feedback input selects coefficient
  input LOAD_ACC, // Load accumulator input
  input UNSIGNED_A, // Selects signed or unsigned data for A input
  input UNSIGNED_B, // Selects signed or unsigned data for B input
  input SATURATE, // Saturate enable
  input [4:0] SHIFT_RIGHT, // 5-bit Shift right
  input ROUND, // Round
  input SUBTRACT // Add or subtract
);

  // Instantiate the CLK_BUF module
  DSP19X2 dsp19x2_inst (
  .A1(A1), // Multiplier 1 10-bit data input for multiplier or accumulator loading
  .B1(B1), // 9-bit data input for multiplication
  .Z1(Z1), // Multiplier 1 19-bit data output
  .DLY_B1(DLY_B1), // Multiplier 1 9-bit B registered output
  .A2(A2), // Multiplier 2 10-bit data input for multiplier or accumulator loading
  .B2(B2), // Multiplier 2 9-bit data input for multiplication
  .Z2(Z2), // Multiplier 2 19-bit data output
  .DLY_B2(DLY_B2), // Multiplier 2 9-bit B registered output
  .CLK(CLK), // Clock
  .RESET(RESET), // Reset input
  .ACC_FIR(ACC_FIR), // 5-bit left shift A input
  .FEEDBACK(FEEDBACK), // 3-bit feedback input selects coefficient
  .LOAD_ACC(LOAD_ACC), // Load accumulator input
  .UNSIGNED_A(UNSIGNED_A), // Selects signed or unsigned data for A input
  .UNSIGNED_B(UNSIGNED_B), // Selects signed or unsigned data for B input
  .SATURATE(SATURATE), // Saturate enable
  .SHIFT_RIGHT(SHIFT_RIGHT), // 5-bit Shift right
  .ROUND(ROUND), // Round
  .SUBTRACT(SUBTRACT) 
  );

endmodule
