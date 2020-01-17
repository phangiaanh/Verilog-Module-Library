/**
    Author: Phan Gia Anh
    Updated: 15/1/2020

    Adder takes two vectors as inputs and give out the sum of two vectors
    The size of two vectors are the same and can be changed through parameter SIZE 
**/

module Adder( vector_one, vector_two, vector_sum );

    parameter   SIZE = 4;

    input   [SIZE - 1 : 0] vector_one, vector_two;

    output  [SIZE : 0] vector_sum;

    wire    [SIZE - 1 : 0] temp_result;
    wire    [SIZE - 2 : 0] temp_carry;
    wire    bit_carry;


    Full_Adder  add_vector[SIZE - 1 : 0](.bit_one(vector_one), .bit_two(vector_two), .bit_in({temp_carry, 1'b0}), .bit_sum(temp_result), .bit_carry({bit_carry, temp_carry}));

    assign  vector_sum = {bit_carry, temp_result};

endmodule