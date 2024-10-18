//16 bit booth multiplier
module eight_bit_adder_subractor(
    input wire cin,
    input wire [7:0] i0,i1,
    output wire [7:0] sum);

	wire cout;
	wire [7:0] temp;
	wire [7:0] int_ip; //intermediate input - processed from the inputs and fed into fa module 
	
	//if cin == 1, int_ip = 1's complement
	//else int_ip = i1
    xor2 x0 (i1[0], cin, int_ip[0]);
    xor2 x1 (i1[1], cin, int_ip[1]);
    xor2 x2 (i1[2], cin, int_ip[2]);
    xor2 x3 (i1[3], cin, int_ip[3]);
    xor2 x4 (i1[4], cin, int_ip[4]);
    xor2 x5 (i1[5], cin, int_ip[5]);
    xor2 x6 (i1[6], cin, int_ip[6]);
    xor2 x7 (i1[7], cin, int_ip[7]);
    
    //if cin == 1, cin added to make two's complement
    //else addition takes place
	fa fa1(i0[0], int_ip[0], cin,     sum[0], temp[0]);
	fa fa2(i0[1], int_ip[1], temp[0], sum[1], temp[1]);
	fa fa3(i0[2], int_ip[2], temp[1], sum[2], temp[2]);
	fa fa4(i0[3], int_ip[3], temp[2], sum[3], temp[3]);
	fa fa5(i0[4], int_ip[4], temp[3], sum[4], temp[4]);
	fa fa6(i0[5], int_ip[5], temp[4], sum[5], temp[5]);
	fa fa7(i0[6], int_ip[6], temp[5], sum[6], temp[6]);
	fa fa8(i0[7], int_ip[7], temp[6], sum[7], cout);
	
endmodule

module booth_substep(
    input wire signed [7:0] acc,    //Current value of accumulator
    input wire signed [7:0] Q,  //Current value of Q (initially the multiplier)    
    input wire signed q0,       //Current value of q-1 th bit
    input wire signed [7:0] multiplicand,  //the multipliand
    output reg signed [7:0] next_acc,   //next accumulator value || value of 8 MSB's of 16 bit output [17:8]
    output reg signed [7:0] next_Q, //Next value of Q || value of 8 LSB's of 16 bit output [7:0]
    output reg q0_next);
    
	wire [7:0] addsub_temp;  //next value of q_-1 th bit
	
	eight_bit_adder_subractor myadd(Q[0], acc, multiplicand, addsub_temp);
	
		always @(*) begin	
		if(Q[0] == q0) begin
            q0_next = Q[0];
            next_Q = Q>>1;
            next_Q[7] = acc[0];
            //right shift
            next_acc = acc>>1;
            //with sign extension
			if (acc[7] == 1)
                next_acc[7] = 1;
		end

		else begin        //if Q[0] != q0 (that is,  q_-1 bit)
            q0_next = Q[0];
            next_Q = Q>>1;
            next_Q[7] = addsub_temp[0];
            //right shift
            next_acc = addsub_temp>>1;
            //with sign extension
			if (addsub_temp[7] == 1)
                next_acc[7] = 1;
		end			
end	
endmodule 

//xor module
module xor2 (input wire i0, i1, output wire o);
    assign o = i0 ^ i1;
endmodule


//full adder module
module fa (input wire i0, i1, cin, output wire sum, cout);
    assign sum = i0 ^ i1 ^ cin;
    assign cout = (i0 & i1) | (i1 & cin) | (cin & i0);
endmodule
 
module booth_multiplier(
    input signed[7:0] multiplier, multiplicand,
    output signed [15:0] product);

	wire signed [7:0] Q[0:6];  //an 8 bit (1byte) array, with a depth of 7 (0 to 6 rows of 1 byte each)
	wire signed [7:0] acc[0:7]; //an 8 bit (1byte) array, with a depth of 8 (0 to 7 rows of 1 byte each)
	wire signed[7:0] q0;
	wire qout;
	
	assign acc[0] = 8'b00000000;   //initialising accumulator to 0
	
	booth_substep step1(acc[0], multiplier, 1'b0, multiplicand, acc[1],        Q[0],         q0[1]);
	booth_substep step2(acc[1], Q[0],      q0[1], multiplicand, acc[2],        Q[1],         q0[2]);
	booth_substep step3(acc[2], Q[1],      q0[2], multiplicand, acc[3],        Q[2],         q0[3]);
	booth_substep step4(acc[3], Q[2],      q0[3], multiplicand, acc[4],        Q[3],         q0[4]);
	booth_substep step5(acc[4], Q[3],      q0[4], multiplicand, acc[5],        Q[4],         q0[5]);
	booth_substep step6(acc[5], Q[4],      q0[5], multiplicand, acc[6],        Q[5],         q0[6]);
	booth_substep step7(acc[6], Q[5],      q0[6], multiplicand, acc[7],        Q[6],         q0[7]);
	booth_substep step8(acc[7], Q[6],      q0[7], multiplicand, product[15:8], product[7:0], qout);
	
	 
endmodule
