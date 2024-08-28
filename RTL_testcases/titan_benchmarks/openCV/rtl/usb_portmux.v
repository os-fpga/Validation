module sys_to_fpga #
(
	parameter	WIDTH = 32
)
(
	input			clk,
	input			shift_en,
	input			sel,
	input	[31:0]	mux_data,
	output	[WIDTH-1:0]	user_data
);

localparam WIDTH_PAD = (WIDTH + 31) & (~31);
localparam PAD_BITS = WIDTH_PAD - WIDTH;
localparam SHIFTREG_WIDTH = WIDTH_PAD - 32;

assign user_data[WIDTH-1 : SHIFTREG_WIDTH] = mux_data[32-PAD_BITS-1 : 0];

generate
if (WIDTH > 32) begin : shiftregs
	reg [SHIFTREG_WIDTH-1:0] shiftreg;
	integer i;
	
	always @ (posedge clk) begin
		if (sel && shift_en) begin
			shiftreg[SHIFTREG_WIDTH-1 : SHIFTREG_WIDTH-32] <= mux_data;
			for (i = 0; i < SHIFTREG_WIDTH-32; i = i + 32) begin
				shiftreg[i+31 -: 32] <= shiftreg[i+63 -: 32];
			end
		end
	end
	
	assign user_data[SHIFTREG_WIDTH-1:0] = shiftreg;
end
endgenerate

endmodule




module fpga_to_sys #
(
	parameter	WIDTH = 32
)
(
	input			clk,
	input			shift_en,
	input			passthru,
	input			pload,
	input			sel,	
	output	[31:0]	mux_data,
	input	[WIDTH-1:0]	user_data
);

localparam WIDTH_PAD = (WIDTH + 31) & (~31);
localparam PAD_BITS = WIDTH_PAD - WIDTH;
localparam SHIFTREG_WIDTH = WIDTH_PAD - 32;

generate
if (WIDTH > 32) begin : shiftregs
	reg [SHIFTREG_WIDTH-1:0] shiftreg;
	integer i;
	
	always @ (posedge clk) begin
		if (pload && sel) begin
			if (PAD_BITS > 0) begin
				shiftreg[SHIFTREG_WIDTH-1 -: PAD_BITS] <= 'b0;
			end
			shiftreg[SHIFTREG_WIDTH-PAD_BITS-1:0] <= user_data[WIDTH-1:32];
		end
		else if (shift_en && sel) begin
			for (i = 0; i < SHIFTREG_WIDTH-32; i = i + 32) begin
				shiftreg[i+31 -: 32] <= shiftreg[i+63 -: 32];
			end
		end
	end
	
	assign mux_data = passthru? user_data[31:0] : shiftreg[31:0];
end
else if (WIDTH == 32) begin : noxhiftregs_exact
	assign mux_data = user_data;
end
else begin : noshiftregs_padded
	assign mux_data[31:WIDTH] = 'b0;
	assign mux_data[WIDTH-1:0] = user_data;
end
endgenerate


endmodule






module usb_portmux
(
	input 							OSC1_50,
	input							clk,
	input 							reset_n,
	
	// DE3 USB interface
	inout     	[31:0]          	OTG_D,
	output    	[17:1]          	OTG_A,
	output                    		OTG_CS_n,
	output                    		OTG_WE_n,
	output                    		OTG_OE_n,
	input                     		OTG_HC_IRQ,
	input                     		OTG_DC_IRQ,
	output                    		OTG_RESET_n,
	input                     		OTG_HC_DREQ,
	output                    		OTG_HC_DACK,
	input                     		OTG_DC_DREQ,
	output                    		OTG_DC_DACK,

	// User signals
	output	[63:0]	command_data,
	input	command_wanted,
	output	command_ready,
	output	[63:0]	feature_data,
	input	feature_wanted,
	output	feature_ready,
	output	[63:0]	cascade_data,
	input	cascade_wanted,
	output	cascade_ready,
	output	[31:0]	image_data,
	input	image_wanted,
	output	image_ready,
	input	[31:0]	result_data,
	output	result_ready_to_accept,
	input	result_ready_to_return,
	input	[63:0]	stats_data,
	output	stats_ready_to_accept,
	input	stats_ready_to_return
);

// Number of ports
localparam NUM_PORTS = 6;


// SOPC system
wire s_reset_n;
wire [3:0]	s_address;
wire s_we;
wire s_re;
wire [31:0]	s_writedata;
reg	[31:0]	s_readdata;

