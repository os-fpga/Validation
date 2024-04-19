module co_sim_PLL_primitive_inst;
// Clock signals
    reg CLK_IN;
    wire 		CLK_OUT	,	CLK_OUT_netlist;
    wire 		CLK_OUT_DIV2	,	CLK_OUT_DIV2_netlist;
    wire 		CLK_OUT_DIV3	,	CLK_OUT_DIV3_netlist;
    wire 		CLK_OUT_DIV4	,	CLK_OUT_DIV4_netlist;
    wire 		LOCK	,	LOCK_netlist;
    reg 		PLL_EN;
    wire 		SERDES_FAST_CLK	,	SERDES_FAST_CLK_netlist;
    reg 		reset;
	integer		mismatch	=	0;

PLL_primitive_inst	golden (.*);

`ifdef PNR
	PLL_primitive_inst_post_route route_net (.*, .CLK_OUT(CLK_OUT_netlist), .CLK_OUT_DIV2(CLK_OUT_DIV2_netlist), .CLK_OUT_DIV3(CLK_OUT_DIV3_netlist), .CLK_OUT_DIV4(CLK_OUT_DIV4_netlist), .LOCK(LOCK_netlist), .SERDES_FAST_CLK(SERDES_FAST_CLK_netlist) );
`else
	PLL_primitive_inst_post_synth synth_net (.*, .CLK_OUT(CLK_OUT_netlist), .CLK_OUT_DIV2(CLK_OUT_DIV2_netlist), .CLK_OUT_DIV3(CLK_OUT_DIV3_netlist), .CLK_OUT_DIV4(CLK_OUT_DIV4_netlist), .LOCK(LOCK_netlist), .SERDES_FAST_CLK(SERDES_FAST_CLK_netlist) );
`endif

//clock initialization for CLK_IN
    initial begin
        CLK_IN = 1'b0;
        forever #5 CLK_IN = ~CLK_IN;
    end
// Initialize values to zero 
initial	begin
	