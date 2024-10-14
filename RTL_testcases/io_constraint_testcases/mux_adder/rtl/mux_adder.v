module mux_adder(
input [3:0] m,
input [3:0] n,
output [7:0] pro);
wire [3:0] ps0;
wire [3:0] ps1;
wire [3:0] ps2;
wire [3:0] ps3;
wire pc0;
wire pc1;
wire pc2;
wire pc3;
wire [3:0] pcs0;
wire [3:0] pcs1;
wire [3:0] pcs2;
wire [3:0] pass0;
wire [3:0] pass1;
wire [3:0] pass2;
wire [3:0] pass3;
assign pcs0 = {pc0, ps0[3], ps0[2], ps0[1]};
assign pcs1 = {pc1, ps1[3], ps1[2], ps1[1]};
assign pcs2 = {pc2, ps2[3], ps2[2], ps2[1]};
fourbitmux m0 (.d0(4'b0000), .d1(m), .s(n[0]), .o(pass0));
fourbitmux m1 (.d0(4'b0000), .d1(m), .s(n[1]), .o(pass1));
fourbitmux m2 (.d0(4'b0000), .d1(m), .s(n[2]), .o(pass2));
fourbitmux m3 (.d0(4'b0000), .d1(m), .s(n[3]), .o(pass3));
fourbitadder add0 (.a(4'b0000), .b(pass0), .cin(1'b0), .s(ps0), .cout(pc0));
fourbitadder add1 (.a(pcs0), .b(pass1), .cin(1'b0), .s(ps1), .cout(pc1));
fourbitadder add2 (.a(pcs1), .b(pass2), .cin(1'b0), .s(ps2), .cout(pc2));
fourbitadder add3 (.a(pcs2), .b(pass3), .cin(1'b0), .s(ps3), .cout(pc3));
assign pro[7] = pc3;
assign pro[6:3] = ps3;
assign pro[2] = ps2[0];
assign pro[1] = ps1[0];
assign pro[0] = ps0[0];
endmodule

module fourbitmux(
input [3:0] d0,
input [3:0] d1,
input s,
output reg [3:0] o);
always @(d0,d1,s)
begin
case (s)
1'b0 : o <= d0;
1'b1 : o <= d1;
endcase
end
endmodule

module fourbitadder (
input [3:0] a,
input [3:0] b,
input cin,
output [3:0] s,
output cout);
wire [3:0] p;
wire [3:0] g;
wire [3:0] cf;
assign g = a & b;
assign p = a | b;
assign cf[0] = cin;
assign cf[1] = g[0] | (cin & p[0] ) ;
assign cf[2] = g[1] | (g[0] & p[1] )| (cin & p[0] & p[1] ) ;
assign cf[3] = g[2] | (g[1] & p[2]) | (g[0] & p[1] & p[2]) | (cin & p[0] & p[1] & p[2] );
assign cout = g[3] | (g[2] & p[3])| (g[1] & p[2] & p[3]) | (g[0] & p[1] & p[2] & p[3]) | (cin & p[0]
& p[1] & p[2] & p[3]);
assign s= a ^ (b ^ cf) ;
endmodule