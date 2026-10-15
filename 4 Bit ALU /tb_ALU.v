module tb();
  reg [3:0]a,b;
  reg [1:0]s;
  wire [3:0]y;
  ALU uut(.a(a),.b(b),.s(s),.y(y));
  initial begin
    $dumpfile("ALU.vcd");
    $dumpvars(0,tb);
    s = 2'b00;
    a = 4;b = 6;#1;
    display;
    s = 2'b01;
    a = 4;b = 2;#1;
    display;
    s = 2'b10;
    a = 4'b0101;b = 4'b0011;#1;
    display;
    s = 2'b11;
    a = 4'b0101;b = 4'b0011;#1;
    display;#1;
  end
  task display; begin
    $display("A = %b (%d) B = %b (%d) S = %b y = %b (%d)",a,a,b,b,s,y,y);
  end
  endtask
endmodule
