module o_buft_ds_primitive_inst (
  input d1,
  input en1,
  input d2,
  input en2,
  input T_O_BUFT_DS,
  output O_P_O_BUFT_DS,
  output O_N_O_BUFT_DS
);

  wire O_P;
  wire O_N;
  reg latch_out1;
  reg latch_out2;

  O_BUFT_DS O_BUFT_DS_primitive (
    .I(latch_out1),
    .T(latch_out2), 
    .O_P(O_P), 
    .O_N(O_N)
  );

  assign O_P_O_BUFT_DS = O_P;
  assign O_N_O_BUFT_DS = O_N;

  always @(d1, en1) begin
    if (en1) begin
      latch_out1 <= d1; end
    else begin
      latch_out1 <= latch_out1; end
  end

  always @(d2, en2) begin
    if (en2) begin
      latch_out2 <= d2; end
    else begin
      latch_out2 <= latch_out2; end
  end

endmodule
