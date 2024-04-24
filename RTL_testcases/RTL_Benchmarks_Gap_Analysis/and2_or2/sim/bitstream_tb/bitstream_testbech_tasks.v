
    and2_or2 golden (.a(a),.b(b),.d(d),.c(c));

    task compare();
        $display("*** Comparing ***");
        if(c !== c_gfpga || d !== d_gfpga) begin
            $display("Data Mismatch. Golden c: %0b, Bitstream c: %0b, Golden d: %0b, Bitstream d: %0b, Time: %0t", c, c_gfpga, d, d_gfpga, $time);
            mismatch = mismatch+1;
        end
        else
            $display("Data Matched. Golden: %0b, Bitstream: %0b, Golden d: %0b, Bitstream d: %0b, Time: %0t", c, c_gfpga, d, d_gfpga, $time);
    endtask