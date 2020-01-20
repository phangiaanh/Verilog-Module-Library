/**
    Author: Phan Gia Anh
    Updated: 17/1/2020

    Multiplexer_2 will choose the output signal based on two input signals and the select bit 
**/

module Multiplexer_2( i_TRUE_SIGNAL, i_FALSE_SIGNAL, i_BIT_SELECT, o_SIGNAL_OUT );

    input   i_TRUE_SIGNAL, i_FALSE_SIGNAL, i_BIT_SELECT;

    output  o_SIGNAL_OUT;

    wire    bit_select_neg, temp_first_out, temp_second_out;

    not slect_neg_gen(bit_select_neg, i_BIT_SELECT);

    and temp_first_out_gen(temp_first_out, i_TRUE_SIGNAL, i_BIT_SELECT),
        temp_second_out_gen(temp_second_out, i_FALSE_SIGNAL, bit_select_neg);

    or  choose_signal(o_SIGNAL_OUT, temp_first_out, temp_second_out);

endmodule