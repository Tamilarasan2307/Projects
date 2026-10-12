//1 0 1 0
module locker(input clk,pin,reset,
              output reg open,close);
  localparam a = 2'b00,b = 2'b01,c = 2'b10,d = 2'b11;
  reg [1:0]state,next_state;
  always @(posedge clk or posedge reset)begin
    if(reset)
      state <= a;
    else
      state <= next_state;
  end
  
  always @(*)begin
    close = 1;
    open = 0;
    next_state = a;
    case(state)
      a : begin
        if(pin == 1)
          next_state = b;
      else
        next_state = a;
      end
      b : begin
        if(pin == 0)
          next_state = c;
        else
          next_state = a;
      end
      c : begin
        if(pin == 1)
          next_state = d;
        else
          next_state = a;
      end
      d : begin
        if(pin == 0)begin
          open = 1;
          close = 0;
          next_state = a;
        end
      else
        next_state = b;
      end
      default : next_state = a;
    endcase
  end
endmodule
