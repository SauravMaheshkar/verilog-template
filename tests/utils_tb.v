`timescale 1ns/1ns
`include "src/utils.v"

module test_utils;

reg A = 1'b1;
reg B = 1'b0;

initial begin

  $dumpfile(`VCD_FILE);
  $dumpvars;

  #10;
  utils.assert_true(A); #50;
  utils.assert_true(!B); #50;
  utils.assert_false(!A); #50;
  utils.assert_false(B); #50;

  $display("Testbench finished");

end

endmodule
