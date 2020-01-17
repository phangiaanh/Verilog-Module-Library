/**
    Author: Phan Gia Anh
    Updated: 17/1/2020

    Seven_Segment_Translator translates a 4-bit number into a 7-segment form to display on board
**/

module Seven_Segment_Translator( four_bit_number, common_anod, seven_segment_number );

    input   [3 : 0] four_bit_number;
    input   common_anod;

    output  [6 : 0] seven_segment_number;

    reg     [6 : 0] temp_seven_segment;
    wire    [6 : 0] temp_seven_segment_para;

    assign  temp_seven_segment_para = temp_seven_segment;

    Multiplexer_2   Choose_anod_or_catod[6 : 0](.true_signal(temp_seven_segment_para), .false_signal(~temp_seven_segment_para), .bit_select({7{common_anod}}), .signal_out(seven_segment_number));

    always @(*) begin
        case (four_bit_number)
            4'b0000 : temp_seven_segment <= 7'b1000000;
            4'b0001 : temp_seven_segment <= 7'b1111001;
            4'b0010 : temp_seven_segment <= 7'b0100100;
            4'b0011 : temp_seven_segment <= 7'b0110000;
            4'b0100 : temp_seven_segment <= 7'b0011001;
            4'b0101 : temp_seven_segment <= 7'b0010010;
            4'b0110 : temp_seven_segment <= 7'b0000010;
            4'b0111 : temp_seven_segment <= 7'b1111000;
            4'b1000 : temp_seven_segment <= 7'b0000000;
            4'b1001 : temp_seven_segment <= 7'b0010000;
            4'b1010 : temp_seven_segment <= 7'b0001000;
            4'b1011 : temp_seven_segment <= 7'b0000011;
            4'b1100 : temp_seven_segment <= 7'b1000110;
            4'b1101 : temp_seven_segment <= 7'b0100001;
            4'b1110 : temp_seven_segment <= 7'b0000110;
            4'b1111 : temp_seven_segment <= 7'b0001110;
            default : temp_seven_segment <= 7'b1000000;
        endcase
    end

endmodule