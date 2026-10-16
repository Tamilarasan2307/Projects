module tb();
  reg [3:0]a,b;
  reg [1:0]s;
  wire carry,negative,zero;
  wire [3:0]y;
  ALU uut(.a(a),.b(b),.s(s),.carry(carry),.negative(negative),.zero(zero),.y(y));
  initial begin
    $dumpfile("ALU.vcd");
    $dumpvars(0,tb);
    s = 2'b00;
    a = 4'd5;b = 4'd6;#1;
    display;
    a = 4'd10;b = 4'd6;#1;
    display;
    s = 2'b01;
    a = 4'd2;b = 4'd6;#1;
    display;
    s = 2'b10;
    a = 4'd5;b = 4'd2;#1;
    display;
    s = 2'b11;
    a = 4'd5;b = 4'd2;#1;
    display;
    $finish;
  end
  task display;
    begin
      $display("A = %b (%d) B = %b (%d) S = %b y = %b (%d) Negative = %b Zero = %b Carry = %b",a,a,b,b,s,y,y,negative,zero,carry);
    end
  endtask
endmodule
    
    
