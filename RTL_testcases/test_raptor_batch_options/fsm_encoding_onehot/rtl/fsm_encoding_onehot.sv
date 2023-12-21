module fsm_encoding_onehot (input logic clk, reset_n,
    output logic q);
    enum {S0, S1, S2} state; // declare states as enum
    // next state logic and state register
    always_ff @(posedge clk, negedge reset_n)
       begin
       if (!reset_n)
           state <= S0;
       else begin
           case (state)
               S0: state <= S1;
               S1: state <= S2;
               S2: state <= S0;
           endcase
       end
    end
   
    // output logic
    assign q = (state == S0);
   
   endmodule