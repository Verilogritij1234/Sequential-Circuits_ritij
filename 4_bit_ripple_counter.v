//TOP to DOWN DESIGN METHODOLOGY:
module counter(CLOCK,CLEAR,Q);
input CLOCK,CLEAR;
output [3:0]Q; // q0,q1,q2,q3
// counter is made of up T flipflops 
T_FF tff0(Q[0],Clock,clear);
T_FF tff1(Q[1],Q[0],clear);
T_FF tff2(Q[2],Q[1],clear);
T_FF tff3(Q[3],Q[2],clear);
endmodule

 // T_ff is made up of D_flip flops :
 module T_FF(q,clk,clear);
 input clk,clear;
 output q;
edge_dff ff1(q, ,~q,clk,clear);
endmodule


 module edge_dff(q,qbar,d,clk,clear);
 input d,clk,clear;
 output q,qbar;
 wire s,sbar,r,rbar,cbar;
 assign cbar = ~clear;
// input Latches 
 assign sbar = ~(rbar&s),
        s =  ~(sbar&(~clk)&cbar),
        r =  ~(s&(~clk)&rbar),
        rbar =  ~(r&d&cbar);
 // Output Latch
 assign q = ~(s&qbar),
       qbar = ~(q&r&cbar);
 endmodule 








