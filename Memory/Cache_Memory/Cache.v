module cache(input clk,reset,
             input [3:0]address,
             output reg hit,miss,
             output reg [3:0]dout);
  
  reg [3:0]main_memory[0:15];
  reg [3:0]cache[0:3];
  reg [3:0]valid;
  reg [1:0]stored_tag[0:3];
  integer hit_count,miss_count,total_count;
  
  
  initial begin
    main_memory[0]  = 4'b0001;
    main_memory[1]  = 4'b0010;
    main_memory[2]  = 4'b0011;
    main_memory[3]  = 4'b0100;
    main_memory[4]  = 4'b0101;
    main_memory[5]  = 4'b0110;
    main_memory[6]  = 4'b0111;
    main_memory[7]  = 4'b1000;
    main_memory[8]  = 4'b1001;
    main_memory[9]  = 4'b1010;
    main_memory[10] = 4'b1011;
    main_memory[11] = 4'b1100;
    main_memory[12] = 4'b1101;
    main_memory[13] = 4'b1110;
    main_memory[14] = 4'b1111;
    main_memory[15] = 4'b0000;
  end
  
  
  always @(posedge clk or posedge reset) begin
    miss <= 1'b0;
    hit <= 1'b0;
    if(reset) begin
      valid <= 4'b0000;
      hit <= 1'b0;
      miss <= 1'b0;
      dout <= 4'b0000;
      hit_count <= 0;
      miss_count <= 0;
      total_count <= 0;
    end
    
    else begin
      
      case(address[1:0])
        2'b00 : begin
          if(valid[0] == 1'b0) begin
            miss <= 1'b1;
            stored_tag[0] <= address[3:2];
            cache[0] <= main_memory[address];
            dout <= main_memory[address];
            valid[0] <= 1'b1;
            miss_count <= miss_count + 1;
            total_count <= total_count + 1;
          end
          
          else if(valid[0] == 1) begin
            if(address[3:2] == stored_tag[0]) begin
              dout <= cache[0];
              hit_count <= hit_count + 1;
              total_count <= total_count + 1;
              hit <= 1'b1;
            end
            else begin
              miss <= 1'b1;
              miss_count <= miss_count + 1;
           	  stored_tag[0] <= address[3:2];
              cache[0] <= main_memory[address];
              dout <= main_memory[address];
              total_count <= total_count + 1;
            end
          end
        end
        
        2'b01 : begin
          if(valid[1] == 1'b0) begin
            miss <= 1'b1;
            miss_count <= miss_count + 1;
            total_count <= total_count + 1;
            stored_tag[1] <= address[3:2];
            cache[1] <= main_memory[address];
            dout <= main_memory[address];
            valid[1] <= 1'b1;
          end
          
          else if(valid[1] == 1) begin
            if(address[3:2] == stored_tag[1]) begin
              dout <= cache[1];
              hit <= 1'b1;
              hit_count <= hit_count + 1;
              total_count <= total_count + 1;
            end
            else begin
              miss <= 1'b1;
              miss_count <= miss_count + 1;
              total_count <= total_count + 1;
              stored_tag[1] <= address[3:2];
              cache[1] <= main_memory[address];
              dout <= main_memory[address];
            end
          end
        end
        
        2'b10 : begin
          if(valid[2] == 1'b0) begin
            miss <= 1'b1;
            miss_count <= miss_count + 1;
            total_count <= total_count + 1;
            stored_tag[2] <= address[3:2];
            cache[2] <= main_memory[address];
            dout <= main_memory[address];
            valid[2] <= 1'b1;
          end
          
          else if(valid[2] == 1) begin
            if(address[3:2] == stored_tag[2]) begin
              dout <= cache[2];
              hit <= 1'b1;
              hit_count <= hit_count + 1;
              total_count <= total_count + 1;
            end
            else begin
              miss <= 1'b1;
              miss_count <= miss_count + 1;
              stored_tag[2] <= address[3:2];
              cache[2] <= main_memory[address];
              total_count <= total_count + 1;
              dout <= main_memory[address];
            end
          end
        end
          
        2'b11 : begin
          if(valid[3] == 1'b0) begin
            miss <= 1'b1;
            miss_count <= miss_count + 1;
            total_count <= total_count + 1;
            stored_tag[3] <= address[3:2];
            cache[3] <= main_memory[address];
            dout <= main_memory[address];
            valid[3] <= 1'b1;
          end
          
          else if(valid[3] == 1) begin
            if(address[3:2] == stored_tag[3]) begin
              dout <= cache[3];
              hit <= 1'b1;
              hit_count <= hit_count + 1;
              total_count <= total_count + 1;
            end
            else begin
              miss <= 1'b1;
              miss_count <= miss_count + 1;
              total_count <= total_count + 1;
              stored_tag[3] <= address[3:2];
              cache[3] <= main_memory[address];
              dout <= main_memory[address];
            end
          end
        end
      endcase
    end
  end
endmodule
