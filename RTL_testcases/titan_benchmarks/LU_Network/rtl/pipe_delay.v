module pipe_delay #
(
	parameter CYCLES = 5,
	parameter WIDTH = 5
)
(
	input i_clk,
	input i_reset,
	input i_enable,
	
	input [WIDTH-1:0] i_in,
	output [WIDTH-1:0] o_out
);

reg [WIDTH-1:0] shiftregs [CYCLES-1:0];

integer i;
always @ (posedge i_clk or posedge i_reset) begin
	if (i_reset == 1'b1) begin
		for (i = 0; i < CYCLES; i = i + 1) begin
			shiftregs[i] <= 0;
		end
	end
	else if (i_enable) begin
		shiftregs[0] <= i_in;
		
		for (i = 0; i < CYCLES-1; i = i + 1) begin
			shiftregs[i+1] <= shiftregs[i];
		end
	end
end

assign o_out = shiftregs[CYCLES-1];

endmodule
	