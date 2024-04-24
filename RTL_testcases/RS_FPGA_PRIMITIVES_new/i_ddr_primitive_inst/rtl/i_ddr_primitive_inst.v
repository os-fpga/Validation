module i_ddr_primitive_inst (
  input data_input,
  input reset,
  input enable,
  input clock,
  output reg [1:0] output_data = 0
);

  wire [1:0] out;

  I_DDR i_ddr_inst (
    .D(data_input),
    .R(reset),
    .E(enable),
    .C(clock),
    .Q(out)
  );

  always @(posedge clock) begin
    if (enable) begin
      output_data <= out;   end 
    else begin
      output_data <= output_data;   end
  end


endmodule