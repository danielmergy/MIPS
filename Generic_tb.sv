module Generic_tb();


logic [5:0]	 sel;
logic [31:0] code;					

GenericModule GenericModule_UT (.sel(sel), .code(code) );

initial 
	begin
	sel = 6'b000011;
	code = 32'd0;
	#0;
	end


									
endmodule


