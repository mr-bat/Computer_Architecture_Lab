// build a module for assembling
// FPGA: EP2C35F672C6
module MIPS
	(
		clk,
		rst,
		sel,
		Instruction
	);

	// parameters
	parameter BNE_Code = 2'b10;

	// input and outputs
	input			clk;
	input			rst;
	input 		sel;
	output	[5:0]	Instruction;

	// wires
	wire    shouldStallBy1FromExe;
	wire    shouldStallBy2FromExe;
	wire    shouldStallBy1FromMem;
	wire    shouldStallBy2FromMem;
	wire    shouldForward1FromExe;
	wire    shouldForward2FromExe;
	wire    shouldForward1FromMem;
	wire    shouldForward2FromMem;
	wire 			WB_En21;
	wire			WB_En22;
	wire			WB_En32;
	wire			WB_En42;
	wire			MEM_R_En21;
	wire			MEM_R_En22;
	wire			MEM_R_En32;
	wire			MEM_R_En42;
	wire			MEM_W_En21;
	wire			MEM_W_En22;
	wire			MEM_W_En32;
	wire			Is_Imm1;
	wire			Is_Imm2;
	wire      shouldStallBy1;
	wire      shouldStallBy2;
	wire      shouldForward1;
	wire      shouldForward2;
	wire 			Branch_Taken;
	wire			Stall;
	wire 			loadForwardStall;
	wire	[1:0]	BR_Type1;
	wire	[1:0]	BR_Type2;
	wire	[4:0]	src11;
	wire	[4:0]	src21;
	wire	[4:0]	src12;
	wire	[4:0]	src22;
	wire	[4:0]	dest1;
	wire	[4:0]	dest2;
	wire	[4:0]	dest3;
	wire	[4:0]	dest4;
	wire	[3:0]	EXE_Cmd1;
	wire	[3:0]	EXE_Cmd2;
	wire	[31:0]	PC11;
	wire	[31:0]	PC12;
	wire	[31:0]	PC2;
	wire	[31:0]	PC3;
	wire	[31:0]	PC4;
	wire	[31:0]	Instruction1;
	wire	[31:0]	Instruction2;
	wire 	[31:0] 	Branch_Address;
	wire	[31:0]	readdata11;
	wire	[31:0]	readdata12;
	wire	[31:0]	readdata21;
	wire	[31:0]	readdata22;
	wire	[31:0]	readdata22Forwarded;
	wire	[31:0]	readdata23;
	wire	[31:0]	data11;
	wire	[31:0]	data12;
	wire	[31:0]	data21;
	wire	[31:0]	data22;
	wire	[31:0]	Immediate1;
	wire	[31:0]	Immediate2;
	wire	[31:0]	Immediate3;
	wire    [31:0]  forwardVal11;
	wire    [31:0]  forwardVal12;
	wire	[31:0]	WB_Data;
	wire	[31:0]	ALU_Result31;
	wire	[31:0]	ALU_Result32;
	wire	[31:0]	ALU_Result42;
	wire	[31:0]	Mem_Data1;
	wire	[31:0]	Mem_Data2;

	// assemble modules

	assign Instruction = Instruction1[31:26]; // output

	IF_Stage IFS // instruction fetch
		(
			.clk(clk),
			.rst(rst),
			.stall(Stall),
			.loadForwardStall(loadForwardStall),
			.branch_address(Branch_Address),
			.Instruction(Instruction1),
			.branch_taken(Branch_Taken),
			.PC(PC11)
		);

	IF_Stage_reg IFR // instruction fetch register
		(
			.clk(clk),
			.rst(rst),
			.stall(Stall),
			.loadForwardStall(loadForwardStall),
			.Flush(Branch_Taken),
			.Instruction_in(Instruction1),
			.PC_in(PC11),
			.Instruction(Instruction2),
			.PC(PC12)
		);

	ID_Stage IDS // instruction decode
		(
			.clk(clk),
			.rst(rst),
			.writedata(WB_Data),
			.write(WB_En42),
			.lastDestination(dest4),
			.Instruction_in(Instruction2),
			.WB_En(WB_En21),
			.MEM_R_En(MEM_R_En21),
			.MEM_W_En(MEM_W_En21),
			.Is_Imm(Is_Imm1),
			.BR_Type(BR_Type1),
			.EXE_Cmd(EXE_Cmd1),
			.readdata1(readdata11),
			.readdata2(readdata21),
			.Immediate(Immediate1),
			.data1(data11),
			.data2(data21),
			.src1(src11),
			.src2(src21),
			.dest(dest1)
		);

	ID_Stage_reg IDR // instruction decode register
		(
			.clk(clk),
			.rst(rst),
			.stall(Stall),
			.loadForwardStall(loadForwardStall),
			.Flush(Branch_Taken),
			.readdata1_in(readdata11),
			.readdata2_in(readdata21),
			.Is_Imm_in(Is_Imm1),
			.Immediate_in(Immediate1),
			.data1_in(data11),
			.data2_in(data21),
			.dest_in(dest1),
			.WB_En_in(WB_En21),
			.MEM_R_En_in(MEM_R_En21),
			.MEM_W_En_in(MEM_W_En21),
			.BR_Type_in(BR_Type1),
			.EXE_Cmd_in(EXE_Cmd1),
			.PC_in(PC12),
			.src1_in(src11),
			.src2_in(src21),
			.readdata1(readdata12),
			.readdata2(readdata22),
			.Is_Imm(Is_Imm2),
			.Immediate(Immediate2),
			.data1(data12),
			.data2(data22),
			.src1(src12),
			.src2(src22),
			.dest(dest2),
			.WB_En(WB_En22),
			.MEM_R_En(MEM_R_En22),
			.MEM_W_En(MEM_W_En22),
			.BR_Type(BR_Type2),
			.EXE_Cmd(EXE_Cmd2),
			.PC(PC2)
		);

	EXE_Stage EXES // execution
		(
			.BR_Type(BR_Type2),
			.EXE_Cmd(EXE_Cmd2),
			.readdata1(data12),
			.readdata2(readdata22),
			.Immediate(Immediate2),
			.data2(data22),
			.branch_taken(Branch_Taken),
			.PC_in(PC11),
			.branch_address(Branch_Address),
			.ALU_result(ALU_Result31),
            		.shouldForward1(shouldForward1),
            		.shouldForward2(shouldForward2),
		        .forwardVal1(forwardVal11),
            		.forwardVal2(forwardVal12)
		);

	EXE_Stage_reg EXER	// execution register
		(
			.clk(clk),
			.rst(rst),
			.loadForwardStall(loadForwardStall),
			.PC_in(PC2),
			.PC(PC3),
			.WB_En_in(WB_En22),
			.MEM_R_En_in(MEM_R_En22),
			.MEM_W_En_in(MEM_W_En22),
			.readdata_in(readdata22Forwarded),
			.Immediate_in(Immediate3),
			.ALU_result_in(ALU_Result31),
			.dest_in(dest2),
			.WB_En(WB_En32),
			.MEM_R_En(MEM_R_En32),
			.MEM_W_En(MEM_W_En32),
			.readdata(readdata23),
			.Immediate(Immediate3),
			.ALU_result(ALU_Result32),
			.dest(dest3)
		);

	// hazard unit
	assign shouldStallBy1FromExe = !( src11 ^ dest2 ) & WB_En22 & |dest2;
	assign shouldStallBy2FromExe = !( src21 ^ dest2 ) & WB_En22 & (~Is_Imm1 | !(BR_Type1 ^ BNE_Code)) & |dest2;
	assign shouldStallBy1FromMem = !( src11 ^ dest3 ) & WB_En32 & |dest3;
	assign shouldStallBy2FromMem = !( src21 ^ dest3 ) & WB_En32 & (~Is_Imm1 | !(BR_Type1 ^ BNE_Code)) & |dest3;
	assign shouldStallBy1 = shouldStallBy1FromExe | shouldStallBy1FromMem;
	assign shouldStallBy2 = shouldStallBy2FromExe | shouldStallBy2FromMem;
	assign Stall = (shouldStallBy1 | shouldStallBy2) & sel;

	// forwarding unit
	assign shouldForward1FromExe = !(src12 ^ dest3) & WB_En32 & |dest3;
	assign shouldForward2FromExe = !(src22 ^ dest3) & WB_En32 & (~Is_Imm2 | !(BR_Type2 ^ BNE_Code)) & |dest3;
	assign shouldForward1FromMem = !(src12 ^ dest4) & WB_En42 & |dest4;
	assign shouldForward2FromMem = !(src22 ^ dest4) & WB_En42 & (~Is_Imm2 | !(BR_Type2 ^ BNE_Code)) & |dest4;
	assign shouldForward1 = shouldForward1FromExe | shouldForward1FromMem & ~sel;
	assign shouldForward2 = shouldForward2FromExe | shouldForward2FromMem & ~sel;
	assign shouldForward1FromMemLoadMem = !(src12 ^ dest4) & MEM_R_En42 & |dest4;
	assign shouldForward2FromMemLoadMem = !(src22 ^ dest4) & MEM_R_En42 & |dest4;
	assign loadForwardStall = shouldForward1FromMemLoadMem | shouldForward2FromMemLoadMem & ~sel;
	assign forwardVal11 = (shouldForward1FromExe) ? ALU_Result32 : (shouldForward1FromMem) ? ALU_Result42 : {32{1'bx}};
	assign forwardVal12 = (shouldForward2FromExe) ? ALU_Result32 : (shouldForward2FromMem) ? ALU_Result42 : {32{1'bx}};
	assign shouldForwardMemWriteFromExe = !(src22 ^ dest3) & WB_En32 & MEM_W_En22 & |dest3 & ~sel; //st
	assign shouldForwardMemWriteFromMem = !(src22 ^ dest4) & WB_En42 & MEM_W_En22 & |dest4 & ~sel; //st
	assign readdata22Forwarded = (shouldForwardMemWriteFromExe) ? ALU_Result32 : (shouldForwardMemWriteFromMem) ? ALU_Result42 : readdata22;

	MEM_Stage MEMS // memory
		(
			.clk(clk),
			.rst(rst),
			.read(MEM_R_En32),
			.write(MEM_W_En32),
			.address(ALU_Result32[15:0]),
			.readdata(Mem_Data1),
			.writedata(readdata23)
		);

	MEM_Stage_reg MEMR	// memory register
		(
			.clk(clk),
			.rst(rst),
			.PC_in(PC3),
			.PC(PC4),
			.WB_En_in(WB_En32),
			.MEM_R_En_in(MEM_R_En32),
			.ALU_result_in(ALU_Result32),
			.Mem_Data_in(Mem_Data1),
			.dest_in(dest3),
			.WB_En(WB_En42),
			.MEM_R_En(MEM_R_En42),
			.ALU_result(ALU_Result42),
			.Mem_Data(Mem_Data2),
			.dest(dest4)
		);

	WB_Stage WBS	// writeback
		(
			.MEM_R_En(MEM_R_En42),
			.ALU_result(ALU_Result42),
			.Mem_Data(Mem_Data2),
			.WB_Data(WB_Data)
		);

endmodule
