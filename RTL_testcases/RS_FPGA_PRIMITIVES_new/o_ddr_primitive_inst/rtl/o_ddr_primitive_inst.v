module o_ddr_primitive_inst (
  input [1:0] data_input,
  input reset,
  input enable,
  input clk,
  output reg output_data
);

  reg [1:0] out;

  O_DDR o_ddr_inst (
    .D(out),
    .R(reset),
    .E(enable),
    .C(clk),
    .Q(output_data)
  );

  always @(posedge clk) begin
    if (!reset) begin
      out <= 1'b0;   end 
    else begin
      out <= data_input;   end
  end

endmodule