//////////////////////////////////////////////////////////////////////////////////
module add_library_path_multiple(Instruction, X, Y, Overflow, Carry);
    // Defining the inputs/outputs
    input [017:0] Instruction;
	 output signed [07:0] X;
	 output signed [07:0] Y;
    output Overflow;
    output Carry;
	 
	 
	 
	// Register File (4registers x 8bit)
	//**********************************
    reg signed [07:0] A;
    reg signed [07:0] B;
	 reg signed [07:0] X;
	 reg signed [07:0] Y;
	 //**********************************
	 
	 
	 
	 // Temporary Variables
	 reg [01:0] OpCode;
	 reg Cin = 1'b0;
	 wire Carry;
	 wire [7:0] xor_wire, and_wire, add_wire;
	 wire [15:0] mul_wire;
	 
	 
	 
	 // Writing the Instruction to REGISTER FILE
	 //*****************************************
	 always @ ( * ) begin
		 OpCode = Instruction[17:16];
		 A = Instruction[16:8];
		 B = Instruction[7:0];
    end 
	 //*****************************************
	 
	 
	 
	 // ALU Module Implementation
	 addition_module_8bit 			a0 (A, B, Cin, add_wire, Carry, Overflow);
	 multiplication_module_8bit 	a1 (A, B, mul_wire);
	 and_module_8bit 					a2 (A, B, and_wire);
	 xor_module_8bit					a3 (A, B, xor_wire);
	 
	 
	 
	 // Selecting the Output as per the OpCode
	 //***************************************************
	 always @ ( * ) begin
		case(OpCode)
			2'b00 : begin 						//ADDITION
							Y = add_wire;
							X = 8'b0;
					  end
								
			
			2'b01 : begin 						//MULTIPLICATION
							Y = mul_wire[7:0];
							X = mul_wire[15:8];
					  end
			
			2'b10 : begin 						//AND
							Y = and_wire;
							X = 8'b0;
					  end
			
			2'b11 : begin 						//XOR
							Y = xor_wire;
							X = 8'b0;
					  end

			default : begin 	X = 8'bx; Y = 8'bx;	 	end
		endcase
	 end
	 //***************************************************



endmodule
