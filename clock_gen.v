// CLOCK GENERATION
module clock_gen( output reg clock);
  integer i;
  initial begin
    clock = 0;
    i = 0;
  end

  always begin
    #5 clock = ~clock;
    i = i + 1;
    $display("%0t clock = %b, i = %0d", $time, clock,);
    if (i >= 36) begin
      $display("%0t Reached %0d toggles, finishing simulation", $time, i);
      $finish;
    end
  end
endmodule

// iverilog -o clock_gen.vvp clock_gen.v
// vvp clock_gen.vvp