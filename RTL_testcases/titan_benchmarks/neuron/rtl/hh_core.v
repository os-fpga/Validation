///////////////////////////////////////////////////////////////////////////////
//
// Filename:      hh_core.v
// Date Created:  Apr. 2012
// Last Modified: Apr. 2012
//
// Devices:   Stratix-4  FPGA
// Purpose:   Hodgkin Huxley Neuron Model Wrapper
// Contact:   Daniel Di Matteo
//
// Description:  wrapper around HH module for use as a Qsys component
//
//
///////////////////////////////////////////////////////////////////////////////


module hh_core (
	// clocks and reset
	input 					clk,
	input 					reset,
	// Avalon-ST sink (recieve input from FIFO)
	input			[31:0]	i_data,
	output					o_ready,
	input						i_valid,
	// Avalon-ST source (write output to FIFO)
	output		[31:0]	o_data,
	input						i_ready,
	output					o_valid,
	// Avalon-MM slave (receive control from host)
	input			[1:0]		i_address,
	input			[31:0]	i_writedata,
	input						i_write,
	input						i_read,
	output reg				o_waitrequest,
	output reg	[31:0]	o_readdata
);
localparam		CTRL_ADDR = 2'h0;
localparam		CYCLES_LO_ADDR = 2'h1;
localparam 		CYCLES_HI_ADDR = 2'h2;

reg 	[31:0]	cycles_hi;
reg	[31:0]	cycles_lo;	
reg	[15:0]	steps_remaining;
reg				computing;
reg				clear_cycles;
reg				start;
reg				done;
wire				hh_valid;
wire				hh_ready;


always @ (posedge clk or posedge reset) begin
	if (reset) begin
		{cycles_hi, cycles_lo} <= 64'b0;
	end
	else begin
		if (clear_cycles) begin
			{cycles_hi, cycles_lo} <= 64'b0;
		end
		else if (computing && !done) begin
			{cycles_hi, cycles_lo} <= {cycles_hi, cycles_lo} + 1;
		end
	end
end


always @ (*) begin
	start = 1'b0;
	clear_cycles = 1'b0;
	o_waitrequest = 1'b0;
	o_readdata = 32'bx;

	case (i_address)
		CTRL_ADDR: begin
			if (i_write) begin
				start = 1'b1;
				clear_cycles = 1'b1;
			end
			if (i_read) begin
				o_waitrequest = !done;
			end
		end
		
		CYCLES_LO_ADDR: begin
			o_readdata = cycles_lo;
		end
		
		CYCLES_HI_ADDR: begin
			o_readdata = cycles_hi;
		end
	
		default: begin
		end
	endcase
end


// keep track of how much computation remains
always @ (posedge clk or posedge reset) begin
	if (reset) begin
		steps_remaining <= 16'b0;
		done <= 1'b0;
		computing <= 1'b0;
	end
	else begin
		if (start) begin
			computing <= 1'b1;
			steps_remaining <= i_writedata[31:16];
		end
		else if (o_valid && computing) begin
			if (steps_remaining == 16'b1) begin
				steps_remaining <= 16'b0;
				done <= 1'b1;
				computing <= 1'b0;
			end
			else begin 
				steps_remaining <= steps_remaining - 16'b1;
			end
		end
	end
end


hodgkin_huxley hh_inst (
	// Clocks and Resets
	.i_clk(clk),
	.i_rst(reset),
	// Input Valid
	.i_s(i_data),
	.i_valid(hh_valid),
	// Model Output
	.o_V(o_data),
	.o_valid(o_valid),
	.o_rdy(hh_ready)
);

assign o_ready 	= computing && hh_ready;
assign hh_valid	= i_valid;


endmodule
