module Decoder (input wire signal, input wire [4:0] selector, output wire [30:0] out);
	
logic [30:0] my_reg;
always_comb 
begin
  for (int i = 0; i < 31; i++) my_reg[i] = (selector == i) ? signal : 1'b0;
end

assign out = my_reg;
	
	
endmodule
