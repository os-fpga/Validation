//***********************************************************
// Functionality: Input is delayed according to controls then 
//                inverted and sent out through output buffer
// Author:        Azfar  
//***********************************************************

module GJC47 #(
    parameter DELAY         = 5,
    parameter NUM_GB_SITES  = 20,
    parameter DLY_LOC       = 20'b11110000000000000000, // The LSB of this number correspond to GBox IO[0] and MSB correspond to GBox IO[19]. Each 1/2 bank is addressed separately
    parameter ADDR_WIDTH    = 5,
    parameter DLY_TAP_WIDTH = 6,
    parameter NUM_DLY       = 4,		// The NUM_DLY will be divided equally between I_DELAY (6) and O_DELAY (6)
    parameter DLY_SEL_WIDTH = $clog2(NUM_DLY)
)
(
    input wire                      clk_i_buf,
	input wire                      reset,
	input wire [DLY_SEL_WIDTH-1:0]  sel_dly,
    input wire [(NUM_DLY/2)-1:0]    din_idly,
    input wire [(NUM_DLY/2)-1:0]    din_odly,	
	input wire [DLY_TAP_WIDTH-1:0]    g2f_trx_dly_tap,
    input wire                      dly_incdec_buf,
    input wire                      dly_ld_buf,
    input wire                      dly_adj_buf,
	input wire [NUM_DLY-1:0]        usr_rd_dly_value,
    //============================================================================================================
    // These ports are added on the top level so synthesis will not optimize them
    // These ports should only be present in the fabric netlist and needs to be removed from the Gearbox netlist
	// input wire [(DLY_TAP_WIDTH)-1:0] g2f_rx_dly_tap,   // This port needs to be edited out from GearBox netlist. This is an input to fabric netlist from GBox fixed output.
    // output wire                      f2g_trx_dly_inc,                      // This port needs to be edited out from GearBox netlist. This is a fixed input to GBox and output from fabric netlist.
	// output wire                      f2g_trx_dly_ld,                        // This port needs to be edited out from GearBox netlist. This is a fixed input to GBox and output from fabric netlist.
	// output wire                      f2g_trx_dly_adj,                       // This port needs to be edited out from GearBox netlist. This is a fixed input to GBox and output from fabric netlist.
	// output reg [ADDR_WIDTH-1:0]     f2g_dly_addr,         // This port needs to be edited out from GearBox netlist. This is a fixed input to GBox and output from fabric netlist.
	//=============================================================================================================
    output wire [NUM_DLY-1:0]       data_delayed_buf,
    output wire [DLY_TAP_WIDTH-1:0] dly_tap_val_inv_buf
);

    wire enable;
    wire clk_buf_i;
    wire clk_i;
    wire dly_incdec;
    wire dly_ld;
    wire dly_adj;
    wire const1;

    wire [(NUM_DLY/2)-1:0]  din_idly_buf;
    wire [(NUM_DLY/2)-1:0] 	din_odly_buf;	
	wire [(NUM_DLY/2)-1:0] 	dout_idly;
	wire [(NUM_DLY/2)-1:0] 	dout_odly;
    wire [(DLY_TAP_WIDTH*NUM_DLY)-1:0] 	usr_dly_tap_value_out;
    reg  [(DLY_TAP_WIDTH-1):0] 			dly_tap_val;
	wire [(DLY_TAP_WIDTH*20)-1:0] 	dly_tap_value;
	
    //reg [NUM_DLY-1:0] 		usr_dly_incdec_inv;
    //reg [NUM_DLY-1:0] 		usr_dly_adj_inv;
    //reg [NUM_DLY-1:0] 		usr_dly_ld_inv;
    
    reg [NUM_DLY-1:0] 		usr_dly_incdec_in;
    reg [NUM_DLY-1:0] 		usr_dly_adj_in;
    reg [NUM_DLY-1:0] 		usr_dly_ld_in;

	wire f2g_trx_dly_inc;
	wire f2g_trx_dly_ld;
	wire f2g_trx_dly_adj;
	reg [ADDR_WIDTH-1:0] 	 f2g_dly_addr;
	wire [DLY_TAP_WIDTH-1:0] g2f_rx_dly_tap;
	
	wire reset_buf;wire [DLY_SEL_WIDTH-1:0]  sel_dly_buf; wire [DLY_TAP_WIDTH-1:0]    g2f_trx_dly_tap_buf;
	genvar ii;
	generate
		for (ii =0; ii < DLY_SEL_WIDTH; ii = ii + 1) begin
			I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf2_sel_dly (sel_dly[ii],const1,sel_dly_buf[ii]);
		end
	endgenerate
	genvar iii;
	generate
		for (iii =0; iii < DLY_TAP_WIDTH; iii = iii + 1) begin
			I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf3_g2f_trx_dly_tap (g2f_trx_dly_tap[iii],const1,g2f_trx_dly_tap_buf[iii]);
		end
	endgenerate

	wire [NUM_DLY-1:0]        usr_rd_dly_value_buf;
	genvar iv;
	generate
		for (iv =0; iv < NUM_DLY; iv = iv + 1) begin
			I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf3_usr_rd_dly_value (usr_rd_dly_value[iv],const1,usr_rd_dly_value_buf[iv]);
		end
	endgenerate
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf0_ (clk_i_buf,const1,clk_i);
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf1_idly_incdec (dly_incdec_buf,const1,dly_incdec);
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf2_idly_ld (dly_ld_buf,const1,dly_ld);
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf3_ldly_adj (dly_adj_buf,const1,dly_adj);
	I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf3_reset (reset,const1,reset_buf);

    O_BUF obuf0_ (dly_tap_val[0], dly_tap_val_inv_buf[0]);
    O_BUF obuf1_ (dly_tap_val[1], dly_tap_val_inv_buf[1]);
    O_BUF obuf2_ (dly_tap_val[2], dly_tap_val_inv_buf[2]);
    O_BUF obuf3_ (dly_tap_val[3], dly_tap_val_inv_buf[3]);
    O_BUF obuf4_ (dly_tap_val[4], dly_tap_val_inv_buf[4]);
    O_BUF obuf5_ (dly_tap_val[5], dly_tap_val_inv_buf[5]);
	
    assign const1 = 1;
    assign enable = const1;

    CLK_BUF clock_buffer (clk_i,clk_buf_i);
	
	// Hardware Multiplexer for DLY_TAP_VALUE
	muxp #(
		.DWIDTH(DLY_TAP_WIDTH),
        .NUM_OF_BUS(NUM_DLY)
		)
    muxp_inst1(
		.d(slice),		// input [DWIDTH*NUM_OF_BUS-1:0] d,
		.sel(1 << f2g_dly_addr_reg2),		// input [NUM_OF_BUS-1:0] sel,
		.dout(g2f_rx_dly_tap)	// output reg [DWIDTH-1:0] dout
		);
	
	// Hardware Decider for DLY Control	
	wire usr_dly_incdec_out, usr_dly_ld_out, usr_dly_adj_out;
	wire [19:0] f2g_trx_dly_inc_out, f2g_trx_dly_ld_out, f2g_trx_dly_adj_out;
	one2x_decoder #(
		.DWIDTH(1),
		.NUM_OF_OBUS(NUM_DLY)
		)
    one2x_decoder_inst1 (
		.din ({f2g_trx_dly_inc}),	// input [DWIDTH-1:0] din,    // Input Output Replaced with each other
		.sel (1 << f2g_dly_addr),	// input [NUM_OF_OBUS-1:0] sel,      
		.dout (f2g_trx_dly_inc_out)	// output reg [(DWIDTH*NUM_OF_OBUS)-1:0] dout
		);


