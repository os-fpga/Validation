module manchesterencoderdecoder
  (input  rst,
   input  rts,
   input  txd,
   input  clkin,
   output cts,
   output txcout,
   output txlen,
   output mdo);
  reg [2:0] main_state;
  reg [4:0] main_prcounter;
  reg [3:0] main_txcounter;
  reg main_txcout_i;
  reg main_cts_i;
  reg main_mdo_i;
  reg main_mdo_i1;
  reg main_txlen_i;
  wire [31:0] n14_o;
  wire [31:0] n16_o;
  wire [3:0] n17_o;
  wire [31:0] n19_o;
  wire n21_o;
  wire n23_o;
  wire [31:0] n24_o;
  wire n26_o;
  wire n28_o;
  wire n29_o;
  wire [2:0] n31_o;
  wire [4:0] n33_o;
  wire n35_o;
  wire n37_o;
  wire [31:0] n38_o;
  wire n40_o;
  wire n42_o;
  wire [31:0] n43_o;
  wire n45_o;
  wire n46_o;
  wire [31:0] n47_o;
  wire [31:0] n49_o;
  wire [4:0] n50_o;
  wire [31:0] n51_o;
  wire n53_o;
  wire [2:0] n55_o;
  wire [4:0] n57_o;
  wire n58_o;
  wire [4:0] n59_o;
  wire n60_o;
  wire n62_o;
  wire [31:0] n63_o;
  wire n65_o;
  wire [31:0] n66_o;
  wire [31:0] n68_o;
  wire [4:0] n69_o;
  wire [31:0] n70_o;
  wire n72_o;
  wire [2:0] n74_o;
  wire n76_o;
  wire n77_o;
  wire [4:0] n78_o;
  wire n79_o;
  wire n81_o;
  wire n83_o;
  wire [31:0] n84_o;
  wire n86_o;
  wire [2:0] n88_o;
  wire [4:0] n90_o;
  wire n92_o;
  wire n94_o;
  wire n95_o;
  wire n96_o;
  wire n97_o;
  wire n98_o;
  wire n100_o;
  wire [31:0] n101_o;
  wire n103_o;
  wire [31:0] n104_o;
  wire [31:0] n106_o;
  wire [4:0] n107_o;
  wire [31:0] n108_o;
  wire n110_o;
  wire [2:0] n112_o;
  wire n113_o;
  wire [4:0] n114_o;
  wire n116_o;
  wire n118_o;
  wire [4:0] n119_o;
  reg [2:0] n121_o;
  reg [4:0] n122_o;
  reg n123_o;
  reg n124_o;
  reg n125_o;
  wire n127_o;
  wire n129_o;
  wire [31:0] n130_o;
  wire n132_o;
  wire n133_o;
  wire [31:0] n134_o;
  wire n136_o;
  wire n137_o;
  wire n138_o;
  wire n140_o;
  wire n141_o;
  wire n142_o;
  wire [31:0] n143_o;
  wire n145_o;
  wire n147_o;
  wire n149_o;
  reg [2:0] n179_q;
  reg [4:0] n180_q;
  reg [3:0] n181_q;
  reg n182_q;
  reg n183_q;
  reg n184_q;
  wire n185_o;
  reg n186_q;
  reg n187_q;
  assign cts = n183_q;
  assign txcout = n182_q;
  assign txlen = n187_q;
  assign mdo = n186_q;
  /* ME2.vhd:37:13  */
  always @*
    main_state = n179_q; // (isignal)
  initial
    main_state = 3'b000;
  /* ME2.vhd:38:13  */
  always @*
    main_prcounter = n180_q; // (isignal)
  initial
    main_prcounter = 5'b00000;
  /* ME2.vhd:39:13  */
  always @*
    main_txcounter = n181_q; // (isignal)
  initial
    main_txcounter = 4'b0000;
  /* ME2.vhd:41:13  */
  always @*
    main_txcout_i = n182_q; // (isignal)
  initial
    main_txcout_i = 1'bX;
  /* ME2.vhd:42:13  */
  always @*
    main_cts_i = n183_q; // (isignal)
  initial
    main_cts_i = 1'bX;
  /* ME2.vhd:43:13  */
  always @*
    main_mdo_i = n184_q; // (isignal)
  initial
    main_mdo_i = 1'bX;
  /* ME2.vhd:44:13  */
  always @*
    main_mdo_i1 = n186_q; // (isignal)
  initial
    main_mdo_i1 = 1'bX;
  /* ME2.vhd:45:13  */
  always @*
    main_txlen_i = n187_q; // (isignal)
  initial
    main_txlen_i = 1'bX;
  /* ME2.vhd:65:30  */
  assign n14_o = {28'b0, main_txcounter};  //  uext
  /* ME2.vhd:65:30  */
  assign n16_o = n14_o + 32'b00000000000000000000000000000001;
  assign n17_o = n16_o[3:0];
  /* ME2.vhd:66:19  */
  assign n19_o = {28'b0, n17_o};  //  uext
  /* ME2.vhd:66:19  */
  assign n21_o = n19_o == 32'b00000000000000000000000000000000;
  /* ME2.vhd:66:6  */
  assign n23_o = n21_o ? 1'b0 : main_txcout_i;
  /* ME2.vhd:69:19  */
  assign n24_o = {28'b0, n17_o};  //  uext
  /* ME2.vhd:69:19  */
  assign n26_o = n24_o == 32'b00000000000000000000000000001000;
  /* ME2.vhd:69:6  */
  assign n28_o = n26_o ? 1'b1 : n23_o;
  /* ME2.vhd:76:17  */
  assign n29_o = ~rts;
  /* ME2.vhd:76:10  */
  assign n31_o = n29_o ? 3'b001 : main_state;
  /* ME2.vhd:76:10  */
  assign n33_o = n29_o ? 5'b11110 : main_prcounter;
  /* ME2.vhd:76:10  */
  assign n35_o = n29_o ? 1'b0 : main_mdo_i;
  /* ME2.vhd:75:8  */
  assign n37_o = main_state == 3'b000;
  /* ME2.vhd:84:23  */
  assign n38_o = {28'b0, n17_o};  //  uext
  /* ME2.vhd:84:23  */
  assign n40_o = n38_o == 32'b00000000000000000000000000001000;
  /* ME2.vhd:84:10  */
  assign n42_o = n40_o ? 1'b1 : main_txlen_i;
  /* ME2.vhd:87:23  */
  assign n43_o = {28'b0, n17_o};  //  uext
  /* ME2.vhd:87:23  */
  assign n45_o = n43_o == 32'b00000000000000000000000000001000;
  /* ME2.vhd:89:21  */
  assign n46_o = ~main_mdo_i;
  /* ME2.vhd:91:35  */
  assign n47_o = {27'b0, main_prcounter};  //  uext
  /* ME2.vhd:91:35  */
  assign n49_o = n47_o - 32'b00000000000000000000000000000001;
  /* ME2.vhd:91:12  */
  assign n50_o = n49_o[4:0];  // trunc
  /* ME2.vhd:92:25  */
  assign n51_o = {27'b0, n50_o};  //  uext
  /* ME2.vhd:92:25  */
  assign n53_o = n51_o == 32'b00000000000000000000000000000000;
  /* ME2.vhd:87:10  */
  assign n55_o = n58_o ? 3'b010 : main_state;
  /* ME2.vhd:92:12  */
  assign n57_o = n53_o ? 5'b00010 : n50_o;
  /* ME2.vhd:87:10  */
  assign n58_o = n53_o & n45_o;
  /* ME2.vhd:87:10  */
  assign n59_o = n45_o ? n57_o : main_prcounter;
  /* ME2.vhd:87:10  */
  assign n60_o = n45_o ? n46_o : main_mdo_i;
  /* ME2.vhd:82:8  */
  assign n62_o = main_state == 3'b001;
  /* ME2.vhd:101:23  */
  assign n63_o = {28'b0, n17_o};  //  uext
  /* ME2.vhd:101:23  */
  assign n65_o = n63_o == 32'b00000000000000000000000000001000;
  /* ME2.vhd:103:35  */
  assign n66_o = {27'b0, main_prcounter};  //  uext
  /* ME2.vhd:103:35  */
  assign n68_o = n66_o - 32'b00000000000000000000000000000001;
  /* ME2.vhd:103:12  */
  assign n69_o = n68_o[4:0];  // trunc
  /* ME2.vhd:104:25  */
  assign n70_o = {27'b0, n69_o};  //  uext
  /* ME2.vhd:104:25  */
  assign n72_o = n70_o == 32'b00000000000000000000000000000000;
  /* ME2.vhd:101:10  */
  assign n74_o = n77_o ? 3'b011 : main_state;
  /* ME2.vhd:101:10  */
  assign n76_o = n79_o ? 1'b0 : main_cts_i;
  /* ME2.vhd:101:10  */
  assign n77_o = n72_o & n65_o;
  /* ME2.vhd:101:10  */
  assign n78_o = n65_o ? n69_o : main_prcounter;
  /* ME2.vhd:101:10  */
  assign n79_o = n72_o & n65_o;
  /* ME2.vhd:101:10  */
  assign n81_o = n65_o ? 1'b1 : main_mdo_i;
  /* ME2.vhd:100:8  */
  assign n83_o = main_state == 3'b010;
  /* ME2.vhd:113:23  */
  assign n84_o = {28'b0, n17_o};  //  uext
  /* ME2.vhd:113:23  */
  assign n86_o = n84_o == 32'b00000000000000000000000000001000;
  /* ME2.vhd:113:10  */
  assign n88_o = n95_o ? 3'b100 : main_state;
  /* ME2.vhd:113:10  */
  assign n90_o = n96_o ? 5'b00010 : main_prcounter;
  /* ME2.vhd:113:10  */
  assign n92_o = n97_o ? 1'b1 : main_cts_i;
  /* ME2.vhd:117:12  */
  assign n94_o = rts ? 1'b1 : txd;
  /* ME2.vhd:113:10  */
  assign n95_o = rts & n86_o;
  /* ME2.vhd:113:10  */
  assign n96_o = rts & n86_o;
  /* ME2.vhd:113:10  */
  assign n97_o = rts & n86_o;
  /* ME2.vhd:113:10  */
  assign n98_o = n86_o ? n94_o : main_mdo_i;
  /* ME2.vhd:112:8  */
  assign n100_o = main_state == 3'b011;
  /* ME2.vhd:129:22  */
  assign n101_o = {28'b0, n17_o};  //  uext
  /* ME2.vhd:129:22  */
  assign n103_o = n101_o == 32'b00000000000000000000000000001000;
  /* ME2.vhd:131:40  */
  assign n104_o = {27'b0, main_prcounter};  //  uext
  /* ME2.vhd:131:40  */
  assign n106_o = n104_o - 32'b00000000000000000000000000000001;
  /* ME2.vhd:131:17  */
  assign n107_o = n106_o[4:0];  // trunc
  /* ME2.vhd:132:30  */
  assign n108_o = {27'b0, n107_o};  //  uext
  /* ME2.vhd:132:30  */
  assign n110_o = n108_o == 32'b00000000000000000000000000000000;
  /* ME2.vhd:129:9  */
  assign n112_o = n113_o ? 3'b000 : main_state;
  /* ME2.vhd:129:9  */
  assign n113_o = n110_o & n103_o;
  /* ME2.vhd:129:9  */
  assign n114_o = n103_o ? n107_o : main_prcounter;
  /* ME2.vhd:129:9  */
  assign n116_o = n103_o ? 1'b1 : main_mdo_i;
  /* ME2.vhd:127:9  */
  assign n118_o = main_state == 3'b100;
  assign n119_o = {n118_o, n100_o, n83_o, n62_o, n37_o};
  /* ME2.vhd:73:6  */
  always @*
    case (n119_o)
      5'b10000: n121_o = n112_o;
      5'b01000: n121_o = n88_o;
      5'b00100: n121_o = n74_o;
      5'b00010: n121_o = n55_o;
      5'b00001: n121_o = n31_o;
      default: n121_o = 3'b000;
    endcase
  /* ME2.vhd:73:6  */
  always @*
    case (n119_o)
      5'b10000: n122_o = n114_o;
      5'b01000: n122_o = n90_o;
      5'b00100: n122_o = n78_o;
      5'b00010: n122_o = n59_o;
      5'b00001: n122_o = n33_o;
      default: n122_o = main_prcounter;
    endcase
  /* ME2.vhd:73:6  */
  always @*
    case (n119_o)
      5'b10000: n123_o = main_cts_i;
      5'b01000: n123_o = n92_o;
      5'b00100: n123_o = n76_o;
      5'b00010: n123_o = main_cts_i;
      5'b00001: n123_o = main_cts_i;
      default: n123_o = main_cts_i;
    endcase
  /* ME2.vhd:73:6  */
  always @*
    case (n119_o)
      5'b10000: n124_o = n116_o;
      5'b01000: n124_o = n98_o;
      5'b00100: n124_o = n81_o;
      5'b00010: n124_o = n60_o;
      5'b00001: n124_o = n35_o;
      default: n124_o = main_mdo_i;
    endcase
  /* ME2.vhd:73:6  */
  always @*
    case (n119_o)
      5'b10000: n125_o = main_txlen_i;
      5'b01000: n125_o = main_txlen_i;
      5'b00100: n125_o = main_txlen_i;
      5'b00010: n125_o = n42_o;
      5'b00001: n125_o = main_txlen_i;
      default: n125_o = main_txlen_i;
    endcase
  /* ME2.vhd:155:15  */
  assign n127_o = n121_o != 3'b000;
  /* ME2.vhd:157:17  */
  assign n129_o = n121_o == 3'b100;
  /* ME2.vhd:160:24  */
  assign n130_o = {28'b0, n17_o};  //  uext
  /* ME2.vhd:160:24  */
  assign n132_o = n130_o == 32'b00000000000000000000000000001000;
  /* ME2.vhd:163:21  */
  assign n133_o = ~n124_o;
  /* ME2.vhd:164:24  */
  assign n134_o = {28'b0, n17_o};  //  uext
  /* ME2.vhd:164:24  */
  assign n136_o = n134_o == 32'b00000000000000000000000000000000;
  /* ME2.vhd:164:8  */
  assign n137_o = n136_o ? n124_o : main_mdo_i1;
  /* ME2.vhd:160:8  */
  assign n138_o = n132_o ? n133_o : n137_o;
  /* ME2.vhd:160:8  */
  assign n140_o = n132_o ? 1'b1 : n125_o;
  /* ME2.vhd:157:8  */
  assign n141_o = n129_o ? n124_o : n138_o;
  /* ME2.vhd:157:8  */
  assign n142_o = n129_o ? n125_o : n140_o;
  /* ME2.vhd:168:23  */
  assign n143_o = {28'b0, n17_o};  //  uext
  /* ME2.vhd:168:23  */
  assign n145_o = n143_o == 32'b00000000000000000000000000001000;
  /* ME2.vhd:168:7  */
  assign n147_o = n145_o ? 1'b0 : n125_o;
  /* ME2.vhd:155:6  */
  assign n149_o = n127_o ? n142_o : n147_o;
  /* ME2.vhd:61:4  */
  always @(posedge clkin or posedge rst)
    if (rst)
      n179_q <= 3'b000;
    else
      n179_q <= n121_o;
  /* ME2.vhd:61:4  */
  always @(posedge clkin or posedge rst)
    if (rst)
      n180_q <= 5'b11110;
    else
      n180_q <= n122_o;
  /* ME2.vhd:61:4  */
  always @(posedge clkin or posedge rst)
    if (rst)
      n181_q <= 4'b0000;
    else
      n181_q <= n17_o;
  /* ME2.vhd:61:4  */
  always @(posedge clkin or posedge rst)
    if (rst)
      n182_q <= 1'b0;
    else
      n182_q <= n28_o;
  /* ME2.vhd:61:4  */
  always @(posedge clkin or posedge rst)
    if (rst)
      n183_q <= 1'b1;
    else
      n183_q <= n123_o;
  /* ME2.vhd:61:4  */
  always @(posedge clkin or posedge rst)
    if (rst)
      n184_q <= 1'b0;
    else
      n184_q <= n124_o;
  /* ME2.vhd:61:4  */
  assign n185_o = n127_o ? n141_o : main_mdo_i1;
  /* ME2.vhd:61:4  */
  always @(posedge clkin or posedge rst)
    if (rst)
      n186_q <= 1'b0;
    else
      n186_q <= n185_o;
  /* ME2.vhd:61:4  */
  always @(posedge clkin or posedge rst)
    if (rst)
      n187_q <= 1'b0;
    else
      n187_q <= n149_o;
endmodule

