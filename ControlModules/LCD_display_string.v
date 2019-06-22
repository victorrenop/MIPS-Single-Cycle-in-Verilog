module LCD_display_string(index,out,hex0,hex1,hex2,hex3,hex4,hex5,hexIn0,hexIn1,hexIn2,hexIn3,hexIn4,hexIn5,neg, negIn, menu);

input neg, negIn;
input [4:0] index, menu;
input [3:0] hex0,hex1,hex2,hex3,hex4, hex5;
input [3:0] hexIn0,hexIn1,hexIn2,hexIn3,hexIn4,hexIn5;
output [7:0] out;
reg [7:0] out;
// ASCII hex values for LCD Display
// Enter Live Hex Data Values from hardware here
// LCD DISPLAYS THE FOLLOWING:
//----------------------------
//| Count=XX                  |
//| DE2                       |
//----------------------------
// Line 1
   always
	case (menu)
	5'b00000:
	begin
		case(index)
			5'h00: out <= 8'h42;
			5'h01: out <= 8'h49;
			5'h02: out <= 8'h4F;
			5'h03: out <= 8'h53;
			5'h04: out <= 8'h20;
			5'h05: out <= 8'h49;
			5'h06: out <= 8'h6E;
			5'h07: out <= 8'h20;
			5'h08: out <= 8'h3A;
			5'h09: begin 
			if( negIn )
				out <= 8'h2D;
			else
				out <= 8'h20;
			end
			5'h0A: out <= {4'h0, hexIn5};
			5'h0B: out <= {4'h0, hexIn4};
			5'h0C: out <= {4'h0, hexIn3};
			5'h0D: out <= {4'h0, hexIn2};
			5'h0E: out <= {4'h0, hexIn1};
			5'h0F: out <= {4'h0, hexIn0};
			5'h10: out <= 8'h20;
			5'h11: out <= 8'h20;
			5'h12: out <= 8'h20;
			5'h13: out <= 8'h20;
			5'h14: out <= 8'h20;
			5'h15: out <= 8'h4F;
			5'h16: out <= 8'h75;
			5'h17: out <= 8'h74;
			5'h18: out <= 8'h3A;
			5'h19: begin 
			if( neg )
				out <= 8'h2D;
			else
				out <= 8'h20;
			end
			5'h1A: out <= {4'h0, hex5};
			5'h1B: out <= {4'h0, hex4};
			5'h1C: out <= {4'h0, hex3};
			5'h1D: out <= {4'h0, hex2};
			5'h1E: out <= {4'h0, hex1};
			5'h1F: out <= {4'h0, hex0};
			default: out <= 8'h20;
		endcase
	end
	5'b00001:
	begin
		case (index)
			5'h00: out <= 8'h57;
			5'h01: out <= 8'h52;
			5'h02: out <= 8'h3A;
			5'h03: out <= 8'h31;
			5'h04: begin
			if( hexIn0 == 4'b0001 )
				out <= 8'h3C;
			else 
				out <= 8'h20;
			end
			5'h05: out <= 8'h52;
			5'h06: out <= 8'h4E;
			5'h07: out <= 8'h3A;
			5'h08: out <= 8'h32;
			5'h09: begin
			if( hexIn0 == 4'b0010 )
				out <= 8'h3C;
			else 
				out <= 8'h20;
			end
			5'h0A: out <= 8'h44;
			5'h0B: out <= 8'h4C;
			5'h0C: out <= 8'h3A;
			5'h0D: out <= 8'h33;
			5'h0E: begin
			if( hexIn0 == 4'b0011 )
				out <= 8'h3C;
			else 
				out <= 8'h20;
			end
			5'h0F: out <= 8'h20;
			5'h10: out <= 8'h42;
			5'h11: out <= 8'h41;
			5'h12: out <= 8'h54;
			5'h13: out <= 8'h43;
			5'h14: out <= 8'h48;
			5'h15: out <= 8'h4A;
			5'h16: out <= 8'h4F;
			5'h17: out <= 8'h42;
			5'h18: out <= 8'h3A;
			5'h19: out <= 8'h34;
			5'h1A:  begin
			if( hexIn0 == 4'b0100 )
				out <= 8'h3C;
			else 
				out <= 8'h20;
			end
			5'h1B: out <= 8'h20;
			5'h1C: out <= 8'h20;
			5'h1D: out <= 8'h20;
			5'h1E: out <= 8'h20;
			5'h1F: out <= 8'h20;
			default: out <= 8'h20;
		endcase
	end
	5'b00010: // Write A
	begin
		case (index)
			5'h00: out <= 8'h46;
			5'h01: out <= 8'h69;
			5'h02: out <= 8'h6C;
			5'h03: out <= 8'h65;
			5'h04: out <= 8'h20;
			5'h05: out <= 8'h49;
			5'h06: out <= 8'h64;
			5'h07: out <= 8'h3A;
			5'h08: out <= 8'h20;
			5'h09: out <= 8'h20;
			5'h0A: out <= 8'h20;
			5'h0B: out <= 8'h20;
			5'h0C: out <= 8'h20;
			5'h0D: out <= 8'h20;
			5'h0E: out <= 8'h20;
			5'h0F: out <= 8'h20;
			5'h10: out <= {4'h0, hexIn2};
			5'h11: out <= {4'h0, hexIn1};
			5'h12: out <= {4'h0, hexIn0};
			5'h13: out <= 8'h20;
			5'h14: out <= 8'h20;
			5'h15: out <= 8'h20;
			5'h16: out <= 8'h20;
			5'h17: out <= 8'h20;
			5'h18: out <= 8'h20;
			5'h19: out <= 8'h20;
			5'h1A: out <= 8'h20;
			5'h1B: out <= 8'h20;
			5'h1C: out <= 8'h20;
			5'h1D: out <= 8'h20;
			5'h1E: out <= 8'h20;
			5'h1F: out <= 8'h20;
			default: out <= 8'h20;
		endcase
	end
	5'b00011: // Write B
	begin
		case (index)
			5'h00: out <= 8'h57;
			5'h01: out <= 8'h72;
			5'h02: out <= 8'h69;
			5'h03: out <= 8'h74;
			5'h04: out <= 8'h69;
			5'h05: out <= 8'h6E;
			5'h06: out <= 8'h67;
			5'h07: out <= 8'h20;
			5'h08: out <= 8'h46;
			5'h09: out <= 8'h69;
			5'h0A: out <= 8'h6C;
			5'h0B: out <= 8'h65;
			5'h0C: out <= 8'h2E;
			5'h0D: out <= 8'h2E;
			5'h0E: out <= 8'h2E;
			5'h0F: out <= 8'h20;
			5'h10: out <= 8'h20;
			5'h11: out <= 8'h20;
			5'h12: out <= 8'h20;
			5'h13: out <= 8'h20;
			5'h14: out <= 8'h20;
			5'h15: out <= 8'h20;
			5'h16: out <= 8'h20;
			5'h17: out <= 8'h20;
			5'h18: out <= 8'h20;
			5'h19: out <= 8'h20;
			5'h1A: out <= 8'h20;
			5'h1B: out <= 8'h20;
			5'h1C: out <= 8'h20;
			5'h1D: out <= 8'h20;
			5'h1E: out <= 8'h20;
			5'h1F: out <= 8'h20;
			default: out <= 8'h20;
		endcase
	end
	5'b00100: // Write C
	begin
		case (index)
			5'h00: out <= 8'h43;
			5'h01: out <= 8'h6F;
			5'h02: out <= 8'h6E;
			5'h03: out <= 8'h74;
			5'h04: out <= 8'h69;
			5'h05: out <= 8'h6E;
			5'h06: out <= 8'h75;
			5'h07: out <= 8'h65;
			5'h08: out <= 8'h3F;
			5'h09: out <= 8'h20;
			5'h0A: out <= 8'h20;
			5'h0B: out <= 8'h20;
			5'h0C: out <= 8'h20;
			5'h0D: out <= 8'h20;
			5'h0E: out <= 8'h20;
			5'h0F: out <= 8'h20;
			5'h10: out <= 8'h31;
			5'h11: out <= 8'h2F;
			5'h12: out <= 8'h79;
			5'h13: out <= 8'h20;
			5'h14: out <= 8'h2D;
			5'h15: out <= 8'h31;
			5'h16: out <= 8'h2F;
			5'h17: out <= 8'h6E;
			5'h18: out <= 8'h20;
			5'h19: out <= 8'h20;
			5'h1A: out <= 8'h20;
			5'h1B: out <= 8'h20;
			5'h1C: out <= 8'h20;
			5'h1D: out <= 8'h20;
			5'h1E: out <= 8'h20;
			5'h1F: out <= 8'h20;

			default: out <= 8'h20;
		endcase
	end
	5'b00101: // Rename
	begin
		case (index)
			5'h00: out <= 8'h46;
			5'h01: out <= 8'h69;
			5'h02: out <= 8'h6C;
			5'h03: out <= 8'h65;
			5'h04: out <= 8'h20;
			5'h05: out <= 8'h74;
			5'h06: out <= 8'h6F;
			5'h07: out <= 8'h20;
			5'h08: out <= 8'h52;
			5'h09: out <= 8'h65;
			5'h0A: out <= 8'h6E;
			5'h0B: out <= 8'h61;
			5'h0C: out <= 8'h6D;
			5'h0D: out <= 8'h65;
			5'h0E: out <= 8'h20;
			5'h0F: out <= 8'h20;
			5'h10: out <= 8'h49;
			5'h11: out <= 8'h64;
			5'h12: out <= 8'h3A;
			5'h13: out <= 8'h20;
			5'h14: out <= {4'h0, hexIn2};
			5'h15: out <= {4'h0, hexIn1};
			5'h16: out <= {4'h0, hexIn0};
			5'h17: out <= 8'h20;
			5'h18: out <= 8'h20;
			5'h19: out <= 8'h20;
			5'h1A: out <= 8'h20;
			5'h1B: out <= 8'h20;
			5'h1C: out <= 8'h20;
			5'h1D: out <= 8'h20;
			5'h1E: out <= 8'h20;
			5'h1F: out <= 8'h20;

			default: out <= 8'h20;
		endcase
	end
	5'b00110: // Delete File
	begin
		case (index)
			5'h00: out <= 8'h46;
			5'h01: out <= 8'h69;
			5'h02: out <= 8'h6C;
			5'h03: out <= 8'h65;
			5'h04: out <= 8'h20;
			5'h05: out <= 8'h74;
			5'h06: out <= 8'h6F;
			5'h07: out <= 8'h20;
			5'h08: out <= 8'h44;
			5'h09: out <= 8'h65;
			5'h0A: out <= 8'h6C;
			5'h0B: out <= 8'h65;
			5'h0C: out <= 8'h74;
			5'h0D: out <= 8'h65;
			5'h0E: out <= 8'h20;
			5'h0F: out <= 8'h20;
			5'h10: out <= 8'h49;
			5'h11: out <= 8'h64;
			5'h12: out <= 8'h3A;
			5'h13: out <= 8'h20;
			5'h14: out <= {4'h0, hexIn2};
			5'h15: out <= {4'h0, hexIn1};
			5'h16: out <= {4'h0, hexIn0};
			5'h17: out <= 8'h20;
			5'h18: out <= 8'h20;
			5'h19: out <= 8'h20;
			5'h1A: out <= 8'h20;
			5'h1B: out <= 8'h20;
			5'h1C: out <= 8'h20;
			5'h1D: out <= 8'h20;
			5'h1E: out <= 8'h20;
			5'h1F: out <= 8'h20;
			default: out <= 8'h20;
		endcase
	end
	
	5'b00111: // Batch Job
	begin
		case (index)
			5'h00: out <= 8'h42;
			5'h01: out <= 8'h61;
			5'h02: out <= 8'h74;
			5'h03: out <= 8'h63;
			5'h04: out <= 8'h68;
			5'h05: out <= 8'h20;
			5'h06: out <= 8'h4A;
			5'h07: out <= 8'h6F;
			5'h08: out <= 8'h62;
			5'h09: out <= 8'h20;
			5'h0A: out <= 8'h20;
			5'h0B: out <= 8'h20;
			5'h0C: out <= 8'h20;
			5'h0D: out <= 8'h20;
			5'h0E: out <= 8'h20;
			5'h0F: out <= 8'h20;
			5'h10: out <= 8'h23;
			5'h11: out <= 8'h20;
			5'h12: out <= 8'h74;
			5'h13: out <= 8'h6F;
			5'h14: out <= 8'h20;
			5'h15: out <= 8'h45;
			5'h16: out <= 8'h78;
			5'h17: out <= 8'h65;
			5'h18: out <= 8'h63;
			5'h19: out <= 8'h3A;
			5'h1A: out <= 8'h20;
			5'h1B: out <= {4'h0, hexIn1};
			5'h1C: out <= {4'h0, hexIn0};
			5'h1D: out <= 8'h20;
			5'h1E: out <= 8'h20;
			5'h1F: out <= 8'h20;
			default: out <= 8'h20;
		 endcase
	end
	5'b01000:
	begin
		case (index)
			5'h00: out <= 8'h49;
			5'h01: out <= 8'h6E;
			5'h02: out <= 8'h3A;
			5'h03: out <= {4'h0, hexIn4};
			5'h04: out <= {4'h0, hexIn3};
			5'h05: out <= {4'h0, hexIn2};
			5'h06: out <= {4'h0, hexIn1};
			5'h07: out <= {4'h0, hexIn0};
			5'h08: out <= 8'h20;
			5'h09: out <= 8'h20;
			5'h0A: out <= 8'h20;
			5'h0B: out <= 8'h20;
			5'h0C: out <= 8'h20;
			5'h0D: out <= 8'h20;
			5'h0E: out <= 8'h20;
			5'h0F: out <= 8'h20;
			5'h10: out <= 8'h4F;
			5'h11: out <= 8'h75;
			5'h12: out <= 8'h74;
			5'h13: out <= 8'h3A;
			5'h14: out <= {4'h0, hex4};
			5'h15: out <= {4'h0, hex3};
			5'h16: out <= {4'h0, hex2};
			5'h17: out <= {4'h0, hex1};
			5'h18: out <= {4'h0, hex0};
			5'h19: out <= 8'h20;
			5'h1A: out <= 8'h20;
			5'h1B: out <= 8'h20;
			5'h1C: out <= 8'h20;
			5'h1D: out <= 8'h20;
			5'h1E: out <= 8'h20;
			5'h1F: out <= 8'h20;
			default: out <= 8'h20;
		 endcase
	end
	5'b01001: // Process Select
	begin
		case (index)
			5'h00: out <= 8'h50;
			5'h01: out <= 8'h72;
			5'h02: out <= 8'h6F;
			5'h03: out <= 8'h63;
			5'h04: out <= 8'h65;
			5'h05: out <= 8'h73;
			5'h06: out <= 8'h73;
			5'h07: out <= 8'h20;
			5'h08: out <= 8'h23;
			5'h09: out <= {4'h0, hex1};
			5'h0A: out <= {4'h0, hex0};
			5'h0B: out <= 8'h20;
			5'h0C: out <= 8'h20;
			5'h0D: out <= 8'h20;
			5'h0E: out <= 8'h20;
			5'h0F: out <= 8'h20;
			5'h10: out <= 8'h49;
			5'h11: out <= 8'h64;
			5'h12: out <= 8'h3A;
			5'h13: out <= 8'h20;
			5'h14: out <= {4'h0, hexIn3};
			5'h15: out <= {4'h0, hexIn2};
			5'h16: out <= {4'h0, hexIn1};
			5'h17: out <= {4'h0, hexIn0};
			5'h18: out <= 8'h20;
			5'h19: out <= 8'h20;
			5'h1A: out <= 8'h20;
			5'h1B: out <= 8'h20;
			5'h1C: out <= 8'h20;
			5'h1D: out <= 8'h20;
			5'h1E: out <= 8'h20;
			5'h1F: out <= 8'h20;
			default: out <= 8'h20;
		 endcase
	end
	5'b01010: // Int Process
	begin
		case (index)
			5'h00: out <= 8'h49;
			5'h01: out <= 8'h6E;
			5'h02: out <= 8'h74;
			5'h03: out <= 8'h2E;
			5'h04: out <= 8'h20;
			5'h05: out <= 8'h50;
			5'h06: out <= 8'h72;
			5'h07: out <= 8'h6F;
			5'h08: out <= 8'h63;
			5'h09: out <= 8'h65;
			5'h0A: out <= 8'h73;
			5'h0B: out <= 8'h73;
			5'h0C: out <= 8'h20;
			5'h0D: out <= 8'h20;
			5'h0E: out <= 8'h20;
			5'h0F: out <= 8'h20;
			5'h10: out <= 8'h23;
			5'h11: out <= {4'h0, hex1};
			5'h12: out <= {4'h0, hex0};
			5'h13: out <= 8'h20;
			5'h14: out <= 8'h20;
			5'h15: out <= 8'h20;
			5'h16: out <= 8'h20;
			5'h17: out <= 8'h20;
			5'h18: out <= 8'h20;
			5'h19: out <= 8'h20;
			5'h1A: out <= 8'h20;
			5'h1B: out <= 8'h20;
			5'h1C: out <= 8'h20;
			5'h1D: out <= 8'h20;
			5'h1E: out <= 8'h20;
			5'h1F: out <= 8'h20;
			default: out <= 8'h20;
		 endcase
	end
	5'b01011: // Next Process
	begin
		case (index)
			5'h00: out <= 8'h4E;
			5'h01: out <= 8'h65;
			5'h02: out <= 8'h78;
			5'h03: out <= 8'h74;
			5'h04: out <= 8'h20;
			5'h05: out <= 8'h50;
			5'h06: out <= 8'h72;
			5'h07: out <= 8'h6F;
			5'h08: out <= 8'h63;
			5'h09: out <= 8'h65;
			5'h0A: out <= 8'h73;
			5'h0B: out <= 8'h73;
			5'h0C: out <= 8'h20;
			5'h0D: out <= 8'h20;
			5'h0E: out <= 8'h20;
			5'h0F: out <= 8'h20;
			5'h10: out <= 8'h23;
			5'h11: out <= {4'h0, hex1};
			5'h12: out <= {4'h0, hex0};
			5'h13: out <= 8'h20;
			5'h14: out <= 8'h20;
			5'h15: out <= 8'h20;
			5'h16: out <= 8'h20;
			5'h17: out <= 8'h20;
			5'h18: out <= 8'h20;
			5'h19: out <= 8'h20;
			5'h1A: out <= 8'h20;
			5'h1B: out <= 8'h20;
			5'h1C: out <= 8'h20;
			5'h1D: out <= 8'h20;
			5'h1E: out <= 8'h20;
			5'h1F: out <= 8'h20;
			default: out <= 8'h20;
		 endcase
	end
	5'b01100: // Confirm Write
	begin
		case (index)
			5'h00: out <= 8'h43;
			5'h01: out <= 8'h6F;
			5'h02: out <= 8'h6E;
			5'h03: out <= 8'h66;
			5'h04: out <= 8'h69;
			5'h05: out <= 8'h72;
			5'h06: out <= 8'h6D;
			5'h07: out <= 8'h20;
			5'h08: out <= 8'h57;
			5'h09: out <= 8'h72;
			5'h0A: out <= 8'h69;
			5'h0B: out <= 8'h74;
			5'h0C: out <= 8'h65;
			5'h0D: out <= 8'h3F;
			5'h0E: out <= 8'h20;
			5'h0F: out <= 8'h20;
			5'h10: out <= 8'h31;
			5'h11: out <= 8'h2F;
			5'h12: out <= 8'h79;
			5'h13: out <= 8'h20;
			5'h14: out <= 8'h30;
			5'h15: out <= 8'h2F;
			5'h16: out <= 8'h6E;
			5'h17: out <= 8'h20;
			5'h18: out <= 8'h20;
			5'h19: out <= 8'h20;
			5'h1A: out <= 8'h20;
			5'h1B: out <= 8'h20;
			5'h1C: out <= 8'h20;
			5'h1D: out <= 8'h20;
			5'h1E: out <= 8'h20;
			5'h1F: out <= 8'h20;
			default: out <= 8'h20;
		 endcase
	end
	5'b01101: // File Not Found
	begin
		case(index)
			5'h00: out <= 8'h46;
			5'h01: out <= 8'h69;
			5'h02: out <= 8'h6C;
			5'h03: out <= 8'h65;
			5'h04: out <= 8'h20;
			5'h05: out <= 8'h49;
			5'h06: out <= 8'h64;
			5'h07: out <= 8'h3A;
			5'h08: out <= 8'h20;
			5'h09: out <= {4'h0, hex1};
			5'h0A: out <= {4'h0, hex0};
			5'h0B: out <= 8'h20;
			5'h0C: out <= 8'h20;
			5'h0D: out <= 8'h20;
			5'h0E: out <= 8'h20;
			5'h0F: out <= 8'h20;
			5'h10: out <= 8'h4E;
			5'h11: out <= 8'h6F;
			5'h12: out <= 8'h74;
			5'h13: out <= 8'h20;
			5'h14: out <= 8'h46;
			5'h15: out <= 8'h6F;
			5'h16: out <= 8'h75;
			5'h17: out <= 8'h6E;
			5'h18: out <= 8'h64;
			5'h19: out <= 8'h20;
			5'h1A: out <= 8'h20;
			5'h1B: out <= 8'h20;
			5'h1C: out <= 8'h20;
			5'h1D: out <= 8'h20;
			5'h1E: out <= 8'h20;
			5'h1F: out <= 8'h20;
			default: out <= 8'h20;
		endcase
	end

	5'b01110: // File Already Exists
        begin
                case (index)
			5'h00: out <= 8'h46;
			5'h01: out <= 8'h69;
			5'h02: out <= 8'h6C;
			5'h03: out <= 8'h65;	
			5'h04: out <= 8'h20;
			5'h05: out <= 8'h49;
			5'h06: out <= 8'h64;
			5'h07: out <= 8'h3A;
			5'h08: out <= 8'h20;
			5'h09: out <= {4'h0, hex1};
			5'h0A: out <= {4'h0, hex0};
			5'h0B: out <= 8'h20;
			5'h0C: out <= 8'h20;
			5'h0D: out <= 8'h20;
			5'h0E: out <= 8'h20;
			5'h0F: out <= 8'h20;
			5'h10: out <= 8'h41;
			5'h11: out <= 8'h6C;
			5'h12: out <= 8'h72;
			5'h13: out <= 8'h65;	
			5'h14: out <= 8'h61;
			5'h15: out <= 8'h64;
			5'h16: out <= 8'h79;
			5'h17: out <= 8'h20;
			5'h18: out <= 8'h45;
			5'h19: out <= 8'h78;
			5'h1A: out <= 8'h69;
			5'h1B: out <= 8'h73;
			5'h1C: out <= 8'h74;
			5'h1D: out <= 8'h73;
			5'h1E: out <= 8'h20;
			5'h1F: out <= 8'h20;
			default: out <= 8'h20;
      endcase
   end
	
	5'b01111: // Set Quantum
        begin
         case (index)
			5'h00: out <= 8'h51;
			5'h01: out <= 8'h75;
			5'h02: out <= 8'h61;
			5'h03: out <= 8'h6E;
			5'h04: out <= 8'h74;
			5'h05: out <= 8'h75;
			5'h06: out <= 8'h6D;
			5'h07: out <= 8'h20;
			5'h08: out <= 8'h53;
			5'h09: out <= 8'h69;
			5'h0A: out <= 8'h7A;
			5'h0B: out <= 8'h65;
			5'h0C: out <= 8'h3A;
			5'h0D: out <= 8'h20;
			5'h0E: out <= 8'h20;
			5'h0F: out <= 8'h20;
			5'h10: out <= {4'h0, hexIn3};
			5'h11: out <= {4'h0, hexIn2};
			5'h12: out <= {4'h0, hexIn1};
			5'h13: out <= {4'h0, hexIn0};
			5'h14: out <= 8'h20;
			5'h15: out <= 8'h20;
			5'h16: out <= 8'h20;
			5'h17: out <= 8'h20;
			5'h18: out <= 8'h20;
			5'h19: out <= 8'h20;
			5'h1A: out <= 8'h20;
			5'h1B: out <= 8'h20;
			5'h1C: out <= 8'h20;
			5'h1D: out <= 8'h20;
			5'h1E: out <= 8'h20;
			5'h1F: out <= 8'h20;
			default: out <= 8'h20;
      endcase
   end


		default:
		begin
			case( index )
			default: out <= 8'h20;
			endcase
		end
	endcase
endmodule 
