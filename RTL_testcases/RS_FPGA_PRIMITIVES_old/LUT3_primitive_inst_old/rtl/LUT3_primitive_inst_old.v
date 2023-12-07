module LUT3_primitive_inst_old (
  input [2:0] A_LUT3, // Data Input
  output Y_LUT3      // Data Output
);

  wire [2:0] A;
  wire Y;

  LUT3 #(
    .INIT_VALUE(8'h00) // 8-bit LUT logic value (You can change this initialization value if needed)
  ) LUT3_primitive (
    .A(A_LUT3), // Connect to your input signal
    .Y(Y)       // Connect to your output signal
  );

  // Connect your output signal to the instance's output
  assign Y_LUT3 = Y;

endmodule
