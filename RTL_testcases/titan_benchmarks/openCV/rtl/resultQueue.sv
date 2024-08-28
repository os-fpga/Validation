module resultQueue
	(
	
		//////////// CLOCK ////////////
		input bit clk,
		input bit resetn,
		
		//////////// Interfaces //////////////
		input structs::struct_resultQueue_Write_In rqw_in,
		output structs::struct_resultQueue_Write_Out rqw_out,
		input structs::struct_resultQueue_Read_In rqr_in,
		output structs::struct_resultQueue_Read_Out rqr_out
		
	);
	
import pkg_resultQueue::*;
	
	
	
	logic full, empty;
	
	always_comb begin
		rqr_out.empty = empty;
		rqw_out.full = full;
	end

	fifo 
	#(
		.WIDTH(WIDTH),
		.DEPTH(DEPTH)
	)myfifo(
		.clock(clk),
		.data(rqw_in.data),
		.rdreq(rqr_in.re),
		.wrreq(rqw_in.we),
		.empty(empty),
		.full(full),
		.q(rqr_out.q)
	);
	

endmodule : resultQueue