module tb();
  reg coin5,coin10,reset,clk;
  wire dispence;
  wire [2:0]extra;
  wire [4:0]coin;
  
  VMS uut(.coin5(coin5),.coin10(coin10),.reset(reset),.clk(clk),.dispence(dispence),.extra(extra),.coin(coin));
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("VMS.vcd");
    $dumpvars(0,tb);
    
    clk = 0;
    reset = 1;#1;
    reset = 0;
    
    @(negedge clk);
    coin5 = 1; coin10 = 0;
    @(posedge clk);
    display;
    @(negedge clk);
    coin5 = 1; coin10 = 0;
    @(posedge clk);
    display;
    @(negedge clk);
    coin5 = 1; coin10 = 0;
    @(posedge clk);
    display;
    @(negedge clk);
    coin5 = 1; coin10 = 0;
    @(posedge clk);
    display;
    @(negedge clk);
    coin5 = 1; coin10 = 0;
    @(posedge clk);
    display;
    @(negedge clk);
    coin5 = 0; coin10 = 1;
    @(posedge clk);
    display;
    @(negedge clk);
    coin5 = 0; coin10 = 1;
    @(posedge clk);
    display;
    
    $finish;
  end
  
  task display;
    begin
      $display("Time = %0t Reset = %b Coin 5 = %b Coin 10 = %b Coin = %d Dispence = %b Extra = %d",$time,reset,coin5,coin10,coin,dispence,extra);
    end
  endtask
  
endmodule
