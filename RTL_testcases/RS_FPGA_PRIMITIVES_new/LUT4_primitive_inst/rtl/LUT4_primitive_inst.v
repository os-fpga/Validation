module LUT4_primitive_inst (
  input [3:0] A_LUT4, // Data Input
  output Y_LUT4      // Data Output
);

  wire [3:0] A;
  wire Y;
//work as adder
  LUT4 #(
    .INIT_VALUE(16'h6996) // 16-bit LUT logic value (You can change this initialization value if needed)
  ) LUT4_primitive (
    .A(A_LUT4), // Connect to your input signal
    .Y(Y)       // Connect to your output signal
  );

  // Connect your output signal to the instance's output
  assign Y_LUT4 = Y;

endmodule
