`timescale 1ns/1ns
`include "decoder.v"

module decoder_1to2_Testbench;

reg A;
wire [1:0] D;

decoder_1to2 uut(A, D);

initial begin

    $dumpfile(`VCD_FILE);
    $dumpvars(0, decoder_1to2_Testbench);

    A = 1'b0; #20;
    A = 1'b1; #20;
    $display("Testbench finished");

end

endmodule
