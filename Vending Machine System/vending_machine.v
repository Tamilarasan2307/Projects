module VMS(input coin5,coin10,reset,clk,
           output reg dispence,
           output reg [2:0]extra,
           output reg [4:0]coin);
  
  localparam s0 = 2'b00,s5 = 2'b01,s10 = 2'b10,s15 = 2'b11;
  reg [1:0]state,next_state;
  
  always @(posedge clk or posedge reset) begin
    if(reset)begin
      state <= s0;
    end
    else
      state <= next_state;
  end
  
  always @(*) begin
    next_state = state;
    dispence = 1'b0;
    extra = 1'b0;
    coin = 5'd0;
    case(state)
      s0 : begin
        if(coin5) begin
          next_state = s5;
          coin = 5'd5;
        end
        else if(coin10) begin
          next_state = s10;
          coin = 5'd10;
        end
      end
      
      s5 : begin
        if(coin5) begin
          next_state = s10;
          coin = 5'd10;
        end
        else if(coin10) begin
          next_state = s15;
          coin = 5'd15;
        end
      end
      
      s10 : begin
        if(coin5) begin
          next_state = s15;
          coin = 5'd15;
        end
        else if(coin10) begin
          dispence = 1'b1;
          coin = 5'd20;
          next_state = s0;
        end
      end
        
      s15 : begin
        if(coin5) begin
          next_state = s0;
          coin = 5'd20;
          dispence = 1'b1;
        end
        else if(coin10) begin
          dispence = 1'b1;
          coin = 5'd25;
          extra = 3'd5;
          next_state = s0;
        end
      end
        
      default: next_state = s0;
      
    endcase
  end
endmodule
