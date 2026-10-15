module ALU(input [3:0]a,b,
           input [1:0]s,
           output reg[3:0]y);
  always @(*) begin
  case(s)
    2'b00 : y = a + b;
    2'b01 : y = a - b;
    2'b10 : y = a & b;
    2'b11 : y = a | b;
    default : y = 1'b0;
  endcase
  end
endmodule
