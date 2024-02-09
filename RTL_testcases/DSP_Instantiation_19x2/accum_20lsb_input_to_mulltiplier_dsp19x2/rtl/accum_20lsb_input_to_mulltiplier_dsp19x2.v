module accum_20lsb_input_to_mulltiplier_dsp19x2(
	  input  wire [19:0] a,
    input  wire [17:0] b,
    input  wire clk, reset,
    output wire [37:0] z_out
    );
    parameter [79:0] MODE_BITS = 80'h0;   
    wire [18:0]Z1,Z2; 
    wire [8:0]DLY_B1, DLY_B2;
    //wire [37:0] z_w;

DSP19X2 #(
  .DSP_MODE("MULTIPLY_ADD_SUB"), // DSP arithmetic mode (MULTIPLY/MULTIPLY_ACCUMULATE)
  .COEFF1_0(10'h000), // Multiplier 1 10-bit A input coefficient 0
  .COEFF1_1(10'h000), // Multiplier 1 10-bit A input coefficient 1
  .COEFF1_2(10'h000), // Multiplier 1 10-bit A input coefficient 2
  .COEFF1_3(10'h000), // Multiplier 1 10-bit A input coefficient 3
  .COEFF2_0(10'h000), // Multiplier 2 10-bit A input coefficient 0
  .COEFF2_1(10'h000), // Multiplier 2 10-bit A input coefficient 1
  .COEFF2_2(10'h000), // Multiplier 2 10-bit A input coefficient 2
  .COEFF2_3(10'h000), // Multiplier 2 10-bit A input coefficient 3
  .OUTPUT_REG_EN("FALSE"), // Enable output register (TRUE/FALSE)
  .INPUT_REG_EN("TRUE") // Enable input register (TRUE/FALSE)
) DSP_inst(
  .A1(a[9:0]), // Multiplier 1 10-bit data input for multiplier or accumulator loading
  .B1(b[8:0]), // 9-bit data input for multiplication
  .Z1(z_out[18:0]), // Multiplier 1 19-bit data output
  .DLY_B1(DLY_B1), // Multiplier 1 9-bit B registered output
  .A2(a[19:10]), // Multiplier 2 10-bit data input for multiplier or accumulator loading
  .B2(b[17:9]), // Multiplier 2 9-bit data input for multiplication
  .Z2(z_out[37:19]), // Multiplier 2 19-bit data output
  .DLY_B2(DLY_B2), // Multiplier 2 9-bit B registered output
  .CLK(clk), // Clock
  .RESET(reset), // Reset input
  .ACC_FIR(5'd2), // 5-bit left shift A input
  .FEEDBACK(3'd3), // 3-bit feedback input selects coefficient
  .LOAD_ACC(1'b1), // Load accumulator input
  .UNSIGNED_A(1'b1), // Selects signed or unsigned data for A input
  .UNSIGNED_B(1'b1), // Selects signed or unsigned data for B input
  .SATURATE(1'b0), // Saturate enable
  .SHIFT_RIGHT(5'd0), // 5-bit Shift right
  .ROUND(1'b0), // Round
  .SUBTRACT(1'b1) // Add or subtract
);


   // assign z_out = {Z2,Z1};

endmodule