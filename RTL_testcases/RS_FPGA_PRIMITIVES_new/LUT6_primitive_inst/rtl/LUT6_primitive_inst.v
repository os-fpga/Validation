module LUT6_primitive_inst (
  input [5:0] A_LUT6, // Data Input
  output Y_LUT6      // Data Output
);

  wire [5:0] A;
  wire Y;

//works as and gate (6 input)
  LUT6 #(
    .INIT_VALUE(64'h8000000000000000) // LUT logic value (You can change this initialization value if needed)
  ) LUT6_primitive (
    .A(A_LUT6), // Connect to your input signal
    .Y(Y)       // Connect to your output signal
  );

  // Connect your output signal to the instance's output
  assign Y_LUT6 = Y;

endmodule
