module DataMemory(input logic [31:0] Adress,
									input logic [31:0] WriteData,
									input logic MemWrite,
									input logic MemRead,
									output logic [31:0] ReadData);	

parameter MAX = 4294967295;		// 2^32 -1
									
logic [31:0] DataMem [MAX:0];
logic [MAX:0] en_arr;


//Demux	
always_comb 
  for (int i = 0; i < MAX; i++) 
		en_arr[i] = (Adress == i) ? MemWrite : 1'b0;

//Registers
for (genvar i = 1; i < MAX; i=i+1) 
    always @(posedge clk or negedge resetb) 
		if (~resetb)
			RegMem[i] <= 32'd0;
		else 
			if(en_arr[i] == 1'b1) DataMem[i] = WriteData;

//Mux
always_comb // if MemRead
for (int j =0 ; j<MAX ; j=j+1)
	if ( (Adress == j ) & MemRead ) ReadData = DataMem[Adress];
									
																	
endmodule
