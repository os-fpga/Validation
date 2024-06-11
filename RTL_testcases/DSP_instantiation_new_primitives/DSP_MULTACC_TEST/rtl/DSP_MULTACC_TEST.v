module DSP_MULTACC_TEST(
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
   output [37:0] z_multacc, z_multadd);           // 38-bit data output
//    output [17:0] dly_b_multacc, dly_b_multadd );      // 18-bit B registered output


        DSP38 #(
        .DSP_MODE("MULTIPLY_ADD_SUB"),
        .OUTPUT_REG_EN("FALSE"),
        .INPUT_REG_EN("FALSE")
        ) dut_multadd (
                .A(a),
                .B(b),
                .ACC_FIR(acc_fir),
                .Z(z_multadd),
        //   .DLY_B(dly_b_multadd),
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
                        // .DLY_B(dly_b_multacc),
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
