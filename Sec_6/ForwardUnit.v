// build a module for ForwardUnit detection
module ForwardUnit
	(
		BR_Type,
		WB_En1,
		WB_En2,
		Is_Imm,
		src1,
		src2,
		dest1,
		dest2,
		aluResult1,
		aluResult2,
		srcOut1,
		srcOut2,
		shouldForward1,
		shouldForward2,
	);
	
	// define input and output ports
	input			WB_En1;
	input			WB_En2;
	input			Is_Imm;
	input	[1:0]	BR_Type;
	input	[4:0]	src1;
	input	[4:0]	src2;
	input	[4:0]	dest1;
	input	[4:0]	dest2;
	input	[31:0]	aluResult1;
	input	[31:0]	aluResult2;
	output 			shouldForward1;
	output 			shouldForward2;
	output	[31:0]	srcOut1;
	output	[31:0]	srcOut2;

	// define branch types	
	parameter NO_BRANCH_Code = 2'b0;
	parameter BEZ_Code = 2'b01;
	parameter BNE_Code = 2'b10;
	parameter JMP_Code = 2'b11;

	// build module
	always @(*)
	begin
		if( !( src1 ^ dest1 ) & WB_En1 )
		begin
			srcOut1 = aluResult1;
		end
		if( !( src2 ^ dest1 ) & WB_En1 & ~Is_Imm)
		begin
			srcOut2 = aluResult1;
		end
		if( !( src1 ^ dest2 ) & WB_En2 )
		begin
			srcOut1 = aluResult2;
		end
		if( !( src2 ^ dest2 ) & WB_En2 & (~Is_Imm | Stall_Special_Condition) )
		begin
			srcOut2 = aluResult2;
		end
	end
endmodule

