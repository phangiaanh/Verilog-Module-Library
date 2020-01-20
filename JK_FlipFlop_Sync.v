/**
    Author: Phan Gia Anh
    Updated: 17/1/2020

    JK_FlipFlop_Sync works as a JK flipflop with synchronous preset and reset
**/

module JK_FlipFlop_Sync( i_SIGNAL_J, i_SIGNAL_K, i_CLOCK_POS, i_PRESET_NEG, i_RESET_NEG, o_SIGNAL_OUT, o_SIGNAL_OUT_NEG );

    input   i_SIGNAL_J, i_SIGNAL_K, i_CLOCK_POS, i_PRESET_NEG, i_RESET_NEG;

    output  o_SIGNAL_OUT, o_SIGNAL_OUT_NEG;

    reg o_SIGNAL_OUT;

    assign  o_SIGNAL_OUT_NEG = ~o_SIGNAL_OUT;

    always @(posedge i_CLOCK_POS) begin
        if (~i_RESET_NEG) o_SIGNAL_OUT <= 1'b0;
        else if (~i_PRESET_NEG) o_SIGNAL_OUT <= 1'b1;
        else begin
            case ({i_SIGNAL_J, i_SIGNAL_K}) 
				2'b00: o_SIGNAL_OUT <= o_SIGNAL_OUT; 
				2'b01: o_SIGNAL_OUT <= 1'b0; 
				2'b10: o_SIGNAL_OUT <= 1'b1; 
				2'b11: o_SIGNAL_OUT <= ~o_SIGNAL_OUT; 
			endcase
        end
    end

endmodule