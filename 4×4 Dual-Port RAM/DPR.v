module DPR(input clk,reset,
           input we_a,we_b,
           input [1:0]addr_a,addr_b,
           input [3:0]din_a,din_b,
           output reg [3:0]dout_a,dout_b);
  
  reg [3:0] mem [0:3];
  
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      mem[0] <= 4'd0;
      mem[1] <= 4'd0;
      mem[2] <= 4'd0;
      mem[3] <= 4'd0;
      dout_a <= 4'd0;
	  dout_b <= 4'd0;
    end
    else begin 
      
      if(we_a) begin
        case(addr_a)
          2'b00 : mem[0] <= din_a;
          2'b01 : mem[1] <= din_a;
          2'b10 : mem[2] <= din_a;
          2'b11 : mem[3] <= din_a;
        endcase
      end
      
       if(we_b) begin
        case(addr_b)
          2'b00 : mem[0] <= din_b;
          2'b01 : mem[1] <= din_b;
          2'b10 : mem[2] <= din_b;
          2'b11 : mem[3] <= din_b;
        endcase
      end
      
    end
  end
  
  always @(*)begin

    dout_a = mem[addr_a];
    dout_b = mem[addr_b];
end
endmodule
