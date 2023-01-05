module processor_tb (
  output reg clk, rst,
  output reg [9: 0] BADR,
  output reg hlt, bra,
  output [9 : 0] PC
);

processor DUT( .clk(clk),
               .rst(rst),
               .PC(PC),
               .BADR(BADR),
               .hlt(hlt), 
               .bra(bra)
);

initial begin
  clk = 1'b0;
  rst = 1'b0;
  forever #25 clk = ~clk;
  
end

initial begin
  BADR = 10'd15;
  hlt = 1'b0;
  bra = 1'b1;
  #110 rst = 1'b1;
  #25 rst = 1'b0;
  #30
  bra = 1'b0;
  #100
  hlt = 1'b1;
  bra = 1'b1;
  #150
  hlt = 1'b0;
end


endmodule
