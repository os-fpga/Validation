module o_ddr_primitive_inst (
  input [1:0] data_input,       // Data input (connect to your input signal)
  input reset,            // Active-low asynchronous reset
  input enable,           // Active-high enable
  input clock,            // Clock input
  output reg output_data // Data output
);

  // Instantiate the I_DDR module
  O_DDR o_ddr_inst (
    .D(data_input),
    .R(reset),
    .E(enable),
    .C(clock),
    .Q(output_data)
  );


endmodule