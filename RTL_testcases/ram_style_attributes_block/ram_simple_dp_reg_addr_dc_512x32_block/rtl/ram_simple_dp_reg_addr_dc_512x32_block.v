module ram_simple_dp_reg_addr_dc_512x32_block(
   input      [31:0] din,
   input     [8:0] read_addr, write_addr,       // two addresses
   input     we, read_clock, write_clock, // two clocks
   output  [31:0] dout);
    
   (* ram_style = "block" *)   
   reg        [31:0] ram[0:512];

   reg       [8:0] read_addr_reg;
   always @ (posedge write_clock)                // write clock
     begin
        if (we)
           ram[write_addr] <= din;
     end
   always @ (posedge read_clock)                 // read clock
     begin
        read_addr_reg <= read_addr;              // register input
     end
   assign dout = ram[read_addr_reg];                // read with registered address
endmodule