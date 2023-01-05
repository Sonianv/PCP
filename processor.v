`timescale 1ns / 1ps

module processor (
  input clk, rst,
  input [9: 0] BADR,
  output hlt, bra,
  output [9 : 0] PC,
  output PC_increment,
  output [15:0] IR,
  output [3:0] flags,
  output [4:0]alu_op,
  output immediate, RD, WR, alu_en, psh, pop, mov_en
);
  
wire [9 : 0] out_hlt;
wire [9 : 0] next_PC;

mux2_1 #(10) HLT_MUX  (.sel(hlt), .data_in0(BADR), .data_in1(PC), .data_out(out_hlt));
mux2_1 #(10) BRA_MUX  (.sel(bra), .data_in0(PC + 10'b1), .data_in1(out_hlt), .data_out(next_PC));
rgst #(10) PC_INC ( .clk(clk), .rst(rst), .en(PC_increment), .d(next_PC), .q(PC));
instrMem #(16) INSTR_MEM (.clk(clk), .rst(rst), .PC(PC), .data(IR));
Control_Unit CU (.opcode(IR[15:10]), .clk(clk), .rst(rst), .flags(flags), .alu_op(alu_op), .immediate(immediate),
                 .bra(bra), .RD(RD), .WR(WR), .alu_en(alu_en), .psh(psh), .pop(pop),
                 .hlt(hlt), .mov_en(mov_en));








endmodule
