module infer_async_ram_MLAB #(
	parameter DATA_WIDTH=8, 
	parameter ADDR_WIDTH=6
	)(
    input   [(ADDR_WIDTH-1):0] addr,
    input   [(DATA_WIDTH-1):0] data_in,
    input         clk,
    input         write,
    output  [(DATA_WIDTH-1):0] data_out );
	 
	 
	 
   reg [(DATA_WIDTH-1):0] mem[0:(2**ADDR_WIDTH-1)];
	
	//Async read
   assign  data_out = mem[addr];
	
	//Sync write
   always @ (posedge clk)
   begin
      if (write)
         mem[addr] = data_in;
   end
endmodule