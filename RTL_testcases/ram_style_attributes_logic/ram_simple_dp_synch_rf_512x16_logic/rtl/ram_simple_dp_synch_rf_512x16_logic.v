module ram_simple_dp_synch_rf_512x16_logic (clk, we,re, read_addr, write_addr, din, dout);
    input clk, we, re;
    input [8:0] read_addr, write_addr;
    input [15:0] din;
    output reg [15:0] dout;
    
    (* ram_style = "logic" *) 
    reg [15:0] ram [511:0];

    always @(posedge clk)
    begin
        if (we)
            ram[write_addr] <= din;
        if (re)
            dout <= ram[read_addr];
    end

endmodule