/**
    Author: Phan Gia Anh
    Updated: 17/1/2020

    Debouncer works as a filter for the buttons on board, using the internal clock as trigger source
**/

module Debouncer( noise_signal, clock_source, filter_signal );

    input   noise_signal, clock_source;

    output reg  filter_signal;

    reg [18 : 0]    Debouncer_Count = 16'd0;
    reg first_read, second_read;
    
    wire    idle_state;

    assign  idle_state = (filter_signal == second_read);

    always @(clock_source) begin
        second_read <= first_read;
        first_read <= noise_signal;

        if (idle_state) Debouncer_Count <= 16'd0;
        else begin
            Debouncer_Count <= Debouncer_Count + 16'd1;
            if (&Debouncer_Count) filter_signal <= second_read;   
        end
    end

endmodule