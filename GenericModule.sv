module GenericModule(input logic [5:0] sel,
									output logic [31:0] code);


parameter [5:0] PARAM_ARRAY [5: 0]   = {6'd1, 6'd2, 6'd3, 6'd4};	

/*							
always_comb
	begin
		if ( sel == 6'd0  )   code = {31'b0 , 1'b1};
		if ( sel == 6'd31 )  code = {1'b1   , 31'b0};
		
		for (int i=1 ; i<31; i=i+1)	
			begin
				if (sel == i) 			
					code = { {(PARAM_ARRAY[31-i]){1'b0}},  1'b1, { (PARAM_ARRAY[i]){1'b0} } };
			end
	end
*/



for(int i=0; i<=10 ; i=i+1) 
	begin
	logic en_i;
	
	
endmodule