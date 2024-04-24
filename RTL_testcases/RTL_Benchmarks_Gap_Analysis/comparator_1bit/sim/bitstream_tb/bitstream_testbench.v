
    x<=0;
    y<=0;
    #10;

    for(int i=0;i<500;i=i+1) begin
        x <= $random();
        y <= $random();
        #5;
        compare();
        #5;
    end 

    if(mismatch == 0)
        $display("\n**** All Comparison Matched ***\nSimulation Passed");
    else
        $display("%0d comparison(s) mismatched\nError: Simulation Failed", mismatch);
