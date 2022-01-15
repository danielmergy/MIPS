module Decoder_tb();


	logic [5:0] selector;
    
    logic [31:0] out;
	
    Decoder Decoder_UT (.enable(1'b1), .selector(selector), .out(out));
    
    initial 
    begin
	selector = 6'b001100;
    #0;
    $display("value of out is %d" , out);
    end
endmodule
