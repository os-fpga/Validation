module O_DELAY_primitive_inst (
  input reset,
  input in, // Data input
  input DLY_LOAD, // Delay load input
  input DLY_ADJ, // Delay adjust input
  input DLY_INCDEC, // Delay increment / decrement input
  output [5:0] DLY_TAP_VALUE, // Delay tap value output
  input CLK_IN, // Clock input
  output O // Data output
);

reg dff;

O_DELAY #(.DELAY(0)) inst (
  dff, // Data input
  DLY_LOAD, // Delay load input
  DLY_ADJ, // Delay adjust input
  DLY_INCDEC, // Delay increment / decrement input
  DLY_TAP_VALUE, // Delay tap value output
  CLK_IN, // Clock input
  O 
);

always @(posedge CLK_IN) begin
  if (reset) begin
      dff <= 0;
  end
    dff <= in;
end

endmodule
