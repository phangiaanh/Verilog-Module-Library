/**
    Author: Phan Gia Anh
    Updated: 17/1/2020

    Counter_Exp_2 carry the job of a counter which count only to the exponent of 2 such as: 2, 4, 8, 16,...
    The exponent can be changed through parameter EXPONENT
**/

module Counter_Exp_2( bit_up, vector_preset, vector_reset, clock_pos, vector_out );

    parameter   EXPONENT = 4;

    input   [EXPONENT - 1 : 0]  vector_preset, vector_reset;
    input   clock_pos, bit_up;

    output  [EXPONENT - 1 : 0]  vector_out;

    wire    [EXPONENT - 1 : 0]  temp_out, temp_out_neg;
    wire    [EXPONENT - 2 : 0]  temp_clock_pos, temp_up, temp_down;

    assign  temp_up = ~({(EXPONENT - 1){bit_up}} & temp_out_neg[EXPONENT - 2 : 0]),
            temp_down = ~(~{(EXPONENT - 1){bit_up}} & temp_out[EXPONENT - 2 : 0]),
            temp_clock_pos = ~(temp_up & temp_down);

    assign  vector_out = temp_out_neg;

    JK_FlipFlop Counter_Exp[EXPONENT - 1 : 0](.signal_J({EXPONENT{1'b1}}), .signal_K({EXPONENT{1'b1}}), .clock_pos({temp_clock_pos, clock_pos}), .preset_neg(vector_preset), .reset_neg(vector_reset), .signal_out(temp_out), .signal_out_neg(temp_out_neg));

endmodule