module LUT1_primitive_inst (
  input A_LUT1, // Data Input
  output Y_LUT1 // Data Output
);

  wire A;
  wire Y;
// WILL WORK AS AN INVERTER
  LUT1 #(
    .INIT_VALUE(2'h1) // 2-bit LUT logic value (You can change this initialization value if needed)
  ) LUT1_primitive (
    .A(A_LUT1), // Connect to your input signal
    .Y(Y)       // Connect to your output signal
  );

  // Connect your output signal to the instance's output
  assign Y_LUT1 = Y;

endmodule
