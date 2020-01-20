/**
    Author: Phan Gia Anh
    Updated: 19/1/2020

    Adder takes two vectors as inputs and give out the sum of two vectors
    The size of two vectors are the same and can be changed through parameter SIZE 
**/

module Adder( i_VECTOR_ONE, i_VECTOR_TWO, o_VECTOR_SUM );

    parameter   SIZE = 4;

    input   [SIZE - 1 : 0] i_VECTOR_ONE, i_VECTOR_TWO;

    output  [SIZE : 0] o_VECTOR_SUM;

    wire    [SIZE - 1 : 0] temp_result;
    wire    [SIZE - 2 : 0] temp_carry;
    wire    bit_carry;


    Full_Adder  add_vector[SIZE - 1 : 0](.i_BIT_ONE(i_VECTOR_ONE), .i_BIT_TWO(i_VECTOR_TWO), .i_BIT_IN({temp_carry, 1'b0}), .i_BIT_SUM(temp_result), .i_BIT_CARRY({bit_carry, temp_carry}));

    assign  o_VECTOR_SUM = {bit_carry, temp_result};

endmodule