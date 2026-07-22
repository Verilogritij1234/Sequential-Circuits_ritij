`timescale 1ns/1ps
module stimulus;
reg  clk = 0; 
reg rst_n;
wire [3:0]gray_counter_out;

gray_counter_4_bit  uut(.clk(clk),.rst_n(rst_n),.gray_counter_out(gray_counter_out));

always #0.5  clk = ~clk ;

initial begin
$dumpfile("dump_gray_counter.vcd");
$dumpvars(0, stimulus); 
end
 always @(posedge clk)begin
    $display($time,"clk= %b,  rst_n = %b,  gray_counter_out = %b",clk,rst_n,gray_counter_out);
end
initial   begin
 rst_n = 0;
 #1 rst_n = 1;
 #40 $finish;
end
endmodule

// iverilog -o 4_bit_gray_counter_tb.out 4_bit_gray_counter.v 4_bit_gray_encoder.v 4_bit_gray_decoder.v  4_bit_gray_counter_tb.v
// vvp 4_bit_gray_counter_tb.out
//  gtkwave dump_gray_counter.vcd





    