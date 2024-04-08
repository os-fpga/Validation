module carry_chain_primitive_inst(
  input clk,rst,
  input sel1,sel2,
  input [1:0] sel3,
  input [1:0] a,
  input [1:0] b,
  input [1:0] c,
  input [1:0] d,
  input [1:0] e,
  output out1,out2,
  // output cout
  );

  wire cout1_wire;
  wire ow1,ow2;
  wire y1,y2;
  wire [1:0] y3;

  CARRY carry_inst1 (.P(y1),.G(y2),.CIN(),.O(ow1),.COUT(cout1_wire));
  CARRY carry_inst2 (.P(y3[0]),.G(y3[1]),.CIN(cout1_wire),.O(ow2),.COUT());

  assign y1 = (sel1) ? e[0] : 1'b0;
  assign y2 = (sel2) ? e[1] : 1'b0;

  d_ff dff1 (.clk(clk),.reset(rst),.D(ow1),.Q(out1));
  d_ff dff2 (.clk(clk),.reset(rst),.D(ow2),.Q(out2));

  assign y3 = (sel3 == 2'b00) ? a:
             (sel3 == 2'b01) ? b:
             (sel3 == 2'b10) ? c:
             (sel3 == 2'b11) ? d:
             2'b00;

endmodule

module d_ff (
  input wire clk,
  input wire reset,
  input wire D,
  output reg Q
  );

    always@ (posedge clk or posedge reset) begin
        if (reset)
          Q <= 0;
        else
          Q <= D;
    end

endmodule