/**
    Author: Phan Gia Anh
    Updated: 19/1/2020

    D_FlipFlop works as a D flipflop with both asynchronous/synchronous preset and reset
    This can be set using the parameter ASYNCHRONOUS
**/

module D_FlipFlop( i_SIGNAL_IN, i_CLOCK_POS, i_PRESET_NEG, i_RESET_NEG, o_SIGNAL_OUT, o_SIGNAL_OUT_NEG );

    parameter   ASYNCHRONOUS= 1;

    input   i_SIGNAL_IN, i_CLOCK_POS, i_PRESET_NEG, i_RESET_NEG;

    output  o_SIGNAL_OUT, o_SIGNAL_OUT_NEG;

    wire    asyn_out, asyn_out_neg, sync_out, sync_out_neg;

    D_FlipFlop_Asyn Asyn(.i_SIGNAL_IN(i_SIGNAL_IN), .i_CLOCK_POS(i_CLOCK_POS), .i_PRESET_NEG(i_PRESET_NEG), .i_RESET_NEG(i_RESET_NEG), .o_SIGNAL_OUT(asyn_out), .o_SIGNAL_OUT_NEG(asyn_out_neg));
    D_FlipFlop_Sync Sync(.i_SIGNAL_IN(i_SIGNAL_IN), .i_CLOCK_POS(i_CLOCK_POS), .i_PRESET_NEG(i_PRESET_NEG), .i_RESET_NEG(i_RESET_NEG), .o_SIGNAL_OUT(sync_out), .o_SIGNAL_OUT_NEG(sync_out_neg));

    Multiplexer_2   Choose_Asyn_Sync(.i_TRUE_SIGNAL(asyn_out), .i_FALSE_SIGNAL(sync_out), .i_BIT_SELECT(ASYNCHRONOUS), .o_SIGNAL_OUT(o_SIGNAL_OUT)),
                    Choose_Asyn_Sync_neg(.i_TRUE_SIGNAL(asyn_out_neg), .i_FALSE_SIGNAL(sync_out_neg), .i_BIT_SELECT(ASYNCHRONOUS), .o_SIGNAL_OUT(o_SIGNAL_OUT_NEG));

endmodule