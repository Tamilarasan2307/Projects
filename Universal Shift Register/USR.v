module Mux4x1(input a,b,c,d,S0,S1,
              output y);
  assign y = (S1 == 0 && S0 == 0) ? a :(S1 == 0 && S0 == 1) ? b : (S1 == 1 && S0 == 0) ? c : d;
endmodule


module USR(input clk,reset,S0,S1,data,
           input [3:0]I, //for parallel Loading
           output reg[3:0]Y);// for parallel output
  wire [3:0]D;
  Mux4x1 a(Y[3] , data , Y[2] , I[3] , S0 , S1 , D[3]);
  Mux4x1 b(Y[2] , Y[3] , Y[1] , I[2] , S0 , S1 , D[2]);
  Mux4x1 c(Y[1] , Y[2] , Y[0] , I[1] , S0 , S1 , D[1]);
  Mux4x1 d(Y[0] , Y[1] , data , I[0] , S0 , S1 , D[0]);
  
  always @(posedge clk or posedge reset)begin
    if(reset)
      Y <= 4'b0000;
  else 
    Y <= D;
  end
endmodule
