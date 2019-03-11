// build a module for instruction decode
module MEM_Stage
	(
		clk,
		rst,
		read,
		write,
		address,
		readdata,
		writedata
	);
	
	// input and outputs
	input			clk;
	input			rst;
	input			read;
	input			write;
	input	[9:0]	address;
	input	[31:0]	writedata;
	output	[31:0]	readdata;
	
	// registers and wires
	reg	[31:0]	registers[255:0];
	
	// build module
	
	assign readdata = (read) ? registers[address[9:2]] : 32'b0;
	
	always @(posedge clk)
	begin
		if(write)
		begin
			registers[address] <= writedata;
		end
	end
	
endmodule
