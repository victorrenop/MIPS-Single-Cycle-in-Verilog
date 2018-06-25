module Extender_16_to_32 (ExIn, ExOut);

	input [15:0] ExIn;
	output reg [31:0] ExOut;
	
	
	always @ (*)
			begin
				if (ExIn[15])
					ExOut = {16'b1111111111111111, ExIn};
				else
					ExOut = {16'b0, ExIn};
			end

endmodule	
