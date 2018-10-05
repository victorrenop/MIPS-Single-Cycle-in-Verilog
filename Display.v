module Display (decimal_input, display_output, out);

	input [3:0] decimal_input;
	input out;
	output reg [6:0] display_output;
	
	always @(decimal_input)
		begin
			case (decimal_input[3:0])
				'd0: display_output = 7'b0000001;
				'd1: display_output = 7'b1001111;
				'd2: display_output = 7'b0010010;
				'd3: display_output = 7'b0000110;
				'd4: display_output = 7'b1001100;
				'd5: display_output = 7'b0100100;
				'd6: display_output = 7'b0100000;
				'd7: display_output = 7'b0001111;
				'd8: display_output = 7'b0000000;
				'd9: display_output = 7'b0000100;
				default: display_output = 7'b1111111;
			endcase
		end
		
endmodule 