module gray_encoder (bin_in,
    gray_out);
 input [3:0] bin_in;
 output [3:0] gray_out;

 wire _4_;
 wire _5_;
 wire _6_;

 sky130_fd_sc_hd__xor2_1 _7_ (.A(bin_in[2]),
    .B(bin_in[3]),
    .X(_6_));
 sky130_fd_sc_hd__xor2_1 _8_ (.A(bin_in[2]),
    .B(bin_in[1]),
    .X(_5_));
 sky130_fd_sc_hd__xor2_1 _9_ (.A(bin_in[1]),
    .B(bin_in[0]),
    .X(_4_));
 assign gray_out[0] = _4_;
 assign gray_out[1] = _5_;
 assign gray_out[2] = _6_;
 assign gray_out[3] = bin_in[3];
endmodule
