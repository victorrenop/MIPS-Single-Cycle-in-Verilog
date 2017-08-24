module Extender_26_to_32 (ExtenderIn, ExtenderOut);

	input [25:0] ExtenderIn;
	output reg [31:0] ExtenderOut;
	
	always @ (*)
		begin
			if (ExtenderIn[25])
				ExtenderOut = {6'b111111, ExtenderIn};
			else
				ExtenderOut = {6'b0, ExtenderIn};
		end

endmodule	
	
	