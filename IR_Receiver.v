/**
    Author: Phan Gia Anh
    Updated: 19/1/2020

    IR_Receiver is used to receive IR signals from a remote control
**/

module IR_Receiver( i_CLOCK_POS, i_RESET_NEG, i_IRDA, o_DATA_READY, o_DATA );

    parameter   IDLE = 2'b00;
    parameter   GUIDANCE = 2'b01;
    parameter   DATAREAD = 2'b10;

    parameter IDLE_HIGH_DUR      =  262143; // data_count    262143*0.02us = 5.24ms, threshold for DATAREAD-----> IDLE
    parameter GUIDE_LOW_DUR      =  230000; // idle_count    230000*0.02us = 4.60ms, threshold for IDLE--------->GUIDANCE
    parameter GUIDE_HIGH_DUR     =  210000; // state_count   210000*0.02us = 4.20ms, 4.5-4.2 = 0.3ms < BIT_AVAILABLE_DUR = 0.4ms,threshold for GUIDANCE------->DATAREAD
    parameter DATA_HIGH_DUR      =  41500; // data_count    41500 *0.02us = 0.83ms, sample time from the posedge of iIRDA
    parameter BIT_AVAILABLE_DUR  =  20000; // data_count    20000 *0.02us = 0.4ms,  the sample bit pointer,can inhibit the interference from iIRDA signal

    input   i_CLOCK_POS, i_RESET_NEG, i_IRDA;

    output  [31 : 0]    o_DATA;
    output  o_DATA_READY;

<<<<<<< HEAD
    reg [31 : 0]    o_DATA;            
=======
    reg [31 : 0]    oDATA;            
>>>>>>> 81cd70a789d0a25612c8b8ec050629994d6832c9
    reg [17 : 0]    idle_count;       
    reg idle_count_flag; 
    reg [17 : 0]    state_count;    
    reg state_count_flag;     
    reg [17 : 0]    data_count;           
    reg data_count_flag;      
    reg [5 : 0] bitcount;             
    reg [1 : 0] state;                
    reg [31 : 0]    data;                 
    reg [31 : 0]    data_buf;             
    reg data_ready;

    assign o_DATA_READY = data_ready;

    always @(posedge i_CLOCK_POS or negedge i_RESET_NEG) begin
        if (!i_RESET_NEG) idle_count <= 18'b0;
        else if (idle_count_flag) idle_count <= idle_count + 1'b1;
        else idle_count <= 18'b0;
    end            

    always @(posedge i_CLOCK_POS or negedge i_RESET_NEG) begin
        if (!i_RESET_NEG) idle_count_flag <= 1'b0;
        else if ((state == IDLE) && !i_IRDA) idle_count_flag <= 1'b1;
        else idle_count_flag <= 1'b0; 
    end

    always @(posedge i_CLOCK_POS or negedge i_RESET_NEG) begin
        if (!i_RESET_NEG) state_count <= 18'b0;
        else if (state_count_flag) state_count <= state_count + 1'b1;
        else state_count <= 18'b0;
    end

    always @(posedge i_CLOCK_POS or negedge i_RESET_NEG) begin
        if (!i_RESET_NEG) state_count_flag <= 1'b0;
        else if ((state == GUIDANCE) && i_IRDA) state_count_flag <= 1'b1;
        else state_count_flag <= 1'b0; 
    end

    always @(posedge i_CLOCK_POS or negedge i_RESET_NEG) begin
        if (!i_RESET_NEG) data_count <= 18'b0;
        else if (data_count_flag) data_count <= data_count + 1'b1;
        else data_count <= 18'b0;
    end

    always @(posedge i_CLOCK_POS or negedge i_RESET_NEG) begin
        if (!i_RESET_NEG) data_count_flag <= 1'b0;
        else if ((state == DATAREAD) && i_IRDA) data_count_flag <= 1'b1;
        else data_count_flag <= 1'b0; 
    end

    always @(posedge i_CLOCK_POS or negedge i_RESET_NEG) begin
        if (!i_RESET_NEG) bitcount <= 6'b0;
        else if (state == DATAREAD) begin
            if (data_count == 20000) bitcount <= bitcount + 1'b1;
        end
        else bitcount <= 6'b0;
    end

    always @(posedge i_CLOCK_POS or negedge i_RESET_NEG) begin
<<<<<<< HEAD
        if (!i_RESET_NEG) state <= IDLE;
=======
        if (!i_RESET_NEG) state <= IDLE
>>>>>>> 81cd70a789d0a25612c8b8ec050629994d6832c9
        else begin
            case (state)
                IDLE:
                    if (idle_count > GUIDE_LOW_DUR) state <= GUIDANCE;
                GUIDANCE:
                    if (state_count > GUIDE_HIGH_DUR) state <= DATAREAD;
                DATAREAD:
                    if ((data_count >= IDLE_HIGH_DUR) || (bitcount >= 33)) state <= IDLE; 
                default: 
<<<<<<< HEAD
                    state <= IDLE;
            endcase     
        end
    end

    always @(posedge i_CLOCK_POS or negedge i_RESET_NEG) begin
        if (!i_RESET_NEG) data <= 32'b0;
        else if (state == DATAREAD) begin
            if (data_count >= DATA_HIGH_DUR) data[bitcount - 1'b1] <= 1'b1;
        end    
        else data <= 32'b0;
    end

    always @(posedge i_CLOCK_POS or negedge i_RESET_NEG) begin
        if (!i_RESET_NEG) data_ready <= 1'b0;    
        else if (bitcount == 32) begin
            if (data[31 : 24] == ~data[23 : 16]) begin
                data_buf <= data;
                data_ready <= 1'b1;
            end
        end
        else data_ready <= 1'b0;
    end

    always @(posedge i_CLOCK_POS or negedge i_RESET_NEG) begin
        if (!i_RESET_NEG) o_DATA <= 32'b0;
        else if (data_ready) o_DATA <= data_buf;
        else o_DATA <= o_DATA;
    end

endmodule
=======
                    state <= IDLE
            endcase     
        end
    end
>>>>>>> 81cd70a789d0a25612c8b8ec050629994d6832c9
