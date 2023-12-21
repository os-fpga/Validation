module verific_parser_on_moore_fsm_in_sv
  (sequence_in,clock,reset,detector_out);
input clock; // clock signal
input reset; // reset input
input sequence_in; // binary input
output logic detector_out; // output of the sequence detector
parameter  Zero=5'b00001, // "Zero" State
  One=5'b00010, // "One" State
  OneZero=5'b00100, // "OneZero" State
  OneZeroOne=5'b01000, // "OnceZeroOne" State
  OneZeroOneOne=5'b10000;// "OneZeroOneOne" State
// enum {Zero, One, OneZero, OneZeroOne, OneZeroOneOne} current_state, next_state;
reg [4:0] current_state, next_state; // current state and next state
// sequential memory of the Moore FSM
always_ff @(posedge clock, posedge reset)
begin
 if(reset==1) 
 current_state <= Zero;// when reset=1, reset the state of the FSM to "Zero" State
 else
 current_state <= next_state; // otherwise, next state
end 
// combinational logic of the Moore FSM
// to determine next state 
always_comb @(current_state,sequence_in)
begin
 case(current_state) 
 Zero:begin
  if(sequence_in==1)
   next_state = One;
  else
   next_state = Zero;
 end
 One:begin
  if(sequence_in==0)
   next_state = OneZero;
  else
   next_state = One;
 end
 OneZero:begin
  if(sequence_in==0)
   next_state = Zero;
  else
   next_state = OneZeroOne;
 end 
 OneZeroOne:begin
  if(sequence_in==0)
   next_state = OneZero;
  else
   next_state = OneZeroOneOne;
 end
 OneZeroOneOne:begin
  if(sequence_in==0)
   next_state = OneZero;
  else
   next_state = One;
 end
 default:next_state = Zero;
 endcase
end
// combinational logic to determine the output
// of the Moore FSM, output only depends on current state
always_comb @(current_state)
begin 
 case(current_state) 
 Zero:   detector_out = 0;
 One:   detector_out = 0;
 OneZero:  detector_out = 0;
 OneZeroOne:  detector_out = 0;
 OneZeroOneOne:  detector_out = 1;
 default:  detector_out = 0;
 endcase
end 
endmodule
    