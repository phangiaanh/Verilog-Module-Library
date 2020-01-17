module interface(input [6:0]SW, input CLOCK_50, input[1:0]KEY, output [6:0]LEDR, output [6:0]HEX0);

	wire	[3 : 0] num;
	wire	clock;
	
	Debouncer	U(.noise_signal(KEY[0]), .clock_source(CLOCK_50), .filter_signal(clock));
	
	//Adder	#(.SIZE(6))UDP(.vector_one(SW[5:0]), .vector_two(SW[11:6]), .vector_sum(LEDR));
	//D_FlipFlop	#(.ASYNCHRONOUS(0))UDP(.signal_in(SW[0]), .signal_out(LEDR[0]), .signal_out_neg(LEDR[1]), .clock_pos(KEY[0]), .reset_neg(SW[1]), .preset_neg(SW[2]));
	//Gray_Translator	#(.SIZE(7))UDP(.vector_in(SW), .vector_gray_out(LEDR));
	Counter_Exp_2 UDP(.bit_up(SW[0]), .vector_preset({4{1'b1}}), .vector_reset({4{1'b1}}), .clock_pos(~clock), .vector_out(num));
	Seven_Segment_Translator	UP(.four_bit_number(num), .common_anod(SW[1]), .seven_segment_number(HEX0[6:0]));
	
endmodule
