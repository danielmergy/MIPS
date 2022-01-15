module Controller ( input logic [5:0] Op,
							  output logic RegDst,
							  output logic Branch,
							  output logic MemRead,
							  output logic MemtoReg,
							  output logic ALUOp1,
							  output logic ALUOp0,
							  output logic MemWrite,
							  output logic ALUSrc,
							  output logic RegWrite);  
logic R_format;
logic lw;
logic sw;
logic beq;

assign R_form	 	= &{~Op[5], ~Op[4],  ~Op[3],  ~Op[2],  ~Op[1],  ~Op[0]};
assign lw 		 		= &{  Op[5],  ~Op[4],  ~Op[3],  ~Op[2],	Op[1],	Op[0]};
assign sw 	     	= &{  Op[5], ~Op[4],    Op[3],  ~Op[2],  	Op[1],  	Op[0]};
assign beq 	     	= &{~Op[5], ~Op[4],  ~Op[3],  Op[2],  ~Op[1],  	~Op[0]};

assign RegDst = R_form;
assign ALUSrc =(lw & sw);
assign MemtoReg = lw;
assign RegWrite = (R_form & lw);
assign MemRead = lw;
assign MemWrite = sw;
assign Branch = beq;
assign ALUOp1 = R_form;
assign ALUOp0 = beq;
							  
endmodule