sopc_sys sopc_sys_inst
(
	.clk                       (OSC1_50),
	.reset_n                   (reset_n),
	
	.A_from_the_ISP1761        (OTG_A),
	.CS_N_from_the_ISP1761     (OTG_CS_n),
	.DC_DACK_from_the_ISP1761  (OTG_DC_DACK),
	.DC_DREQ_to_the_ISP1761    (OTG_DC_DREQ),
	.DC_IRQ_to_the_ISP1761     (OTG_DC_IRQ),
	.D_to_and_from_the_ISP1761 (OTG_D),
	.HC_DACK_from_the_ISP1761  (OTG_HC_DACK),
	.HC_DREQ_to_the_ISP1761    (OTG_HC_DREQ),
	.HC_IRQ_to_the_ISP1761     (OTG_HC_IRQ),
	.RD_N_from_the_ISP1761     (OTG_OE_n),
	.RESET_N_from_the_ISP1761  (OTG_RESET_n),
	.WR_N_from_the_ISP1761     (OTG_WE_n),
  
	.s_address_to_the_ports    (s_address),
	.s_re_to_the_ports         (s_re),
	.s_readdata_from_the_ports (s_readdata),
	.s_reset_n_to_the_ports    (s_reset_n),
	.s_we_to_the_ports         (s_we),
	.s_writedata_to_the_ports  (s_writedata)
);



// Port mux
reg [6:0] cur_port;
wire [NUM_PORTS-1:0] sel;

reg shift_en, pload, passthru, f2s_want, s2f_ready;
reg [31:0] s2f_data;

wire [NUM_PORTS-1:0] s2f_wants;
wire s2f_want;

wire [NUM_PORTS-1:0] f2s_readies;
wire f2s_ready;

wire [32*NUM_PORTS-1:0] f2s_datas;
wire [31:0] f2s_data;

wire [3:0] cur_port_xfer_cycles;

generate
if (NUM_PORTS > 1) begin : muxes
	lpm_mux #
	(
		.LPM_WIDTH(1),
		.LPM_SIZE(NUM_PORTS),
		.LPM_WIDTHS(7)
	) s2f_want_mux
	(
		.data(s2f_wants),
		.sel(cur_port),
		.result(s2f_want)
	);	

	lpm_mux #
	(
		.LPM_WIDTH(1),
		.LPM_SIZE(NUM_PORTS),
		.LPM_WIDTHS(7)
	) f2s_ready_mux
	(
		.data(f2s_readies),
		.sel(cur_port),
		.result(f2s_ready)
	);
	
	lpm_mux #
	(
		.LPM_WIDTH(32),
		.LPM_SIZE(NUM_PORTS),
		.LPM_WIDTHS(7)
	) f2s_data_mux
	(
		.data(f2s_datas),
		.sel(cur_port),
		.result(f2s_data)
	);

	lpm_decode #
	(
		.LPM_WIDTH(7),
		.LPM_DECODES(NUM_PORTS)
	) sel_decoder
	(
		.data(cur_port),
		.eq(sel)
	);

	lpm_mux #
	(
		.LPM_WIDTH(4),
		.LPM_SIZE(NUM_PORTS),
		.LPM_WIDTHS(7)
	) cycles_selector
	(
		.data({4'd1,4'd0,4'd0,4'd1,4'd1,4'd1}),
		.sel(cur_port),
		.result(cur_port_xfer_cycles)
	);
end
else begin: nomuxes
	assign s2f_want = s2f_wants[0];
	assign f2s_ready = f2s_readies[0];
	assign f2s_data = f2s_datas;
	assign sel[0] = 1'b1;
	assign cur_port_xfer_cycles = {4'd1,4'd0,4'd0,4'd1,4'd1,4'd1};
end
endgenerate


// FIFOs and connections

localparam [15:0] S2F_FIFO_NUMWORDS = 16'd128;
localparam [14:0] F2S_FIFO_NUMWORDS = 15'd128;

reg [31:0]	s2f_fifo_data;
wire [31:0] s2f_fifo_q;
reg s2f_fifo_rdreq;
reg s2f_fifo_wrreq;
wire s2f_fifo_empty;
wire [7:0] s2f_fifo_usedw;
dcfifo #
(
	.LPM_WIDTH(32),
	.LPM_NUMWORDS(S2F_FIFO_NUMWORDS),
	.LPM_SHOWAHEAD("ON"),
	.ADD_USEDW_MSB_BIT("ON")
) s2f_fifo
(
	.rdclk(clk),
	.wrclk(OSC1_50),
	.data(s2f_fifo_data),
	.wrreq(s2f_fifo_wrreq),
	.rdreq(s2f_fifo_rdreq),
	.aclr(!s_reset_n),
	.q(s2f_fifo_q),
	.rdempty(s2f_fifo_empty),
	.wrusedw(s2f_fifo_usedw[6:0]),
	.wrfull(s2f_fifo_usedw[7])
);

