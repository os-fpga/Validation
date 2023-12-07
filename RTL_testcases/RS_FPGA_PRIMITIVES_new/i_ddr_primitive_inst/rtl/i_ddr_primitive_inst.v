module i_ddr_primitive_inst (
  input data_input,       // Data input (connect to your input signal)
  input reset,            // Active-low asynchronous reset
  input enable,           // Active-high enable
  input clock,            // Clock input
  output reg [1:0] output_data // Data output
);

  // Instantiate the I_DDR module
  I_DDR i_ddr_inst (
    .D(data_input),
    .R(reset),
    .E(enable),
    .C(clock),
    .Q(output_data)
  );


endmodule