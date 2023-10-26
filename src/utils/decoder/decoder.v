module decoder_1to2(A, D);

input A;
output [1:0] D;

assign D[0] = ~A;
assign D[1] = A;

endmodule

module decoder_2to4(A, D);

input [1:0] A;
output [3:0] D;
wire [3:0] w;

decoder_1to2 U0(.A(A[0]), .D(w[3:2]));
decoder_1to2 U1(.A(A[1]), .D(w[1:0]));

assign D[0] = w[3] & w[1];
assign D[1] = w[2] & w[1];
assign D[3] = w[3] & w[0];
assign D[2] = w[2] & w[0];

endmodule
