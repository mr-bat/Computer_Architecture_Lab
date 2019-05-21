// build a module for instruction decode
module MEM_Stage
	(
		clk,
		rst,
		read,
		write,
		address,
		readdata,
		writedata,
		SRAM_NOT_READY,
		SRAMaddress,
		SRAMWEn,
		SRAMdata
	);

	// input and outputs
	input	clk;
	input	rst;
	input	read;
	input	write;
	input	[15:0] address;
	input	[31:0] writedata;
	output SRAMWEn;
	output SRAM_NOT_READY;
	output [17:0]	SRAMaddress;
	output [31:0]	readdata;
	inout	[15:0]	SRAMdata;

	// registers and wires
	wire	[15:0]	realaddress;

	// build module

	// memory address generator
	MemAdd MA
	(
		.address_in(address),
		.address(realaddress)
	);

	// read part
	SRAM_CTR sram
		(
			.clk(clk),
			.MEM_R_EN(read),
			.MEM_W_EN(write),
			.rst(rst),
			.SRAMaddress(SRAMaddress),
			.SRAMWEn(SRAMWEn),
			.SRAMdata(SRAMdata),
			.SRAM_NOT_READY(SRAM_NOT_READY),
			.writeData(writedata),
			.address(realaddress),
			.readData(readdata)
		);

endmodule
