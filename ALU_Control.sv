module ALU_Control (input logic ALUOp1,
								 input logic ALUOp0,
								 input logic [5:0] Instructions5_0,
								 output logic [2:0] Operation);
					 
assign Operation[2] = ALUOp0 & (ALUOp1 & Instructions5_0[1]);
assign Operation[1] = ~ALUOp1 | ~Instructions5_0[2];
assign Operation[0] = ALUOp1 & (Instructions5_0[3] | Instructions5_0[0]);

endmodule