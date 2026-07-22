module vending_machine (newspaper,
    clock,
    reset,
    coin);
 output newspaper;
 input clock;
 input reset;
 input [1:0] coin;

 wire _25_;
 wire _26_;
 wire _27_;
 wire _28_;
 wire _31_;
 wire _32_;
 wire _33_;
 wire _34_;
 wire _35_;
 wire _36_;
 wire _37_;
 wire _38_;
 wire [3:0] PRESENT_STATE;

 sky130_fd_sc_hd__lpflow_isobufsrc_1 _40_ (.A(coin[1]),
    .SLEEP(coin[0]),
    .X(_31_));
 sky130_fd_sc_hd__nor3b_1 _41_ (.A(reset),
    .B(coin[0]),
    .C_N(coin[1]),
    .Y(_32_));
 sky130_fd_sc_hd__lpflow_isobufsrc_1 _42_ (.A(coin[0]),
    .SLEEP(coin[1]),
    .X(_33_));
 sky130_fd_sc_hd__nor3b_1 _43_ (.A(reset),
    .B(coin[1]),
    .C_N(coin[0]),
    .Y(_34_));
 sky130_fd_sc_hd__nor2_1 _44_ (.A(PRESENT_STATE[2]),
    .B(PRESENT_STATE[1]),
    .Y(_35_));
 sky130_fd_sc_hd__a21oi_1 _45_ (.A1(PRESENT_STATE[1]),
    .A2(_34_),
    .B1(_32_),
    .Y(_36_));
 sky130_fd_sc_hd__nor2_1 _46_ (.A(_35_),
    .B(_36_),
    .Y(_28_));
 sky130_fd_sc_hd__nor3_1 _47_ (.A(reset),
    .B(_31_),
    .C(_33_),
    .Y(_37_));
 sky130_fd_sc_hd__a22o_1 _48_ (.A1(PRESENT_STATE[0]),
    .A2(_34_),
    .B1(_37_),
    .B2(PRESENT_STATE[2]),
    .X(_27_));
 sky130_fd_sc_hd__a22o_1 _49_ (.A1(PRESENT_STATE[0]),
    .A2(_32_),
    .B1(_34_),
    .B2(PRESENT_STATE[2]),
    .X(_38_));
 sky130_fd_sc_hd__a21o_1 _50_ (.A1(PRESENT_STATE[1]),
    .A2(_37_),
    .B1(_38_),
    .X(_26_));
 sky130_fd_sc_hd__a211o_1 _51_ (.A1(PRESENT_STATE[0]),
    .A2(_37_),
    .B1(PRESENT_STATE[3]),
    .C1(reset),
    .X(_25_));
 sky130_fd_sc_hd__dfxtp_1 _52_ (.CLK(clock),
    .D(_25_),
    .Q(PRESENT_STATE[0]));
 sky130_fd_sc_hd__dfxtp_1 _53_ (.CLK(clock),
    .D(_26_),
    .Q(PRESENT_STATE[1]));
 sky130_fd_sc_hd__dfxtp_1 _54_ (.CLK(clock),
    .D(_27_),
    .Q(PRESENT_STATE[2]));
 sky130_fd_sc_hd__dfxtp_1 _55_ (.CLK(clock),
    .D(_28_),
    .Q(PRESENT_STATE[3]));
 assign newspaper = PRESENT_STATE[3];
endmodule
