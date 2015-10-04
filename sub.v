/* Module: sub
 * Description: subtracts 2 numbers
 * Parameters: L1 - length of input 1
 *             L2 - length of input 2
 */

module sub        #(parameter L1 = 8,
                    parameter L2 = 8)
                    
                    (input signed [L1-1:0] in1,
                    input signed [L2-1:0] in2,
                    output wire [((L1>L2)?L1 : L2):0] out);
                    
  assign out = in1 - in2;
endmodule
