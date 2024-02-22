// `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2022 11:22:44 AM
// Design Name: 
// Module Name: tb_dsp
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_dsp;
reg [35:0]a, a1;
reg [35:0]b, b1;
wire [71:0]z1, z2;
reg clk, reset, clk1;

dsp_AB_36x36_Pipeline dut1(.a(a),.b(b),.z(z1), .clk(clk1), .reset(reset));

dsp dut2(.a(a1),.b(b1),.z(z2));

initial 
begin
reset = 1'b1;
// a=0;
// b=0;
#2;
reset = 1'b0;
end

initial 
begin
clk1 = 1'b1;
forever #5 clk1 = ~clk1;
end

integer i, mismatch=0;
reg [6:0]cycle;

initial
begin
for (i=0; i<500; i=i+1)
begin
if(i == 0) begin
    a <= {36{1'b1}};
    b <= {36{1'b1}};
end
else if (i == 1) begin
    a <= {36{1'b0}};
    b <= {36{1'b0}};
end
else begin
    a <= $random;
    b <= $random;
end
repeat (2) @ (posedge clk1);
a1 <= a;
b1 <= b;
compare(cycle);
end

if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\n**** Simulation Passed ****");
    else
        $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);

end



task compare(input integer cycle);
    if(z1 !== z2) begin
        $display("Z_Out mismatch. dut1: %0h, dut2: %0h, Time: %0t", z1, z2,$time);
        mismatch = mismatch+1;
    end
endtask


initial begin
    $dumpfile("dsp.vcd");
    $dumpvars;
    #20000;
    $finish;
end
endmodule


module dsp(a, b, z);
input   [35:0]a;
input  [35:0]b;
output [71:0]z;
assign z = a*b;
endmodule