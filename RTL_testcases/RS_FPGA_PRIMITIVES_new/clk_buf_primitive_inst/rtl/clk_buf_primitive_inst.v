module clk_buf_primitive_inst (
  input clock_input,  // Clock input (connect to your input signal)
  input ibuf_enable,
  output clock_output // Clock output
);

wire wire1, wire2;
reg wire_out_clk=0;

I_BUF i_buf_inst (
  .I(clock_input),
  .EN(ibuf_enable),
  .O(wire2)
);

always @(posedge wire1) begin
  wire_out_clk <=  wire2;
end

  // Instantiate the CLK_BUF module
  CLK_BUF clk_buf_inst (
    .I(wire2),
    .O(wire1)
  );

assign clock_output = wire_out_clk;
  // You can also perform other logic or processing here as needed

endmodule
