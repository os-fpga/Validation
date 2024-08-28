module simpleFIFO #(	 
	
	parameter int DEPTH = 64,
	parameter int WIDTH = 16	 

)( 

	//////////// CLOCK //////////
	input bit clk,
	input bit resetn,
	
	//////////// Data Signals //////////
	input logic we,
	input logic re,
	input logic [WIDTH-1:0] data,
	
	output logic full,
	output logic empty,
	output logic [WIDTH-1:0] q
);

/*
	// fifo storage ram
	integer my_q[$];
	//logic [WIDTH-1:0] ram[];

	//fifo write
	always_ff @(posedge clk) begin
		if (resetn == 0)
			ram = '{0};
		else if (we == 1 && ram.size() < DEPTH)
			ram.push_back(DATA);	
	end

	//fifo read
	always_ff @(posedge clk) begin
		if (re == 1 && ram.size() > 0)
			Q <= ram.pop_front();
	end

	// FIFO control flags
	assign empty = (ram.size() == 0) ? 1 : 0;
	assign full = (ram.size() == DEPTH) ? 1 : 0;
	*/
endmodule : simpleFIFO