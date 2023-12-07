module i_buf_primitive_inst (
  input data_input,     // Data input (connect to top-level port)
  input enable_input,   // Enable input
  output data_output    // Data output
);

  I_BUF i_buf_inst (
    .I(data_input),
    .EN(enable_input),
    .O(data_output)
  );

endmodule
