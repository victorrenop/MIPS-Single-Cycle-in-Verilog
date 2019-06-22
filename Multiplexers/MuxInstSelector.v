
module MuxInstSelector( source, memInst, BIOSInst, instOut, rst, clock );

	input source, rst, clock;
	input[31:0] memInst, BIOSInst;
	output reg [31:0] instOut;
	reg state;
	
	initial
	begin : INIT
		state = 1'b0;
	end 
	
	
	always @( negedge clock )
	begin
		if( !state )
			begin
				instOut = BIOSInst;
				if( source )
					state = 1'b1;
			end
		else if( state )
			begin
				instOut = memInst;
				if( rst )
					state = 1'b0;
			end
	end
	
	//assign instOut = state ? memInst : BIOSInst;

endmodule 
