module MuxJr (MJ, Reg, JumpReg, Jal, MuxOut);

	input [31:0] MJ, Reg;
	input JumpReg, Jal;
	output reg [31:0] MuxOut;
	
	always@(*)
		begin
			if (JumpReg || Jal)
				MuxOut = Reg;
			else
				MuxOut = MJ;
		end
		
endmodule
