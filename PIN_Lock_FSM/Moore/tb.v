module tb();
  reg clk,pin,reset;
  wire close,open;
  always #5 clk = ~clk;
  locker uut(.clk(clk),.pin(pin),.reset(reset),.close(close),.open(open));
  initial begin
    $dumpfile("Locker.vcd");
    $dumpvars(0,tb);
    clk = 0;
    reset = 1;#14;
    reset = 0;
    $monitor("Pin = %b Open = %b Close = %b",pin,open,close);
    pin = 0;#10;
    pin = 1;#10;
    pin = 0;#10;
    pin = 0;#10;
    pin = 1;#10;
    pin = 0;#10;
    pin = 1;#10;
    pin = 1;#10;
    $finish;
  end
endmodule
