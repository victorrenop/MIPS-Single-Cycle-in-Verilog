module MuxContext (Reg2, Reg3, MWC, MuxOut);

	input signed [31:0] Reg2, Reg3;
	input [1:0] MWC;
	output reg signed [31:0] MuxOut;
	
	always @ (*)
		begin
			if( MWC == 2'b10 )
				MuxOut <= Reg2;
			else if ( MWC == 2'b01 )
				MuxOut = Reg3;
			else
				MuxOut <= 0;
		end
		
endmodule 