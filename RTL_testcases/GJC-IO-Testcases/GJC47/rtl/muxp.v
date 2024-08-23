`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2024 06:07:29 PM
// Design Name: 
// Module Name: muxp
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


module muxp #(DWIDTH = 8,
              NUM_OF_BUS = 10)
    ( 
    input [DWIDTH*NUM_OF_BUS-1:0] d,
    input [NUM_OF_BUS-1:0] sel,
    output reg [DWIDTH-1:0] dout
    );
    
//integer i;
integer bit_index;

function integer clog2;
  input integer value;
  begin
    value = value-1;
    for (clog2=0; value>0; clog2=clog2+1)
      value = value>>1;
  end
endfunction

	// Count one to determine the number of DELAY in the design
    function integer bithigh_index (input [NUM_OF_BUS-1:0] in_vector);
    integer i;
    begin
        for (i = 0 ; i<NUM_OF_BUS ; i=i+1)
        begin
            if (in_vector[i] == 1'b1) begin
              bithigh_index = i;
            end // if
        end   // for loop
    end // function
    endfunction

generate
for (genvar i=0; i<NUM_OF_BUS; i=i+1) begin : GEN_MUX
// Generate the multiplexer based upon parameterized bus size
 if (NUM_OF_BUS == 1) begin :NO_MUX
    always @(*) 
     dout = d[DWIDTH-1:0];
 end else if (NUM_OF_BUS == 2) begin :MUX2to1
    always @(*) begin
      $display("time = %t, dout = 0x%0h, sel = 0x%0h", $time, dout, sel);
      case (1'b1)
          sel[0]: dout = d[DWIDTH-1:0];
          sel[1]: dout = d[((DWIDTH*2)-1):DWIDTH];
          default : dout = d[DWIDTH-1:0];
      endcase                     
    end
 end else if (NUM_OF_BUS == 3) begin : MUX3to1
    always @(*) begin
      case (1'b1)
        sel[0]: dout = d[DWIDTH-1:0];
        sel[1]: dout = d[((DWIDTH*2)-1):DWIDTH];
        sel[2]: dout = d[((DWIDTH*3)-1):DWIDTH*2];
        default : dout = d[DWIDTH-1:0];
      endcase
    end   
 end else if (NUM_OF_BUS == 4) begin : MUX4to1
    always @(*) begin
      case (1'b1)
        sel[0]: dout = d[DWIDTH-1:0];
        sel[1]: dout = d[((DWIDTH*2)-1):DWIDTH];
        sel[2]: dout = d[((DWIDTH*3)-1):DWIDTH*2];
        sel[3]: dout = d[((DWIDTH*4)-1):DWIDTH*3];
        default : dout = d[DWIDTH-1:0];
      endcase
    end    
 end else if (NUM_OF_BUS == 5) begin : MUX5to1
    always @(*) begin
        case (1'b1)
          sel[0]: dout = d[DWIDTH-1:0];
          sel[1]: dout = d[((DWIDTH*2)-1):DWIDTH];
          sel[2]: dout = d[((DWIDTH*3)-1):DWIDTH*2];
          sel[3]: dout = d[((DWIDTH*4)-1):DWIDTH*3];
          sel[4]: dout = d[((DWIDTH*5)-1):DWIDTH*4];
          default : dout = d[DWIDTH-1:0];
        endcase
    end 
 end else if (NUM_OF_BUS == 6) begin : MUX6to1
    always @(*) begin
        case (1'b1)
         sel[0]: dout = d[DWIDTH-1:0];
         sel[1]: dout = d[((DWIDTH*2)-1):DWIDTH];
         sel[2]: dout = d[((DWIDTH*3)-1):DWIDTH*2];
         sel[3]: dout = d[((DWIDTH*4)-1):DWIDTH*3];
         sel[4]: dout = d[((DWIDTH*5)-1):DWIDTH*4];
         sel[5]: dout = d[((DWIDTH*6)-1):DWIDTH*5];
         default : dout = d[DWIDTH-1:0];
        endcase
    end
 end else if (NUM_OF_BUS == 7) begin : MUX7to1
    always @(*) begin
        case (1'b1)
         sel[0]: dout = d[DWIDTH-1:0];
         sel[1]: dout = d[((DWIDTH*2)-1):DWIDTH];
         sel[2]: dout = d[((DWIDTH*3)-1):DWIDTH*2];
         sel[3]: dout = d[((DWIDTH*4)-1):DWIDTH*3];
         sel[4]: dout = d[((DWIDTH*5)-1):DWIDTH*4];
         sel[5]: dout = d[((DWIDTH*6)-1):DWIDTH*5];
         sel[6]: dout = d[((DWIDTH*7)-1):DWIDTH*6];
         default : dout = d[DWIDTH-1:0];
        endcase
    end
 end else if (NUM_OF_BUS == 8) begin : MUX8to1
    always @(*) begin
        case (1'b1)
         sel[0]: dout = d[DWIDTH-1:0];
         sel[1]: dout = d[((DWIDTH*2)-1):DWIDTH];
         sel[2]: dout = d[((DWIDTH*3)-1):DWIDTH*2];
         sel[3]: dout = d[((DWIDTH*4)-1):DWIDTH*3];
         sel[4]: dout = d[((DWIDTH*5)-1):DWIDTH*4];
         sel[5]: dout = d[((DWIDTH*6)-1):DWIDTH*5];
         sel[6]: dout = d[((DWIDTH*7)-1):DWIDTH*6];
         sel[7]: dout = d[((DWIDTH*8)-1):DWIDTH*7];
         default : dout = d[DWIDTH-1:0];
        endcase
    end
 end else if (NUM_OF_BUS == 9) begin :MUX9to1
    always @(*) begin
        case (1'b1)
         sel[0]: dout = d[DWIDTH-1:0];
         sel[1]: dout = d[((DWIDTH*2)-1):DWIDTH];
         sel[2]: dout = d[((DWIDTH*3)-1):DWIDTH*2];
         sel[3]: dout = d[((DWIDTH*4)-1):DWIDTH*3];
         sel[4]: dout = d[((DWIDTH*5)-1):DWIDTH*4];
         sel[5]: dout = d[((DWIDTH*6)-1):DWIDTH*5];
         sel[6]: dout = d[((DWIDTH*7)-1):DWIDTH*6];
         sel[7]: dout = d[((DWIDTH*8)-1):DWIDTH*7];
         sel[8]: dout = d[((DWIDTH*9)-1):DWIDTH*8];
         default : dout = d[DWIDTH-1:0];
        endcase
    end
 end else if (NUM_OF_BUS == 10) begin : MUX10to1
    always @(*) begin
        //   $display("time_10 = %t, d[DWIDTH-1:0] = 0x%0h, bus_int9 = 0x%0h", $time, d[DWIDTH-1:0], bus_int9);
        case (1'b1)
         sel[0]: dout = d[DWIDTH-1:0];
         sel[1]: dout = d[((DWIDTH*2)-1):DWIDTH];
         sel[2]: dout = d[((DWIDTH*3)-1):DWIDTH*2];
         sel[3]: dout = d[((DWIDTH*4)-1):DWIDTH*3];
         sel[4]: dout = d[((DWIDTH*5)-1):DWIDTH*4];
         sel[5]: dout = d[((DWIDTH*6)-1):DWIDTH*5];
         sel[6]: dout = d[((DWIDTH*7)-1):DWIDTH*6];
         sel[7]: dout = d[((DWIDTH*8)-1):DWIDTH*7];
         sel[8]: dout = d[((DWIDTH*9)-1):DWIDTH*8];
         sel[9]: dout = d[((DWIDTH*10)-1):DWIDTH*9];
         default : dout = d[DWIDTH-1:0];
        endcase
    end
 end else if (NUM_OF_BUS == 11) begin : MUX11to_1
    always @(*) begin
        case (1'b1)
         sel[0]: dout = d[DWIDTH-1:0];                 
         sel[1]: dout = d[((DWIDTH*2)-1):DWIDTH];      
         sel[2]: dout = d[((DWIDTH*3)-1):DWIDTH*2];    
         sel[3]: dout = d[((DWIDTH*4)-1):DWIDTH*3];    
         sel[4]: dout = d[((DWIDTH*5)-1):DWIDTH*4];    
         sel[5]: dout = d[((DWIDTH*6)-1):DWIDTH*5];    
         sel[6]: dout = d[((DWIDTH*7)-1):DWIDTH*6];    
         sel[7]: dout = d[((DWIDTH*8)-1):DWIDTH*7];    
         sel[8]: dout = d[((DWIDTH*9)-1):DWIDTH*8];    
         sel[9]: dout = d[((DWIDTH*10)-1):DWIDTH*9];   
         sel[10]: dout = d[((DWIDTH*11)-1):DWIDTH*10];
         default : dout = d[DWIDTH-1:0];
        endcase
    end
 end else if (NUM_OF_BUS == 12) begin : MUX12to1
    always @(*) begin
        case (1'b1)
         sel[0]: dout = d[DWIDTH-1:0];
         sel[1]: dout = d[((DWIDTH*2)-1):DWIDTH];
         sel[2]: dout = d[((DWIDTH*3)-1):DWIDTH*2];
         sel[3]: dout = d[((DWIDTH*4)-1):DWIDTH*3];
         sel[4]: dout = d[((DWIDTH*5)-1):DWIDTH*4];
         sel[5]: dout = d[((DWIDTH*6)-1):DWIDTH*5];
         sel[6]: dout = d[((DWIDTH*7)-1):DWIDTH*6];
         sel[7]: dout = d[((DWIDTH*8)-1):DWIDTH*7];
         sel[8]: dout = d[((DWIDTH*9)-1):DWIDTH*8];
         sel[9]: dout = d[((DWIDTH*10)-1):DWIDTH*9];
         sel[10]: dout = d[((DWIDTH*11)-1):DWIDTH*10];
         sel[11]: dout = d[((DWIDTH*12)-1):DWIDTH*11];
         default : dout = d[DWIDTH-1:0];
        endcase
    end
 end else if (NUM_OF_BUS == 13) begin : MUX13to1
    always @(*) begin
        case (1'b1)
         sel[0]: dout = d[DWIDTH-1:0];
         sel[1]: dout = d[((DWIDTH*2)-1):DWIDTH];
         sel[2]: dout = d[((DWIDTH*3)-1):DWIDTH*2];
         sel[3]: dout = d[((DWIDTH*4)-1):DWIDTH*3];
         sel[4]: dout = d[((DWIDTH*5)-1):DWIDTH*4];
         sel[5]: dout = d[((DWIDTH*6)-1):DWIDTH*5];
         sel[6]: dout = d[((DWIDTH*7)-1):DWIDTH*6];
         sel[7]: dout = d[((DWIDTH*8)-1):DWIDTH*7];
         sel[8]: dout = d[((DWIDTH*9)-1):DWIDTH*8];
         sel[9]: dout = d[((DWIDTH*10)-1):DWIDTH*9];
         sel[10]: dout = d[((DWIDTH*11)-1):DWIDTH*10];
         sel[11]: dout = d[((DWIDTH*12)-1):DWIDTH*11];
         sel[12]: dout = d[((DWIDTH*13)-1):DWIDTH*12];             
         default : dout = d[DWIDTH-1:0];
        endcase
    end
 end else if (NUM_OF_BUS == 14) begin : MUX14to1
    always @(*) begin
        case (1'b1)
            sel[0]: dout = d[DWIDTH-1:0];
            sel[1]: dout = d[((DWIDTH*2)-1):DWIDTH];
            sel[2]: dout = d[((DWIDTH*3)-1):DWIDTH*2];
            sel[3]: dout = d[((DWIDTH*4)-1):DWIDTH*3];
            sel[4]: dout = d[((DWIDTH*5)-1):DWIDTH*4];
            sel[5]: dout = d[((DWIDTH*6)-1):DWIDTH*5];
            sel[6]: dout = d[((DWIDTH*7)-1):DWIDTH*6];
            sel[7]: dout = d[((DWIDTH*8)-1):DWIDTH*7];
            sel[8]: dout = d[((DWIDTH*9)-1):DWIDTH*8];
            sel[9]: dout = d[((DWIDTH*10)-1):DWIDTH*9];
            sel[10]: dout = d[((DWIDTH*11)-1):DWIDTH*10];
            sel[11]: dout = d[((DWIDTH*12)-1):DWIDTH*11];
            sel[12]: dout = d[((DWIDTH*13)-1):DWIDTH*12];  
            sel[13]: dout = d[((DWIDTH*14)-1):DWIDTH*13];             
            default : dout = d[DWIDTH-1:0];
           endcase
       end
 end else if (NUM_OF_BUS == 15) begin : MUX15to1
    always @(*) begin
        case (1'b1)
            sel[0]: dout = d[DWIDTH-1:0]; 
            sel[1]: dout = d[((DWIDTH*2)-1):DWIDTH]; 
            sel[2]: dout = d[((DWIDTH*3)-1):DWIDTH*2]; 
            sel[3]: dout = d[((DWIDTH*4)-1):DWIDTH*3]; 
            sel[4]: dout = d[((DWIDTH*5)-1):DWIDTH*4]; 
            sel[5]: dout = d[((DWIDTH*6)-1):DWIDTH*5]; 
            sel[6]: dout = d[((DWIDTH*7)-1):DWIDTH*6]; 
            sel[7]: dout = d[((DWIDTH*8)-1):DWIDTH*7]; 
            sel[8]: dout = d[((DWIDTH*9)-1):DWIDTH*8]; 
            sel[9]: dout = d[((DWIDTH*10)-1):DWIDTH*9];  
            sel[10]: dout = d[((DWIDTH*11)-1):DWIDTH*10];
            sel[11]: dout = d[((DWIDTH*12)-1):DWIDTH*11];
            sel[12]: dout = d[((DWIDTH*13)-1):DWIDTH*12];  
            sel[13]: dout = d[((DWIDTH*14)-1):DWIDTH*13];       
            sel[14]: dout = d[((DWIDTH*15)-1):DWIDTH*14];                       
            default :dout = d[DWIDTH-1:0];
           endcase
       end     
 end else if (NUM_OF_BUS == 16) begin : MUX16to1
    always @(*) begin
        case (1'b1)
         sel[0]: dout = d[DWIDTH-1:0];
         sel[1]: dout = d[((DWIDTH*2)-1):DWIDTH];
         sel[2]: dout = d[((DWIDTH*3)-1):DWIDTH*2];
         sel[3]: dout = d[((DWIDTH*4)-1):DWIDTH*3];
         sel[4]: dout = d[((DWIDTH*5)-1):DWIDTH*4];
         sel[5]: dout = d[((DWIDTH*6)-1):DWIDTH*5];
         sel[6]: dout = d[((DWIDTH*7)-1):DWIDTH*6];
         sel[7]: dout = d[((DWIDTH*8)-1):DWIDTH*7];
         sel[8]: dout = d[((DWIDTH*9)-1):DWIDTH*8];
         sel[9]: dout = d[((DWIDTH*10)-1):DWIDTH*9];
         sel[10]: dout = d[((DWIDTH*11)-1):DWIDTH*10];
         sel[11]: dout = d[((DWIDTH*12)-1):DWIDTH*11];
         sel[12]: dout = d[((DWIDTH*13)-1):DWIDTH*12];  
         sel[13]: dout = d[((DWIDTH*14)-1):DWIDTH*13];       
         sel[14]: dout = d[((DWIDTH*15)-1):DWIDTH*14]; 
         sel[15]: dout = d[((DWIDTH*16)-1):DWIDTH*15];                                   
         default : dout = d[DWIDTH-1:0];
        endcase
    end
 end else if (NUM_OF_BUS == 17) begin : MUX17to1
    always @(*) begin
        case (1'b1)
         sel[0]: dout = d[DWIDTH-1:0];
         sel[1]: dout = d[((DWIDTH*2)-1):DWIDTH];
         sel[2]: dout = d[((DWIDTH*3)-1):DWIDTH*2];
         sel[3]: dout = d[((DWIDTH*4)-1):DWIDTH*3];
         sel[4]: dout = d[((DWIDTH*5)-1):DWIDTH*4];
         sel[5]: dout = d[((DWIDTH*6)-1):DWIDTH*5];
         sel[6]: dout = d[((DWIDTH*7)-1):DWIDTH*6];
         sel[7]: dout = d[((DWIDTH*8)-1):DWIDTH*7];
         sel[8]: dout = d[((DWIDTH*9)-1):DWIDTH*8];
         sel[9]: dout = d[((DWIDTH*10)-1):DWIDTH*9];
         sel[10]: dout = d[((DWIDTH*11)-1):DWIDTH*10];
         sel[11]: dout = d[((DWIDTH*12)-1):DWIDTH*11];
         sel[12]: dout = d[((DWIDTH*13)-1):DWIDTH*12];  
         sel[13]: dout = d[((DWIDTH*14)-1):DWIDTH*13];       
         sel[14]: dout = d[((DWIDTH*15)-1):DWIDTH*14];   
         sel[15]: dout = d[((DWIDTH*16)-1):DWIDTH*15];  
         sel[16]: dout = d[((DWIDTH*17)-1):DWIDTH*16];                                                   
         default : dout = d[DWIDTH-1:0];
        endcase
       end          
 end else if (NUM_OF_BUS == 18) begin :MUX18to1
    always @(*) begin
        case (1'b1)
         sel[0]: dout = d[DWIDTH-1:0];
         sel[1]: dout = d[((DWIDTH*2)-1):DWIDTH];
         sel[2]: dout = d[((DWIDTH*3)-1):DWIDTH*2];
         sel[3]: dout = d[((DWIDTH*4)-1):DWIDTH*3];
         sel[4]: dout = d[((DWIDTH*5)-1):DWIDTH*4];
         sel[5]: dout = d[((DWIDTH*6)-1):DWIDTH*5];
         sel[6]: dout = d[((DWIDTH*7)-1):DWIDTH*6];
         sel[7]: dout = d[((DWIDTH*8)-1):DWIDTH*7];
         sel[8]: dout = d[((DWIDTH*9)-1):DWIDTH*8];
         sel[9]: dout = d[((DWIDTH*10)-1):DWIDTH*9];
         sel[10]: dout = d[((DWIDTH*11)-1):DWIDTH*10];
         sel[11]: dout = d[((DWIDTH*12)-1):DWIDTH*11];
         sel[12]: dout = d[((DWIDTH*13)-1):DWIDTH*12];  
         sel[13]: dout = d[((DWIDTH*14)-1):DWIDTH*13];       
         sel[14]: dout = d[((DWIDTH*15)-1):DWIDTH*14];   
         sel[15]: dout = d[((DWIDTH*16)-1):DWIDTH*15]; 
         sel[16]: dout = d[((DWIDTH*17)-1):DWIDTH*16];   
         sel[17]: dout = d[((DWIDTH*18)-1):DWIDTH*17];                                                    
         default : dout = d[DWIDTH-1:0];
        endcase
    end        
 end else if (NUM_OF_BUS == 19) begin : MUX19to1
    always @(*) begin
        case (1'b1)
         sel[0]: dout = d[DWIDTH-1:0];
         sel[1]: dout = d[((DWIDTH*2)-1):DWIDTH];
         sel[2]: dout = d[((DWIDTH*3)-1):DWIDTH*2];
         sel[3]: dout = d[((DWIDTH*4)-1):DWIDTH*3];
         sel[4]: dout = d[((DWIDTH*5)-1):DWIDTH*4];
         sel[5]: dout = d[((DWIDTH*6)-1):DWIDTH*5];
         sel[6]: dout = d[((DWIDTH*7)-1):DWIDTH*6];
         sel[7]: dout = d[((DWIDTH*8)-1):DWIDTH*7];
         sel[8]: dout = d[((DWIDTH*9)-1):DWIDTH*8];
         sel[9]: dout = d[((DWIDTH*10)-1):DWIDTH*9];
         sel[10]: dout = d[((DWIDTH*11)-1):DWIDTH*10];
         sel[11]: dout = d[((DWIDTH*12)-1):DWIDTH*11];
         sel[12]: dout = d[((DWIDTH*13)-1):DWIDTH*12];  
         sel[13]: dout = d[((DWIDTH*14)-1):DWIDTH*13];       
         sel[14]: dout = d[((DWIDTH*15)-1):DWIDTH*14];   
         sel[15]: dout = d[((DWIDTH*16)-1):DWIDTH*15]; 
         sel[16]: dout = d[((DWIDTH*17)-1):DWIDTH*16];   
         sel[17]: dout = d[((DWIDTH*18)-1):DWIDTH*17];
         sel[18]: dout = d[((DWIDTH*19)-1):DWIDTH*18];                                                                  
         default : dout = d[DWIDTH-1:0];
        endcase
    end        
 end else if (NUM_OF_BUS == 20) begin : MUX20to1
    always @(*) begin
        case (1'b1)
         sel[0]: dout = d[DWIDTH-1:0];
         sel[1]: dout = d[((DWIDTH*2)-1):DWIDTH];
         sel[2]: dout = d[((DWIDTH*3)-1):DWIDTH*2];
         sel[3]: dout = d[((DWIDTH*4)-1):DWIDTH*3];
         sel[4]: dout = d[((DWIDTH*5)-1):DWIDTH*4];
         sel[5]: dout = d[((DWIDTH*6)-1):DWIDTH*5];
         sel[6]: dout = d[((DWIDTH*7)-1):DWIDTH*6];
         sel[7]: dout = d[((DWIDTH*8)-1):DWIDTH*7];
         sel[8]: dout = d[((DWIDTH*9)-1):DWIDTH*8];
         sel[9]: dout = d[((DWIDTH*10)-1):DWIDTH*9];
         sel[10]: dout = d[((DWIDTH*11)-1):DWIDTH*10];
         sel[11]: dout = d[((DWIDTH*12)-1):DWIDTH*11];
         sel[12]: dout = d[((DWIDTH*13)-1):DWIDTH*12];  
         sel[13]: dout = d[((DWIDTH*14)-1):DWIDTH*13];       
         sel[14]: dout = d[((DWIDTH*15)-1):DWIDTH*14];   
         sel[15]: dout = d[((DWIDTH*16)-1):DWIDTH*15]; 
         sel[16]: dout = d[((DWIDTH*17)-1):DWIDTH*16];   
         sel[17]: dout = d[((DWIDTH*18)-1):DWIDTH*17];
         sel[18]: dout = d[((DWIDTH*19)-1):DWIDTH*18];     
         sel[19]: dout = d[((DWIDTH*20)-1):DWIDTH*19];                                                                         
         default : dout = d[DWIDTH-1:0];
        endcase
    end        
end 
end                                     
endgenerate

always @(*) begin
    bit_index = bithigh_index(sel);
    $display("bit_index = %0d, sel = 0x%0h", bit_index, sel);
end
endmodule
