module demux(
    input [15:0] data_in,
    input sel, en,
    output reg [15:0] data_out0,
    output reg [15:0] data_out1
);
always @(*)begin
  if(en)begin
    if(sel == 0) 
      data_out0 = data_in;
    else 
      data_out1 = data_in;
  
  end

end

endmodule
