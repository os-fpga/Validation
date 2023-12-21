module o_buf_primitive_inst (
  input data_input,     // Data input
  output data_output    // Data output (connect to top-level port)
);

  O_BUF #(
    .IOSTANDARD("DEFAULT"),     // IO Standard
    .DRIVE_STRENGTH(2),         // Drive strength in mA for LVCMOS standards
    .SLEW_RATE("SLOW")          // Transition rate for LVCMOS standards
  ) o_buf_inst (
    .I(data_input),
    .O(data_output)
  );

endmodule
