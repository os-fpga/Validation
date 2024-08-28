//auto-generated LU.v
//datapath for computating LU factorization
//by Wei Zhang

module LU (clk, start, m, n, loop, mode, done, 
			curReadAddrMem, curReadDataMem, curWriteByteEnMem, curWriteDataMem, curWriteAddrMem, curWriteEnMem, curMemSel,
			leftWriteByteEnMem, leftWriteDataMem, leftWriteAddrMem, leftWriteEnMem, leftMemSel);


parameter PRECISION = 32, NUMPE = 230, PEWIDTH = 8, BLOCKWIDTH = 8;
parameter RAMWIDTH = 7360, RAMNUMBYTES = 920, RAMSIZEWIDTH = 8, TOPSIZEWIDTH = 16;
parameter TOPINPUTDELAY = 3, TOPOUTPUTDELAY = 1;
parameter MEMINPUTDELAY = 2, MEMOUTPUTDELAY = 1;

input clk, start;
input[BLOCKWIDTH-1:0] m, n, loop;
input[1:0] mode;
output done;
wire[RAMWIDTH-1:0] curWriteData0, curWriteData1;
wire[RAMSIZEWIDTH-1:0] curWriteAddr0, curReadAddr0, curWriteAddr1, curReadAddr1;
wire[RAMWIDTH-1:0] curReadData0, curReadData1;
wire[RAMNUMBYTES-1:0] curWriteByteEn0, curWriteByteEn1;
wire curWriteEn0, curWriteEn1;

input[RAMWIDTH-1:0] curWriteDataMem;
output[RAMWIDTH-1:0] curReadDataMem;
input[RAMSIZEWIDTH-1:0] curWriteAddrMem, curReadAddrMem;
input[RAMNUMBYTES-1:0] curWriteByteEnMem;
input curWriteEnMem;
input[RAMWIDTH-1:0] leftWriteDataMem;
input[RAMSIZEWIDTH-1:0] leftWriteAddrMem;
input[RAMNUMBYTES-1:0] leftWriteByteEnMem;
input leftWriteEnMem;
input leftMemSel, curMemSel;

wire[RAMWIDTH-1:0] curReadDataLU, curReadDataMem;
wire[RAMWIDTH-1:0] curWriteDataLU, curWriteDataMem;
wire[RAMSIZEWIDTH-1:0] curWriteAddrLU, curWriteAddrMem, curReadAddrLU, curReadAddrMem;
wire[RAMNUMBYTES-1:0] curWriteByteEnLU, curWriteByteEnMem;
wire curWriteEnLU, curWriteEnMem;

reg[RAMWIDTH-1:0] curReadData0Reg[MEMOUTPUTDELAY-1:0], curReadData1Reg[MEMOUTPUTDELAY-1:0];
reg[RAMWIDTH-1:0] leftReadData0Reg[MEMOUTPUTDELAY-1:0], leftReadData1Reg[MEMOUTPUTDELAY-1:0];
reg[RAMWIDTH-1:0] curWriteData0Reg[MEMINPUTDELAY-1:0], curWriteData1Reg[MEMINPUTDELAY-1:0];
reg[RAMSIZEWIDTH-1:0] curWriteAddr0Reg[MEMINPUTDELAY-1:0], curReadAddr0Reg[MEMINPUTDELAY-1:0];
reg[RAMSIZEWIDTH-1:0] curWriteAddr1Reg[MEMINPUTDELAY-1:0], curReadAddr1Reg[MEMINPUTDELAY-1:0];
reg[RAMNUMBYTES-1:0] curWriteByteEn0Reg[MEMINPUTDELAY-1:0], curWriteByteEn1Reg[MEMINPUTDELAY-1:0];
reg curWriteEn0Reg[MEMINPUTDELAY-1:0], curWriteEn1Reg[MEMINPUTDELAY-1:0];
reg[RAMWIDTH-1:0] leftWriteData0Reg[MEMINPUTDELAY-1:0], leftWriteData1Reg[MEMINPUTDELAY-1:0];
reg[RAMSIZEWIDTH-1:0] leftWriteAddr0Reg[MEMINPUTDELAY-1:0], leftReadAddr0Reg[MEMINPUTDELAY-1:0];
reg[RAMSIZEWIDTH-1:0] leftWriteAddr1Reg[MEMINPUTDELAY-1:0], leftReadAddr1Reg[MEMINPUTDELAY-1:0];
reg[RAMNUMBYTES-1:0] leftWriteByteEn0Reg[MEMINPUTDELAY-1:0], leftWriteByteEn1Reg[MEMINPUTDELAY-1:0];
reg leftWriteEn0Reg[MEMINPUTDELAY-1:0], leftWriteEn1Reg[MEMINPUTDELAY-1:0];

reg[PRECISION-1:0] multOperand;
reg[PRECISION-1:0] diag;
wire[PRECISION-1:0] recResult;
wire[PRECISION-1:0] multA[NUMPE-1:0], multResult[NUMPE-1:0];
wire[PRECISION-1:0] addA[NUMPE-1:0], addResult[NUMPE-1:0];

wire[RAMWIDTH-1:0] leftReadData0, leftReadData1, leftWriteData0, leftWriteData1;
wire[RAMSIZEWIDTH-1:0] leftWriteAddr0, leftWriteAddr1, leftReadAddr0, leftReadAddr1;
wire[RAMNUMBYTES-1:0] leftWriteByteEn0, leftWriteByteEn1;
wire leftWriteEn0, leftWriteEn1;
wire[RAMWIDTH-1:0] leftReadDataLU, leftWriteDataLU, leftWriteDataMem;
wire[RAMSIZEWIDTH-1:0] leftWriteAddrLU, leftWriteAddrMem, leftReadAddrLU;
wire[RAMNUMBYTES-1:0] leftWriteByteEnLU, leftWriteByteEnMem;
wire leftWriteEnLU, leftWriteEnMem;

wire[PRECISION-1:0] topWriteData;
reg[PRECISION-1:0] topWriteDataLU;
wire[PRECISION-1:0] topReadData, topReadDataLU;
wire[TOPSIZEWIDTH-1:0] topWriteAddr, topWriteAddrLU, topReadAddr, topReadAddrLU;
wire topWriteEn, topWriteEnLU;

reg[PRECISION-1:0] topReadDataReg[TOPOUTPUTDELAY-1:0];
reg[PRECISION-1:0] topWriteDataReg[TOPINPUTDELAY-1:0];
reg[TOPSIZEWIDTH-1:0] topWriteAddrReg[TOPINPUTDELAY-1:0], topReadAddrReg[TOPINPUTDELAY-1:0];
reg topWriteEnReg[TOPINPUTDELAY-1:0];

wire[RAMWIDTH-1:0] rcWriteData;
wire leftWriteSel, curWriteSel, topSourceSel;
wire diagEn;
wire[PEWIDTH-1:0] topWriteSel;

wire MOSel;
wire MOEn;

// control block
LUControl conBlock (clk, start, m, n, loop, mode, done, 
                    curReadAddrLU, curWriteAddrLU, curWriteByteEnLU, curWriteEnLU, curWriteSel,
                    leftReadAddrLU, leftWriteAddrLU, leftWriteByteEnLU, leftWriteEnLU,  leftWriteSel,
                    topReadAddrLU, topWriteAddrLU, topWriteEnLU, topWriteSel, topSourceSel, diagEn, MOSel, MOEn);

