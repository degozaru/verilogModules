module hw8Simple        #(parameter WL = 8)
                    (input signed [WL-1:0] in1,
                    input signed [WL-1:0] in2,
                    input signed [WL-1:0] in3,
                    input signed [WL-1:0] c1,
                    input signed [WL-1:0] c2,
                    input signed [WL-1:0] c3,
                    utput reg [(WL*2)+1:0] q);
		reg signed [(WL*2)-1:0] o1, o2, o3;
		
		always @(*) begin 
		o1 = in1 * c1;
		o2 = in2 * c2;
		o3 = in3 * c3;
		q = o1 + o2 + o3;
    end
endmodule
