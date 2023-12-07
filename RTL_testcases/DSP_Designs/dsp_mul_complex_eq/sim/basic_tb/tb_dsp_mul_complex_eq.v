module tb_dsp_mul_complex_eq ();
 reg [15:0] a, b;
 wire [31:0] z, z1, z2;

 dsp_mul_complex_eq dut(a, b, z, z1, z2);
 
 initial begin
    a<=16'b0000001000000010;
    b<=16'b0000011000000010;
    #50
    $display("output for equation z: %0b, z1: %0b, z2: %0b ", z, z1, z2);
    a<=16'b0000111110000100;
    b<=16'b0000000000001000;
    #50
    $display("output for equation z: %0b, z1: %0b, z2: %0b ", z, z1, z2);
    a<=16'b0000101110001000;
    b<=16'b0000000000001000;
    #50
    $display("output for equation z: %0b, z1: %0b, z2: %0b ", z, z1, z2);
    a<=16'b0000100000001000;
    b<=16'b0001111000001000;
    #50
    $display("output for equation z: %0b, z1: %0b, z2: %0b ", z, z1, z2);
    a<=16'b0000100001101000;
    b<=16'b0000001000001000;
    #50
    $display("output for equation z: %0b, z1: %0b, z2: %0b ", z, z1, z2);
    a<=16'b1111111111111111;
    b<=16'b1111111111111111;
    #50
    $display("output for equation z: %0b, z1: %0b, z2: %0b ", z, z1, z2);
    a<=16'b1111111111111111;
    b<=16'b1111111000000000;
    #50
    $display("output for equation z: %0b, z1: %0b, z2: %0b ", z, z1, z2);

 end
 
endmodule

