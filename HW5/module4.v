module module4(
    input [3:0] a,
    input [3:0] b,
    input c0,
    output [3:0] s,
    output cout
    );
	 
	PG pg0(.a(a[0]), .b(b[0]), .p(p0), .g(g0));
	PG pg1(.a(a[1]), .b(b[1]), .p(p1), .g(g1));
	PG pg2(.a(a[2]), .b(b[2]), .p(p2), .g(g2));
	PG pg3(.a(a[3]), .b(b[3]), .p(p3), .g(g3));
	
	SC sc0(.P(p0), .C(c0), .G(g0), .Cout(c1), .Sout(s[0]));
	SC sc1(.P(p1), .C(c1), .G(g1), .Cout(c2), .Sout(s[1]));
	SC sc2(.P(p2), .C(c2), .G(g2), .Cout(c3), .Sout(s[2]));
	SC sc3(.P(p3), .C(c3), .G(g3), .Cout(cout), .Sout(s[3]));

endmodule
