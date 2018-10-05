module MuxJr (MJ, Reg, JumpReg, MuxOut);

	input [31:0] MJ, Reg;
	input JumpReg;
	output reg [31:0] MuxOut;
	
	always@(*)
		begin
			if (JumpReg )
				MuxOut = Reg;
			else
				MuxOut = MJ;
		end
		
endmodule
