module MuxPCDir( address, addInst, addBIOS, source, rst );

	input[31:0] address;
	input source, rst;
	output reg[31:0] addInst, addBIOS;
	reg state = 0;
	
	always @(*)
	begin
		if( !state )
		begin
			addBIOS <= address;
			addInst <= 0;
			if( source )
				state <= 1;
		end
		else if( state )
		begin
			addBIOS <= 0;
			addInst <= address;
			if( rst )
				state <= 0;
		end
	end
	

endmodule 