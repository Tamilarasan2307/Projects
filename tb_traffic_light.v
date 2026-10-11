module Traffic_Light(input clk,reset,output reg red,yellow,green);
  localparam Red = 2'b00,Yellow = 2'b01,Green = 2'b10;
  reg [0:1]state,next;
  always @(posedge clk or posedge reset)begin
    if(reset)
      state <= Red;
  else
    state <= next;
  end
  always @(*)begin
    case(state)
      Red : next = Yellow;
      Yellow : next = Green;
      Green : next = Red;
    endcase
  end
  always @(*)begin
    red = 0;yellow = 0;green = 0;
    case(state)
      Red : red = 1;
      Yellow : yellow = 1;
      Green : green = 1;
    endcase
  end
endmodule