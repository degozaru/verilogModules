/* Module: or (or gate)
 * Description: ors 2 numbers together
 * Parameters: L1 - length of inputs
 */

module orGate     #(parameter L1 = 8)
                    
                    (input  [L1-1:0] in1,
                    input  [L1-1:0] in2,
                    output wire [L1-1:0] out);
                    
  assign out = in1 | in2;
endmodule
