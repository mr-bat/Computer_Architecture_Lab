
module DE2_Media_Computer (
	// Inputs
	CLOCK_50,
	CLOCK_27,
	EXT_CLOCK,
	KEY,
	SW,

	//  Communication
	UART_RXD,
	
	// Audio
	AUD_ADCDAT,
	
	//IrDA
	IRDA_RXD,

	// Video In
	TD_CLK27,
	TD_DATA,
	TD_HS,
	TD_VS,
	
	// Ethernet
	ENET_INT,
	
	// USB
	OTG_INT0,
	OTG_INT1,

/*****************************************************************************/
	// Bidirectionals
	GPIO_0,
	GPIO_1,

	// Memory (SRAM)
	SRAM_DQ,
	
	// Memory (SDRAM)
	DRAM_DQ,

	// PS2 Port
	PS2_CLK,
	PS2_DAT,
	
	// Audio
	AUD_BCLK,
	AUD_ADCLRCK,
	AUD_DACLRCK,
	
	// Char LCD 16x2
	LCD_DATA,

	// AV Config
	I2C_SDAT,
	
	//SD Card
	SD_CMD,
	SD_DAT,
	SD_DAT3,
	
	//Flash
	FL_DQ,
	
	// Ethernet
	ENET_DATA,
	
	//USB
	OTG_DATA,
	
/*****************************************************************************/
	// Outputs
	
	// 	Simple
	LEDG,
	LEDR,

	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,
	HEX6,
	HEX7,
	
	// 	Memory (SRAM)
	SRAM_ADDR,

	SRAM_CE_N,
	SRAM_WE_N,
	SRAM_OE_N,
	SRAM_UB_N,
	SRAM_LB_N,
	
	//  Communication
	UART_TXD,
	
	// Memory (SDRAM)
	DRAM_ADDR,
	
	DRAM_BA_1,
	DRAM_BA_0,
	DRAM_CAS_N,
	DRAM_RAS_N,
	DRAM_CLK,
	DRAM_CKE,
	DRAM_CS_N,
	DRAM_WE_N,
	DRAM_UDQM,
	DRAM_LDQM,
	
	// Audio
	AUD_XCK,
	AUD_DACDAT,
	
	// VGA
	VGA_CLK,
	VGA_HS,
	VGA_VS,
	VGA_BLANK,
	VGA_SYNC,
	VGA_R,
	VGA_G,
	VGA_B,

	// Char LCD 16x2
	LCD_ON,
	LCD_BLON,
	LCD_EN,
	LCD_RS,
	LCD_RW,
	
	// AV Config
	I2C_SCLK,
	
	//SD Card
	SD_CLK,
	
	//Flash
	FL_ADDR,
   FL_CE_N,
	FL_OE_N,
	FL_RST_N,
	FL_WE_N,
	
	//IrDA
	IRDA_TXD,
	
	//Video In
	TD_RESET,
	
	// Ethernet
	ENET_CMD,
	ENET_CS_N,
	ENET_RD_N,
	ENET_RST_N,
	ENET_WR_N,
	ENET_CLK,
	
	// USB
	OTG_ADDR,
	OTG_CS_N,
	OTG_RD_N,
	OTG_RST_N,
	OTG_WR_N,
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/


/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input				CLOCK_50;
input				CLOCK_27;
input				EXT_CLOCK;
input		[3:0]	KEY;
input		[17:0]	SW;


//  Communication
input				UART_RXD;

//  Audio
input				AUD_ADCDAT;

//  IrDA
input				IRDA_RXD;

// Video In
input 	[7:0]	TD_DATA;
input   			TD_HS;
input  			TD_VS;
input 			TD_CLK27;

// Enternet
input				ENET_INT;

// USB
input          OTG_INT0;
input          OTG_INT1;

// Bidirectionals
inout		[35:0]	GPIO_0;
inout		[35:0]	GPIO_1;

// 	Memory (SRAM)
inout		[15:0]	SRAM_DQ;

//  Memory (SDRAM)
inout		[15:0]	DRAM_DQ;

//  PS2 Port
inout				PS2_CLK;
inout				PS2_DAT;

//  Audio
inout				AUD_BCLK;
inout				AUD_ADCLRCK;
inout				AUD_DACLRCK;

//  AV Config
inout				I2C_SDAT;

//  Char LCD 16x2
inout		[ 7: 0]	LCD_DATA;

// SD Card
inout 			SD_CMD;
inout 			SD_DAT;
inout 			SD_DAT3;

// Flash
inout 	[ 7: 0]  FL_DQ; 

// Ethernet
inout 	[15: 0]  ENET_DATA;

// USB
inout    [15: 0]  OTG_DATA;

// Outputs

// 	Simple
output		[8:0]	LEDG;
output		[17:0]	LEDR;

output		[6:0]	HEX0;
output		[6:0]	HEX1;
output		[6:0]	HEX2;
output		[6:0]	HEX3;
output		[6:0]	HEX4;
output		[6:0]	HEX5;
output		[6:0]	HEX6;
output		[6:0]	HEX7;

// 	Memory (SRAM)
output		[17:0]	SRAM_ADDR;

output				SRAM_CE_N;
output				SRAM_WE_N;
output				SRAM_OE_N;
output				SRAM_UB_N;
output				SRAM_LB_N;

//  Communication
output				UART_TXD;

//  Memory (SDRAM)
output		[11:0]	DRAM_ADDR;

output				DRAM_BA_1;
output				DRAM_BA_0;
output				DRAM_CAS_N;
output				DRAM_RAS_N;
output				DRAM_CLK;
output				DRAM_CKE;
output				DRAM_CS_N;
output				DRAM_WE_N;
output				DRAM_UDQM;
output				DRAM_LDQM;

//  Audio
output				AUD_XCK;
output				AUD_DACDAT;

//  VGA
output				VGA_CLK;
output				VGA_HS;
output				VGA_VS;
output				VGA_BLANK;
output				VGA_SYNC;
output		[ 9: 0]	VGA_R;
output		[ 9: 0]	VGA_G;
output		[ 9: 0]	VGA_B;

//  Char LCD 16x2
output				LCD_ON;
output				LCD_BLON;
output				LCD_EN;
output				LCD_RS;
output				LCD_RW;

//  AV Config
output				I2C_SCLK;

//  SD Card
output 				SD_CLK;

//  Flash
output 		[21: 0]	FL_ADDR;
output 				FL_CE_N;
output				FL_OE_N;
output				FL_RST_N;
output				FL_WE_N;
   
//  IrDA
output				IRDA_TXD;
   
//  Video In
output   			TD_RESET;

// Ethernet
output				ENET_CMD;
output				ENET_CS_N;
output				ENET_RD_N;
output				ENET_RST_N;
output				ENET_WR_N;
output				ENET_CLK;

//USB
output      [ 1: 0]  OTG_ADDR;
output				OTG_CS_N;
output				OTG_RD_N;
output				OTG_RST_N;
output				OTG_WR_N;



/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires

wire clk_25;

// Internal Registers

// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/


/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments
assign GPIO_0[ 0]	= 1'bZ;
assign GPIO_0[ 2]	= 1'bZ;
assign GPIO_0[16]	= 1'bZ;
assign GPIO_0[18]	= 1'bZ;
assign GPIO_1[ 0]	= 1'bZ;
assign GPIO_1[ 2]	= 1'bZ;
assign GPIO_1[16]	= 1'bZ;
assign GPIO_1[18]	= 1'bZ;

assign ENET_CLK = clk_25;

MIPS UUT
	(
		.clk(CLOCK_50),
		.rst(SW[0]),
		.Sel(SW[1]),
		.Instruction(HEX0[5:0])
	);

endmodule
