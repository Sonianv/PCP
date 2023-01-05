module instrMem #(parameter N=16)(
	input clk, rst,
	input [9:0] PC,
	output reg [N-1:0] data
);
	reg [N-1:0] memory [0:(2**10)-1];
	
  initial begin
	      $readmemh("C:\Users\ioana\Desktop\PCP-FIC\instructions.mem", memory);

	end


   always @(posedge clk) begin
		if(rst) begin
			data <= memory[0];
		end else
			data <= memory[PC];
	end
		
		
endmodule
