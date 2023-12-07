module b_registered_input_to_output_new_primitive (
	input  wire [19:0] a,
    input  wire [17:0] b,
	input wire clk, reset,
    output wire [17:0] dly_b,
    output wire [37:0] z_out
    );

    parameter [83:0] MODE_BITS = 84'd0;
    
    wire [37:0] z_w;

DSP38 #(
  .DSP_MODE("MULTIPLY"), // DSp arithmetic mode (MULTIPLY/MULTIPLY_ADD_SUB/MULTIPLY_ACCUMULATE)
  .COEFF_0(20'h00000), // 20-bit A input coefficient 0
  .COEFF_1(20'h00000), // 20-bit A input coefficient 1
  .COEFF_2(20'h00000), // 20-bit A input coefficient 2
  .COEFF_3(20'h00000), // 20-bit A input coefficient 3
  .OUTPUT_REG_EN("FALSE"), // Enable output register (TRUE/FALSE)
  .INPUT_REG_EN("FALSE") // Enable input register (TRUE/FALSE)
) DSP_inst(
  .A(a), // 20-bit data input for multipluier or accumulator loading
  .B(b), // 18-bit data input for multiplication
  .ACC_FIR(6'd0), // 6-bit left shift A input
  .Z(z_w), // 38-bit data output
  .DLY_B(dly_b), // 18-bit B registered output
  .CLK(clk), // Clock
  .RESET(reset), // None
  .FEEDBACK(3'd1), // 3-bit feedback input selects coefficient
  .LOAD_ACC(1'd0), // Load accumulator input
  .SATURATE(1'b0), // Saturate enable
  .SHIFT_RIGHT(6'd0), // 6-bit Shift right
  .ROUND(1'd0), // Round
  .SUBTRACT(1'b0), // Add or subtract
  .UNSIGNED_A (1'b1), // Selects signed or unsigned data for A input
  .UNSIGNED_B (1'b1) 
);

    assign z_out = z_w;

endmodule