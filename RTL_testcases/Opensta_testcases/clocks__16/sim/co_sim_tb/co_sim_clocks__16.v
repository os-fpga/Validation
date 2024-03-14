module co_sim_clocks__16;

    reg clk_0, clk_1, clk_2, clk_3, clk_4, clk_5, clk_6, clk_7, clk_8, clk_9, clk_10, clk_11, clk_12, clk_13, clk_14, clk_15;
    reg [15:0] d;
    reg select, reset;
    wire [15:0] q, q_netlist;
    wire [15:0] qn, qn_netlist;

	integer mismatch=0;

    clocks__16 golden (.clk_0(clk_0),.clk_1(clk_1),.clk_2(clk_2),.clk_3(clk_3),.clk_4(clk_4),.clk_5(clk_5),.clk_6(clk_6),.clk_7(clk_7),.clk_8(clk_8),.clk_9(clk_9),.clk_10(clk_10),.clk_11(clk_11),.clk_12(clk_12),.clk_13(clk_13),.clk_14(clk_14),.clk_15(clk_15),.d(d),.select(select),.reset(reset),.q(q),.qn(qn));
    `ifdef PNR
	clocks__16_post_route netlist (.clk_0(clk_0),.clk_1(clk_1),.clk_2(clk_2),.clk_3(clk_3),.clk_4(clk_4),.clk_5(clk_5),.clk_6(clk_6),.clk_7(clk_7),.clk_8(clk_8),.clk_9(clk_9),.clk_10(clk_10),.clk_11(clk_11),.clk_12(clk_12),.clk_13(clk_13),.clk_14(clk_14),.clk_15(clk_15),.d(d),.select(select),.reset(reset),.q(q_netlist),.qn(qn_netlist));
    `else
    clocks__16_post_synth netlist (.clk_0(clk_0),.clk_1(clk_1),.clk_2(clk_2),.clk_3(clk_3),.clk_4(clk_4),.clk_5(clk_5),.clk_6(clk_6),.clk_7(clk_7),.clk_8(clk_8),.clk_9(clk_9),.clk_10(clk_10),.clk_11(clk_11),.clk_12(clk_12),.clk_13(clk_13),.clk_14(clk_14),.clk_15(clk_15),.d(d),.select(select),.reset(reset),.q(q_netlist),.qn(qn_netlist));
    `endif

    always #(2.5) begin clk_0 <= ~clk_0; end
    always #(1) begin clk_1 <= ~clk_1; end
    always #(1.5) begin clk_2 <= ~clk_2; end
    always #(1.8) begin clk_3 <= ~clk_3; end
    always #(1.3) begin clk_4 <= ~clk_4; end
    always #(2) begin clk_5 <= ~clk_5; end
    always #(1.4) begin clk_6 <= ~clk_6; end
    always #(2.4) begin clk_7 <= ~clk_7; end
    always #(1) begin clk_8 <= ~clk_8; end
    always #(1.9) begin clk_9 <= ~clk_9; end
    always #(0.9) begin clk_10 <= ~clk_10; end
    always #(2.6) begin clk_11 <= ~clk_11; end
    always #(1.6) begin clk_12 <= ~clk_12; end
    always #(2) begin clk_13 <= ~clk_13; end
    always #(2.2) begin clk_14 <= ~clk_14; end
    always #(1.2) begin clk_15 <= ~clk_15; end

    initial begin
		clk_0 <= 0;
		clk_1 <= 0;
		clk_2 <= 0;
		clk_3 <= 0;
		clk_4 <= 0;
		clk_5 <= 0;
		clk_6 <= 0;
		clk_7 <= 0;
		clk_8 <= 0;
		clk_9 <= 0;
		clk_10 <= 0;
		clk_11 <= 0;
		clk_12 <= 0;
		clk_13 <= 0;
		clk_14 <= 0;
		clk_15 <= 0;
        d = 16'b0;
        select = 0;
        reset = 0;
		$display ("\n\n***Reset Test is applied***\n\n");
		display_stimulus();
		@(negedge clk_0);
		@(negedge clk_0);
		compare();
		$display ("\n\n***Reset Test is ended***\n\n");

		reset = 1;
		@(negedge clk_0);
	
		$display ("\n\n*** Random Functionality Tests for clocks__16 with clk_0***\n\n");
        repeat (100) begin
			@(negedge clk_0);
            d = $random;
            select = $random % 2;
			display_stimulus();
			@(negedge clk_0);
			@(negedge clk_0);
			compare();
        end
		$display ("\n\n***Random Functionality Tests for clocks__16 with clk_0***\n\n");

		$display ("\n\n*** Random Functionality Tests for clocks__16 with clk_1***\n\n");
        repeat (100) begin
			@(negedge clk_1);
            d = $random;
            select = $random % 2;
			display_stimulus();
			@(negedge clk_1);
			@(negedge clk_1);
			compare();
        end
		$display ("\n\n***Random Functionality Tests for clocks__16 with clk_1***\n\n");
		
		$display ("\n\n*** Random Functionality Tests for clocks__16 with clk_2***\n\n");
        repeat (100) begin
			@(negedge clk_2);
            d = $random;
            select = $random % 2;
			display_stimulus();
			@(negedge clk_2);
			@(negedge clk_2);
			compare();
        end
		$display ("\n\n***Random Functionality Tests for clocks__16 with clk_2***\n\n");
		
		$display ("\n\n*** Random Functionality Tests for clocks__16 with clk_3***\n\n");
        repeat (100) begin
			@(negedge clk_3);
            d = $random;
            select = $random % 2;
			display_stimulus();
			@(negedge clk_3);
			@(negedge clk_3);
			compare();
        end
		$display ("\n\n***Random Functionality Tests for clocks__16 with clk_3***\n\n");
		
		$display ("\n\n*** Random Functionality Tests for clocks__16 with clk_4***\n\n");
        repeat (100) begin
			@(negedge clk_4);
            d = $random;
            select = $random % 2;
			display_stimulus();
			@(negedge clk_4);
			@(negedge clk_4);
			compare();
        end
		$display ("\n\n***Random Functionality Tests for clocks__16 with clk_4***\n\n");
		
		$display ("\n\n*** Random Functionality Tests for clocks__16 with clk_5***\n\n");
        repeat (100) begin
			@(negedge clk_5);
            d = $random;
            select = $random % 2;
			display_stimulus();
			@(negedge clk_5);
			@(negedge clk_5);
			compare();
        end
		$display ("\n\n***Random Functionality Tests for clocks__16 with clk_5***\n\n");
		
		$display ("\n\n*** Random Functionality Tests for clocks__16 with clk_6***\n\n");
        repeat (100) begin
			@(negedge clk_6);
            d = $random;
            select = $random % 2;
			display_stimulus();
			@(negedge clk_6);
			@(negedge clk_6);
			compare();
        end
		$display ("\n\n***Random Functionality Tests for clocks__16 with clk_6***\n\n");
		
		$display ("\n\n*** Random Functionality Tests for clocks__16 with clk_7***\n\n");
        repeat (100) begin
			@(negedge clk_7);
            d = $random;
            select = $random % 2;
			display_stimulus();
			@(negedge clk_7);
			@(negedge clk_7);
			compare();
        end
		$display ("\n\n***Random Functionality Tests for clocks__16 with clk_7***\n\n");
		
		$display ("\n\n*** Random Functionality Tests for clocks__16 with clk_8***\n\n");
        repeat (100) begin
			@(negedge clk_8);
            d = $random;
            select = $random % 2;
			display_stimulus();
			@(negedge clk_8);
			@(negedge clk_8);
			compare();
        end
		$display ("\n\n***Random Functionality Tests for clocks__16 with clk_8***\n\n");
		
		$display ("\n\n*** Random Functionality Tests for clocks__16 with clk_9***\n\n");
        repeat (100) begin
			@(negedge clk_9);
            d = $random;
            select = $random % 2;
			display_stimulus();
			@(negedge clk_9);
			@(negedge clk_9);
			compare();
        end
		$display ("\n\n***Random Functionality Tests for clocks__16 with clk_9***\n\n");
		
		$display ("\n\n*** Random Functionality Tests for clocks__16 with clk_10***\n\n");
        repeat (100) begin
			@(negedge clk_10);
            d = $random;
            select = $random % 2;
			display_stimulus();
			@(negedge clk_10);
			@(negedge clk_10);
			compare();
        end
		$display ("\n\n***Random Functionality Tests for clocks__16 with clk_10***\n\n");
		
		$display ("\n\n*** Random Functionality Tests for clocks__16 with clk_11***\n\n");
        repeat (100) begin
			@(negedge clk_11);
            d = $random;
            select = $random % 2;
			display_stimulus();
			@(negedge clk_11);
			@(negedge clk_11);
			compare();
        end
		$display ("\n\n***Random Functionality Tests for clocks__16 with clk_11***\n\n");
		
		$display ("\n\n*** Random Functionality Tests for clocks__16 with clk_12***\n\n");
        repeat (100) begin
			@(negedge clk_12);
            d = $random;
            select = $random % 2;
			display_stimulus();
			@(negedge clk_12);
			@(negedge clk_12);
			compare();
        end
		$display ("\n\n***Random Functionality Tests for clocks__16 with clk_12***\n\n");
		
		$display ("\n\n*** Random Functionality Tests for clocks__16 with clk_13***\n\n");
        repeat (100) begin
			@(negedge clk_13);
            d = $random;
            select = $random % 2;
			display_stimulus();
			@(negedge clk_13);
			@(negedge clk_13);
			compare();
        end
		$display ("\n\n***Random Functionality Tests for clocks__16 with clk_13***\n\n");
		
		$display ("\n\n*** Random Functionality Tests for clocks__16 with clk_14***\n\n");
        repeat (100) begin
			@(negedge clk_14);
            d = $random;
            select = $random % 2;
			display_stimulus();
			@(negedge clk_14);
			@(negedge clk_14);
			compare();
        end
		$display ("\n\n***Random Functionality Tests for clocks__16 with clk_14***\n\n");
		
		$display ("\n\n*** Random Functionality Tests for clocks__16 with clk_15***\n\n");
        repeat (100) begin
			@(negedge clk_15);
            d = $random;
            select = $random % 2;
			display_stimulus();
			@(negedge clk_15);
			@(negedge clk_15);
			compare();
        end
		$display ("\n\n***Random Functionality Tests for clocks__16 with clk_15***\n\n");


		if(mismatch == 0)
        	$display("\n**** All Comparison Matched ***\nSimulation Passed");
    	else
    	    $display("%0d comparison(s) mismatched\nERROR: SIM: Simulation Failed", mismatch);
		$finish;
    end

	task compare();
		if(q !== q_netlist || qn !== qn_netlist) begin
			$display("Data Mismatch. Golden: %0d, Netlist: %0d, Time: %0t", q, q_netlist, $time);
			$display("Data Mismatch. Golden: %0d, Netlist: %0d, Time: %0t", qn, qn_netlist, $time);
			mismatch = mismatch+1;
   		end
		else
			$display("Data Matched. Golden: %0d, Netlist: %0d, Time: %0t", q, q_netlist, $time);
			$display("Data Matched. Golden: %0d, Netlist: %0d, Time: %0t", qn, qn_netlist, $time);
	endtask

	task display_stimulus();
	  $display ($time,," Test stimulus is: d=%0d", d);
	endtask


	initial begin
	  $dumpfile("tb.vcd");
	  $dumpvars;
	end
endmodule