one2x_decoder #(
		.DWIDTH(1),
		.NUM_OF_OBUS(NUM_DLY)
		)
    one2x_decoder_inst12 (
		.din ({ f2g_trx_dly_ld}),	// input [DWIDTH-1:0] din,    // Input Output Replaced with each other
		.sel (1 << f2g_dly_addr),	// input [NUM_OF_OBUS-1:0] sel,      
		.dout (f2g_trx_dly_ld_out)	// output reg [(DWIDTH*NUM_OF_OBUS)-1:0] dout
		);

		one2x_decoder #(
		.DWIDTH(1),
		.NUM_OF_OBUS(NUM_DLY)
		)
    one2x_decoder_inst13 (
		.din ({f2g_trx_dly_adj}),	// input [DWIDTH-1:0] din,    // Input Output Replaced with each other
		.sel (1 << f2g_dly_addr),	// input [NUM_OF_OBUS-1:0] sel,      
		.dout (f2g_trx_dly_adj_out)	// output reg [(DWIDTH*NUM_OF_OBUS)-1:0] dout
		);
	wire [3:0] twnt_to_fr_adj, twnt_to_fr_inc, twnt_to_fr_ld;

	one_hot_to_output onehot1(
		.in(f2g_trx_dly_inc_out),
		.out(twnt_to_fr_inc),
		.clk(clk_buf_i),
		.reset(reset_buf),
		.sel_dly(sel_dly_buf)
	);

	one_hot_to_output onehot2(
		.in(f2g_trx_dly_adj_out),
		.out(twnt_to_fr_adj),
		.clk(clk_buf_i),
		.reset(reset_buf),
		.sel_dly(sel_dly_buf)
	);

	one_hot_to_output onehot3(
		.in(f2g_trx_dly_ld_out),
		.out(twnt_to_fr_ld),
		.clk(clk_buf_i),
		.reset(reset_buf),
		.sel_dly(sel_dly_buf)
	);

	// integer j;
	// function [2:0] dly_control_bus (
	// 	input [NUM_DLY-1:0] dly_incdec_in,
	// 	input [NUM_DLY-1:0] dly_ld_in,
	// 	input [NUM_DLY-1:0] dly_adj_in);
	// begin	
	// 	for (j=0; j<NUM_DLY; j = j+1) begin
	// 		dly_control_bus[j] = {dly_incdec_in[j], dly_ld_in[j], dly_adj_in[j]};
	// 	end // for
	// end // function
	// endfunction
	
	//assign usr_dly_incdec = {
	wire [ADDR_WIDTH-1:0] f2g_dly_addr_wire;

	always @(sel_dly_buf) begin
        f2g_dly_addr <= f2g_dly_addr_wire; 
    end


	DLY_ADDR_CNTRL #(
		.NUM_GB_SITES 	(NUM_GB_SITES),
        .DLY_LOC   		(DLY_LOC),
        .NUM_DLY   		(NUM_DLY),   //Minimum of 1 and maximum of 20 I_DELAY or O_DELAY 
        .ADDR_WIDTH 	(ADDR_WIDTH),
        .DLY_TAP_WIDTH  (DLY_TAP_WIDTH)
        )
    DLY_ADDR_CNTRL_INST (
		.rst					(reset_buf),
        .cntrl_dly_tap_value 	(g2f_rx_dly_tap),
        .usr_dly_incdec 		(usr_dly_incdec_in),
	    .usr_dly_ld 			(usr_dly_ld_in),
	    .usr_dly_adj 			(usr_dly_adj_in),
	    .usr_rd_dly_value 		(usr_rd_dly_value_buf),
	    .f2g_dly_addr			(f2g_dly_addr_wire),
        .cntrl_dly_incdec 		(f2g_trx_dly_inc),
        .cntrl_dly_ld 			(f2g_trx_dly_ld),
        .cntrl_dly_adj 			(f2g_trx_dly_adj),
        .usr_dly_tap_value_out	(usr_dly_tap_value_out)                                     
        );

 //assign dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
 generate
    if (NUM_DLY == 2) begin   
	   always @(*) begin
	       case (sel_dly_buf)
			   0:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   1:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   default : dly_tap_val = usr_dly_tap_value_out[DLY_TAP_WIDTH-1:0];
		   endcase
	    end     // always
    end else if (NUM_DLY == 4) begin   
	   always @(*) begin    
	       case (sel_dly_buf)
			   0:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   1:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   2:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   3:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   default : dly_tap_val = usr_dly_tap_value_out[DLY_TAP_WIDTH-1:0];
		   endcase
	    end     // always    
    end else if (NUM_DLY == 6) begin   
	   always @(*) begin    
	       case (sel_dly_buf)
			   0:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   1:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   2:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   3:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   4:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   5:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   default : dly_tap_val = usr_dly_tap_value_out[DLY_TAP_WIDTH-1:0];
		   endcase
	    end     // always    
    end else if (NUM_DLY == 8) begin   
	   always @(*) begin    
	       case (sel_dly_buf)
			   0:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   1:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   2:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   3:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   4:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   5:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   6:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   7:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];		
			   default : dly_tap_val = usr_dly_tap_value_out[DLY_TAP_WIDTH-1:0];
		   endcase
	    end     // always   
    end else if (NUM_DLY == 10) begin   
	   always @(*) begin    
	       case (sel_dly_buf)
			   0:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   1:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   2:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   3:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   4:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   5:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   6:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   7:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];		
			   8:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   9:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   default : dly_tap_val = usr_dly_tap_value_out[DLY_TAP_WIDTH-1:0];
		   endcase
	    end     // always   
    end else if (NUM_DLY == 12) begin   
	   always @(*) begin    
	       case (sel_dly_buf)
			   0:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   1:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   2:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   3:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   4:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   5:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   6:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   7:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];		
			   8:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   9:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   10:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   11:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];			   
			   default : dly_tap_val = usr_dly_tap_value_out[DLY_TAP_WIDTH-1:0];
		   endcase
	    end     // always   	 
    end else if (NUM_DLY == 14) begin   
	   always @(*) begin    
	       case (sel_dly_buf)
			   0:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   1:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   2:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   3:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   4:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   5:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   6:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   7:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];		
			   8:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   9:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   10:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   11:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   12:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   13:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];				   		   
			   default : dly_tap_val = usr_dly_tap_value_out[DLY_TAP_WIDTH-1:0];
		   endcase
	    end     // always   	   
    end else if (NUM_DLY == 16) begin   
	   always @(*) begin    
	       case (sel_dly_buf)
			   0:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   1:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   2:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   3:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   4:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   5:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   6:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   7:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];		
			   8:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   9:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   10:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   11:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   12:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   13:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   14:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   15:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];				   		   
			   default : dly_tap_val = usr_dly_tap_value_out[DLY_TAP_WIDTH-1:0];
		   endcase
	    end     // always   		   
    end else if (NUM_DLY == 18) begin   
	   always @(*) begin    
	       case (sel_dly_buf)
			   0:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   1:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   2:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   3:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   4:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   5:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   6:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   7:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];		
			   8:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   9:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   10:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   11:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   12:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   13:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   14:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   15:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   16:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   17:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];				   			   		   
			   default : dly_tap_val = usr_dly_tap_value_out[DLY_TAP_WIDTH-1:0];
		   endcase
	    end     // always   	  	 
    end else   
	   always @(*) begin    
	       case (sel_dly_buf)
			   0:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   1:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   2:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   3:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   4:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   5:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   6:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   7:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];		
			   8:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   9:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   10:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   11:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   12:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   13:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   14:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   15:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   16:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   17:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];		
			   18:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   19:	dly_tap_val = usr_dly_tap_value_out[sel_dly_buf*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];				   		   			   		   
			   default : dly_tap_val = usr_dly_tap_value_out[DLY_TAP_WIDTH-1:0];
		   endcase
	    end     // always   	      
 endgenerate
 
 /*
	always @(*) begin
        dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
    end
*/	
	always @(*) begin
		usr_dly_incdec_in 			= 'h0;
		usr_dly_adj_in 				= 'h0;
		usr_dly_ld_in 				= 'h0;
		usr_dly_incdec_in[sel_dly_buf] 	= dly_incdec;
		usr_dly_adj_in [sel_dly_buf]   	= dly_adj;
		usr_dly_ld_in[sel_dly_buf]     	= dly_ld;
	end


    genvar i;
    generate
        for (i = 0; i < NUM_DLY/2; i = i + 1) begin
			I_BUF idly_idata_ibuf (din_idly[i],enable,din_idly_buf[i]);
			
            I_DELAY #(
                .DELAY(DELAY)
            )
            data_i_delay (  
                .I(din_idly_buf[i]),
                .DLY_LOAD(twnt_to_fr_ld[i*2]),
                .DLY_ADJ(twnt_to_fr_adj[i*2]),
                .DLY_INCDEC(twnt_to_fr_inc[i*2]),
                .DLY_TAP_VALUE(dly_tap_value[((DLY_TAP_WIDTH-1)+(i*2*DLY_TAP_WIDTH)):(i*2*DLY_TAP_WIDTH)]), 
                .CLK_IN(clk_buf_i),
                .O(dout_idly[i])
                );
			O_BUF idly_odata_obuf (dout_idly[i],data_delayed_buf[i*2]);       

			I_BUF odly_idata_ibuf (din_odly[i],enable,din_odly_buf[i]);
		
            O_DELAY #(
                .DELAY(DELAY)
            )
            data_o_delay (
                .I(din_odly_buf[i]),
                .DLY_LOAD(twnt_to_fr_ld[(i*2)+1]),
                .DLY_ADJ(twnt_to_fr_adj[(i*2)+1]),
                .DLY_INCDEC(twnt_to_fr_inc[(i*2)+1]),
                .DLY_TAP_VALUE(dly_tap_value[((DLY_TAP_WIDTH*2-1)+(i*2*DLY_TAP_WIDTH)):(i*2*DLY_TAP_WIDTH)+(DLY_TAP_WIDTH)]),
                .CLK_IN(clk_buf_i),
                .O(dout_odly[i])
            );
			O_BUF odly_odata_obuf (dout_odly[i],data_delayed_buf[(i*2)+1]);
			
        end
    endgenerate

