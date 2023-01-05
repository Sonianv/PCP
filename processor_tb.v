`timescale 1ns / 1ps

module processor_tb (
  output reg clk, rst,
  output reg [9: 0] BADR,
  output hlt, bra,
  output [9 : 0] PC,
  output [15:0] IR,
  output [3:0] flags,
  output [4:0]alu_op,
  output PC_increment,
  output immediate, RD, WR, alu_en, psh, pop, mov_en
);

processor DUT( .clk(clk),
               .rst(rst),
               .PC(PC),
               .BADR(BADR),
               .hlt(hlt), 
               .bra(bra),
               .IR(IR),
               .flags(flags), 
               .alu_op(alu_op), 
	       .PC_increment(PC_increment),
               .immediate(immediate),
               .RD(RD), 
               .WR(WR), 
               .alu_en(alu_en), 
               .psh(psh), 
               .pop(pop),
               .mov_en(mov_en)
);

initial begin
  clk = 1'b0;
  rst = 1'b0;
  forever #25 clk = ~clk;
  
end

initial begin
  BADR = 10'd15;
  #60 rst = 1'b1;
  #25 rst = 1'b0;
end

endmodule