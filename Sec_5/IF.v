// build a module for instruction fetch stage
module IF_Stage
	(
		clk,
		rst,
		stall,
		Instruction,
		branch_taken,
		branch_address,
		PC
	);

	// define input and output ports
	input			clk;
	input			rst;
	input			stall;
	input 			branch_taken;
	input	[31:0]	branch_address;
	output	[31:0]	Instruction;
	output	[31:0]	PC;

	// registers
	reg		[31:0]	Instruction;
	reg		[31:0]	PC;

	// build module

	// build program counter
	always @(posedge clk)
	begin
		if(rst)
			PC <= 32'b0;
		else
		begin
			if(branch_taken)
					PC <= branch_address;
			else
				if( ~stall )
					PC <= PC + 4;
		end
	end

	// build instruction memory
	always @(*)
	begin
		case(PC[31:2])
		1:		Instruction = 32'b100000_00000_00001_00000_11000001010;//-- Addi r1 ,r0 ,1546 //r1=1546
		2:		Instruction = 32'b000001_00000_00001_00010_00000000000;//-- Add r2 ,r0 ,r1//r2=1546
		3:		Instruction = 32'b000011_00000_00001_00011_00000000000;//-- sub r3 ,r0 ,r1//r3=-1546
		4:		Instruction = 32'b000101_00010_00011_0010000000000000; //--and r4,r2,r3 //r4=2
		5:		Instruction = 32'b100001_00011_00101_0001101000110100; //--subi r5,r3,//r5=-8254
		6:		Instruction = 32'b000110_00011_00100_0010100000000000; //--or r5,r3,r4 //r5=-1546
		7:		Instruction = 32'b000111_00101_00000_0011000000000000; //--nor r6,r5,r0//r6=1545
		8:		Instruction = 32'b000111_00100_00000_0101100000000000; //--nor r11,r4,r0//r11=-3
		9:		Instruction = 32'b000011_00101_00101_0010100000000000; //--sub r5,r5,r5//r5=0
		10:		Instruction = 32'b100000_00000_00001_0000010000000000; //--addi r1,r0,1024 //r1=1024
		11:		Instruction = 32'b100101_00001_00010_0000000000000000; //-- st r2 ,r1 ,0 //
		12:		Instruction = 32'b100100_00001_00101_00000_00000000000;//-- ld r5 ,r1 ,0 //r5=1546
		13:		Instruction = 32'b101000_00101_00000_00000_00000000001;//-- Bez r5 ,1//not taken
		14:		Instruction = 32'b001000_00101_00001_00111_00000000000;//-- xor r7 ,r5 ,r1 //r7=522
		15:		Instruction = 32'b001000_00101_00001_00000_00000000000;//-- xor r0 ,r5 ,r1 //r0=0
		16:		Instruction = 32'b001001_00011_00100_00111_00000000000;//-- sla r7 ,r3 ,r4//r7=-6184
		17:		Instruction = 32'b100101_00001_00111_00000_00000010100;//-- st r7 ,r1 ,20
		18:		Instruction = 32'b001010_00011_00100_01000_00000000000;//-- sll r8 ,r3 ,r4  //r8=-6184
		19:		Instruction = 32'b001011_00011_00100_01001_00000000000;//-- sra r9 ,r3 ,r4 //r9=1073741437
		20:		Instruction = 32'b001100_00011_00100_01010_00000000000;//-- srl r10 ,r3 ,r4//r10=-384
		21:		Instruction = 32'b100101_00001_00011_00000_00000000100;//-- st r3 ,r1 ,4
		22:		Instruction = 32'b100101_00001_00100_00000_00000001000;//-- st r4 ,r1 ,8
		23:		Instruction = 32'b100101_00001_00101_00000_00000001100;//-- st r5 ,r1 ,12
		24:		Instruction = 32'b100101_00001_00110_00000_00000010000;//-- st r6 ,r1 ,16
		25:		Instruction = 32'b100100_00001_01011_00000_00000000100;//-- ld r11 ,r1 ,4//r11=-1456
		26:		Instruction = 32'b100101_00001_01011_00000_00000011000;//-- st r11 ,r1 ,24
		27:		Instruction = 32'b100101_00001_01001_00000_00000011100;//-- st r9 ,r1 ,28
		28:		Instruction = 32'b100101_00001_01010_00000_00000100000;//-- st r10 ,r1 ,32 
		29:		Instruction = 32'b100101_00001_01000_00000_00000100100;//-- st r8 ,r1 ,36
		30:		Instruction = 32'b100000_00000_00001_00000_00000000011;//-- Addi r1 ,r0 ,3 //r1=3
		31:		Instruction = 32'b100000_00000_00100_00000_10000000000;//-- Addi r4 ,r0 ,1024   //r4=1024 
		32:		Instruction = 32'b100000_00000_00010_00000_00000000000;//-- Addi r2 ,r0 ,0 //r2=0
		33:		Instruction = 32'b100000_00000_00011_00000_00000000001;//-- Addi r3 ,r0 ,1 //r3=1
		34:		Instruction = 32'b100000_00000_01001_00000_00000000010;//-- Addi r9 ,r0 ,2 //r9=2
		35:		Instruction = 32'b001010_00011_01001_01000_00000000000;//-- sll r8 ,r3 ,r9 //r8=r3*4
		36:		Instruction = 32'b000001_00100_01000_01000_00000000000;//-- Add r8 ,r4 ,r8 //r8=1024+r3*4
		37:		Instruction = 32'b100100_01000_00101_00000_00000000000;//-- ld r5 ,r8 ,0 //
		38:		Instruction = 32'b100100_01000_00110_11111_11111111100;//-- ld r6 ,r8 ,-4 //
		39:		Instruction = 32'b000011_00101_00110_01001_00000000000;//-- sub r9 ,r5 ,r6 
		40:		Instruction = 32'b100000_00000_01010_10000_00000000000;//-- Addi r10 ,r0 ,0x8000
		41:		Instruction = 32'b100000_00000_01011_00000_00000010000;//-- Addi r11 ,r0 ,16 // r11 = 16
		42:		Instruction = 32'b001010_01010_01011_01010_00000000000;//-- sll r10 ,r10 ,r11 // r10 = 2147483648 
		43:		Instruction = 32'b000101_01001_01010_01001_00000000000;//-- And r9 ,r9 ,r10 // if(r5>r6) r9=0 else r9=-2147483648
		44:		Instruction = 32'b101000_01001_00000_00000_00000000010;//-- Bez r9 ,2 
		45:		Instruction = 32'b100101_01000_00101_11111_11111111100;//-- st r5 ,r8 ,-4 
		46:		Instruction = 32'b100101_01000_00110_00000_00000000000;//-- st r6 ,r8 ,0
		47:		Instruction = 32'b100000_00011_00011_00000_00000000001;//-- Addi r3 ,r3 ,1 // 
		48:		Instruction = 32'b101001_00001_00011_11111_11111110001;//-- BNE r1 ,r3 ,-15
		49:		Instruction = 32'b100000_00010_00010_00000_00000000001;//-- Addi r2 ,r2 ,1 //2
		50:		Instruction = 32'b101001_00001_00010_11111_11111101110;//-- BNE r1 ,r2 ,-18
		51:		Instruction = 32'b100000_00000_00001_00000_10000000000;//-- Addi r1 ,r0 ,1024 //r1=1024
		52:		Instruction = 32'b100100_00001_00010_00000_00000000000;//-- ld ,r2 ,r1 ,0 //r2=-1546
		53:		Instruction = 32'b100100_00001_00011_00000_00000000100;//-- ld ,r3 ,r1 ,4 //r3=2
		54:		Instruction = 32'b100100_00001_00100_00000_00000001000;//-- ld ,r4 ,r1 ,8 //r4=1546
		55:		Instruction = 32'b100100_00001_00100_00000_01000001000;//-- ld ,r4 ,r1 ,520 // after SRAM r4=random number
		56:		Instruction = 32'b100100_00001_00100_00000_10000001000;//-- ld ,r4 ,r1 ,1023 // after SRAM r4=random number
		57:		Instruction = 32'b100100_00001_00101_00000_00000001100;//-- ld ,r5 ,r1 ,12 // r5=1546
		58:		Instruction = 32'b100100_00001_00110_00000_00000010000;//-- ld ,r6 ,r1 ,16 //r6=1545
		59:		Instruction = 32'b100100_00001_00111_00000_00000010100;//-- ld ,r7 ,r1 ,20 //r7=-6184
		60:		Instruction = 32'b100100_00001_01000_00000_00000011000;//-- ld ,r8 ,r1 ,24 //r8=-1546
		61:		Instruction = 32'b100100_00001_01001_00000_00000011100;//-- ld ,r9 ,r1 ,28 //r9=1073741437
		62:		Instruction = 32'b100100_00001_01010_00000_00000100000;//-- ld ,r10,r1 ,32 //r10=-387
		63:		Instruction = 32'b100100_00001_01011_00000_00000100100;//-- ld ,r11,r1 ,36 //r11=-6184 // when change report execution clock
		64:		Instruction = 32'b101010_00000_00000_11111_11111111111;//-- JMP -1*/
		default:Instruction = 32'b000000_xxxxx_xxxxx_xxxxx_xxxxxxxxxxx;
		endcase
	end

endmodule
