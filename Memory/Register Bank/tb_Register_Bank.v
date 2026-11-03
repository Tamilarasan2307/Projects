module tb();
  reg enable,clk,reset;
  reg [3:0]din;
  reg [1:0]address;
  wire [3:0]dout;
  always #5 clk = ~clk;  
  Register_bank uut(.enable(enable),.clk(clk),.reset(reset),.din(din),.address(address),.dout(dout));
  initial begin
    clk = 0;
    $dumpfile("RegBank.vcd");
    $dumpvars(0,tb);
    reset = 1;#2;
    
    address = 2'b00;display;
    address = 2'b01;display;
    address = 2'b10;display;
    address = 2'b11;display;
    reset = 0;#2;
    enable = 1;#1; //for loading the data
    
    @(negedge clk);
    address = 2'b00;din = 4'b0001;
    @(posedge clk);#1;
    display;
    
    @(negedge clk);
    address = 2'b01;din = 4'b0010;
    @(posedge clk);#1;
    display;
    
    @(negedge clk);
    address = 2'b10;din = 4'b0011;
    @(posedge clk);#1;
    display;
    
    @(negedge clk);
    address = 2'b11;din = 4'b0100;
    @(posedge clk);#1;
    display;
    
    @(negedge clk);
    address = 2'b01;din = 4'b1010;
    @(posedge clk);#1;
    display;
    
    enable = 0;
    @(negedge clk);
    address = 2'b01;din = 4'b1111;
    @(posedge clk);#1;
    display;
    
    $finish;
  end
  task display;
    begin
      $display("Time = %0t Address = %b Data = %b (%d)",$time,address,dout,dout);
    end
  endtask
endmodule
