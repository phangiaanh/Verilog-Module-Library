/**
    Author: Phan Gia Anh
    Updated: 17/1/2020

    JK_FlipFlop works as a JK flipflop with both asynchronous/synchronous preset and reset
    This can be set using the parameter ASYNCHRONOUS
**/

module JK_FlipFlop( signal_J, signal_K, clock_pos, preset_neg, reset_neg, signal_out, signal_out_neg );

    parameter   ASYNCHRONOUS= 1;

    input   signal_J, signal_K, clock_pos, preset_neg, reset_neg;

    output  signal_out, signal_out_neg;

    wire    asyn_out, asyn_out_neg, sync_out, sync_out_neg;

    JK_FlipFlop_Asyn Asyn(.signal_J(signal_J), .signal_K(signal_K), .clock_pos(clock_pos), .preset_neg(preset_neg), .reset_neg(reset_neg), .signal_out(asyn_out), .signal_out_neg(asyn_out_neg));
    JK_FlipFlop_Sync Sync(.signal_J(signal_J), .signal_K(signal_K), .clock_pos(clock_pos), .preset_neg(preset_neg), .reset_neg(reset_neg), .signal_out(sync_out), .signal_out_neg(sync_out_neg));

    Multiplexer_2   Choose_Asyn_Sync(.true_signal(asyn_out), .false_signal(sync_out), .bit_select(ASYNCHRONOUS), .signal_out(signal_out)),
                    Choose_Asyn_Sync_neg(.true_signal(asyn_out_neg), .false_signal(sync_out_neg), .bit_select(ASYNCHRONOUS), .signal_out(signal_out_neg));

endmodule