module ram_single(q, a, d, we, clk);

   logic output[7:0] q;
   logic input [7:0] d;
   logic input [6:0] a;
   logic input we, clk;
   logic [7:0] mem [127:0];
   
    always @(posedge clk) begin
        if (we)
            mem[a] <= d;
        q <= mem[a];
   end
   
endmodule