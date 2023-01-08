`timescale 1ns / 1ps
module cpu_tb (
    output reg clk, 
    output bra,
    output reset, PC_en, CU_en,
    output [1:0]st,
    output [1:0] st_next,
    output [9: 0] BADR,
    output hlt,
    output [9:0]PC,
    output [15:0] IR,
    output [3:0] flags,
    output [4:0]alu_op,
    output immediate, RD, WR, alu_en, psh, pop, mov_en,
    output [15:0] X, Y, ACC,
    output [15:0]seu_res,
    output [15 : 0] alu_in1,
    output [15 : 0] reg2,
    output [15 : 0] alu_in2,
    output [15: 0] out_mem,
    output [15:0] demux_in
);

cpu DUT (.clk(clk), .bra(bra), .reset(reset), .PC_en(PC_en), .CU_en(CU_en), 
         .st(st), .st_next(st_next), .BADR(BADR), .hlt(hlt), .PC(PC),
	 .IR(IR), .flags(flags), .alu_op(alu_op), .immediate(immediate),
	 .RD(RD), .WR(WR), .alu_en(alu_en), .psh(psh), .pop(pop), .mov_en(mov_en), .X(X), .Y(Y), .ACC(ACC), .seu_res(seu_res),
	 .alu_in1(alu_in1), .reg2(reg2), .alu_in2(alu_in2), .out_mem(out_mem), .demux_in(demux_in));

initial begin
    clk = 1'b1;
    forever #25 clk = ~clk;
end


endmodule