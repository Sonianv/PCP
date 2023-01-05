module rgst (
    input clk, rst, en,
    input [15:0] d,
    output reg [15:0] q 
);

always @(posedge clk) begin
	if(rst != 0)
		q <= 0;
	else if(en)
		q <= d;
end

endmodule