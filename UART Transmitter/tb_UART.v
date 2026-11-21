module tb();
  reg [7:0]data_in;
  reg tx_start,reset,clk;
  wire tx_busy,tx;
  
  UART uut(.data_in(data_in),.tx_start(tx_start),.reset(reset),.clk(clk),.tx_busy(tx_busy),.tx(tx));
  
  always #5 clk = ~clk;
  
  initial begin
    clk = 1'b0;
    reset = 1'b1;#1;
    reset = 1'b0;
    tx_start = 1'b0;
	data_in = 8'b00000000;
    
        
    @(negedge clk);
    $display("Data Given");
    tx_start = 1'b1;
    data_in <= 8'b11110000;
    
    @(posedge clk);#1;
    tx_start = 1'b0;
    $display("Changes TX line from 1 to 0");
    display;
    
    
    
    @(posedge clk);#1;
    display;
    
    @(posedge clk);#1;
    display;
    
    @(posedge clk);#1;
    display;
    
    @(posedge clk);#1;
    display;
    
    @(posedge clk);#1;
    display;
    
    @(posedge clk);#1;
    display;
    
    @(posedge clk);#1;
    display;
    
    @(posedge clk);#1;
    display;
    $display("8 bit Data Transmitted");
    
    @(posedge clk);#1;
    display;
    
    @(posedge clk);#1;
    display;
    
    tx_start = 1'b1;
    data_in = 8'b10101010;
    
    @(negedge clk);
    $display("Data Given");
    
    @(posedge clk);#1;
    tx_start = 1'b0;
    
    
    @(posedge clk);#1;
    display;
    
    @(posedge clk);#1;
    display;
    
    @(posedge clk);#1;
    display;
    
    @(posedge clk);#1;
    display;
    
    @(posedge clk);#1;
    display;
    
    reset = 1'b1;
    $display("Reset Operation");
    
    @(posedge clk);#1;
    display;
    
    @(posedge clk);#1;
    display;
    
    @(posedge clk);#1;
    display;
    
    
    $finish;
  end
  task display;
    $display("Time=%0t Data_in=%b Reset=%b Tx_busy=%b TX=%b",$time,data_in,reset,tx_busy,tx);
  endtask
      
endmodule
    
    
  
