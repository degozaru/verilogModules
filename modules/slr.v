/* Module: slr (logical shift right)
 * Description: shifts logically right by in2 bits
 * Parameters: L1 - length of input 1
 *             L2 - length of input 2
 */

module slr        #(parameter L1 = 8,
                    parameter L2 = 8)
                    
                    (input [L1-1:0] in1,
                    input [L2-1:0] in2,
                    output wire [L1-1:0] out);
                    
  assign out = in1 >> in2;
endmodule
