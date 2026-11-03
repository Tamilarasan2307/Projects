module tb();
  reg clk,reset;
  reg we_a,we_b;
  reg [1:0]addr_a,addr_b;
  reg [3:0]din_a,din_b;
  wire [3:0]dout_a,dout_b;
  
  DPR uut(.clk(clk),.reset(reset),.we_a(we_a),.we_b(we_b),.addr_a(addr_a),.addr_b(addr_b),.din_a(din_a),.din_b(din_b),.dout_a(dout_a),.dout_b(dout_b));
  
  always #5 clk = ~clk;
  initial begin
    clk = 0;
    reset = 1;#2;
    reset = 0;we_a = 0;we_b = 0;addr_a = 0;addr_b = 0;din_a = 0;din_b = 0;
    
    we_a = 1;
    
    @(negedge clk);
    addr_a = 2'b00;
    din_a = 4'b1001;
    
    @(negedge clk);
    addr_a = 2'b01;
    din_a = 4'b1101;
    
    @(negedge clk);
    addr_a = 2'b10;
    din_a = 4'b0011;
    
    @(negedge clk);
    addr_a = 2'b11;
    din_a = 4'b1111;
    @(posedge clk);#1;
    we_a = 0;
    
    addr_b = 2'b00;#1;
    $display("Address = %b Data = %b %d",addr_b,dout_b,dout_b);
    
    addr_b = 2'b01;#1;
    $display("Address = %b Data = %b %d",addr_b,dout_b,dout_b);
    
    addr_b = 2'b10;#1;
    $display("Address = %b Data = %b %d",addr_b,dout_b,dout_b);
    
    addr_b = 2'b11;#1;
    $display("Address = %b Data = %b %d",addr_b,dout_b,dout_b);
    
    
    reset = 1;#1;
    reset = 0;
    
    we_b = 1;
    
    @(negedge clk);
    addr_b = 2'b00;
    din_b = 4'b1111;
    
    @(negedge clk);
    addr_b = 2'b01;
    din_b = 4'b1001;
    
    @(negedge clk);
    addr_b = 2'b10;
    din_b = 4'b1100;
    
    @(negedge clk);
    addr_b = 2'b11;
    din_b = 4'b1110;
    @(posedge clk);#1;
    we_b = 0;
    
    
    addr_a = 2'b00;#1;
    $display("Address = %b Data = %b %d",addr_a,dout_a,dout_a);
    
    addr_a = 2'b01;#1;
    $display("Address = %b Data = %b %d",addr_a,dout_a,dout_a);
    
    addr_a = 2'b10;#1;
    $display("Address = %b Data = %b %d",addr_a,dout_a,dout_a);
    
    addr_a = 2'b11;#1;
    $display("Address = %b Data = %b %d",addr_a,dout_a,dout_a);
    
    $finish;
  end
endmodule
