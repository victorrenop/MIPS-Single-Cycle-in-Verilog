module ControladorHumano (OPcode, RW, MW, RDst, ASrc, MTG, PSrc, Jmp, Jr, ALUop, halt, flag, in, out, MO, Jal);

	input [5:0] OPcode;
	input [17:0] in;
	input flag;
	output reg RW, MW, RDst, ASrc, MTG, PSrc, Jmp, Jr, halt, out, MO, Jal;
	output reg [4:0] ALUop;
	
	always @(*)
		begin
			case (OPcode)
					6'b000000: // nop
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'bxxxxx;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end 
					6'b000010: // add
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b1;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b00000;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b000011: // addi
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b1;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b00000;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b000100: // sub
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b1;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b00001;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b000101: // subi
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b1;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b00001;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b000110: // mult
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b1;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b00010;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b000111: // div
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b1;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b00011;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b001000: // slt
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b1;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b01010;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b001001: // shr
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'bx;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b01001;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b001010: // shl
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'bx;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b01000;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b001011: // lw
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b1;
							MTG = 1'b1;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b00000;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b001100: // li
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b1;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b00000;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b001101: // sw
						begin
							RW = 1'b0;
							MW = 1'b1;
							RDst = 1'b0;
							ASrc = 1'b1;
							MTG = 1'bx;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b00000;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b001110: // jump
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b1;
							MTG = 1'bx;
							PSrc = 1'b0;
							Jmp = 1'b1;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'bxxxxx;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b001111: // jump register
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b1;
                            Jal = 1'b0;
							ALUop = 5'bxxxxx;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b010000: // xor
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b1;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b00111;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b010001: // and
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b1;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b00101;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b010010: // or
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b1;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b00110;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b010011: // not
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b00100;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b010100: // xori
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b1;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b00111;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b010101: // andi
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b1;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b00101;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b010110: // ori
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b1;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b00110;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b010111: // beq
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b1;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b01111;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b011000: // bneq
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b1;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b01100;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b011001: // beqz
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b1;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b01111;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b011010: // bneqz
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b1;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b01100;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b011011: // bgt
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b1;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b01010;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b011100: // blt
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b1;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b01011;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b011101: // bgtz
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b1;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b01010;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b011110: // bltz
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b1;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b01011;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
					6'b011111: // in
						begin
							RW = 1'b1;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b1;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b00000;
							out = 1'b0;
							MO = 1'b1;
							if (flag)
								halt = 1'b1;
							else
								halt = 1'b0;
						end
					6'b100000: //out
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b1;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                            Jal = 1'b0;
							ALUop = 5'b00000;
							out = 1'b1;
							MO = 1'b0;	
							if (flag)
								halt = 1'b1;
							else
								halt = 1'b0;
						end
                6'b100001: //jal
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b1;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
                     Jal = 1'b1;
							ALUop = 5'b00000;
							out = 1'b0;
							MO = 1'b0;						
						end
					default: 
						begin
							RW = 1'b0;
							MW = 1'b0;
							RDst = 1'b0;
							ASrc = 1'b0;
							MTG = 1'b0;
							PSrc = 1'b0;
							Jmp = 1'b0;
							Jr = 1'b0;
							ALUop = 5'b00000;
							out = 1'b0;
							MO = 1'b0;
							halt = 1'b0;
						end
				endcase
			end
endmodule			
