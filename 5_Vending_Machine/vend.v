module vending_machine(coin,clock,reset,newspaper);
input [1:0]coin;
input clock;
input reset;
output wire  newspaper;

wire  [1:0] NEXT_STATE;
reg [1:0] PRESENT_STATE;

parameter s0 = 2'b00;  // no coins inserted in the machine 
parameter s5 = 2'b01; // nickel coin inserterd in the machine
parameter s10 = 2'b10;  // dime coin inserted in the machine 
parameter s15 = 2'b11;  // both coins inserted in the machine 
// combinational logic  for next state and output 

function[2:0] fsm;
input [1:0]fsm_coin;
input [1:0]fsm_PRESENT_STATE;
reg  fsm_newspaper;
reg  [1:0]fsm_NEXT_STATE;
begin
    case(fsm_PRESENT_STATE)
s0:   // state = s0
    if(fsm_coin == 2'b10)  begin
        fsm_newspaper = 1'b0;
     fsm_NEXT_STATE = s10;
    end
    else if(coin == 2'b01) begin
         fsm_newspaper = 1'b0;
      fsm_NEXT_STATE = s5;
    end
    else begin
          fsm_newspaper = 1'b0;
          fsm_NEXT_STATE = s0;
    end


s5:    // state = s5
    begin
    if(fsm_coin == 2'b10)
    begin
         fsm_newspaper = 1'b0;
          fsm_NEXT_STATE = s15;
    end
    else if (fsm_coin == 2'b01)
    begin
        fsm_newspaper = 1'b0;
        fsm_NEXT_STATE = s10;
    end
    else begin
        fsm_newspaper = 1'b0;
        fsm_NEXT_STATE = s5;
    end
end



s10:    // state = s10
    begin
    if(fsm_coin == 2'b10)
    begin
        fsm_newspaper = 1'b0;
        fsm_NEXT_STATE = s15;
    end
    else if (fsm_coin == 2'b01)
    begin
        fsm_newspaper = 1'b0;
        fsm_NEXT_STATE = s15;
    end
    else begin
        fsm_newspaper = 1'b0;
        fsm_NEXT_STATE = s10;
    end
end


s15:    // state = s15
    begin
        fsm_newspaper = 1'b1;
        fsm_NEXT_STATE = s0;
    end
endcase
fsm = {fsm_newspaper,fsm_NEXT_STATE};
end
endfunction

assign {newspaper,NEXT_STATE} = fsm(coin,PRESENT_STATE);
// sequentiall logic for state update

always @(posedge clock)
begin 
    if(reset == 1'b1)
PRESENT_STATE <= s0;
else
PRESENT_STATE <= NEXT_STATE;
end
endmodule

