module o_buft_primitive_inst (
  input clk,
  input rst,
  input data1,
  input data2,
  output O_O_BUFT
);

  wire O;
  reg dff1;
  reg dff2;

  O_BUFT O_BUFT_primitive (
    .I(dff1), 
    .T(dff2),
    .O(O)
  );

  assign O_O_BUFT = O;

  always @(negedge clk or posedge rst) begin
    if (rst) begin
      dff1 <= 1'b0;
    end else begin
      dff1 <= data1;
    end
  end

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      dff2 <= 1'b0;
    end else begin
      dff2 <= data2;
    end
  end
endmodule
