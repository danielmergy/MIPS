module InstructionMemory(input logic [31:0] ReadAdress,
										output logic [31:0] Instruction);
										

logic [31:0] mem_reg [255:0];

assign Instruction = mem_reg[ReadAdress];


// Rtype : 6b opcode + 5b rs + 5b rt + 5b rd + 5b shamt + 6b funct
// Result in rd !!!
// Exemple  add, $4,$3, $2

assign  mem_reg[0]  = 32'b_000000_00011_00010_00100_00000_100000;

//  Itype : 6b opcode + 5b rs + 5b rt + 16b imm
// Exemple  lw, $5, 8($6)

assign  mem_reg[1]  = 32'b_100011_00110_00101_00000_00000_001000;

// Jtype : 6b opcode + 26b word offset (in bytes)
// Exemple  j, 15

assign  mem_reg[2]  = 32'b_000010_00000_00000_00000_00000_001111;




endmodule