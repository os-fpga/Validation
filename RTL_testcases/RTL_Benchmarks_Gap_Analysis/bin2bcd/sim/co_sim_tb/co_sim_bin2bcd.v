//-------------------------------------------------------------------
// Function: Testbench for the Binary to Decimal converter
// Source: 
//   https://verilogcodes.blogspot.com/2015/10/verilog-code-for-8-bit-binary-to-bcd.html
module co_sim_bin2bcd;

    // Input
    reg [7:0] bin;
    // Output
    wire [11:0] bcd,bcd_netlist;
    // Extra variables
    reg [8:0] i;

	integer mismatch=0;

    // Instantiate the Unit Under Test (UUT)
    bin2bcd golden (.bin(bin), .bcd(bcd));
    `ifdef PNR
    bin2bcd_post_route netlist (.bin(bin), .bcd(bcd_netlist));
    `else
    bin2bcd_post_synth netlist (.bin(bin), .bcd(bcd_netlist));
    `endif

//Simulation - Apply inputs
    initial begin
        bin = 0;
        #5;
    //A for loop for checking all the input combinations.
        for(i=0;i<256;i=i+1)
        begin
            bin = i; 
            compare();
            #10; //wait for 10 ns.
        end 

		// repeat(10)@(negedge clk);
		if(mismatch == 0)
			$display("\n**** All Comparison Matched ***\nSimulation Passed");
		else
			$display("%0d comparison(s) mismatched\nError: Simulation Failed", mismatch);
        #20;
        $finish; //system function for stoping the simulation.
    end

	task compare();
        $display("*** Comparing ***");
        if(bcd !== bcd_netlist) begin
            $display("Data Mismatch. Golden: %0b, Netlist: %0b, Time: %0t", bcd, bcd_netlist, $time);
            mismatch = mismatch+1;
        end
        else
            $display("Data Matched. Golden: %0b, Netlist: %0b, Time: %0t", bcd, bcd_netlist, $time);
    endtask

    initial begin
        $dumpfile("bin2bcd.vcd");
        $dumpvars;
    end
      
endmodule
