module flipFlop (
  input clk, rst,
  output reg [7:0] out )

  always @ (posedge clk)
    if(rst) out <= 8'b01011111;       //if RST is high, reset to 8'b01011111

                                      //else...
    else out <= {out[6:4],            //out[7:5] = normal shift left
                  (out[3] ^ out[7]),  //out[4]   = out[3] xor out[7]
                  (out[2] ^ out[7]),  //out[3]   = out[2] xor out[7]
                  (out[1] ^ out[7]),  //out[2]   = out[1] xor out[7]
                  out[0],             //out[1]   = out[0]
                  out[7]};            //out[0]   = out[7]
                
