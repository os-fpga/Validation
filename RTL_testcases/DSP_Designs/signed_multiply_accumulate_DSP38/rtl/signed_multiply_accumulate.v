module signed_multiply_accumulate
#(parameter WIDTH=25)
(
	input clk, clear, clken, sload,
	input [WIDTH-1:0] dataa,
	input [WIDTH-1:0] datab,
	output reg [2*WIDTH-1:0] adder_out
);

	reg  [WIDTH-1:0] dataa_reg, datab_reg;
	reg  sload_reg;
	reg	 [2*WIDTH-1:0] old_result;
	wire [2*WIDTH-1:0] multa;

	assign multa = dataa_reg * datab_reg;

	always @ (adder_out, sload_reg)
	begin
		if (sload_reg)
			old_result <= 0;
		else
			old_result <= adder_out;
	end

	always @ (posedge clk or posedge clear)
	begin
		if (clear)
		begin
			dataa_reg <= 0;
			datab_reg <= 0;
			sload_reg <= 0;
			adder_out <= 0;
		end
		else if (clken)
		begin
			dataa_reg <= dataa;
			datab_reg <= datab;
			sload_reg <= sload;
			adder_out <= old_result + multa;
		end
	end

endmodule
