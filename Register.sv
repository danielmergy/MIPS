
module register (input logic [31:0] din,
						  input logic clk,
						  input logic resetb,
						  input logic en,
						  output logic [31:0] dout
						  );
						  
logic [31:0] Q;
						  
always_ff @(posedge clk or negedge resetb)
		if (~resetb)
			Q = 32'd0;
		else
			if(en) Q <= din;

assign dout = Q;
			
endmodule