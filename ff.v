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

module ff(
    input clk, rst, en,
    output reg control_unit_en
);

always @(posedge clk) begin
    if (en) begin
        control_unit_en = 0;
    end
    else begin
	control_unit_en = 1;
    end
end
endmodule
