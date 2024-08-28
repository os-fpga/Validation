module featureCache (

	//////////// CLOCK //////////// 	
	input bit clk,
		
	//////////// Interfaces //////////// 	
	input structs::struct_featureCache_Write fcw,
	input structs::struct_featureCache_Read_In fcr_in,
	output structs::struct_featureCache_Read_Out fcr_out
);

import pkg_featureCache::*;


	// instantiate the ram blocks
	altsyncram	altsyncram_component (
					.address_a (fcw.waddr),
					.clock0 (clk),
					.data_a (fcw.wdata),
					.wren_a (fcw.we),
					.address_b (fcr_in.raddr),
					.q_b (fcr_out.q),
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
					.data_b ({8{1'b1}}),
					.eccstatus (),
					.q_a (),
					.rden_a (1'b1),
					.rden_b (1'b1),
					.wren_b (1'b0));
		defparam
			altsyncram_component.address_aclr_b = "NONE",
			altsyncram_component.address_reg_b = "CLOCK0",
			altsyncram_component.clock_enable_input_a = "BYPASS",
			altsyncram_component.clock_enable_input_b = "BYPASS",
			altsyncram_component.clock_enable_output_b = "BYPASS",
			altsyncram_component.intended_device_family = "Stratix IV",
			altsyncram_component.lpm_type = "altsyncram",
			altsyncram_component.numwords_a = WORDS,
			altsyncram_component.numwords_b = WORDS,
			altsyncram_component.operation_mode = "DUAL_PORT",
			altsyncram_component.outdata_aclr_b = "NONE",
			altsyncram_component.outdata_reg_b = "UNREGISTERED",
			altsyncram_component.power_up_uninitialized = "FALSE",
			altsyncram_component.ram_block_type = "M144K",
			altsyncram_component.read_during_write_mode_mixed_ports = "DONT_CARE",
			altsyncram_component.widthad_a = ADDR_WIDTH,
			altsyncram_component.widthad_b = ADDR_WIDTH,
			altsyncram_component.width_a = WORD_SIZE,
			altsyncram_component.width_b = WORD_SIZE;
			
			
			/*
			
			
      simpleDualPortRam 
      #(
        // paramiters
        .ADDR_WIDTH(ADDR_WIDTH),
        .WORD_SIZE(WORD_SIZE),
        .WORDS(1),	
       .BLOCKIN(0),
       .BLOCKOUT(0)
      )
      ram 
      (		
        // signals
        .clk(clk),
        .waddr(fcw.waddr),
        .raddr(fcr_in.raddr),
        .wdata(fcw.wdata),
        .we(fcw.we),
        .q(fcr_out.q),
        .raddrElm(0),
       .waddrElm(0)
      );			
      
      */
      

endmodule : featureCache
