//1 0 1 1
module locker(input clk,pin,reset,
             output reg close,open);
  localparam a = 3'b000,b = 3'b001,c = 3'b010,d = 3'b011,e= 3'b100;
  reg [2:0]state,next_state;
  always @(posedge clk or posedge reset)begin
    if(reset)
      state <= a;
  else
    state <= next_state;
  end
  
  always @(*)begin
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
        if(pin == 1)
          next_state = e;
        else
          next_state = c;
      end
      e : 
        next_state = a;
      default: 
        next_state = a;
    endcase
  end
  
  always @(*)begin
    close = 1;open = 0;
    if(state == e)begin
      open = 1;
      close = 0;
    end
  end
endmodule
