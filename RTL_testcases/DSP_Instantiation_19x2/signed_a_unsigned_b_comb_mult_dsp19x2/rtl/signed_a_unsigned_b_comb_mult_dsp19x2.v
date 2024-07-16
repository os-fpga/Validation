module signed_a_unsigned_b_comb_mult_dsp19x2 (
	input  wire [19:0] a,
    input  wire [17:0] b,
    output wire [37:0] z_out
    );

DSP19X2 #(
  .DSP_MODE("MULTIPLY"), // DSP arithmetic mode (MULTIPLY/MULTIPLY_ACCUMULATE)
  .COEFF1_0(10'h000), // Multiplier 1 10-bit A input coefficient 0
  .COEFF1_1(10'h000), // Multiplier 1 10-bit A input coefficient 1
  .COEFF1_2(10'h000), // Multiplier 1 10-bit A input coefficient 2
  .COEFF1_3(10'h000), // Multiplier 1 10-bit A input coefficient 3
  .COEFF2_0(10'h000), // Multiplier 2 10-bit A input coefficient 0
  .COEFF2_1(10'h000), // Multiplier 2 10-bit A input coefficient 1
  .COEFF2_2(10'h000), // Multiplier 2 10-bit A input coefficient 2
  .COEFF2_3(10'h000), // Multiplier 2 10-bit A input coefficient 3
  .OUTPUT_REG_EN("FALSE"), // Enable output register (TRUE/FALSE)
  .INPUT_REG_EN("FALSE") // Enable input register (TRUE/FALSE)
) DSP_inst(
  .A1(a[9:0]), // Multiplier 1 10-bit data input for multiplier or accumulator loading
  .B1(b[8:0]), // 9-bit data input for multiplication
  .Z1(z_out[18:0]), // Multiplier 1 19-bit data output
  .A2(a[19:10]), // Multiplier 2 10-bit data input for multiplier or accumulator loading
  .B2(b[17:9]), // Multiplier 2 9-bit data input for multiplication
  .Z2(z_out[37:19]), // Multiplier 2 19-bit data output
  .CLK(clk), // Clock
  .RESET(reset), // Reset input
  .ACC_FIR(ACC_FIR), // 5-bit left shift A input
  .FEEDBACK(3'd1), // 3-bit feedback input selects coefficient
  .LOAD_ACC(LOAD_ACC), // Load accumulator input
  .UNSIGNED_A(1'b0), // Selects signed or unsigned data for A input
  .UNSIGNED_B(1'b1), // Selects signed or unsigned data for B input
  .SATURATE(SATURATE), // Saturate enable
  .SHIFT_RIGHT(SHIFT_RIGHT), // 5-bit Shift right
  .ROUND(ROUND), // Round
  .SUBTRACT(SUBTRACT) // Add or subtract
);
 
endmodule



