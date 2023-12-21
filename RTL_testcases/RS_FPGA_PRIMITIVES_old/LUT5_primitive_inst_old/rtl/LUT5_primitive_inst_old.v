module LUT5_primitive_inst_old (
  input [4:0] A_LUT5, // Data Input
  output Y_LUT5      // Data Output
);

  wire [4:0] A;
  wire Y;

  LUT5 #(
    .INIT_VALUE(32'h00000000) // LUT logic value (You can change this initialization value if needed)
  ) LUT5_primitive (
    .A(A_LUT5), // Connect to your input signal
    .Y(Y)       // Connect to your output signal
  );

  // Connect your output signal to the instance's output
  assign Y_LUT5 = Y;

endmodule
