module UART(input [7:0]data_in,
            input tx_start,reset,clk,
            output reg tx_busy,tx);
  
  reg [7:0]copy;
  reg [3:0]count;
  
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      copy <= 8'd0;
      tx_busy <= 1'b0;
      tx <= 1'b1;
      count <= 4'd0;
    end
    
    else if(tx_start && !tx_busy) begin
      tx_busy <= 1'b1;
      tx <= 1'b0;
      copy <= data_in;
      count <= 4'd0;
    end
    
    else if(tx_busy) begin
      if(count < 4'd8) begin
        tx <= copy[0];
        copy <= {1'b0 , copy[7:1]};
        count <= count + 1'd1;
      end
      else begin
        tx <= 1'b1;
        tx_busy <= 1'b0;
      end
    end
  end
endmodule
      
      
