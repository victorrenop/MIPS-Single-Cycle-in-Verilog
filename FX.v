module FX ( botaoclk,autoclock, switches, rst,							// Inputs
			  out, hlt, oflow_add, oflow_sub,		
			  hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7, count,
			  LCD_ON, LCD_BLON, LCD_RW, LCD_EN, LCD_RS, LCD_DATA, BT_UART_RX, BT_UART_TX, uart_out, uart_data/*, adOut, dout, clk, region, interrupt, io, tb, processPC, data1, data2, data3, mCtx, mMem, rdData, instructionRegion*/); 	// LCD	

	// Sinais de entrada e clock

	wire clk;									// clock de saida do temporizador
	wire  botaosaida;							// botao apos o debouncer
	wire botao_true;							// botao que sai do modulo para sincronizacao com clock
	input wire [16:0] switches;					// alvancas para entrada da placa
	input autoclock, botaoclk;					// clock automatico e botao da placa
	input rst;									// reset que entra no PC
	output LCD_ON, LCD_BLON, LCD_RW, LCD_EN, LCD_RS; // Dados LCD
	inout [7:0] LCD_DATA; 					// Dados a serem mostrados
	
	// Sinais de saida
	output wire out;							// Sinaliza instrucao de saida
	output wire hlt;							// Sinaliza halt do processador		
	output wire oflow_add, oflow_sub;			// sinais de overflow
	wire changeSource;
	output wire [0:6] hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7;

	// Dados dos modulos

	wire [31:0] Instruction; 					// sai da InstructionMemory
	wire [31:0] BIOSInst;
	wire [31:0] io;
	wire [31:0] adIn; 							// sai do PC e entra na InstructionMemory
	wire [31:0] adOut;							// endereco de saida
	wire [4:0] mInstr;						// saida do mux entre instructionMemory e RegBank
	wire signed [31:0] data2; 			// sai do RegBank
	wire signed [31:0] data1;
	wire signed [31:0] data3;
	wire [31:0] mAlu; 							// sai do mux entre ALU e Reg Bank
	wire zero; 									// sai da ALU
	wire signed [31:0] ALUres;					// resultado da ALU
	wire signed[31:0] rdData;					// Dai do DataMemory
	wire [31:0] ex16, ex26; 					// sai dos extenders de 16 e 26 bits
	wire [15:0] ex8;
	wire [31:0] mMem; 							// mux da dataMemory
	wire signed [31:0] mCtx;
	wire [31:0] mPC; 							// mux que entra o branch e o PC
	wire [31:0] mJump; 							// mux que entra o mPC e o jumpadress
	wire [31:0] mJr; 							// mux que entra o mJump e o endereco de reg;
	wire [31:0] mBuffer;
	wire [15:0] mMim;							// saida do mux de imediato
	wire [4:0] ALUop;							// opcode da ALU fornecido pela UC
	wire [31:0] dout;								// saida do output module
	wire [31:0] pId;
	wire [31:0] writeHD;
	wire [31:0] readHD;
	wire [31:0] addInst;
	wire [31:0] addBIOS;
	wire [31:0] writepId;
	wire [31:0] rpId;
	wire [31:0] rwritepId;
	wire [31:0] cAdd;
	wire [31:0] processPC;
	wire [31:0] TransfBuffer;
	wire [7:0] UART_data;

	// Sinais de Controle

	wire mw; 									// controle do data memory
	wire rw; 									// controle do regbank
	wire Rdst; 									// controle do MuxInstruction
	wire [1:0] ASrc; 									// controle do MuxAlu
	wire [1:0] mtg; 									// controle do MuxMem
	wire [1:0] BSrc;
	wire PSrc;		 							// controle do MuxPC
	wire Jmp; 									// controle do MuxJump
	wire Jr; 									// controle do MuxJr
	wire [1:0] MO;										// controle do MuxImmediate
	wire Jal;									// controle do MuxJump para jump and link
	wire hdFlag;
	wire writeInstr;
	wire [1:0] setProcess;
	wire setWriteProcess;
	wire menuWrite;
	wire [2:0] context;
	wire region;
	wire changePC;
	wire savePC;
	wire changeContext;
	wire interrupt;
	wire [2:0] signalOut;
	wire bw;
	wire tw;
	wire tr;
	wire tb;
	wire rwc;
	wire [1:0] MWC;
	
	//UART control
	wire uart_flag;
	output wire [7:0] uart_data;
	output wire uart_out;
	wire uart_write;
	input BT_UART_RX;
	output BT_UART_TX;
