/* Testbench for axpb.v */
module axpb_tb();
	reg signed [6:0] x;
	wire [11:0] out;
	axpb DUT(.x(x), .out(out));
	
	initial begin
		x = -(7'd1);
		#50
		x = (7'd3);
		#50
		x = (7'd5);
		#50
		x = (7'd33);
		#50
		x = -(7'd31);
		#50
		$finish;
	end
		


endmodule
