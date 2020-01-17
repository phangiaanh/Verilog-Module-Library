/**
    Author: Phan Gia Anh
    Updated: 17/1/2020

    Multiplexer_2 will choose the output signal based on two input signals and the select bit 
**/

module Multiplexer_2( true_signal, false_signal, bit_select, signal_out );

    input   true_signal, false_signal, bit_select;

    output  signal_out;

    wire    bit_select_neg, temp_first_out, temp_second_out;

    not slect_neg_gen(bit_select_neg, bit_select);

    and temp_first_out_gen(temp_first_out, true_signal, bit_select),
        temp_second_out_gen(temp_second_out, false_signal, bit_select_neg);

    or  choose_signal(signal_out, temp_first_out, temp_second_out);

endmodule