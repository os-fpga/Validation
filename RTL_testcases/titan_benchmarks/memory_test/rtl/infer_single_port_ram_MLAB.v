// Quartus II Verilog Template
// Single port RAM with single read/write address 

module infer_single_port_ram_MLAB 
#(parameter DATA_WIDTH=8, parameter ADDR_WIDTH=6)
(
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] addr,
	input we, clk,
	output reg [(DATA_WIDTH-1):0] q
);


	// Declare the RAM variable
	//(* ramstyle = "MLAB" *) reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
	reg [(DATA_WIDTH-1):0] ram[0:(2**ADDR_WIDTH-1)];

	// Variable to hold the registered read address
	reg [ADDR_WIDTH-1:0] addr_reg;

	always @ (posedge clk)
	begin
		// Write
		if (we)
			ram[addr] <= data;

		q <= ram[addr];
	end

endmodule
