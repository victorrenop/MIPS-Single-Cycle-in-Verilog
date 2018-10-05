module MuxAlu (Imediate, Reg, MuxOut, ALUSrc);

	input [31:0] Imediate, Reg;
	output reg [31:0] MuxOut;
	input ALUSrc;
	
	always @ (*)
		begin
			if (ALUSrc)
				MuxOut = Imediate;
			else
				MuxOut = Reg;
		end
	
endmodule 