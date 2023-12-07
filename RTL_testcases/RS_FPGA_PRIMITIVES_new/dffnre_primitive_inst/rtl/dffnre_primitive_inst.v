module dffnre_primitive_inst (
  input D,                // Data Input
  input R,                // Active-low, asynchronous reset
  input E,                // Active-high enable
  input C,                // Negedge clock
  output reg Q   // Data Output
);

  // Instantiate the DFFNRE module
  DFFNRE dffnre_inst (
    .D(D),
    .R(R),
    .E(E),
    .C(C),
    .Q(Q)
  );

endmodule
