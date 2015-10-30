module datapathB_behavioral
			#(parameter WLx = 8, parameter WLc = 8)
			( input signed [WLx-1:0] x,
			  input signed [WLc-1:0] a, b, c,
			  input CLK,
			  output reg signed [(WLx+WLc+WLc)+1:0] outR
			);
			
			reg signed [(WLx+WLc-1):0] mulR1;
			reg signed [(WLx+WLc):0] addR;
			reg signed [((WLx+WLc+WLc)):0] mulR2;
			
			always @(posedge CLK) begin
			mulR1 <= a * x;
			addR <= mulR1 + b;
			mulR2 <= addR * x;
			outR <= mulR2 + c;
			end

endmodule