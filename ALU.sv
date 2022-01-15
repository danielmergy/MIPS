module ALU (input logic [2:0] opcode,
					 input logic [31:0] A,
					 input logic [31:0] B,
					 output logic zero_flag,
					 output logic [31:0] res);

always_comb
	case(opcode)
		3'b000 : res = A & B;
		3'b001 : res = A | B;
		3'b010 : res = A + B;
		3'b110 : res = A - B;
		3'b111 : res = A < B;
	endcase
		
always_comb
	case (res)
		8'b00000000 : zero_flag = 1'b1;
		default : zero_flag = 1'b0;
	endcase
		
endmodule