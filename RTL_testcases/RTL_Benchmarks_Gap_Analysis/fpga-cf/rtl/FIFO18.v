module FIFO18 (ALMOSTEMPTY, ALMOSTFULL, DO, DOP, EMPTY, FULL, RDCOUNT, RDERR, WRCOUNT, WRERR,
	       DI, DIP, RDCLK, RDEN, RST, WRCLK, WREN);

    parameter ALMOST_EMPTY_OFFSET = 12'h080;
    parameter ALMOST_FULL_OFFSET = 12'h080;
    parameter integer DATA_WIDTH = 4;
    parameter integer DO_REG = 1;
    parameter EN_SYN = "FALSE";
    parameter FIRST_WORD_FALL_THROUGH = "FALSE";
    parameter SIM_MODE = "SAFE";
 
    output ALMOSTEMPTY;
    output ALMOSTFULL;
    output [15:0] DO;
    output [1:0] DOP;
    output EMPTY;
    output FULL;
    output [11:0] RDCOUNT;
    output RDERR;
    output [11:0] WRCOUNT;
    output WRERR;

    input [15:0] DI;
    input [1:0] DIP;
    input RDCLK;
    input RDEN;
    input RST;
    input WRCLK;
    input WREN;

   

    wire [47:0] dangle_out48;
    wire [5:0] dangle_out6;
    wire [7:0] dangle_out8;
    wire dangle_out;

    
    initial begin

	case (DATA_WIDTH)
	    4, 9, 18 : ;
	   default :
		begin
		    $display("Attribute Syntax Error : The attribute DATA_WIDTH on FIFO18 instance %m is set to %d.  Legal values for this attribute are 4, 9 or 18.", DATA_WIDTH);
		    $finish;
		end
	endcase // case(DATA_WIDTH)

    end // initial begin

    
    AFIFO36_INTERNAL INT_FIFO (.ALMOSTEMPTY(ALMOSTEMPTY), .ALMOSTFULL(ALMOSTFULL), .DBITERR(dangle_out), .DO({dangle_out48,DO}), .DOP({dangle_out6,DOP}), .ECCPARITY(dangle_out8), .EMPTY(EMPTY), .FULL(FULL), .RDCOUNT({dangle_out,RDCOUNT}), .RDERR(RDERR), .SBITERR(dangle_out), .WRCOUNT({dangle_out,WRCOUNT}), .WRERR(WRERR), .DI({48'b0,DI}), .DIP({6'b0,DIP}), .RDCLK(RDCLK), .RDEN(RDEN), .RDRCLK(RDCLK), .RST(RST), .WRCLK(WRCLK), .WREN(WREN));


    
    specify

	(RDCLK => ALMOSTEMPTY) = (100, 100);
	(RDCLK => DOP[0]) = (100, 100);
	(RDCLK => DOP[1]) = (100, 100);
	(RDCLK => DO[0]) = (100, 100);
	(RDCLK => DO[10]) = (100, 100);
	(RDCLK => DO[11]) = (100, 100);
	(RDCLK => DO[12]) = (100, 100);
	(RDCLK => DO[13]) = (100, 100);
	(RDCLK => DO[14]) = (100, 100);
	(RDCLK => DO[15]) = (100, 100);
	(RDCLK => DO[1]) = (100, 100);
	(RDCLK => DO[2]) = (100, 100);
	(RDCLK => DO[3]) = (100, 100);
	(RDCLK => DO[4]) = (100, 100);
	(RDCLK => DO[5]) = (100, 100);
	(RDCLK => DO[6]) = (100, 100);
	(RDCLK => DO[7]) = (100, 100);
	(RDCLK => DO[8]) = (100, 100);
	(RDCLK => DO[9]) = (100, 100);
	(RDCLK => EMPTY) = (100, 100);
	(RDCLK => RDCOUNT[0]) = (100, 100);
	(RDCLK => RDCOUNT[10]) = (100, 100);
	(RDCLK => RDCOUNT[11]) = (100, 100);
	(RDCLK => RDCOUNT[1]) = (100, 100);
	(RDCLK => RDCOUNT[2]) = (100, 100);
	(RDCLK => RDCOUNT[3]) = (100, 100);
	(RDCLK => RDCOUNT[4]) = (100, 100);
	(RDCLK => RDCOUNT[5]) = (100, 100);
	(RDCLK => RDCOUNT[6]) = (100, 100);
	(RDCLK => RDCOUNT[7]) = (100, 100);
	(RDCLK => RDCOUNT[8]) = (100, 100);
	(RDCLK => RDCOUNT[9]) = (100, 100);
	(RDCLK => RDERR) = (100, 100);

	(WRCLK => ALMOSTFULL) = (100, 100);
	(WRCLK => FULL) = (100, 100);
	(WRCLK => WRCOUNT[0]) = (100, 100);
	(WRCLK => WRCOUNT[10]) = (100, 100);
	(WRCLK => WRCOUNT[11]) = (100, 100);
	(WRCLK => WRCOUNT[1]) = (100, 100);
	(WRCLK => WRCOUNT[2]) = (100, 100);
	(WRCLK => WRCOUNT[3]) = (100, 100);
	(WRCLK => WRCOUNT[4]) = (100, 100);
	(WRCLK => WRCOUNT[5]) = (100, 100);
	(WRCLK => WRCOUNT[6]) = (100, 100);
	(WRCLK => WRCOUNT[7]) = (100, 100);
	(WRCLK => WRCOUNT[8]) = (100, 100);
	(WRCLK => WRCOUNT[9]) = (100, 100);
	(WRCLK => WRERR) = (100, 100);

	specparam PATHPULSE$ = 0;

    endspecify
    
endmodule // FIFO18 
