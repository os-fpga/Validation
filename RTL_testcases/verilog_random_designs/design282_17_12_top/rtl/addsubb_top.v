module addsubb_top #(parameter WIDTH=32) (clk,rst,data_in,data_out);
    input clk;
    input rst;
    input [WIDTH-1:0] data_in;
    output reg [WIDTH-1:0] data_out;
    
    wire [WIDTH-1:0] as_out;
    wire [15:0] data_ina = data_in[15:0];
    wire [15:0] data_inb = data_in[31:16];
    wire add_sub = data_in[0];
    
    always @ (posedge clk) begin
    if (rst)
        data_out <= 0;
    else 
        data_out <= as_out;
//        data_out [31:17] <= data_in [31:17];
    end
    
    addsub #(.WIDTH(WIDTH)) add_sub_inst (.clk(clk),.dataa(data_ina),.datab(data_inb),.add_sub(add_sub),.result(as_out));
endmodule

module addsub #(parameter WIDTH=32)
(
	input [15:0] dataa,
	input [15:0] datab,
	input add_sub,
	input clk,
	output reg [WIDTH-1:0] result
);

	always @ (posedge clk)
	begin
		if (add_sub)
			result <= dataa + datab;
		else
			result <= dataa - datab;
	end

endmodule
