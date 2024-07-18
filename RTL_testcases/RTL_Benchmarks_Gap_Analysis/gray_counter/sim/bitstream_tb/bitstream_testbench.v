
    rst=1;
    repeat(10)@(negedge clk);
    rst=0;

    for (int i=0; i<2**6; i=i+1)begin
      @(negedge clk);
      if (counter_model !== out_gfpga) begin
          $display("Status: Test Failed  =>  Model Output = %7b , Fabric Output  = %7b",counter_model,out_gfpga);
      end
      else begin
          $display("Status: Test Passed  =>  Model Output = %7b , Fabric Output  = %7b",counter_model,out_gfpga);	
      end
      counter = counter+1;
      counter_model <= {counter[4], counter[4:1] ^ counter[3:0]};
  end