module OutputController(
  input CLOCK_50,    	// 50 MHz clock
  input clock,				// Write Clock
  input menuWrite,		// Write Flag
  input [3:0] KEY,      // Pushbutton[3:0]
  input [31:0] PC,		// Program Counter
  input [31:0] PID,		// Process ID
  input [31:0] DOUT,		// Output Data
  input [15:0] SW,		// Switches Input
  input [4:0]  MENU,		// Menu Selector
  output [0:6] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7,  //Seven Segment Digits
  
/*		LCD Module 16X2	 */
  
  output LCD_ON,    		// LCD Power ON/OFF
  output LCD_BLON,    	// LCD Back Light ON/OFF
  output LCD_RW,    		// LCD Read/Write Select, 0 = Write, 1 = Read
  output LCD_EN,    		// LCD Enable
  output LCD_RS,    		// LCD Command/Data Select, 0 = Command, 1 = Data
  inout [7:0] LCD_DATA  // LCD Data bus 8 bits
);

reg [4:0] menuMem;

initial begin
	menuMem <= 0;
end

always @( posedge clock )
begin
	if( menuWrite )
		menuMem <= MENU;
end

Displays_Final DF1( .binary(PC),
							.neg(),
							.out(1'b0),
							.d0(HEX0),
							.d1(HEX1),
							.d2(HEX2),
							.d3(HEX3),
							.d4(),
							.d5(),
							.d6(),
							.d7());
							
Displays_Final DF2( .binary(PID),
							.neg(),
							.out(1'b0),
							.d0(HEX4),
							.d1(HEX5),
							.d2(),
							.d3(),
							.d4(),
							.d5(),
							.d6(),
							.d7());

assign HEX6 = 7'b111_1111;
assign HEX7 = 7'b111_1111;

/***	LCD DATA	  ***/

wire RST;
assign RST = KEY[0];

// reset delay gives some time for peripherals to initialize
wire DLY_RST;
Reset_Delay r0(    .iCLK(CLOCK_50),.oRESET(DLY_RST) );

// turn LCD ON
assign LCD_ON = 1'b1;
assign LCD_BLON = 1'b1;

wire [3:0] hex0, hex1, hex2, hex3, hex4, hex5;
wire [3:0] hexIn0, hexIn1, hexIn2, hexIn3, hexIn4, hexIn5;
wire neg, negIn;

Binary_to_BCD BTB1 ( .binary(DOUT[31:0]), 
							.neg(neg), 
							.first(hex0), 
							.second(hex1), 
							.third(hex2), 
							.fourth(hex3), 
							.fifth(hex4), 
							.sixth(hex5), 
							.seventh(), 
							.eighth());
							
Binary_to_BCD BTB2 ( .binary(SW[15:0]), 
							.neg(negIn), 
							.first(hexIn0), 
							.second(hexIn1), 
							.third(hexIn2), 
							.fourth(hexIn3), 
							.fifth(hexIn4), 
							.sixth(hexIn5), 
							.seventh(), 
							.eighth());


LCDControler LC(
// Host Side
   .iCLK_50MHZ(CLOCK_50),
   .iRST_N(DLY_RST),
	.neg(neg),
	.negIn(negIn),
   .hex0(hex0),
   .hex1(hex1),
	.hex2(hex2),
	.hex3(hex3),
	.hex4(hex4),
	.hex5(hex5),
	.hexIn0(hexIn0),
   .hexIn1(hexIn1),
	.hexIn2(hexIn2),
	.hexIn3(hexIn3),
	.hexIn4(hexIn4),
	.hexIn5(hexIn5),
	.menu(menuMem),
// LCD Side
   .DATA_BUS(LCD_DATA),
   .LCD_RW(LCD_RW),
   .LCD_E(LCD_EN),
   .LCD_RS(LCD_RS)
);

endmodule 