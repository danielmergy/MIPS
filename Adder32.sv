module Adder32(input logic [31:0] a,
						  input logic [31:0] b,
						  output logic [31:0] out);
						
assign out = a + b;

endmodule

