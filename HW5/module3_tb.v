module module3_tb();
	reg [5:0] x;
	wire outDF, outB, outG;
	
	module3_DataFlow DUT_DF(.a(x[5]),.b(x[4]),.c(x[3]),.d(x[2]),.e(x[1]),.f(x[0]),.out(outDF));
	module3_Behavioral DUT_B(.a(x[5]), .b(x[4]),.c(x[3]),.d(x[2]),.e(x[1]),.f(x[0]),.out(outB));
	module3_Gate DUT_G(.a(x[5]),.b(x[4]),.c(x[3]),.d(x[2]),.e(x[1]),.f(x[0]),.out(outG));
	
	initial begin
		x = 5'b000000;
		#50
		x = 5'b111111;
		#50
		x = 5'b010101;
		#50
		x = 5'b101010;
		#50
		$finish;
		end
	
endmodule