wire [(DLY_TAP_WIDTH*20)-1:0] slice;
slice_assignment_with_addr #(
	.WIDTH(6)
) slice_assign (
	.old_wire(dly_tap_value),
	.sel_dly(sel_dly_reg3),
	.new_wire(slice),
	.addr(f2g_dly_addr_reg2)
);

reg [DLY_SEL_WIDTH-1:0]  sel_dly_reg1, sel_dly_reg2, sel_dly_reg3;
reg  [ADDR_WIDTH-1:0] f2g_dly_addr_reg1, f2g_dly_addr_reg2;
always @(posedge clk_buf_i) begin
	sel_dly_reg1 <= sel_dly_buf;
	sel_dly_reg2 <= sel_dly_reg1;
	sel_dly_reg3 <= sel_dly_reg2;
	f2g_dly_addr_reg1 <= f2g_dly_addr;
	f2g_dly_addr_reg2 <= f2g_dly_addr_reg1;
end

endmodule



module one_hot_to_output #(
    parameter WIDTH = 20,            // Width of the input one-hot vector
    parameter OUTPUT_WIDTH = 4       // Width of the output
)(
    input wire [WIDTH-1:0] in,       // One-hot input
    input wire [OUTPUT_WIDTH-1:0] sel_dly,  // Select which output bit to turn on
    input wire clk,
    input wire reset,
    output reg [OUTPUT_WIDTH-1:0] out
);

    reg [WIDTH-1:0] last_in;          // To store the last input value
    reg [OUTPUT_WIDTH-1:0] next_out;  // Temporary output register
	integer i;
    always @(posedge clk) begin
        if (reset) begin
            out <= 0;
            last_in <= 0;
        end else begin
            if (in != last_in) begin
                // Detect new '1' in input
                
                for (i = 0; i < WIDTH; i = i + 1) begin
                    if (in[i] && !last_in[i]) begin
                        // If a new '1' appears, turn on the bit specified by sel_dly
                        next_out = (1 << sel_dly);
                        // Update the output if there is still a '1' in the input
                        if (|in) begin
                            out <= next_out;
                        end else begin
                            out <= 0;
                        end
                        break;
                    end
                end
                // If the input is all zeros, turn off the output
                if (~|in) begin
                    out <= 0;
                end
                // Update the last input value
                last_in <= in;
            end else begin
                // If no change in input, retain the previous output
                if (|in) begin
                    out <= out;
                end else begin
                    out <= 0;
                end
            end
        end
    end
