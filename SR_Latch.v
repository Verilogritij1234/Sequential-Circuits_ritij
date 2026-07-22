module SR_latch(input Sbar,Rbar,output Q,Qbar);
nand n1(Q,Sbar,Qbar);
nand n2(Qbar,Rbar,Q);

endmodule


module stimulus;
wire Q,Qbar;
reg Sbar,Rbar; 
SR_latch uut(.Q(Q),.Qbar(Qbar),.Sbar(Sbar),.Rbar(Rbar));
initial begin 
    $monitor($time,"Sbar = %b,Rbar = %b,Q = %b\n",Sbar,Rbar,Q);
    Sbar = 0; Rbar = 0;
    #5 Rbar = 1;
    #5 Rbar = 0;
    #5 Sbar = 1;
    #50 $finish;
end
endmodule 
