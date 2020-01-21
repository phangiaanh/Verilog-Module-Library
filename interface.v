<<<<<<< HEAD
module interface(input [11:0]SW, input CLOCK_50,input IRDA_RXD, input[1:0]KEY, output [6:0]LEDR, output [6:0]HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7);
=======
module interface(input [11:0]SW, input CLOCK_50, input[1:0]KEY, output [6:0]LEDR, output [6:0]HEX0);
>>>>>>> 81cd70a789d0a25612c8b8ec050629994d6832c9

	wire [31 : 0]	hex_data;
	wire	data_ready;
	
	//Debouncer	U(.i_NOISE_SIGNAL(KEY[0]), .i_CLOCK_SOURCE(CLOCK_50), .o_FILTER_SIGNAL(clock));
<<<<<<< HEAD
	IR_Receiver	UX(.i_CLOCK_POS(CLOCK_50), .i_RESET_NEG(KEY[0]), .i_IRDA(IRDA_RXD), .o_DATA_READY(data_ready), .o_DATA(hex_data));
	Seven_Segment_Translator X[7:0](.i_FOUR_BIT_NUMBER(hex_data), .i_COMMON_ANOD({8{1'b1}}), .o_SEVEN_SEGMENT_NUMBER({HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7}));
	//Adder	#(.SIZE(6))UDP(.i_VECTOR_ONE(SW[5:0]), .i_VECTOR_TWO(SW[11:6]), .o_VECTOR_SUM(LEDR));
=======
	
	Adder	#(.SIZE(6))UDP(.i_VECTOR_ONE(SW[5:0]), .i_VECTOR_TWO(SW[11:6]), .o_VECTOR_SUM(LEDR));
>>>>>>> 81cd70a789d0a25612c8b8ec050629994d6832c9
	//D_FlipFlop	#(.ASYNCHRONOUS(0))UDP(.i_SIGNAL_IN(SW[0]), .o_SIGNAL_OUT(LEDR[0]), .o_SIGNAL_OUT_NEG(LEDR[1]), .i_CLOCK_POS(KEY[0]), .i_RESET_NEG(SW[1]), .i_PRESET_NEG(SW[2]));
	//Gray_Translator	#(.SIZE(7))UDP(.i_VECTOR_IN(SW[6:0]), .o_VECTOR_GRAY_OUT(LEDR));
	//Counter_Exp_2 UDP(.i_BIT_UP(SW[0]), .i_VECTOR_PRESET({4{1'b1}}), .i_VECTOR_RESET({4{1'b1}}), .i_CLOCK_POS(~clock), .o_VECTOR_OUT(num));
	//Seven_Segment_Translator	UP(.i_FOUR_BIT_NUMBER(num), .i_COMMON_ANOD(SW[1]), .o_SEVEN_SEGMENT_NUMBER(HEX0[6:0]));
	
endmodule
