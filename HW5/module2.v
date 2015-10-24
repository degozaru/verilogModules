module module2_DataFlow(
    input [3:0] x,
	 output y
    );
	assign y = ^{^x[3:2], ^x[1:0]};

endmodule

module module2_Behavioral(
    input [3:0] x,
	 output reg y
    );
	always @(*) y = ^{^x[3:2], ^x[1:0]};
endmodule

module module2_Gate(
    input [3:0] x,
	 output y
    );
	xor U0(o1, x[3], x[2]);
	xor U1(o2, x[1], x[0]);
	xor U2(y, o1, o2);
endmodule
