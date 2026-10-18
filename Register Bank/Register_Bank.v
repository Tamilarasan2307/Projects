module Register_bank(input enable,clk,reset,
                     input [3:0]din,
                     input [1:0]address,
                     output reg[3:0]dout);
  reg [3:0]r0,r1,r2,r3;
  always @(posedge clk or posedge reset)begin
    if(reset)begin
      r0 <= 4'b0000;
      r1 <= 4'b0000;
      r2 <= 4'b0000;
      r3 <= 4'b0000;
    end
    else if(enable)begin
      case(address)
        2'b00 : r0 <= din;
        2'b01 : r1 <= din;
        2'b10 : r2 <= din;
        2'b11 : r3 <= din;
      endcase
    end
  end
  always @(*)begin
    case(address)
        2'b00 : dout = r0;
        2'b01 : dout = r1;
        2'b10 : dout = r2;
        2'b11 : dout = r3;
        default : dout = 4'b0000;
      endcase
    end
endmodule
