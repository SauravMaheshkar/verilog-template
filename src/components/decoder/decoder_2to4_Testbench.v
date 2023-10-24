`timescale 1ns/1ns
`include "src/components/decoder/decoder.v"

module decoder_2to4_Testbench;

reg [1:0] A;
wire [3:0] D;

decoder_2to4 uut(A, D);

initial begin

    $dumpfile("decoder_2to4.vcd");
    $dumpvars(0, decoder_2to4_Testbench);

    A = 2'b00; #20;
    A = 2'b01; #20;
    A = 2'b10; #20;
    A = 2'b11; #20;
    $display("Testbench finished");

end

endmodule
