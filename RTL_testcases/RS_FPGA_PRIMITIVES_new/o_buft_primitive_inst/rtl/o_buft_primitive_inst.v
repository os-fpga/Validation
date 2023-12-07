module o_buft_primitive_inst (
  input I_O_BUFT, // Data input
  input T_O_BUFT, // Tri-state output
  output O_O_BUFT // Data output (connect to top-level port)
);

  wire I;
  wire T;
  wire O;

  O_BUFT O_BUFT_primitive (
    .I(I_O_BUFT), // Connect to your input signal
    .T(T_O_BUFT), // Connect to your tri-state signal
    .O(O)         // Connect to your output signal
  );

  // Connect your output signal to the instance's output
  assign O_O_BUFT = O;

endmodule
