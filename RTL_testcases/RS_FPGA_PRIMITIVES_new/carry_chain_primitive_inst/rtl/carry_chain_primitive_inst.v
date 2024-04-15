module carry_chain_primitive_inst(
  input [7:0] p,
  input [7:0] g,
  input cin,
  output [7:0] sum,
  output mycout
  );

  wire [7:0] co;
  wire routable_cin;

  // Trick 2 (not sure it is fully 100% Dana explanation)
  // Add an extra CARRY to make 'cin' usable so that this version is routable.
  //
  // CARRY Boolean function : assign {COUT, O} = {P ? CIN : G, P ^ CIN};
  //
  // if P = 1'b0 then it means COUT = routable_cin = G = cin (see below)
  //
  CARRY carry_inst_start (.P(1'b0),.G(cin),.COUT(routable_cin));

  // First CARRY CIN is connected to 'routable_cin' and not its PI version
  //
  CARRY carry_inst00 (.P(p[0]),.G(g[0]),.CIN(routable_cin),.O(sum[0]),.COUT(co[0]));
  
  CARRY carry_inst1 (.P(p[1]),.G(g[1]),.CIN(co[0]),.O(sum[1]),.COUT(co[1]));

  CARRY carry_inst2 (.P(p[2]),.G(g[2]),.CIN(co[1]),.O(sum[2]),.COUT(co[2]));
  CARRY carry_inst3 (.P(p[3]),.G(g[3]),.CIN(co[2]),.O(sum[3]),.COUT(co[3]));
  CARRY carry_inst4 (.P(p[4]),.G(g[4]),.CIN(co[3]),.O(sum[4]),.COUT(co[4]));
  CARRY carry_inst5 (.P(p[5]),.G(g[5]),.CIN(co[4]),.O(sum[5]),.COUT(co[5]));
  CARRY carry_inst6 (.P(p[6]),.G(g[6]),.CIN(co[5]),.O(sum[6]),.COUT(co[6]));
  CARRY carry_inst7 (.P(p[7]),.G(g[7]),.CIN(co[6]),.O(sum[7]),.COUT(co[7]));

  //assign cout = co[6];     // fails in packing since we cannot access internal 'co[6]'
  //assign mycout = co[7];   // goes through packer (and placer but fails in
                             // router). Looks like 'co[7]' cannot be used
                             // outside the CLB except to drive only next CIN of another CLB.

  // Trick 1 (from Dana)
  //
  // Mimic 'assign mycout = co[7]' but this version is routable.
  // We redirect the CIN to the output O of the CARRY. This O is externally accessible.
  // Remember : CARRY Boolean function : assign {COUT, O} = {P ? CIN : G, P ^ CIN};
  //
  // So O equals CIN when P = 1'b0, therefore 'mycout' corresponds to 'co[7]'.
  //
  CARRY carry_inst8 (.P(1'b0),.G(1'b0),.CIN(co[7]),.O(mycout));

endmodule