// fp_div unit
divsp rec (clk, 32'h3F800000, diag, recResult);

// on-chip memory blocks that store the matrix to be LU factorized
// store current blocks data
ram currentBlock0 (curWriteByteEn0, clk, curWriteData0, curReadAddr0, curWriteAddr0, curWriteEn0, curReadData0);
ram currentBlock1 (curWriteByteEn1, clk, curWriteData1, curReadAddr1, curWriteAddr1, curWriteEn1, curReadData1);
// store left blocks data
ram leftBlock0(leftWriteByteEn0, clk, leftWriteData0, leftReadAddr0, leftWriteAddr0, leftWriteEn0, leftReadData0);

ram leftBlock1(leftWriteByteEn1, clk, leftWriteData1, leftReadAddr1, leftWriteAddr1, leftWriteEn1, leftReadData1);

// store top block data
top_ram topBlock(clk, topWriteData, topReadAddr, topWriteAddr, topWriteEn, topReadDataLU);

// processing elements that does the main computation of LU factorization
mult_add PE0 (clk, multA[0], multOperand, addA[0], multResult[0], addResult[0]);
mult_add PE1 (clk, multA[1], multOperand, addA[1], multResult[1], addResult[1]);
mult_add PE2 (clk, multA[2], multOperand, addA[2], multResult[2], addResult[2]);
mult_add PE3 (clk, multA[3], multOperand, addA[3], multResult[3], addResult[3]);
mult_add PE4 (clk, multA[4], multOperand, addA[4], multResult[4], addResult[4]);
mult_add PE5 (clk, multA[5], multOperand, addA[5], multResult[5], addResult[5]);
mult_add PE6 (clk, multA[6], multOperand, addA[6], multResult[6], addResult[6]);
mult_add PE7 (clk, multA[7], multOperand, addA[7], multResult[7], addResult[7]);
mult_add PE8 (clk, multA[8], multOperand, addA[8], multResult[8], addResult[8]);
mult_add PE9 (clk, multA[9], multOperand, addA[9], multResult[9], addResult[9]);
mult_add PE10 (clk, multA[10], multOperand, addA[10], multResult[10], addResult[10]);
mult_add PE11 (clk, multA[11], multOperand, addA[11], multResult[11], addResult[11]);
mult_add PE12 (clk, multA[12], multOperand, addA[12], multResult[12], addResult[12]);
mult_add PE13 (clk, multA[13], multOperand, addA[13], multResult[13], addResult[13]);
mult_add PE14 (clk, multA[14], multOperand, addA[14], multResult[14], addResult[14]);
mult_add PE15 (clk, multA[15], multOperand, addA[15], multResult[15], addResult[15]);
mult_add PE16 (clk, multA[16], multOperand, addA[16], multResult[16], addResult[16]);
mult_add PE17 (clk, multA[17], multOperand, addA[17], multResult[17], addResult[17]);
mult_add PE18 (clk, multA[18], multOperand, addA[18], multResult[18], addResult[18]);
mult_add PE19 (clk, multA[19], multOperand, addA[19], multResult[19], addResult[19]);
mult_add PE20 (clk, multA[20], multOperand, addA[20], multResult[20], addResult[20]);
mult_add PE21 (clk, multA[21], multOperand, addA[21], multResult[21], addResult[21]);
mult_add PE22 (clk, multA[22], multOperand, addA[22], multResult[22], addResult[22]);
mult_add PE23 (clk, multA[23], multOperand, addA[23], multResult[23], addResult[23]);
mult_add PE24 (clk, multA[24], multOperand, addA[24], multResult[24], addResult[24]);
mult_add PE25 (clk, multA[25], multOperand, addA[25], multResult[25], addResult[25]);
mult_add PE26 (clk, multA[26], multOperand, addA[26], multResult[26], addResult[26]);
mult_add PE27 (clk, multA[27], multOperand, addA[27], multResult[27], addResult[27]);
mult_add PE28 (clk, multA[28], multOperand, addA[28], multResult[28], addResult[28]);
mult_add PE29 (clk, multA[29], multOperand, addA[29], multResult[29], addResult[29]);
mult_add PE30 (clk, multA[30], multOperand, addA[30], multResult[30], addResult[30]);
mult_add PE31 (clk, multA[31], multOperand, addA[31], multResult[31], addResult[31]);
mult_add PE32 (clk, multA[32], multOperand, addA[32], multResult[32], addResult[32]);
mult_add PE33 (clk, multA[33], multOperand, addA[33], multResult[33], addResult[33]);
mult_add PE34 (clk, multA[34], multOperand, addA[34], multResult[34], addResult[34]);
mult_add PE35 (clk, multA[35], multOperand, addA[35], multResult[35], addResult[35]);
mult_add PE36 (clk, multA[36], multOperand, addA[36], multResult[36], addResult[36]);
mult_add PE37 (clk, multA[37], multOperand, addA[37], multResult[37], addResult[37]);
mult_add PE38 (clk, multA[38], multOperand, addA[38], multResult[38], addResult[38]);
mult_add PE39 (clk, multA[39], multOperand, addA[39], multResult[39], addResult[39]);
mult_add PE40 (clk, multA[40], multOperand, addA[40], multResult[40], addResult[40]);
mult_add PE41 (clk, multA[41], multOperand, addA[41], multResult[41], addResult[41]);
mult_add PE42 (clk, multA[42], multOperand, addA[42], multResult[42], addResult[42]);
mult_add PE43 (clk, multA[43], multOperand, addA[43], multResult[43], addResult[43]);
mult_add PE44 (clk, multA[44], multOperand, addA[44], multResult[44], addResult[44]);
mult_add PE45 (clk, multA[45], multOperand, addA[45], multResult[45], addResult[45]);
mult_add PE46 (clk, multA[46], multOperand, addA[46], multResult[46], addResult[46]);
mult_add PE47 (clk, multA[47], multOperand, addA[47], multResult[47], addResult[47]);
mult_add PE48 (clk, multA[48], multOperand, addA[48], multResult[48], addResult[48]);
mult_add PE49 (clk, multA[49], multOperand, addA[49], multResult[49], addResult[49]);
mult_add PE50 (clk, multA[50], multOperand, addA[50], multResult[50], addResult[50]);
mult_add PE51 (clk, multA[51], multOperand, addA[51], multResult[51], addResult[51]);
mult_add PE52 (clk, multA[52], multOperand, addA[52], multResult[52], addResult[52]);
mult_add PE53 (clk, multA[53], multOperand, addA[53], multResult[53], addResult[53]);
mult_add PE54 (clk, multA[54], multOperand, addA[54], multResult[54], addResult[54]);
mult_add PE55 (clk, multA[55], multOperand, addA[55], multResult[55], addResult[55]);
mult_add PE56 (clk, multA[56], multOperand, addA[56], multResult[56], addResult[56]);
mult_add PE57 (clk, multA[57], multOperand, addA[57], multResult[57], addResult[57]);
mult_add PE58 (clk, multA[58], multOperand, addA[58], multResult[58], addResult[58]);
mult_add PE59 (clk, multA[59], multOperand, addA[59], multResult[59], addResult[59]);
mult_add PE60 (clk, multA[60], multOperand, addA[60], multResult[60], addResult[60]);
mult_add PE61 (clk, multA[61], multOperand, addA[61], multResult[61], addResult[61]);
mult_add PE62 (clk, multA[62], multOperand, addA[62], multResult[62], addResult[62]);
mult_add PE63 (clk, multA[63], multOperand, addA[63], multResult[63], addResult[63]);
mult_add PE64 (clk, multA[64], multOperand, addA[64], multResult[64], addResult[64]);
mult_add PE65 (clk, multA[65], multOperand, addA[65], multResult[65], addResult[65]);
mult_add PE66 (clk, multA[66], multOperand, addA[66], multResult[66], addResult[66]);
mult_add PE67 (clk, multA[67], multOperand, addA[67], multResult[67], addResult[67]);
mult_add PE68 (clk, multA[68], multOperand, addA[68], multResult[68], addResult[68]);
mult_add PE69 (clk, multA[69], multOperand, addA[69], multResult[69], addResult[69]);
mult_add PE70 (clk, multA[70], multOperand, addA[70], multResult[70], addResult[70]);
mult_add PE71 (clk, multA[71], multOperand, addA[71], multResult[71], addResult[71]);
mult_add PE72 (clk, multA[72], multOperand, addA[72], multResult[72], addResult[72]);
mult_add PE73 (clk, multA[73], multOperand, addA[73], multResult[73], addResult[73]);
mult_add PE74 (clk, multA[74], multOperand, addA[74], multResult[74], addResult[74]);
mult_add PE75 (clk, multA[75], multOperand, addA[75], multResult[75], addResult[75]);
mult_add PE76 (clk, multA[76], multOperand, addA[76], multResult[76], addResult[76]);
mult_add PE77 (clk, multA[77], multOperand, addA[77], multResult[77], addResult[77]);
mult_add PE78 (clk, multA[78], multOperand, addA[78], multResult[78], addResult[78]);
mult_add PE79 (clk, multA[79], multOperand, addA[79], multResult[79], addResult[79]);
mult_add PE80 (clk, multA[80], multOperand, addA[80], multResult[80], addResult[80]);
mult_add PE81 (clk, multA[81], multOperand, addA[81], multResult[81], addResult[81]);
mult_add PE82 (clk, multA[82], multOperand, addA[82], multResult[82], addResult[82]);
mult_add PE83 (clk, multA[83], multOperand, addA[83], multResult[83], addResult[83]);
mult_add PE84 (clk, multA[84], multOperand, addA[84], multResult[84], addResult[84]);
mult_add PE85 (clk, multA[85], multOperand, addA[85], multResult[85], addResult[85]);
mult_add PE86 (clk, multA[86], multOperand, addA[86], multResult[86], addResult[86]);
mult_add PE87 (clk, multA[87], multOperand, addA[87], multResult[87], addResult[87]);
mult_add PE88 (clk, multA[88], multOperand, addA[88], multResult[88], addResult[88]);
mult_add PE89 (clk, multA[89], multOperand, addA[89], multResult[89], addResult[89]);
mult_add PE90 (clk, multA[90], multOperand, addA[90], multResult[90], addResult[90]);
mult_add PE91 (clk, multA[91], multOperand, addA[91], multResult[91], addResult[91]);
mult_add PE92 (clk, multA[92], multOperand, addA[92], multResult[92], addResult[92]);
mult_add PE93 (clk, multA[93], multOperand, addA[93], multResult[93], addResult[93]);
mult_add PE94 (clk, multA[94], multOperand, addA[94], multResult[94], addResult[94]);
mult_add PE95 (clk, multA[95], multOperand, addA[95], multResult[95], addResult[95]);
mult_add PE96 (clk, multA[96], multOperand, addA[96], multResult[96], addResult[96]);
mult_add PE97 (clk, multA[97], multOperand, addA[97], multResult[97], addResult[97]);
mult_add PE98 (clk, multA[98], multOperand, addA[98], multResult[98], addResult[98]);
mult_add PE99 (clk, multA[99], multOperand, addA[99], multResult[99], addResult[99]);
mult_add PE100 (clk, multA[100], multOperand, addA[100], multResult[100], addResult[100]);
mult_add PE101 (clk, multA[101], multOperand, addA[101], multResult[101], addResult[101]);
mult_add PE102 (clk, multA[102], multOperand, addA[102], multResult[102], addResult[102]);
mult_add PE103 (clk, multA[103], multOperand, addA[103], multResult[103], addResult[103]);
mult_add PE104 (clk, multA[104], multOperand, addA[104], multResult[104], addResult[104]);
mult_add PE105 (clk, multA[105], multOperand, addA[105], multResult[105], addResult[105]);
mult_add PE106 (clk, multA[106], multOperand, addA[106], multResult[106], addResult[106]);
mult_add PE107 (clk, multA[107], multOperand, addA[107], multResult[107], addResult[107]);
mult_add PE108 (clk, multA[108], multOperand, addA[108], multResult[108], addResult[108]);
mult_add PE109 (clk, multA[109], multOperand, addA[109], multResult[109], addResult[109]);
mult_add PE110 (clk, multA[110], multOperand, addA[110], multResult[110], addResult[110]);
mult_add PE111 (clk, multA[111], multOperand, addA[111], multResult[111], addResult[111]);
mult_add PE112 (clk, multA[112], multOperand, addA[112], multResult[112], addResult[112]);
mult_add PE113 (clk, multA[113], multOperand, addA[113], multResult[113], addResult[113]);
mult_add PE114 (clk, multA[114], multOperand, addA[114], multResult[114], addResult[114]);
mult_add PE115 (clk, multA[115], multOperand, addA[115], multResult[115], addResult[115]);
mult_add PE116 (clk, multA[116], multOperand, addA[116], multResult[116], addResult[116]);
mult_add PE117 (clk, multA[117], multOperand, addA[117], multResult[117], addResult[117]);
mult_add PE118 (clk, multA[118], multOperand, addA[118], multResult[118], addResult[118]);
mult_add PE119 (clk, multA[119], multOperand, addA[119], multResult[119], addResult[119]);
mult_add PE120 (clk, multA[120], multOperand, addA[120], multResult[120], addResult[120]);
mult_add PE121 (clk, multA[121], multOperand, addA[121], multResult[121], addResult[121]);
mult_add PE122 (clk, multA[122], multOperand, addA[122], multResult[122], addResult[122]);
mult_add PE123 (clk, multA[123], multOperand, addA[123], multResult[123], addResult[123]);
mult_add PE124 (clk, multA[124], multOperand, addA[124], multResult[124], addResult[124]);
mult_add PE125 (clk, multA[125], multOperand, addA[125], multResult[125], addResult[125]);
mult_add PE126 (clk, multA[126], multOperand, addA[126], multResult[126], addResult[126]);
mult_add PE127 (clk, multA[127], multOperand, addA[127], multResult[127], addResult[127]);
mult_add PE128 (clk, multA[128], multOperand, addA[128], multResult[128], addResult[128]);
mult_add PE129 (clk, multA[129], multOperand, addA[129], multResult[129], addResult[129]);
mult_add PE130 (clk, multA[130], multOperand, addA[130], multResult[130], addResult[130]);
mult_add PE131 (clk, multA[131], multOperand, addA[131], multResult[131], addResult[131]);
mult_add PE132 (clk, multA[132], multOperand, addA[132], multResult[132], addResult[132]);
mult_add PE133 (clk, multA[133], multOperand, addA[133], multResult[133], addResult[133]);
mult_add PE134 (clk, multA[134], multOperand, addA[134], multResult[134], addResult[134]);
mult_add PE135 (clk, multA[135], multOperand, addA[135], multResult[135], addResult[135]);
mult_add PE136 (clk, multA[136], multOperand, addA[136], multResult[136], addResult[136]);
mult_add PE137 (clk, multA[137], multOperand, addA[137], multResult[137], addResult[137]);
mult_add PE138 (clk, multA[138], multOperand, addA[138], multResult[138], addResult[138]);
mult_add PE139 (clk, multA[139], multOperand, addA[139], multResult[139], addResult[139]);
mult_add PE140 (clk, multA[140], multOperand, addA[140], multResult[140], addResult[140]);
mult_add PE141 (clk, multA[141], multOperand, addA[141], multResult[141], addResult[141]);
mult_add PE142 (clk, multA[142], multOperand, addA[142], multResult[142], addResult[142]);
mult_add PE143 (clk, multA[143], multOperand, addA[143], multResult[143], addResult[143]);
mult_add PE144 (clk, multA[144], multOperand, addA[144], multResult[144], addResult[144]);
mult_add PE145 (clk, multA[145], multOperand, addA[145], multResult[145], addResult[145]);
mult_add PE146 (clk, multA[146], multOperand, addA[146], multResult[146], addResult[146]);
mult_add PE147 (clk, multA[147], multOperand, addA[147], multResult[147], addResult[147]);
mult_add PE148 (clk, multA[148], multOperand, addA[148], multResult[148], addResult[148]);
mult_add PE149 (clk, multA[149], multOperand, addA[149], multResult[149], addResult[149]);
mult_add PE150 (clk, multA[150], multOperand, addA[150], multResult[150], addResult[150]);
mult_add PE151 (clk, multA[151], multOperand, addA[151], multResult[151], addResult[151]);
mult_add PE152 (clk, multA[152], multOperand, addA[152], multResult[152], addResult[152]);
mult_add PE153 (clk, multA[153], multOperand, addA[153], multResult[153], addResult[153]);
mult_add PE154 (clk, multA[154], multOperand, addA[154], multResult[154], addResult[154]);
mult_add PE155 (clk, multA[155], multOperand, addA[155], multResult[155], addResult[155]);
mult_add PE156 (clk, multA[156], multOperand, addA[156], multResult[156], addResult[156]);
mult_add PE157 (clk, multA[157], multOperand, addA[157], multResult[157], addResult[157]);
mult_add PE158 (clk, multA[158], multOperand, addA[158], multResult[158], addResult[158]);
mult_add PE159 (clk, multA[159], multOperand, addA[159], multResult[159], addResult[159]);
mult_add PE160 (clk, multA[160], multOperand, addA[160], multResult[160], addResult[160]);
mult_add PE161 (clk, multA[161], multOperand, addA[161], multResult[161], addResult[161]);
mult_add PE162 (clk, multA[162], multOperand, addA[162], multResult[162], addResult[162]);
mult_add PE163 (clk, multA[163], multOperand, addA[163], multResult[163], addResult[163]);
mult_add PE164 (clk, multA[164], multOperand, addA[164], multResult[164], addResult[164]);
mult_add PE165 (clk, multA[165], multOperand, addA[165], multResult[165], addResult[165]);
mult_add PE166 (clk, multA[166], multOperand, addA[166], multResult[166], addResult[166]);
mult_add PE167 (clk, multA[167], multOperand, addA[167], multResult[167], addResult[167]);
mult_add PE168 (clk, multA[168], multOperand, addA[168], multResult[168], addResult[168]);
mult_add PE169 (clk, multA[169], multOperand, addA[169], multResult[169], addResult[169]);
mult_add PE170 (clk, multA[170], multOperand, addA[170], multResult[170], addResult[170]);
mult_add PE171 (clk, multA[171], multOperand, addA[171], multResult[171], addResult[171]);
mult_add PE172 (clk, multA[172], multOperand, addA[172], multResult[172], addResult[172]);
mult_add PE173 (clk, multA[173], multOperand, addA[173], multResult[173], addResult[173]);
mult_add PE174 (clk, multA[174], multOperand, addA[174], multResult[174], addResult[174]);
mult_add PE175 (clk, multA[175], multOperand, addA[175], multResult[175], addResult[175]);
mult_add PE176 (clk, multA[176], multOperand, addA[176], multResult[176], addResult[176]);
mult_add PE177 (clk, multA[177], multOperand, addA[177], multResult[177], addResult[177]);
mult_add PE178 (clk, multA[178], multOperand, addA[178], multResult[178], addResult[178]);
mult_add PE179 (clk, multA[179], multOperand, addA[179], multResult[179], addResult[179]);
mult_add PE180 (clk, multA[180], multOperand, addA[180], multResult[180], addResult[180]);
mult_add PE181 (clk, multA[181], multOperand, addA[181], multResult[181], addResult[181]);
mult_add PE182 (clk, multA[182], multOperand, addA[182], multResult[182], addResult[182]);
mult_add PE183 (clk, multA[183], multOperand, addA[183], multResult[183], addResult[183]);
mult_add PE184 (clk, multA[184], multOperand, addA[184], multResult[184], addResult[184]);
mult_add PE185 (clk, multA[185], multOperand, addA[185], multResult[185], addResult[185]);
mult_add PE186 (clk, multA[186], multOperand, addA[186], multResult[186], addResult[186]);
mult_add PE187 (clk, multA[187], multOperand, addA[187], multResult[187], addResult[187]);
mult_add PE188 (clk, multA[188], multOperand, addA[188], multResult[188], addResult[188]);
mult_add PE189 (clk, multA[189], multOperand, addA[189], multResult[189], addResult[189]);
mult_add PE190 (clk, multA[190], multOperand, addA[190], multResult[190], addResult[190]);
mult_add PE191 (clk, multA[191], multOperand, addA[191], multResult[191], addResult[191]);
mult_add PE192 (clk, multA[192], multOperand, addA[192], multResult[192], addResult[192]);
mult_add PE193 (clk, multA[193], multOperand, addA[193], multResult[193], addResult[193]);
mult_add PE194 (clk, multA[194], multOperand, addA[194], multResult[194], addResult[194]);
mult_add PE195 (clk, multA[195], multOperand, addA[195], multResult[195], addResult[195]);
mult_add PE196 (clk, multA[196], multOperand, addA[196], multResult[196], addResult[196]);
mult_add PE197 (clk, multA[197], multOperand, addA[197], multResult[197], addResult[197]);
mult_add PE198 (clk, multA[198], multOperand, addA[198], multResult[198], addResult[198]);
mult_add PE199 (clk, multA[199], multOperand, addA[199], multResult[199], addResult[199]);
mult_add PE200 (clk, multA[200], multOperand, addA[200], multResult[200], addResult[200]);
mult_add PE201 (clk, multA[201], multOperand, addA[201], multResult[201], addResult[201]);
mult_add PE202 (clk, multA[202], multOperand, addA[202], multResult[202], addResult[202]);
mult_add PE203 (clk, multA[203], multOperand, addA[203], multResult[203], addResult[203]);
mult_add PE204 (clk, multA[204], multOperand, addA[204], multResult[204], addResult[204]);
mult_add PE205 (clk, multA[205], multOperand, addA[205], multResult[205], addResult[205]);
mult_add PE206 (clk, multA[206], multOperand, addA[206], multResult[206], addResult[206]);
mult_add PE207 (clk, multA[207], multOperand, addA[207], multResult[207], addResult[207]);
mult_add PE208 (clk, multA[208], multOperand, addA[208], multResult[208], addResult[208]);
mult_add PE209 (clk, multA[209], multOperand, addA[209], multResult[209], addResult[209]);
mult_add PE210 (clk, multA[210], multOperand, addA[210], multResult[210], addResult[210]);
mult_add PE211 (clk, multA[211], multOperand, addA[211], multResult[211], addResult[211]);
mult_add PE212 (clk, multA[212], multOperand, addA[212], multResult[212], addResult[212]);
mult_add PE213 (clk, multA[213], multOperand, addA[213], multResult[213], addResult[213]);
mult_add PE214 (clk, multA[214], multOperand, addA[214], multResult[214], addResult[214]);
mult_add PE215 (clk, multA[215], multOperand, addA[215], multResult[215], addResult[215]);
mult_add PE216 (clk, multA[216], multOperand, addA[216], multResult[216], addResult[216]);
mult_add PE217 (clk, multA[217], multOperand, addA[217], multResult[217], addResult[217]);
mult_add PE218 (clk, multA[218], multOperand, addA[218], multResult[218], addResult[218]);
mult_add PE219 (clk, multA[219], multOperand, addA[219], multResult[219], addResult[219]);
mult_add PE220 (clk, multA[220], multOperand, addA[220], multResult[220], addResult[220]);
mult_add PE221 (clk, multA[221], multOperand, addA[221], multResult[221], addResult[221]);
mult_add PE222 (clk, multA[222], multOperand, addA[222], multResult[222], addResult[222]);
mult_add PE223 (clk, multA[223], multOperand, addA[223], multResult[223], addResult[223]);
mult_add PE224 (clk, multA[224], multOperand, addA[224], multResult[224], addResult[224]);
mult_add PE225 (clk, multA[225], multOperand, addA[225], multResult[225], addResult[225]);
mult_add PE226 (clk, multA[226], multOperand, addA[226], multResult[226], addResult[226]);
mult_add PE227 (clk, multA[227], multOperand, addA[227], multResult[227], addResult[227]);
mult_add PE228 (clk, multA[228], multOperand, addA[228], multResult[228], addResult[228]);
mult_add PE229 (clk, multA[229], multOperand, addA[229], multResult[229], addResult[229]);

// connect to ports of the left blocks
assign leftWriteDataLU = (leftWriteSel == 0) ? curReadDataLU : rcWriteData;
always @ (posedge clk)
begin
	if(leftMemSel == 0)
	begin
		leftWriteData0Reg[0] <= leftWriteDataMem;
		leftWriteAddr0Reg[0] <= leftWriteAddrMem;
		leftWriteByteEn0Reg[0] <= leftWriteByteEnMem;
		leftWriteEn0Reg[0] <= leftWriteEnMem;
		leftWriteData1Reg[0] <= leftWriteDataLU;
		leftWriteAddr1Reg[0] <= leftWriteAddrLU;
		leftWriteByteEn1Reg[0] <= leftWriteByteEnLU;
		leftWriteEn1Reg[0] <= leftWriteEnLU;
	end
	else
	begin
		leftWriteData0Reg[0] <= leftWriteDataLU;
		leftWriteAddr0Reg[0] <= leftWriteAddrLU;
		leftWriteByteEn0Reg[0] <= leftWriteByteEnLU;
		leftWriteEn0Reg[0] <= leftWriteEnLU;
		leftWriteData1Reg[0] <= leftWriteDataMem;
		leftWriteAddr1Reg[0] <= leftWriteAddrMem;
		leftWriteByteEn1Reg[0] <= leftWriteByteEnMem;
		leftWriteEn1Reg[0] <= leftWriteEnMem;
	end
	leftReadAddr0Reg[0] <= leftReadAddrLU;
	leftReadAddr1Reg[0] <= leftReadAddrLU;
	leftWriteData0Reg[1] <= leftWriteData0Reg[0];
	leftWriteAddr0Reg[1] <= leftWriteAddr0Reg[0];
	leftReadAddr0Reg[1] <= leftReadAddr0Reg[0];
	leftWriteByteEn0Reg[1] <= leftWriteByteEn0Reg[0];
	leftWriteEn0Reg[1] <= leftWriteEn0Reg[0];
	leftWriteData1Reg[1] <= leftWriteData1Reg[0];
	leftWriteAddr1Reg[1] <= leftWriteAddr1Reg[0];
	leftReadAddr1Reg[1] <= leftReadAddr1Reg[0];
	leftWriteByteEn1Reg[1] <= leftWriteByteEn1Reg[0];
	leftWriteEn1Reg[1] <= leftWriteEn1Reg[0];
end
assign leftWriteData0 = leftWriteData0Reg[1];
assign leftWriteAddr0 = leftWriteAddr0Reg[1];
assign leftReadAddr0 = leftReadAddr0Reg[1];
assign leftWriteByteEn0 = leftWriteByteEn0Reg[1];
assign leftWriteEn0 = leftWriteEn0Reg[1];
assign leftWriteData1 = leftWriteData1Reg[1];
assign leftWriteAddr1 = leftWriteAddr1Reg[1];
assign leftReadAddr1 = leftReadAddr1Reg[1];
assign leftWriteByteEn1 = leftWriteByteEn1Reg[1];
assign leftWriteEn1 = leftWriteEn1Reg[1];

always @ (posedge clk)
begin
		leftReadData0Reg[0] <= leftReadData0;
		leftReadData1Reg[0] <= leftReadData1;
end
assign leftReadDataLU = (leftMemSel == 0) ? leftReadData1Reg[0] : leftReadData0Reg[0];
// data feed to fp div unit
always @ (posedge clk)
begin
	if (diagEn == 1)
	begin
			diag <= topReadData;
	end
end
// one of the inputs to the PE
always @ (posedge clk)
begin
	if (start == 1)
		multOperand <= 0;
	else if (MOEn == 1)
	begin
		if (MOSel == 0)
			multOperand <= recResult;
		else
			multOperand <= topReadData;
	end
end

// connections to top block memory ports
always @ (*)
begin
	if (topSourceSel == 0)
		case (topWriteSel)
		0:
			topWriteDataLU = curReadDataLU[7359:7328];
		1:
			topWriteDataLU = curReadDataLU[7327:7296];
		2:
			topWriteDataLU = curReadDataLU[7295:7264];
		3:
			topWriteDataLU = curReadDataLU[7263:7232];
		4:
			topWriteDataLU = curReadDataLU[7231:7200];
		5:
			topWriteDataLU = curReadDataLU[7199:7168];
		6:
			topWriteDataLU = curReadDataLU[7167:7136];
		7:
			topWriteDataLU = curReadDataLU[7135:7104];
		8:
			topWriteDataLU = curReadDataLU[7103:7072];
		9:
			topWriteDataLU = curReadDataLU[7071:7040];
		10:
			topWriteDataLU = curReadDataLU[7039:7008];
		11:
			topWriteDataLU = curReadDataLU[7007:6976];
		12:
			topWriteDataLU = curReadDataLU[6975:6944];
		13:
			topWriteDataLU = curReadDataLU[6943:6912];
		14:
			topWriteDataLU = curReadDataLU[6911:6880];
		15:
			topWriteDataLU = curReadDataLU[6879:6848];
		16:
			topWriteDataLU = curReadDataLU[6847:6816];
		17:
			topWriteDataLU = curReadDataLU[6815:6784];
		18:
			topWriteDataLU = curReadDataLU[6783:6752];
		19:
			topWriteDataLU = curReadDataLU[6751:6720];
		20:
			topWriteDataLU = curReadDataLU[6719:6688];
		21:
			topWriteDataLU = curReadDataLU[6687:6656];
		22:
			topWriteDataLU = curReadDataLU[6655:6624];
		23:
			topWriteDataLU = curReadDataLU[6623:6592];
		24:
			topWriteDataLU = curReadDataLU[6591:6560];
		25:
			topWriteDataLU = curReadDataLU[6559:6528];
		26:
			topWriteDataLU = curReadDataLU[6527:6496];
		27:
			topWriteDataLU = curReadDataLU[6495:6464];
		28:
			topWriteDataLU = curReadDataLU[6463:6432];
		29:
			topWriteDataLU = curReadDataLU[6431:6400];
		30:
			topWriteDataLU = curReadDataLU[6399:6368];
		31:
			topWriteDataLU = curReadDataLU[6367:6336];
		32:
			topWriteDataLU = curReadDataLU[6335:6304];
		33:
			topWriteDataLU = curReadDataLU[6303:6272];
		34:
			topWriteDataLU = curReadDataLU[6271:6240];
		35:
			topWriteDataLU = curReadDataLU[6239:6208];
		36:
			topWriteDataLU = curReadDataLU[6207:6176];
		37:
			topWriteDataLU = curReadDataLU[6175:6144];
		38:
			topWriteDataLU = curReadDataLU[6143:6112];
		39:
			topWriteDataLU = curReadDataLU[6111:6080];
		40:
			topWriteDataLU = curReadDataLU[6079:6048];
		41:
			topWriteDataLU = curReadDataLU[6047:6016];
		42:
			topWriteDataLU = curReadDataLU[6015:5984];
		43:
			topWriteDataLU = curReadDataLU[5983:5952];
		44:
			topWriteDataLU = curReadDataLU[5951:5920];
		45:
			topWriteDataLU = curReadDataLU[5919:5888];
		46:
			topWriteDataLU = curReadDataLU[5887:5856];
		47:
			topWriteDataLU = curReadDataLU[5855:5824];
		48:
			topWriteDataLU = curReadDataLU[5823:5792];
		49:
			topWriteDataLU = curReadDataLU[5791:5760];
		50:
			topWriteDataLU = curReadDataLU[5759:5728];
		51:
			topWriteDataLU = curReadDataLU[5727:5696];
		52:
			topWriteDataLU = curReadDataLU[5695:5664];
		53:
			topWriteDataLU = curReadDataLU[5663:5632];
		54:
			topWriteDataLU = curReadDataLU[5631:5600];
		55:
			topWriteDataLU = curReadDataLU[5599:5568];
		56:
			topWriteDataLU = curReadDataLU[5567:5536];
		57:
			topWriteDataLU = curReadDataLU[5535:5504];
		58:
			topWriteDataLU = curReadDataLU[5503:5472];
		59:
			topWriteDataLU = curReadDataLU[5471:5440];
		60:
			topWriteDataLU = curReadDataLU[5439:5408];
		61:
			topWriteDataLU = curReadDataLU[5407:5376];
		62:
			topWriteDataLU = curReadDataLU[5375:5344];
		63:
			topWriteDataLU = curReadDataLU[5343:5312];
		64:
			topWriteDataLU = curReadDataLU[5311:5280];
		65:
			topWriteDataLU = curReadDataLU[5279:5248];
		66:
			topWriteDataLU = curReadDataLU[5247:5216];
		67:
			topWriteDataLU = curReadDataLU[5215:5184];
		68:
			topWriteDataLU = curReadDataLU[5183:5152];
		69:
			topWriteDataLU = curReadDataLU[5151:5120];
		70:
			topWriteDataLU = curReadDataLU[5119:5088];
		71:
			topWriteDataLU = curReadDataLU[5087:5056];
		72:
			topWriteDataLU = curReadDataLU[5055:5024];
		73:
			topWriteDataLU = curReadDataLU[5023:4992];
		74:
			topWriteDataLU = curReadDataLU[4991:4960];
		75:
			topWriteDataLU = curReadDataLU[4959:4928];
		76:
			topWriteDataLU = curReadDataLU[4927:4896];
		77:
			topWriteDataLU = curReadDataLU[4895:4864];
		78:
			topWriteDataLU = curReadDataLU[4863:4832];
		79:
			topWriteDataLU = curReadDataLU[4831:4800];
		80:
			topWriteDataLU = curReadDataLU[4799:4768];
		81:
			topWriteDataLU = curReadDataLU[4767:4736];
		82:
			topWriteDataLU = curReadDataLU[4735:4704];
		83:
			topWriteDataLU = curReadDataLU[4703:4672];
		84:
			topWriteDataLU = curReadDataLU[4671:4640];
		85:
			topWriteDataLU = curReadDataLU[4639:4608];
		86:
			topWriteDataLU = curReadDataLU[4607:4576];
		87:
			topWriteDataLU = curReadDataLU[4575:4544];
		88:
			topWriteDataLU = curReadDataLU[4543:4512];
		89:
			topWriteDataLU = curReadDataLU[4511:4480];
		90:
			topWriteDataLU = curReadDataLU[4479:4448];
		91:
			topWriteDataLU = curReadDataLU[4447:4416];
		92:
			topWriteDataLU = curReadDataLU[4415:4384];
		93:
			topWriteDataLU = curReadDataLU[4383:4352];
		94:
			topWriteDataLU = curReadDataLU[4351:4320];
		95:
			topWriteDataLU = curReadDataLU[4319:4288];
		96:
			topWriteDataLU = curReadDataLU[4287:4256];
		97:
			topWriteDataLU = curReadDataLU[4255:4224];
		98:
			topWriteDataLU = curReadDataLU[4223:4192];
		99:
			topWriteDataLU = curReadDataLU[4191:4160];
		100:
			topWriteDataLU = curReadDataLU[4159:4128];
		101:
			topWriteDataLU = curReadDataLU[4127:4096];
		102:
			topWriteDataLU = curReadDataLU[4095:4064];
		103:
			topWriteDataLU = curReadDataLU[4063:4032];
		104:
			topWriteDataLU = curReadDataLU[4031:4000];
		105:
			topWriteDataLU = curReadDataLU[3999:3968];
		106:
			topWriteDataLU = curReadDataLU[3967:3936];
		107:
			topWriteDataLU = curReadDataLU[3935:3904];
		108:
			topWriteDataLU = curReadDataLU[3903:3872];
		109:
			topWriteDataLU = curReadDataLU[3871:3840];
		110:
			topWriteDataLU = curReadDataLU[3839:3808];
		111:
			topWriteDataLU = curReadDataLU[3807:3776];
		112:
			topWriteDataLU = curReadDataLU[3775:3744];
		113:
			topWriteDataLU = curReadDataLU[3743:3712];
		114:
			topWriteDataLU = curReadDataLU[3711:3680];
		115:
			topWriteDataLU = curReadDataLU[3679:3648];
		116:
			topWriteDataLU = curReadDataLU[3647:3616];
		117:
			topWriteDataLU = curReadDataLU[3615:3584];
		118:
			topWriteDataLU = curReadDataLU[3583:3552];
		119:
			topWriteDataLU = curReadDataLU[3551:3520];
		120:
			topWriteDataLU = curReadDataLU[3519:3488];
		121:
			topWriteDataLU = curReadDataLU[3487:3456];
		122:
			topWriteDataLU = curReadDataLU[3455:3424];
		123:
			topWriteDataLU = curReadDataLU[3423:3392];
		124:
			topWriteDataLU = curReadDataLU[3391:3360];
		125:
			topWriteDataLU = curReadDataLU[3359:3328];
		126:
			topWriteDataLU = curReadDataLU[3327:3296];
		127:
			topWriteDataLU = curReadDataLU[3295:3264];
		128:
			topWriteDataLU = curReadDataLU[3263:3232];
		129:
			topWriteDataLU = curReadDataLU[3231:3200];
		130:
			topWriteDataLU = curReadDataLU[3199:3168];
		131:
			topWriteDataLU = curReadDataLU[3167:3136];
		132:
			topWriteDataLU = curReadDataLU[3135:3104];
		133:
			topWriteDataLU = curReadDataLU[3103:3072];
		134:
			topWriteDataLU = curReadDataLU[3071:3040];
		135:
			topWriteDataLU = curReadDataLU[3039:3008];
		136:
			topWriteDataLU = curReadDataLU[3007:2976];
		137:
			topWriteDataLU = curReadDataLU[2975:2944];
		138:
			topWriteDataLU = curReadDataLU[2943:2912];
		139:
			topWriteDataLU = curReadDataLU[2911:2880];
		140:
			topWriteDataLU = curReadDataLU[2879:2848];
		141:
			topWriteDataLU = curReadDataLU[2847:2816];
		142:
			topWriteDataLU = curReadDataLU[2815:2784];
		143:
			topWriteDataLU = curReadDataLU[2783:2752];
		144:
			topWriteDataLU = curReadDataLU[2751:2720];
		145:
			topWriteDataLU = curReadDataLU[2719:2688];
		146:
			topWriteDataLU = curReadDataLU[2687:2656];
		147:
			topWriteDataLU = curReadDataLU[2655:2624];
		148:
			topWriteDataLU = curReadDataLU[2623:2592];
		149:
			topWriteDataLU = curReadDataLU[2591:2560];
		150:
			topWriteDataLU = curReadDataLU[2559:2528];
		151:
			topWriteDataLU = curReadDataLU[2527:2496];
		152:
			topWriteDataLU = curReadDataLU[2495:2464];
		153:
			topWriteDataLU = curReadDataLU[2463:2432];
		154:
			topWriteDataLU = curReadDataLU[2431:2400];
		155:
			topWriteDataLU = curReadDataLU[2399:2368];
		156:
			topWriteDataLU = curReadDataLU[2367:2336];
		157:
			topWriteDataLU = curReadDataLU[2335:2304];
		158:
			topWriteDataLU = curReadDataLU[2303:2272];
		159:
			topWriteDataLU = curReadDataLU[2271:2240];
		160:
			topWriteDataLU = curReadDataLU[2239:2208];
		161:
			topWriteDataLU = curReadDataLU[2207:2176];
		162:
			topWriteDataLU = curReadDataLU[2175:2144];
		163:
			topWriteDataLU = curReadDataLU[2143:2112];
		164:
			topWriteDataLU = curReadDataLU[2111:2080];
		165:
			topWriteDataLU = curReadDataLU[2079:2048];
		166:
			topWriteDataLU = curReadDataLU[2047:2016];
		167:
			topWriteDataLU = curReadDataLU[2015:1984];
		168:
			topWriteDataLU = curReadDataLU[1983:1952];
		169:
			topWriteDataLU = curReadDataLU[1951:1920];
		170:
			topWriteDataLU = curReadDataLU[1919:1888];
		171:
			topWriteDataLU = curReadDataLU[1887:1856];
		172:
			topWriteDataLU = curReadDataLU[1855:1824];
		173:
			topWriteDataLU = curReadDataLU[1823:1792];
		174:
			topWriteDataLU = curReadDataLU[1791:1760];
		175:
			topWriteDataLU = curReadDataLU[1759:1728];
		176:
			topWriteDataLU = curReadDataLU[1727:1696];
		177:
			topWriteDataLU = curReadDataLU[1695:1664];
		178:
			topWriteDataLU = curReadDataLU[1663:1632];
		179:
			topWriteDataLU = curReadDataLU[1631:1600];
		180:
			topWriteDataLU = curReadDataLU[1599:1568];
		181:
			topWriteDataLU = curReadDataLU[1567:1536];
		182:
			topWriteDataLU = curReadDataLU[1535:1504];
		183:
			topWriteDataLU = curReadDataLU[1503:1472];
		184:
			topWriteDataLU = curReadDataLU[1471:1440];
		185:
			topWriteDataLU = curReadDataLU[1439:1408];
		186:
			topWriteDataLU = curReadDataLU[1407:1376];
		187:
			topWriteDataLU = curReadDataLU[1375:1344];
		188:
			topWriteDataLU = curReadDataLU[1343:1312];
		189:
			topWriteDataLU = curReadDataLU[1311:1280];
		190:
			topWriteDataLU = curReadDataLU[1279:1248];
		191:
			topWriteDataLU = curReadDataLU[1247:1216];
		192:
			topWriteDataLU = curReadDataLU[1215:1184];
		193:
			topWriteDataLU = curReadDataLU[1183:1152];
		194:
			topWriteDataLU = curReadDataLU[1151:1120];
		195:
			topWriteDataLU = curReadDataLU[1119:1088];
		196:
			topWriteDataLU = curReadDataLU[1087:1056];
		197:
			topWriteDataLU = curReadDataLU[1055:1024];
		198:
			topWriteDataLU = curReadDataLU[1023:992];
		199:
			topWriteDataLU = curReadDataLU[991:960];
		200:
			topWriteDataLU = curReadDataLU[959:928];
		201:
			topWriteDataLU = curReadDataLU[927:896];
		202:
			topWriteDataLU = curReadDataLU[895:864];
		203:
			topWriteDataLU = curReadDataLU[863:832];
		204:
			topWriteDataLU = curReadDataLU[831:800];
		205:
			topWriteDataLU = curReadDataLU[799:768];
		206:
			topWriteDataLU = curReadDataLU[767:736];
		207:
			topWriteDataLU = curReadDataLU[735:704];
		208:
			topWriteDataLU = curReadDataLU[703:672];
		209:
			topWriteDataLU = curReadDataLU[671:640];
		210:
			topWriteDataLU = curReadDataLU[639:608];
		211:
			topWriteDataLU = curReadDataLU[607:576];
		212:
			topWriteDataLU = curReadDataLU[575:544];
		213:
			topWriteDataLU = curReadDataLU[543:512];
		214:
			topWriteDataLU = curReadDataLU[511:480];
		215:
			topWriteDataLU = curReadDataLU[479:448];
		216:
			topWriteDataLU = curReadDataLU[447:416];
		217:
			topWriteDataLU = curReadDataLU[415:384];
		218:
			topWriteDataLU = curReadDataLU[383:352];
		219:
			topWriteDataLU = curReadDataLU[351:320];
		220:
			topWriteDataLU = curReadDataLU[319:288];
		221:
			topWriteDataLU = curReadDataLU[287:256];
		222:
			topWriteDataLU = curReadDataLU[255:224];
		223:
			topWriteDataLU = curReadDataLU[223:192];
		224:
			topWriteDataLU = curReadDataLU[191:160];
		225:
			topWriteDataLU = curReadDataLU[159:128];
		226:
			topWriteDataLU = curReadDataLU[127:96];
		227:
			topWriteDataLU = curReadDataLU[95:64];
		228:
			topWriteDataLU = curReadDataLU[63:32];
		229:
			topWriteDataLU = curReadDataLU[31:0];
		default:
			topWriteDataLU = curReadDataLU[PRECISION-1:0];
		endcase
	else
		case (topWriteSel)
		0:
			topWriteDataLU = addResult[229];
		1:
			topWriteDataLU = addResult[228];
		2:
			topWriteDataLU = addResult[227];
		3:
			topWriteDataLU = addResult[226];
		4:
			topWriteDataLU = addResult[225];
		5:
			topWriteDataLU = addResult[224];
		6:
			topWriteDataLU = addResult[223];
		7:
			topWriteDataLU = addResult[222];
		8:
			topWriteDataLU = addResult[221];
		9:
			topWriteDataLU = addResult[220];
		10:
			topWriteDataLU = addResult[219];
		11:
			topWriteDataLU = addResult[218];
		12:
			topWriteDataLU = addResult[217];
		13:
			topWriteDataLU = addResult[216];
		14:
			topWriteDataLU = addResult[215];
		15:
			topWriteDataLU = addResult[214];
		16:
			topWriteDataLU = addResult[213];
		17:
			topWriteDataLU = addResult[212];
		18:
			topWriteDataLU = addResult[211];
		19:
			topWriteDataLU = addResult[210];
		20:
			topWriteDataLU = addResult[209];
		21:
			topWriteDataLU = addResult[208];
		22:
			topWriteDataLU = addResult[207];
		23:
			topWriteDataLU = addResult[206];
		24:
			topWriteDataLU = addResult[205];
		25:
			topWriteDataLU = addResult[204];
		26:
			topWriteDataLU = addResult[203];
		27:
			topWriteDataLU = addResult[202];
		28:
			topWriteDataLU = addResult[201];
		29:
			topWriteDataLU = addResult[200];
		30:
			topWriteDataLU = addResult[199];
		31:
			topWriteDataLU = addResult[198];
		32:
			topWriteDataLU = addResult[197];
		33:
			topWriteDataLU = addResult[196];
		34:
			topWriteDataLU = addResult[195];
		35:
			topWriteDataLU = addResult[194];
		36:
			topWriteDataLU = addResult[193];
		37:
			topWriteDataLU = addResult[192];
		38:
			topWriteDataLU = addResult[191];
		39:
			topWriteDataLU = addResult[190];
		40:
			topWriteDataLU = addResult[189];
		41:
			topWriteDataLU = addResult[188];
		42:
			topWriteDataLU = addResult[187];
		43:
			topWriteDataLU = addResult[186];
		44:
			topWriteDataLU = addResult[185];
		45:
			topWriteDataLU = addResult[184];
		46:
			topWriteDataLU = addResult[183];
		47:
			topWriteDataLU = addResult[182];
		48:
			topWriteDataLU = addResult[181];
		49:
			topWriteDataLU = addResult[180];
		50:
			topWriteDataLU = addResult[179];
		51:
			topWriteDataLU = addResult[178];
		52:
			topWriteDataLU = addResult[177];
		53:
			topWriteDataLU = addResult[176];
		54:
			topWriteDataLU = addResult[175];
		55:
			topWriteDataLU = addResult[174];
		56:
			topWriteDataLU = addResult[173];
		57:
			topWriteDataLU = addResult[172];
		58:
			topWriteDataLU = addResult[171];
		59:
			topWriteDataLU = addResult[170];
		60:
			topWriteDataLU = addResult[169];
		61:
			topWriteDataLU = addResult[168];
		62:
			topWriteDataLU = addResult[167];
		63:
			topWriteDataLU = addResult[166];
		64:
			topWriteDataLU = addResult[165];
		65:
			topWriteDataLU = addResult[164];
		66:
			topWriteDataLU = addResult[163];
		67:
			topWriteDataLU = addResult[162];
		68:
			topWriteDataLU = addResult[161];
		69:
			topWriteDataLU = addResult[160];
		70:
			topWriteDataLU = addResult[159];
		71:
			topWriteDataLU = addResult[158];
		72:
			topWriteDataLU = addResult[157];
		73:
			topWriteDataLU = addResult[156];
		74:
			topWriteDataLU = addResult[155];
		75:
			topWriteDataLU = addResult[154];
		76:
			topWriteDataLU = addResult[153];
		77:
			topWriteDataLU = addResult[152];
		78:
			topWriteDataLU = addResult[151];
		79:
			topWriteDataLU = addResult[150];
		80:
			topWriteDataLU = addResult[149];
		81:
			topWriteDataLU = addResult[148];
		82:
			topWriteDataLU = addResult[147];
		83:
			topWriteDataLU = addResult[146];
		84:
			topWriteDataLU = addResult[145];
		85:
			topWriteDataLU = addResult[144];
		86:
			topWriteDataLU = addResult[143];
		87:
			topWriteDataLU = addResult[142];
		88:
			topWriteDataLU = addResult[141];
		89:
			topWriteDataLU = addResult[140];
		90:
			topWriteDataLU = addResult[139];
		91:
			topWriteDataLU = addResult[138];
		92:
			topWriteDataLU = addResult[137];
		93:
			topWriteDataLU = addResult[136];
		94:
			topWriteDataLU = addResult[135];
		95:
			topWriteDataLU = addResult[134];
		96:
			topWriteDataLU = addResult[133];
		97:
			topWriteDataLU = addResult[132];
		98:
			topWriteDataLU = addResult[131];
		99:
			topWriteDataLU = addResult[130];
		100:
			topWriteDataLU = addResult[129];
		101:
			topWriteDataLU = addResult[128];
		102:
			topWriteDataLU = addResult[127];
		103:
			topWriteDataLU = addResult[126];
		104:
			topWriteDataLU = addResult[125];
		105:
			topWriteDataLU = addResult[124];
		106:
			topWriteDataLU = addResult[123];
		107:
			topWriteDataLU = addResult[122];
		108:
			topWriteDataLU = addResult[121];
		109:
			topWriteDataLU = addResult[120];
		110:
			topWriteDataLU = addResult[119];
		111:
			topWriteDataLU = addResult[118];
		112:
			topWriteDataLU = addResult[117];
		113:
			topWriteDataLU = addResult[116];
		114:
			topWriteDataLU = addResult[115];
		115:
			topWriteDataLU = addResult[114];
		116:
			topWriteDataLU = addResult[113];
		117:
			topWriteDataLU = addResult[112];
		118:
			topWriteDataLU = addResult[111];
		119:
			topWriteDataLU = addResult[110];
		120:
			topWriteDataLU = addResult[109];
		121:
			topWriteDataLU = addResult[108];
		122:
			topWriteDataLU = addResult[107];
		123:
			topWriteDataLU = addResult[106];
		124:
			topWriteDataLU = addResult[105];
		125:
			topWriteDataLU = addResult[104];
		126:
			topWriteDataLU = addResult[103];
		127:
			topWriteDataLU = addResult[102];
		128:
			topWriteDataLU = addResult[101];
		129:
			topWriteDataLU = addResult[100];
		130:
			topWriteDataLU = addResult[99];
		131:
			topWriteDataLU = addResult[98];
		132:
			topWriteDataLU = addResult[97];
		133:
			topWriteDataLU = addResult[96];
		134:
			topWriteDataLU = addResult[95];
		135:
			topWriteDataLU = addResult[94];
		136:
			topWriteDataLU = addResult[93];
		137:
			topWriteDataLU = addResult[92];
		138:
			topWriteDataLU = addResult[91];
		139:
			topWriteDataLU = addResult[90];
		140:
			topWriteDataLU = addResult[89];
		141:
			topWriteDataLU = addResult[88];
		142:
			topWriteDataLU = addResult[87];
		143:
			topWriteDataLU = addResult[86];
		144:
			topWriteDataLU = addResult[85];
		145:
			topWriteDataLU = addResult[84];
		146:
			topWriteDataLU = addResult[83];
		147:
			topWriteDataLU = addResult[82];
		148:
			topWriteDataLU = addResult[81];
		149:
			topWriteDataLU = addResult[80];
		150:
			topWriteDataLU = addResult[79];
		151:
			topWriteDataLU = addResult[78];
		152:
			topWriteDataLU = addResult[77];
		153:
			topWriteDataLU = addResult[76];
		154:
			topWriteDataLU = addResult[75];
		155:
			topWriteDataLU = addResult[74];
		156:
			topWriteDataLU = addResult[73];
		157:
			topWriteDataLU = addResult[72];
		158:
			topWriteDataLU = addResult[71];
		159:
			topWriteDataLU = addResult[70];
		160:
			topWriteDataLU = addResult[69];
		161:
			topWriteDataLU = addResult[68];
		162:
			topWriteDataLU = addResult[67];
		163:
			topWriteDataLU = addResult[66];
		164:
			topWriteDataLU = addResult[65];
		165:
			topWriteDataLU = addResult[64];
		166:
			topWriteDataLU = addResult[63];
		167:
			topWriteDataLU = addResult[62];
		168:
			topWriteDataLU = addResult[61];
		169:
			topWriteDataLU = addResult[60];
		170:
			topWriteDataLU = addResult[59];
		171:
			topWriteDataLU = addResult[58];
		172:
			topWriteDataLU = addResult[57];
		173:
			topWriteDataLU = addResult[56];
		174:
			topWriteDataLU = addResult[55];
		175:
			topWriteDataLU = addResult[54];
		176:
			topWriteDataLU = addResult[53];
		177:
			topWriteDataLU = addResult[52];
		178:
			topWriteDataLU = addResult[51];
		179:
			topWriteDataLU = addResult[50];
		180:
			topWriteDataLU = addResult[49];
		181:
			topWriteDataLU = addResult[48];
		182:
			topWriteDataLU = addResult[47];
		183:
			topWriteDataLU = addResult[46];
		184:
			topWriteDataLU = addResult[45];
		185:
			topWriteDataLU = addResult[44];
		186:
			topWriteDataLU = addResult[43];
		187:
			topWriteDataLU = addResult[42];
		188:
			topWriteDataLU = addResult[41];
		189:
			topWriteDataLU = addResult[40];
		190:
			topWriteDataLU = addResult[39];
		191:
			topWriteDataLU = addResult[38];
		192:
			topWriteDataLU = addResult[37];
		193:
			topWriteDataLU = addResult[36];
		194:
			topWriteDataLU = addResult[35];
		195:
			topWriteDataLU = addResult[34];
		196:
			topWriteDataLU = addResult[33];
		197:
			topWriteDataLU = addResult[32];
		198:
			topWriteDataLU = addResult[31];
		199:
			topWriteDataLU = addResult[30];
		200:
			topWriteDataLU = addResult[29];
		201:
			topWriteDataLU = addResult[28];
		202:
			topWriteDataLU = addResult[27];
		203:
			topWriteDataLU = addResult[26];
		204:
			topWriteDataLU = addResult[25];
		205:
			topWriteDataLU = addResult[24];
		206:
			topWriteDataLU = addResult[23];
		207:
			topWriteDataLU = addResult[22];
		208:
			topWriteDataLU = addResult[21];
		209:
			topWriteDataLU = addResult[20];
		210:
			topWriteDataLU = addResult[19];
		211:
			topWriteDataLU = addResult[18];
		212:
			topWriteDataLU = addResult[17];
		213:
			topWriteDataLU = addResult[16];
		214:
			topWriteDataLU = addResult[15];
		215:
			topWriteDataLU = addResult[14];
		216:
			topWriteDataLU = addResult[13];
		217:
			topWriteDataLU = addResult[12];
		218:
			topWriteDataLU = addResult[11];
		219:
			topWriteDataLU = addResult[10];
		220:
			topWriteDataLU = addResult[9];
		221:
			topWriteDataLU = addResult[8];
		222:
			topWriteDataLU = addResult[7];
		223:
			topWriteDataLU = addResult[6];
		224:
			topWriteDataLU = addResult[5];
		225:
			topWriteDataLU = addResult[4];
		226:
			topWriteDataLU = addResult[3];
		227:
			topWriteDataLU = addResult[2];
		228:
			topWriteDataLU = addResult[1];
		229:
			topWriteDataLU = addResult[0];
		default:
			topWriteDataLU = addResult[0];
		endcase
end

always @ (posedge clk)
begin
	topWriteDataReg[0] <= topWriteDataLU;
	topReadAddrReg[0] <= topReadAddrLU;
	topWriteAddrReg[0] <= topWriteAddrLU;
	topWriteEnReg[0] <= topWriteEnLU;
	topWriteDataReg[1] <= topWriteDataReg[0];
	topReadAddrReg[1] <= topReadAddrReg[0];
	topWriteAddrReg[1] <= topWriteAddrReg[0];
	topWriteEnReg[1] <= topWriteEnReg[0];
	topWriteDataReg[2] <= topWriteDataReg[1];
	topReadAddrReg[2] <= topReadAddrReg[1];
	topWriteAddrReg[2] <= topWriteAddrReg[1];
	topWriteEnReg[2] <= topWriteEnReg[1];
end
assign topWriteData = topWriteDataReg[2];
assign topReadAddr = topReadAddrReg[2];
assign topWriteAddr = topWriteAddrReg[2];
assign topWriteEn = topWriteEnReg[2];
always @ (posedge clk)
begin
	topReadDataReg[0] <= topReadDataLU;
end
assign topReadData = topReadDataReg[0];

// connections to processing element
assign multA[0] = leftReadDataLU[31:0];
assign multA[1] = leftReadDataLU[63:32];
assign multA[2] = leftReadDataLU[95:64];
assign multA[3] = leftReadDataLU[127:96];
assign multA[4] = leftReadDataLU[159:128];
assign multA[5] = leftReadDataLU[191:160];
assign multA[6] = leftReadDataLU[223:192];
assign multA[7] = leftReadDataLU[255:224];
assign multA[8] = leftReadDataLU[287:256];
assign multA[9] = leftReadDataLU[319:288];
assign multA[10] = leftReadDataLU[351:320];
assign multA[11] = leftReadDataLU[383:352];
assign multA[12] = leftReadDataLU[415:384];
assign multA[13] = leftReadDataLU[447:416];
assign multA[14] = leftReadDataLU[479:448];
assign multA[15] = leftReadDataLU[511:480];
assign multA[16] = leftReadDataLU[543:512];
assign multA[17] = leftReadDataLU[575:544];
assign multA[18] = leftReadDataLU[607:576];
assign multA[19] = leftReadDataLU[639:608];
assign multA[20] = leftReadDataLU[671:640];
assign multA[21] = leftReadDataLU[703:672];
assign multA[22] = leftReadDataLU[735:704];
assign multA[23] = leftReadDataLU[767:736];
assign multA[24] = leftReadDataLU[799:768];
assign multA[25] = leftReadDataLU[831:800];
assign multA[26] = leftReadDataLU[863:832];
assign multA[27] = leftReadDataLU[895:864];
assign multA[28] = leftReadDataLU[927:896];
assign multA[29] = leftReadDataLU[959:928];
assign multA[30] = leftReadDataLU[991:960];
assign multA[31] = leftReadDataLU[1023:992];
assign multA[32] = leftReadDataLU[1055:1024];
assign multA[33] = leftReadDataLU[1087:1056];
assign multA[34] = leftReadDataLU[1119:1088];
assign multA[35] = leftReadDataLU[1151:1120];
assign multA[36] = leftReadDataLU[1183:1152];
assign multA[37] = leftReadDataLU[1215:1184];
assign multA[38] = leftReadDataLU[1247:1216];
assign multA[39] = leftReadDataLU[1279:1248];
assign multA[40] = leftReadDataLU[1311:1280];
assign multA[41] = leftReadDataLU[1343:1312];
assign multA[42] = leftReadDataLU[1375:1344];
assign multA[43] = leftReadDataLU[1407:1376];
assign multA[44] = leftReadDataLU[1439:1408];
assign multA[45] = leftReadDataLU[1471:1440];
assign multA[46] = leftReadDataLU[1503:1472];
assign multA[47] = leftReadDataLU[1535:1504];
assign multA[48] = leftReadDataLU[1567:1536];
assign multA[49] = leftReadDataLU[1599:1568];
assign multA[50] = leftReadDataLU[1631:1600];
assign multA[51] = leftReadDataLU[1663:1632];
assign multA[52] = leftReadDataLU[1695:1664];
assign multA[53] = leftReadDataLU[1727:1696];
assign multA[54] = leftReadDataLU[1759:1728];
assign multA[55] = leftReadDataLU[1791:1760];
assign multA[56] = leftReadDataLU[1823:1792];
assign multA[57] = leftReadDataLU[1855:1824];
assign multA[58] = leftReadDataLU[1887:1856];
assign multA[59] = leftReadDataLU[1919:1888];
assign multA[60] = leftReadDataLU[1951:1920];
assign multA[61] = leftReadDataLU[1983:1952];
assign multA[62] = leftReadDataLU[2015:1984];
assign multA[63] = leftReadDataLU[2047:2016];
assign multA[64] = leftReadDataLU[2079:2048];
assign multA[65] = leftReadDataLU[2111:2080];
assign multA[66] = leftReadDataLU[2143:2112];
assign multA[67] = leftReadDataLU[2175:2144];
assign multA[68] = leftReadDataLU[2207:2176];
assign multA[69] = leftReadDataLU[2239:2208];
assign multA[70] = leftReadDataLU[2271:2240];
assign multA[71] = leftReadDataLU[2303:2272];
assign multA[72] = leftReadDataLU[2335:2304];
assign multA[73] = leftReadDataLU[2367:2336];
assign multA[74] = leftReadDataLU[2399:2368];
assign multA[75] = leftReadDataLU[2431:2400];
assign multA[76] = leftReadDataLU[2463:2432];
assign multA[77] = leftReadDataLU[2495:2464];
assign multA[78] = leftReadDataLU[2527:2496];
assign multA[79] = leftReadDataLU[2559:2528];
assign multA[80] = leftReadDataLU[2591:2560];
assign multA[81] = leftReadDataLU[2623:2592];
assign multA[82] = leftReadDataLU[2655:2624];
assign multA[83] = leftReadDataLU[2687:2656];
assign multA[84] = leftReadDataLU[2719:2688];
assign multA[85] = leftReadDataLU[2751:2720];
assign multA[86] = leftReadDataLU[2783:2752];
assign multA[87] = leftReadDataLU[2815:2784];
assign multA[88] = leftReadDataLU[2847:2816];
assign multA[89] = leftReadDataLU[2879:2848];
assign multA[90] = leftReadDataLU[2911:2880];
assign multA[91] = leftReadDataLU[2943:2912];
assign multA[92] = leftReadDataLU[2975:2944];
assign multA[93] = leftReadDataLU[3007:2976];
assign multA[94] = leftReadDataLU[3039:3008];
assign multA[95] = leftReadDataLU[3071:3040];
assign multA[96] = leftReadDataLU[3103:3072];
assign multA[97] = leftReadDataLU[3135:3104];
assign multA[98] = leftReadDataLU[3167:3136];
assign multA[99] = leftReadDataLU[3199:3168];
assign multA[100] = leftReadDataLU[3231:3200];
assign multA[101] = leftReadDataLU[3263:3232];
assign multA[102] = leftReadDataLU[3295:3264];
assign multA[103] = leftReadDataLU[3327:3296];
assign multA[104] = leftReadDataLU[3359:3328];
assign multA[105] = leftReadDataLU[3391:3360];
assign multA[106] = leftReadDataLU[3423:3392];
assign multA[107] = leftReadDataLU[3455:3424];
assign multA[108] = leftReadDataLU[3487:3456];
assign multA[109] = leftReadDataLU[3519:3488];
assign multA[110] = leftReadDataLU[3551:3520];
assign multA[111] = leftReadDataLU[3583:3552];
assign multA[112] = leftReadDataLU[3615:3584];
assign multA[113] = leftReadDataLU[3647:3616];
assign multA[114] = leftReadDataLU[3679:3648];
assign multA[115] = leftReadDataLU[3711:3680];
assign multA[116] = leftReadDataLU[3743:3712];
assign multA[117] = leftReadDataLU[3775:3744];
assign multA[118] = leftReadDataLU[3807:3776];
assign multA[119] = leftReadDataLU[3839:3808];
assign multA[120] = leftReadDataLU[3871:3840];
assign multA[121] = leftReadDataLU[3903:3872];
assign multA[122] = leftReadDataLU[3935:3904];
assign multA[123] = leftReadDataLU[3967:3936];
assign multA[124] = leftReadDataLU[3999:3968];
assign multA[125] = leftReadDataLU[4031:4000];
assign multA[126] = leftReadDataLU[4063:4032];
assign multA[127] = leftReadDataLU[4095:4064];
assign multA[128] = leftReadDataLU[4127:4096];
assign multA[129] = leftReadDataLU[4159:4128];
assign multA[130] = leftReadDataLU[4191:4160];
assign multA[131] = leftReadDataLU[4223:4192];
assign multA[132] = leftReadDataLU[4255:4224];
assign multA[133] = leftReadDataLU[4287:4256];
assign multA[134] = leftReadDataLU[4319:4288];
assign multA[135] = leftReadDataLU[4351:4320];
assign multA[136] = leftReadDataLU[4383:4352];
assign multA[137] = leftReadDataLU[4415:4384];
assign multA[138] = leftReadDataLU[4447:4416];
assign multA[139] = leftReadDataLU[4479:4448];
assign multA[140] = leftReadDataLU[4511:4480];
assign multA[141] = leftReadDataLU[4543:4512];
assign multA[142] = leftReadDataLU[4575:4544];
assign multA[143] = leftReadDataLU[4607:4576];
assign multA[144] = leftReadDataLU[4639:4608];
assign multA[145] = leftReadDataLU[4671:4640];
assign multA[146] = leftReadDataLU[4703:4672];
assign multA[147] = leftReadDataLU[4735:4704];
assign multA[148] = leftReadDataLU[4767:4736];
assign multA[149] = leftReadDataLU[4799:4768];
assign multA[150] = leftReadDataLU[4831:4800];
assign multA[151] = leftReadDataLU[4863:4832];
assign multA[152] = leftReadDataLU[4895:4864];
assign multA[153] = leftReadDataLU[4927:4896];
assign multA[154] = leftReadDataLU[4959:4928];
assign multA[155] = leftReadDataLU[4991:4960];
assign multA[156] = leftReadDataLU[5023:4992];
assign multA[157] = leftReadDataLU[5055:5024];
assign multA[158] = leftReadDataLU[5087:5056];
assign multA[159] = leftReadDataLU[5119:5088];
assign multA[160] = leftReadDataLU[5151:5120];
assign multA[161] = leftReadDataLU[5183:5152];
assign multA[162] = leftReadDataLU[5215:5184];
assign multA[163] = leftReadDataLU[5247:5216];
assign multA[164] = leftReadDataLU[5279:5248];
assign multA[165] = leftReadDataLU[5311:5280];
assign multA[166] = leftReadDataLU[5343:5312];
assign multA[167] = leftReadDataLU[5375:5344];
assign multA[168] = leftReadDataLU[5407:5376];
assign multA[169] = leftReadDataLU[5439:5408];
assign multA[170] = leftReadDataLU[5471:5440];
assign multA[171] = leftReadDataLU[5503:5472];
assign multA[172] = leftReadDataLU[5535:5504];
assign multA[173] = leftReadDataLU[5567:5536];
assign multA[174] = leftReadDataLU[5599:5568];
assign multA[175] = leftReadDataLU[5631:5600];
assign multA[176] = leftReadDataLU[5663:5632];
assign multA[177] = leftReadDataLU[5695:5664];
assign multA[178] = leftReadDataLU[5727:5696];
assign multA[179] = leftReadDataLU[5759:5728];
assign multA[180] = leftReadDataLU[5791:5760];
assign multA[181] = leftReadDataLU[5823:5792];
assign multA[182] = leftReadDataLU[5855:5824];
assign multA[183] = leftReadDataLU[5887:5856];
assign multA[184] = leftReadDataLU[5919:5888];
assign multA[185] = leftReadDataLU[5951:5920];
assign multA[186] = leftReadDataLU[5983:5952];
assign multA[187] = leftReadDataLU[6015:5984];
assign multA[188] = leftReadDataLU[6047:6016];
assign multA[189] = leftReadDataLU[6079:6048];
assign multA[190] = leftReadDataLU[6111:6080];
assign multA[191] = leftReadDataLU[6143:6112];
assign multA[192] = leftReadDataLU[6175:6144];
assign multA[193] = leftReadDataLU[6207:6176];
assign multA[194] = leftReadDataLU[6239:6208];
assign multA[195] = leftReadDataLU[6271:6240];
assign multA[196] = leftReadDataLU[6303:6272];
assign multA[197] = leftReadDataLU[6335:6304];
assign multA[198] = leftReadDataLU[6367:6336];
assign multA[199] = leftReadDataLU[6399:6368];
assign multA[200] = leftReadDataLU[6431:6400];
assign multA[201] = leftReadDataLU[6463:6432];
assign multA[202] = leftReadDataLU[6495:6464];
assign multA[203] = leftReadDataLU[6527:6496];
assign multA[204] = leftReadDataLU[6559:6528];
assign multA[205] = leftReadDataLU[6591:6560];
assign multA[206] = leftReadDataLU[6623:6592];
assign multA[207] = leftReadDataLU[6655:6624];
assign multA[208] = leftReadDataLU[6687:6656];
assign multA[209] = leftReadDataLU[6719:6688];
assign multA[210] = leftReadDataLU[6751:6720];
assign multA[211] = leftReadDataLU[6783:6752];
assign multA[212] = leftReadDataLU[6815:6784];
assign multA[213] = leftReadDataLU[6847:6816];
assign multA[214] = leftReadDataLU[6879:6848];
assign multA[215] = leftReadDataLU[6911:6880];
assign multA[216] = leftReadDataLU[6943:6912];
assign multA[217] = leftReadDataLU[6975:6944];
assign multA[218] = leftReadDataLU[7007:6976];
assign multA[219] = leftReadDataLU[7039:7008];
assign multA[220] = leftReadDataLU[7071:7040];
assign multA[221] = leftReadDataLU[7103:7072];
assign multA[222] = leftReadDataLU[7135:7104];
assign multA[223] = leftReadDataLU[7167:7136];
assign multA[224] = leftReadDataLU[7199:7168];
assign multA[225] = leftReadDataLU[7231:7200];
assign multA[226] = leftReadDataLU[7263:7232];
assign multA[227] = leftReadDataLU[7295:7264];
assign multA[228] = leftReadDataLU[7327:7296];
assign multA[229] = leftReadDataLU[7359:7328];

assign addA[0] = curReadDataLU[31:0];
assign addA[1] = curReadDataLU[63:32];
assign addA[2] = curReadDataLU[95:64];
assign addA[3] = curReadDataLU[127:96];
assign addA[4] = curReadDataLU[159:128];
assign addA[5] = curReadDataLU[191:160];
assign addA[6] = curReadDataLU[223:192];
assign addA[7] = curReadDataLU[255:224];
assign addA[8] = curReadDataLU[287:256];
assign addA[9] = curReadDataLU[319:288];
assign addA[10] = curReadDataLU[351:320];
assign addA[11] = curReadDataLU[383:352];
assign addA[12] = curReadDataLU[415:384];
assign addA[13] = curReadDataLU[447:416];
assign addA[14] = curReadDataLU[479:448];
assign addA[15] = curReadDataLU[511:480];
assign addA[16] = curReadDataLU[543:512];
assign addA[17] = curReadDataLU[575:544];
assign addA[18] = curReadDataLU[607:576];
assign addA[19] = curReadDataLU[639:608];
assign addA[20] = curReadDataLU[671:640];
assign addA[21] = curReadDataLU[703:672];
assign addA[22] = curReadDataLU[735:704];
assign addA[23] = curReadDataLU[767:736];
assign addA[24] = curReadDataLU[799:768];
assign addA[25] = curReadDataLU[831:800];
assign addA[26] = curReadDataLU[863:832];
assign addA[27] = curReadDataLU[895:864];
assign addA[28] = curReadDataLU[927:896];
assign addA[29] = curReadDataLU[959:928];
assign addA[30] = curReadDataLU[991:960];
assign addA[31] = curReadDataLU[1023:992];
assign addA[32] = curReadDataLU[1055:1024];
assign addA[33] = curReadDataLU[1087:1056];
assign addA[34] = curReadDataLU[1119:1088];
assign addA[35] = curReadDataLU[1151:1120];
assign addA[36] = curReadDataLU[1183:1152];
assign addA[37] = curReadDataLU[1215:1184];
assign addA[38] = curReadDataLU[1247:1216];
assign addA[39] = curReadDataLU[1279:1248];
assign addA[40] = curReadDataLU[1311:1280];
assign addA[41] = curReadDataLU[1343:1312];
assign addA[42] = curReadDataLU[1375:1344];
assign addA[43] = curReadDataLU[1407:1376];
assign addA[44] = curReadDataLU[1439:1408];
assign addA[45] = curReadDataLU[1471:1440];
assign addA[46] = curReadDataLU[1503:1472];
assign addA[47] = curReadDataLU[1535:1504];
assign addA[48] = curReadDataLU[1567:1536];
assign addA[49] = curReadDataLU[1599:1568];
assign addA[50] = curReadDataLU[1631:1600];
assign addA[51] = curReadDataLU[1663:1632];
assign addA[52] = curReadDataLU[1695:1664];
assign addA[53] = curReadDataLU[1727:1696];
assign addA[54] = curReadDataLU[1759:1728];
assign addA[55] = curReadDataLU[1791:1760];
assign addA[56] = curReadDataLU[1823:1792];
assign addA[57] = curReadDataLU[1855:1824];
assign addA[58] = curReadDataLU[1887:1856];
assign addA[59] = curReadDataLU[1919:1888];
assign addA[60] = curReadDataLU[1951:1920];
assign addA[61] = curReadDataLU[1983:1952];
assign addA[62] = curReadDataLU[2015:1984];
assign addA[63] = curReadDataLU[2047:2016];
assign addA[64] = curReadDataLU[2079:2048];
assign addA[65] = curReadDataLU[2111:2080];
assign addA[66] = curReadDataLU[2143:2112];
assign addA[67] = curReadDataLU[2175:2144];
assign addA[68] = curReadDataLU[2207:2176];
assign addA[69] = curReadDataLU[2239:2208];
assign addA[70] = curReadDataLU[2271:2240];
assign addA[71] = curReadDataLU[2303:2272];
assign addA[72] = curReadDataLU[2335:2304];
assign addA[73] = curReadDataLU[2367:2336];
assign addA[74] = curReadDataLU[2399:2368];
assign addA[75] = curReadDataLU[2431:2400];
assign addA[76] = curReadDataLU[2463:2432];
assign addA[77] = curReadDataLU[2495:2464];
assign addA[78] = curReadDataLU[2527:2496];
assign addA[79] = curReadDataLU[2559:2528];
assign addA[80] = curReadDataLU[2591:2560];
assign addA[81] = curReadDataLU[2623:2592];
assign addA[82] = curReadDataLU[2655:2624];
assign addA[83] = curReadDataLU[2687:2656];
assign addA[84] = curReadDataLU[2719:2688];
assign addA[85] = curReadDataLU[2751:2720];
assign addA[86] = curReadDataLU[2783:2752];
assign addA[87] = curReadDataLU[2815:2784];
assign addA[88] = curReadDataLU[2847:2816];
assign addA[89] = curReadDataLU[2879:2848];
assign addA[90] = curReadDataLU[2911:2880];
assign addA[91] = curReadDataLU[2943:2912];
assign addA[92] = curReadDataLU[2975:2944];
assign addA[93] = curReadDataLU[3007:2976];
assign addA[94] = curReadDataLU[3039:3008];
assign addA[95] = curReadDataLU[3071:3040];
assign addA[96] = curReadDataLU[3103:3072];
assign addA[97] = curReadDataLU[3135:3104];
assign addA[98] = curReadDataLU[3167:3136];
assign addA[99] = curReadDataLU[3199:3168];
assign addA[100] = curReadDataLU[3231:3200];
assign addA[101] = curReadDataLU[3263:3232];
assign addA[102] = curReadDataLU[3295:3264];
assign addA[103] = curReadDataLU[3327:3296];
assign addA[104] = curReadDataLU[3359:3328];
assign addA[105] = curReadDataLU[3391:3360];
assign addA[106] = curReadDataLU[3423:3392];
assign addA[107] = curReadDataLU[3455:3424];
assign addA[108] = curReadDataLU[3487:3456];
assign addA[109] = curReadDataLU[3519:3488];
assign addA[110] = curReadDataLU[3551:3520];
assign addA[111] = curReadDataLU[3583:3552];
assign addA[112] = curReadDataLU[3615:3584];
assign addA[113] = curReadDataLU[3647:3616];
assign addA[114] = curReadDataLU[3679:3648];
assign addA[115] = curReadDataLU[3711:3680];
assign addA[116] = curReadDataLU[3743:3712];
assign addA[117] = curReadDataLU[3775:3744];
assign addA[118] = curReadDataLU[3807:3776];
assign addA[119] = curReadDataLU[3839:3808];
assign addA[120] = curReadDataLU[3871:3840];
assign addA[121] = curReadDataLU[3903:3872];
assign addA[122] = curReadDataLU[3935:3904];
assign addA[123] = curReadDataLU[3967:3936];
assign addA[124] = curReadDataLU[3999:3968];
assign addA[125] = curReadDataLU[4031:4000];
assign addA[126] = curReadDataLU[4063:4032];
assign addA[127] = curReadDataLU[4095:4064];
assign addA[128] = curReadDataLU[4127:4096];
assign addA[129] = curReadDataLU[4159:4128];
assign addA[130] = curReadDataLU[4191:4160];
assign addA[131] = curReadDataLU[4223:4192];
assign addA[132] = curReadDataLU[4255:4224];
assign addA[133] = curReadDataLU[4287:4256];
assign addA[134] = curReadDataLU[4319:4288];
assign addA[135] = curReadDataLU[4351:4320];
assign addA[136] = curReadDataLU[4383:4352];
assign addA[137] = curReadDataLU[4415:4384];
assign addA[138] = curReadDataLU[4447:4416];
assign addA[139] = curReadDataLU[4479:4448];
assign addA[140] = curReadDataLU[4511:4480];
assign addA[141] = curReadDataLU[4543:4512];
assign addA[142] = curReadDataLU[4575:4544];
assign addA[143] = curReadDataLU[4607:4576];
assign addA[144] = curReadDataLU[4639:4608];
assign addA[145] = curReadDataLU[4671:4640];
assign addA[146] = curReadDataLU[4703:4672];
assign addA[147] = curReadDataLU[4735:4704];
assign addA[148] = curReadDataLU[4767:4736];
assign addA[149] = curReadDataLU[4799:4768];
assign addA[150] = curReadDataLU[4831:4800];
assign addA[151] = curReadDataLU[4863:4832];
assign addA[152] = curReadDataLU[4895:4864];
assign addA[153] = curReadDataLU[4927:4896];
assign addA[154] = curReadDataLU[4959:4928];
assign addA[155] = curReadDataLU[4991:4960];
assign addA[156] = curReadDataLU[5023:4992];
assign addA[157] = curReadDataLU[5055:5024];
assign addA[158] = curReadDataLU[5087:5056];
assign addA[159] = curReadDataLU[5119:5088];
assign addA[160] = curReadDataLU[5151:5120];
assign addA[161] = curReadDataLU[5183:5152];
assign addA[162] = curReadDataLU[5215:5184];
assign addA[163] = curReadDataLU[5247:5216];
assign addA[164] = curReadDataLU[5279:5248];
assign addA[165] = curReadDataLU[5311:5280];
assign addA[166] = curReadDataLU[5343:5312];
assign addA[167] = curReadDataLU[5375:5344];
assign addA[168] = curReadDataLU[5407:5376];
assign addA[169] = curReadDataLU[5439:5408];
assign addA[170] = curReadDataLU[5471:5440];
assign addA[171] = curReadDataLU[5503:5472];
assign addA[172] = curReadDataLU[5535:5504];
assign addA[173] = curReadDataLU[5567:5536];
assign addA[174] = curReadDataLU[5599:5568];
assign addA[175] = curReadDataLU[5631:5600];
assign addA[176] = curReadDataLU[5663:5632];
assign addA[177] = curReadDataLU[5695:5664];
assign addA[178] = curReadDataLU[5727:5696];
assign addA[179] = curReadDataLU[5759:5728];
assign addA[180] = curReadDataLU[5791:5760];
assign addA[181] = curReadDataLU[5823:5792];
assign addA[182] = curReadDataLU[5855:5824];
assign addA[183] = curReadDataLU[5887:5856];
assign addA[184] = curReadDataLU[5919:5888];
assign addA[185] = curReadDataLU[5951:5920];
assign addA[186] = curReadDataLU[5983:5952];
assign addA[187] = curReadDataLU[6015:5984];
assign addA[188] = curReadDataLU[6047:6016];
assign addA[189] = curReadDataLU[6079:6048];
assign addA[190] = curReadDataLU[6111:6080];
assign addA[191] = curReadDataLU[6143:6112];
assign addA[192] = curReadDataLU[6175:6144];
assign addA[193] = curReadDataLU[6207:6176];
assign addA[194] = curReadDataLU[6239:6208];
assign addA[195] = curReadDataLU[6271:6240];
assign addA[196] = curReadDataLU[6303:6272];
assign addA[197] = curReadDataLU[6335:6304];
assign addA[198] = curReadDataLU[6367:6336];
assign addA[199] = curReadDataLU[6399:6368];
assign addA[200] = curReadDataLU[6431:6400];
assign addA[201] = curReadDataLU[6463:6432];
assign addA[202] = curReadDataLU[6495:6464];
assign addA[203] = curReadDataLU[6527:6496];
assign addA[204] = curReadDataLU[6559:6528];
assign addA[205] = curReadDataLU[6591:6560];
assign addA[206] = curReadDataLU[6623:6592];
assign addA[207] = curReadDataLU[6655:6624];
assign addA[208] = curReadDataLU[6687:6656];
assign addA[209] = curReadDataLU[6719:6688];
assign addA[210] = curReadDataLU[6751:6720];
assign addA[211] = curReadDataLU[6783:6752];
assign addA[212] = curReadDataLU[6815:6784];
assign addA[213] = curReadDataLU[6847:6816];
assign addA[214] = curReadDataLU[6879:6848];
assign addA[215] = curReadDataLU[6911:6880];
assign addA[216] = curReadDataLU[6943:6912];
assign addA[217] = curReadDataLU[6975:6944];
assign addA[218] = curReadDataLU[7007:6976];
assign addA[219] = curReadDataLU[7039:7008];
assign addA[220] = curReadDataLU[7071:7040];
assign addA[221] = curReadDataLU[7103:7072];
assign addA[222] = curReadDataLU[7135:7104];
assign addA[223] = curReadDataLU[7167:7136];
assign addA[224] = curReadDataLU[7199:7168];
assign addA[225] = curReadDataLU[7231:7200];
assign addA[226] = curReadDataLU[7263:7232];
assign addA[227] = curReadDataLU[7295:7264];
assign addA[228] = curReadDataLU[7327:7296];
assign addA[229] = curReadDataLU[7359:7328];

// connections to ports of the current blocks
assign rcWriteData[31:0] = (curWriteSel == 0) ? multResult[0] : addResult[0];
assign rcWriteData[63:32] = (curWriteSel == 0) ? multResult[1] : addResult[1];
assign rcWriteData[95:64] = (curWriteSel == 0) ? multResult[2] : addResult[2];
assign rcWriteData[127:96] = (curWriteSel == 0) ? multResult[3] : addResult[3];
assign rcWriteData[159:128] = (curWriteSel == 0) ? multResult[4] : addResult[4];
assign rcWriteData[191:160] = (curWriteSel == 0) ? multResult[5] : addResult[5];
assign rcWriteData[223:192] = (curWriteSel == 0) ? multResult[6] : addResult[6];
assign rcWriteData[255:224] = (curWriteSel == 0) ? multResult[7] : addResult[7];
assign rcWriteData[287:256] = (curWriteSel == 0) ? multResult[8] : addResult[8];
assign rcWriteData[319:288] = (curWriteSel == 0) ? multResult[9] : addResult[9];
assign rcWriteData[351:320] = (curWriteSel == 0) ? multResult[10] : addResult[10];
assign rcWriteData[383:352] = (curWriteSel == 0) ? multResult[11] : addResult[11];
assign rcWriteData[415:384] = (curWriteSel == 0) ? multResult[12] : addResult[12];
assign rcWriteData[447:416] = (curWriteSel == 0) ? multResult[13] : addResult[13];
assign rcWriteData[479:448] = (curWriteSel == 0) ? multResult[14] : addResult[14];
assign rcWriteData[511:480] = (curWriteSel == 0) ? multResult[15] : addResult[15];
assign rcWriteData[543:512] = (curWriteSel == 0) ? multResult[16] : addResult[16];
assign rcWriteData[575:544] = (curWriteSel == 0) ? multResult[17] : addResult[17];
assign rcWriteData[607:576] = (curWriteSel == 0) ? multResult[18] : addResult[18];
assign rcWriteData[639:608] = (curWriteSel == 0) ? multResult[19] : addResult[19];
assign rcWriteData[671:640] = (curWriteSel == 0) ? multResult[20] : addResult[20];
assign rcWriteData[703:672] = (curWriteSel == 0) ? multResult[21] : addResult[21];
assign rcWriteData[735:704] = (curWriteSel == 0) ? multResult[22] : addResult[22];
assign rcWriteData[767:736] = (curWriteSel == 0) ? multResult[23] : addResult[23];
assign rcWriteData[799:768] = (curWriteSel == 0) ? multResult[24] : addResult[24];
assign rcWriteData[831:800] = (curWriteSel == 0) ? multResult[25] : addResult[25];
assign rcWriteData[863:832] = (curWriteSel == 0) ? multResult[26] : addResult[26];
assign rcWriteData[895:864] = (curWriteSel == 0) ? multResult[27] : addResult[27];
assign rcWriteData[927:896] = (curWriteSel == 0) ? multResult[28] : addResult[28];
assign rcWriteData[959:928] = (curWriteSel == 0) ? multResult[29] : addResult[29];
assign rcWriteData[991:960] = (curWriteSel == 0) ? multResult[30] : addResult[30];
assign rcWriteData[1023:992] = (curWriteSel == 0) ? multResult[31] : addResult[31];
assign rcWriteData[1055:1024] = (curWriteSel == 0) ? multResult[32] : addResult[32];
assign rcWriteData[1087:1056] = (curWriteSel == 0) ? multResult[33] : addResult[33];
assign rcWriteData[1119:1088] = (curWriteSel == 0) ? multResult[34] : addResult[34];
assign rcWriteData[1151:1120] = (curWriteSel == 0) ? multResult[35] : addResult[35];
assign rcWriteData[1183:1152] = (curWriteSel == 0) ? multResult[36] : addResult[36];
assign rcWriteData[1215:1184] = (curWriteSel == 0) ? multResult[37] : addResult[37];
assign rcWriteData[1247:1216] = (curWriteSel == 0) ? multResult[38] : addResult[38];
assign rcWriteData[1279:1248] = (curWriteSel == 0) ? multResult[39] : addResult[39];
assign rcWriteData[1311:1280] = (curWriteSel == 0) ? multResult[40] : addResult[40];
assign rcWriteData[1343:1312] = (curWriteSel == 0) ? multResult[41] : addResult[41];
assign rcWriteData[1375:1344] = (curWriteSel == 0) ? multResult[42] : addResult[42];
assign rcWriteData[1407:1376] = (curWriteSel == 0) ? multResult[43] : addResult[43];
assign rcWriteData[1439:1408] = (curWriteSel == 0) ? multResult[44] : addResult[44];
assign rcWriteData[1471:1440] = (curWriteSel == 0) ? multResult[45] : addResult[45];
assign rcWriteData[1503:1472] = (curWriteSel == 0) ? multResult[46] : addResult[46];
assign rcWriteData[1535:1504] = (curWriteSel == 0) ? multResult[47] : addResult[47];
assign rcWriteData[1567:1536] = (curWriteSel == 0) ? multResult[48] : addResult[48];
assign rcWriteData[1599:1568] = (curWriteSel == 0) ? multResult[49] : addResult[49];
assign rcWriteData[1631:1600] = (curWriteSel == 0) ? multResult[50] : addResult[50];
assign rcWriteData[1663:1632] = (curWriteSel == 0) ? multResult[51] : addResult[51];
assign rcWriteData[1695:1664] = (curWriteSel == 0) ? multResult[52] : addResult[52];
assign rcWriteData[1727:1696] = (curWriteSel == 0) ? multResult[53] : addResult[53];
assign rcWriteData[1759:1728] = (curWriteSel == 0) ? multResult[54] : addResult[54];
assign rcWriteData[1791:1760] = (curWriteSel == 0) ? multResult[55] : addResult[55];
assign rcWriteData[1823:1792] = (curWriteSel == 0) ? multResult[56] : addResult[56];
assign rcWriteData[1855:1824] = (curWriteSel == 0) ? multResult[57] : addResult[57];
assign rcWriteData[1887:1856] = (curWriteSel == 0) ? multResult[58] : addResult[58];
assign rcWriteData[1919:1888] = (curWriteSel == 0) ? multResult[59] : addResult[59];
assign rcWriteData[1951:1920] = (curWriteSel == 0) ? multResult[60] : addResult[60];
assign rcWriteData[1983:1952] = (curWriteSel == 0) ? multResult[61] : addResult[61];
assign rcWriteData[2015:1984] = (curWriteSel == 0) ? multResult[62] : addResult[62];
assign rcWriteData[2047:2016] = (curWriteSel == 0) ? multResult[63] : addResult[63];
assign rcWriteData[2079:2048] = (curWriteSel == 0) ? multResult[64] : addResult[64];
assign rcWriteData[2111:2080] = (curWriteSel == 0) ? multResult[65] : addResult[65];
assign rcWriteData[2143:2112] = (curWriteSel == 0) ? multResult[66] : addResult[66];
assign rcWriteData[2175:2144] = (curWriteSel == 0) ? multResult[67] : addResult[67];
assign rcWriteData[2207:2176] = (curWriteSel == 0) ? multResult[68] : addResult[68];
assign rcWriteData[2239:2208] = (curWriteSel == 0) ? multResult[69] : addResult[69];
assign rcWriteData[2271:2240] = (curWriteSel == 0) ? multResult[70] : addResult[70];
assign rcWriteData[2303:2272] = (curWriteSel == 0) ? multResult[71] : addResult[71];
assign rcWriteData[2335:2304] = (curWriteSel == 0) ? multResult[72] : addResult[72];
assign rcWriteData[2367:2336] = (curWriteSel == 0) ? multResult[73] : addResult[73];
assign rcWriteData[2399:2368] = (curWriteSel == 0) ? multResult[74] : addResult[74];
assign rcWriteData[2431:2400] = (curWriteSel == 0) ? multResult[75] : addResult[75];
assign rcWriteData[2463:2432] = (curWriteSel == 0) ? multResult[76] : addResult[76];
assign rcWriteData[2495:2464] = (curWriteSel == 0) ? multResult[77] : addResult[77];
assign rcWriteData[2527:2496] = (curWriteSel == 0) ? multResult[78] : addResult[78];
assign rcWriteData[2559:2528] = (curWriteSel == 0) ? multResult[79] : addResult[79];
assign rcWriteData[2591:2560] = (curWriteSel == 0) ? multResult[80] : addResult[80];
assign rcWriteData[2623:2592] = (curWriteSel == 0) ? multResult[81] : addResult[81];
assign rcWriteData[2655:2624] = (curWriteSel == 0) ? multResult[82] : addResult[82];
assign rcWriteData[2687:2656] = (curWriteSel == 0) ? multResult[83] : addResult[83];
assign rcWriteData[2719:2688] = (curWriteSel == 0) ? multResult[84] : addResult[84];
assign rcWriteData[2751:2720] = (curWriteSel == 0) ? multResult[85] : addResult[85];
assign rcWriteData[2783:2752] = (curWriteSel == 0) ? multResult[86] : addResult[86];
assign rcWriteData[2815:2784] = (curWriteSel == 0) ? multResult[87] : addResult[87];
assign rcWriteData[2847:2816] = (curWriteSel == 0) ? multResult[88] : addResult[88];
assign rcWriteData[2879:2848] = (curWriteSel == 0) ? multResult[89] : addResult[89];
assign rcWriteData[2911:2880] = (curWriteSel == 0) ? multResult[90] : addResult[90];
assign rcWriteData[2943:2912] = (curWriteSel == 0) ? multResult[91] : addResult[91];
assign rcWriteData[2975:2944] = (curWriteSel == 0) ? multResult[92] : addResult[92];
assign rcWriteData[3007:2976] = (curWriteSel == 0) ? multResult[93] : addResult[93];
assign rcWriteData[3039:3008] = (curWriteSel == 0) ? multResult[94] : addResult[94];
assign rcWriteData[3071:3040] = (curWriteSel == 0) ? multResult[95] : addResult[95];
assign rcWriteData[3103:3072] = (curWriteSel == 0) ? multResult[96] : addResult[96];
assign rcWriteData[3135:3104] = (curWriteSel == 0) ? multResult[97] : addResult[97];
assign rcWriteData[3167:3136] = (curWriteSel == 0) ? multResult[98] : addResult[98];
assign rcWriteData[3199:3168] = (curWriteSel == 0) ? multResult[99] : addResult[99];
assign rcWriteData[3231:3200] = (curWriteSel == 0) ? multResult[100] : addResult[100];
assign rcWriteData[3263:3232] = (curWriteSel == 0) ? multResult[101] : addResult[101];
assign rcWriteData[3295:3264] = (curWriteSel == 0) ? multResult[102] : addResult[102];
assign rcWriteData[3327:3296] = (curWriteSel == 0) ? multResult[103] : addResult[103];
assign rcWriteData[3359:3328] = (curWriteSel == 0) ? multResult[104] : addResult[104];
assign rcWriteData[3391:3360] = (curWriteSel == 0) ? multResult[105] : addResult[105];
assign rcWriteData[3423:3392] = (curWriteSel == 0) ? multResult[106] : addResult[106];
assign rcWriteData[3455:3424] = (curWriteSel == 0) ? multResult[107] : addResult[107];
assign rcWriteData[3487:3456] = (curWriteSel == 0) ? multResult[108] : addResult[108];
assign rcWriteData[3519:3488] = (curWriteSel == 0) ? multResult[109] : addResult[109];
assign rcWriteData[3551:3520] = (curWriteSel == 0) ? multResult[110] : addResult[110];
assign rcWriteData[3583:3552] = (curWriteSel == 0) ? multResult[111] : addResult[111];
assign rcWriteData[3615:3584] = (curWriteSel == 0) ? multResult[112] : addResult[112];
assign rcWriteData[3647:3616] = (curWriteSel == 0) ? multResult[113] : addResult[113];
assign rcWriteData[3679:3648] = (curWriteSel == 0) ? multResult[114] : addResult[114];
assign rcWriteData[3711:3680] = (curWriteSel == 0) ? multResult[115] : addResult[115];
assign rcWriteData[3743:3712] = (curWriteSel == 0) ? multResult[116] : addResult[116];
assign rcWriteData[3775:3744] = (curWriteSel == 0) ? multResult[117] : addResult[117];
assign rcWriteData[3807:3776] = (curWriteSel == 0) ? multResult[118] : addResult[118];
assign rcWriteData[3839:3808] = (curWriteSel == 0) ? multResult[119] : addResult[119];
assign rcWriteData[3871:3840] = (curWriteSel == 0) ? multResult[120] : addResult[120];
assign rcWriteData[3903:3872] = (curWriteSel == 0) ? multResult[121] : addResult[121];
assign rcWriteData[3935:3904] = (curWriteSel == 0) ? multResult[122] : addResult[122];
assign rcWriteData[3967:3936] = (curWriteSel == 0) ? multResult[123] : addResult[123];
assign rcWriteData[3999:3968] = (curWriteSel == 0) ? multResult[124] : addResult[124];
assign rcWriteData[4031:4000] = (curWriteSel == 0) ? multResult[125] : addResult[125];
assign rcWriteData[4063:4032] = (curWriteSel == 0) ? multResult[126] : addResult[126];
assign rcWriteData[4095:4064] = (curWriteSel == 0) ? multResult[127] : addResult[127];
assign rcWriteData[4127:4096] = (curWriteSel == 0) ? multResult[128] : addResult[128];
assign rcWriteData[4159:4128] = (curWriteSel == 0) ? multResult[129] : addResult[129];
assign rcWriteData[4191:4160] = (curWriteSel == 0) ? multResult[130] : addResult[130];
assign rcWriteData[4223:4192] = (curWriteSel == 0) ? multResult[131] : addResult[131];
assign rcWriteData[4255:4224] = (curWriteSel == 0) ? multResult[132] : addResult[132];
assign rcWriteData[4287:4256] = (curWriteSel == 0) ? multResult[133] : addResult[133];
assign rcWriteData[4319:4288] = (curWriteSel == 0) ? multResult[134] : addResult[134];
assign rcWriteData[4351:4320] = (curWriteSel == 0) ? multResult[135] : addResult[135];
assign rcWriteData[4383:4352] = (curWriteSel == 0) ? multResult[136] : addResult[136];
assign rcWriteData[4415:4384] = (curWriteSel == 0) ? multResult[137] : addResult[137];
assign rcWriteData[4447:4416] = (curWriteSel == 0) ? multResult[138] : addResult[138];
assign rcWriteData[4479:4448] = (curWriteSel == 0) ? multResult[139] : addResult[139];
assign rcWriteData[4511:4480] = (curWriteSel == 0) ? multResult[140] : addResult[140];
assign rcWriteData[4543:4512] = (curWriteSel == 0) ? multResult[141] : addResult[141];
assign rcWriteData[4575:4544] = (curWriteSel == 0) ? multResult[142] : addResult[142];
assign rcWriteData[4607:4576] = (curWriteSel == 0) ? multResult[143] : addResult[143];
assign rcWriteData[4639:4608] = (curWriteSel == 0) ? multResult[144] : addResult[144];
assign rcWriteData[4671:4640] = (curWriteSel == 0) ? multResult[145] : addResult[145];
assign rcWriteData[4703:4672] = (curWriteSel == 0) ? multResult[146] : addResult[146];
assign rcWriteData[4735:4704] = (curWriteSel == 0) ? multResult[147] : addResult[147];
assign rcWriteData[4767:4736] = (curWriteSel == 0) ? multResult[148] : addResult[148];
assign rcWriteData[4799:4768] = (curWriteSel == 0) ? multResult[149] : addResult[149];
assign rcWriteData[4831:4800] = (curWriteSel == 0) ? multResult[150] : addResult[150];
assign rcWriteData[4863:4832] = (curWriteSel == 0) ? multResult[151] : addResult[151];
assign rcWriteData[4895:4864] = (curWriteSel == 0) ? multResult[152] : addResult[152];
assign rcWriteData[4927:4896] = (curWriteSel == 0) ? multResult[153] : addResult[153];
assign rcWriteData[4959:4928] = (curWriteSel == 0) ? multResult[154] : addResult[154];
assign rcWriteData[4991:4960] = (curWriteSel == 0) ? multResult[155] : addResult[155];
assign rcWriteData[5023:4992] = (curWriteSel == 0) ? multResult[156] : addResult[156];
assign rcWriteData[5055:5024] = (curWriteSel == 0) ? multResult[157] : addResult[157];
assign rcWriteData[5087:5056] = (curWriteSel == 0) ? multResult[158] : addResult[158];
assign rcWriteData[5119:5088] = (curWriteSel == 0) ? multResult[159] : addResult[159];
assign rcWriteData[5151:5120] = (curWriteSel == 0) ? multResult[160] : addResult[160];
assign rcWriteData[5183:5152] = (curWriteSel == 0) ? multResult[161] : addResult[161];
assign rcWriteData[5215:5184] = (curWriteSel == 0) ? multResult[162] : addResult[162];
assign rcWriteData[5247:5216] = (curWriteSel == 0) ? multResult[163] : addResult[163];
assign rcWriteData[5279:5248] = (curWriteSel == 0) ? multResult[164] : addResult[164];
assign rcWriteData[5311:5280] = (curWriteSel == 0) ? multResult[165] : addResult[165];
assign rcWriteData[5343:5312] = (curWriteSel == 0) ? multResult[166] : addResult[166];
assign rcWriteData[5375:5344] = (curWriteSel == 0) ? multResult[167] : addResult[167];
assign rcWriteData[5407:5376] = (curWriteSel == 0) ? multResult[168] : addResult[168];
assign rcWriteData[5439:5408] = (curWriteSel == 0) ? multResult[169] : addResult[169];
assign rcWriteData[5471:5440] = (curWriteSel == 0) ? multResult[170] : addResult[170];
assign rcWriteData[5503:5472] = (curWriteSel == 0) ? multResult[171] : addResult[171];
assign rcWriteData[5535:5504] = (curWriteSel == 0) ? multResult[172] : addResult[172];
assign rcWriteData[5567:5536] = (curWriteSel == 0) ? multResult[173] : addResult[173];
assign rcWriteData[5599:5568] = (curWriteSel == 0) ? multResult[174] : addResult[174];
assign rcWriteData[5631:5600] = (curWriteSel == 0) ? multResult[175] : addResult[175];
assign rcWriteData[5663:5632] = (curWriteSel == 0) ? multResult[176] : addResult[176];
assign rcWriteData[5695:5664] = (curWriteSel == 0) ? multResult[177] : addResult[177];
assign rcWriteData[5727:5696] = (curWriteSel == 0) ? multResult[178] : addResult[178];
assign rcWriteData[5759:5728] = (curWriteSel == 0) ? multResult[179] : addResult[179];
assign rcWriteData[5791:5760] = (curWriteSel == 0) ? multResult[180] : addResult[180];
assign rcWriteData[5823:5792] = (curWriteSel == 0) ? multResult[181] : addResult[181];
assign rcWriteData[5855:5824] = (curWriteSel == 0) ? multResult[182] : addResult[182];
assign rcWriteData[5887:5856] = (curWriteSel == 0) ? multResult[183] : addResult[183];
assign rcWriteData[5919:5888] = (curWriteSel == 0) ? multResult[184] : addResult[184];
assign rcWriteData[5951:5920] = (curWriteSel == 0) ? multResult[185] : addResult[185];
assign rcWriteData[5983:5952] = (curWriteSel == 0) ? multResult[186] : addResult[186];
assign rcWriteData[6015:5984] = (curWriteSel == 0) ? multResult[187] : addResult[187];
assign rcWriteData[6047:6016] = (curWriteSel == 0) ? multResult[188] : addResult[188];
assign rcWriteData[6079:6048] = (curWriteSel == 0) ? multResult[189] : addResult[189];
assign rcWriteData[6111:6080] = (curWriteSel == 0) ? multResult[190] : addResult[190];
assign rcWriteData[6143:6112] = (curWriteSel == 0) ? multResult[191] : addResult[191];
assign rcWriteData[6175:6144] = (curWriteSel == 0) ? multResult[192] : addResult[192];
assign rcWriteData[6207:6176] = (curWriteSel == 0) ? multResult[193] : addResult[193];
assign rcWriteData[6239:6208] = (curWriteSel == 0) ? multResult[194] : addResult[194];
assign rcWriteData[6271:6240] = (curWriteSel == 0) ? multResult[195] : addResult[195];
assign rcWriteData[6303:6272] = (curWriteSel == 0) ? multResult[196] : addResult[196];
assign rcWriteData[6335:6304] = (curWriteSel == 0) ? multResult[197] : addResult[197];
assign rcWriteData[6367:6336] = (curWriteSel == 0) ? multResult[198] : addResult[198];
assign rcWriteData[6399:6368] = (curWriteSel == 0) ? multResult[199] : addResult[199];
assign rcWriteData[6431:6400] = (curWriteSel == 0) ? multResult[200] : addResult[200];
assign rcWriteData[6463:6432] = (curWriteSel == 0) ? multResult[201] : addResult[201];
assign rcWriteData[6495:6464] = (curWriteSel == 0) ? multResult[202] : addResult[202];
assign rcWriteData[6527:6496] = (curWriteSel == 0) ? multResult[203] : addResult[203];
assign rcWriteData[6559:6528] = (curWriteSel == 0) ? multResult[204] : addResult[204];
assign rcWriteData[6591:6560] = (curWriteSel == 0) ? multResult[205] : addResult[205];
assign rcWriteData[6623:6592] = (curWriteSel == 0) ? multResult[206] : addResult[206];
assign rcWriteData[6655:6624] = (curWriteSel == 0) ? multResult[207] : addResult[207];
assign rcWriteData[6687:6656] = (curWriteSel == 0) ? multResult[208] : addResult[208];
assign rcWriteData[6719:6688] = (curWriteSel == 0) ? multResult[209] : addResult[209];
assign rcWriteData[6751:6720] = (curWriteSel == 0) ? multResult[210] : addResult[210];
assign rcWriteData[6783:6752] = (curWriteSel == 0) ? multResult[211] : addResult[211];
assign rcWriteData[6815:6784] = (curWriteSel == 0) ? multResult[212] : addResult[212];
assign rcWriteData[6847:6816] = (curWriteSel == 0) ? multResult[213] : addResult[213];
assign rcWriteData[6879:6848] = (curWriteSel == 0) ? multResult[214] : addResult[214];
assign rcWriteData[6911:6880] = (curWriteSel == 0) ? multResult[215] : addResult[215];
assign rcWriteData[6943:6912] = (curWriteSel == 0) ? multResult[216] : addResult[216];
assign rcWriteData[6975:6944] = (curWriteSel == 0) ? multResult[217] : addResult[217];
assign rcWriteData[7007:6976] = (curWriteSel == 0) ? multResult[218] : addResult[218];
assign rcWriteData[7039:7008] = (curWriteSel == 0) ? multResult[219] : addResult[219];
assign rcWriteData[7071:7040] = (curWriteSel == 0) ? multResult[220] : addResult[220];
assign rcWriteData[7103:7072] = (curWriteSel == 0) ? multResult[221] : addResult[221];
assign rcWriteData[7135:7104] = (curWriteSel == 0) ? multResult[222] : addResult[222];
assign rcWriteData[7167:7136] = (curWriteSel == 0) ? multResult[223] : addResult[223];
assign rcWriteData[7199:7168] = (curWriteSel == 0) ? multResult[224] : addResult[224];
assign rcWriteData[7231:7200] = (curWriteSel == 0) ? multResult[225] : addResult[225];
assign rcWriteData[7263:7232] = (curWriteSel == 0) ? multResult[226] : addResult[226];
assign rcWriteData[7295:7264] = (curWriteSel == 0) ? multResult[227] : addResult[227];
assign rcWriteData[7327:7296] = (curWriteSel == 0) ? multResult[228] : addResult[228];
assign rcWriteData[7359:7328] = (curWriteSel == 0) ? multResult[229] : addResult[229];
assign curWriteDataLU = rcWriteData;

always @ (posedge clk)
begin
	if(curMemSel == 0)
	begin
		curWriteData0Reg[0] <= curWriteDataMem;
		curWriteAddr0Reg[0] <= curWriteAddrMem;
		curReadAddr0Reg[0] <= curReadAddrMem;
		curWriteByteEn0Reg[0] <= curWriteByteEnMem;
		curWriteEn0Reg[0] <= curWriteEnMem;
		curWriteData1Reg[0] <= curWriteDataLU;
		curWriteAddr1Reg[0] <= curWriteAddrLU;
		curReadAddr1Reg[0] <= curReadAddrLU;
		curWriteByteEn1Reg[0] <= curWriteByteEnLU;
		curWriteEn1Reg[0] <= curWriteEnLU;
	end
	else
	begin
		curWriteData0Reg[0] <= curWriteDataLU;
		curWriteAddr0Reg[0] <= curWriteAddrLU;
		curReadAddr0Reg[0] <= curReadAddrLU;
		curWriteByteEn0Reg[0] <= curWriteByteEnLU;
		curWriteEn0Reg[0] <= curWriteEnLU;
		curWriteData1Reg[0] <= curWriteDataMem;
		curWriteAddr1Reg[0] <= curWriteAddrMem;
		curReadAddr1Reg[0] <= curReadAddrMem;
		curWriteByteEn1Reg[0] <= curWriteByteEnMem;
		curWriteEn1Reg[0] <= curWriteEnMem;
	end
	curWriteData0Reg[1] <= curWriteData0Reg[0];
	curWriteAddr0Reg[1] <= curWriteAddr0Reg[0];
	curReadAddr0Reg[1] <= curReadAddr0Reg[0];
	curWriteByteEn0Reg[1] <= curWriteByteEn0Reg[0];
	curWriteEn0Reg[1] <= curWriteEn0Reg[0];
	curWriteData1Reg[1] <= curWriteData1Reg[0];
	curWriteAddr1Reg[1] <= curWriteAddr1Reg[0];
	curReadAddr1Reg[1] <= curReadAddr1Reg[0];
	curWriteByteEn1Reg[1] <= curWriteByteEn1Reg[0];
	curWriteEn1Reg[1] <= curWriteEn1Reg[0];
end
assign curWriteData0 = curWriteData0Reg[1];
assign curWriteAddr0 = curWriteAddr0Reg[1];
assign curReadAddr0 = curReadAddr0Reg[1];
assign curWriteByteEn0 = curWriteByteEn0Reg[1];
assign curWriteEn0 = curWriteEn0Reg[1];
assign curWriteData1 = curWriteData1Reg[1];
assign curWriteAddr1 = curWriteAddr1Reg[1];
assign curReadAddr1 = curReadAddr1Reg[1];
assign curWriteByteEn1 = curWriteByteEn1Reg[1];
assign curWriteEn1 = curWriteEn1Reg[1];

always @ (posedge clk)
begin
		curReadData0Reg[0] <= curReadData0;
		curReadData1Reg[0] <= curReadData1;
end
assign curReadDataMem = (curMemSel == 0) ? curReadData0Reg[0] : curReadData1Reg[0];
assign curReadDataLU = (curMemSel == 0) ? curReadData1Reg[0] : curReadData0Reg[0];
endmodule
