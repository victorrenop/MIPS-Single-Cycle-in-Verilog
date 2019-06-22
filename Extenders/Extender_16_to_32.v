module Extender_16_to_32 (ExIn, Neg, ExOut);

	input [15:0] ExIn;
	input Neg;
	output reg [31:0] ExOut;
	
	
	always @ (*)
			begin
				if (ExIn[15])
				begin
					if( Neg )
						ExOut <= {16'b1111111111111111, ExIn};
					else
						ExOut <= {16'b0, ExIn};
				end
				else
					ExOut <= {16'b0, ExIn};
			end

endmodule	
