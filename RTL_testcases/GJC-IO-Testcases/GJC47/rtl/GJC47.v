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
	wire [(DLY_TAP_WIDTH*20)-1:0] 	dly_tap_value_2;
	
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
	wire [(ADDR_WIDTH*20)-1:0]  dly_site_addr_bus;
	
	wire reset_buf;wire [DLY_SEL_WIDTH-1:0]  sel_dly_buf; wire [DLY_TAP_WIDTH-1:0]    g2f_trx_dly_tap_buf;
	genvar ii;
	generate
		for (ii =0; ii < DLY_SEL_WIDTH; ii = ii + 1) begin
			I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf2_sel_dly (.I(sel_dly[ii]),.EN(1'b1),.O(sel_dly_buf[ii]));
		end
	endgenerate
	genvar iii;
	generate
		for (iii =0; iii < DLY_TAP_WIDTH; iii = iii + 1) begin
			I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf3_g2f_trx_dly_tap (.I(g2f_trx_dly_tap[iii]),.EN(1'b1),.O(g2f_trx_dly_tap_buf[iii]));
		end
	endgenerate

	wire [NUM_DLY-1:0]        usr_rd_dly_value_buf;
	genvar iv;
	generate
		for (iv =0; iv < NUM_DLY; iv = iv + 1) begin
			I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf3_usr_rd_dly_value (.I(usr_rd_dly_value[iv]),.EN(1'b1),.O(usr_rd_dly_value_buf[iv]));
		end
	endgenerate
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf0_ (.I(clk_i_buf),.EN(1'b1),.O(clk_i));
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf1_idly_incdec (.I(dly_incdec_buf),.EN(1'b1),.O(dly_incdec));
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf2_idly_ld (.I(dly_ld_buf),.EN(1'b1),.O(dly_ld));
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf3_ldly_adj (.I(dly_adj_buf),.EN(1'b1),.O(dly_adj));
	I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf3_reset (.I(reset),.EN(1'b1),.O(reset_buf));
	genvar v;
	generate
		for (v = 0; v < DLY_TAP_WIDTH; v = v + 1) begin
			O_BUF obuf0_ (.I(dly_tap_val[v]), .O(dly_tap_val_inv_buf[v]));
		end
	endgenerate
	
    assign const1 = 1;
    assign enable = const1;

    CLK_BUF clock_buffer (.I(clk_i),.O(clk_buf_i));

	DLY_VALUE_MUX muxp_inst1 (
		.DLY_ADDR(f2g_dly_addr),
		.DLY_TAP_VALUE(g2f_rx_dly_tap),
		.DLY_TAP0_VAL(dly_tap_value[5:0]),
		.DLY_TAP1_VAL(dly_tap_value[11:6]),
		.DLY_TAP2_VAL(dly_tap_value[17:12]),
		.DLY_TAP3_VAL(dly_tap_value[23:18]),
		.DLY_TAP4_VAL(dly_tap_value[29:24]),
		.DLY_TAP5_VAL(dly_tap_value[35:30]),
		.DLY_TAP6_VAL(dly_tap_value[41:36]),
		.DLY_TAP7_VAL(dly_tap_value[47:42]),
		.DLY_TAP8_VAL(dly_tap_value[53:48]),
		.DLY_TAP9_VAL(dly_tap_value[59:54]),
		.DLY_TAP10_VAL(dly_tap_value[65:60]),
		.DLY_TAP11_VAL(dly_tap_value[71:66]),
		.DLY_TAP12_VAL(dly_tap_value[77:72]),
		.DLY_TAP13_VAL(dly_tap_value[83:78]),
		.DLY_TAP14_VAL(dly_tap_value[89:84]),
		.DLY_TAP15_VAL(dly_tap_value[95:90]),
		.DLY_TAP16_VAL(dly_tap_value[101:96]),
		.DLY_TAP17_VAL(dly_tap_value[107:102]),
		.DLY_TAP18_VAL(dly_tap_value[113:108]),
		.DLY_TAP19_VAL(dly_tap_value[119:114])
	);
	
	// Hardware Decider for DLY Control	
	wire usr_dly_incdec_out, usr_dly_ld_out, usr_dly_adj_out;
	wire [19:0] f2g_trx_dly_inc_out, f2g_trx_dly_ld_out, f2g_trx_dly_adj_out;

	DLY_SEL_DECODER inst1 (
		.DLY_ADDR(f2g_dly_addr),
		.DLY_LOAD(f2g_trx_dly_ld),
		.DLY_ADJ(f2g_trx_dly_adj),
		.DLY_INCDEC(f2g_trx_dly_inc),
		.DLY0_CNTRL({f2g_trx_dly_ld_out[0], f2g_trx_dly_adj_out[0], f2g_trx_dly_inc_out[0]}),
		.DLY1_CNTRL({f2g_trx_dly_ld_out[1], f2g_trx_dly_adj_out[1], f2g_trx_dly_inc_out[1]}),
		.DLY2_CNTRL({f2g_trx_dly_ld_out[2], f2g_trx_dly_adj_out[2], f2g_trx_dly_inc_out[2]}),
		.DLY3_CNTRL({f2g_trx_dly_ld_out[3], f2g_trx_dly_adj_out[3], f2g_trx_dly_inc_out[3]}),
		.DLY4_CNTRL({f2g_trx_dly_ld_out[4], f2g_trx_dly_adj_out[4], f2g_trx_dly_inc_out[4]}),
		.DLY5_CNTRL({f2g_trx_dly_ld_out[5], f2g_trx_dly_adj_out[5], f2g_trx_dly_inc_out[5]}),
		.DLY6_CNTRL({f2g_trx_dly_ld_out[6], f2g_trx_dly_adj_out[6], f2g_trx_dly_inc_out[6]}),
		.DLY7_CNTRL({f2g_trx_dly_ld_out[7], f2g_trx_dly_adj_out[7], f2g_trx_dly_inc_out[7]}),
		.DLY8_CNTRL({f2g_trx_dly_ld_out[8], f2g_trx_dly_adj_out[8], f2g_trx_dly_inc_out[8]}),
		.DLY9_CNTRL({f2g_trx_dly_ld_out[9], f2g_trx_dly_adj_out[9], f2g_trx_dly_inc_out[9]}),
		.DLY10_CNTRL({f2g_trx_dly_ld_out[10], f2g_trx_dly_adj_out[10], f2g_trx_dly_inc_out[10]}),
		.DLY11_CNTRL({f2g_trx_dly_ld_out[11], f2g_trx_dly_adj_out[11], f2g_trx_dly_inc_out[11]}),
		.DLY12_CNTRL({f2g_trx_dly_ld_out[12], f2g_trx_dly_adj_out[12], f2g_trx_dly_inc_out[12]}),
		.DLY13_CNTRL({f2g_trx_dly_ld_out[13], f2g_trx_dly_adj_out[13], f2g_trx_dly_inc_out[13]}),
		.DLY14_CNTRL({f2g_trx_dly_ld_out[14], f2g_trx_dly_adj_out[14], f2g_trx_dly_inc_out[14]}),
		.DLY15_CNTRL({f2g_trx_dly_ld_out[15], f2g_trx_dly_adj_out[15], f2g_trx_dly_inc_out[15]}),
		.DLY16_CNTRL({f2g_trx_dly_ld_out[16], f2g_trx_dly_adj_out[16], f2g_trx_dly_inc_out[16]}),
		.DLY17_CNTRL({f2g_trx_dly_ld_out[17], f2g_trx_dly_adj_out[17], f2g_trx_dly_inc_out[17]}),
		.DLY18_CNTRL({f2g_trx_dly_ld_out[18], f2g_trx_dly_adj_out[18], f2g_trx_dly_inc_out[18]}),
		.DLY19_CNTRL({f2g_trx_dly_ld_out[19], f2g_trx_dly_adj_out[19], f2g_trx_dly_inc_out[19]})
	);
	
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

	integer ACT_IDLY_CNT;
	integer active_idelay_cnt;
	reg [NUM_DLY:0]                  delay_location_index [NUM_GB_SITES-1:0];
	reg [ADDR_WIDTH-1:0]             dly_site_addr [NUM_DLY-1:0];
	function integer act_dly_cnt (input [NUM_GB_SITES-1:0] valid_sites);
    integer i;
    begin
        act_dly_cnt = 0;
        active_idelay_cnt = 0;
        for (i = 0 ; i<NUM_GB_SITES ; i=i+1)
        begin
             delay_location_index[i] = NUM_DLY;
            if (DLY_LOC[i] == 1'b1) begin
                dly_site_addr[act_dly_cnt] = i;
                active_idelay_cnt = active_idelay_cnt + 1;
                delay_location_index[i] = act_dly_cnt;
                `ifdef SIM
                // $display("time=%t, act_dly_cnt=%0d, active_idelay_cnt=%d, delay_location_index[0x%h]=0x%h, dly_site_addr[%0d]=0x%h", $time, act_dly_cnt, active_idelay_cnt, i, delay_location_index[i], act_dly_cnt, dly_site_addr[act_dly_cnt]);
                `endif
                act_dly_cnt = act_dly_cnt+1;  // order is important for counting
            end
        end   // for loop
    end // function
    endfunction

	always @(reset_buf or usr_dly_ld_in)
    if (!reset_buf) begin
        ACT_IDLY_CNT <= act_dly_cnt(NUM_GB_SITES);
    end else begin
        ACT_IDLY_CNT <= 'h0;  // or some default value
    end

	generate
	for (genvar i=0; i<NUM_DLY; i=i+1) begin : GEN_ADDR_CONCAT   
	     assign dly_site_addr_bus[((ADDR_WIDTH*(i+1))-1):ADDR_WIDTH*i] = dly_site_addr[i]; 
	end
	endgenerate

    genvar i;
    generate
        for (i = 0; i < NUM_DLY/2; i = i + 1) begin
			
			I_BUF idly_idata_ibuf (.I(din_idly[i]),.EN(enable),.O(din_idly_buf[i]));
            
			O_BUF idly_odata_obuf (.I(dout_idly[i]),.O(data_delayed_buf[i*2]));       

			I_BUF odly_idata_ibuf (.I(din_odly[i]),.EN(enable),.O(din_odly_buf[i]));
            
			O_BUF odly_odata_obuf (.I(dout_odly[i]),.O(data_delayed_buf[(i*2)+1]));
			
        end
    endgenerate

	I_DELAY #(
        .DELAY(DELAY)
    )
    data_i_delay1 (  
        .I(din_idly_buf[0]),
        .DLY_LOAD(f2g_trx_dly_ld_out[4]),
        .DLY_ADJ(f2g_trx_dly_adj_out[4]),
        .DLY_INCDEC(f2g_trx_dly_inc_out[4]),
        // .DLY_TAP_VALUE(dly_tap_value[((DLY_TAP_WIDTH-1)+(i*2*DLY_TAP_WIDTH)):(i*2*DLY_TAP_WIDTH)]), 
		.DLY_TAP_VALUE(dly_tap_value[29 : 24]),
		// .DLY_TAP_VALUE(dly_tap_value[(dly_site_addr_bus[(i * 10)+: 5] * DLY_TAP_WIDTH)  +: DLY_TAP_WIDTH]),
        .CLK_IN(clk_buf_i),
        .O(dout_idly[0])
        );
	O_DELAY #(
        .DELAY(DELAY)
    )
    data_o_delay1 (
        .I(din_odly_buf[0]),
        .DLY_LOAD(f2g_trx_dly_ld_out[7]),
        .DLY_ADJ(f2g_trx_dly_adj_out[7]),
        .DLY_INCDEC(f2g_trx_dly_inc_out[7]),
        // .DLY_TAP_VALUE(dly_tap_value[((DLY_TAP_WIDTH*2-1)+(i*2*DLY_TAP_WIDTH)):(i*2*DLY_TAP_WIDTH)+(DLY_TAP_WIDTH)]),
		.DLY_TAP_VALUE(dly_tap_value[47 : 42]),
		// .DLY_TAP_VALUE(dly_tap_value[(dly_site_addr_bus[(i * 10 + 9) -: 5] * DLY_TAP_WIDTH)  +: DLY_TAP_WIDTH]),
        .CLK_IN(clk_buf_i),
        .O(dout_odly[0])
    );
	I_DELAY #(
        .DELAY(DELAY)
    )
    data_i_delay2 (  
        .I(din_idly_buf[1]),
        .DLY_LOAD(f2g_trx_dly_ld_out[14]),
        .DLY_ADJ(f2g_trx_dly_adj_out[14]),
        .DLY_INCDEC(f2g_trx_dly_inc_out[14]),
        // .DLY_TAP_VALUE(dly_tap_value[((DLY_TAP_WIDTH-1)+(i*2*DLY_TAP_WIDTH)):(i*2*DLY_TAP_WIDTH)]), 
		.DLY_TAP_VALUE(dly_tap_value[89 : 84]),
		// .DLY_TAP_VALUE(dly_tap_value[(dly_site_addr_bus[(i * 10)+: 5] * DLY_TAP_WIDTH)  +: DLY_TAP_WIDTH]),
        .CLK_IN(clk_buf_i),
        .O(dout_idly[1])
        );
	O_DELAY #(
        .DELAY(DELAY)
    )
    data_o_delay2 (
        .I(din_odly_buf[1]),
        .DLY_LOAD(f2g_trx_dly_ld_out[18]),
        .DLY_ADJ(f2g_trx_dly_adj_out[18]),
        .DLY_INCDEC(f2g_trx_dly_inc_out[18]),
        // .DLY_TAP_VALUE(dly_tap_value[((DLY_TAP_WIDTH*2-1)+(i*2*DLY_TAP_WIDTH)):(i*2*DLY_TAP_WIDTH)+(DLY_TAP_WIDTH)]),
		.DLY_TAP_VALUE(dly_tap_value[113 : 108]),
		// .DLY_TAP_VALUE(dly_tap_value[(dly_site_addr_bus[(i * 10 + 9) -: 5] * DLY_TAP_WIDTH)  +: DLY_TAP_WIDTH]),
        .CLK_IN(clk_buf_i),
        .O(dout_odly[1])
    );


endmodule
