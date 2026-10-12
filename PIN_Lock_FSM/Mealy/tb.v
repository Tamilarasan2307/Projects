module tb();
  reg clk,pin,reset;
  wire open,close;
  always #5 clk= ~clk;
  locker uut(.clk(clk),.pin(pin),.reset(reset),.open(open),.close(close));
  initial begin
    clk = 0;
    $dumpfile("Locker.vcd");
    $dumpvars(0,tb);
    reset = 1;#1;
    reset = 0;
    $monitor("%0t Pin = %b Open = %b Close = %b",$time,pin,open,close);    
    pin = 1;#10;
    pin = 0;#10;
    pin = 1;#10;
    pin = 0;#1;
    $finish;
  end
endmodule
