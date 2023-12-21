module wrapped_reg_memory_dp (clk, we, read_addr, write_addr, din, dout);
    input clk, we;
    input [4:0] read_addr, write_addr;
    input [31:0] din;
    output reg [31:0] dout;
    
    reg [31:0] ram [31:0];

    always @(posedge clk)
    begin
    dout <= ram[read_addr];
        if (we) begin
            ram[write_addr] <= din;
            end     
    end

endmodule



module wrapped_reference_macroblock_memory64 (clk, we, read_addr, write_addr, din, dout);
    input clk, we;
    input [5:0] read_addr, write_addr;
    input [63:0] din;
    output reg [63:0] dout;
    
    reg [63:0] ram [63:0];

    always @(posedge clk)
    begin
    dout <= ram[read_addr];
        if (we) begin
            ram[write_addr] <= din;
            end     
    end

endmodule



module wrapped_dual_port_component (clk, we, read_addr, write_addr, din, dout);
    input clk, we;
    input [7:0] read_addr, write_addr;
    input [63:0] din;
    output reg [63:0] dout;
    
    reg [63:0] ram [255:0];

    always @(posedge clk)
    begin
    dout <= ram[read_addr];
        if (we) begin
            ram[write_addr] <= din;
            end     
    end

endmodule

module wrapped_current_macroblock_memory64 (clk, we, read_addr, write_addr, din, dout);
    input clk, we;
    input [4:0] read_addr, write_addr;
    input [63:0] din;
    output reg [63:0] dout;
    
    reg [63:0] ram [31:0];

    always @(posedge clk)
    begin
    dout <= ram[read_addr];
        if (we) begin
            ram[write_addr] <= din;
            end     
    end
  
endmodule  
    
    module wrapped_point_memory (clk, we, read_addr, write_addr, din, dout);
        input clk, we;
        input [7:0] read_addr, write_addr;
        input [15:0] din;
        output reg [15:0] dout;
        
        reg [15:0] ram [255:0];
    
        always @(posedge clk)
        begin
        dout <= ram[read_addr];
            if (we) begin
                ram[write_addr] <= din;
                end     
    end
    
endmodule
    
      module wrapped_program_memory (clk, we, read_addr, write_addr, din, dout);
            input clk, we;
            input [7:0] read_addr, write_addr;
            input [19:0] din;
            output reg [19:0] dout;
            
            reg [19:0] ram [255:0];
        
            always @(posedge clk)
            begin
            dout <= ram[read_addr];
                if (we) begin
                    ram[write_addr] <= din;
                    end     
    end

endmodule
