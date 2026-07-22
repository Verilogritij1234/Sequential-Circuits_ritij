module gray_counter_4_bit(clk,rst_n,gray_counter_out);
input clk; 
input rst_n;
output reg [3:0]gray_counter_out;
wire [3:0]bin_in;
wire [3:0]next_gray_code;
wire [3:0]bin_out;

gray_encoder   m1(.bin_in(bin_in),.gray_out(next_gray_code));

gray_decoder  m2(.gray_in(gray_counter_out),.bin_out(bin_out));

assign bin_in = bin_out+1'b1;

always @(posedge clk or negedge rst_n)  begin
    if(!rst_n)
    gray_counter_out <= 4'b0;
    else 
    gray_counter_out <= next_gray_code;
end
endmodule 


    