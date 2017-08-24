module MuxIm (Imediate, Switches, MuxOut, MO);
	
	input [15:0] Imediate, Switches;
	input MO;
	output reg [15:0] MuxOut;
	
	always @ (*)
		begin
			if (MO)
				MuxOut = Switches;
			else
				MuxOut = Imediate;
		end
		
endmodule 