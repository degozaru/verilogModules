/* Module: and (and gate)
 * Description: ands 2 numbers together
 * Parameters: L1 - length of inputs
 */

module andGate     #(parameter L1 = 8)
                    
                    (input  [L1-1:0] in1,
                    input  [L1-1:0] in2,
                    output wire [L1-1:0] out);
                    
  assign out = in1 & in2;
endmodule
