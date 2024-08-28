// --------------------------------------------------------------------------------
//| Avalon Streaming Timing Adapter
// --------------------------------------------------------------------------------
// altera message_level level1

`timescale 1ns / 100ps
module hh_system_timing_adapter (
    
      // Interface: clk
      input              clk,
      // Interface: reset
      input              reset_n,
      // Interface: in
      output reg         in_ready,
      input              in_valid,
      input      [31: 0] in_data,
      // Interface: out
      input              out_ready,
      output reg         out_valid,
      output reg [31: 0] out_data
);




   // ---------------------------------------------------------------------
   //| Signal Declarations
   // ---------------------------------------------------------------------

   reg  [31: 0] in_payload;
   reg  [31: 0] out_payload;
   reg  [ 1: 0] ready;


   // ---------------------------------------------------------------------
   //| Payload Mapping
   // ---------------------------------------------------------------------
   always @* begin
     in_payload = {in_data};
     {out_data} = out_payload;
   end

   // ---------------------------------------------------------------------
   //| Ready & valid signals.
   // ---------------------------------------------------------------------
   always @* begin
     ready[1] = out_ready;
     out_valid = in_valid && ready[0];
     out_payload = in_payload;
     in_ready = ready[0];
   end


   always @(posedge clk or negedge reset_n) begin
      if (!reset_n) begin
        ready[1-1:0] <= 0;
      end else begin
        ready[1-1:0] <= ready[1:1];
      end 
   end


endmodule

