module tdp_512x10 (clkA, clkB, weA, weB, addrA, addrB, dinA, dinB, doutA, doutB);
    input clkA, clkB, weA, weB;
    input [3:0] addrA, addrB;
    input [511:0] dinA, dinB;
    output [511:0] doutA, doutB;

reg [3:0] reg_addrA, reg_addrB;
reg [511:0] ram [9:0];
always @(posedge clkA)
begin
reg_addrA <= addrA;
    if (weA)
	  ram[addrA] <= dinA;
        
end


always @(posedge clkB)
begin
  reg_addrB <= addrB;
    if (weB)
        ram[addrB] <= dinB;
      
end
    

assign doutA = ram[reg_addrA];
assign doutB = ram[reg_addrB];

endmodule