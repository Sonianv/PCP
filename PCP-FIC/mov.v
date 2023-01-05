module movR(
    input [15:0] data_acc,
    //sa avem enable de la SEU activat
    input [15:0] data_imm,
    input sel_xy, sel_imm, en,
    output reg [15:0] data_out0, //x
    output reg [15:0] data_out1  //Y
);
always @(*)begin
  if(en)begin
    case ({sel_xy,sel_imm})
      2'b00: data_out0 = data_acc;
      2'b01: data_out0 = data_imm;
      2'b10: data_out1 = data_acc;
      2'b11: data_out1 = data_imm;
      
    endcase

  end
end
endmodule
