
module MuxPCDir( address, addInst, addBIOS, source, rst, clock );

	input[31:0] address;
	input source, rst, clock;
	output reg[31:0] addInst, addBIOS;
	reg state;
	
	initial
	begin : INIT
		state = 1'b0;
	end 
	
	always @( posedge clock )
	begin
		if( !state )
		begin
			addBIOS = address;
			addInst = 32'b0;
			if( source )
				state = 1'b1;
		end
		else if( state )
		begin
			addBIOS = 32'b0;
			addInst = address;
			if( rst )
				state = 1'b0;
		end
	end
	

endmodule 
