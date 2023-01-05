module dataMem #(parameter N=16) (
	input clk, WR, RD,
	input [8:0] address,
	input [N-1:0] data_in,
	output reg [N-1:0] data_out
);
	reg [N-1:0] memory [0:(2**9)-1];
	
	always @(posedge clk) begin
		if(WR)
			memory[address] = data_in;
    if(RD)
		  data_out = memory[address];
	end

endmodule