reg [31:0]	f2s_fifo_data;
wire [31:0] f2s_fifo_q;
reg f2s_fifo_rdreq;
reg f2s_fifo_wrreq;
wire f2s_fifo_full;
wire [7:0] f2s_fifo_usedw;
wire f2s_fifo_empty;
dcfifo #
(
	.LPM_WIDTH(32),
	.LPM_NUMWORDS(F2S_FIFO_NUMWORDS),
	.LPM_SHOWAHEAD("ON"),
	.ADD_USEDW_MSB_BIT("ON")
) f2s_fifo
(
	.rdclk(OSC1_50),
	.wrclk(clk),
	.data(f2s_fifo_data),
	.wrreq(f2s_fifo_wrreq),
	.rdreq(f2s_fifo_rdreq),
	.aclr(!s_reset_n),
	.q(f2s_fifo_q),
	.wrfull(f2s_fifo_full),
	.rdusedw(f2s_fifo_usedw[6:0]),
	.rdfull(f2s_fifo_usedw[7]),
	.rdempty(f2s_fifo_empty)
);

// Avalon slave logic

localparam [3:0] A_S2F_FIFO_DATA = 4'h0, A_S2F_FIFO_STATUS = 4'h4, A_F2S_FIFO_DATA = 4'h8, A_F2S_FIFO_STATUS = 4'hC;

always @* begin
	s_readdata = 32'bx;
	s2f_fifo_data = 32'bx;
	s2f_fifo_wrreq = 1'b0;
	f2s_fifo_rdreq = 1'b0;
	
	case (s_address)	
		A_S2F_FIFO_DATA: begin
			s2f_fifo_data = s_writedata;
			s2f_fifo_wrreq = s_we;
		end
		
		A_S2F_FIFO_STATUS: begin
			s_readdata = 32'b0;
			s_readdata[15:0] = s2f_fifo_usedw;
			s_readdata[31:16] = S2F_FIFO_NUMWORDS;
		end
		
		A_F2S_FIFO_DATA: begin
			s_readdata = f2s_fifo_q;
			f2s_fifo_rdreq = s_re;
		end
		
		A_F2S_FIFO_STATUS: begin
			s_readdata = 32'b0;
			s_readdata[15:0] = f2s_fifo_usedw;
			s_readdata[30:16] = F2S_FIFO_NUMWORDS;
			s_readdata[31] = f2s_fifo_empty;
		end
		
		default: begin
		end
	endcase
end


// Transfer/handshake state machine

localparam DIR_F2S = 1'b0, DIR_S2F = 1'b1;

// Number of bytes remaining in entire transaction
reg [31:0] xfer_count;
reg xfer_count_dec;
reg xfer_count_load;

// Number of 32-bit words remaining within user-sized word
reg [3:0] n_xfer_cycles;
reg n_xfer_cycles_dec;
reg n_xfer_cycles_load;

// Port info
reg xfer_dir;
reg xfer_portdir_load;

reg [2:0] state, nextstate;
localparam [2:0] S_IDLE = 3'd0, S_F2S = 3'd1, S_S2F = 3'd2, S_GETSIZE = 3'd3, S_F2S_PUTSIZE = 3'd4;

always @ (posedge clk or negedge s_reset_n)
begin
	if (!s_reset_n) begin
		state <= S_IDLE;
		n_xfer_cycles <= 'd0;
		xfer_count <= 'd0;
	end
	else begin
		state <= nextstate;
		
		if (xfer_count_load) xfer_count <= s2f_fifo_q;
		else if (xfer_count_dec) xfer_count <= xfer_count - 32'd4;
		
		if (n_xfer_cycles_load) n_xfer_cycles <= cur_port_xfer_cycles;
		else if (n_xfer_cycles_dec) n_xfer_cycles <= n_xfer_cycles - 4'd1;					
		
		if (xfer_portdir_load) begin
			cur_port <= s2f_fifo_q[6:0];
			xfer_dir <= s2f_fifo_q[7];
		end
	end
end

