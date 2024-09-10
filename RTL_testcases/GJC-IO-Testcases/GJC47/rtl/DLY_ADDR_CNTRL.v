`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2024 03:49:07 PM
// Design Name: 
// Module Name: DLY_ADDR_CNTRL
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DLY_ADDR_CNTRL #(parameter                    NUM_GB_SITES  = 20,
                        parameter [NUM_GB_SITES-1:0] DLY_LOC       = 'h0_C117,
                        parameter                    NUM_DLY       = 5,   //Minimum of 1 and maximum of 20 I_DELAY or O_DELAY  
                        parameter                    DLY_TAP_WIDTH = 6,
                        parameter                    ADDR_WIDTH    = 5
					  )
                    (input       rst,  
                     input [5:0] cntrl_dly_tap_value,							// Input to fabric from GearBox. I_DELAY TAP Value MUXED Output from GBox
                     input [NUM_DLY-1: 0] usr_dly_incdec,						// Input from user to control I_DELAY
	                 input [NUM_DLY-1: 0] usr_dly_ld,							// Input from user to control I_DELAY. Only one signal should be active at any time
	                 input [NUM_DLY-1: 0] usr_dly_adj,							// Input from user to control I_DELAY
	                 input [NUM_DLY-1: 0] usr_rd_dly_value,						// Input from user to read the I_DELAY output port for TAP Value
	                 output reg [ADDR_WIDTH-1:0] f2g_dly_addr,						// Address bus to GBox. Selects the I_DELAY
                     output cntrl_dly_incdec,									// Drive the selected I_DELAY INCDEC signal based upon the active user_dly_ld signal
                     output cntrl_dly_ld,										// Drive the selected I_DELAY LD siganl based upon the active user_dly_ld signal
                     output cntrl_dly_adj,										// Drive the selected I_DELAY ADJ siganl based upon the active user_dly_adj signal
                     output [(NUM_DLY*DLY_TAP_WIDTH)-1:0] usr_dly_tap_value_out   // DLY TAP Value out for user. Concatenated value
                    );

integer ACT_IDLY_CNT;
integer active_idelay_cnt;
wire [4:0] f2g_dly_addr_wire;
reg [NUM_DLY:0]                  delay_location_index [NUM_GB_SITES-1:0];
reg [ADDR_WIDTH-1:0]             dly_site_addr [NUM_DLY-1:0];
wire [(ADDR_WIDTH*NUM_DLY)-1:0]  dly_site_addr_bus;
wire [NUM_DLY-1:0]               usr_dly_ld_en;
reg [5:0] last_dly_sly;

	// Count one to assign DELAY to each address
	// Total number of GB_SITES are needed to asign address
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
                $display("time=%t, act_dly_cnt=%0d, active_idelay_cnt=%d, delay_location_index[0x%h]=0x%h, dly_site_addr[%0d]=0x%h", $time, act_dly_cnt, active_idelay_cnt, i, delay_location_index[i], act_dly_cnt, dly_site_addr[act_dly_cnt]);
                `endif
                act_dly_cnt = act_dly_cnt+1;  // order is important for counting
            end
        end   // for loop
    end // function
    endfunction
    
	// Count one
    function integer count_ones (input [NUM_DLY-1:0] valid_sites);
    integer i;
    begin
        count_ones = 0;
        for (i = 0 ; i<NUM_DLY ; i=i+1)
        begin
            if (DLY_LOC[i] == 1'b1) begin
                count_ones = count_ones+1;  // order is important for counting
            end
        end   // for loop
    end // function
    endfunction    

//drive control signal based upon active delay load control

muxp #(.DWIDTH(1),
       .NUM_OF_BUS(NUM_DLY)
       )
 muxp_inst_incdec (.d(usr_dly_incdec),
            .sel(usr_dly_adj),       // dly_adj
            .dout(cntrl_dly_incdec)
    );
    
muxp #(.DWIDTH(1),
       .NUM_OF_BUS(NUM_DLY)
      )
     muxp_inst_adj (.d(usr_dly_adj),
                .sel(usr_dly_adj),       // dly_adj
                .dout(cntrl_dly_adj)
        );

muxp #(.DWIDTH(1),
       .NUM_OF_BUS(NUM_DLY)
      )
     muxp_inst_ld (.d(usr_dly_ld),
                .sel(usr_dly_ld),
                .dout(cntrl_dly_ld)
        );


muxp #(.DWIDTH(ADDR_WIDTH),
       .NUM_OF_BUS(NUM_DLY)
      )
     muxp_dly_addr (.d(dly_site_addr_bus),
                    .sel(usr_dly_ld | usr_dly_adj),       // dly_adj || dly_ld
                    .dout(f2g_dly_addr)
                );

one2x_decoder #(.DWIDTH(DLY_TAP_WIDTH),
                .NUM_OF_OBUS(NUM_DLY)
                )
   one2x_decoder_inst (.din(cntrl_dly_tap_value),
                       .sel(usr_dly_ld_en | usr_dly_adj),
                       .dout(usr_dly_tap_value_out)
                        );
                        
assign usr_dly_ld_en = usr_rd_dly_value ^ usr_dly_ld;
    
// This generates the assign delay site address concatenated as a bus
generate
for (genvar i=0; i<NUM_DLY; i=i+1) begin : GEN_ADDR_CONCAT   
     assign dly_site_addr_bus[((ADDR_WIDTH*(i+1))-1):ADDR_WIDTH*i] = dly_site_addr[i]; 
end
endgenerate
  
                
always @(rst or usr_dly_ld)
    if (!rst) begin
        ACT_IDLY_CNT = act_dly_cnt(NUM_GB_SITES);
 //       dly_site_addr_reg = dly_site_addr_tmp;
    end 
    //else begin
    //    if (count_ones(usr_dly_ld) > 1) begin
    //        $error("More then one delay load signals are active: usr_dly_ld = %0x0h", usr_dly_ld);
    //    end
    //end
//        dly_site_addr_reg <= dly_site_addr_tmp;
        //$display("time1=%t, dly_site_addr_reg = 0x%0h", $time, dly_site_addr_reg);
    //end
    
endmodule 
