module integralImageCache ( 	
	
	//////////// CLOCK ////////////
	input bit clk,
	
	//////////// Interfaces ////////////
	input structs::struct_integralImageCache_Write icw,
	output structs::struct_integralImageCache_Write_Out icw_out,
	input structs::struct_integralImageCache_Read_In icr_in,
	output structs::struct_integralImageCache_Read_Out icr_out
	
);	
	
	import pkg_integralImageCache::*;	
	
	logic [ADDR_WIDTH-1 :0] waddr;
	logic [ADDR_WIDTH-1 :0] raddr;
	logic [ELM_WIDTH-1 :0] waddrElm;
	logic [WORDS-1:0][WORD_SIZE - 1:0] internalQ;	
	
	structs::struct_integralImageCache_Write regicw;
	
	always_ff @ (posedge clk) begin	
		regicw.waddrY <= icw.waddrY;
		regicw.waddrX <= icw.waddrX;
		regicw.wdata <= icw.wdata; 
		regicw.we <= icw.we;	
	end
	
	always_comb begin		
		waddr <= (regicw.waddrY*BLOCKS)+ regicw.waddrX/WORDS;
		waddrElm <= regicw.waddrX%WORDS;		
		raddr <= (icr_in.raddrY*BLOCKS)+icr_in.raddrXBlock;			
		
		icw_out.q <= internalQ[waddrElm];
	end

	
	genvar i;
	generate
		for(i = 0 ; i < WORDS ; i ++) begin : loop
			altsyncram	altsyncram_component (
				.clock0 (clk),
				
				.wren_a ( (i == waddrElm) ? regicw.we : 1'b0 ),
				.address_a(waddr),
				.data_a (regicw.wdata),
				.q_a (internalQ[i]),
				
				.wren_b (1'b0),
				.address_b (raddr),
				.data_b (1'b0),
				.q_b (icr_out.q[i]),
						
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.eccstatus (),
				.rden_a (1'b1),
				.rden_b (1'b1));
		defparam
			altsyncram_component.address_reg_b = "CLOCK0",
			altsyncram_component.clock_enable_input_a = "BYPASS",
			altsyncram_component.clock_enable_input_b = "BYPASS",
			altsyncram_component.clock_enable_output_a = "BYPASS",
			altsyncram_component.clock_enable_output_b = "BYPASS",
			altsyncram_component.indata_reg_b = "CLOCK0",
			altsyncram_component.intended_device_family = "Stratix IV",
			altsyncram_component.lpm_type = "altsyncram",
			altsyncram_component.numwords_a = TOTALWORDS,
			altsyncram_component.numwords_b = TOTALWORDS,
			altsyncram_component.operation_mode = "BIDIR_DUAL_PORT",
			altsyncram_component.outdata_aclr_a = "NONE",
			altsyncram_component.outdata_aclr_b = "NONE",
			altsyncram_component.outdata_reg_a = "UNREGISTERED",
			altsyncram_component.outdata_reg_b = "UNREGISTERED",
			altsyncram_component.power_up_uninitialized = "FALSE",
			altsyncram_component.read_during_write_mode_mixed_ports = "DONT_CARE",
			altsyncram_component.read_during_write_mode_port_a = "NEW_DATA_NO_NBE_READ",
			altsyncram_component.read_during_write_mode_port_b = "NEW_DATA_NO_NBE_READ",
			altsyncram_component.widthad_a = ADDR_WIDTH,
			altsyncram_component.widthad_b = ADDR_WIDTH,
			altsyncram_component.width_a = WORD_SIZE,
			altsyncram_component.width_b = WORD_SIZE,
			altsyncram_component.width_byteena_a = 1,
			altsyncram_component.width_byteena_b = 1,
			altsyncram_component.wrcontrol_wraddress_reg_b = "CLOCK0";		
		end	
	endgenerate
	
	/*
	
	//window integral image data
	simpleDualPortRam 
		#(
			// paramiters
			.ADDR_WIDTH(ADDR_WIDTH),
			.WORD_SIZE(WORD_SIZE),
			.WORDS(WORDS),	
			.BLOCKIN(0),
			.BLOCKOUT(1),
			.TRUEDUALIN(1),
			.TRUEDUALOUT(0)
		) 
		ram 
		(		
			// signals
			.clk(clk),
			.waddr(waddr),
			.raddr(raddr),
			.raddrElm(0),
			.waddrElm(waddrElm),
			.wdata(regicw.wdata),
			.we(regicw.we),
			.q(icr_out.q),			
			.qw(icw_out.q)
		);	
		*/
		
		
		

endmodule : integralImageCache
