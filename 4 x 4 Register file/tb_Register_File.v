module tb();
  reg clk, we, reset;
  reg [1:0] wr_addr;
  reg [3:0] wr_data;
  reg [1:0] rd_addr1, rd_addr2;
  wire [3:0] data1, data2;

  RF_4x4 uut (.clk(clk),.we(we),.reset(reset),.wr_addr(wr_addr),.wr_data(wr_data),.rd_addr1(rd_addr1),.rd_addr2(rd_addr2),.data1(data1),.data2(data2));
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("rf.vcd");
    $dumpvars(0,tb);
    clk = 0;
    reset = 1;#2;
    reset = 0;
    
    we = 1;
    rd_addr1 = 0;
	rd_addr2 = 0;
    
    @(negedge clk);
    wr_addr = 2'b00;
    wr_data = 4'd6;
    
    @(negedge clk);
    wr_addr = 2'b01;
    wr_data = 4'd7;
    
    @(negedge clk);
    wr_addr = 2'b10;
    wr_data = 4'd8;
    
    @(negedge clk);
    wr_addr = 2'b11;
    wr_data = 4'd9;
        
    @(posedge clk);#1;
    
    we = 0;
    
    rd_addr1 = 2'b00;rd_addr2 = 2'b01;#1;
    
    $display("Address 1 = %b Address 2 = %b Data 1 = %b %d Data 2 = %b %d",rd_addr1,rd_addr2,data1,data1,data2,data2);
    
    rd_addr1 = 2'b10;rd_addr2 = 2'b11;#1;
    
    $display("Address 1 = %b Address 2 = %b Data 1 = %b %d Data 2 = %b %d",rd_addr1,rd_addr2,data1,data1,data2,data2);

    $finish;
  end
endmodule
