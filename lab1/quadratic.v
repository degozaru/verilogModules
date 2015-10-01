/* quadratic.v : implements the quadratic formula -3(x^2) + 3(x) - 7
 * inputs : 7 bit signed number x
 */
 
 module quadratic(
    input [6:0] x,
	 output [19:0] out
    );
	 
	 wire [11:0] axpbOut;
	 wire  [18:0] mulC_Out;
	 axpb axpb_01(.x(x), .out(axpbOut));
	 multiply #(.L1(12),.L2(7)) 
			mulX(.in1(axpbOut), .in2(x), .out(mulC_Out));
	 add #(.L1(19), .L2(7))
			addC(.in1(mulC_Out), .in2(-(7'd7)), .out(out));
endmodule
