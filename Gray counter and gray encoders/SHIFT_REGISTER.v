// Left Right shift register:
module left_right_shift_register(reset_n,clk,i,load_enable,shift_left_right,q);
input reset_n;
input clk;
input [7:0]i;
input  load_enable;
input  shift_left_right;
output reg [7:0]q;

always @(posedge clk or negedge reset_n)  begin 
    if(!reset_n)
    q<= 8'b0;
    else if (load_enable == 1'b0)   // 0 for load load_data and 1 for enable shifting 
    q<=i;

      else  begin  
      if(shift_left_right == 1'b0) begin    // 0  for left shift 
        q<={q[6:0],1'b0};
      end
        else begin
        q<={1'b0,q[7:1]};    // 1 for right shift 

      end
   end
end
endmodule 






