module tb();
  reg clk,reset;
  reg [3:0]address;
  wire hit,miss;
  wire [3:0]dout;
  
  real hit_ratio, miss_ratio;
  
  cache uut(.clk(clk),.reset(reset),.address(address),.hit(hit),.miss(miss),.dout(dout));
  
  always #5 clk = ~clk;
  
  initial begin
    clk = 0;
    reset = 1'b1;#2;
    reset = 1'b0;
    
    //Miss Operation
    
    @(negedge clk);
    address = 4'b0011;
    @(posedge clk);#1;
    display;
    
    //Hit Operation
    
    @(negedge clk);
    address = 4'b0011;
    @(posedge clk);#1;
    display;
    
    @(negedge clk);
    address = 4'b0111;
    @(posedge clk);#1;
    display;
    
    @(negedge clk);
    address = 4'b0010;
    @(posedge clk);#1;
    display;
    
    @(negedge clk);
    address = 4'b1110;
    @(posedge clk);#1;
    display;
    
    @(negedge clk);
    address = 4'b0110;
    @(posedge clk);#1;
    display;
    
    @(negedge clk);
	address = 4'b0110;
	@(posedge clk);#1;
	display;
    
    $display("Hit Count = %0d",uut.hit_count);
	$display("Miss Count = %0d",uut.miss_count);
    $display("Total Count = %0d",uut.total_count);
    
    hit_ratio = (uut.hit_count * 1.0) / uut.total_count;
	miss_ratio = (uut.miss_count * 1.0) / uut.total_count;

    $display("Hit Ratio = %0.2f%%",hit_ratio*100);
    $display("Miss Ratio = %0.2f%%",miss_ratio*100);
    #5;
    
    $finish;
  end
  
  task display;
    begin
      $display("Address = %b Index = %b Hit = %b Miss = %b Dout = %b",address,address[1:0],hit,miss,dout);
    end
  endtask
endmodule
