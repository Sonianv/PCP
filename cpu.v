`timescale 1ns / 1ps
module cpu (
    input clk, 
    output bra,
    output reg reset, PC_en, CU_en,
    output reg [1:0]st,
    output reg [1:0] st_next,
    input [9: 0] BADR,
    output hlt,
    output [9:0]PC,
    output [15:0] IR,
    output [3:0] flags,
    output [4:0]alu_op,
    output immediate, RD, WR, alu_en, psh, pop, mov_en
);

localparam RESET = 2'd0;
localparam FETCH = 2'd1;
localparam DECODE = 2'd2;
localparam EXECUTE = 2'd3;

wire [9 : 0] out_hlt;
wire [9 : 0] next_PC;

// initializam modulele

mux2_1 #(10) HLT_MUX  (.sel(hlt), .data_in0(BADR), .data_in1(PC), .data_out(out_hlt));
mux2_1 #(10) BRA_MUX  (.sel(bra), .data_in0(PC + 10'b1), .data_in1(out_hlt), .data_out(next_PC));
rgst #(10) PC_INC ( .clk(clk), .rst(reset), .en(PC_en), .d(next_PC), .q(PC));
instrMem #(16) INSTR_MEM (.clk(clk), .rst(reset), .PC(PC), .data(IR));
Control_Unit CU (.opcode(IR[15:10]), .clk(clk), .rst(rst), .flags(flags), .alu_op(alu_op), .immediate(immediate),
                 .bra(bra), .RD(RD), .WR(WR), .alu_en(alu_en), .psh(psh), .pop(pop),
                 .hlt(hlt), .mov_en(mov_en), .CU_en(CU_en));




always @(posedge clk) begin
    st = st_next;
end

always @(posedge clk) begin
    st_next = RESET;
    case (st) 
	RESET: begin
	       reset = 1;
	       PC_en = 0;
               CU_en = 1;
	       st_next = FETCH;
	       end
	FETCH: begin
	       reset = 0;
	       PC_en = 0;
               CU_en = 0;
	       st_next = DECODE;
	       end
	DECODE: begin
		reset = 0;
		PC_en = 0;
		CU_en = 1;
		if(bra == 1'b1)
		    st_next = FETCH;
		else
		    st_next = EXECUTE;
		end
	EXECUTE: begin
		 reset = 0;
		 PC_en = 1;
                 CU_en = 0;
		 st_next = FETCH;
		 end
    endcase
end


endmodule
