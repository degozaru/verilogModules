//Testing quadratic.v

module quadratic_tb();
	reg signed [6:0] x;
	wire [19:0] out;
	quadratic DUT(.x(x), .out(out));
	
	initial begin
		x = -(7'd1);
		#50
		x = (7'd5);
		#50
		x = (7'd3);
		#50
		x = (7'd31);
		#50
		x = -(7'd21);
		#50
		$finish;
	end
endmodule
