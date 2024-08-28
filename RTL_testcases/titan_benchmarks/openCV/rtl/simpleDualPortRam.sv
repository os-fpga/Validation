module simpleDualPortRam #(	 
	
	parameter int ADDR_WIDTH = 1,
	parameter int WORD_SIZE = 1,
	parameter int WORDS = 1,
	parameter int BLOCKIN = 0, 
	parameter int BLOCKOUT = 0,	  
	parameter int TRUEDUALIN = 0,
	parameter int TRUEDUALOUT = 0
	
)( 
	//////////// CLOCK //////////
	input bit clk,
	
	//////////// Data Signals //////////
	input logic unsigned [ADDR_WIDTH-1:0] 							waddr,
	input logic 			[WORDS-1 : 0][WORD_SIZE-1:0] 			wdata, 		
	input logic unsigned [ADDR_WIDTH-1:0] 							raddr,		
	input logic unsigned [globalDefinitions::log2(WORDS)-1:0]raddrElm,		
	input logic unsigned [globalDefinitions::log2(WORDS)-1:0]waddrElm,	
	input we,
	
	output logic [WORDS-1:0][WORD_SIZE - 1:0] q,
	output logic [WORDS-1:0][WORD_SIZE - 1:0] qw

);

	logic [WORDS-1:0][WORD_SIZE - 1:0] internalQ;
	logic [WORDS-1:0][WORD_SIZE - 1:0] internalQW;
	logic [WORDS-1:0][WORD_SIZE - 1:0] internalwdata;
	bit [WORDS-1:0] localwe;
	
	logic unsigned [globalDefinitions::log2(WORDS)-1:0] internalRaddrElm;	
	logic unsigned [globalDefinitions::log2(WORDS)-1:0] internalWaddrElm;
	
	genvar i;
	generate
		for(i = 0 ; i < WORDS ; i++) begin : ramLoop
			inferedAltSync #(.ADDR_WIDTH(ADDR_WIDTH), .WORD_SIZE(WORD_SIZE)) 
				ram(	.clk(clk), .waddr(waddr), .wdata(internalwdata[i]), .we(localwe[i]), 
						.raddr(raddr),  .q(internalQ[i]), .qw(internalQW[i]) );						
			
			// write 			
			
			always_comb begin
				
				if(WORDS == 1) begin
					localwe[i] = we;
					internalwdata[i] = wdata[0];	
				end else begin
					
					if(BLOCKIN == 0) begin
						if(i == waddrElm) localwe[i] = we;
						else localwe[i] = 0;					
						internalwdata[i] = wdata[0]; 
					end else begin
						localwe[i] = we;	
						internalwdata[i] = wdata[i];	
					end	
					
				end				
			 end
			 	
		  end	
		
		
	
	endgenerate
	
	// read
    always_comb begin
      
      if(BLOCKOUT == 0) begin        
        for(int x = 0 ; x < WORDS ; x++) begin
          if(x == 0) q[x] = internalQ[internalRaddrElm];
          else q[x] = 0;			
        end
      end else begin
        q = internalQ;
      end
      
      
      if(TRUEDUALIN == 1) begin
        if(BLOCKIN == 0) begin
          for(int x = 0 ; x < WORDS ; x++) begin
            if(x == 0) qw[x] = internalQW[internalWaddrElm];
            else qw[x] = 0;			
          end          
        end      
      end
      
    end
	 
	 
	 always_ff @ (posedge clk) begin	 
	   internalRaddrElm <= raddrElm;	 
	   internalWaddrElm <= waddrElm;
	 end

			
	
endmodule : simpleDualPortRam	
