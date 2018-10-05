module botaoEstados( clk, db_out, saida );

	input clk, db_out;
	output reg saida;
	reg state = 0;
	
	always @( posedge clk )
	begin
		if( state == 0 )
		begin
			saida = db_out;
			if( db_out == 0 )
				state = 1;
		end
		else
		begin
			saida = 1;
			if( db_out == 1 )
				state = 0;
		end
	end

endmodule
