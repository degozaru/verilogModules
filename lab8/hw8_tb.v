module hw8_tb(
    );
	 
parameter halfStep = 50; //one clock peroid = 100ns

//Clocking
reg CLK = 0;
always begin
	#(halfStep);
	CLK = ~CLK;
end

reg [7:0] in1, in2, in3, c1, c2, c3;
wire [17:0] out;
hw8 DUT(.in1(in1), .in2(in2), .in3(in3),
			.c1(c1), .c2(c2), .c3(c3), .q(out), .CLK(CLK));
			
initial begin
	@ (posedge CLK) begin
		in1 = -1; in2 = 2; in3 = 1;
		c1 = -3;	 c2 = -2; c3 = -2;
	end
	@ (posedge CLK) begin
		in1 = 2; in2 = 3; in3 = 3;
		c1 = 2;	 c2 = 3; c3 = 2;
	end
	@ (posedge CLK) begin
		in1 = 3; in2 = -3; in3 = 3;
		c1 = 1;	 c2 = 3; c3 = 1;
	end
	@ (posedge CLK) begin
		in1 = 1; in2 = -4; in3 = -3;
		c1 = 1;	 c2 = 1; c3 = 3;
	end
	#350;
	$finish;
end
endmodule
