//electronic combination lock with a RESET button, using a mealy machine
//two number buttons (0 and 1), and an unlock output. The combination should be 01011.

//VINCENT CHAN COMPE470 REDID[815909699]

//ONE ALWAYS BLOCK/////////////////////////////////////
module oneBlockCombo(input in,
					 input CLK, RST,
					 output unlock);
	reg [2:0] state = ENTER;
	localparam ENTER = 0, ONE = 1, TWO = 2, THREE = 3, FOUR = 4;
		
	//Next state logic
	always@(posedge CLK or posedge RST) begin
		if (RST) state <= ENTER;
		else case (state)
			ENTER: state <= (in == 0)? ONE : ENTER;	
			ONE:   state <= (in == 1)? TWO : ONE;
			TWO:   state <= (in == 0)? THREE : ENTER;
			THREE: state <= (in == 1)? FOUR : ONE;
			FOUR : state <= (in == 0)? ONE : ENTER;
		endcase
	end
		
	//Mealy machine logic: Will dispense if in and state[2] = 1 (is in state FOUR)
	assign unlock = in & state[2];
endmodule
//ONE ALWAYS BLOCK/////////////////////////////////////

//TWO ALWAYS BLOCKS/////////////////////////////////////
module twoBlockCombo (input in,
						input CLK, RST,
						output reg unlock);
	reg [2:0] state = ENTER;
	localparam ENTER = 0, ONE = 1, TWO = 2, THREE = 3, FOUR = 4;
	
	//sequential state logic
	always@(posedge CLK or posedge RST) begin
		if (RST) state <= ENTER;
		else case (state)
			ENTER: state <= (in == 0)? ONE : ENTER;	
			ONE:   state <= (in == 1)? TWO : ONE;
			TWO:   state <= (in == 0)? THREE : ENTER;
			THREE: state <= (in == 1)? FOUR : ONE;
			FOUR : state <= (in == 0)? ONE : ENTER;
		endcase
	end
	
	//combonational logic
	always@(*) unlock = in & state[2];
endmodule
//TWO ALWAYS BLOCKS/////////////////////////////////////

//THREE ALWAYS BLOCKS/////////////////////////////////////
module threeBlockCombo (input in,
						input CLK, RST,
						output reg unlock);
	reg [2:0] state = ENTER, nextState = ENTER;
	localparam ENTER = 0, ONE = 1, TWO = 2, THREE = 3, FOUR = 4;
	
	//Next state logic
	always@(*) begin
		case (state)
			ENTER: nextState = (in == 0)? ONE : ENTER;	
			ONE:   nextState = (in == 1)? TWO : ONE;
			TWO:   nextState = (in == 0)? THREE : ENTER;
			THREE: nextState = (in == 1)? FOUR : ONE;
			FOUR : nextState = (in == 0)? ONE : ENTER;
		endcase
	end
	
	//sequential state logic
	always@(posedge CLK or posedge RST) begin
		if (RST) state <= ENTER;
		else state <= nextState;
	end
	
	//output logic
	always@(*) unlock = in & state[2];
endmodule
//THREE ALWAYS BLOCKS/////////////////////////////////////
