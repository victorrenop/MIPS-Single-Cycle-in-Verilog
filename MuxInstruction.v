module MuxInstruction (Reg1, Reg2, RegOut, RegDst);

	input [31:0] Reg1, Reg2;
	input RegDst;
	output reg [31:0] RegOut;
	
	always @ (*)
		begin
			if (RegDst)
				RegOut = Reg2;
			else
				RegOut = Reg1;
		end
	
endmodule 