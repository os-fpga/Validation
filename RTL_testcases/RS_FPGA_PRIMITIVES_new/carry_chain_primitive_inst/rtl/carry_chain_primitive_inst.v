module carry_chain_primitive_inst(
  input clk,rst,
  input data_cin,
  input P, G,
  output data_cout,
  output reg [7:0] out
  );

  reg dff1;
  wire dff2;
  wire o;
  reg [7:0] register;

  CARRY carry_inst (
    .P(P),
    .G(G),
    .CIN(dff1),
    .O(o),
    .COUT(dff2)
  );

  always @(negedge clk or negedge rst) begin
    if (!rst) begin
      dff1 <= 1'b0;
    end else begin
      dff1 <= data_cin;
    end
  end

  always @(negedge clk or negedge rst) begin
    if (!rst) begin
      data_cout <= 1'b0;
    end else begin
      data_cout <= dff2;
    end
  end

  always @(posedge clk or negedge rst) begin
      if (!rst) begin
          register <= 8'b00000000;
      end else begin
          register <= {register[6:0], o};
      end
  end

  assign out = register;
endmodule