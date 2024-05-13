/////////////////////////////////////////
//  Functionality: DSP38 Testbench
//
//  Author:        George Chen
////////////////////////////////////////

//
// Verifies the 12 different primitives for DSP38
//

module GJC4(
   input [19:0] a,            // 20-bit data input for multipluier or accumulator loading
   input [17:0] b,            // 18-bit data input for multiplication
   input [5:0] 	acc_fir,      // 6-bit left shift A input
   input         clk,         // Clock
   input         reset,       // None
   input [2:0] 	 feedback,    // 3-bit feedback input selects coefficient
   input         load_acc,    // Load accumulator input
   input         unsigned_a,  // Selects signed or unsigned data for A input
   input         unsigned_b,   // Selects signed or unsigned data for B input
   input         saturate_enable,  // Saturate enable
   input [5:0] 	 shift_right,      // 6-bit Shift right
   input         round,            // Round
   input         subtract,         // Add or subtract
   output [37:0] z_mult,           // 38-bit data output
   output [17:0] dly_b_mult,       // 18-bit B registered output
   output [37:0] z_multadd,           // 38-bit data output
   output [17:0] dly_b_multadd,       // 18-bit B registered output
   output [37:0] z_multacc,           // 38-bit data output
   output [17:0] dly_b_multacc,       // 18-bit B registered output


   output  [37:0] z_mult_regout, z_mult_regin, z_mult_regin_regout, z_multadd_regout, z_multadd_regin, z_multadd_regin_regout, z_multacc_regout, z_multacc_regin, z_multacc_regin_regout,
   output [17:0] dly_b_mult_regout, dly_b_mult_regin, dly_b_mult_regin_regout, dly_b_multadd_regout, dly_b_multadd_regin, dly_b_multadd_regin_regout, dly_b_multacc_regout, dly_b_multacc_regin, dly_b_multacc_regin_regout );
   DSP38 #(
           .DSP_MODE("MULTIPLY"),
           .OUTPUT_REG_EN("FALSE"),
           .INPUT_REG_EN("FALSE")
           ) dut_mult (
                  .A(a),
                  .B(b),
                  .ACC_FIR(acc_fir),
                  .Z(z_mult),
                  .DLY_B(dly_b_mult),
                  .CLK(clk),
                  .RESET(reset),
                  .FEEDBACK(feedback),
                  .LOAD_ACC(load_acc),
                  .UNSIGNED_A(unsigned_a),
                  .UNSIGNED_B(unsigned_b),
                  .SATURATE(saturate_enable),
                  .SHIFT_RIGHT(shift_right),
                  .ROUND(round),
                  .SUBTRACT(subtract)
                  );

   DSP38 #(
           .DSP_MODE("MULTIPLY"),
           .OUTPUT_REG_EN("TRUE"),
           .INPUT_REG_EN("FALSE")
           ) dut_mult_regout (
                  .A(a),
                  .B(b),
                  .ACC_FIR(acc_fir),
                  .Z(z_mult_regout),
                  .DLY_B(dly_b_mult_regout),
                  .CLK(clk),
                  .RESET(reset),
                  .FEEDBACK(feedback),
                  .LOAD_ACC(load_acc),
                  .UNSIGNED_A(unsigned_a),
                  .UNSIGNED_B(unsigned_b),
                  .SATURATE(saturate_enable),
                  .SHIFT_RIGHT(shift_right),
                  .ROUND(round),
                  .SUBTRACT(subtract)
                  );

   DSP38 #(
           .DSP_MODE("MULTIPLY"),
           .OUTPUT_REG_EN("FALSE"),
           .INPUT_REG_EN("TRUE")
           ) dut_mult_regin (
                  .A(a),
                  .B(b),
                  .ACC_FIR(acc_fir),
                  .Z(z_mult_regin),
                  .DLY_B(dly_b_mult_regin),
                  .CLK(clk),
                  .RESET(reset),
                  .FEEDBACK(feedback),
                  .LOAD_ACC(load_acc),
                  .UNSIGNED_A(unsigned_a),
                  .UNSIGNED_B(unsigned_b),
                  .SATURATE(saturate_enable),
                  .SHIFT_RIGHT(shift_right),
                  .ROUND(round),
                  .SUBTRACT(subtract)
                  );

   DSP38 #(
           .DSP_MODE("MULTIPLY"),
           .OUTPUT_REG_EN("TRUE"),
           .INPUT_REG_EN("TRUE")
           ) dut_mult_regin_regout (
                  .A(a),
                  .B(b),
                  .ACC_FIR(acc_fir),
                  .Z(z_mult_regin_regout),
                  .DLY_B(dly_b_mult_regin_regout),
                  .CLK(clk),
                  .RESET(reset),
                  .FEEDBACK(feedback),
                  .LOAD_ACC(load_acc),
                  .UNSIGNED_A(unsigned_a),
                  .UNSIGNED_B(unsigned_b),
                  .SATURATE(saturate_enable),
                  .SHIFT_RIGHT(shift_right),
                  .ROUND(round),
                  .SUBTRACT(subtract)
                  );
   DSP38 #(
           .DSP_MODE("MULTIPLY_ADD_SUB"),
           .OUTPUT_REG_EN("FALSE"),
           .INPUT_REG_EN("FALSE")
           ) dut_multadd (
                  .A(a),
                  .B(b),
                  .ACC_FIR(acc_fir),
                  .Z(z_multadd),
                  .DLY_B(dly_b_multadd),
                  .CLK(clk),
                  .RESET(reset),
                  .FEEDBACK(feedback),
                  .LOAD_ACC(load_acc),
                  .UNSIGNED_A(unsigned_a),
                  .UNSIGNED_B(unsigned_b),
                  .SATURATE(saturate_enable),
                  .SHIFT_RIGHT(shift_right),
                  .ROUND(round),
                  .SUBTRACT(subtract)
                  );

   DSP38 #(
           .DSP_MODE("MULTIPLY_ADD_SUB"),
           .OUTPUT_REG_EN("TRUE"),
           .INPUT_REG_EN("FALSE")
           ) dut_multadd_regout (
                  .A(a),
                  .B(b),
                  .ACC_FIR(acc_fir),
                  .Z(z_multadd_regout),
                  .DLY_B(dly_b_multadd_regout),
                  .CLK(clk),
                  .RESET(reset),
                  .FEEDBACK(feedback),
                  .LOAD_ACC(load_acc),
                  .UNSIGNED_A(unsigned_a),
                  .UNSIGNED_B(unsigned_b),
                  .SATURATE(saturate_enable),
                  .SHIFT_RIGHT(shift_right),
                  .ROUND(round),
                  .SUBTRACT(subtract)
                  );

   DSP38 #(
           .DSP_MODE("MULTIPLY_ADD_SUB"),
           .OUTPUT_REG_EN("FALSE"),
           .INPUT_REG_EN("TRUE")
           ) dut_multadd_regin (
                  .A(a),
                  .B(b),
                  .ACC_FIR(acc_fir),
                  .Z(z_multadd_regin),
                  .DLY_B(dly_b_multadd_regin),
                  .CLK(clk),
                  .RESET(reset),
                  .FEEDBACK(feedback),
                  .LOAD_ACC(load_acc),
                  .UNSIGNED_A(unsigned_a),
                  .UNSIGNED_B(unsigned_b),
                  .SATURATE(saturate_enable),
                  .SHIFT_RIGHT(shift_right),
                  .ROUND(round),
                  .SUBTRACT(subtract)
                  );

   DSP38 #(
           .DSP_MODE("MULTIPLY_ADD_SUB"),
           .OUTPUT_REG_EN("TRUE"),
           .INPUT_REG_EN("TRUE")
           ) dut_multadd_regin_regout (
                  .A(a),
                  .B(b),
                  .ACC_FIR(acc_fir),
                  .Z(z_multadd_regin_regout),
                  .DLY_B(dly_b_multadd_regin_regout),
                  .CLK(clk),
                  .RESET(reset),
                  .FEEDBACK(feedback),
                  .LOAD_ACC(load_acc),
                  .UNSIGNED_A(unsigned_a),
                  .UNSIGNED_B(unsigned_b),
                  .SATURATE(saturate_enable),
                  .SHIFT_RIGHT(shift_right),
                  .ROUND(round),
                  .SUBTRACT(subtract)
                  );

   DSP38 #(
           .DSP_MODE("MULTIPLY_ACCUMULATE"),
           .OUTPUT_REG_EN("FALSE"),
           .INPUT_REG_EN("FALSE")
           ) dut_multacc (
                  .A(a),
                  .B(b),
                  .ACC_FIR(acc_fir),
                  .Z(z_multacc),
                  .DLY_B(dly_b_multacc),
                  .CLK(clk),
                  .RESET(reset),
                  .FEEDBACK(feedback),
                  .LOAD_ACC(load_acc),
                  .UNSIGNED_A(unsigned_a),
                  .UNSIGNED_B(unsigned_b),
                  .SATURATE(saturate_enable),
                  .SHIFT_RIGHT(shift_right),
                  .ROUND(round),
                  .SUBTRACT(subtract)
                  );

   DSP38 #(
           .DSP_MODE("MULTIPLY_ACCUMULATE"),
           .OUTPUT_REG_EN("TRUE"),
           .INPUT_REG_EN("FALSE")
           ) dut_multacc_regout (
                  .A(a),
                  .B(b),
                  .ACC_FIR(acc_fir),
                  .Z(z_multacc_regout),
                  .DLY_B(dly_b_multacc_regout),
                  .CLK(clk),
                  .RESET(reset),
                  .FEEDBACK(feedback),
                  .LOAD_ACC(load_acc),
                  .UNSIGNED_A(unsigned_a),
                  .UNSIGNED_B(unsigned_b),
                  .SATURATE(saturate_enable),
                  .SHIFT_RIGHT(shift_right),
                  .ROUND(round),
                  .SUBTRACT(subtract)
                  );

   DSP38 #(
           .DSP_MODE("MULTIPLY_ACCUMULATE"),
           .OUTPUT_REG_EN("FALSE"),
           .INPUT_REG_EN("TRUE")
           ) dut_multacc_regin (
                  .A(a),
                  .B(b),
                  .ACC_FIR(acc_fir),
                  .Z(z_multacc_regin),
                  .DLY_B(dly_b_multacc_regin),
                  .CLK(clk),
                  .RESET(reset),
                  .FEEDBACK(feedback),
                  .LOAD_ACC(load_acc),
                  .UNSIGNED_A(unsigned_a),
                  .UNSIGNED_B(unsigned_b),
                  .SATURATE(saturate_enable),
                  .SHIFT_RIGHT(shift_right),
                  .ROUND(round),
                  .SUBTRACT(subtract)
                  );

   DSP38 #(
           .DSP_MODE("MULTIPLY_ACCUMULATE"),
           .OUTPUT_REG_EN("TRUE"),
           .INPUT_REG_EN("TRUE")
           ) dut_multacc_regin_regout (
                  .A(a),
                  .B(b),
                  .ACC_FIR(acc_fir),
                  .Z(z_multacc_regin_regout),
                  .DLY_B(dly_b_multacc_regin_regout),
                  .CLK(clk),
                  .RESET(reset),
                  .FEEDBACK(feedback),
                  .LOAD_ACC(load_acc),
                  .UNSIGNED_A(unsigned_a),
                  .UNSIGNED_B(unsigned_b),
                  .SATURATE(saturate_enable),
                  .SHIFT_RIGHT(shift_right),
                  .ROUND(round),
                  .SUBTRACT(subtract)
                  );

endmodule
