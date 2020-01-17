/**
    Author: Phan Gia Anh
    Updated: 17/1/2020

    D_FlipFlop_Asyn works as a D flipflop with asynchronous preset and reset
**/

module D_FlipFlop_Asyn( signal_in, clock_pos, preset_neg, reset_neg, signal_out, signal_out_neg );

    input   signal_in, clock_pos, preset_neg, reset_neg;

    output  signal_out, signal_out_neg;

    reg signal_out;

    assign  signal_out_neg = ~signal_out;

    always @(posedge clock_pos, negedge reset_neg, negedge preset_neg) begin
        if (~reset_neg) signal_out <= 1'b0;
        else if (~preset_neg) signal_out <= 1'b1;
        else signal_out <= signal_in;
    end

endmodule