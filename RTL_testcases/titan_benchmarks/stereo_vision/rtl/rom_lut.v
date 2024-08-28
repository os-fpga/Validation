module rom_lut(addr_in, data_out);


//parameter CCA = 1;
//parameter CCB = 2;
//parameter CCC = 4;
//parameter CCD = 8;

//parameter C0 = 0;
//parameter C1 = CCA;
//parameter C2 = CCB;
//parameter C3 = CCA+CCB;
//parameter C4 = CCC;
//parameter C5 = CCC+CCA;
//parameter C6 = CCC+CCB;
//parameter C7 = CCC+CCA+CCB;
//parameter C8 = CCD;
//parameter C9 = CCD+CCA;
//parameter CA = CCD+CCB;
//parameter CB = CCD+CCA+CCB;
//parameter CC = CCD+CCC;
//parameter CD = CCD+CCC+CCA;
//parameter CE = CCD+CCC+CCB;
//parameter CF = CCD+CCC+CCB+CCA;

parameter C0 = 0;
parameter C1 = 1;
parameter C2 = 2;
parameter C3 = 3;
parameter C4 = 4;
parameter C5 = 5;
parameter C6 = 6;
parameter C7 = 7;
parameter C8 = 8;
parameter C9 = 9;
parameter CA = 10;
parameter CB = 11;
parameter CC = 12;
parameter CD = 13;
parameter CE = 14;
parameter CF = 15;

parameter DATA_WIDTH = 4;

input [3:0] addr_in;
output [DATA_WIDTH-1:0] data_out;

wire [3:0] addr_in;
reg  [DATA_WIDTH-1:0] data_out;
always @(addr_in)
begin
  case (addr_in)
    4'h0 : data_out <= C0;
    4'h1 : data_out <= C1;
    4'h2 : data_out <= C2;
    4'h3 : data_out <= C3;
    4'h4 : data_out <= C4;
    4'h5 : data_out <= C5;
    4'h6 : data_out <= C6;
    4'h7 : data_out <= C7;
    4'h8 : data_out <= C8;
    4'h9 : data_out <= C9;
    4'ha : data_out <= CA;
    4'hb : data_out <= CB;
    4'hc : data_out <= CC;
    4'hd : data_out <= CD;
    4'he : data_out <= CE;
    4'hf : data_out <= CF;
  endcase
end

endmodule    
