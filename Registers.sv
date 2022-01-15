module Registers(input logic [4:0] ReadRegister1,
							input logic [4:0] ReadRegister2,
							input logic [4:0] WriteRegister,
							input logic   [31:0] WriteData,
							input logic RegWrite,
							output logic [31:0] ReadData1,
							output logic [31:0] ReadData2,
							input logic clk,
							input logic resetb,
							input logic wr_en);
	
logic [31:0] RegMem [31:0];
	

assign RegMem[0] = 32'd0;

//Demux
logic [31:0] en_arr;
Decoder Demux (.signal(RegWrite), .selector(WriteRegister), .out(en_arr[30:0]));

//Registers
for (genvar i = 1; i < 32; i=i+1) 
    always @(posedge clk or negedge resetb) 
		if (~resetb)
			RegMem[i] <= 32'd0;
		else 
			if(en_arr[i] == 1'b1) RegMem[i] = WriteData;

//Mux1
always_comb
for (int j =0 ; j<32 ; j=j+1)
	if (ReadRegister1 == j )  ReadData1 = RegMem[j];

//Mux2
always_comb
for (int k =32 ; k>0 ; k=k-1)
	if (ReadRegister2 == k )  ReadData2 = RegMem[k];		

			
			
			
endmodule
