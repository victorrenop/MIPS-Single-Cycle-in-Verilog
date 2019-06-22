module Extender_8_to_16(ExIn, ExOut);

	input [7:0] ExIn;
	output reg [15:0] ExOut;
	
	
	always @ (*)
			begin
				if (ExIn[7])
				begin
					ExOut <= {8'b11111111, ExIn};
				end
				else
					ExOut <= {8'b0, ExIn};
			end

endmodule	
