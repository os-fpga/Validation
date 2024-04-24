
    comparator1BitVerilog golden (.x(x),.y(y),.eq(eq));

    task compare();
        $display("*** Comparing ***");
        if(eq !== eq_gfpga) begin
            $display("Data Mismatch. Golden eq: %0b, Bitstream eq: %0b, Time: %0t", eq, eq_gfpga, $time);
            mismatch = mismatch+1;
        end
        else
            $display("Data Matched. Golden eq: %0b, Bitstream eq: %0b, Time: %0t", eq, eq_gfpga, $time);
    endtask