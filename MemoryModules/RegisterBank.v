	module RegisterBank #(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=32, TRACKS=2)
(Reg1, Reg2, WriteRegister, WriteData, RegWrite, ReadData1, ReadData2, ReadData3, clock, PC, Jal, rwc, pId, writepId, autoclock); 

	input [4:0] Reg1, Reg2, WriteRegister;
	input [(DATA_WIDTH-1):0] PC, pId, writepId;
	input signed [(DATA_WIDTH-1):0] WriteData;
	input RegWrite, clock, Jal, autoclock, rwc;
	output reg signed [(DATA_WIDTH-1):0] ReadData1, ReadData2, ReadData3;
	
	reg [(DATA_WIDTH-1):0]Registers[(TRACKS*ADDR_WIDTH-1):0];
	
	always @(posedge clock)
		begin
			if (RegWrite)
			begin
				//Registers[WriteProcessId][0] <= 0;
				if (Jal)
					Registers [writepId*ADDR_WIDTH + 31] <= PC + 1;
				else if( rwc )
					Registers [ADDR_WIDTH + WriteRegister] <= WriteData;
				else 
					Registers [writepId*ADDR_WIDTH + WriteRegister] <= WriteData; // Escreve se sinal de controle RegWrite == 1
				Registers[0] <= 0;
				Registers[ADDR_WIDTH] <= 0;
			end
		end
		
		always@( posedge autoclock )
		begin
			ReadData1 <= Registers[pId*ADDR_WIDTH + Reg1];
			ReadData2 <= Registers[pId*ADDR_WIDTH + Reg2];
			ReadData3 <= Registers[ADDR_WIDTH + Reg2];
		end
		
endmodule 





