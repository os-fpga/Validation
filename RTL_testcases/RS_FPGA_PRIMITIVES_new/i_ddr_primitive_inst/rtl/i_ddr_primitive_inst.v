module i_ddr_primitive_inst (
  input data_input,
  input reset,
  input enable,
  input clock,
  output reg [1:0] output_data
);

  wire out;

  I_DDR i_ddr_inst (
    .D(data_input),
    .R(reset),
    .E(enable),
    .C(clock),
    .Q(out)
  );

  always @(*) begin
    if (enable) begin
      output_data <= out;   end 
    else begin
      output_data <= output_data;   end
  end


endmodule