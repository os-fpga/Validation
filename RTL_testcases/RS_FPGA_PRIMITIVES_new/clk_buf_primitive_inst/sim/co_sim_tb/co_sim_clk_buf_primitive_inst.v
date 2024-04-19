module co_sim_clk_buf_primitive_inst;
// Clock signals
    reg clock_input;
    wire 		clock_output	,	clock_output_netlist;
	integer		mismatch	=	0;

clk_buf_primitive_inst	golden (.*);

`ifdef PNR
	clk_buf_primitive_inst_post_route route_net (.*, .clock_output(clock_output_netlist) );
`else
	clk_buf_primitive_inst_post_synth synth_net (.*, .clock_output(clock_output_netlist) );
`endif

//clock initialization for clock_input
    initial begin
        clock_input = 1'b0;
        forever #5 clock_input = ~clock_input;
    end
// Initialize values to zero 
initial	begin
	{