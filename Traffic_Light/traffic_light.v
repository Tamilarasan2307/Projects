module tb();
  reg clk,reset;
  wire red,yellow,green;
  always #5 clk = ~clk;
  Traffic_Light uut (.clk(clk),.reset(reset),.red(red),.yellow(yellow),.green(green));
  initial begin
    clk = 0;
    reset = 1;#6;
    reset = 0;
    #99;
    $finish;
  end
  always @(posedge clk) begin
    #1;
    case(1'b1)
      red : $display("RED");
      yellow : $display("YELLOW");
      green : $display("GREEN");
    endcase
  end
endmodule
