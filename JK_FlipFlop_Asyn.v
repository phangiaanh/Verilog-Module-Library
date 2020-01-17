/**
    Author: Phan Gia Anh
    Updated: 17/1/2020

    JK_FlipFlop_Asyn works as a JK flipflop with asynchronous preset and reset
**/

module JK_FlipFlop_Asyn( signal_J, signal_K, clock_pos, preset_neg, reset_neg, signal_out, signal_out_neg );

    input   signal_J, signal_K, clock_pos, preset_neg, reset_neg;

    output  signal_out, signal_out_neg;

    reg signal_out;

    assign  signal_out_neg = ~signal_out;

    always @(posedge clock_pos, negedge reset_neg, negedge preset_neg) begin
        if (~reset_neg) signal_out <= 1'b0;
        else if (~preset_neg) signal_out <= 1'b1;
        else begin
            case ({signal_J, signal_K}) 
				2'b00: signal_out <= signal_out; 
				2'b01: signal_out <= 1'b0; 
				2'b10: signal_out <= 1'b1; 
				2'b11: signal_out <= ~signal_out; 
			endcase
        end
    end

endmodule