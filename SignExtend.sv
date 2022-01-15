module SignExtend(input logic [15:0] sig16b,
							 output logic [31:0] sig32b);
							 

logic MST = sig16b	[15];

assign sig32b ={
												MST, MST, MST, MST,
												MST, MST, MST, MST,
												MST, MST, MST, MST,
												MST, MST, MST, MST,
												sig16b[14],
												sig16b[13],
												sig16b[12],
												sig16b[11],
												sig16b[10],
												sig16b[9],
												sig16b[8],
												sig16b[7],
												sig16b[6],
												sig16b[5],
												sig16b[4],
												sig16b[3],
												sig16b[2],
												sig16b[1],
												sig16b[0]
												};						 
	 
endmodule
