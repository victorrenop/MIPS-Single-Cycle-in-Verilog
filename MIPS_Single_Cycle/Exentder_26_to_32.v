module Extender_26_to_32 (ExtenderIn, ExtenderOut);

	input [25:0] ExtenderIn;
	output [31:0] ExtenderOut;
	
	assign ExtenderOut = {26'b0, ExtenderIn};

endmodule	
	
	