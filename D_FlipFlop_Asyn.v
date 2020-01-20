/**
    Author: Phan Gia Anh
    Updated: 19/1/2020

    D_FlipFlop_Asyn works as a D flipflop with asynchronous preset and reset
**/

module D_FlipFlop_Asyn( i_SIGNAL_IN, i_CLOCK_POS, i_PRESET_NEG, i_RESET_NEG, o_SIGNAL_OUT, o_SIGNAL_OUT_NEG );

    input   i_SIGNAL_IN, i_CLOCK_POS, i_PRESET_NEG, i_RESET_NEG;

    output  o_SIGNAL_OUT, o_SIGNAL_OUT_NEG;

    reg o_SIGNAL_OUT;

    assign  o_SIGNAL_OUT_NEG = ~o_SIGNAL_OUT;

    always @(posedge i_CLOCK_POS, negedge i_RESET_NEG, negedge i_PRESET_NEG) begin
        if (~i_RESET_NEG) o_SIGNAL_OUT <= 1'b0;
        else if (~i_PRESET_NEG) o_SIGNAL_OUT <= 1'b1;
        else o_SIGNAL_OUT <= i_SIGNAL_IN;
    end

endmodule