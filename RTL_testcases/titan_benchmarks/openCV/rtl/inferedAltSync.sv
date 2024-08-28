module inferedAltSync #(
	parameter int ADDR_WIDTH = 1,
	parameter int WORD_SIZE = 1
)(

	input bit clk,

	input logic unsigned [ADDR_WIDTH-1:0] waddr,
	input logic [WORD_SIZE-1:0] wdata,
	input logic unsigned [ADDR_WIDTH-1:0] raddr,
	input bit we,
	
	output logic [WORD_SIZE - 1:0] q,
	output logic [WORD_SIZE - 1:0] qw
);


// number of elements that should be addressable
localparam int ELEMENTS = 1 << ADDR_WIDTH ;

(* ramstyle = "no_rw_check" *) logic [WORD_SIZE-1:0] ram[ELEMENTS-1];

always_ff @(posedge clk) begin
	if(we) ram[waddr] <= wdata;
	qw <= ram[waddr];
	q <= ram[raddr];
end

endmodule : inferedAltSync