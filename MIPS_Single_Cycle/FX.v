module FX ( botaoclk,clockruim,
			  switches,out,
			  um,
			  cem,
			  rst,
			  mil, neg,
			  trilhao, 
			  quadrilhao,  
			  ,hlt,
			  oflow_add,
			  oflow_sub, neg2);

	// Sinais de entrada e clock

	wire clk;									// clock de saida do temporizador
	wire  botaosaida;							// botao apos o debouncer
	wire botao_true;							// botao que sai do modulo para sincronizacao com clock
	input wire [15:0] switches;					// alvancas para entrada da placa
	input clockruim, botaoclk;					// clock automatico e botao da placa
	input rst;									// reset que entra no PC
	
	// Sinais de saida

	output [6:0] um, cem, mil; 					// Saidas para os displays de 7 segmentos
	output [6:0] trilhao, quadrilhao;			// Saidas para os displays de 7 segmentos
	output neg, neg2;							// Sinaliza numeros negativos
	output wire out;							// Sinaliza instrucao de saida
	output wire hlt;							// Sinaliza halt do processador		
	output wire oflow_add, oflow_sub;			// sinais de overflow

	// Dados dos modulos

	wire [31:0] Instruction; 					// sai da InstructionMemory
	wire [9:0] adIn; 							// sai do PC e entra na InstructionMemory
	wire [9:0] adOut;							// endereco de saida
	wire [4:0] mInstr; 							// saida do mux entre instructionMemory e RegBank
	wire signed [31:0] data1, data2; 			// sai do RegBank
	wire [31:0] mAlu; 							// sai do mux entre ALU e Reg Bank
	wire zero; 									// sai da ALU
	wire signed [31:0] ALUres;					// resultado da ALU
	wire signed[31:0] rdData;					// Dai do DataMemory
	wire [31:0] ex16, ex26; 					// sai dos extenders de 16 e 26 bits
	wire [31:0] mMem; 							// mux da dataMemory
	wire [31:0] mPC; 							// mux que entra o branch e o PC
	wire [31:0] mJump; 							// mux que entra o mPC e o jumpadress
	wire [31:0] mJr; 							// mux que entra o mJump e o endereco de reg;
	wire [15:0] mMim;							// saida do mux de imediato
	wire [4:0] ALUop;							// opcode da ALU fornecido pela UC
	wire [31:0] do;								// saida do output module

	// Sinais de Controle

	wire mw; 									// controle do data memory
	wire rw; 									// controle do regbank
	wire Rdst; 									// controle do MuxInstruction
	wire ASrc; 									// controle do MuxAlu
	wire mtg; 									// controle do MuxMem
	wire PSrc;		 							// controle do MuxPC
	wire Jmp; 									// controle do MuxJump
	wire Jr; 									// controle do MuxJr
	wire MO;									// controle do MuxImmediate
	wire Jal;									// controle do MuxJump para jump and link
		
	ProgramCounter PC 				(.clock(clk), 
									.reset(rst),
									.halt(hlt),
									.adressIn(adIn),
									.adressOut(adOut),
									.PCSrc(PSrc),
									.zero(zero),
									.Jmp(Jmp),
									.Jr(Jr),
									.Jal(Jal),
									.mJr(mJr));
						
	InstructionMemory IM 			(.adress(adOut),
									.InstructionOut(Instruction),
									.clock(clk),
									.autoclock(clockruim),
									.rst(rst));
								
	RegisterBank RB 				(.Reg1(Instruction[25:21]),
									.Reg2(Instruction[20:16]),
									.WriteRegister(mInstr),
									.WriteData(mMem),
									.RegWrite(rw),
									.ReadData1(data1),
									.ReadData2(data2),
									.clock(clk),
									.PC(adOut),
									.Jal(Jal));
						  
	ALU OP 							(.OPcode(ALUop),
									 .op1(data1),
									 .op2(mAlu),
									 .result(ALUres),
									 .shamt(Instruction[10:6]),
									 .zero(zero),
									 .overflow_add(oflow_add),
									 .overflow_sub(oflow_sub),
									 .clock(clk));
			  
	DataMemory DM					(.clock(clk),
									 .WriteData(data2),
									 .MemWrite(mw),
									 .DataMemoryOut(rdData),
									 .adress(ALUres),
									 .autoclock(clockruim));
					
	MuxInstruction MI				(.Reg1(Instruction[20:16]),
									 .Reg2(Instruction[15:11]),
									 .RegOut(mInstr),
									 .RegDst(Rdst));
									 
	MuxAlu MA						(.Imediate(ex16),
									 .Reg(data2),
									 .MuxOut(mAlu),
									 .ALUSrc(ASrc));
									 
	MuxMem MM						(.ReadData(rdData),
									 .ALUresult(ALUres),
									 .MemToReg(mtg),
									 .MuxOut(mMem));
									 
	MuxPC MPC						(.PCInc(adOut),
									 .JumpBranch(ex16),
									 .PCSrc(PSrc),
									 .Zero(zero),
									 .MuxOut(mPC));
									 
	MuxJump MJMP					(.MPC(mPC),
									 .JumpAdress(ex26),
									 .Jmp(Jmp),
									 .Jal(Jal),
									 .MuxOut(mJump));
									 
	MuxJr MJR						(.MJ(mJump),
									 .Reg(data1),
									 .JumpReg(Jr),
									 .MuxOut(mJr));
									 
	MuxIm MIM						(.Imediate(Instruction[15:0]),
									 .Switches(switches),
									 .MuxOut(mMim),
									 .MO(MO));
									 
	Output_Module OM				(.clock(clk),
									 .auto(clockruim),
									 .adress(ALUres),
									 .writedata(data2),
									 .dataout(do),
									 .out(out),
									 .MemWrite(mw),
									 .datain(do));
									 
	Displays_Final DF				(.binary(do),
									 .um(um),
									 .cem(cem),
									 .mil(mil),
									 .milhao(milhao1),
									 .bilhao(bilhao1),
									 .trilhao(trilhao1),
									 .quadrilhao(quadrilhao1),
									 .neg(neg),
									 .out(out));
									 
	Displays_Final DF2				(.binary(adOut),
									 .um(trilhao),
									 .cem(quadrilhao),
									 .mil(mil1),
									 .milhao(milhao1),
									 .bilhao(bilhao1),
									 .trilhao(trilhao1),
									 .quadrilhao(quadrilhao1),
									 .neg(neg2),
									 .out(out));
									 
	Extender_16_to_32 EXT1			(.ExIn(mMim),
									 .ExOut(ex16));
									 
	Extender_26_to_32 EXT2			(.ExtenderIn(Instruction[25:0]),
									 .ExtenderOut(ex26));
									 
	ControladorHumano CH			(.OPcode(Instruction[31:26]),
									 .RW(rw),
									 .MW(mw),
									 .RDst(Rdst),
									 .ASrc(ASrc),
									 .MTG(mtg),
									 .PSrc(PSrc),
									 .Jmp(Jmp),
									 .Jr(Jr),
									 .ALUop(ALUop),
									 .halt(hlt),
									 .flag(botao_true),
									 .in(switches),
									 .out(out),
									 .MO(MO),
									 .Jal(Jal));
									 
	DeBounce_v DBCE					(.clk(clockruim),
									 .n_reset(1'b1),
									 .button_in(botaoclk),
									 .DB_out(botaosaida)); 
									 
	Temporizador TMP 				(.clk_auto(clockruim),
									 .clk(clk));
									 
	botaoEstados					(.clk(clk),
									 .db_out(botaosaida),
									 .saida(botao_true));
									 
	
endmodule	