always @* begin
	nextstate = state;
	
	s2f_ready = 1'b0;
	f2s_want = 1'b0;
	shift_en = 1'b0;
	passthru = 1'b0;
	pload = 1'b0;
	s2f_data = 32'bx;
	
	s2f_fifo_rdreq = 1'b0;
	f2s_fifo_wrreq = 1'b0;
	f2s_fifo_data = 32'bx;
	
	xfer_count_load = 1'b0;
	xfer_count_dec = 1'b0;
	n_xfer_cycles_load = 1'b0;
	n_xfer_cycles_dec = 1'b0;
	xfer_portdir_load = 1'b0;
	
	case (state)
	S_IDLE: begin
		if (!s2f_fifo_empty) begin
			xfer_portdir_load = 1'b1;
			s2f_fifo_rdreq = 1'b1;
			nextstate = S_GETSIZE;
		end
	end
	
	S_GETSIZE: begin
		n_xfer_cycles_load = 1'b1;
		if (!s2f_fifo_empty) begin
			xfer_count_load = 1'b1;
			s2f_fifo_rdreq = 1'b1;
			
			if (xfer_dir == DIR_F2S) begin
				nextstate = S_F2S_PUTSIZE;
			end
			else begin
				nextstate = S_S2F;
			end
		end
	end	
	
	S_S2F: begin
		s2f_data = s2f_fifo_q;
		
		if (xfer_count[31] || xfer_count == 32'd0) begin
			nextstate = S_IDLE;
		end
		else if (!s2f_fifo_empty) begin
			if (n_xfer_cycles == 4'd0) begin
				s2f_ready = 1'b1;
				if (s2f_want) begin
					s2f_fifo_rdreq = 1'b1;
					xfer_count_dec = 1'b1;
					n_xfer_cycles_load = 1'b1;
				end
			end
			else begin
				s2f_fifo_rdreq = 1'b1;
				xfer_count_dec = 1'b1;
				n_xfer_cycles_dec = 1'b1;
				shift_en = 1'b1;
			end
		end
	end			
	
	S_F2S_PUTSIZE: begin
		if (!f2s_fifo_full) begin
			f2s_fifo_data = xfer_count;
			f2s_fifo_wrreq = 1'b1;
			nextstate = S_F2S;
		end
	end
	
	S_F2S: begin
		f2s_fifo_data = f2s_data;
		
		if (xfer_count[31] || xfer_count == 32'd0) begin
			nextstate = S_IDLE;
		end
		else if (!f2s_fifo_full) begin
			shift_en = 1'b1; // pload overrides shift
			
			if (n_xfer_cycles == cur_port_xfer_cycles || cur_port_xfer_cycles == 4'd0) begin
				passthru = 1'b1;
				if (f2s_ready) begin
					f2s_want = 1'b1;
					f2s_fifo_wrreq = 1'b1;
					n_xfer_cycles_dec = 1'b1;
					xfer_count_dec = 1'b1;
					pload = 1'b1;
					if (n_xfer_cycles == 4'd0) begin
						n_xfer_cycles_load = 1'b1;
					end
				end
			end
			else begin
				f2s_fifo_wrreq = 1'b1;
				n_xfer_cycles_dec = 1'b1;
				xfer_count_dec = 1'b1;
				if (n_xfer_cycles == 4'd0) begin
					n_xfer_cycles_load = 1'b1;
				end
			end
		end
	end
	
	default: begin
	end

	endcase
end


// Autogenerated connections to user signals

sys_to_fpga # (.WIDTH(64)) command_data_inst (.clk(clk), .shift_en(shift_en), .sel(sel[0]), .mux_data(s2f_data), .user_data(command_data));
sys_to_fpga # (.WIDTH(64)) feature_data_inst (.clk(clk), .shift_en(shift_en), .sel(sel[1]), .mux_data(s2f_data), .user_data(feature_data));
sys_to_fpga # (.WIDTH(64)) cascade_data_inst (.clk(clk), .shift_en(shift_en), .sel(sel[2]), .mux_data(s2f_data), .user_data(cascade_data));
sys_to_fpga # (.WIDTH(32)) image_data_inst (.clk(clk), .shift_en(shift_en), .sel(sel[3]), .mux_data(s2f_data), .user_data(image_data));
fpga_to_sys # (.WIDTH(32)) result_data_inst (.clk(clk), .shift_en(shift_en), .sel(sel[4]),.passthru(passthru), .pload(pload), .mux_data(f2s_datas[159:128]), .user_data(result_data));
fpga_to_sys # (.WIDTH(64)) stats_data_inst (.clk(clk), .shift_en(shift_en), .sel(sel[5]),.passthru(passthru), .pload(pload), .mux_data(f2s_datas[191:160]), .user_data(stats_data));


assign command_ready = s2f_ready & sel[0];
assign s2f_wants[0] = command_wanted;
assign feature_ready = s2f_ready & sel[1];
assign s2f_wants[1] = feature_wanted;
assign cascade_ready = s2f_ready & sel[2];
assign s2f_wants[2] = cascade_wanted;
assign image_ready = s2f_ready & sel[3];
assign s2f_wants[3] = image_wanted;
assign result_ready_to_accept = f2s_want & sel[4];
assign f2s_readies[4] = result_ready_to_return;
assign stats_ready_to_accept = f2s_want & sel[5];
assign f2s_readies[5] = stats_ready_to_return;



endmodule



	

	


