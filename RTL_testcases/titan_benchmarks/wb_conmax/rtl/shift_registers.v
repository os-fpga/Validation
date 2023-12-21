module shift_reg (i_clk, i_reset, i_shift, i_load, i_reg, o_reg, o_shift);
	parameter WIDTH=32;
	
	input i_clk;
	input i_reset;
	input i_shift;
	input i_load;
	input [WIDTH-1:0] i_reg;
	
	output [WIDTH-1:0] o_reg;
	output o_shift;
	
	
	reg [WIDTH-1:0] r_shift_reg;
	
	always@(posedge i_clk or posedge i_reset) begin
		if(i_reset)
			r_shift_reg <= 0;
		else begin
			if (i_load)
				r_shift_reg <= i_reg;
			else 
				r_shift_reg <= {r_shift_reg[WIDTH-2:0],i_shift};
		end
	end

	assign o_reg = r_shift_reg;
	assign o_shift = r_shift_reg[WIDTH-1];
endmodule