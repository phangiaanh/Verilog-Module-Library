/**
    Author: Phan Gia Anh
    Updated: 19/1/2020

    Debouncer works as a filter for the buttons on board, using the internal clock as trigger source
**/

module Debouncer( i_NOISE_SIGNAL, i_CLOCK_SOURCE, o_FILTER_SIGNAL );

    input   i_NOISE_SIGNAL, i_CLOCK_SOURCE;

    output reg  o_FILTER_SIGNAL;

    reg [18 : 0]    Debouncer_Count = 16'd0;
    reg first_read, second_read;
    
    wire    idle_state;

    assign  idle_state = (o_FILTER_SIGNAL == second_read);

    always @(i_CLOCK_SOURCE) begin
        second_read <= first_read;
        first_read <= i_NOISE_SIGNAL;

        if (idle_state) Debouncer_Count <= 16'd0;
        else begin
            Debouncer_Count <= Debouncer_Count + 16'd1;
            if (&Debouncer_Count) o_FILTER_SIGNAL <= second_read;   
        end
    end

endmodule