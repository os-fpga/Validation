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


module one2x_decoder #(parameter DWIDTH = 1,
             parameter NUM_OF_OBUS = 4)
    ( 
    input [DWIDTH-1:0] din,    
    input [20 - 1:0] sel,      
    output reg [(DWIDTH*20)-1:0] dout
    );
    
always @(*) begin
  dout = 'h0;
    case (1'b1)
        sel[0]:     dout [DWIDTH-1:0]= din;
        sel[1]:     dout [((DWIDTH*2)-1):DWIDTH]= din;
        sel[2]:     dout [((DWIDTH*3)-1):DWIDTH*2]= din;
        sel[3]:     dout [((DWIDTH*4)-1):DWIDTH*3]= din;
        sel[4]:     dout [((DWIDTH*5)-1):DWIDTH*4]= din;
        sel[5]:     dout [((DWIDTH*6)-1):DWIDTH*5]= din;
        sel[6]:     dout [((DWIDTH*7)-1):DWIDTH*6]= din;
        sel[7]:     dout [((DWIDTH*8)-1):DWIDTH*7]= din;
        sel[8]:     dout [((DWIDTH*9)-1):DWIDTH*8]= din; 
        sel[9]:     dout [((DWIDTH*10)-1):DWIDTH*9]= din;
        sel[10]:    dout [((DWIDTH*11)-1):DWIDTH*10]= din;
        sel[11]:    dout [((DWIDTH*12)-1):DWIDTH*11]= din;
        sel[12]:    dout [((DWIDTH*13)-1):DWIDTH*12]= din;
        sel[13]:    dout [((DWIDTH*14)-1):DWIDTH*13]= din;
        sel[14]:    dout [((DWIDTH*15)-1):DWIDTH*14]= din;
        sel[15]:    dout [((DWIDTH*16)-1):DWIDTH*15]= din;
        sel[16]:    dout [((DWIDTH*17)-1):DWIDTH*16]= din;
        sel[17]:    dout [((DWIDTH*18)-1):DWIDTH*17]= din;
        sel[18]:    dout [((DWIDTH*19)-1):DWIDTH*18]= din;
        sel[19]:    dout [((DWIDTH*20)-1):DWIDTH*19]= din;
        default: dout [DWIDTH-1:0]= din;
    endcase
    
end





// integer i;

/*
function integer clog2;
  input integer value;
  begin
    value = value-1;
    for (clog2=0; value>0; clog2=clog2+1)
      value = value>>1;
  end
endfunction

	// Count one to determine the number of DELAY in the design
    function integer bithigh_index (input [NUM_OF_OBUS-1:0] in_vector);
    //function integer bithigh_index (input [NUM_OF_OBUS-1:0] in_vector);
    integer i;
    begin
        for (i = 0 ; i<NUM_OF_OBUS ; i=i+1)
        begin
            if (in_vector[i] == 1'b1) begin
              bithigh_index = i;
            end // if
        end   // for loop
    end // function
    endfunction
*/


// generate
// for (genvar i=0; i<NUM_OF_OBUS; i=i+1) begin : GEN_BUS
//  if (NUM_OF_OBUS == 1) begin            
//     always @(*) begin    
//       dout[DWIDTH-1:0] = din;                                                                                                
//     end                                          
//  end else if (NUM_OF_OBUS == 2) begin
//     always @(*) begin
//       dout = 'h0;
//       case (1'b1)
//           sel[0]:   dout[DWIDTH-1:0]            = din;
//           sel[1]:   dout[((DWIDTH*2)-1):DWIDTH] = din;
//           default : dout[DWIDTH-1:0]            = din;
//       endcase                     
//     end
//  end else if (NUM_OF_OBUS == 3) begin
//     always @(*) begin
//       dout = 'h0; 
//       case (1'b1)
//         sel[0]: dout[DWIDTH-1:0]              = din;
//         sel[1]: dout[((DWIDTH*2)-1):DWIDTH]   = din;
//         sel[2]: dout[((DWIDTH*3)-1):DWIDTH*2] = din;
//         default : dout [DWIDTH-1:0]= din;
//       endcase
//     end   
//  end else if (NUM_OF_OBUS == 4) begin
//     always @(*) begin
//       dout = 'h0;    
//       $display("time_10 = %t, din[DWIDTH-1:0] = 0x%0h", $time, din[DWIDTH-1:0]);
//       case (1'b1)
//         sel[0]: dout[DWIDTH-1:0]               = din;             
//         sel[1]: dout[((DWIDTH*2)-1):DWIDTH]    = din;  
//         sel[2]: dout[((DWIDTH*3)-1):DWIDTH*2]  = din;
//         sel[3]: dout[((DWIDTH*4)-1):DWIDTH*3]  = din;
//         default : dout [DWIDTH-1:0]= din;
//       endcase
//     end    
//  end else if (NUM_OF_OBUS == 5) begin
//     always @(*) begin
//         dout = 'h0;    
//         case (1'b1)
//           sel[0]: dout [DWIDTH-1:0]= din;             
//           sel[1]: dout [((DWIDTH*2)-1):DWIDTH] = din;  
//           sel[2]: dout [((DWIDTH*3)-1):DWIDTH*2] = din;
//           sel[3]: dout [((DWIDTH*4)-1):DWIDTH*3] = din;
//           sel[4]: dout [((DWIDTH*5)-1):DWIDTH*4] = din;
//           default : dout [DWIDTH-1:0]= din;
//         endcase
//     end 
//  end else if (NUM_OF_OBUS == 6) begin
//     always @(*) begin
//         dout = 'h0;    
//         case (1'b1)
//          sel[0]: dout [DWIDTH-1:0]= din;              
//          sel[1]: dout [((DWIDTH*2)-1):DWIDTH]= din;   
//          sel[2]: dout [((DWIDTH*3)-1):DWIDTH*2]= din; 
//          sel[3]: dout [((DWIDTH*4)-1):DWIDTH*3]= din; 
//          sel[4]: dout [((DWIDTH*5)-1):DWIDTH*4]= din; 
//          sel[5]: dout [((DWIDTH*6)-1):DWIDTH*5]= din; 
//          default : dout [DWIDTH-1:0]= din;
//         endcase
//     end
//  end else if (NUM_OF_OBUS == 7) begin
//     always @(*) begin
//         dout = 'h0;
//         case (1'b1)
//          sel[0]: dout [DWIDTH-1:0]= din;             
//          sel[1]: dout [((DWIDTH*2)-1):DWIDTH]= din;  
//          sel[2]: dout [((DWIDTH*3)-1):DWIDTH*2]= din;
//          sel[3]: dout [((DWIDTH*4)-1):DWIDTH*3]= din;
//          sel[4]: dout [((DWIDTH*5)-1):DWIDTH*4]= din;
//          sel[5]: dout [((DWIDTH*6)-1):DWIDTH*5]= din;
//          sel[6]: dout [((DWIDTH*7)-1):DWIDTH*6]= din;
//          default : dout [DWIDTH-1:0]= din;
//         endcase
//     end
//  end else if (NUM_OF_OBUS == 8) begin
//     always @(*) begin
//         dout = 'h0;
//         case (1'b1)
//          sel[0]: dout [DWIDTH-1:0]= din;             
//          sel[1]: dout [((DWIDTH*2)-1):DWIDTH]= din;  
//          sel[2]: dout [((DWIDTH*3)-1):DWIDTH*2]= din;
//          sel[3]: dout [((DWIDTH*4)-1):DWIDTH*3]= din;
//          sel[4]: dout [((DWIDTH*5)-1):DWIDTH*4]= din;
//          sel[5]: dout [((DWIDTH*6)-1):DWIDTH*5]= din;
//          sel[6]: dout [((DWIDTH*7)-1):DWIDTH*6]= din;
//          sel[7]: dout [((DWIDTH*8)-1):DWIDTH*7]= din;
//          default : dout [DWIDTH-1:0]= din;
//         endcase
//     end
//  end else if (NUM_OF_OBUS == 9) begin
//     always @(*) begin
//         dout = 'h0;    
//         case (1'b1)
//          sel[0]: dout [DWIDTH-1:0]= din;             
//          sel[1]: dout [((DWIDTH*2)-1):DWIDTH]= din;  
//          sel[2]: dout [((DWIDTH*3)-1):DWIDTH*2]= din;
//          sel[3]: dout [((DWIDTH*4)-1):DWIDTH*3]= din;
//          sel[4]: dout [((DWIDTH*5)-1):DWIDTH*4]= din;
//          sel[5]: dout [((DWIDTH*6)-1):DWIDTH*5]= din;
//          sel[6]: dout [((DWIDTH*7)-1):DWIDTH*6]= din;
//          sel[7]: dout [((DWIDTH*8)-1):DWIDTH*7]= din;
//          sel[8]: dout [((DWIDTH*9)-1):DWIDTH*8]= din;
//          default : dout [DWIDTH-1:0]= din;
//         endcase
//     end
//  end else if (NUM_OF_OBUS == 10) begin
//     always @(*) begin
//         dout = 'h0;           
//         case (1'b1)
//          sel[0]: dout [DWIDTH-1:0]= din;               
//          sel[1]: dout [((DWIDTH*2)-1):DWIDTH]= din;    
//          sel[2]: dout [((DWIDTH*3)-1):DWIDTH*2]= din;  
//          sel[3]: dout [((DWIDTH*4)-1):DWIDTH*3]= din;  
//          sel[4]: dout [((DWIDTH*5)-1):DWIDTH*4]= din;  
//          sel[5]: dout [((DWIDTH*6)-1):DWIDTH*5]= din;  
//          sel[6]: dout [((DWIDTH*7)-1):DWIDTH*6]= din;  
//          sel[7]: dout [((DWIDTH*8)-1):DWIDTH*7]= din;  
//          sel[8]: dout [((DWIDTH*9)-1):DWIDTH*8]= din;  
//          sel[9]: dout [((DWIDTH*10)-1):DWIDTH*9]= din; 
//          default : dout [DWIDTH-1:0]= din;
//         endcase
//     end
//  end else if (NUM_OF_OBUS == 11) begin
//     always @(*) begin
//         dout = 'h0;      
//         case (1'b1)
//          sel[0]: dout [DWIDTH-1:0]= din;                 
//          sel[1]: dout [((DWIDTH*2)-1):DWIDTH]= din;      
//          sel[2]: dout [((DWIDTH*3)-1):DWIDTH*2]= din;    
//          sel[3]: dout [((DWIDTH*4)-1):DWIDTH*3]= din;    
//          sel[4]: dout [((DWIDTH*5)-1):DWIDTH*4]= din;    
//          sel[5]: dout [((DWIDTH*6)-1):DWIDTH*5]= din;    
//          sel[6]: dout [((DWIDTH*7)-1):DWIDTH*6]= din;    
//          sel[7]: dout [((DWIDTH*8)-1):DWIDTH*7]= din;    
//          sel[8]: dout [((DWIDTH*9)-1):DWIDTH*8]= din;    
//          sel[9]: dout [((DWIDTH*10)-1):DWIDTH*9]= din;   
//          sel[10]: dout [((DWIDTH*11)-1):DWIDTH*10]= din; 
//          default : dout [DWIDTH-1:0]= din;
//         endcase
//     end
//  end else if (NUM_OF_OBUS == 12) begin
//     always @(*) begin
//         dout = 'h0;      
//         case (1'b1)
//          sel[0]: dout [DWIDTH-1:0]= din;                
//          sel[1]: dout [((DWIDTH*2)-1):DWIDTH]= din;     
//          sel[2]: dout [((DWIDTH*3)-1):DWIDTH*2]= din;   
//          sel[3]: dout [((DWIDTH*4)-1):DWIDTH*3]= din;   
//          sel[4]: dout [((DWIDTH*5)-1):DWIDTH*4]= din;   
//          sel[5]: dout [((DWIDTH*6)-1):DWIDTH*5]= din;   
//          sel[6]: dout [((DWIDTH*7)-1):DWIDTH*6]= din;   
//          sel[7]: dout [((DWIDTH*8)-1):DWIDTH*7]= din;   
//          sel[8]: dout [((DWIDTH*9)-1):DWIDTH*8]= din;   
//          sel[9]: dout [((DWIDTH*10)-1):DWIDTH*9]= din;  
//          sel[10]: dout [((DWIDTH*11)-1):DWIDTH*10]= din;
//          sel[11]: dout [((DWIDTH*12)-1):DWIDTH*11]= din;
//          default : dout [DWIDTH-1:0]= din;
//         endcase
//     end
//  end else if (NUM_OF_OBUS == 13) begin
//     always @(*) begin
//         dout = 'h0;      
//         case (1'b1)
//          sel[0]: dout [DWIDTH-1:0]= din;               
//          sel[1]: dout [((DWIDTH*2)-1):DWIDTH]= din;    
//          sel[2]: dout [((DWIDTH*3)-1):DWIDTH*2]= din;  
//          sel[3]: dout [((DWIDTH*4)-1):DWIDTH*3]= din;  
//          sel[4]: dout [((DWIDTH*5)-1):DWIDTH*4]= din;  
//          sel[5]: dout [((DWIDTH*6)-1):DWIDTH*5]= din;  
//          sel[6]: dout [((DWIDTH*7)-1):DWIDTH*6]= din;  
//          sel[7]: dout [((DWIDTH*8)-1):DWIDTH*7]= din;  
//          sel[8]: dout [((DWIDTH*9)-1):DWIDTH*8]= din;  
//          sel[9]: dout [((DWIDTH*10)-1):DWIDTH*9]= din; 
//          sel[10]: dout [((DWIDTH*11)-1):DWIDTH*10]= din;
//          sel[11]: dout [((DWIDTH*12)-1):DWIDTH*11]= din;
//          sel[12]: dout [((DWIDTH*13)-1):DWIDTH*12]= din;            
//          default : dout [DWIDTH-1:0]= din;
//         endcase
//     end
//  end else if (NUM_OF_OBUS == 14) begin
//     always @(*) begin
//         dout = 'h0;      
//         case (1'b1)
//             sel[0]: dout [DWIDTH-1:0]= din;                 
//             sel[1]: dout [((DWIDTH*2)-1):DWIDTH]= din;      
//             sel[2]: dout [((DWIDTH*3)-1):DWIDTH*2]= din;    
//             sel[3]: dout [((DWIDTH*4)-1):DWIDTH*3]= din;    
//             sel[4]: dout [((DWIDTH*5)-1):DWIDTH*4]= din;    
//             sel[5]: dout [((DWIDTH*6)-1):DWIDTH*5]= din;    
//             sel[6]: dout [((DWIDTH*7)-1):DWIDTH*6]= din;    
//             sel[7]: dout [((DWIDTH*8)-1):DWIDTH*7]= din;    
//             sel[8]: dout [((DWIDTH*9)-1):DWIDTH*8]= din;    
//             sel[9]: dout [((DWIDTH*10)-1):DWIDTH*9]= din;   
//             sel[10]: dout [((DWIDTH*11)-1):DWIDTH*10]= din; 
//             sel[11]: dout [((DWIDTH*12)-1):DWIDTH*11]= din; 
//             sel[12]: dout [((DWIDTH*13)-1):DWIDTH*12]= din;   
//             sel[13]: dout [((DWIDTH*14)-1):DWIDTH*13]= din;              
//             default : dout [DWIDTH-1:0]= din;
//            endcase
//        end
//  end else if (NUM_OF_OBUS == 15) begin
//     always @(*) begin
//         dout = 'h0;     
//         case (1'b1)
//             sel[0]: dout [DWIDTH-1:0]= din;                
//             sel[1]: dout [((DWIDTH*2)-1):DWIDTH]= din;     
//             sel[2]: dout [((DWIDTH*3)-1):DWIDTH*2]= din;   
//             sel[3]: dout [((DWIDTH*4)-1):DWIDTH*3]= din;   
//             sel[4]: dout [((DWIDTH*5)-1):DWIDTH*4]= din;   
//             sel[5]: dout [((DWIDTH*6)-1):DWIDTH*5]= din;   
//             sel[6]: dout [((DWIDTH*7)-1):DWIDTH*6]= din;   
//             sel[7]: dout [((DWIDTH*8)-1):DWIDTH*7]= din;   
//             sel[8]: dout [((DWIDTH*9)-1):DWIDTH*8]= din;   
//             sel[9]: dout [((DWIDTH*10)-1):DWIDTH*9]= din;  
//             sel[10]: dout [((DWIDTH*11)-1):DWIDTH*10]= din;
//             sel[11]: dout [((DWIDTH*12)-1):DWIDTH*11]= din;
//             sel[12]: dout [((DWIDTH*13)-1):DWIDTH*12]= din;  
//             sel[13]: dout [((DWIDTH*14)-1):DWIDTH*13]= din;       
//             sel[14]: dout [((DWIDTH*15)-1):DWIDTH*14]= din;                       
//             default :dout [DWIDTH-1:0]= din;
//            endcase
//        end     
//  end else if (NUM_OF_OBUS == 16) begin
//     always @(*) begin
//         dout = 'h0;     
//         case (1'b1)
//          sel[0]: dout [DWIDTH-1:0]= din;                
//          sel[1]: dout [((DWIDTH*2)-1):DWIDTH]= din;     
//          sel[2]: dout [((DWIDTH*3)-1):DWIDTH*2]= din;   
//          sel[3]: dout [((DWIDTH*4)-1):DWIDTH*3]= din;   
//          sel[4]: dout [((DWIDTH*5)-1):DWIDTH*4]= din;   
//          sel[5]: dout [((DWIDTH*6)-1):DWIDTH*5]= din;   
//          sel[6]: dout [((DWIDTH*7)-1):DWIDTH*6]= din;   
//          sel[7]: dout [((DWIDTH*8)-1):DWIDTH*7]= din;   
//          sel[8]: dout [((DWIDTH*9)-1):DWIDTH*8]= din;   
//          sel[9]: dout [((DWIDTH*10)-1):DWIDTH*9]= din;  
//          sel[10]: dout [((DWIDTH*11)-1):DWIDTH*10]= din;
//          sel[11]: dout [((DWIDTH*12)-1):DWIDTH*11]= din;
//          sel[12]: dout [((DWIDTH*13)-1):DWIDTH*12]= din; 
//          sel[13]: dout [((DWIDTH*14)-1):DWIDTH*13]= din;      
//          sel[14]: dout [((DWIDTH*15)-1):DWIDTH*14]= din;
//          sel[15]: dout [((DWIDTH*16)-1):DWIDTH*15]= din;                                  
//          default : dout [DWIDTH-1:0]= din;
//         endcase
//     end
//  end else if (NUM_OF_OBUS == 17) begin
//     always @(*) begin
//         dout = 'h0;      
//         case (1'b1)
//          sel[0]: dout [DWIDTH-1:0]= din;                 
//          sel[1]: dout [((DWIDTH*2)-1):DWIDTH]= din;      
//          sel[2]: dout [((DWIDTH*3)-1):DWIDTH*2]= din;    
//          sel[3]: dout [((DWIDTH*4)-1):DWIDTH*3]= din;    
//          sel[4]: dout [((DWIDTH*5)-1):DWIDTH*4]= din;    
//          sel[5]: dout [((DWIDTH*6)-1):DWIDTH*5]= din;    
//          sel[6]: dout [((DWIDTH*7)-1):DWIDTH*6]= din;    
//          sel[7]: dout [((DWIDTH*8)-1):DWIDTH*7]= din;    
//          sel[8]: dout [((DWIDTH*9)-1):DWIDTH*8]= din;    
//          sel[9]: dout [((DWIDTH*10)-1):DWIDTH*9]= din;   
//          sel[10]: dout [((DWIDTH*11)-1):DWIDTH*10]= din; 
//          sel[11]: dout [((DWIDTH*12)-1):DWIDTH*11]= din; 
//          sel[12]: dout [((DWIDTH*13)-1):DWIDTH*12]= din; 
//          sel[13]: dout [((DWIDTH*14)-1):DWIDTH*13]= din;    
//          sel[14]: dout [((DWIDTH*15)-1):DWIDTH*14]= din; 
//          sel[15]: dout [((DWIDTH*16)-1):DWIDTH*15]= din; 
//          sel[16]: dout [((DWIDTH*17)-1):DWIDTH*16]= din;                                                
//          default : dout [DWIDTH-1:0]= din;
//         endcase
//        end          
//  end else if (NUM_OF_OBUS == 18) begin
//     always @(*) begin
//         dout = 'h0;      
//         case (1'b1)
//          sel[0]: dout [DWIDTH-1:0]= din;                
//          sel[1]: dout [((DWIDTH*2)-1):DWIDTH]= din;     
//          sel[2]: dout [((DWIDTH*3)-1):DWIDTH*2]= din;   
//          sel[3]: dout [((DWIDTH*4)-1):DWIDTH*3]= din;   
//          sel[4]: dout [((DWIDTH*5)-1):DWIDTH*4]= din;   
//          sel[5]: dout [((DWIDTH*6)-1):DWIDTH*5]= din;   
//          sel[6]: dout [((DWIDTH*7)-1):DWIDTH*6]= din;   
//          sel[7]: dout [((DWIDTH*8)-1):DWIDTH*7]= din;   
//          sel[8]: dout [((DWIDTH*9)-1):DWIDTH*8]= din;   
//          sel[9]: dout [((DWIDTH*10)-1):DWIDTH*9]= din;  
//          sel[10]: dout [((DWIDTH*11)-1):DWIDTH*10]= din;
//          sel[11]: dout [((DWIDTH*12)-1):DWIDTH*11]= din;
//          sel[12]: dout [((DWIDTH*13)-1):DWIDTH*12]= din;  
//          sel[13]: dout [((DWIDTH*14)-1):DWIDTH*13]= din;       
//          sel[14]: dout [((DWIDTH*15)-1):DWIDTH*14]= din;   
//          sel[15]: dout [((DWIDTH*16)-1):DWIDTH*15]= din; 
//          sel[16]: dout [((DWIDTH*17)-1):DWIDTH*16]= din;   
//          sel[17]: dout [((DWIDTH*18)-1):DWIDTH*17]= din;                                                    
//          default : dout [DWIDTH-1:0]= din;
//         endcase
//     end        
//  end else if (NUM_OF_OBUS == 19) begin
//     always @(*) begin
//         dout = 'h0;      
//         case (1'b1)
//          sel[0]: dout [DWIDTH-1:0]= din;                
//          sel[1]: dout [((DWIDTH*2)-1):DWIDTH]= din;     
//          sel[2]: dout [((DWIDTH*3)-1):DWIDTH*2]= din;   
//          sel[3]: dout [((DWIDTH*4)-1):DWIDTH*3]= din;   
//          sel[4]: dout [((DWIDTH*5)-1):DWIDTH*4]= din;   
//          sel[5]: dout [((DWIDTH*6)-1):DWIDTH*5]= din;   
//          sel[6]: dout [((DWIDTH*7)-1):DWIDTH*6]= din;   
//          sel[7]: dout [((DWIDTH*8)-1):DWIDTH*7]= din;   
//          sel[8]: dout [((DWIDTH*9)-1):DWIDTH*8]= din;   
//          sel[9]: dout [((DWIDTH*10)-1):DWIDTH*9]= din;  
//          sel[10]: dout [((DWIDTH*11)-1):DWIDTH*10]= din;
//          sel[11]: dout [((DWIDTH*12)-1):DWIDTH*11]= din;
//          sel[12]: dout [((DWIDTH*13)-1):DWIDTH*12]= din;  
//          sel[13]: dout [((DWIDTH*14)-1):DWIDTH*13]= din;       
//          sel[14]: dout [((DWIDTH*15)-1):DWIDTH*14]= din;   
//          sel[15]: dout [((DWIDTH*16)-1):DWIDTH*15]= din; 
//          sel[16]: dout [((DWIDTH*17)-1):DWIDTH*16]= din;   
//          sel[17]: dout [((DWIDTH*18)-1):DWIDTH*17]= din;
//          sel[18]: dout [((DWIDTH*19)-1):DWIDTH*18]= din;                                                                  
//          default : dout [DWIDTH-1:0]= din;
//         endcase
//     end        
//  end else if (NUM_OF_OBUS == 20) begin
//     always @(*) begin
//         dout = 'h0;      
//         case (1'b1)
//          sel[0]: dout [DWIDTH-1:0]= din;
//          sel[1]: dout [((DWIDTH*2)-1):DWIDTH]= din;
//          sel[2]: dout [((DWIDTH*3)-1):DWIDTH*2]= din;
//          sel[3]: dout [((DWIDTH*4)-1):DWIDTH*3]= din;
//          sel[4]: dout [((DWIDTH*5)-1):DWIDTH*4]= din;
//          sel[5]: dout [((DWIDTH*6)-1):DWIDTH*5]= din;
//          sel[6]: dout [((DWIDTH*7)-1):DWIDTH*6]= din;
//          sel[7]: dout [((DWIDTH*8)-1):DWIDTH*7]= din;
//          sel[8]: dout [((DWIDTH*9)-1):DWIDTH*8]= din;
//          sel[9]: dout [((DWIDTH*10)-1):DWIDTH*9]= din;
//          sel[10]: dout [((DWIDTH*11)-1):DWIDTH*10]= din;
//          sel[11]: dout [((DWIDTH*12)-1):DWIDTH*11]= din;
//          sel[12]: dout [((DWIDTH*13)-1):DWIDTH*12]= din;
//          sel[13]: dout [((DWIDTH*14)-1):DWIDTH*13]= din;
//          sel[14]: dout [((DWIDTH*15)-1):DWIDTH*14]= din;
//          sel[15]: dout [((DWIDTH*16)-1):DWIDTH*15]= din;
//          sel[16]: dout [((DWIDTH*17)-1):DWIDTH*16]= din;
//          sel[17]: dout [((DWIDTH*18)-1):DWIDTH*17]= din;
//          sel[18]: dout [((DWIDTH*19)-1):DWIDTH*18]= din;
//          sel[19]: dout [((DWIDTH*20)-1):DWIDTH*19]= din;
//          default : dout [DWIDTH-1:0]= din;
//         endcase
//     end        
// end 
// end                                     
// endgenerate


// always @(*) begin
//     bit_index = bithigh_index(sel);
//     $display("bit_index = %0d, sel = 0x%0h", bit_index, sel);
//     //dout = bus_int(bit_index);
// end


  
endmodule
