module RegisterBank (Reg1, Reg2, WriteRegister, WriteData, RegWrite, ReadData1, ReadData2, clock, PC, Jal); 

	input [4:0] Reg1, Reg2, WriteRegister;
    input [31:0] PC;
	input [31:0] WriteData;
	input RegWrite, clock, Jal;
	output [31:0] ReadData1, ReadData2;
	reg [31:0] Registers [31:0];
	
	always @(posedge clock)
		begin
			Registers[0] = 32'b0;
			if (RegWrite)
				Registers [WriteRegister] = WriteData; // Escreve se sinal de controle RegWrite == 1
            if (Jal)
                Registers [1] = PC + 1;
		end
		
		assign ReadData1 = Registers[Reg1]; // Salva o conteudo do Reg1 para a leitura
		assign ReadData2 = Registers[Reg2]; // Salva o conteudo do Reg2 para a leitura
		
		
endmodule 
