

module FIFO (input logic wr ,
					input logic [7:0] din ,
					input logic clka ,
					input logic clkb ,
					input logic rd,
					input logic resetb,
					output logic [7:0] dout,
					output logic full,
					output logic empty);
					


parameter M = log(N+1)

logic [N] memory [7:0]
logic [M-1:0] wr_ptr;
logic [M-1:0] rd_ptr;


always_ff @(posedge clka or resetb) //wr_ptr
	if (~resetb)
		wr_ptr <= (M-1)'d0;
	
	else if (wr & ~full)
			if (wr_ptr == N-1)
				wr_ptr <= (M-1)'b000

			else
				wr_ptr <= wr_ptr + (M-1)'b1

always_ff @(posedge clkb or resetb) //rd_ptr
	if (~resetb)
		rd_ptr <= (M-1)'b1111...
	
	else if (rd & ~empty)
			if (rd_ptr == N-1)
				rd_ptr <= (M-1)'b000

			else
				rd_ptr <= rd_ptr + (M-1)'b1
		
	

assign full = (wr_ptr = rd_ptr)
assign empty = (wr_ptr + N = rd_ptr)


assign dout = memory[rd_ptr]
assign memory[wr_ptr] = din


endmodule


		
	
  

	
			
			