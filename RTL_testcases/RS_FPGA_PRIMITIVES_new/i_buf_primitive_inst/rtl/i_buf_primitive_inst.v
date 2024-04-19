module i_buf_primitive_inst (
  input enable_output,
  input data_input,     // Data input (connect to top-level port)
  input enable_input,   // Enable input
  output reg data_output    // Data output
);
  wire i_out;

  I_BUF i_buf_inst (
    .I(data_input),
    .EN(enable_input),
    .O(i_out)
  );

  always @* begin
    if (enable_output) begin
          data_output <= i_out;
    end else begin
        data_output <= 1'b0;
    end
  end

endmodule
