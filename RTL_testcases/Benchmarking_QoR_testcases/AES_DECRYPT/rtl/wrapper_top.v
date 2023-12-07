module wrapper_top (input	[7:0]	ct,
	input	ct_vld,
	output	ct_rdy,
	
	input	rkey_vld,
	output	next_rkey,
	
	output	reg [0:63]	pt,
	output	pt_vld,
	
	input	[0:1]	klen_sel,	
	
	input	clk,
	input	rst);

reg [127:0] ct_data;
wire [0:127] pt_data;
reg count;
wire  [0:63] pt_wire;

always @(posedge clk) begin
    ct_data <= {ct_data[119:0], ct};
end


always@(posedge clk)
begin
if(rst)
count<=0;
else
count<=~count;
end

always@(posedge clk)
begin
pt<=pt_wire;
end

assign pt_wire = (count==1'b0)?pt_data[0:63]: pt_data[64:127];




wrapper top   (
	 .ct(ct_data),
	.ct_vld(ct_vld),
	.ct_rdy(ct_rdy),	
	.rkey_vld(rkey_vld),
	.next_rkey(next_rkey),	
	.pt(pt_data),
	.pt_vld(pt_vld),	
	.klen_sel(klen_sel),		
	.clk(clk),
	.rst(rst));

endmodule


