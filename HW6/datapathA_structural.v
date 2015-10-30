module datapathA_structural #(parameter WLx = 8, parameter WLc = 8)
			( input signed [WLx-1:0] x,
			  input signed [WLc-1:0] a, b, c,
			  input CLK,
			  output signed [((WLx+WLc)+(WLc)):0] outR
			);
			
			wire signed [(WLx+WLc-1):0] mul1Out;
			wire signed [(WLx+WLc-1):0] mulR;
			multiply #(.L1(WLx), .L2(WLc)) mul1(.in1(x), .in2(a), .out(mul1Out));
			register #(.WL(WLx+WLc)) regMul(.data(mul1Out), .CLK(CLK), .register(mulR));
			
			wire signed [(WLx+WLc):0] addOut;
			wire signed [(WLx+WLc):0] addR;
			add #(.L1(WLx+WLc), .L2(WLc)) add1(.in1(mulR), .in2(b), .out(addOut));
			register #(.WL(WLx+WLc+1)) regAdd(.data(addOut), .CLK(CLK), .register(addR));
			
			wire signed [((WLx+WLc)+(WLc)):0] mul2Out;
			multiply #(.L1(WLx+WLc+1), .L2(WLc)) mul2(.in1(addR), .in2(c), .out(mul2Out));
			register #(.WL(WLx+WLc+WLc+1)) regOut(.data(mul2Out), .CLK(CLK), .register(outR));
			
endmodule
