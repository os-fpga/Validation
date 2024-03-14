module spram_32x1024 #(parameter Total_instances = 2) 
(
	clock0,
	rce,
	ra,
	rq,
	wce,
	wa,
	wd,
	id
);
parameter AWIDTH = 10;
parameter DWIDTH = 32;
input                               clock0;
input                               rce   ;
input  [                 AWIDTH-1:0] ra    ;
output [                 DWIDTH-1:0] rq    ;
input                               wce   ;
input  [                 AWIDTH-1:0] wa    ;
input  [                 DWIDTH-1:0] wd    ;
input  [$clog2(Total_instances)-1:0] id    ;



genvar  i;
integer j;

wire [DWIDTH-1:0]rq_Array[0:Total_instances-1];
reg rce_Array[0:Total_instances-1];
reg wce_Array[0:Total_instances-1];


generate
	for(i=0;i<Total_instances;i=i+1)begin
		spram_32x1024_submodule spram_32x1024_submodule (
			.clock0(clock0      ),
			.rce   (rce_Array[i]),
			.ra    (ra          ),
			.rq    (rq_Array[i] ),
			.wce   (wce_Array[i]),
			.wa    (wa          ),
			.wd    (wd          )
		);
	end
endgenerate

always @(*)begin

	for(j=0;j<Total_instances;j=j+1)begin
		rce_Array[j] = 'd0;
		wce_Array[j] = 'd0;
	end
		rce_Array[id] = rce;
		wce_Array[id] = wce;
end

assign rq = rq_Array[id];
endmodule
module spram_32x1024_submodule (
	clock0,
	rce,
	ra,
	rq,
	wce,
	wa,
	wd
);

parameter AWIDTH = 10;
parameter DWIDTH = 32;

input  					clock0;
input                   rce;
input      [AWIDTH-1:0] ra;
output reg [DWIDTH-1:0] rq;
input                   wce;
input      [AWIDTH-1:0] wa;
input      [DWIDTH-1:0] wd;
reg        [DWIDTH-1:0] memory[0:(2**AWIDTH)-1];

always @(posedge clock0) 
begin
	if (rce)
		rq <= memory[ra];
	if (wce)
		memory[wa] <= wd;
end

// integer i;
// initial
// begin
// 	for(i = 0; i < ((2**AWIDTH)-1); i = i + 1)
// 		memory[i] = 0;
// end

//initial begin
 //   $readmemh("mem1.mem", memory);
    //end

endmodule 
