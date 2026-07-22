//iverilog -o 4_bit_ripple_counter_tb.out 4_bit_ripple_counter.v 4_bit_ripple_counter_tb.v
//vvp 4_bit_ripple_counter_tb.out

module stimulus;
reg CLOCK,CLEAR;
wire [3:0]Q;

initial 
$monitor($time,"count Q = %b  clear = %b",  Q[3:0],CLEAR);
counter c1(.Q(Q),.CLOCK(CLOCK),.CLEAR(CLEAR));
initial
begin
 //$dumpfile("dump.vcd");
//$dumpvars(0, 4_bit_ripple_counter)
      CLEAR = 1'b1;
      #34 CLEAR = 1'b0;
    #200 CLEAR = 1'b1;
      #50 CLEAR = 1'b0;

end
initial begin
    CLOCK = 1'b0;
    forever #10 CLOCK = ~CLOCK;
end
initial begin
    #400 $finish;
end
endmodule



















// module stimulus;
//     reg CLOCK, CLEAR;
//     wire [3:0] Q;

    // instantiate with named mapping to avoid port-order errors
//     counter c1 (
//         .Q(Q),
//         .CLOCK(CLOCK),
//         .CLEAR(CLEAR)
//     );

//     initial begin
//         $monitor($time, " count Q = %b,  clear = %b", Q, CLEAR);
//     end

//     initial begin
//         CLEAR = 1'b1;
//         #34 CLEAR = 1'b0;
//         #200 CLEAR = 1'b1;
//         #50 CLEAR = 1'b0;
//     end

//     initial begin
//         CLOCK = 1'b0;
//         forever #10 CLOCK = ~CLOCK;
//     end

//     initial begin
//         #400 $finish;
//     end
// endmodule