/**
    Author: Phan Gia Anh
    Updated: 15/1/2020

    Primitive for a D FlipFlop
**/

primitive D_FlipFlop( signal_out, signal_in, reset, clock );

    output  signal_out;

    input   signal_in, reset, clock;

    reg q;
    initial q = 1'b0;

    table
//      signal_in   clock   reset   :   old signal_out  :   signal_out
        ?           ?       0		:   ?               :   0;
        0           (10)       1    :   ?               :   0;
        1           (10)    1    :   ?               :   1;

    endtable

endprimitive