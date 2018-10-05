module sourceState( changeSource, sourceOut )

	input changeSource;
	output reg sourceOut;
	reg state = 0;
	
	always @(*)
	begin
		if( state == 0 )
		begin
			sourceOut <= 0;
			if( changeSource )
				state <= 1;
		end
		else if( state == 1 )
		begin
			sourceOut <= 1;
			if( !changeSource )
				state <= 0;
		end
	end

endmodule 