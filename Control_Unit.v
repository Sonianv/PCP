`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:52 09/12/2022 
// Design Name: 
// Module Name:    Control_Unit 
// Project Name:   Pocket_Calculator_Processor
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module Control_Unit(
	input[5:0] opcode,
	input clk, rst,
	input [3:0] flags,
	output reg immediate, alu_op, bra, RD, WR
    );

`include "opcodes.v"

`define Z	3
`define N	2
`define C	1
`define O	0

always @(*) begin

  case(opcode)
	`BRA: bra = 1;
	`BRZ: flags[`Z];
	`BRN: flags[`N];
	`BRC: flags[`C];
	`BRO: flags[`O];
	`JMP: bra = 1;
	`RET: bra = 1;

end

endmodule
















