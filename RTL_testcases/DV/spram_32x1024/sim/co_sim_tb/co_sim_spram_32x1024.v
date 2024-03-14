 
module co_sim_spram_32x1024;
	//spram_32x1024 interface declaration
    //===================================================================
	parameter AWIDTH          = 10;
	parameter DWIDTH          = 32;
	parameter SIZE            = 1024;
	parameter Total_instances = 2;
	parameter ITERATIONS 	  = 256;
	bit clock0;
	bit rce; 
	bit wce; 
	bit [AWIDTH-1:0]ra; 
	reg [DWIDTH-1:0]rq, rq_netlist; 
	bit [AWIDTH-1:0]wa; 
	bit [DWIDTH-1:0]wd; 
	bit [$clog2(Total_instances)-1:0]id = 'h0;
	bit [DWIDTH-1:0] wdata;
	reg [DWIDTH-1:0] rd_data;
  bit [AWIDTH-1:0]address; 
  integer mismatch=0;


	spram_32x1024 golden(.*);
	`ifdef PNR
			spram_32x1024_post_route netlist(.*, .rq(rq_netlist));
	`else
			spram_32x1024_post_synth netlist(.*, .rq(rq_netlist));
	`endif

always #10 clock0 = ~clock0;

initial begin
	//Initialize
	init();
	@(negedge clock0);
	for (int j=0; j<Total_instances;j++) begin
		id = j;
		// Random Write Read
		//for (bit[AWIDTH-1:0] i = 0; i<50; i++) begin
		for (int i = 0; i<ITERATIONS; i++) begin
			wdata = $urandom_range(0, ((2**DWIDTH)-1));
			address = $urandom_range(0, ((2**AWIDTH)-1));
			//write
			write(address, wdata);
			//Read
			read(address, rd_data);
			compare();
			
		end
		//Corner_Cases
		//write 1s
		wdata = '1;
		address = '0;
		write(address, wdata);
		address = '1; 
		write(address, wdata);
		
		//Read
		address = '0;
		read(address, rd_data);
		compare();
		address = '1;
		read(address, rd_data);
		compare();

		//write 0s
		wdata = '0;
		address = '0;
		write(address, wdata);
		address = '1; 
		write(address, wdata);

		//Read
		address = '0;
		read(address, rd_data);
		compare();
		address = '1;
		read(address, rd_data);
		compare();
	end
	
	if(mismatch == 0)
			$display("\n**** All Comparison Matched ***\nSimulation Passed");
	else
			$display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
	

	repeat (100) @(negedge clock0); $finish;
end

task init();
	clock0 = 0;
	wce = 0;
	wa  = 0;
	wd  = 0;
	rce = 0;
	ra  = 0;
	id  = 0;
	repeat(4) @(negedge clock0);
endtask

task write(reg[AWIDTH-1:0] addr, reg[DWIDTH-1:0] data);
	@(negedge clock0);
	wa = addr;
	wd = data;
	wce = 1;
	rce = 0;
	@(negedge clock0);
	wce = 0;
endtask

task read(reg[AWIDTH-1:0] addr, output reg [DWIDTH-1:0] rd_data);
	@(negedge clock0);
	ra = addr;
	rce = 1;
	wce = 0;
	@(negedge clock0);
	rce = 0;
	@(negedge clock0);
	rd_data = rq;
endtask

task compare();
	if (rq !== rq_netlist) begin
		$display("FAIL:: @%0t, RTL Data: %0h, Netlist Data: %0h", $time,  rq, rq_netlist); 
		mismatch = mismatch+1;
	end
	else begin
		$display("PASS:: @%0t, RTL Data: %0h, Netlist Data: %0h", $time,  rq, rq_netlist); 
	end 
endtask

initial begin
    $dumpfile("tb.vcd");
    $dumpvars;
end

endmodule