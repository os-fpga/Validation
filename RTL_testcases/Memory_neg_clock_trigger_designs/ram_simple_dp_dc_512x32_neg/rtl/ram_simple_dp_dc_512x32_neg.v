module ram_simple_dp_dc_512x32_neg(
   input      [31:0] din,
   input     [8:0] read_addr, write_addr,       // two addresses
   input     we, read_clock, write_clock, // two clocks
   output reg [31:0] dout);


   reg        [31:0] ram[0:512];
   always @ (negedge write_clock)                // write clock
     begin
        if (we)
           ram[write_addr] <= din;
     end
   always @ (negedge read_clock)                 // read clock
     begin
        dout <= ram[read_addr];                     // register output
     end
endmodule