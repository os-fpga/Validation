module sadd_lpm(clk, ain, bin, res);

parameter IN_WIDTH = 8;
//parameter PIPE_DEPTH=2;
parameter PIPE_DEPTH=2;

input clk;
input [IN_WIDTH-1:0] ain;
input [IN_WIDTH-1:0] bin;
output [IN_WIDTH:0] res;


	lpm_add_sub	lpm_add_sub_component (
				.dataa (ain),
				.datab (bin),
				.clock (clk),
				.result (res));
	defparam
		lpm_add_sub_component.lpm_width = IN_WIDTH,
		lpm_add_sub_component.lpm_direction = "ADD",
		lpm_add_sub_component.one_input_is_constant = "NO",
		lpm_add_sub_component.lpm_pipeline = PIPE_DEPTH;

//exemplar attribute lpm_add_sub_component NOOPT TRUE

endmodule