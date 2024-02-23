module signed_multiply_accumulate
#(parameter WIDTH=8)
(
	input clk, clear, clken, sload,
	input signed [WIDTH-1:0] dataa,
	input signed [WIDTH-1:0] datab,
	output reg signed [2*WIDTH-1:0] adder_out
);

	// Declare registers and wires
	reg  signed [WIDTH-1:0] dataa_reg, datab_reg;
	reg  sload_reg;
	reg	 signed [2*WIDTH-1:0] old_result;
	wire signed [2*WIDTH-1:0] multa;

	// Store the results of the operations on the current data
	assign multa = dataa_reg * datab_reg;

	// Store (or clear) old results
	always @ (adder_out, sload_reg)
	begin
		if (sload_reg)
			old_result <= 0;
		else
			old_result <= adder_out;
	end

	// Clear or update data, as appropriate
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
