module ram_dual(q, addr_in, addr_out, d, we, clk1, clk2);

	logic output[7:0] q;
	logic input [7:0] d;
	logic input [6:0] addr_in;
	logic input [6:0] addr_out;
	logic input we, clk1, clk2;
 
	logic [6:0] addr_out_reg;
	logic [7:0] q;
	logic [7:0] mem [127:0];
 
    always @(posedge clk1) begin
      if (we)
         mem[addr_in] <= d;
    end
 
    always @(posedge clk2) begin
      q <= mem[addr_out_reg];
      addr_out_reg <= addr_out;
    end
        
endmodule