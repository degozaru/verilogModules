/* axpb.v : implements ax + b (3x + 3)
 * Inputs : 7 bit signed number x
 */
 
module axpb(
    input signed [6:0] x,
	 output signed [11:0] out 
    );

	 
	 wire [10:0] multOut;
	 multiply #(.L1(4),.L2(7)) 
			mul(.in1(-(4'd3)), .in2(x), .out(multOut));
	 add #(.L1(11), .L2(4))
			addr(.in1(multOut), .in2(4'd3), .out(out));


endmodule
