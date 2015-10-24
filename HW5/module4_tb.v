module module4_tb();
	reg [3:0] a, b;
	reg c0;
	wire [3:0] s;
	wire cout;
	
	module4 DUT(.a(a), .b(b), .c0(c0), .s(s), .cout(cout));
	
	initial begin
		a = 4'b1111;
		b = 4'b1111;
		c0 = 1'b1;
		#50
		a = 4'b1000;
		b = 4'b0001;
		c0 = 1'b1;
		#50
		a = 4'b1011;
		b = 4'b0101;
		c0 = 1'b0;
		#50
		a = 4'b0001;
		b = 4'b1111;
		c0 = 1'b1;
		#50
		$finish;
		end
	
endmodule
