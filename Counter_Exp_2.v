/**
    Author: Phan Gia Anh
    Updated: 19/1/2020

    Counter_Exp_2 carry the job of a counter which count only to the exponent of 2 such as: 2, 4, 8, 16,...
    The exponent can be changed through parameter EXPONENT
**/

module Counter_Exp_2( i_BIT_UP, i_VECTOR_PRESET, i_VECTOR_RESET, i_CLOCK_POS, o_VECTOR_OUT );

    parameter   EXPONENT = 4;

    input   [EXPONENT - 1 : 0]  i_VECTOR_PRESET, i_VECTOR_RESET;
    input   i_CLOCK_POS, i_BIT_UP;

    output  [EXPONENT - 1 : 0]  o_VECTOR_OUT;

    wire    [EXPONENT - 1 : 0]  temp_out, temp_out_neg;
    wire    [EXPONENT - 2 : 0]  temp_clock_pos, temp_up, temp_down;

    assign  temp_up = ~({(EXPONENT - 1){i_BIT_UP}} & temp_out_neg[EXPONENT - 2 : 0]),
            temp_down = ~(~{(EXPONENT - 1){i_BIT_UP}} & temp_out[EXPONENT - 2 : 0]),
            temp_clock_pos = ~(temp_up & temp_down);

    assign  o_VECTOR_OUT = temp_out_neg;

    JK_FlipFlop Counter_Exp[EXPONENT - 1 : 0](.i_SIGNAL_J({EXPONENT{1'b1}}), .i_SIGNAL_K({EXPONENT{1'b1}}), .i_CLOCK_POS({temp_clock_pos, i_CLOCK_POS}), .i_PRESET_NEG(i_VECTOR_PRESET), .i_RESET_NEG(i_VECTOR_RESET), .o_SIGNAL_OUT(temp_out), .o_SIGNAL_OUT_NEG(temp_out_neg));

endmodule