//   wire rdempty;
	output wire [3:0] count;
	wire uart_write_shot;
	
	/*********************/
		
	ProgramCounter PC 				(.clock(clk), 
									.reset(rst),
									.halt(hlt),
									.adressIn(data1),
									.adressOut(adOut),
									.PCSrc(PSrc),
									.zero(zero),
									.Jmp(Jmp),
									.Jr(Jr),
									.Jal(Jal),
									.mJr(mJr),
									.changeSource(changeSource),
									.ReadpId(pId),
									.changePC(changePC),
									.add(region),
									.processPC(processPC),
									.itrr(interrupt));
									
	Timer T								(.clock(clk),
												.reset(rst),
												.timerReset(tr),
												.interval(mMem), 
												.timerWrite(tw),
												.timerBlock(tb),
												.ReadpId(region),
												.halt(hlt),
												.interrupt(interrupt));
									
	InterruptionController IC		(.timerInt(interrupt), 
												.context(io[10:6]), 
												.changeContext(changeContext), 
												.signalOut(signalOut), 
												.region(region),
												.instructionRegion(instructionRegion),
												.readpId(pId),
												.clock(clk));
						
	InstructionMemory IM 			(.address(adOut),
									.InstructionOut(Instruction),
									.clock(clk),
									.autoclock(autoclock),
									.rst(rst),
									.writeInstr(writeInstr), 
									.instrIn(readHD), 
									.pId(pId),
									.WritepId(writepId),
									.HDAddress(cAdd),
									.region(region));
									
	instructionWriter IW				(.clock(clk),
									.writeInstr(writeInstr),
									.instrIn(io),
									.cAdd(cAdd));
									
	BIOS					B				(.address(adOut),
									.instOut(BIOSInst),
									.clock(clk),
									.autoclock(autoclock),
									.rst(rst));
									
	HardDisk				HD			(.clock(clk),
									.autoClock(autoclock),
									.track(data2),
									.trackPos(data1),
									.writeData(TransfBuffer),
									.readData(readHD),
									.hdFlag(hdFlag),
									.rst(rst));
									
	MuxInstSelector	MIS			(.source(changeSource),
								.memInst(Instruction),
								.BIOSInst(BIOSInst),
								.instOut(io),
								.rst(rst),
								.clock(clk));
							
	BufferBank		BB			(.WriteData(mMem),
									 .clock(clk), 
									 .readpId(pId), 
									 .writepId(writepId),
									 .rpId(rpId), 
									 .rwritepId(rwritepId), 
									 .setProcess(setProcess),
									 .TransfBuffer(TransfBuffer), 
									 .bufferData(mBuffer), 
									 .bw(bw));
								
	RegisterBank RB 				(.Reg1(io[25:21]),
									.Reg2(io[20:16]),
									.WriteRegister(mInstr),
									.WriteData(mMem),
									.RegWrite(rw),
									.ReadData1(data1),
									.ReadData2(data2),
									.ReadData3(data3),
									.clock(clk),
									.PC(adOut),
									.Jal(Jal),
									.rwc(rwc),
									.pId(rpId),
									.writepId(rwritepId),
									.autoclock(autoclock));
						  
	ALU OP 							(.OPcode(ALUop),
									 .op1(data1),
									 .op2(mAlu),
									 .result(ALUres),
									 .shamt(io[10:6]),
									 .zero(zero),
									 .overflow_add(oflow_add),
									 .overflow_sub(oflow_sub),
									 .clock(clk));
			  
	DataMemory DM					(.clock(clk),
									 .WriteData(mCtx),
									 .MemWrite(mw),
									 .DataMemoryOut(rdData),
									 .adress(ALUres),
									 .autoclock(autoclock),
									 .WritepId(writepId),
									 .ReadpId(pId));
					
	MuxInstruction MI				(.Reg1(io[20:16]),
									 .Reg2(io[15:11]),
									 .RegOut(mInstr),
									 .RegDst(Rdst));
									 
	MuxContext MCX					(.Reg2(data2),
									 .Reg3(data3),
									 .MWC(MWC),
									 .MuxOut(mCtx));
									 
	MuxAlu MA						(.Imediate(ex16),
									 .Reg(data2),
									 .processPC(processPC),
									 .MuxOut(mAlu),
									 .ALUSrc(ASrc));
									 
	MuxMem MM						(.ReadData(rdData),
									 .ALUresult(ALUres),
									 .Interruption(signalOut),
									 .TransfBuffer(TransfBuffer),
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
									 
	MuxIm MIM						(.Imediate(io[15:0]),
									 .Switches(switches),
									 .UART_data(ex8),
									 .MuxOut(mMim),
									 .MO(MO));
									 
	MuxBuffer MBF					(.Reg(data2), 
									 .HDData(readHD), 
									 .BSrc(BSrc),
									 .MuxOut(mBuffer));
									 
	Output_Module OM				(.clock(clk),
									 .auto(autoclock),
									 .adress(ALUres),
									 .writedata(mCtx),
									 .dataout(dout),
									 .out(out),
									 .MemWrite(mw),
									 .datain(dout),
									 .WritepId(writepId),
									 .ReadpId(pId));
									 
	OutputController	OC			(.CLOCK_50(autoclock),
									 .clock(clk),
									 .KEY(1'b0),
									 .PC(adOut),
									 .PID(pId),
									 .DOUT(dout),
									 .SW(switches),
									 .MENU(data1),
									 .menuWrite(menuWrite),
									 .HEX0(hex0),
									 .HEX1(hex1),
									 .HEX2(hex2),
									 .HEX3(hex3),
									 .HEX4(hex4),
									 .HEX5(hex5),
									 .HEX6(hex6),
									 .HEX7(hex7),
									 .LCD_ON(LCD_ON),
									 .LCD_BLON(LCD_BLON),
									 .LCD_RW(LCD_RW),
									 .LCD_EN(LCD_EN),
									 .LCD_RS(LCD_RS),
									 .LCD_DATA(LCD_DATA));
									 
	Extender_8_to_16 EXT3		(.ExIn(uart_data),
										.ExOut(ex8));
									 
	Extender_16_to_32 EXT1			(.ExIn(mMim),
									 .Neg(switches[16]),
									 .ExOut(ex16));
									 
	Extender_26_to_32 EXT2			(.ExtenderIn(io[25:0]),
									 .ExtenderOut(ex26));
									 
	ControladorHumano CH			(.OPcode(io[31:26]),
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
									 .flag(botao_true), //
									 .uart_flag(uart_flag),
									 .uart_write(uart_write),
									 .out(out),
									 .MO(MO),
									 .Jal(Jal),
									 .hdFlag(hdFlag),
									 .writeInstruction(writeInstr),
									 .setProcess(setProcess),
									 .menuWrite(menuWrite),
									 .changeSource(changeSource),
									 .changePC(changePC),
									 .changeContext(changeContext),
									 .bw(bw),
									 .BSrc(BSrc),
									 .tw(tw),
									 .tr(tr),
									 .tb(tb),
									 .rwc(rwc),
									 .MWC(MWC));
									 
	slave UART						(
										.uart_in(rdData),
										.uart_write(uart_write),
										.uart_out(uart_data),
										.CLOCK_50(autoclock),
										.clk(clk),
										.saida(uart_out),
										.BT_UART_RX(BT_UART_RX),
										.BT_UART_TX(BT_UART_TX),
										.count(count)
										);
	
	botaoEstados  	BE2		(.clk(clk),
									 .db_out(uart_out),
									 .saida(uart_flag));
//									 
  DeBounce_v DBCE					(.clk(autoclock),
									 .n_reset(1'b1),
									 .button_in(botaoclk),
									 .DB_out(botaosaida));
									 
	Temporizador TMP 				(.clk_auto(autoclock),
									 .clk(clk));
									 
									 
	botaoEstados	BE1				(.clk(clk),
									 .db_out(botaosaida),
									 .saida(botao_true));								 
									 
									 
	
endmodule	
