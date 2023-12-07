
module adder (a_in, b_in, c_in) ;
    input a_in ; 
    input b_in ; 
    output c_in ; 
    (* src="/nfs_scratch/zafar/RAPTOR_IP/Raptor_IP/Raptor_IP.srcs/sources_1/adder.sv:7" *) wire a_in ; 
    (* src="/nfs_scratch/zafar/RAPTOR_IP/Raptor_IP/Raptor_IP.srcs/sources_1/adder.sv:7" *) wire b_in ; 
    (* src="/nfs_scratch/zafar/RAPTOR_IP/Raptor_IP/Raptor_IP.srcs/sources_1/adder.sv:7" *) wire c_in ; 
    \$lut  #(.LUT(4'b0110),.WIDTH(32'b010)) _0_ (.A({a_in,b_in}), .Y(c_in)) ; 
endmodule


