module i_buf_ds_primitive_inst (
  input clk,
  input enable_output,
  input data_positive_input,    // Data positive input (connect to top-level port)
  input data_negative_input,    // Data negative input (connect to top-level port)
  input enable_input,           // Enable the input
  output data_output            // Data output
);
  wire do_wire;

  I_BUF_DS i_buf_ds_inst (
    .I_P(data_positive_input),
    .I_N(data_negative_input),
    .EN(enable_input),
    .O(do_wire)
  );

  always @(posedge clk) begin
    if (!enable_output) begin
      data_output <= 1'b0;
    end else begin
      data_output <= do_wire;
    end
  end

endmodule
