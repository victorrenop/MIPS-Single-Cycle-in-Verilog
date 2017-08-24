module Teste (clock, reset, halt, adressIn, adressOut, Interruption, Switches, Reg1, Reg2, WriteRegister, RegWrite, ReadData1, ReadData2);

	input clock, reset, halt, Interruption, RegWrite;
	input [31:0] adressIn;
	input [15:0] Switches;
	input [4:0] Reg1, Reg2, WriteRegister;
	output [31:0] adressOut, ReadData1, ReadData2;
	wire [15:0] DataOut;
	wire [31:0]  ext;
	
	ProgramCounter U1 (clock, reset, halt, adressIn[31:0], adressOut[31:0], Interruption);
	RegisterBank U2 (Reg1[4:0], Reg2[4:0], WriteRegister[4:0], ext[31:0], RegWrite, ReadData1[31:0], ReadData2[31:0], clock);
	Extender_16_to_32 U4 (DataOut[15:0], ext[31:0]);
	In_Module U3 (Switches[15:0], DataOut[15:0], In_Signal, clock);
	
	
endmodule 