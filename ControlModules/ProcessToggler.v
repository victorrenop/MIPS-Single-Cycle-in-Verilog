module ProcessToggler( clock, context, region );

	input clock, context;
	output reg region;
	
	initial begin
		region <= 0;
	end
	
	always @( posedge clock )
	begin
		if( context )
			region <= !region;
	end

endmodule 