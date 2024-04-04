module o_buf_ds_primitive_inst (
  input clk,
  input rst,
  input [7:0] parallel_in,
  output O_P_O_BUF_DS, // Data positive output (connect to top-level port)
  output O_N_O_BUF_DS // Data negative output (connect to top-level port)
);

  wire o_p;
  wire o_n;
  reg serial_out;
  reg [7:0] register;
  reg [2:0] counter;

  O_BUF_DS O_BUF_DS_primitive (
    .I(serial_out),   // Connect to your input signal
    .O_P(o_p),          // Connect to your positive output signal
    .O_N(o_n)           // Connect to your negative output signal
  );

  // Connect your positive and negative output signals to the instance's outputs
  assign O_P_O_BUF_DS = o_p;
  assign O_N_O_BUF_DS = o_n;

  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      register <= 8'b00000000;
      counter <= 3'b000;
      serial_out <= 1'b0;
    end 
    else begin
      if (counter == 3'b000) begin
        register <= parallel_in;
      end
      if (counter != 3'b111) begin
        serial_out <= register[0];
        register <= {register[6:0], 1'b0};
        counter <= counter + 1'b1;
      end
    end
  end

endmodule
