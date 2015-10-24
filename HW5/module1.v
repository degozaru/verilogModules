module module1_DataFlow(
    input [3:0] x,
	 output [1:0] y
    );

	assign y[0] = &{x[1:0], ~x[2]};
	assign y[1] = &{(x[3]), (x[2])};
endmodule

module module1_Behavioral(
    input [3:0] x,
	 output reg [1:0] y
    );

	always @(*) begin
		y[0] = &{x[1:0], ~x[2]};
		y[1] = &{x[3], x[2]};
	end
endmodule

module module1_Gate(
    input [3:0] x,
	 output [1:0] y
    );
	and U0(y[0], x[1], x[0], ~x[2]);
	and U1(y[1], x[3], x[2]);
endmodule

