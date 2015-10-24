module SC(
    input P,
    input C,
    input G,
    output Cout,
    output Sout
    );
	assign Sout = P ^ C;
	assign Cout = G | (P&C);

endmodule
