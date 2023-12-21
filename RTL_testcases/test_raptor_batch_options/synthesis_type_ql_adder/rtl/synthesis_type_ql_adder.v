module FA(output sum, cout, input a, b, cin);
  wire w0, w1, w2;
  
  xor #(2) (w0, a, b);
  xor #(2) (sum, w0, cin);
  
  and #(1) (w1, w0, cin);
  and #(1) (w2, a, b);
  or #(1) (cout, w1, w2);
endmodule


// Ripple Carry Adder with cin - 4 bits
module synthesis_type_ql_adder(output [3:0] sum, output cout, input [3:0] a, b, input cin);
  
  wire [3:1] c;
  
  FA fa0(sum[0], c[1], a[0], b[0], cin);
  FA fa[2:1](sum[2:1], c[3:2], a[2:1], b[2:1], c[2:1]);
  FA fa31(sum[3], cout, a[3], b[3], c[3]);
  
endmodule

