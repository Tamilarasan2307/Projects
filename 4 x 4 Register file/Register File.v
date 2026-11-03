module mux_4x1(input [3:0] a,b,c,d,
               input [1:0]s,
               output reg [3:0]y);
  always @(*)begin
    case(s)
      2'b00 : y = a;
      2'b01 : y = b;
      2'b10 : y = c;
      2'b11 : y = d;
    endcase
  end
endmodule


module RF_4x4(input clk,we,reset,
              input [1:0]wr_addr,
              input [3:0]wr_data,
              input [1:0]rd_addr1,rd_addr2,
              output [3:0]data1,data2);
  
  reg [3:0]mem[0:3];
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      mem[0] <= 4'd0;
      mem[1] <= 4'd0;
      mem[2] <= 4'd0;
      mem[3] <= 4'd0;
    end
    
    else if(we)
      mem[wr_addr] <= wr_data;
  end
  
  
  mux_4x1 MUX1(.a(mem[0]),.b(mem[1]),.c(mem[2]),.d(mem[3]),.s(rd_addr1),.y(data1));
  mux_4x1 MUX2(.a(mem[0]),.b(mem[1]),.c(mem[2]),.d(mem[3]),.s(rd_addr2),.y(data2));

endmodule
