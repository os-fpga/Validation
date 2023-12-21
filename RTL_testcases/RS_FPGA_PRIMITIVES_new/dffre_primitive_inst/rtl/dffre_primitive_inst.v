module dffre_primitive_inst (
  input data_input,    // Data Input
  input reset,         // Active-low, asynchronous reset
  input enable,        // Active-high enable
  input clock,         // Clock
  output reg data_output // Data Output
);

  // Instantiate the DFFRE module
  DFFRE dffre_inst (
    .D(data_input),
    .R(reset),
    .E(enable),
    .C(clock),
    .Q(data_output)
  );

endmodule
