`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Team: 
// Member: 
// 
// Create Date:    13:38 10/12/2022 
// Module Name:    Control_Unit 
// Project Name:   Pocket_Calculator_Processor
//
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module ALU(
 input  [15:0] A, // reg 
 input  [15:0] B, // reg sau immediate
 input  enable,
 input  [4:0]opcode, 
 
 output reg [15:0] Result,  
 output reg [ 3:0] flags
    );
    
reg [16:0] aux = 17'd0;
reg [15:0] R; 
reg cmp_enable = 0;

`include "alu_ops.v"

`define Z	3
`define N	2
`define C	1
`define O	0

always @(*)
begin 
 if(enable)
 begin
   aux = 17'd0;
   flags = 4'd0;
  
   case(opcode)
   `ALU_ADD: begin 
              aux = A + B;
             end
   `ALU_SUB: begin 
              aux = A - B;
             end      
   `ALU_LSR: begin 
              aux = A;
              aux = aux >> B;
             end
   `ALU_LSL: begin
             aux = A;
             aux = aux << B;
             end 
          
   `ALU_RSR: begin
             aux = A;
             R = B;
             while(R>0)
              begin 
                aux[16] = A[0];
                aux = aux >> 1;
                R = R - 1;
              end
             end
   `ALU_RSL: begin
             aux = A;
             R = B;
             while(R>0)
              begin 
                aux = aux << 1;
                aux[0] = aux[16];
                R = R - 1;
              end
             end
   `ALU_MUL: begin 
              aux = A * B;
             end
   `ALU_DIV: begin 
              aux = A / B;
             end
   `ALU_MOD: begin 
              aux = A % B;
             end
   `ALU_AND: begin 
              aux = A & B;
             end
   `ALU_OR: begin 
              aux = A | B;
             end 
   `ALU_XOR: begin 
              aux = A ^ B;
             end
   `ALU_CMP: begin         //flag [ zero, neg, carry, overflow ]
              cmp_enable = 1'b1;
              aux = A - B; // A > B flag[2] = 0; A < B flag[2] = 1; A = B flag[3] = 1.
             end
   `ALU_TST: begin 
              // N/A
             end
   `ALU_NOT: begin 
              aux = ~A;
             end
   `ALU_INC: begin 
              aux = A + 1;
             end
   `ALU_DEC: begin 
              aux = A - 1;
             end
   `ALU_NOP: begin 
              // no operation needed
             end                                                                                     
   endcase
   if(cmp_enable == 0) Result = aux[15:0];
   if(aux[16]==1) flags[`C] = 1;   // carry
   if(aux[15:0] == 16'd0) flags[`Z] = 1;     // zero
   if(aux[15]==1) flags[`N] = 1;      // negative
   if(!A[15] && !B[15] && flags[`N]) flags[`O] = 1; //overflow daca rezultatul >= 32.768 (2^15) pt 2 nr pozitive
   if(A[15] && B[15] && !flags[`N]) flags[`O] = 1; //overflow daca rezultatul
 end
end
endmodule
