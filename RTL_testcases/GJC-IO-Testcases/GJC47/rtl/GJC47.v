//***********************************************************
// Functionality: Input is delayed according to controls then 
//                inverted and sent out through output buffer
// Author:        Azfar  
//***********************************************************



module GJC47 #(
    parameter DELAY         = 0,
    parameter NUM_GB_SITES  = 20,
    parameter DLY_LOC       = 'h9_6767, // The LSB of this number correspond to GBox IO[0] and MSB correspond to GBox IO[19]. Each 1/2 bank is addressed separately
    parameter ADDR_WIDTH    = 5,
    parameter DLY_TAP_WIDTH = 6,
    parameter NUM_DLY       = 12,		// The NUM_DLY will be divided equally between I_DELAY (6) and O_DELAY (6)
    parameter DLY_SEL_WIDTH = $clog2(NUM_DLY)
)
(
    input wire                      clk_i_buf,
	input wire                      reset,
	input wire [DLY_SEL_WIDTH-1:0]  sel_dly,
    input wire [(NUM_DLY/2)-1:0]    din_idly,
    input wire [(NUM_DLY/2)-1:0]    din_odly,	
	input wire [DLY_TAP_WIDTH:0]    g2f_trx_dly_tap,
    input wire                      dly_incdec_buf,
    input wire                      dly_ld_buf,
    input wire                      dly_adj_buf,
	input wire [NUM_DLY-1:0]        usr_rd_dly_value,
    //============================================================================================================
    // These ports are added on the top level so synthesis will not optimize them
    // These ports should only be present in the fabric netlist and needs to be removed from the Gearbox netlist
	input wire [(DLY_TAP_WIDTH)-1:0] g2f_rx_dly_tap,   // This port needs to be edited out from GearBox netlist. This is an input to fabric netlist from GBox fixed output.
    output wire                      f2g_trx_dly_inc,                      // This port needs to be edited out from GearBox netlist. This is a fixed input to GBox and output from fabric netlist.
	output wire                      f2g_trx_dly_ld,                        // This port needs to be edited out from GearBox netlist. This is a fixed input to GBox and output from fabric netlist.
	output wire                      f2g_trx_dly_adj,                       // This port needs to be edited out from GearBox netlist. This is a fixed input to GBox and output from fabric netlist.
	output wire [ADDR_WIDTH-1:0]     f2g_dly_addr,         // This port needs to be edited out from GearBox netlist. This is a fixed input to GBox and output from fabric netlist.
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
	wire [NUM_DLY-1:0] 		dly_incdec_in;  	// Dummy signals
	wire [NUM_DLY-1:0] 		dly_ld_in;  		// Dummy signals
	wire [NUM_DLY-1:0] 		dly_adj_in;  		// Dummy signals
    wire [(DLY_TAP_WIDTH*NUM_DLY)-1:0] 	usr_dly_tap_value_out;
    reg  [(DLY_TAP_WIDTH-1):0] 			dly_tap_val;
	wire [(DLY_TAP_WIDTH*NUM_DLY)-1:0] 	dly_tap_value;
	
    //reg [NUM_DLY-1:0] 		usr_dly_incdec_inv;
    //reg [NUM_DLY-1:0] 		usr_dly_adj_inv;
    //reg [NUM_DLY-1:0] 		usr_dly_ld_inv;
    
    reg [NUM_DLY-1:0] 		usr_dly_incdec_in;
    reg [NUM_DLY-1:0] 		usr_dly_adj_in;
    reg [NUM_DLY-1:0] 		usr_dly_ld_in;


    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf0_ (clk_i_buf,const1,clk_i);
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf1_idly_incdec (dly_incdec_buf,const1,dly_incdec);
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf2_idly_ld (dly_ld_buf,const1,dly_ld);
    I_BUF #(.WEAK_KEEPER("PULLDOWN")) buf3_ldly_adj (dly_adj_buf,const1,dly_adj);
 
    O_BUF obuf0_ (dly_tap_val[0], dly_tap_val_inv_buf[0]);
    O_BUF obuf1_ (dly_tap_val[1], dly_tap_val_inv_buf[1]);
    O_BUF obuf2_ (dly_tap_val[2], dly_tap_val_inv_buf[2]);
    O_BUF obuf3_ (dly_tap_val[3], dly_tap_val_inv_buf[3]);
    O_BUF obuf4_ (dly_tap_val[4], dly_tap_val_inv_buf[4]);
    O_BUF obuf5_ (dly_tap_val[5], dly_tap_val_inv_buf[5]);
	
	

    assign const1 = 1;
    assign enable = const1;

    CLK_BUF clock_buffer (clk_i,clk_buf_i);
	
	//assign usr_dly_incdec = {
	
	DLY_ADDR_CNTRL #(.NUM_GB_SITES (NUM_GB_SITES),
                .DLY_LOC   (DLY_LOC),
                .NUM_DLY   (NUM_DLY),   //Minimum of 1 and maximum of 20 I_DELAY or O_DELAY 
                .ADDR_WIDTH (ADDR_WIDTH),
                .DLY_TAP_WIDTH    (DLY_TAP_WIDTH)
                )
                DLY_ADDR_CNTRL_INST (.rst(reset),
                                    .cntrl_dly_tap_value (g2f_rx_dly_tap),
                                    .usr_dly_tap_value_in (dly_tap_value),
                                    .usr_dly_incdec (usr_dly_incdec_in),
	                                .usr_dly_ld (usr_dly_ld_in),
	                                .usr_dly_adj (usr_dly_adj_in),
	                                .usr_rd_dly_value (usr_rd_dly_value),
	                                .f2g_dly_addr(f2g_dly_addr),
                                    .cntrl_dly_incdec (f2g_trx_dly_inc),
                                    .cntrl_dly_ld (f2g_trx_dly_ld),
                                    .cntrl_dly_adj (f2g_trx_dly_adj),
									.phy_dly_incdec (dly_incdec_in),
									.phy_dly_ld (dly_ld_in),
									.phy_dly_adj (dly_adj_in),									 
                                    .usr_dly_tap_value_out(usr_dly_tap_value_out)                                     
                                    );
 //assign dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
 generate
    if (NUM_DLY == 2) begin   
	   always @(*) begin
	       case (sel_dly)
			   0:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   1:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   default : dly_tap_val = usr_dly_tap_value_out[DLY_TAP_WIDTH-1:0];
		   endcase
	    end     // always
    end else if (NUM_DLY == 4) begin   
	   always @(*) begin    
	       case (sel_dly)
			   0:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   1:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   2:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   3:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   default : dly_tap_val = usr_dly_tap_value_out[DLY_TAP_WIDTH-1:0];
		   endcase
	    end     // always    
    end else if (NUM_DLY == 6) begin   
	   always @(*) begin    
	       case (sel_dly)
			   0:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   1:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   2:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   3:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   4:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   5:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   default : dly_tap_val = usr_dly_tap_value_out[DLY_TAP_WIDTH-1:0];
		   endcase
	    end     // always    
    end else if (NUM_DLY == 8) begin   
	   always @(*) begin    
	       case (sel_dly)
			   0:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   1:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   2:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   3:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   4:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   5:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   6:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   7:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];		
			   default : dly_tap_val = usr_dly_tap_value_out[DLY_TAP_WIDTH-1:0];
		   endcase
	    end     // always   
    end else if (NUM_DLY == 10) begin   
	   always @(*) begin    
	       case (sel_dly)
			   0:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   1:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   2:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   3:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   4:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   5:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   6:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   7:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];		
			   8:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   9:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   default : dly_tap_val = usr_dly_tap_value_out[DLY_TAP_WIDTH-1:0];
		   endcase
	    end     // always   
    end else if (NUM_DLY == 12) begin   
	   always @(*) begin    
	       case (sel_dly)
			   0:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   1:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   2:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   3:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   4:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   5:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   6:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   7:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];		
			   8:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   9:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   10:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   11:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];			   
			   default : dly_tap_val = usr_dly_tap_value_out[DLY_TAP_WIDTH-1:0];
		   endcase
	    end     // always   	 
    end else if (NUM_DLY == 14) begin   
	   always @(*) begin    
	       case (sel_dly)
			   0:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   1:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   2:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   3:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   4:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   5:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   6:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   7:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];		
			   8:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   9:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   10:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   11:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   12:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   13:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];				   		   
			   default : dly_tap_val = usr_dly_tap_value_out[DLY_TAP_WIDTH-1:0];
		   endcase
	    end     // always   	   
    end else if (NUM_DLY == 16) begin   
	   always @(*) begin    
	       case (sel_dly)
			   0:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   1:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   2:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   3:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   4:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   5:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   6:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   7:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];		
			   8:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   9:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   10:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   11:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   12:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   13:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   14:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   15:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];				   		   
			   default : dly_tap_val = usr_dly_tap_value_out[DLY_TAP_WIDTH-1:0];
		   endcase
	    end     // always   		   
    end else if (NUM_DLY == 18) begin   
	   always @(*) begin    
	       case (sel_dly)
			   0:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   1:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   2:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   3:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   4:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   5:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   6:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   7:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];		
			   8:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   9:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   10:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   11:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   12:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   13:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   14:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   15:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   16:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   17:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];				   			   		   
			   default : dly_tap_val = usr_dly_tap_value_out[DLY_TAP_WIDTH-1:0];
		   endcase
	    end     // always   	  	 
    end else   
	   always @(*) begin    
	       case (sel_dly)
			   0:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   1:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   2:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   3:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   4:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   5:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   6:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   7:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];		
			   8:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   9:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   10:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   11:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   12:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   13:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   14:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   15:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];	
			   16:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   17:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];		
			   18:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];
			   19:	dly_tap_val = usr_dly_tap_value_out[sel_dly*DLY_TAP_WIDTH+:DLY_TAP_WIDTH];				   		   			   		   
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
		usr_dly_incdec_in = 'h0;
		usr_dly_adj_in = 'h0;
		usr_dly_ld_in = 'h0;
		//usr_dly_incdec_inv[sel_dly] = ~dly_incdec;
		//usr_dly_adj_inv [sel_dly]   = ~dly_adj;
		//usr_dly_ld_inv[sel_dly]     = ~dly_ld;
		usr_dly_incdec_in[sel_dly] = dly_incdec;
		usr_dly_adj_in [sel_dly]   = dly_adj;
		usr_dly_ld_in[sel_dly]     = dly_ld;
	end

    //assign data_o_inv_delayed   = ~data_o[select-1];

    //reg  [I_DELAYS-1:0] data_i_buf = {I_DELAYS{1'b0}};
    //wire [O_DELAYS-1:0] data_o;
    //wire [NUM_IDLY-1:0] din_reg_odly;

    //assign xx = dout_idly

    genvar i;
    generate
        for (i = 0; i < NUM_DLY/2; i = i + 1) begin
			I_BUF idly_idata_ibuf (din_idly[i],enable,din_idly_buf[i]);
			
            I_DELAY #(
                .DELAY(DELAY)
            )
            data_i_delay (  
                .I(din_idly_buf[i]),
                .DLY_LOAD(dly_ld_in[i*2]),
                .DLY_ADJ(dly_adj_in[i*2]),
                .DLY_INCDEC(dly_incdec_in[i*2]),
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
                .DLY_LOAD(dly_ld_in[(i*2)+1]),
                .DLY_ADJ(dly_adj_in[(i*2)+1]),
                .DLY_INCDEC(dly_incdec_in[(i*2)+1]),
                .DLY_TAP_VALUE(dly_tap_value[((DLY_TAP_WIDTH*2-1)+(i*2*DLY_TAP_WIDTH)):(i*2*DLY_TAP_WIDTH)+(DLY_TAP_WIDTH)]),
                .CLK_IN(clk_buf_i),
                .O(dout_odly[i])
            );
			O_BUF odly_odata_obuf (dout_odly[i],data_delayed_buf[(i*2)+1]);
			
        end
    endgenerate
	
//	always @(posedge clk_buf_i or negedge rst_buf_i)
//		if (!rst_buf_i) 
//			din_odly <= 'h0;
//		else
//			din_odly <= dout_idly;
	
endmodule