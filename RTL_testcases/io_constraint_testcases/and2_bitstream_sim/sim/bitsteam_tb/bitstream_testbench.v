    #5
    a = 1'b0;
    b = 1'b0;
    #5
    if (c_gfpga === 0)
      $display("Status: Test Passed: a: %0h, b: %0h, c: %0h", a, b, c_gfpga);
    else  
      $display("Status: Test Failed: a: %0h, b: %0h, c: %0h", a, b, c_gfpga);

    #5
    a = 1'b0; 
    b = 1'b1;
    #5
    if (c_gfpga === 0)
      $display("Status: Test Passed: a: %0h, b: %0h, c: %0h", a, b, c_gfpga);
    else  
      $display("Status: Test Failed: a: %0h, b: %0h, c: %0h", a, b, c_gfpga);
      
    #5
    a = 1'b1;
    b = 1'b0;
    #5
    if (c_gfpga === 0)
      $display("Status: Test Passed: a: %0h, b: %0h, c: %0h", a, b, c_gfpga);
    else  
      $display("Status: Test Failed: a: %0h, b: %0h, c: %0h", a, b, c_gfpga);

    #5
    a = 1'b1;
    b = 1'b1;
    #5
    if (c_gfpga === 1)
      $display("Status: Test Passed: a: %0h, b: %0h, c: %0h", a, b, c_gfpga);
    else  
      $display("Status: Test Failed: a: %0h, b: %0h, c: %0h", a, b, c_gfpga);
       
    #5
    a = 1'b0;
    b = 1'b0; 
    #5
    if (c_gfpga === 0)
      $display("Status: Test Passed: a: %0h, b: %0h, c: %0h", a, b, c_gfpga);
    else  
      $display("Status: Test Failed: a: %0h, b: %0h, c: %0h", a, b, c_gfpga);
