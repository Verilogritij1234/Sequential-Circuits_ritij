
module stimulus;
reg [3:0]bin_in;
wire[3:0]gray_out;

gray_encoder  uut(.bin_in(bin_in),.gray_out(gray_out));
initial begin
    $monitor($time,"bin_in = %b,   gray_out = %b",bin_in,gray_out);
 
#5 bin_in = 4'b1111;  ///  gray_out = 1000
#5 bin_in = 4'b0011;   //  gray_out = 0010
#5 bin_in = 4'b0100;  //   gray_out = 0110 
#5 bin_in = 4'b1100;    // gray_out = 1010
#20 $finish;
end
endmodule 

// iverilog -o 4_bit_gray_encoder_tb.out 4_bit_gray_encoder.v 4_bit_gray_encoder_tb.v
// vvp 4_bit_gray_encoder_tb.out


