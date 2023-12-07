`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/13/2023 11:02:45 AM
// Design Name: 
// Module Name: aes_shift_register_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module aes_shift_register_top(
  input		clk, rst,
  input		ld,
  output		done,
  input	        key,
  input	        text_in, 
  output        text_out
);
    
  reg   [6:0]   cnt = {7{1'b1}};
  reg	[127:0]	key_reg = {128{1'b0}};
  reg	[127:0]	text_in_reg = {128{1'b0}};
  reg	[127:0]	text_out_reg = {128{1'b0}};
  wire	[127:0]	text_out_wire;
    
  always @(posedge clk)
    if (ld)
       cnt <= {7{1'b0}};
    else if (cnt != 7'b1111111)
       cnt <= cnt + 1'b1;
  
  always @(posedge clk) 
    if (cnt != 7'b1111111)begin
      key_reg <= {key_reg[126:0], key};
      text_in_reg <= {text_in_reg[126:0], text_in};
    end
  
  always @(posedge clk)
    if (ld)
      text_out_reg <= text_out_wire;
    else if (cnt != 7'b1111111)
      text_out_reg <= {text_out_reg[126:0], 1'b0};
      
  assign text_out = text_out_reg[127];
 
  aes_cipher_top aes_cipher_top_inst(
     .clk(clk), 
     .rst(rst), 
     .ld(ld), 
     .done(done), 
     .key(key_reg), 
     .text_in(text_in_reg), 
     .text_out(text_out_wire)
   );
    
endmodule
