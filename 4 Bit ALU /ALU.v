module ALU(input [3:0]a,b,
           input [1:0]s,
           output reg carry,negative,zero,
           output reg [3:0]y);
  reg [4:0]sum;
  always @(*)begin
    negative = 0;
    y = 4'b0000;
    sum = {1'b0,a} + {1'b0,b};
    carry = 0;
    case(s)
      2'b00 : begin
        y = sum[3:0];
        carry = sum[4];
      end
      2'b01 : begin
        y = a - b;
        negative = y[3];
      end
      2'b10 : begin
        y = a & b;
      end
      2'b11 : begin
        y = a | b;
      end
    endcase
    zero = (y == 4'b0000);
  end
endmodule
