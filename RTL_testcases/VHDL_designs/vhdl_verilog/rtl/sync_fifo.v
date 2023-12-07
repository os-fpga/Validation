module sync_fifo
#(parameter WIDTH    = 8, // width in bits
            L2DEPTH  = 4, // Log 2 Depth, 4=16 deep
            REGFLAGS = 8  // Full, empty are registered
)
(
   input                   clk,     // system clock                 
   input                   reset_n, // A-synchronous low reset/clear
   input                   enable,  // clock gating                 
   input                   clear,   // Synchronous clear            

   input                   write,   // write FIFO                   
   input       [WIDTH-1:0] wdata,   // write data                   
   input                   read,    // read FIFO                    
   output reg  [WIDTH-1:0] rdata,   // read data                    

   output reg              empty,   // FIFO is empty                
   output reg              full,    // FIFO is full                 
   output reg      [L2DEPTH:0] level    // Fill level                   
);

always @ (posedge clk, negedge reset_n)
begin
    if (reset_n) 
        empty <= 0;
    else
        empty <= 1;
end

always @ (posedge clk)  
begin      
    if (clear) begin
        full <= 0;
        level <= 0; end
    else begin
        full <= 1;
        level <= 1; end
end

always @ (posedge clk)
begin
    if (enable)
        rdata <= wdata;
    else
        rdata <= wdata + write + read;
end

endmodule