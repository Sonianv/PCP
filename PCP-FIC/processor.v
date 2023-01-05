module processor (
  input clk, rst,
  input [9: 0] BADR,
  input hlt, bra,
  output reg [9 : 0] PC
);
  
wire [9 : 0] out_hlt;
wire [9 : 0] next_PC;

mux2_1 #(10) HLT_MUX  (.sel(hlt), .data_in0(BADR), .data_in1(PC), .data_out(out_hlt));
mux2_1 #(10) BRA_MUX  (.sel(bra), .data_in0(PC + 10'b1), .data_in1(out_hlt), .data_out(next_PC));

always @(posedge clk) begin
  if(rst != 0) begin
    PC <= 0;
  end
  else begin
    PC <= next_PC;
  end
end

endmodule

