module o_buf_primitive_inst (
  input data_in,
  input clk,
  input rst,
  output data_output
);

  reg dff_out;

  O_BUF o_buf_inst (
    .I(dff_out),
    .O(data_output)
  );

  always @(negedge clk or posedge rst) begin
    if (rst) begin
      dff_out <= 1'b0; end 
    else begin
      dff_out <= data_in; end
  end

endmodule
