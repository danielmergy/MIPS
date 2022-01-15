module MIPS(input logic clk , input logic resetb);

logic [31:0] shifted;
logic [31:0] adressp4;
logic [31:0] Instruction;
logic [31:0] Extended_Instruction;
logic [31:0] Adress_ALU_res;
logic [31:0] next_adress;
logic [31:0] ReadData1;
logic [31:0] ReadData2;
logic [31:0] Res_ALU;
logic [31:0] MemoryOut;

logic [2:0] Operation;

// 	Controls
logic RegDst;
logic Branch;
logic MemRead;
logic MemtoReg;
logic ALUOp1;
logic ALUOp0;
logic MemWrite;
logic ALUSrc;
logic RegWrite;  
logic PC;

// Emulates zero from ALU
logic zero;
logic Top_And = Branch & zero;

logic [5:0] WriteRegChoice;

assign WriteRegChoice = RegDst ? Instruction[15:11] : Instruction [20:16];

logic [31:0] ReadRegChoice;

assign ReadRegChoice = ALUSrc ? Extended_Instruction : ReadData2;


// Replace by LUT
logic [31:0] InstructionMemory [1024:0];
always_ff @(posedge clk) Instruction <= InstructionMemory[next_adress];



Adder32 ADR4 (.a(next_adress) , .b(32'd4), .out(adressp4));

Controller ControlUnit ( .Op(Instruction[31:26]), .RegDst(RegDst),
								.Branch(Branch), .MemRead(MemRead), .MemtoReg(MemtoReg),
								.ALUOp1(ALUOp1), .ALUOp0(ALUOp0), .MemWrite(MemWrite),
								.ALUSrc(ALUSrc), .RegWrite(RegWrite) );
					
SignExtend Extend (.sig16b(Instruction[15:0]), .sig32b(Extended_Instruction));

ShiftLeft2 SL2 (.in(Extended_Instruction), .out(shifted) );

Adder32 ADR32 (.a(shifted), .b(adressp4), .out(Adress_ALU_res));

assign next_adress = Top_And ? Adress_ALU_res : adressp4;

ALU_Control ALUCTRL (.ALUOp1(ALUOp1), .ALUOp0(ALUOp0), .Instructions5_0(Instruction[5:0]), .Operation(Operation) );

ALU MAIN_ALU  (.opcode(Operation), .A(ReadData1), .B(ReadRegChoice), .zero_flag(zero), .res(Res_ALU) );

DataMemory MEM (.Adress(Res_ALU), .WriteData(ReadData2), .ReadData(MemoryOut),
							.MemRead(MemRead), .MemWrite(MemWrite));

assign WriteData = MemtoReg ? MemoryOut : Res_ALU;

Registers RGTRS(.ReadRegister1(Instruction[25:21]),
							.ReadRegister2(Instruction[20:16]),
							.WriteRegister(WriteRegChoice),
							.WriteData(WriteData),
							.ReadData1(ReadData1),
							.RegWrite(RegWrite),
							.ReadData2(ReadData2) );

InstructionMemory IMEM (.ReadAdress(next_adress), .Instruction(Instruction));							
							
endmodule
