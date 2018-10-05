module MuxInstSelector( source, memInst, BIOSInst, instOut, rst );

	input source, rst;
	input[31:0] memInst, BIOSInst;
	output reg[31:0] instOut;
	reg state = 0;
	
	
	always @(*)
	begin
		if( !state )
			begin
				instOut <= BIOSInst;
				if( source )
					state <= 1;
			end
		else if( state )
			begin
				instOut <= memInst;
				if( rst )
					state <= 0;
			end
	end

endmodule 