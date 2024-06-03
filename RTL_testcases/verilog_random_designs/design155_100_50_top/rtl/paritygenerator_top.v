//`timescale 1ns / 1ps

module paritygenerator_top #(parameter WIDTH=32) (clk,rst,data_in,data_out);
    input clk;
    input rst;
    input [WIDTH-1:0] data_in;
    output reg [WIDTH-1:0] data_out;

//    reg cin;
    wire [WIDTH-1:0] d_out;
    wire parity;
    
        
    always @ (posedge clk) begin
        if (rst)
            data_out <= 0;
        else
            data_out <= d_out;
    end

    paritygenerator #(.WIDTH(WIDTH)) paritygenerator_inst (.clk(clk),.rst(rst),.data_in(data_in),.data_out(d_out),.parity(parity));


//    assign data_out=d_out;
//    assign cout=cout;
endmodule

module paritygenerator #(parameter WIDTH=32)(
    input clk,
    input rst,
    input [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out,
    output reg parity
    );
    
    reg [WIDTH-1:0] data_out_reg;
    
    always @ (posedge clk) begin
        if (rst)
            data_out <= 0;
        else
            data_out <= data_out_reg;
    end
    
    always @(*) begin
        parity = data_in[0]^data_in[1]^data_in[2]^data_in[3]^data_in[4]^data_in[5]^data_in[6]^data_in[7]^data_in[8]^data_in[9]^data_in[10]^data_in[11]^data_in[12]^data_in[13]^data_in[14]^data_in[15]^data_in[16]^data_in[17]^data_in[18]^data_in[19]^data_in[20]^data_in[21]^data_in[22]^data_in[23]^data_in[24]^data_in[25]^data_in[26]^data_in[27]^data_in[28]^data_in[29]^data_in[30]^data_in[31];
        data_out_reg = {data_in[30:0],parity};
    end
endmodule
