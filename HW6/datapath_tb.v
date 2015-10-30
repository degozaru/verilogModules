module datapath_tb(
    );

parameter halfStep = 50; //one clock peroid = 100ns

//Clocking
reg CLK = 0;
always begin
	#(halfStep);
	CLK = ~CLK;
end

//Module
reg [5:0] x;
wire signed [14:0] outR_behavorial, outR_structural;
wire signed [15:0] outR_datapathB;
datapathA_behavioral #(.WLx(6), .WLc(4)) DUT_behavioral(.x(x), .a(-(4'd3)), .b(4'd3), .c(-(4'd7)), .CLK(CLK), .outR(outR_behavorial));
datapathA_structural #(.WLx(6), .WLc(4)) DUT_structural(.x(x), .a(-(4'd3)), .b(4'd3), .c(-(4'd7)), .CLK(CLK), .outR(outR_structural));
datapathB_behavioral #(.WLx(6), .WLc(4)) DUT_datapathB(.x(x), .a(-(4'd3)), .b(4'd3), .c(-(4'd7)), .CLK(CLK), .outR(outR_datapathB));

initial begin
x = -1;
#(halfStep*2);
x = 5;
#(halfStep*2);
x = 3;
#(halfStep*2);
x = 31;
#(halfStep*2);
x = -21;
#(halfStep*2); //Wait 3 more full periods for the module to catch up
#(halfStep*2);
#(halfStep*2);
$finish;
end

endmodule
