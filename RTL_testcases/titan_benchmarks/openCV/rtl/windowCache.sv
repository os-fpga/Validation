module windowCache(
	
	//////////// CLOCK //////////
	input bit clk,

	//////////// Interfaces //////////
	input structs::struct_windowCache_Write wcw,
	input structs::struct_windowCache_Read_In wcr_in,
	output structs::struct_windowCache_Read_Out wcr_out		
);	

	
	import pkg_windowCache::*;
	logic unsigned [ADDR_WIDTH-1 :0] waddr;
	logic unsigned [ADDR_WIDTH-1 :0] raddr;
	logic [ELM_WIDTH-1 :0] raddrElm;	
	logic [WORDS-1:0][WORD_SIZE - 1:0] internalQ;
	
	
	structs::struct_windowCache_Write regwcw;
	
	
	always_ff @ (posedge clk) begin
		regwcw <=wcw;
	end

	always_comb begin	
		// address decoding - may need to simplify
		// given WORDS is a known at runtime pwr2 and BLOCKS is known at runtime - not performance critical	
		waddr <= (regwcw.waddrY*BLOCKS) + regwcw.waddrBlock;
		
		raddr <= wcr_in.raddrY*BLOCKS + wcr_in.raddrX/WORDS;
		raddrElm <= wcr_in.raddrX%WORDS;
		
		wcr_out.q <= internalQ[raddrElm];
	end
	
	
	
	genvar i;
	generate
		for(i = 0 ; i < WORDS ; i ++) begin : loop
		altsyncram	altsyncram_component (
				
				.clock0 (clk),				
				.address_a (waddr),
				.data_a (regwcw.wdata),
				.wren_a (regwcw.we),
				.address_b (raddr),
				.q_b (internalQ[i]),				
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
				.data_b ({17{1'b1}}),
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
		altsyncram_component.numwords_a = TOTALWORDS,
		altsyncram_component.numwords_b = TOTALWORDS,
		altsyncram_component.operation_mode = "DUAL_PORT",
		altsyncram_component.outdata_aclr_b = "NONE",
		altsyncram_component.outdata_reg_b = "UNREGISTERED",
		altsyncram_component.power_up_uninitialized = "FALSE",
		altsyncram_component.ram_block_type = "M9K",
		altsyncram_component.read_during_write_mode_mixed_ports = "DONT_CARE",
		altsyncram_component.widthad_a = ADDR_WIDTH,
		altsyncram_component.widthad_b = ADDR_WIDTH,
		altsyncram_component.width_a = WORD_SIZE,
		altsyncram_component.width_b = WORD_SIZE,
		altsyncram_component.width_byteena_a = 1;
	
		end	
	endgenerate
	
	
	
	/*
	//window data
  simpleDualPortRam #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .WORD_SIZE(WORD_SIZE),
    .WORDS(WORDS),	
    .BLOCKIN(1),
    .BLOCKOUT(0)
  ) ram(		
    .clk(clk),
    .waddr(waddr),
    .raddr(raddr),
    .raddrElm(raddrElm),
    .waddrElm(0),
    .wdata(regwcw.wdata),
    .we(regwcw.we),
    .q(wcr_out.q)			
  );	
  */
  
  
  
endmodule : windowCache
