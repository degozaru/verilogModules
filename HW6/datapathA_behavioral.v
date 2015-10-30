module datapathA_behavioral
			#(parameter WLx = 8, parameter WLc = 8)
			( input signed [WLx-1:0] x,
			  input signed [WLc-1:0] a, b, c,
			  input CLK,
			  output reg signed [((WLx+WLc)+(WLc)):0] outR
			);
			
			reg signed [(WLx+WLc-1):0] mulR;
			reg signed [(WLx+WLc):0] addR;
			//reg [((WLx+WLc)+(WLc)-1):0] outR;
			always @(posedge CLK) begin
			mulR <= a * x;
			addR <= mulR + b;
			outR <= addR * c;
			end

endmodule
