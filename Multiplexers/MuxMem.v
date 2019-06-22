module MuxMem (ReadData, ALUresult, MemToReg, MuxOut, Interruption, TransfBuffer);

	input [31:0] ReadData, ALUresult, TransfBuffer;
	input [2:0] MemToReg, Interruption;
	output reg [31:0] MuxOut;
	
	always @ (*)
		begin
			if( MemToReg == 2'b11 )
				MuxOut <= TransfBuffer;
			else if( MemToReg == 2'b10 )
				MuxOut <= Interruption;
			else if ( MemToReg == 2'b01 )
				MuxOut <= ReadData;
			else if( MemToReg == 2'b00 )
				MuxOut <= ALUresult;
			else
				MuxOut <= 0;
		end
		
endmodule 