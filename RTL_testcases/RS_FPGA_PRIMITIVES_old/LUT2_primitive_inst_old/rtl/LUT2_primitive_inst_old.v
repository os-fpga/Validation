module LUT2_primitive_inst_old (
  input [1:0] A_LUT2, // Data Input
  output Y_LUT2      // Data Output
);

  wire [1:0] A;
  wire Y;

  LUT2 #(
    .INIT_VALUE(4'h0) // 4-bit LUT logic value (You can change this initialization value if needed)
  ) LUT2_primitive (
    .A(A_LUT2), // Connect to your input signal
    .Y(Y)       // Connect to your output signal
  );

  // Connect your output signal to the instance's output
  assign Y_LUT2 = Y;

endmodule
