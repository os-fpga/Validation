
    a<=0;
    b<=0;
    #10;

    for(i=0;i<500;i=i+1) begin
        a <= $random();
        b <= $random();
        #5;
        compare();
        #5; //wait for 10 ns.
    end 

	if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nError: Simulation Failed", mismatch);