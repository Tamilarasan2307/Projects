module tb();
  reg clk,reset,S0,S1,data;
  reg [3:0]I;
  wire [3:0]Y;
  always #5 clk = ~clk;
  USR uut(.clk(clk),.reset(reset),.S0(S0),.S1(S1),.data(data),.I(I),.Y(Y));
  initial begin
    $dumpfile("USR.vcd");
    $dumpvars(0,tb);
    clk = 0;
    $monitor("S0 = %b S1 = %b Data = %b I = %b Y = %b",S0,S1,data,I,Y);
    reset = 1;#6;
    reset = 0;
    S1 = 0;S0 = 1; //Right Shift
    $display("Right Shift");
    data = 1;#10;
    data = 1;#10;
    data = 1;#10;
    data = 1;#10;
    S1 = 1;S0 = 0;
    $display("Left Shift");
    data = 0;#10;
    data = 0;#10
    S0 = 0;S1 = 0;#10;
    S0 = 1;S1 = 1;
    I = 4'b1111;#10;
    $finish;
  end
endmodule
