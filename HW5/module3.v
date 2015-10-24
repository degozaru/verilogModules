module module3_DataFlow(
    input a,
    input b,
    input c,
    input d,
    input e,
    input f,
	 output out
    );
	 module1_DataFlow U0(.x({a,b,c,d}), .y({o1, o0}));
	 module2_DataFlow U1(.x({o1, o0, e, f}), .y(out));
endmodule

module module3_Behavioral(
    input a,
    input b,
    input c,
    input d,
    input e,
    input f,
	 output out
    );
	 module1_Behavioral U0(.x({a,b,c,d}), .y({o1, o0}));
	 module2_Behavioral U1(.x({o1, o0, e, f}), .y(out));

endmodule

module module3_Gate(
    input a,
    input b,
    input c,
    input d,
    input e,
    input f,
	 output out
    );
	 module1_Gate U0(.x({a,b,c,d}), .y({o1, o0}));
	 module2_Gate U1(.x({o1, o0, e, f}), .y(out));
endmodule