endmodule


module slice_assignment_with_addr#(
    parameter WIDTH = 6
	)
	(
    input [119:0] old_wire,   // 120-bit wide old_wire
    input [4:0] sel_dly,      // 5-bit sel_dly (value between 0 and 19)
    input [4:0] addr,         // 5-bit address to determine where to place in new_wire
    output reg [119:0] new_wire // 120-bit wide new_wire to assign the value to
);

// Combined selection and assignment logic in one always block
always @(*) begin
    new_wire = 120'b0; // Initialize new_wire to all 0s

    case(addr)
        5'd0:  new_wire[5:0]    = old_wire[(sel_dly*WIDTH) +: WIDTH];  // Assign selected slice to bits 5:0
        5'd1:  new_wire[11:6]   = old_wire[(sel_dly*WIDTH) +: WIDTH];  // Assign selected slice to bits 11:6
        5'd2:  new_wire[17:12]  = old_wire[(sel_dly*WIDTH) +: WIDTH];  // Assign selected slice to bits 17:12
        5'd3:  new_wire[23:18]  = old_wire[(sel_dly*WIDTH) +: WIDTH];  // Assign selected slice to bits 23:18
        5'd4:  new_wire[29:24]  = old_wire[(sel_dly*WIDTH) +: WIDTH];  // Assign selected slice to bits 29:24
        5'd5:  new_wire[35:30]  = old_wire[(sel_dly*WIDTH) +: WIDTH];  // Assign selected slice to bits 35:30
        5'd6:  new_wire[41:36]  = old_wire[(sel_dly*WIDTH) +: WIDTH];  // Assign selected slice to bits 41:36
        5'd7:  new_wire[47:42]  = old_wire[(sel_dly*WIDTH) +: WIDTH];  // Assign selected slice to bits 47:42
        5'd8:  new_wire[53:48]  = old_wire[(sel_dly*WIDTH) +: WIDTH];  // Assign selected slice to bits 53:48
        5'd9:  new_wire[59:54]  = old_wire[(sel_dly*WIDTH) +: WIDTH];  // Assign selected slice to bits 59:54
        5'd10: new_wire[65:60]  = old_wire[(sel_dly*WIDTH) +: WIDTH];  // Assign selected slice to bits 65:60
        5'd11: new_wire[71:66]  = old_wire[(sel_dly*WIDTH) +: WIDTH];  // Assign selected slice to bits 71:66
        5'd12: new_wire[77:72]  = old_wire[(sel_dly*WIDTH) +: WIDTH];  // Assign selected slice to bits 77:72
        5'd13: new_wire[83:78]  = old_wire[(sel_dly*WIDTH) +: WIDTH];  // Assign selected slice to bits 83:78
        5'd14: new_wire[89:84]  = old_wire[(sel_dly*WIDTH) +: WIDTH];  // Assign selected slice to bits 89:84
        5'd15: new_wire[95:90]  = old_wire[(sel_dly*WIDTH) +: WIDTH];  // Assign selected slice to bits 95:90
        5'd16: new_wire[101:96] = old_wire[(sel_dly*WIDTH) +: WIDTH];  // Assign selected slice to bits 101:96
        5'd17: new_wire[107:102]= old_wire[(sel_dly*WIDTH) +: WIDTH];  // Assign selected slice to bits 107:102
        5'd18: new_wire[113:108]= old_wire[(sel_dly*WIDTH) +: WIDTH];  // Assign selected slice to bits 113:108
        5'd19: new_wire[119:114]= old_wire[(sel_dly*WIDTH) +: WIDTH];  // Assign selected slice to bits 119:114
        default: new_wire = 120'b0;                            // Default case
    endcase
end

endmodule
