module single_port_ram_top #(parameter WIDTH = 32)(
	input clk,
	input rst,
	input [WIDTH-1:0] data_in,
	output reg [WIDTH-1:0] data_out);

	wire [WIDTH-1:0] data_out_wire;
	wire [5:0] addr = data_in[6:1];
	wire we = data_in[0];

	always @ (negedge clk) begin
	if (rst)
		data_out <= 0;
	else
		data_out <= data_out_wire;
    end
        
    single_port_ram single_dut (.clk(clk),.we(we),.data(data_in),.q(data_out_wire),.addr(addr));

endmodule

module single_port_ram
(
	input [31:0] data,
	input [5:0] addr,
	input we, clk,
	output [31:0] q
);

	// Declare the RAM variable
	reg [31:0] ram[63:0];
	
	// Variable to hold the registered read address
	reg [5:0] addr_reg;
	initial begin
	   $readmemh("mem_ram.mem",ram);
	end
	always @ (negedge clk)
	begin
	// Write
		if (we)
			ram[addr] <= data;
		
		addr_reg <= addr;
		
	end
	 
	assign q = ram[addr_reg];
	
endmodule
